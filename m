Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ACD621755
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 15:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B92510E2A1;
	Tue,  8 Nov 2022 14:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2343010E2A1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 14:50:00 +0000 (UTC)
Received: from mercury (dyndsl-095-033-156-208.ewe-ip-backbone.de
 [95.33.156.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 715BB66015F1;
 Tue,  8 Nov 2022 14:49:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667918998;
 bh=Bx7tg9i/ObW1QjsPTPA85xe4tUXAPb882JRgeJVTGek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EELZ/3HGSUfgEP1McxyGnPQiA6qZ5axT5+ch4oo/Ck5fzR/LLNBSankUTA9CcpAmt
 Wky3jQUpP/XHM3OpAHksmFyHqjlfrfBAGoH09avpX6ZPxgfb3Zrqe2528+bJ7lnvwa
 BoHK+drhROd3bGrDwBsB48TVguJkPE13J8kPrwDAgfdq/cD2dZpTVRDhqSRdGJZJQH
 cwBDfxecswa5IlMxjoxdb8so04lyZq/Lvtn8q+J8gHdsEj6QNFgmPGC/XqgxUhqBeq
 +9VcygA2SbJAsGdN804gcn5aXMhL0EHlgYAJo83t3jEJl5X7swH7NvRqGN3QMijAdH
 07evCG/At9Cow==
Received: by mercury (Postfix, from userid 1000)
 id 81AE41060EDB; Tue,  8 Nov 2022 15:49:55 +0100 (CET)
Date: Tue, 8 Nov 2022 15:49:55 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: ipuv3-plane: Fix overlay plane width
Message-ID: <20221108144955.my4m5smwazsctsli@mercury.elektranox.org>
References: <20221108141420.176696-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yvitrwamxp7d3fvw"
Content-Disposition: inline
In-Reply-To: <20221108141420.176696-1-p.zabel@pengutronix.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Ian Ray <ian.ray@ge.com>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Huan 'Kitty' Wang <HuanWang@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yvitrwamxp7d3fvw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 08, 2022 at 03:14:20PM +0100, Philipp Zabel wrote:
> ipu_src_rect_width() was introduced to support odd screen resolutions
> such as 1366x768 by internally rounding up primary plane width to a
> multiple of 8 and compensating with reduced horizontal blanking.
> This also caused overlay plane width to be rounded up, which was not
> intended. Fix overlay plane width by limiting the rounding up to the
> primary plane.
>=20
> drm_rect_width(&new_state->src) >> 16 is the same value as
> drm_rect_width(dst) because there is no plane scaling support.
>=20
> Fixes: 94dfec48fca7 ("drm/imx: Add 8 pixel alignment fix")
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Looks sensible, but I no longer have access to the affected
hardware. Maybe Ian or Kitty (both added to Cc) can give it
a test on arch/arm/boot/dts/imx6dl-b155v2.dts

-- Sebastian

>  drivers/gpu/drm/imx/ipuv3-plane.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv=
3-plane.c
> index dba4f7d81d69..80142d9a4a55 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -614,6 +614,11 @@ static void ipu_plane_atomic_update(struct drm_plane=
 *plane,
>  		break;
>  	}
> =20
> +	if (ipu_plane->dp_flow =3D=3D IPU_DP_FLOW_SYNC_BG)
> +		width =3D ipu_src_rect_width(new_state);
> +	else
> +		width =3D drm_rect_width(&new_state->src) >> 16;
> +
>  	eba =3D drm_plane_state_to_eba(new_state, 0);
> =20
>  	/*
> @@ -622,8 +627,7 @@ static void ipu_plane_atomic_update(struct drm_plane =
*plane,
>  	 */
>  	if (ipu_state->use_pre) {
>  		axi_id =3D ipu_chan_assign_axi_id(ipu_plane->dma);
> -		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id,
> -					  ipu_src_rect_width(new_state),
> +		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id, width,
>  					  drm_rect_height(&new_state->src) >> 16,
>  					  fb->pitches[0], fb->format->format,
>  					  fb->modifier, &eba);
> @@ -678,9 +682,8 @@ static void ipu_plane_atomic_update(struct drm_plane =
*plane,
>  		break;
>  	}
> =20
> -	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, ALIGN(drm_rect_width(dst), 8)=
);
> +	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, width);
> =20
> -	width =3D ipu_src_rect_width(new_state);
>  	height =3D drm_rect_height(&new_state->src) >> 16;
>  	info =3D drm_format_info(fb->format->format);
>  	ipu_calculate_bursts(width, info->cpp[0], fb->pitches[0],
> @@ -744,8 +747,7 @@ static void ipu_plane_atomic_update(struct drm_plane =
*plane,
>  		ipu_cpmem_set_burstsize(ipu_plane->ipu_ch, 16);
> =20
>  		ipu_cpmem_zero(ipu_plane->alpha_ch);
> -		ipu_cpmem_set_resolution(ipu_plane->alpha_ch,
> -					 ipu_src_rect_width(new_state),
> +		ipu_cpmem_set_resolution(ipu_plane->alpha_ch, width,
>  					 drm_rect_height(&new_state->src) >> 16);
>  		ipu_cpmem_set_format_passthrough(ipu_plane->alpha_ch, 8);
>  		ipu_cpmem_set_high_priority(ipu_plane->alpha_ch);
>=20
> base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
> --=20
> 2.30.2
>=20

--yvitrwamxp7d3fvw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmNqbIYACgkQ2O7X88g7
+ppDJA//XkZNO0X/kt3FN6EXFh5cA+mbS50ptgyj3T63aAcOCni42D3pfgPTetf7
aGtXrJvcl5z6kxuwObUkz/f09N+eBeWQtejrbvT1e/C8h707OqhW5ybPOozJ6CRO
BNgbIrz4ncRsMBwsI/d7tu25ce0Tw9E+safMpKxA1Tx6Eyiqu23VKddLRadi4t13
R62iOOUPBDYi5H5f0g4nIY/EyX9wzszCg6MMpdJH4w8ZhDWH2RLV2LId9rmYoXrd
HpgITf/0KXbsCkNEp3tJe5Wb8L7tpoylKcS6/CU1B1JPC/MLyeswIGWX+7yECmRw
+uF2nb6EKxnG+RBod0knNPM5kCMqxC+/CGqyTwxEFiorZEYBRdIOGUuFFPM+vR4f
FUSvsWIQya8PDf3h+1gm1tNjaBnxCiy1YoD1qkgI9cDP52JF/Zfiu25wLEDtogj5
6kRgGEVtMN5CbYw2mrDOz3CvP6FNvVy5FyxFQvb+iXOxwwAX/8P1gNw60mP7fshA
9RWy0I1L9wnTrhlCcjjO+xYy7vnvAw3UBX+Ly4HJwjruqfG3GXur4CWR5OLFqcPZ
nJfeMIOV1qbw6mwHqhreTBHKEbW/4jT2O0FWN0PJzpuL6KYcF31riUwlY+oetavQ
bPl7BKufHPaHhZT8LT1Uy4Z9wUjCIR8sqPgoG6OjPURbOx47aSs=
=8cBP
-----END PGP SIGNATURE-----

--yvitrwamxp7d3fvw--
