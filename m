Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B37F8B933B
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 04:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224D910EE1F;
	Thu,  2 May 2024 02:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="T7MNumLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788A310EE1F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 02:02:14 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-61be613d903so34255237b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 19:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714615333; x=1715220133;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76dSmhZB4phOsT7iSnl74lYmF+SI8oA0BM3OrZy9mg8=;
 b=T7MNumLZRPMSN5VAtcruCMkycfJ+cdAnLmQacF0vfqm1rDuUy7izrcaZBtxaAmjJ0K
 7GbL6FbprqIV0nfApW1NFc3x10mkAJZIgvExZlA7jLeFNMN2fn7uKsMgwA1ibV4OQXzj
 EBzW32ngb+VnEh/ZdYoiN1KWfjF0oaCmKYmts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714615333; x=1715220133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76dSmhZB4phOsT7iSnl74lYmF+SI8oA0BM3OrZy9mg8=;
 b=iB1KH0+LB9cEwV1KOz56hz6xrAab+YEYktpMCy/Are6FV1EWJciWwpOoHsfveY9iBw
 lGqdgvE6vRgJ3eoYtIzvhzOlgOGitvIl65G6W2dBhr02VlTd2o5x2BS5a2a+YU9gAYEL
 aqTDAvUTCJbREvvB7kFiYMhQfJgalwf6egcN3iwTfCRSKbJYqWNl6ZuLegBp4/NrdNBi
 +zuzs+Tu9Zp0zalUEr5zvb1cXo4pax5eQbYRen5uyKqsGfOkqOt1sL79dJvC/9MHXM8S
 PJpR4Z7ShWuL7UB6ekscBzszBKV8JiGXmgSBxwIFp8m69Bweub2O0k4HUpp2c/SiY5kj
 wc5Q==
X-Gm-Message-State: AOJu0Yyo0XGesYp78P3vJq3duIF0Du5TYVBekO80jnYmNS+/pCspvKwW
 i5KNkUUGpDgSRDajSeRvMAc00CN2X6BRdJ+lKgeLgWrcL0h8sAoBlxI4UN2AzcojHqgfiNL5SPq
 iDR9oxr9MlSPJXWAKi3z9WUiiYdQ/CLjqtQQI
X-Google-Smtp-Source: AGHT+IExl+tcufb6t7c4yJz9ebkEHK3K6nYA/QtGcs5Vq56mlDd2KfnoD59gSUYdLAhmtNl7eGau6Z543KltHBzyi/U=
X-Received: by 2002:a05:690c:108:b0:611:1861:1f0 with SMTP id
 bd8-20020a05690c010800b00611186101f0mr4864954ywb.52.1714615333167; Wed, 01
 May 2024 19:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240502004033.107533-1-maaz.mombasawala@broadcom.com>
In-Reply-To: <20240502004033.107533-1-maaz.mombasawala@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 1 May 2024 22:02:02 -0400
Message-ID: <CABQX2QN1iOGoADT==EfMRif5ZmEGwR1u2+nzkM1DLiaeQUmOyA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Stop using dev_private to store driver data.
To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 ian.forbes@broadcom.com, martin.krastev@broadcom.com
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

On Wed, May 1, 2024 at 8:41=E2=80=AFPM Maaz Mombasawala
<maaz.mombasawala@broadcom.com> wrote:
>
> Currently vmwgfx uses the dev_private opaque pointer in drm_device to sto=
re
> driver data in vmw_private struct. Using dev_private is deprecated, and t=
he
> recommendation is to embed struct drm_device in the larger per-device
> structure.
>
> The vmwgfx driver already embeds struct drm_device in its struct
> vmw_private, so switch to using that exclusively and stop using
> dev_private.
>
> Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 4 ++--
>  3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index bdad93864b98..97e48e93dbbf 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -858,8 +858,6 @@ static int vmw_driver_load(struct vmw_private *dev_pr=
iv, u32 pci_id)
>         bool refuse_dma =3D false;
>         struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>
> -       dev_priv->drm.dev_private =3D dev_priv;
> -
>         vmw_sw_context_init(dev_priv);
>
>         mutex_init(&dev_priv->cmdbuf_mutex);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 4ecaea0026fc..df89e468a1fc 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -638,7 +638,7 @@ static inline struct vmw_surface *vmw_res_to_srf(stru=
ct vmw_resource *res)
>
>  static inline struct vmw_private *vmw_priv(struct drm_device *dev)
>  {
> -       return (struct vmw_private *)dev->dev_private;
> +       return container_of(dev, struct vmw_private, drm);
>  }
>
>  static inline struct vmw_private *vmw_priv_from_ttm(struct ttm_device *b=
dev)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index 13b2820cae51..b3f0fb6828de 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -276,7 +276,7 @@ static void vmw_du_put_cursor_mob(struct vmw_cursor_p=
lane *vcp,
>  static int vmw_du_get_cursor_mob(struct vmw_cursor_plane *vcp,
>                                  struct vmw_plane_state *vps)
>  {
> -       struct vmw_private *dev_priv =3D vcp->base.dev->dev_private;
> +       struct vmw_private *dev_priv =3D vmw_priv(vcp->base.dev);
>         u32 size =3D vmw_du_cursor_mob_size(vps->base.crtc_w, vps->base.c=
rtc_h);
>         u32 i;
>         u32 cursor_max_dim, mob_max_size;
> @@ -515,7 +515,7 @@ void vmw_du_cursor_plane_destroy(struct drm_plane *pl=
ane)
>         struct vmw_cursor_plane *vcp =3D vmw_plane_to_vcp(plane);
>         u32 i;
>
> -       vmw_cursor_update_position(plane->dev->dev_private, false, 0, 0);
> +       vmw_cursor_update_position(vmw_priv(plane->dev), false, 0, 0);
>
>         for (i =3D 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++)
>                 vmw_du_destroy_cursor_mob(&vcp->cursor_mobs[i]);
> --
> 2.34.1
>

Looks good.
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
