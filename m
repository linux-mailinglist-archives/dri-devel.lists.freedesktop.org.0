Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664B080969B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 00:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167A910E13D;
	Thu,  7 Dec 2023 23:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA7710E13D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 23:32:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3C09ACE258B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 23:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06B2C433CB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 23:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701991930;
 bh=C/W5Zqmm3kI2CHjWroHcjD9PIpXCfj28AU66trdDTUM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d+yTdQC4dTkX9Gr/sFWB02o7o7wyinsoIGO7q3AGOPK3ieUcmiwO/zr9nNcX095N4
 wLWTs14qPYf1jwm/rVHBI6V77ZbFaEVADKJdgr5Uwsk+U753ad+M9BqYSjUCxpTE4X
 1VesagEAATWfxPLUe31lVDzFaX+Y9Hs9LCDmyu/+LNRo69p3gE6ol+ANKZnsBsPd87
 lwDmZfusP93IVMch4/L0N7H/3WlppJgjXXGVUm0JyJ3yL50TI82Thj4guZbw//ftGt
 U3prV3km6go6hodv9yErhFeLDLEp24Tkz7Zj2HEyKNJ+vATvX6MFSe5V9C1EWOxo57
 edwKNNuVh/4iw==
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2c9c18e7990so19689521fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 15:32:10 -0800 (PST)
X-Gm-Message-State: AOJu0YwtKvP9m83MQfKP0ZPYSPz1kTF+3gAkOwvubQ65zXGVHz93EOyE
 5q55/1D1aB0VaQPkJLckIsZ+DArwkS9/1e7avQ==
X-Google-Smtp-Source: AGHT+IEXkXUCSw2a+d4ytwMlKqOGSXhd9HUHp4O6aHLJqy1GBZczWauiJZgZq9F9PdRnsM1RFPLW0gm/6S/wwTE4IGA=
X-Received: by 2002:a2e:804a:0:b0:2cb:20f0:b869 with SMTP id
 p10-20020a2e804a000000b002cb20f0b869mr95776ljg.12.1701991928954; Thu, 07 Dec
 2023 15:32:08 -0800 (PST)
MIME-Version: 1.0
References: <fd1b62aa006556f29f37535814abfe41be63f7ae.1700746094.git.robin.murphy@arm.com>
In-Reply-To: <fd1b62aa006556f29f37535814abfe41be63f7ae.1700746094.git.robin.murphy@arm.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 8 Dec 2023 07:31:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9HG_Y+vJ4g_V+5DXEFsPP=2vudyxbhcrTXYKn0E=9sLQ@mail.gmail.com>
Message-ID: <CAAOTY_9HG_Y+vJ4g_V+5DXEFsPP=2vudyxbhcrTXYKn0E=9sLQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Stop using iommu_present()
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: chunkuang.hu@kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, yong.wu@mediatek.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Robin:

Robin Murphy <robin.murphy@arm.com> =E6=96=BC 2023=E5=B9=B411=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Remove the pointless check. If an IOMMU is providing transparent DMA API
> ops for any device(s) we care about, the DT code will have enforced the
> appropriate probe ordering already. And if the IOMMU *is* entirely
> absent, then attempting to go ahead with CMA and either suceeding or
> failing decisively seems more useful than deferring forever.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>
> I realised that last time I sent this I probably should have CCed a
> wider audience of reviewers, so here's one with an updated commit
> message as well to make the resend more worthwhile.
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 2dfaa613276a..48581da51857 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -5,7 +5,6 @@
>   */
>
>  #include <linux/component.h>
> -#include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> @@ -608,9 +607,6 @@ static int mtk_drm_bind(struct device *dev)
>         struct drm_device *drm;
>         int ret, i;
>
> -       if (!iommu_present(&platform_bus_type))
> -               return -EPROBE_DEFER;
> -
>         pdev =3D of_find_device_by_node(private->mutex_node);
>         if (!pdev) {
>                 dev_err(dev, "Waiting for disp-mutex device %pOF\n",
> --
> 2.39.2.101.g768bb238c484.dirty
>
