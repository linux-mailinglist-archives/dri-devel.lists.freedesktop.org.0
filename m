Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0436B288DB
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 01:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF1A10E036;
	Fri, 15 Aug 2025 23:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fXlAoaa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B41310E036
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 23:39:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 886875C6EBA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 23:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B6BC4CEFE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 23:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755301175;
 bh=wwsSHz9qW4HM4CvVm/6W9nFKkjnMGwSQT3gsML0+kno=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fXlAoaa6w8xqcofARSS/N8y05yEbcphTUhiWFoaMVITF4PxyPC6AYCZASz2KFEx8s
 ZLlYPVHeFJSrwgNX0JP4fE6QdLc89NfU0NWS+ibkoliEcEC0/qxm0jVMd32aVVayq8
 WXrVqsrk29ADEKvaUuJUSs02DPL80IBbM1K6hG9mfmP8qGrFQGHrQZN33BvFZFEiA1
 lHLqyyTJqj6GXhbvxpC8xTOlUvrugsnAnxh3b/adhETv08buY733krSHpYLFsZ80Wl
 H2ITKOpmeIJXOqqlws+6QXeqvN1n/GztLeK9zrIGLZK1xRaP2KpyaDDC+Dgu4NgRYc
 JYaUjnuUbvlrQ==
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b4716fb8e74so2154262a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 16:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVy4m/0ogp1vTXkgvj2/w6rX9TkXfhaBHarxIvYV4K/V+AQv2QPG7exoOOnexacM0OGKHM9weuoYsI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbWZTGw7kAPRPuWdaXOkxansp4AABHphKbljG+rjAUbLM3uhW7
 Klxaf3XQeYm7O/QXYUqwpBD1Ol8j4xogfZTHAz4ZCyb2TkbD4YDumABg1SZfUvcIMvMo4Txd8UU
 xMYhllW2poPHFQsU23HVO7BPWVLsKAg==
X-Google-Smtp-Source: AGHT+IF3UhjPzI/NY7tWC6HSMCDlAaXInyJ/IGmu2yTEf5VazKwog6umahYLBkhkXktfxZh67B39CKu2Ii3gsJIura0=
X-Received: by 2002:a17:903:b87:b0:240:80f:228e with SMTP id
 d9443c01a7336-2446d93d8dbmr54840315ad.52.1755301174432; Fri, 15 Aug 2025
 16:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250812071932.471730-1-make24@iscas.ac.cn>
In-Reply-To: <20250812071932.471730-1-make24@iscas.ac.cn>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Aug 2025 07:40:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_91C=5YDk1qcU3Dir6TqtN17kgjzTzr=XYRNPHGvQwSgA@mail.gmail.com>
X-Gm-Features: Ac12FXzKVkel4FRxgngT7H7BLJAi1wo2-ssfsabNu9COZ3np_6DfRlSEuXQhYKk
Message-ID: <CAAOTY_91C=5YDk1qcU3Dir6TqtN17kgjzTzr=XYRNPHGvQwSgA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Fix device/node reference count leaks in
 mtk_drm_get_all_drm_priv
To: Ma Ke <make24@iscas.ac.cn>
Cc: ck.hu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, nancy.lin@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 akpm@linux-foundation.org, stable@vger.kernel.org
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

Ma Ke <make24@iscas.ac.cn> =E6=96=BC 2025=E5=B9=B48=E6=9C=8812=E6=97=A5 =E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Using device_find_child() and of_find_device_by_node() to locate
> devices could cause an imbalance in the device's reference count.
> device_find_child() and of_find_device_by_node() both call
> get_device() to increment the reference count of the found device
> before returning the pointer. In mtk_drm_get_all_drm_priv(), these
> references are never released through put_device(), resulting in
> permanent reference count increments. Additionally, the
> for_each_child_of_node() iterator fails to release node references in
> all code paths. This leaks device node references when loop
> termination occurs before reaching MAX_CRTC. These reference count
> leaks may prevent device/node resources from being properly released
> during driver unbind operations.
>
> As comment of device_find_child() says, 'NOTE: you will need to drop
> the reference with put_device() after use'.
>
> Found by code review.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Cc: stable@vger.kernel.org
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - added goto labels as suggestions.
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index d5e6bab36414..f8a817689e16 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -387,19 +387,19 @@ static bool mtk_drm_get_all_drm_priv(struct device =
*dev)
>
>                 of_id =3D of_match_node(mtk_drm_of_ids, node);
>                 if (!of_id)
> -                       continue;
> +                       goto next_put_node;
>
>                 pdev =3D of_find_device_by_node(node);
>                 if (!pdev)
> -                       continue;
> +                       goto next_put_node;
>
>                 drm_dev =3D device_find_child(&pdev->dev, NULL, mtk_drm_m=
atch);
>                 if (!drm_dev)
> -                       continue;
> +                       goto next_put_device_pdev_dev;
>
>                 temp_drm_priv =3D dev_get_drvdata(drm_dev);
>                 if (!temp_drm_priv)
> -                       continue;
> +                       goto next_put_device_drm_dev;
>
>                 if (temp_drm_priv->data->main_len)
>                         all_drm_priv[CRTC_MAIN] =3D temp_drm_priv;
> @@ -411,10 +411,17 @@ static bool mtk_drm_get_all_drm_priv(struct device =
*dev)
>                 if (temp_drm_priv->mtk_drm_bound)
>                         cnt++;
>
> -               if (cnt =3D=3D MAX_CRTC) {
> -                       of_node_put(node);
> +next_put_device_drm_dev:
> +               put_device(drm_dev);
> +
> +next_put_device_pdev_dev:
> +               put_device(&pdev->dev);
> +
> +next_put_node:
> +               of_node_put(node);
> +
> +               if (cnt =3D=3D MAX_CRTC)
>                         break;
> -               }
>         }
>
>         if (drm_priv->data->mmsys_dev_num =3D=3D cnt) {
> --
> 2.25.1
>
