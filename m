Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6E860243
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA8810EA34;
	Thu, 22 Feb 2024 19:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dsdyfikn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2EA10EA34
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 19:08:29 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-564372fb762so3143565a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 11:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708628908; x=1709233708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miYXI5X8OB04A3nvBBpwERsgxft9kKmaWCdU6IfWrLc=;
 b=dsdyfikneMKU3Yum/QwaLh/117PfpugTWj+o5TozoAbVFd1YExRfxq95eiDesZWpHM
 J6e2ctDveWjTZHeazJu6Iw0XmbT139lD92HZFFCrgNszQM8BPQyOQBBxWu/cMc/sDC8V
 sA92xT3XKBTXP8jggbfz6kG51ArprpJkseKcYBbz3c0gfD5cr4ROhW02qYNjFAw6Jg1j
 +DPiblujOjxA5CRknKibMfb1/wGbOHaaTWVPiDjrnIlqawk5RVZlP4OP62zVkBKT837t
 Hx3xsEfU2xieSUa+HIHiA6Ox1uD+uTinX5Rh+fSTcxs/8tBT7S6Tu4zH4YdO2HMOIURx
 E9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708628908; x=1709233708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=miYXI5X8OB04A3nvBBpwERsgxft9kKmaWCdU6IfWrLc=;
 b=uNyusViFR9/NQqC9/YkmDkXWWokDAWI+aQk2rMtXiLJ28qsX2hCrvgfPuN2U6VuB/b
 uBEBmT6L9rWGVq6j57ut9wwxMxWOGm7TlUu0U8PlhnHPFLyV0pMQ+w2z69WnjUz/oUCi
 2hW/LX21ao0nSi610YaCTnSImgXADLJMdTT4apByA4l7E8aJJJZhGJczzn8vzBJdQpu1
 ZXbQbo1VF2Eu7ixGCsUU7IBcKisa6qXST69U6WwBl7p0jFmd4Ziyk3tnUeQiXBLMlyV3
 3jiDolILEmzL6JFx6dkL7w4LHOUAnbiwlSekNMJ/FBCp1YsYajlCtdqBtyRMMeVPDZIJ
 uX4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtwnT2xP7twu/LCNXNxnZNkRe4yFwdvlL64jtbzgdlDzM8TovKpQv3oksRjo9XvJKHHRxoOYLIDdKtbns49u2dRxIR7hvPNlhnp41VeRRv
X-Gm-Message-State: AOJu0YworLfzywstuCXG048bwyEgcffwgLVg5h86G78MDMiPIQELBnVS
 /wOIc+LWjhKlOOgc5QJsc969N+K6OliCZ/aeSWlfedoulgFsp4eR
X-Google-Smtp-Source: AGHT+IFAwJtXHRxsMlfuxZbKsBCx57OJ9WWOE6NU3SwtpJdQrrzkkNNcvjYdXKu6pBGCRHU3AulfnQ==
X-Received: by 2002:a17:906:35d3:b0:a3f:2f67:4847 with SMTP id
 p19-20020a17090635d300b00a3f2f674847mr3966366ejb.19.1708628908074; 
 Thu, 22 Feb 2024 11:08:28 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 b5-20020a170906490500b00a3e7b8bd2d8sm4663088ejq.111.2024.02.22.11.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 11:08:27 -0800 (PST)
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
Subject: Re: [PATCH v7 33/36] drm/sun4i: hdmi: Move mode_set into enable
Date: Thu, 22 Feb 2024 20:08:26 +0100
Message-ID: <4868938.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-33-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-33-8f4af575fce2@kernel.org>
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

Dne =C4=8Detrtek, 22. februar 2024 ob 19:14:19 CET je Maxime Ripard napisal=
(a):
> We're not doing anything special in atomic_mode_set so we can simply
> merge it into atomic_enable.
>=20
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 38 +++++++++++++---------------=
=2D-----
>  1 file changed, 14 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index 799a26215cc2..bae69d696765 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -103,33 +103,11 @@ static void sun4i_hdmi_enable(struct drm_encoder *e=
ncoder,
>  	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mode;
>  	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
>  	struct drm_display_info *display =3D &hdmi->connector.display_info;
> +	unsigned int x, y;
>  	u32 val =3D 0;
> =20
>  	DRM_DEBUG_DRIVER("Enabling the HDMI Output\n");
> =20
> -	clk_prepare_enable(hdmi->tmds_clk);
> -
> -	sun4i_hdmi_setup_avi_infoframes(hdmi, mode);
> -	val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
> -	val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(1, SUN4I_HDMI_PKT_END);
> -	writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
> -
> -	val =3D SUN4I_HDMI_VID_CTRL_ENABLE;
> -	if (display->is_hdmi)
> -		val |=3D SUN4I_HDMI_VID_CTRL_HDMI_MODE;
> -
> -	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
> -}
> -
> -static void sun4i_hdmi_mode_set(struct drm_encoder *encoder,
> -				struct drm_crtc_state *crtc_state,
> -				struct drm_connector_state *conn_state)
> -{
> -	const struct drm_display_mode *mode =3D &crtc_state->mode;
> -	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
> -	unsigned int x, y;
> -	u32 val;
> -
>  	clk_set_rate(hdmi->mod_clk, mode->crtc_clock * 1000);
>  	clk_set_rate(hdmi->tmds_clk, mode->crtc_clock * 1000);
> =20
> @@ -181,6 +159,19 @@ static void sun4i_hdmi_mode_set(struct drm_encoder *=
encoder,
>  		val |=3D SUN4I_HDMI_VID_TIMING_POL_VSYNC;
> =20
>  	writel(val, hdmi->base + SUN4I_HDMI_VID_TIMING_POL_REG);
> +
> +	clk_prepare_enable(hdmi->tmds_clk);
> +
> +	sun4i_hdmi_setup_avi_infoframes(hdmi, mode);
> +	val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
> +	val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(1, SUN4I_HDMI_PKT_END);
> +	writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
> +
> +	val =3D SUN4I_HDMI_VID_CTRL_ENABLE;
> +	if (display->is_hdmi)
> +		val |=3D SUN4I_HDMI_VID_CTRL_HDMI_MODE;
> +
> +	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
>  }
> =20
>  static enum drm_mode_status sun4i_hdmi_mode_valid(struct drm_encoder *en=
coder,
> @@ -206,7 +197,6 @@ static const struct drm_encoder_helper_funcs sun4i_hd=
mi_helper_funcs =3D {
>  	.atomic_check	=3D sun4i_hdmi_atomic_check,
>  	.atomic_disable	=3D sun4i_hdmi_disable,
>  	.atomic_enable	=3D sun4i_hdmi_enable,
> -	.atomic_mode_set	=3D sun4i_hdmi_mode_set,
>  	.mode_valid	=3D sun4i_hdmi_mode_valid,
>  };
> =20
>=20
>=20




