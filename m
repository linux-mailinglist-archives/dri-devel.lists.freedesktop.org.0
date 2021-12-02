Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0673D465A71
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 01:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DC56E087;
	Thu,  2 Dec 2021 00:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB2B6E087
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 00:10:11 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id a11so32923927qkh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 16:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55WStG4Y7XlDovmlmdz+wvG6EaacgKrZKMN/wNUPDPc=;
 b=NlFNrvHDX4WGr/52aCDlG+suYiNBw8eVzKVICQV7J8Elq1W5jJyjHPnT/rvgT6XOA7
 vgsZQTED1c0q5GR7VRRuSLlaLQdHFnWtrmapHOMPSz4DfK1FrLrATzaSOkKooY3aCHSV
 ZumUeV+X0TEDlVR72CWqMttnlvY9+YcNt6OMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55WStG4Y7XlDovmlmdz+wvG6EaacgKrZKMN/wNUPDPc=;
 b=7UghgUt3FKUK0mgIrsJpl/SPIbykiq9ykqoF42Id25/P9Bj5k87JA+4BZqZ3ucKB6l
 jZPG6hAnA1w1ofDXF5Kt/g3Q9oYvYyKpOaN+kMP47g16ZYECL4+T0yZN+bhNyFGbjCDM
 v87tQOKWxp+Ra3CiAphHBWe/NSxfY1J26UFoyEpngDlLf4cjc7jy7PutHXcMo0dRF/QG
 Z5GTQ4daQJatJvmHH395G9CcfUFsB3Le9/uP0GXtYEmW0nEXu/aUjGRW57Hh+O0HpIyL
 eDFMgkjQ60Ce5EcRU4WogN19UFp3NpKmAF0IExoRO3j5IzyI98tmvDZGWz8+PvK2pXWY
 6iBA==
X-Gm-Message-State: AOAM530pwQwxx+B9r3I4IwqAHZgXQEofivvu6sdMcfmLsUKa/3qRsMqL
 6kbUZwwe7UcYNEMFs1AOCh7syd6bgUBXLt1LqWXLMQ==
X-Google-Smtp-Source: ABdhPJwnxcMhCHSmQbCaz9VZX6btqW3BmzytBcMVvCB83INeGr8SdIdEK+AnZ0JqT5Dl4lJC/zQNylftsh/c62mi930=
X-Received: by 2002:a37:e20d:: with SMTP id g13mr9677715qki.121.1638403810885; 
 Wed, 01 Dec 2021 16:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-4-yunfei.dong@mediatek.com>
In-Reply-To: <20211129034201.5767-4-yunfei.dong@mediatek.com>
From: Steve Cho <stevecho@chromium.org>
Date: Wed, 1 Dec 2021 16:10:00 -0800
Message-ID: <CAC-pXoNtM0CFp9iFtZLtgQ7ZG9VewXyk9wF66w6YcEE4skRghA@mail.gmail.com>
Subject: Re: [PATCH v11, 03/19] media: mtk-vcodec: Refactor vcodec pm interface
To: Yunfei Dong <yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Steve Cho <stevecho@chromium.org>

On Sun, Nov 28, 2021 at 7:44 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Using the needed param for pm init/release function and remove unused
> param mtkdev in 'struct mtk_vcodec_pm'.

nit: How about s/needed param/needed params |pdev| and |pm|/ ?


> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 22 ++++++++-----------
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  5 +++--
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  1 -
>  5 files changed, 15 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 055d50e52720..3ac4c3935e4e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -249,7 +249,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         if (IS_ERR(dev->fw_handler))
>                 return PTR_ERR(dev->fw_handler);
>
> -       ret = mtk_vcodec_init_dec_pm(dev);
> +       ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
>         if (ret < 0) {
>                 dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
>                 goto err_dec_pm;
> @@ -378,7 +378,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  err_dec_alloc:
>         v4l2_device_unregister(&dev->v4l2_dev);
>  err_res:
> -       mtk_vcodec_release_dec_pm(dev);
> +       mtk_vcodec_release_dec_pm(&dev->pm);
>  err_dec_pm:
>         mtk_vcodec_fw_release(dev->fw_handler);
>         return ret;
> @@ -418,7 +418,7 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
>                 video_unregister_device(dev->vfd_dec);
>
>         v4l2_device_unregister(&dev->v4l2_dev);
> -       mtk_vcodec_release_dec_pm(dev);
> +       mtk_vcodec_release_dec_pm(&dev->pm);
>         mtk_vcodec_fw_release(dev->fw_handler);
>         return 0;
>  }
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 6038db96f71c..20bd157a855c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -13,18 +13,15 @@
>  #include "mtk_vcodec_dec_pm.h"
>  #include "mtk_vcodec_util.h"
>
> -int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
> +int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
> +       struct mtk_vcodec_pm *pm)
>  {
>         struct device_node *node;
> -       struct platform_device *pdev;
> -       struct mtk_vcodec_pm *pm;
> +       struct platform_device *larb_pdev;
>         struct mtk_vcodec_clk *dec_clk;
>         struct mtk_vcodec_clk_info *clk_info;
>         int i = 0, ret = 0;
>
> -       pdev = mtkdev->plat_dev;
> -       pm = &mtkdev->pm;
> -       pm->mtkdev = mtkdev;
>         dec_clk = &pm->vdec_clk;
>         node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
>         if (!node) {
> @@ -32,13 +29,12 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>                 return -1;
>         }
>
> -       pdev = of_find_device_by_node(node);
> +       larb_pdev = of_find_device_by_node(node);
>         of_node_put(node);
> -       if (WARN_ON(!pdev)) {
> +       if (WARN_ON(!larb_pdev)) {
>                 return -1;
>         }
> -       pm->larbvdec = &pdev->dev;
> -       pdev = mtkdev->plat_dev;
> +       pm->larbvdec = &larb_pdev->dev;
>         pm->dev = &pdev->dev;
>
>         dec_clk->clk_num =
> @@ -82,10 +78,10 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>         return ret;
>  }
>
> -void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
> +void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
>  {
> -       pm_runtime_disable(dev->pm.dev);
> -       put_device(dev->pm.larbvdec);
> +       pm_runtime_disable(pm->dev);
> +       put_device(pm->larbvdec);
>  }
>
>  int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> index 280aeaefdb65..a3df6aef6cb9 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> @@ -9,8 +9,9 @@
>
>  #include "mtk_vcodec_drv.h"
>
> -int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
> -void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
> +int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
> +       struct mtk_vcodec_pm *pm);
> +void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
>
>  int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
>  void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 1d2370608d0d..0fa9d85114b9 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -195,7 +195,6 @@ struct mtk_vcodec_pm {
>         struct mtk_vcodec_clk   venc_clk;
>         struct device   *larbvenc;
>         struct device   *dev;
> -       struct mtk_vcodec_dev   *mtkdev;
>  };
>
>  /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 1b2e4930ed27..0c8c8f86788c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -26,7 +26,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>         pdev = mtkdev->plat_dev;
>         pm = &mtkdev->pm;
>         memset(pm, 0, sizeof(struct mtk_vcodec_pm));
> -       pm->mtkdev = mtkdev;
>         pm->dev = &pdev->dev;
>         dev = &pdev->dev;
>         enc_clk = &pm->venc_clk;
> --
> 2.25.1
>
