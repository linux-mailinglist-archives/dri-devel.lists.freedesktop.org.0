Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37301FEC23
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495526EA8E;
	Thu, 18 Jun 2020 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67D56EA01;
 Wed, 17 Jun 2020 17:57:21 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q8so3878511iow.7;
 Wed, 17 Jun 2020 10:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q00goUzCyLy6SD4mp+vmnrzfR0St7QeKsEVA6ziR2PU=;
 b=RRvn7qM35mVqAY1knuIVPc10vaUdrQvNMukTRVNOheuSL4BNGgJUWKZcI1Tlop7ulM
 eHEbNnONoOFpOMHgV3OxjZJtAVHASnb6+Kp0iM8VLOvBUPU30Ce6EvIRrDUDDe7aq/1t
 V5AIQ1Be14Z83jXBo6gBw9pPIYqOTrpX+U/4BWkVHzRchV8quM6JYDrY7uXvtB/sCM4i
 BXsTwdu2DB+p4w8OeDUtvERmD0VxVXxT27DcDci4gRQ0R9Xg28f6mSS7xRq8+TWNyqVw
 YtcHyxUltXLKolgtcMD0+EotnZ7NCfKeRWa0Uo3yDAMselHTgbsUYYTAFboGZqKs2pz3
 NTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q00goUzCyLy6SD4mp+vmnrzfR0St7QeKsEVA6ziR2PU=;
 b=hc46Vr4EP0jDOmuO6LEDfbkcDq/HqCQDe/WZWs+V1YbRhbmc/e7P9qYTJmHW2T6SMo
 koTgaJYolsCLUq1LGBZuiWh6dYsNlsrhekZxT0psacCofzMg73jcMaJMLFnPJ8zwlscW
 SMPJIPKHOdx7mLf3sj03FBkPCJliyERk+OepiuP89kUdDFzptd5m2JKZbQuCW+QHZIch
 DEha0+Scz9ydJvo7q/UEfYPP7M8m8xQsD9Iw5Bcm9wiW1kh8hFBWU9b7NWOJcoT+sub7
 Zg7SYYdRt1wQEbFEk9S/ExVQIZjR2Ag0qhoUR/+UTMr8GPb7qIFXu5EaP/pwykCpScIP
 6m3Q==
X-Gm-Message-State: AOAM531/J9pvdr6yNYmFhsHFSrxBHdkZxvst1aMWTn1PelRx9atbr4FG
 8pYOMvpwL6jupJXwE6CpCMjOwdcyawBt9Igs6Fo=
X-Google-Smtp-Source: ABdhPJzZJiTWi2uOtNqtsGdWLlE7w0p8Q7blzZ5DDM9DIsZb9e2+H8BHK6oknVOa8kl+OV9UMTyk7Mfx5H5udXhynxA=
X-Received: by 2002:a6b:b252:: with SMTP id b79mr621281iof.31.1592416640937;
 Wed, 17 Jun 2020 10:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VcLR2w9Ym0YOqUT9G8xT9qWrdD1-wP4UA-1wtuwCNxqSA@mail.gmail.com>
 <20200615061220.68711-1-navid.emamdoost@gmail.com>
 <befc07e1d630dbc5a6f96fba4e47e083e6386090.camel@pengutronix.de>
In-Reply-To: <befc07e1d630dbc5a6f96fba4e47e083e6386090.camel@pengutronix.de>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Wed, 17 Jun 2020 12:57:09 -0500
Message-ID: <CAEkB2EQ9DuLt12MXkw3DYpBDaDAxoWTnMC9+=E7v=6dGGRK=nQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: fix ref count leak via pm_runtime_get_sync
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: Qiushi Wu <wu000273@umn.edu>, David Airlie <airlied@linux.ie>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kangjie Lu <kjlu@umn.edu>,
 etnaviv@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, mccamant@cs.umn.edu,
 Navid Emamdoost <emamd001@umn.edu>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,


On Wed, Jun 17, 2020 at 4:53 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi Navid,
>
> Am Montag, den 15.06.2020, 01:12 -0500 schrieb Navid Emamdoost:
> > in etnaviv_gpu_submit, etnaviv_gpu_recover_hang, etnaviv_gpu_debugfs,
> > and etnaviv_gpu_init the call to pm_runtime_get_sync increments the
> > counter even in case of failure, leading to incorrect ref count.
> > In case of failure, decrement the ref count before returning.
>
> While that change is correct with the current API, may I ask the
> question why the way this API works is considered reasonable? A API
> call that fails, but still changes internal state and expects the
> caller to clean up the mess it not really what I would consider fool-
> proof API design. Is there a specific reason why it is done this way
> and not handled internally?

I share the same concern with you on the way this API is working now.
To the best of my knowledge, there are ongoing discussions on this
issue:

https://lkml.org/lkml/2020/6/14/76
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200520095148.10995-1-dinghao.liu@zju.edu.cn/

>
> Regards,
> Lucas
>
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > ---
> > Changes in v2:
> >       - replace pm_runtime_put with  pm_runtime_put_noidle
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > index a31eeff2b297..7c9f3f9ba123 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -722,7 +722,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
> >       ret = pm_runtime_get_sync(gpu->dev);
> >       if (ret < 0) {
> >               dev_err(gpu->dev, "Failed to enable GPU power domain\n");
> > -             return ret;
> > +             goto pm_put;
> >       }
> >
> >       etnaviv_hw_identify(gpu);
> > @@ -819,6 +819,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
> >
> >  fail:
> >       pm_runtime_mark_last_busy(gpu->dev);
> > +pm_put:
> >       pm_runtime_put_autosuspend(gpu->dev);
> >
> >       return ret;
> > @@ -859,7 +860,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
> >
> >       ret = pm_runtime_get_sync(gpu->dev);
> >       if (ret < 0)
> > -             return ret;
> > +             goto pm_put;
> >
> >       dma_lo = gpu_read(gpu, VIVS_FE_DMA_LOW);
> >       dma_hi = gpu_read(gpu, VIVS_FE_DMA_HIGH);
> > @@ -1003,6 +1004,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
> >       ret = 0;
> >
> >       pm_runtime_mark_last_busy(gpu->dev);
> > +pm_put:
> >       pm_runtime_put_autosuspend(gpu->dev);
> >
> >       return ret;
> > @@ -1016,7 +1018,7 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
> >       dev_err(gpu->dev, "recover hung GPU!\n");
> >
> >       if (pm_runtime_get_sync(gpu->dev) < 0)
> > -             return;
> > +             goto pm_put;
> >
> >       mutex_lock(&gpu->lock);
> >
> > @@ -1035,6 +1037,7 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
> >
> >       mutex_unlock(&gpu->lock);
> >       pm_runtime_mark_last_busy(gpu->dev);
> > +pm_put:
> >       pm_runtime_put_autosuspend(gpu->dev);
> >  }
> >
> > @@ -1308,8 +1311,10 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
> >
> >       if (!submit->runtime_resumed) {
> >               ret = pm_runtime_get_sync(gpu->dev);
> > -             if (ret < 0)
> > +             if (ret < 0) {
> > +                     pm_runtime_put_noidle(gpu->dev);
> >                       return NULL;
> > +             }
> >               submit->runtime_resumed = true;
> >       }
> >
> > @@ -1326,6 +1331,7 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
> >       ret = event_alloc(gpu, nr_events, event);
> >       if (ret) {
> >               DRM_ERROR("no free events\n");
> > +             pm_runtime_put_noidle(gpu->dev);
> >               return NULL;
> >       }
> >
>


--
Navid.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
