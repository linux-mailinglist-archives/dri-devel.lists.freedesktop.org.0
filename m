Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F06735823
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 15:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6C610E146;
	Mon, 19 Jun 2023 13:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D54710E146;
 Mon, 19 Jun 2023 13:12:42 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-39e86b3da52so2327645b6e.0; 
 Mon, 19 Jun 2023 06:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687180361; x=1689772361;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jXJKaQW27Hh8KY98JcVlb1pPjoO3nNvbaxJMGoCtt1o=;
 b=Bzl8BwpnZOqC4eaquauvlxEPrr8P2GqjiO7BWYrF861Cjx262iJGjAAakn5Wqtp3Ys
 g8FT/nectn5/NgLQePihKfxTgNYIXbEcS5lPWNMblemHCR/0JZBLXhYxnc2nwyCCItyG
 0bZmDQMdG77jvgwdy87G+5VLSwMa0/Tay+2kQA6lmcx6bqm6w5lsG/ya1KtVoygmXWzv
 7wQPh+kQ6bY+6y7a52WLdWBxUvMB274uZAK4y66d7VHdeD9FYo5D//5eCAFDw6pmEKlw
 Pzd7wDmL7IQ4uy6KHjW1ddCmFkX8V5oSiYRGB4NGNCKJeaB3luOkL95t590d/2QgXk7K
 tMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687180361; x=1689772361;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jXJKaQW27Hh8KY98JcVlb1pPjoO3nNvbaxJMGoCtt1o=;
 b=Yjn3gw9pGN4FTQES+exhVWLeDKseGRhInaYTZ612gHZMm1CtU7sZCduwwuj3tvryYX
 WFxo0ESKZrmtg3/vwmhDmrdkbN1nt4KZSvM0E74ZsARBmIDFXaPD6hgaptFuzyn39h6b
 Hv7tc2Bz7hbyzAGEgMfFup+ztv+XVPjxUw3+SpvVtgl1T3yxVEOiH/qVtFVmI0zaETum
 2aBwlxyBO0hrBoUHD/uVgEgBILTny4VN7eG4a5Hd3J/oXyfwZAGtsa2HReh/1gLGLMZG
 yFd48fD0eObv/iTsvdrx91V+YwjgZy8AFKptpzvRZOgxeid1z6F4Vn1AB+xdGcMSL3Rf
 f/jw==
X-Gm-Message-State: AC+VfDxCHRVBzytFBJXxiMAp/9tU6BKO3+M+23R0dZ5dj2RSgN8Gr3pX
 BdtjbMh+j14h3uhGzJWJZI1uaP6teeQuSoTnCgk=
X-Google-Smtp-Source: ACHHUZ4kSI3qiFYitQ+nptGwrbozZbn7WoKthjalIV6E2rBC00iDTsFSpZIT52BZMV2mMwWKVyYZCTNBofgg8sThWtU=
X-Received: by 2002:a05:6808:101:b0:38d:ed4a:52f4 with SMTP id
 b1-20020a056808010100b0038ded4a52f4mr4998605oie.14.1687180360727; Mon, 19 Jun
 2023 06:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
 <20230607130223.3533464-5-l.stach@pengutronix.de>
In-Reply-To: <20230607130223.3533464-5-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 19 Jun 2023 15:12:29 +0200
Message-ID: <CAH9NwWfqQB=pD_d0c5P2VGVYdqtocn75DfxtsMT+vZ54Nhpbrg@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/etnaviv: avoid runtime PM usage in
 etnaviv_gpu_bind
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

>
> Nothing in this callpath actually touches the GPU, so there is no reason
> to get it out of suspend state here. Only if runtime PM isn't enabled at
> all we must make sure to enable the clocks, so the GPU init routine can
> access the GPU later on.
>
> This also removes the need to guard against the state where the driver
> isn't fully initialized yet in the runtime PM resume handler.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 57cf77ed2fcf..fb07d0e73802 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1735,13 +1735,11 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
>         if (ret)
>                 goto out_workqueue;
>
> -       if (IS_ENABLED(CONFIG_PM))
> -               ret = pm_runtime_get_sync(gpu->dev);
> -       else
> +       if (!IS_ENABLED(CONFIG_PM)) {
>                 ret = etnaviv_gpu_clk_enable(gpu);
> -       if (ret < 0)
> -               goto out_sched;
> -
> +               if (ret < 0)
> +                       goto out_sched;
> +       }
>
>         gpu->drm = drm;
>         gpu->fence_context = dma_fence_context_alloc(1);
> @@ -1753,9 +1751,6 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
>
>         priv->gpu[priv->num_gpus++] = gpu;
>
> -       pm_runtime_mark_last_busy(gpu->dev);
> -       pm_runtime_put_autosuspend(gpu->dev);
> -
>         return 0;
>
>  out_sched:
> @@ -1936,7 +1931,7 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
>                 return ret;
>
>         /* Re-initialise the basic hardware state */
> -       if (gpu->drm && gpu->initialized) {
> +       if (gpu->initialized) {
>                 ret = etnaviv_gpu_hw_resume(gpu);
>                 if (ret) {
>                         etnaviv_gpu_clk_disable(gpu);
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
