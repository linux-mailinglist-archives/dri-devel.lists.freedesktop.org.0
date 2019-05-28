Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74F2C361
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFD46E0E1;
	Tue, 28 May 2019 09:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CCF6E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:38:57 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 37DCA20027;
 Tue, 28 May 2019 09:38:54 +0000 (UTC)
Date: Tue, 28 May 2019 11:40:03 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 05/10] drm: rcar-du: lvds: Remove LVDS double-enable
 checks
Message-ID: <20190528094003.3jnez4mwcx7idmlt@uno.localdomain>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190511210702.18394-6-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0747419282=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0747419282==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a7lmpojkft5ttn6t"
Content-Disposition: inline


--a7lmpojkft5ttn6t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Sun, May 12, 2019 at 12:06:57AM +0300, Laurent Pinchart wrote:
> The DRM core and DU driver guarantee that the LVDS bridge will not be
> double-enabled or double-disabled. Remove the corresponding unnecessary
> checks.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 19 -------------------
>  1 file changed, 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 620b51aab291..a331f0c32187 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -63,7 +63,6 @@ struct rcar_lvds {
>  		struct clk *extal;		/* External clock */
>  		struct clk *dotclkin[2];	/* External DU clocks */
>  	} clocks;
> -	bool enabled;
>
>  	struct drm_display_mode display_mode;
>  	enum rcar_lvds_mode mode;
> @@ -368,15 +367,12 @@ int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq)
>
>  	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
>
> -	WARN_ON(lvds->enabled);
> -
>  	ret = clk_prepare_enable(lvds->clocks.mod);
>  	if (ret < 0)
>  		return ret;
>
>  	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
>
> -	lvds->enabled = true;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(rcar_lvds_clk_enable);
> @@ -390,13 +386,9 @@ void rcar_lvds_clk_disable(struct drm_bridge *bridge)
>
>  	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
>
> -	WARN_ON(!lvds->enabled);
> -
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>
>  	clk_disable_unprepare(lvds->clocks.mod);
> -
> -	lvds->enabled = false;
>  }
>  EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
>
> @@ -417,8 +409,6 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	u32 lvdcr0;
>  	int ret;
>
> -	WARN_ON(lvds->enabled);
> -
>  	ret = clk_prepare_enable(lvds->clocks.mod);
>  	if (ret < 0)
>  		return;
> @@ -507,16 +497,12 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  		drm_panel_prepare(lvds->panel);
>  		drm_panel_enable(lvds->panel);
>  	}
> -
> -	lvds->enabled = true;
>  }
>
>  static void rcar_lvds_disable(struct drm_bridge *bridge)
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>
> -	WARN_ON(!lvds->enabled);
> -
>  	if (lvds->panel) {
>  		drm_panel_disable(lvds->panel);
>  		drm_panel_unprepare(lvds->panel);
> @@ -527,8 +513,6 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>
>  	clk_disable_unprepare(lvds->clocks.mod);
> -
> -	lvds->enabled = false;
>  }
>
>  static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
> @@ -592,8 +576,6 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>
> -	WARN_ON(lvds->enabled);
> -
>  	lvds->display_mode = *adjusted_mode;
>
>  	rcar_lvds_get_lvds_mode(lvds);
> @@ -793,7 +775,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>
>  	lvds->dev = &pdev->dev;
>  	lvds->info = of_device_get_match_data(&pdev->dev);
> -	lvds->enabled = false;
>
>  	ret = rcar_lvds_parse_dt(lvds);
>  	if (ret < 0)
> --
> Regards,
>
> Laurent Pinchart
>

--a7lmpojkft5ttn6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlztAfMACgkQcjQGjxah
VjzMnA/6AhZ7HuqaYOsJAJBrTwt+QJ8juY4Hp0+EFKPFHgMIuni0beGDG/9Y2ZSW
2ZUkmwZJDvSNI5hywzgg14js45jWdyeGsgR4e/uMKVdpYlt6pkcYHpaRc/UEposp
PgTHwNppQZ7Mr33ES7N2Y7d6EWedkbCJdJ2Pp/wZ2/gwdj3c+x3622w1tKMvjN1V
CrJ6ZXULkFaP6PijHnHIDpgGpGy0bo4QUmYxGT1vNgg8qHvi6kfdzUSCANKmOeal
sJvpDWchL4x1It/d2XjLhVF/n4ZILj1/hxmETvvRq7361OYNw7q2qcWUV8O3BjMe
Cb+1Xr6p5g0hTl3PeX19Z+fe9YbnCWVPUgsJF9m5FjTL7NsKg9uGXRntZaAy98HY
7wSfIWKTxstAOqzSFwbnr78gCe2DU4mSRpYJir1oBfpVuJlppORPKXVjNNCHd1aM
DbMMdfpVmwBzzVzDBXxg/DgaPwxaRmZ4HuNy/ZCiPZfHQZFQZ10CaprnmjWj+FZz
i0yF3hlKatoU1xmwWkVkHJTZ/o7bXf+KMGV5B/R6sSBWejAPr+0OgtNrN9kdcqIx
5TeiyNVVEjhv8b0Oc6Qwhz3bhwUHC2nZlZbMrxoJiSD66Qnm7cFHAqg5ZuvjkvVR
XrjB2aVk+9W/mpWw1AjfCN2Snz3TwhOhci0+g6ZiFAie0MF2bnQ=
=usHC
-----END PGP SIGNATURE-----

--a7lmpojkft5ttn6t--

--===============0747419282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0747419282==--
