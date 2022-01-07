Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76645487625
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 12:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E5D10FEF2;
	Fri,  7 Jan 2022 11:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFC810FEC0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 11:04:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a5so6401013wrh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 03:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DYdVfhrze3PmGoBWLbqEClWHtyMjN7/HGWigZUPvV3o=;
 b=BtLrZRY5x7D9+1KKbopGNR0c8VrIy+vWl9DZ8XWSAB8IjTaa5yKWJPgg5N2jJN6E0c
 kv6W68xgY3fSeLwqiHHlKd9jx+1QA9tvvmMneSXla7xZD/gxHUs4/9qaJGfdAnxyuxh6
 4S0lWmOLep3rdrKPKiM5P/S4RYTO1rErxa4CfplYbAJV6HT5FLJnLIQMF/jF0V9BzxdQ
 r6Lpv1MV9HcphTg5z2EO972wrcWOV6JL/1F6I/cMw3P51g1SDa1cd9em0LEq5AAkVV5c
 RTjsgn2lYl2zrlXZcjsHeRGzWpGrX6FysanjgaeFIDgnrfuHYAMT3gef0w6kcAdTlMzP
 Bveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYdVfhrze3PmGoBWLbqEClWHtyMjN7/HGWigZUPvV3o=;
 b=WhRuRcjjPZk+nd2d9AJZh+dDAZLFUS6ywhpsG9boTwsXLNnYVizy04P0PWWQTl5JI7
 LDyBv+EuUIhJLpBaotT4bZznPJ5UJOZeu/U/p9jJx7G7LAtqzLUTrmck3ihn+r1Kcu8B
 FpxLLfq2nio1bKfoTukkeHxYwZx1ekGk3wTnaPD/SE/zzzbn0IQQ51pNA+HpVJa9JZRl
 BXEa/KDr1pI5F212OipGJr8hhr5MsYiubwKIke9ADO2AYHHaTs86m3AjVCjzAxk7I+92
 NNM5KSusANfGMEXh4X9iFynmCA7A+BLhGon8I6+3/AJWn8PNGbyaZBacefmsrYvpDaGQ
 OZBQ==
X-Gm-Message-State: AOAM530xmKKcouuzLGLx/Pq+2AHkZZWi79ilQNHi8uZSAJi0fJRCTq4a
 z11PlYEpuTHiyMmEbQ7w8Lx3/Xmt7A2G0+UQUZ5vyw==
X-Google-Smtp-Source: ABdhPJx8MflMlhSiAKN9fYc6Bm7/OBTsbY5tB727sPzZjkNslEUMFA3YP9bUTlPTVwecDtRQGKmuc1jglGwB1zVEX0s=
X-Received: by 2002:a05:6000:156b:: with SMTP id
 11mr54881538wrz.261.1641553454546; 
 Fri, 07 Jan 2022 03:04:14 -0800 (PST)
MIME-Version: 1.0
References: <CAPY8ntAdknutH=OmV1dWPbez1ZqLgaOj-BoQQkZAu0WbhbE6nQ@mail.gmail.com>
 <20220106124657.32737-1-linmq006@gmail.com>
In-Reply-To: <20220106124657.32737-1-linmq006@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 7 Jan 2022 11:03:57 +0000
Message-ID: <CAPY8ntAz2V81gwO6O+KxLev38Dy8wKGKW_SWDnEo8CU66qpe0w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/v3d: Fix PM disable depth imbalance in
 v3d_platform_drm_probe
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
 Eric Anholt <emma@anholt.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Jan 2022 at 12:47, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> The pm_runtime_enable will increase power disable depth.
> If the probe fails, we should use pm_runtime_disable() to balance
> pm_runtime_enable().
>
> Fixes: 57692c9 ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Thanks for the update - that looks good to me.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> Changes in v2
> - put pm_runtime_disable before dma_free_wc
> - rename dma_free to pm_disable
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index bd46396a1ae0..7d500dd5314e 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -282,7 +282,7 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>
>         ret = v3d_gem_init(drm);
>         if (ret)
> -               goto dma_free;
> +               goto pm_disable;
>
>         ret = v3d_irq_init(v3d);
>         if (ret)
> @@ -298,7 +298,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>         v3d_irq_disable(v3d);
>  gem_destroy:
>         v3d_gem_destroy(drm);
> -dma_free:
> +pm_disable:
> +       pm_runtime_disable(dev);
>         dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
>         return ret;
>  }
> --
> 2.17.1
>
