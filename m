Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E35860247
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF83E10EA36;
	Thu, 22 Feb 2024 19:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BWlSeVMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D942F10EA36
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 19:09:02 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d0a4e1789cso1699421fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 11:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708628941; x=1709233741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gj4OdywnDrbhFJ8ybCj43LZc89cJ1Nm8au4Dqi6GFss=;
 b=BWlSeVMx6hJcWa/BEEV8d+1zlxThBrdNAmlWjIP0vT1lmBypRorACW/E39uJHva94v
 7ZMXjBsFW6QACSFMkjaX7IiGyI3QPkgXymSfuCptgDWlnzhj2C8qsZHkGHeL/eCJpF3H
 Mb1ETQ+Z4qrYc2g71hUpj6uQEamFP76eNVkOIKX1yasjoPJoovXaRgCZrplW/4P2jof2
 ZYBOZjj5gMoh+MPJdQDOAiDnYPapQfX2ztN+K3zTYzmtVZzSsYBroc7+kshQIVMckxkE
 5QWldh8hkkSinSB6hAfT1v+6czGz6Ya84MiB/blrn5t3peeUpVa+lZzBzSzMIAszz68V
 al/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708628941; x=1709233741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gj4OdywnDrbhFJ8ybCj43LZc89cJ1Nm8au4Dqi6GFss=;
 b=SZMAKOf86alrG7kv6AeKqzQFyozu87EBu2+IaAHNfcE4ref1H+jE44xcysUqOejBVw
 DE0wfNcHpLBXzGqQyoU0ludQrBeUsPJsUlT9jw0LusK8ns6jqcTrPkX5PuyqoNlj0nGK
 ks5cytcIQFmxiFwc7AaXkQkcQtgBAkjVOcj+dof3WiZfvp34KvhOD2AdSi/VHcvi+Wt1
 2UMOQVnSEWTnEcm5ROvKFJjvA81SDXwV1uNONfNwFXMZj39dnTT5gWSmQWQAy4Wr9RLa
 2YMOe7y1FcKdXseREcYtM8O1sOpH43qBQnf6BDekOHVlLTcg7peWph872UyXrZmYJGkq
 6lnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt4WgbDHlGQsj57XQDzH8J09dABSZfnEkLq0tmlBGIBiajLO4fEGcEInwliXZnfa5w4Jas05gJTSojgTDH+A8kmPNeT+Qysf/mPbwpfjK+
X-Gm-Message-State: AOJu0Yxvps6EI993j/LvQzolLqBLvsgvL0Oa6uQ0EhkXxqulPvOw0RwO
 WE73sB4a+jcwcvGo4WHeZyg9tMaRzGC1yYZf0ofmCVPPtquwv4H0
X-Google-Smtp-Source: AGHT+IHe4b3hq/UBTGy8TGAsD8s1quxqZkNvTf7s10vKGsFhX0a+cS0Vaxi79AU03ziWQo+MQ29JhA==
X-Received: by 2002:a05:651c:210f:b0:2d2:6574:4011 with SMTP id
 a15-20020a05651c210f00b002d265744011mr1451054ljq.30.1708628940711; 
 Thu, 22 Feb 2024 11:09:00 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 g14-20020a056402428e00b005642bcfed99sm5293270edc.23.2024.02.22.11.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 11:09:00 -0800 (PST)
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
Subject: Re: [PATCH v7 34/36] drm/sun4i: hdmi: Switch to container_of_const
Date: Thu, 22 Feb 2024 20:08:58 +0100
Message-ID: <2172115.irdbgypaU6@jernej-laptop>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-34-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-34-8f4af575fce2@kernel.org>
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

Dne =C4=8Detrtek, 22. februar 2024 ob 19:14:20 CET je Maxime Ripard napisal=
(a):
> container_of_const() allows to preserve the pointer constness and is
> thus more flexible than inline functions.
>=20
> Let's switch all our instances of container_of() to container_of_const().
>=20
> Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index bae69d696765..c276d984da6b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -30,19 +30,11 @@
>  #include "sun4i_drv.h"
>  #include "sun4i_hdmi.h"
> =20
> -static inline struct sun4i_hdmi *
> -drm_encoder_to_sun4i_hdmi(struct drm_encoder *encoder)
> -{
> -	return container_of(encoder, struct sun4i_hdmi,
> -			    encoder);
> -}
> +#define drm_encoder_to_sun4i_hdmi(e)		\
> +	container_of_const(e, struct sun4i_hdmi, encoder)
> =20
> -static inline struct sun4i_hdmi *
> -drm_connector_to_sun4i_hdmi(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct sun4i_hdmi,
> -			    connector);
> -}
> +#define drm_connector_to_sun4i_hdmi(c)		\
> +	container_of_const(c, struct sun4i_hdmi, connector)
> =20
>  static int sun4i_hdmi_setup_avi_infoframes(struct sun4i_hdmi *hdmi,
>  					   struct drm_display_mode *mode)
>=20
>=20




