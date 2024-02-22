Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B019A860275
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CBA10EA43;
	Thu, 22 Feb 2024 19:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LU6yTGDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402DC10EA43
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 19:17:37 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-512be9194b7so187008e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 11:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708629455; x=1709234255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YXyetn+ZGaN+wj8L7+WuO+TQebmZJtVHvCLliqZtuvQ=;
 b=LU6yTGDDjSV9EYYGMysGeGIBNvwSSwouAWAUB99XST39tcmkRcCnIHGxMungzrT1T5
 gxv1IbFP/ySKH4G5xVIr+7Gvqrn4Jn0FnIt/3APANd0gj2bSoS+TN0Jutw3NQKJKEZ5s
 IJ/wXW3C+cm8r2tGFrH5U2wU2ElQtde3yrBl4WdrhdY8Q2O0Nmv3iP1+RuqCJ8xZSq/u
 HIBhgx5bjGNjgdHWbYT0uESHiDvvvjFIUWbs2NudIikRv2wcnDL3yZT7mValAkFt7SZE
 w3mJY59uYvBWRTu0+NPrO2NbqLkYckymHxDxXUMqaR07IyoKg0zRLYdzTszM2ib2UizS
 5PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708629455; x=1709234255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YXyetn+ZGaN+wj8L7+WuO+TQebmZJtVHvCLliqZtuvQ=;
 b=SvxPX5Q7DOibaxw4z9VRxSWIYji3ME57NGRwHbsYCZ1eiDtVtAZIcgcD2tsJp54Igc
 7IqhsuQEffeJ+sCVjAQOTx2zaQQ/8T0f5LijZ6YTG3rTqECHkpsc4qqe+xmNisW3JkeB
 NmELZMREsS2D2CABJXKjSsCmqWLa+iPy1EMI5Mqb73tfE7f7apBUqFRjzx6A6F2u+Eek
 d1UZ2BP1BuSSIT5S1JrNBRsOUbv1H/bFQ4GrQtAxachkuZswXG6p7775LtnqtfBaGEi1
 mj8Mx/cc5opkVHJGw+55nwBjYEhZt4yy9k8//tsPMSCTiCj4I2VPnNbqEOWorXwlroDO
 5wWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBqzIVN10VslzCeyA79hE7nAFI6v0TD0dr7rIIbgTafnbVwNjDpLwAZSxj6GnXFvmaF9F9hL+4Twg3hsY1nu0bCz03FtuyFwsOCT9C9fJo
X-Gm-Message-State: AOJu0YzGVZb551tWIAu5ZKwQsBMPWgQK5gFfWN/sdkdIS2cHKqQekLZ8
 djiKJZOdLty6lmECekI62XEYnA2mubpqIlJth2sscNgoF6wkew8u
X-Google-Smtp-Source: AGHT+IGVJwMcq24ZF8Ebpo5tftKhvL3M0wvGVhfFgolHxmrCildGsWDM6qvoySHLbKiVC58dP2WqFg==
X-Received: by 2002:ac2:5464:0:b0:512:a95a:8308 with SMTP id
 e4-20020ac25464000000b00512a95a8308mr70236lfn.2.1708629454909; 
 Thu, 22 Feb 2024 11:17:34 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 wp12-20020a170907060c00b00a3eb953335esm3843240ejb.44.2024.02.22.11.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 11:17:34 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 =?utf-8?B?T25kxZllag==?= Jirman <megi@xff.cz>
Cc: Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/sun4i: Unify sun8i_*_layer structs
Date: Thu, 22 Feb 2024 20:17:33 +0100
Message-ID: <3789585.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20240216190430.1374132-2-megi@xff.cz>
References: <20240216190430.1374132-1-megi@xff.cz>
 <20240216190430.1374132-2-megi@xff.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Dne petek, 16. februar 2024 ob 20:04:24 CET je Ond=C5=99ej Jirman napisal(a=
):
> From: Ondrej Jirman <megi@xff.cz>
>=20
> These structs are identical, use a single struct to represent private
> data for the DRM plane. This is a preparation for configuring layer
> routing from the CRTC (mixer) instead of current approach of setting
> up routing from individual layer's atomic_update callback.
>=20
> Signed-off-by: Ondrej Jirman <megi@xff.cz>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    |  4 ++--
>  drivers/gpu/drm/sun4i/sun8i_mixer.h    | 14 ++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 14 +++++++-------
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.h | 20 ++++----------------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 +++++++-------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 20 ++++----------------
>  6 files changed, 38 insertions(+), 48 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 01382860aaee..1e681314e379 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -271,7 +271,7 @@ static struct drm_plane **sun8i_layers_init(struct dr=
m_device *drm,
>  		return ERR_PTR(-ENOMEM);
> =20
>  	for (i =3D 0; i < mixer->cfg->vi_num; i++) {
> -		struct sun8i_vi_layer *layer;
> +		struct sun8i_layer *layer;
> =20
>  		layer =3D sun8i_vi_layer_init_one(drm, mixer, i);
>  		if (IS_ERR(layer)) {
> @@ -284,7 +284,7 @@ static struct drm_plane **sun8i_layers_init(struct dr=
m_device *drm,
>  	}
> =20
>  	for (i =3D 0; i < mixer->cfg->ui_num; i++) {
> -		struct sun8i_ui_layer *layer;
> +		struct sun8i_layer *layer;
> =20
>  		layer =3D sun8i_ui_layer_init_one(drm, mixer, i);
>  		if (IS_ERR(layer)) {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index 85c94884fb9a..5a610ee30301 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -9,6 +9,7 @@
>  #include <linux/clk.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> +#include <drm/drm_plane.h>
> =20
>  #include "sunxi_engine.h"
> =20
> @@ -185,6 +186,19 @@ struct sun8i_mixer {
>  	struct clk			*mod_clk;
>  };
> =20
> +struct sun8i_layer {
> +	struct drm_plane	plane;
> +	struct sun8i_mixer	*mixer;
> +	int			channel;
> +	int			overlay;
> +};
> +
> +static inline struct sun8i_layer *
> +plane_to_sun8i_layer(struct drm_plane *plane)
> +{
> +	return container_of(plane, struct sun8i_layer, plane);
> +}
> +
>  static inline struct sun8i_mixer *
>  engine_to_sun8i_mixer(struct sunxi_engine *engine)
>  {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index ca75ca0835a6..248fbb606ede 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -232,7 +232,7 @@ static int sun8i_ui_layer_atomic_check(struct drm_pla=
ne *plane,
>  {
>  	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_st=
ate(state,
>  										 plane);
> -	struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(plane);
> +	struct sun8i_layer *layer =3D plane_to_sun8i_layer(plane);
>  	struct drm_crtc *crtc =3D new_plane_state->crtc;
>  	struct drm_crtc_state *crtc_state;
>  	int min_scale, max_scale;
> @@ -264,7 +264,7 @@ static void sun8i_ui_layer_atomic_disable(struct drm_=
plane *plane,
>  {
>  	struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_state(st=
ate,
>  									   plane);
> -	struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(plane);
> +	struct sun8i_layer *layer =3D plane_to_sun8i_layer(plane);
>  	unsigned int old_zpos =3D old_state->normalized_zpos;
>  	struct sun8i_mixer *mixer =3D layer->mixer;
> =20
> @@ -279,7 +279,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_p=
lane *plane,
>  									   plane);
>  	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(st=
ate,
>  									   plane);
> -	struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(plane);
> +	struct sun8i_layer *layer =3D plane_to_sun8i_layer(plane);
>  	unsigned int zpos =3D new_state->normalized_zpos;
>  	unsigned int old_zpos =3D old_state->normalized_zpos;
>  	struct sun8i_mixer *mixer =3D layer->mixer;
> @@ -345,13 +345,13 @@ static const uint64_t sun8i_layer_modifiers[] =3D {
>  	DRM_FORMAT_MOD_INVALID
>  };
> =20
> -struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
> -					       struct sun8i_mixer *mixer,
> -					       int index)
> +struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
> +					    struct sun8i_mixer *mixer,
> +					    int index)
>  {
>  	enum drm_plane_type type =3D DRM_PLANE_TYPE_OVERLAY;
>  	int channel =3D mixer->cfg->vi_num + index;
> -	struct sun8i_ui_layer *layer;
> +	struct sun8i_layer *layer;
>  	unsigned int plane_cnt;
>  	int ret;
> =20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.h
> index e3e32ee1178d..83892f6ff211 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> @@ -47,21 +47,9 @@
>  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED	((2) << 1)
> =20
>  struct sun8i_mixer;
> +struct sun8i_layer;
> =20
> -struct sun8i_ui_layer {
> -	struct drm_plane	plane;
> -	struct sun8i_mixer	*mixer;
> -	int			channel;
> -	int			overlay;
> -};
> -
> -static inline struct sun8i_ui_layer *
> -plane_to_sun8i_ui_layer(struct drm_plane *plane)
> -{
> -	return container_of(plane, struct sun8i_ui_layer, plane);
> -}
> -
> -struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
> -					       struct sun8i_mixer *mixer,
> -					       int index);
> +struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
> +					    struct sun8i_mixer *mixer,
> +					    int index);
>  #endif /* _SUN8I_UI_LAYER_H_ */
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index f9c0a56d3a14..0c0f1ac80517 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -366,7 +366,7 @@ static int sun8i_vi_layer_atomic_check(struct drm_pla=
ne *plane,
>  {
>  	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_st=
ate(state,
>  										 plane);
> -	struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(plane);
> +	struct sun8i_layer *layer =3D plane_to_sun8i_layer(plane);
>  	struct drm_crtc *crtc =3D new_plane_state->crtc;
>  	struct drm_crtc_state *crtc_state;
>  	int min_scale, max_scale;
> @@ -398,7 +398,7 @@ static void sun8i_vi_layer_atomic_disable(struct drm_=
plane *plane,
>  {
>  	struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_state(st=
ate,
>  									   plane);
> -	struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(plane);
> +	struct sun8i_layer *layer =3D plane_to_sun8i_vi_layer(plane);
>  	unsigned int old_zpos =3D old_state->normalized_zpos;
>  	struct sun8i_mixer *mixer =3D layer->mixer;
> =20
> @@ -413,7 +413,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_p=
lane *plane,
>  									   plane);
>  	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(st=
ate,
>  									   plane);
> -	struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(plane);
> +	struct sun8i_layer *layer =3D plane_to_sun8i_layer(plane);
>  	unsigned int zpos =3D new_state->normalized_zpos;
>  	unsigned int old_zpos =3D old_state->normalized_zpos;
>  	struct sun8i_mixer *mixer =3D layer->mixer;
> @@ -539,14 +539,14 @@ static const uint64_t sun8i_layer_modifiers[] =3D {
>  	DRM_FORMAT_MOD_INVALID
>  };
> =20
> -struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
> -					       struct sun8i_mixer *mixer,
> -					       int index)
> +struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
> +					    struct sun8i_mixer *mixer,
> +					    int index)
>  {
>  	enum drm_plane_type type =3D DRM_PLANE_TYPE_OVERLAY;
>  	u32 supported_encodings, supported_ranges;
>  	unsigned int plane_cnt, format_count;
> -	struct sun8i_vi_layer *layer;
> +	struct sun8i_layer *layer;
>  	const u32 *formats;
>  	int ret;
> =20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.h
> index 48c399e1c86d..655440cdc78f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> @@ -52,21 +52,9 @@
>  #define SUN8I_MIXER_CHAN_VI_DS_M(x)			((x) << 0)
> =20
>  struct sun8i_mixer;
> +struct sun8i_layer;
> =20
> -struct sun8i_vi_layer {
> -	struct drm_plane	plane;
> -	struct sun8i_mixer	*mixer;
> -	int			channel;
> -	int			overlay;
> -};
> -
> -static inline struct sun8i_vi_layer *
> -plane_to_sun8i_vi_layer(struct drm_plane *plane)
> -{
> -	return container_of(plane, struct sun8i_vi_layer, plane);
> -}
> -
> -struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
> -					       struct sun8i_mixer *mixer,
> -					       int index);
> +struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
> +					    struct sun8i_mixer *mixer,
> +					    int index);
>  #endif /* _SUN8I_VI_LAYER_H_ */
>=20




