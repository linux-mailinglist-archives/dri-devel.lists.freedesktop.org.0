Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2B586025C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630FE10EA41;
	Thu, 22 Feb 2024 19:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fhSyU/OZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AF310EA41
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 19:12:34 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51197ca63f5so208470e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 11:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708629153; x=1709233953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ascVxuLaaMNM+iLyCaaEtYsJ/LtdyKIcDFbaaHuf7+A=;
 b=fhSyU/OZR6Bp+B7Dl4oiERLdUO+Hxi/fvZ2VSekGcyEKw+arcr42q+evS65WPIV4Yy
 Za+1nClh9TkT+v5d39bhPUls9Wi0mydxkrqTiR/cb8cenM72Uz4MtqO4xiWEYLWOPp9N
 7W5WaGJyKOOmhmweh6GlTe+mXzDNBxcxZVsOF5M38eK0wvi02tmVyAScMHF8tH6Qcu6d
 a4CnJsxgokHy1nBChLD/jiY3u6Y01HCjePwqEYYzZP5DqMYZPDIA9yd9pL+Bxm4d60sD
 pQbrEHWDSJkwYvZX6CUKu7JJRnXlMByFDXB1RqwSXIlfSZZ/6t4T3C0kqkPmfoFxGB1l
 o1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708629153; x=1709233953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ascVxuLaaMNM+iLyCaaEtYsJ/LtdyKIcDFbaaHuf7+A=;
 b=GrkkjC3RhXnLcyzHJ0Roii2Muu9oy9ZMFnSemLIkLmKs4uOjW4sAvK5R67SgsD3qwJ
 /i9o1zbw8fPRpySBIfze2ooQdwlOMMFM15JLZqzUzbuYxlO5A6cZRlTiRE7UITzCaBz/
 iJ07lACP8nXcbZguJtgfZLB4fvM03ZSNP1qDUlMEOaM+HItjv617u4Fd9ZTCGsfS+O3N
 vO4IVTnkWYZ17MRYYM8766UauSDXs0lIs1OPUl1Tt8C2EOlwOKKEHT/4L/aHvxWrMGaF
 /THEGHXyuZWcQxRWmF45L1T3C+5VnVk7dHQ+5jAuLzWl8PED7SwgBbtVi4STNj01eehf
 4Zbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjNAjrqBSW2DZK6nJauJn+or/l9TsM/EqSyUjeqhzryBInrCMF1qJqqirarOIf6de75hG4DPF80cOs57zou2PsOv/+73g0NXecPzJLbZUy
X-Gm-Message-State: AOJu0YxgizExK3xQ707LpHDcETmRKefyC6E05gQ7IePCPrnosszuw570
 xKS8nwrMhW67C5i1bRriGz7osNuqulY3XX4ZTBb9fzoIg6ALI6Rw
X-Google-Smtp-Source: AGHT+IGu+ExwuJo5Vy53aR587PvPGA/BvgjURLqHK9mgxxEedn8hBlpN+TNPuvzQRBJx6tkns7NcdQ==
X-Received: by 2002:a05:6512:1196:b0:512:d655:9d4b with SMTP id
 g22-20020a056512119600b00512d6559d4bmr55318lfr.5.1708629152360; 
 Thu, 22 Feb 2024 11:12:32 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 r17-20020ac25a51000000b00512bfc0c2b9sm1189234lfn.178.2024.02.22.11.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 11:12:31 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v7 35/36] drm/sun4i: hdmi: Consolidate atomic_check and
 mode_valid
Date: Thu, 22 Feb 2024 20:12:29 +0100
Message-ID: <2921783.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-35-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-35-8f4af575fce2@kernel.org>
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

Dne =C4=8Detrtek, 22. februar 2024 ob 19:14:21 CET je Maxime Ripard napisal=
(a):
> atomic_check and mode_valid do not check for the same things which can
> lead to surprising result if the userspace commits a mode that didn't go
> through mode_valid. Let's merge the two implementations into a function
> called by both.
>=20
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 74 +++++++++++++++++++++-------=
=2D-----
>  1 file changed, 47 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index c276d984da6b..b7cf369b1906 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -62,18 +62,6 @@ static int sun4i_hdmi_setup_avi_infoframes(struct sun4=
i_hdmi *hdmi,
>  	return 0;
>  }
> =20
> -static int sun4i_hdmi_atomic_check(struct drm_encoder *encoder,
> -				   struct drm_crtc_state *crtc_state,
> -				   struct drm_connector_state *conn_state)
> -{
> -	struct drm_display_mode *mode =3D &crtc_state->mode;
> -
> -	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
>  static void sun4i_hdmi_disable(struct drm_encoder *encoder,
>  			       struct drm_atomic_state *state)
>  {
> @@ -166,31 +154,61 @@ static void sun4i_hdmi_enable(struct drm_encoder *e=
ncoder,
>  	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
>  }
> =20
> -static enum drm_mode_status sun4i_hdmi_mode_valid(struct drm_encoder *en=
coder,
> -					const struct drm_display_mode *mode)
> +static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs =3D=
 {
> +	.atomic_disable	=3D sun4i_hdmi_disable,
> +	.atomic_enable	=3D sun4i_hdmi_enable,
> +};
> +
> +static enum drm_mode_status
> +sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
> +				 const struct drm_display_mode *mode,
> +				 unsigned long long clock)
>  {
> -	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
> -	unsigned long rate =3D mode->clock * 1000;
> -	unsigned long diff =3D rate / 200; /* +-0.5% allowed by HDMI spec */
> +	const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi(connector=
);
> +	unsigned long diff =3D clock / 200; /* +-0.5% allowed by HDMI spec */
>  	long rounded_rate;
> =20
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		return MODE_BAD;
> +
>  	/* 165 MHz is the typical max pixelclock frequency for HDMI <=3D 1.2 */
> -	if (rate > 165000000)
> +	if (clock > 165000000)
>  		return MODE_CLOCK_HIGH;
> -	rounded_rate =3D clk_round_rate(hdmi->tmds_clk, rate);
> +
> +	rounded_rate =3D clk_round_rate(hdmi->tmds_clk, clock);
>  	if (rounded_rate > 0 &&
> -	    max_t(unsigned long, rounded_rate, rate) -
> -	    min_t(unsigned long, rounded_rate, rate) < diff)
> +	    max_t(unsigned long, rounded_rate, clock) -
> +	    min_t(unsigned long, rounded_rate, clock) < diff)
>  		return MODE_OK;
> +
>  	return MODE_NOCLOCK;
>  }
> =20
> -static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs =3D=
 {
> -	.atomic_check	=3D sun4i_hdmi_atomic_check,
> -	.atomic_disable	=3D sun4i_hdmi_disable,
> -	.atomic_enable	=3D sun4i_hdmi_enable,
> -	.mode_valid	=3D sun4i_hdmi_mode_valid,
> -};
> +static int sun4i_hdmi_connector_atomic_check(struct drm_connector *conne=
ctor,
> +					     struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *conn_state =3D
> +		drm_atomic_get_new_connector_state(state, connector);
> +	struct drm_crtc *crtc =3D conn_state->crtc;
> +	struct drm_crtc_state *crtc_state =3D crtc->state;
> +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> +	enum drm_mode_status status;
> +
> +	status =3D sun4i_hdmi_connector_clock_valid(connector, mode,
> +						  mode->clock * 1000);
> +	if (status !=3D MODE_OK)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static enum drm_mode_status
> +sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
> +				struct drm_display_mode *mode)
> +{
> +	return sun4i_hdmi_connector_clock_valid(connector, mode,
> +						mode->clock * 1000);
> +}
> =20
>  static int sun4i_hdmi_get_modes(struct drm_connector *connector)
>  {
> @@ -236,6 +254,8 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct =
device *dev)
>  }
> =20
>  static const struct drm_connector_helper_funcs sun4i_hdmi_connector_help=
er_funcs =3D {
> +	.atomic_check	=3D sun4i_hdmi_connector_atomic_check,
> +	.mode_valid	=3D sun4i_hdmi_connector_mode_valid,
>  	.get_modes	=3D sun4i_hdmi_get_modes,
>  };
> =20
>=20
>=20




