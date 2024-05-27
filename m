Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089A18CF865
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 06:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A6A10E743;
	Mon, 27 May 2024 04:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RVnvr+xt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A696B10E743
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 04:34:26 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-4e15ac35809so3065752e0c.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 21:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716784465; x=1717389265;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDSR6I/z63VDajsQQN7lrfz6LEymcq9DFpREoQqrhJs=;
 b=RVnvr+xt7NFzS1qUzUYZhp43JggrZ5M1BXH9cXX6+6G53Dze6/gpL9jcO4m9zWFOIo
 w3biPers2k66wpIABK121Tckj6jacp+IiFtdXAK/8pGPaUWjkv53RUBdmjarjlb2SAQR
 5Mi7H0pt47LHtgiaBBLKiNLwIMNODMseiVn/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716784465; x=1717389265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDSR6I/z63VDajsQQN7lrfz6LEymcq9DFpREoQqrhJs=;
 b=nMf1Tng3zCIrJqvsUQ8S9xrS8v7oSHVl/5UAhQTKmnkyQEH9DCdZcaa0aUyflR3dTQ
 JOPF3XdjlFuDGn+VaLe+hyDrlvmSwoBvlOuZDDEHO3szcBarzTxyrXVdTUY3nSx290zW
 KIyUnsiN+ubtwbZW8GmVG6t7vdIfHpQeSOuXtPGo09BGYhhGWDU0WFA0sSqFCeFNDSXs
 WcjY5+w0BCasREwuD0jQE96EicDqUfcCY3tLc6/TW23B3qPPB0X4lyU5VyO3sQxuKdtl
 DNwHaltqYtlqtzOdRkGI8Jee5yRqrkb4tiKfglt4JTrSkhONHbUCogfRfgZRSBixXP26
 Nc0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOFNN5UUstOohd1hRqz9a84VgZ7dkmguyFrz/TIuqGzOiyJcRK6nrwX6KgcrwbaMbHJmz92OyuuiWKG+cuGNd8F8UOs586ZIQxgXU6THJI
X-Gm-Message-State: AOJu0YxrP9cIpS/Zxd/lJusBgWSMpYaklGz8FFRjnfKFGOvwnBiMDnSe
 fW7OWkQtHMnhl+YKc5h4Qfxw/nPI1qDbkL4OkcD+xLSaliPiB7MnXw0wEV55+QvwtFyJDRLjS3W
 Fng==
X-Google-Smtp-Source: AGHT+IEvkzsfcc+FczOcqXvypcdnP9lKw10+7PvpPpQCgYPxunRLd7tVYtXZX0fVXeC6g83RxfTYfg==
X-Received: by 2002:a67:e309:0:b0:47e:f475:940a with SMTP id
 ada2fe7eead31-48a387035c2mr8180875137.34.1716784464871; 
 Sun, 26 May 2024 21:34:24 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-804dae24956sm844625241.36.2024.05.26.21.34.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 May 2024 21:34:24 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-48a39a3b10dso746051137.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 21:34:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVU5D5jeOWRh7/VKodcHOHpyCJFdV9IztMHxKWpux92eXFvt/d4TPtEA5Mm+paF9PY5Vn6vr4zCUpVCKLBGBuBbXB5QrOypItPBWn4/Q/Hk
X-Received: by 2002:a05:6102:c09:b0:48a:5a8d:ef7b with SMTP id
 ada2fe7eead31-48a5a8df099mr2798098137.5.1716784462303; Sun, 26 May 2024
 21:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-6-shawn.sung@mediatek.com>
In-Reply-To: <20240502103848.5845-6-shawn.sung@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 27 May 2024 12:33:46 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngUh-o107YM8zEu-ebaP7+eaO1x6SsZ6OeRxrH5YgFKxw@mail.gmail.com>
Message-ID: <CAC=S1ngUh-o107YM8zEu-ebaP7+eaO1x6SsZ6OeRxrH5YgFKxw@mail.gmail.com>
Subject: Re: [PATCH v7 05/18] drm/mediatek: Set DRM mode configs accordingly
To: Shawn Sung <shawn.sung@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 "Nancy . Lin" <nancy.lin@mediatek.com>, Sean Paul <sean@poorly.run>, 
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi Shawn,

On Thu, May 2, 2024 at 6:39=E2=80=AFPM Shawn Sung <shawn.sung@mediatek.com>=
 wrote:
>
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
>
> Set DRM mode configs limitation according to the hardware capabilities
> and pass the IGT checks as below:
>
> - The test "graphics.IgtKms.kms_plane" requires a frame buffer with
>   width of 4512 pixels (> 4096).
> - The test "graphics.IgtKms.kms_cursor_crc" checks if the cursor size is
>   defined, and run the test with cursor size from 1x1 to 512x512.
>
> Please notice that the test conditions may change as IGT is updated.
>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h |  4 ++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 8e047043202b4..c9cad3a827376 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -294,6 +294,9 @@ static const struct mtk_mmsys_driver_data mt8188_vdos=
ys0_driver_data =3D {
>         .conn_routes =3D mt8188_mtk_ddp_main_routes,
>         .num_conn_routes =3D ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
>         .mmsys_dev_num =3D 2,
> +       .max_width =3D 8191,
> +       .min_width =3D 1,
> +       .min_height =3D 1,
>  };
>
>  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =3D {
> @@ -308,6 +311,9 @@ static const struct mtk_mmsys_driver_data mt8195_vdos=
ys0_driver_data =3D {
>         .main_path =3D mt8195_mtk_ddp_main,
>         .main_len =3D ARRAY_SIZE(mt8195_mtk_ddp_main),
>         .mmsys_dev_num =3D 2,
> +       .max_width =3D 8191,
> +       .min_width =3D 1,
> +       .min_height =3D 1,
>  };
>
>  static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data =3D=
 {
> @@ -315,6 +321,9 @@ static const struct mtk_mmsys_driver_data mt8195_vdos=
ys1_driver_data =3D {
>         .ext_len =3D ARRAY_SIZE(mt8195_mtk_ddp_ext),
>         .mmsys_id =3D 1,
>         .mmsys_dev_num =3D 2,
> +       .max_width =3D 8191,
> +       .min_width =3D 2, /* 2-pixel align when ethdr is bypassed */
> +       .min_height =3D 1,
>  };
>
>  static const struct of_device_id mtk_drm_of_ids[] =3D {
> @@ -493,6 +502,15 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                 for (j =3D 0; j < private->data->mmsys_dev_num; j++) {
>                         priv_n =3D private->all_drm_private[j];
>
> +                       if (priv_n->data->max_width)
> +                               drm->mode_config.max_width =3D priv_n->da=
ta->max_width;
> +
> +                       if (priv_n->data->min_width)
> +                               drm->mode_config.min_width =3D priv_n->da=
ta->min_width;
> +
> +                       if (priv_n->data->min_height)
> +                               drm->mode_config.min_height =3D priv_n->d=
ata->min_height;
> +
>                         if (i =3D=3D CRTC_MAIN && priv_n->data->main_len)=
 {
>                                 ret =3D mtk_crtc_create(drm, priv_n->data=
->main_path,
>                                                       priv_n->data->main_=
len, j,
> @@ -520,6 +538,10 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                 }
>         }
>
> +       /* IGT will check if the cursor size is configured */
> +       drm->mode_config.cursor_width =3D drm->mode_config.max_width;
> +       drm->mode_config.cursor_height =3D drm->mode_config.max_height;

I think you shouldn't set the cursor size to the maximum plane size.
As you mentioned in the commit message, IGT tests the cursor sizes
from 1x1 to 512x512, so just setting them to 512 (with a macro) should
be enough.

Currently this tells the userspace "the supported cursor plane size is
up to 4096x8191" on MT8195 and MT8188.
That means the userspace may allocate a buffer with 4096*8191*4 ~=3D
128MB for the cursor plane in the worst case, and most of the buffer
will be wasted.
Note that the default value for DRM_CAP_CURSOR_WIDTH is 64.

In practice, when applying this on the MT8188 Chromebook, I see the
userspace allocates two 64MB buffers for the cursor plane.
But if I limit the cursor size to 512, the userspace only allocates
two 1MB buffers i.e. 126MB is optimized for the DMA buffer allocation.

Regards,
Fei


>
> +
>         /* Use OVL device for all DMA memory allocations */
>         crtc =3D drm_crtc_from_index(drm, 0);
>         if (crtc)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.h
> index 78d698ede1bf8..6cfa790e8df5c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -46,6 +46,10 @@ struct mtk_mmsys_driver_data {
>         bool shadow_register;
>         unsigned int mmsys_id;
>         unsigned int mmsys_dev_num;
> +
> +       int max_width;
> +       int min_width;
> +       int min_height;
>  };
>
>  struct mtk_drm_private {
> --
> 2.18.0
>
