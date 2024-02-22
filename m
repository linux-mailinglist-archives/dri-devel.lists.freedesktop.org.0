Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5926860242
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D51110EA31;
	Thu, 22 Feb 2024 19:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L++qaKYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F0C10EA31
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 19:08:10 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a3f5808b0dfso9216066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 11:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708628888; x=1709233688; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwGHver7Zdn7kvlDq1hFb/tIb6DJ0PWghCpxj29Cdaw=;
 b=L++qaKYWyyGGBQSi2yNzKiBROeeL6suAy/FgMikrWUNT8kf3mPX7Y7l1i5/4hTmLZk
 xYMzM2FRU+jjcToHmzgW8WyEzdQWJGJIGHCsZdjygDDcJECO465a248qsXSUeXJft/Fu
 igA65oQT4rTqYGrIhT+0v9k0hxmACT1YsQfoLx1+3mEe9Qq4fAyq6iLH6zajWzFVP2Ne
 M5IYEvYuCtAJllnxIyslROgF6AWJ06xNtsnWN0cyG4EGrcY3/GaAPfhyW7nRiVdvNfcb
 mNeCAzlI36909w47/9hlju0/5J9V4zIPYwQAJRsIEwansdS4UrtXusaR2rgCNzZRgTh/
 z6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708628888; x=1709233688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zwGHver7Zdn7kvlDq1hFb/tIb6DJ0PWghCpxj29Cdaw=;
 b=OXEqdXcY9Fd+0Zw+EhZvFUOi1qejsjrIdzu+vkFz8hQftLx/hPDp2ER6dcTX/sNf+3
 /NwfdXNG5ShQdjQtqra43bjSaNF6RumrqYZxx5Uf5Bz5JgNhTD8tiMar1jMqoGgTAE8F
 HdhfkF2vtuZ1sqzmMuQRlwRFmKCQTNUkm1259FhfwI0KVci5Cs54+xphfHavxx8uUc06
 GYCkfwVlbw0/lK62HAyxafEtwexsK2FCFGnUGnVDjAJPvOOQ126G+AjfOTd6d8B9zjNT
 8Tjjw2aguBnhGBB9am4QGzQukt909LrLDYO3iAQ1sz2DrgQKZhqkLHxK9hgZlQ21i+0p
 NqXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqv4pNW6PLCmWItNeA6UZ+HTCdGrWqjXg79rGGeW+VeVKxW3rE2uE6IpyIMaSG0RwKhm1LcyUjSSDMVVufQBIaf4mOLyufY/tDfB3BGriS
X-Gm-Message-State: AOJu0YyYPzJGB5L6ofqcrNC9DgrDP4j2KzWleFRnOXuQn9axFhK6jHoS
 jOF/OhnFNNFEQps0P2xzDU1PHGRXjaAkdnCmVsjtUgpLS7J2fJXT
X-Google-Smtp-Source: AGHT+IH07eQ34d4DdPWILOvpSPCbS9FOaWmp8ij6cDkZAQw5B9sGMqV+xWKbUWYZV2D0b3TvgKbqtg==
X-Received: by 2002:a17:906:aad1:b0:a3e:a3d6:eb6f with SMTP id
 kt17-20020a170906aad100b00a3ea3d6eb6fmr8035501ejb.48.1708628888412; 
 Thu, 22 Feb 2024 11:08:08 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 xg7-20020a170907320700b00a3d11feb32esm6145225ejb.186.2024.02.22.11.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 11:08:07 -0800 (PST)
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
Subject: Re: [PATCH v7 32/36] drm/sun4i: hdmi: Convert encoder to atomic
Date: Thu, 22 Feb 2024 20:08:05 +0100
Message-ID: <4545275.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-32-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-32-8f4af575fce2@kernel.org>
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

Dne =C4=8Detrtek, 22. februar 2024 ob 19:14:18 CET je Maxime Ripard napisal=
(a):
> The sun4i_hdmi driver still uses the non-atomic variants of the encoder
> hooks, so let's convert to their atomic equivalents.
>=20
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index 152375f3de2e..799a26215cc2 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -82,7 +82,8 @@ static int sun4i_hdmi_atomic_check(struct drm_encoder *=
encoder,
>  	return 0;
>  }
> =20
> -static void sun4i_hdmi_disable(struct drm_encoder *encoder)
> +static void sun4i_hdmi_disable(struct drm_encoder *encoder,
> +			       struct drm_atomic_state *state)
>  {
>  	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
>  	u32 val;
> @@ -96,7 +97,8 @@ static void sun4i_hdmi_disable(struct drm_encoder *enco=
der)
>  	clk_disable_unprepare(hdmi->tmds_clk);
>  }
> =20
> -static void sun4i_hdmi_enable(struct drm_encoder *encoder)
> +static void sun4i_hdmi_enable(struct drm_encoder *encoder,
> +			      struct drm_atomic_state *state)
>  {
>  	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mode;
>  	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
> @@ -120,9 +122,10 @@ static void sun4i_hdmi_enable(struct drm_encoder *en=
coder)
>  }
> =20
>  static void sun4i_hdmi_mode_set(struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode)
> +				struct drm_crtc_state *crtc_state,
> +				struct drm_connector_state *conn_state)
>  {
> +	const struct drm_display_mode *mode =3D &crtc_state->mode;
>  	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
>  	unsigned int x, y;
>  	u32 val;
> @@ -201,9 +204,9 @@ static enum drm_mode_status sun4i_hdmi_mode_valid(str=
uct drm_encoder *encoder,
> =20
>  static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs =3D=
 {
>  	.atomic_check	=3D sun4i_hdmi_atomic_check,
> -	.disable	=3D sun4i_hdmi_disable,
> -	.enable		=3D sun4i_hdmi_enable,
> -	.mode_set	=3D sun4i_hdmi_mode_set,
> +	.atomic_disable	=3D sun4i_hdmi_disable,
> +	.atomic_enable	=3D sun4i_hdmi_enable,
> +	.atomic_mode_set	=3D sun4i_hdmi_mode_set,
>  	.mode_valid	=3D sun4i_hdmi_mode_valid,
>  };
> =20
>=20
>=20




