Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D562C380C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 16:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6106E81A;
	Tue,  1 Oct 2019 14:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785D66E81A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 14:50:46 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4BF9D40004;
 Tue,  1 Oct 2019 14:50:39 +0000 (UTC)
Date: Tue, 1 Oct 2019 16:52:22 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v3 5/5] RFC: drm/atomic-helper: Reapply color
 transformation after resume
Message-ID: <20191001145222.32aapomoqlaxpvbb@uno.localdomain>
References: <20190930222802.32088-1-ezequiel@collabora.com>
 <20190930222802.32088-6-ezequiel@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190930222802.32088-6-ezequiel@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: multipart/mixed; boundary="===============0893996964=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0893996964==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zl62uyu5oe5zzls3"
Content-Disposition: inline


--zl62uyu5oe5zzls3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ezequiel,

On Mon, Sep 30, 2019 at 07:28:02PM -0300, Ezequiel Garcia wrote:
> Some platforms are not able to maintain the color transformation
> state after a system suspend/resume cycle.
>
> Set the colog_mgmt_changed flag so that CMM on the CRTCs in

CMM is the name of the Renesas unit for color enanchement. It should
not be used here as this will apply to all platforms.

> the suspend state are reapplied after system resume.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> This is an RFC, and it's mostly based on Jacopo Mondi's work https://lkml.org/lkml/2019/9/6/498.
>
> Changes from v2:
> * New patch.
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index e41db0f202ca..518488125575 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3234,8 +3234,20 @@ int drm_atomic_helper_resume(struct drm_device *dev,
>  			     struct drm_atomic_state *state)
>  {
>  	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc *crtc;
> +	unsigned int i;
>  	int err;
>
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		/*
> +		 * Force re-enablement of CMM after system resume if any
> +		 * of the DRM color transformation properties was set in
> +		 * the state saved at system suspend time.
> +		 */
> +		if (crtc_state->gamma_lut)

Please note that in my original patch I only took gamma_lut into
account as that's what our CMM supports at the moment, but you should
here consider the degamma_lut and cmt flags in the crtc_state.

> +			crtc_state->color_mgmt_changed = true;
> +	}
>  	drm_mode_config_reset(dev);
>
>  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> --
> 2.22.0
>

--zl62uyu5oe5zzls3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2TaCYACgkQcjQGjxah
VjyNJA//aSwBuTdB7lLcaiEaE+P3RsAcLZl6sS/EGaTO5tsvgJD43qhcW0FyAZdV
8ABNJ3e+W7ZgTzkHWVBvs6Y5eQlE3AvvAhXFPEjL9ca9Y/rRLgcF6mQ8GQCqsYO7
dvBkd1bpWG7XBOO5KzSLSDbIsjDRmDbpFVQHtTWDJZN/LzIqZHoGPZL9Tc7yoAY7
9MW3av52glPOWqTJj9zscg/Y7BWuapCmmPPV97iLUPKVtvN/G+2fgIVxushM2e3K
TJvYsU63CZ5pzKX1U02UBbs0KKsENRRjWCTcGs2gf5xq0WhBs+lC0uZAclNkw/lu
wd5ehPD3CaE2NiBECnHtptxEZE+jMzzP7jmDojYHILG0NqV6pcVVHdZsYK7AE/qb
CfqDtLn6HnbaZZcia7Smp50QpTGY5z46Qe9l15CH/wtzjywwyKyl9GvuEK18ycx5
6iwGZW0PYHJnAQwh0U4F92akAXIOf5xfpW2358jlIr8iwmSE5UgrqA4YcDDPGDfs
7YvBDUBn/Bs0RYUetb/+HI5rcYZsWdBkpL/cHP6y+8yItmdS9IyYlHS6pXxm3X04
dS7tEaUs29GYJKsVshqq7ORctg0pd4ebsSsZeyqTLq7YmzXefjzpHihSvuKt0oMU
pqCdnYKZkFUm70gLJXTHVVjSty7YOBB428DgPlWTFmgNUvVUqec=
=hYRk
-----END PGP SIGNATURE-----

--zl62uyu5oe5zzls3--

--===============0893996964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0893996964==--
