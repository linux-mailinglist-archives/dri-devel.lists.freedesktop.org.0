Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E441CA82928
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAA989ECB;
	Wed,  9 Apr 2025 15:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="USeGB18u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D102389ECB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:02:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 79D85A40BC6;
 Wed,  9 Apr 2025 14:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA47C4CEE2;
 Wed,  9 Apr 2025 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744210927;
 bh=aJQppEWjaL2KF5deFSae2ldF9ctBxth+C4C3IIXJlnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=USeGB18uwqiTZNbG1Z0F1wrI5ftkJYJTV2a43/QfqQGLa3C3TQ3TW142CivEOBMV1
 Rym2Y9R+o367sWZ2dWJQOJKZ5pTsKMsSKD9BkwX4gskWdEbokQGKIE5cOrixPNmHLA
 DYNFzGHPfnbAZ2JX6sjDYJ3Rk1hx4e/+iVrc+pm6eOTuLp14sordp1lKImVmnQpxRH
 OB8ijywqomEfMx4P5JyBtEZuQJvC9tfMxTvRCz34DyMz/IM9SCS2Cd+oagIKismoqY
 F+IFRxzgZLYcXKSDlIrmWP08NbI7yP6tNtM6l3Wwax8qpvf52G3Vp3JQKUtDEDWzPw
 bya+z+Besvnuw==
Date: Wed, 9 Apr 2025 17:02:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/15] drm/connector: hdmi: Factor out bpc and format
 computation logic
Message-ID: <20250409-funny-hopping-condor-cbc50c@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-6-294d3ebbb4b2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yynkvojouwztmong"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-6-294d3ebbb4b2@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yynkvojouwztmong
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 06/15] drm/connector: hdmi: Factor out bpc and format
 computation logic
MIME-Version: 1.0

Hi,

On Wed, Mar 26, 2025 at 12:19:55PM +0200, Cristian Ciocaltea wrote:
> In preparation to support fallback to an alternative output format, e.g.
> YUV420, when RGB cannot be used for any of the available color depths,
> move the bpc try loop out of hdmi_compute_config() and, instead, make it
> part of hdmi_compute_format_bpc().  Additionally, add a new parameter to
> the latter holding the output format to be checked and eventually set.
>
> This improves code reusability and further extensibility.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

I think patch 5 could be squashed into this one.

> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 50 ++++++++++++-------=
------
>  1 file changed, 23 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 160964190d82ac233fdbe34ac54024a007a19872..6de0abb15ecb36fd4eb98725e=
2a3835e5e0db134 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -608,42 +608,19 @@ static int
>  hdmi_compute_format_bpc(const struct drm_connector *connector,
>  			struct drm_connector_state *conn_state,
>  			const struct drm_display_mode *mode,
> -			unsigned int bpc)
> +			unsigned int max_bpc, enum hdmi_colorspace fmt)
>  {
>  	struct drm_device *dev =3D connector->dev;
> -
> -	/*
> -	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
> -	 * devices, for modes that only support YCbCr420.
> -	 */

And we should fix that comment for now.

Once fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--yynkvojouwztmong
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/aL7AAKCRDj7w1vZxhR
xRX7AP9oCS18KWYPOr+6QUwEjFua6SqgR4gNhMjWooVbQ7iSmQEAiyIln41e61EW
KUxzlYInnsg5bfGRUAn7NvOBEPb9ZQE=
=yeix
-----END PGP SIGNATURE-----

--yynkvojouwztmong--
