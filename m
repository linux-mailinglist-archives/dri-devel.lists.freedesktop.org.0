Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088212C355
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1E16E0C3;
	Tue, 28 May 2019 09:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1795 seconds by postgrey-1.36 at gabe;
 Tue, 28 May 2019 09:34:43 UTC
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30F96E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:34:43 +0000 (UTC)
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id ADD04100008;
 Tue, 28 May 2019 09:34:41 +0000 (UTC)
Date: Tue, 28 May 2019 11:35:50 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 06/10] drm: rcar-du: lvds: Add support for dual-link
 mode
Message-ID: <20190528093550.iwei6kpcx5hyb2nb@uno.localdomain>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-7-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190511210702.18394-7-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2011408404=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2011408404==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qt5p5xkya64di4qs"
Content-Disposition: inline


--qt5p5xkya64di4qs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,
 a small note.

On Sun, May 12, 2019 at 12:06:58AM +0300, Laurent Pinchart wrote:
> In dual-link mode the LVDS0 encoder transmits even-numbered pixels, and
> sends odd-numbered pixels to the LVDS1 encoder for transmission on a
> separate link.
>
> To implement support for this mode of operation, determine if the LVDS
> connection operates in dual-link mode by querying the next device in the
> pipeline, locate the companion encoder, and control it directly through
> its bridge operations.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 104 ++++++++++++++++++++++++----
>  drivers/gpu/drm/rcar-du/rcar_lvds.h |   5 ++
>  2 files changed, 96 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index a331f0c32187..f7e4710fe33f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -66,6 +66,9 @@ struct rcar_lvds {
>
>  	struct drm_display_mode display_mode;
>  	enum rcar_lvds_mode mode;
> +
> +	struct drm_bridge *companion;
> +	bool dual_link;
>  };
>
>  #define bridge_to_rcar_lvds(bridge) \
> @@ -400,11 +403,6 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>  	const struct drm_display_mode *mode = &lvds->display_mode;
> -	/*
> -	 * FIXME: We should really retrieve the CRTC through the state, but how
> -	 * do we get a state pointer?
> -	 */
> -	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
>  	u32 lvdhcr;
>  	u32 lvdcr0;
>  	int ret;
> @@ -413,6 +411,10 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	if (ret < 0)
>  		return;
>
> +	/* Enable the companion LVDS encoder in dual-link mode. */
> +	if (lvds->dual_link && lvds->companion)
> +		lvds->companion->funcs->enable(lvds->companion);
> +
>  	/*
>  	 * Hardcode the channels and control signals routing for now.
>  	 *
> @@ -435,17 +437,33 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
>
>  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
> -		/* Disable dual-link mode. */
> -		rcar_lvds_write(lvds, LVDSTRIPE, 0);
> +		/*
> +		 * Configure vertical stripe based on the mode of operation of
> +		 * the connected device.
> +		 */
> +		rcar_lvds_write(lvds, LVDSTRIPE,
> +				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
>  	}
>
> -	/* PLL clock configuration. */
> -	lvds->info->pll_setup(lvds, mode->clock * 1000);
> +	/*
> +	 * PLL clock configuration on all instances but the companion in
> +	 * dual-link mode.
> +	 */
> +	if (!lvds->dual_link || lvds->companion)
> +		lvds->info->pll_setup(lvds, mode->clock * 1000);
>
>  	/* Set the LVDS mode and select the input. */
>  	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
> -	if (drm_crtc_index(crtc) == 2)
> -		lvdcr0 |= LVDCR0_DUSEL;
> +
> +	if (lvds->bridge.encoder) {
> +		/*
> +		 * FIXME: We should really retrieve the CRTC through the state,
> +		 * but how do we get a state pointer?
> +		 */
> +		if (drm_crtc_index(lvds->bridge.encoder->crtc) == 2)
> +			lvdcr0 |= LVDCR0_DUSEL;
> +	}
> +
>  	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>
>  	/* Turn all the channels on. */
> @@ -512,6 +530,10 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDCR1, 0);
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>
> +	/* Disable the companion LVDS encoder in dual-link mode. */
> +	if (lvds->dual_link && lvds->companion)
> +		lvds->companion->funcs->disable(lvds->companion);
> +
>  	clk_disable_unprepare(lvds->clocks.mod);
>  }
>
> @@ -628,10 +650,54 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>  	.mode_set = rcar_lvds_mode_set,
>  };
>
> +bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> +{
> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +
> +	return lvds->dual_link;
> +}
> +EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
> +
>  /* -----------------------------------------------------------------------------
>   * Probe & Remove
>   */
>
> +static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *companion;
> +	struct device *dev = lvds->dev;
> +	int ret = 0;
> +
> +	/* Locate the companion LVDS encoder for dual-link operation, if any. */
> +	companion = of_parse_phandle(dev->of_node, "renesas,companion", 0);
> +	if (!companion)
> +		return -ENODEV;
> +
> +	/*
> +	 * Sanity check: the companion encoder must have the same compatible
> +	 * string.
> +	 */
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!of_device_is_compatible(companion, match->compatible)) {
> +		ret = -ENODEV;
> +		goto done;
> +	}
> +
> +	lvds->companion = of_drm_find_bridge(companion);
> +	if (!lvds->companion) {
> +		ret = -EPROBE_DEFER;
> +		goto done;
> +	}
> +
> +	dev_dbg(dev, "Found companion encoder %pOF\n", companion);
> +
> +done:
> +	of_node_put(companion);
> +
> +	return ret;
> +}
> +
>  static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  {
>  	struct device_node *local_output = NULL;
> @@ -682,14 +748,26 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>
>  	if (is_bridge) {
>  		lvds->next_bridge = of_drm_find_bridge(remote);
> -		if (!lvds->next_bridge)
> +		if (!lvds->next_bridge) {
>  			ret = -EPROBE_DEFER;
> +			goto done;
> +		}
> +
> +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> +			lvds->dual_link = lvds->next_bridge->timings
> +					? lvds->next_bridge->timings->dual_link
> +					: false;
>  	} else {
>  		lvds->panel = of_drm_find_panel(remote);
> -		if (IS_ERR(lvds->panel))
> +		if (IS_ERR(lvds->panel)) {
>  			ret = PTR_ERR(lvds->panel);
> +			goto done;
> +		}
>  	}
>
> +	if (lvds->dual_link)
> +		ret = rcar_lvds_parse_dt_companion(lvds);

Looking at the error path here below, for E3/D3, -ENODEV gets
sanitized to return 0 as we want this method to return success even if
no endpoint is there, when using the LVDS encoder provided clock to
back-feed the DU.

This is not the case for the companion property imho. If the property is
specified, it should be sane and -ENODEV is worth being propagated to
the caller.

You could move the error handling bits in the error path:

	/*
	 * On D3/E3 the LVDS encoder provides a clock to the DU, which can be
	 * used for the DPAD output even when the LVDS output is not connected.
	 * Don't fail probe in that case as the DU will need the bridge to
	 * control the clock.
	 */
	if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
		return ret == -ENODEV ? 0 : ret;

before the of_node_put() sequences, and add one more label, to skip
the above part in case parse_dt_companion() fails.

Apart from this you can retain my tag if you like.
Thanks
   j

> +
>  done:
>  	of_node_put(local_output);
>  	of_node_put(remote_input);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> index a709cae1bc32..222ec0e60785 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> @@ -15,6 +15,7 @@ struct drm_bridge;
>  #if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
>  int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
>  void rcar_lvds_clk_disable(struct drm_bridge *bridge);
> +bool rcar_lvds_dual_link(struct drm_bridge *bridge);
>  #else
>  static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
>  				       unsigned long freq)
> @@ -22,6 +23,10 @@ static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
>  	return -ENOSYS;
>  }
>  static inline void rcar_lvds_clk_disable(struct drm_bridge *bridge) { }
> +static inline bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> +{
> +	return false;
> +}
>  #endif /* CONFIG_DRM_RCAR_LVDS */
>
>  #endif /* __RCAR_LVDS_H__ */
> --
> Regards,
>
> Laurent Pinchart
>

--qt5p5xkya64di4qs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlztAPYACgkQcjQGjxah
VjwVMBAAhb83Ru3+EQt4hpAImCpA4LyfuRA55aZD6qDwz48vwU2K8i9vnLy9Qnf3
VEW8O7TuS+oJ7EKVt6/KaaIVoavNYhQkES53O0bcA6yauBxjlm36zmKp6WQnHVdW
ttXREmuJvFIH6Fnj46iHpAZGRORlrG0VNF3L63VysUP2eCJstnSqssPoDb9yWyLA
78PYImXwQXfJzCs2FDl7JpBkkSSAXhWgKBHToGAKPGtfvt7uIv+XtIjJW1lvtq5d
g5c1eyg0h0xz9B4whUGloNo9xUDTIT+lTVRRXQaVkKZXjk5erpDdlhJj8Vw8Qnp0
shMZOiOVk9qVPpBR3YQusG3nBX9C0pM34E/Qi5gN40ZjSpft1o1phPKqkUcsCjSK
G2//AWYuER/+iKGE/SmTW3ZNKJcnmU4aaLdpHYKQKSpZ59auP84It5Lj1Zy5HprA
zzk9jRhUnk/zh4ePXdU5Uwb1Qnio4SD7oO42zmuTo0SP6EN6F0IBMKsA3d8Z0iZD
j30NBEF6wZLi6NMVYQ+SRLq9m7jExUH81iMXBt3twXlSWktLpdMcGgcGDkQ1ss44
MOpDI/V5rtNB0EsPDgjfUh3uIN3oZTd4jiMqtmXU1ZYbWa02JjWYATY67p+GA5zx
e/eV6N1SRnNjlgl/x+KpdLuzasPLXIsAFTbL5/dj4KvP54e85ds=
=f7q0
-----END PGP SIGNATURE-----

--qt5p5xkya64di4qs--

--===============2011408404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2011408404==--
