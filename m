Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1AB934B2D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 11:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24C210E64B;
	Thu, 18 Jul 2024 09:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mJcgCqAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A195910E64B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 09:51:16 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-4926a2cd44aso175618137.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 02:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721296275; x=1721901075;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RynWyZj/Mk6W2PWFZ6UdeaZvnGfxuKvGDrjfGdoRyoQ=;
 b=mJcgCqAXm1M8U4AHdhlXivSFzPhBZ/FmgtgkjoGgWQ01oJJJYrs4+6R1WI8J7/5+tu
 Pb03cEXDLcyqj00JEpZ+USnn/Y/li7JqwVIB0s/14wVvLcjMas69MoMouy+YDtC10+nj
 xhbVvlQOW6rTYUGwuLlc8WikmHSICcx6sOXtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721296275; x=1721901075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RynWyZj/Mk6W2PWFZ6UdeaZvnGfxuKvGDrjfGdoRyoQ=;
 b=huXJfPSFkAS6LSU+KaQXSGiDoM/n76NE9Ku8HUNuIfx+4zttrYUQVJHY1l5VJ57uAy
 v2ziuz+doIbHrtr/TZ1hSMzUdYfB5DMZGO1HPIZ5zCp30LHfy6o0dqHrCVYUtGaYNkvP
 OlmoCFfWM4V5jo3rJcIfB6lICIAAFHur0gC/pDvnKSYYSUVeAagWVGMUNyiH2/8KbsDs
 TNoR5BaNPiPJjOPYFKjwEvTem6O19iRf//tNKzVP1AFckP2lpa7bo5ddDKYs/OC3qiKE
 mYKaCHTa9+Q1DQ8QrAts2tUAKtxEff1qCeMRSyLR9A8j1ctVZFvyeYKXYFuxnnPNNvEP
 basw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2ayDDpaQLclSlh7AKFvdkU5Mp0+w/PWWXtKTd1KGrqBWJSRCAb/2cSAuAxZSdus4p2cVuAJ3tNr+B3mm8h4a9u7t/4Hk+gPQD33vjreuY
X-Gm-Message-State: AOJu0Yw4ke9pIQmzidUQ+9WYSN7D/HtbVrFMyXoBda2rDygzDw/KrzXs
 waBTuIZPmOJLalY+Ht+0up3sCuGXuf56fKEVJ6qzt5IDpV2KwZ8mWw/piEiHxCdUv7o4Iycc+1t
 pgg==
X-Google-Smtp-Source: AGHT+IFWS50UOAVxuea88k1XJZsMpQ6ZPPE/7UoDdVTl9oRe4kpqIcp5zKziGWhrAemkPsmO2ZdT8Q==
X-Received: by 2002:a67:e7c6:0:b0:48f:e8e5:f185 with SMTP id
 ada2fe7eead31-49159734075mr6280468137.1.1721296275300; 
 Thu, 18 Jul 2024 02:51:15 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-49156115ed6sm763671137.19.2024.07.18.02.51.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 02:51:15 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-4e1c721c040so216181e0c.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 02:51:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUw1rDnSXVthX4NeTzW0L95DtvQNs0kAENr75/54vGY0PTUaz65K0GPEdfeTAlNQ0Y8t6+nBC/dJlR/RuNdsf1wAUFKFbWeKCdJAus12y9
X-Received: by 2002:a05:6122:a0b:b0:4f2:ff08:ba3c with SMTP id
 71dfb90a1353d-4f4df688321mr6001081e0c.5.1721296273968; Thu, 18 Jul 2024
 02:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 18 Jul 2024 17:50:37 +0800
X-Gmail-Original-Message-ID: <CAC=S1njFSULdpTefLpb8biEUARVH4c_dZndUav_S-6D-bstn6w@mail.gmail.com>
Message-ID: <CAC=S1njFSULdpTefLpb8biEUARVH4c_dZndUav_S-6D-bstn6w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Declare Z Position for all planes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 daniel@ffwll.ch, matthias.bgg@gmail.com, shawn.sung@mediatek.com, 
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 18, 2024 at 4:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek SoCs support multiple planes, one of which is the primary
> and all the others are overlays (and CURSOR is the last overlay).
>
> In all currently supported SoCs, the Z order of the overlays can't
> be changed with any fast muxing action, and can only be changed by
> swapping the contents of the entire register set of one overlay
> with the other to internally reorder the layer properties, which
> is indeed feasible, but probably more expensive than desired.
>
> Declare the Z position for all planes with an immutable property
> at least for now, so that the userspace can take its decisions
> accordingly.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c  |  2 +-
>  drivers/gpu/drm/mediatek/mtk_plane.c | 18 +++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_plane.h |  3 +--
>  3 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 072b2fdae87b..327214721b4d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -874,7 +874,7 @@ static int mtk_crtc_init_comp_planes(struct drm_devic=
e *drm_dev,
>                                 mtk_crtc_plane_type(mtk_crtc->layer_nr, n=
um_planes),
>                                 mtk_ddp_comp_supported_rotations(comp),
>                                 mtk_ddp_comp_get_formats(comp),
> -                               mtk_ddp_comp_get_num_formats(comp));
> +                               mtk_ddp_comp_get_num_formats(comp), i);
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/media=
tek/mtk_plane.c
> index 5bf757a3ef20..7d2cb4e0fafa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_plane.c
> @@ -321,7 +321,7 @@ static const struct drm_plane_helper_funcs mtk_plane_=
helper_funcs =3D {
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
>                    unsigned int supported_rotations, const u32 *formats,
> -                  size_t num_formats)
> +                  size_t num_formats, unsigned int plane_idx)
>  {
>         int err;
>
> @@ -338,6 +338,22 @@ int mtk_plane_init(struct drm_device *dev, struct dr=
m_plane *plane,
>                 return err;
>         }
>
> +       /*
> +        * The hardware does not support repositioning planes by muxing: =
their
> +        * Z-position is infact fixed and the only way to change the actu=
al
> +        * order is to swap the contents of the entire register set of on=
e
> +        * overlay with another, which may be more expensive than desired=
.
> +        *
> +        * With no repositioning, the caller of this function guarantees =
that
> +        * the plane_idx is correct. This means that, for example, the PR=
IMARY
> +        * plane fed to this function will always have plane_idx zero.
> +        */
> +       err =3D drm_plane_create_zpos_immutable_property(plane, plane_idx=
);
> +       if (err) {
> +               DRM_ERROR("Failed to create zpos property for plane %u\n"=
, plane_idx);
> +               return err;
> +       }
> +
>         if (supported_rotations) {
>                 err =3D drm_plane_create_rotation_property(plane,
>                                                          DRM_MODE_ROTATE_=
0,
> diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/media=
tek/mtk_plane.h
> index 231bb7aac947..5b177eac67b7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_plane.h
> @@ -49,6 +49,5 @@ to_mtk_plane_state(struct drm_plane_state *state)
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
>                    unsigned int supported_rotations, const u32 *formats,
> -                  size_t num_formats);
> -
> +                  size_t num_formats, unsigned int plane_idx);
>  #endif
> --
> 2.45.2
>
>
