Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D772473580F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 15:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CF510E0E7;
	Mon, 19 Jun 2023 13:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4872F10E0E7;
 Mon, 19 Jun 2023 13:09:54 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b45cfe3110so1940212a34.0; 
 Mon, 19 Jun 2023 06:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687180193; x=1689772193;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Df1S5/iV7Bxdte7LRm6epWo1ZbDHSpdd2AzmTDAioKk=;
 b=lQEuuCWUKExMLYkZ2cNSM8y8MPo4u4CHkmMNva15MQK7tK1/raPSNKXS4Zqo/0CPru
 ZIKe5nrkFjiR+70CoLCp0dfQCH1Wa6omUAE590n9rwh2yntQPelKquCxuC/B5QmW70s5
 DuL3TL0rRsPbt+KEXDYjGTyb1fx1sAX96Qor6QRCThx00F4oXIPJrjItnkpHIHstqTk5
 qoUJxGf2bUTgcQN5ckhCx0dn6EiKhNaRStcsEpyKs6HDOqjosDKKTPH5ajvKmu9cBSly
 hGUERxEz9ajrEU3RfsKT4YKUPbsiu4qalpqMIE98zi67tpgn/5r1v/7ndPpJdA6UX8JO
 /H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687180193; x=1689772193;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Df1S5/iV7Bxdte7LRm6epWo1ZbDHSpdd2AzmTDAioKk=;
 b=EU0qwvleuAcGUeTXhj+iPeivJKxZCN/6KDRroS6f7mxXevbPvfovXdZMBpmEtYwAog
 D75pDiALBvR8/V1zJAIQGt3a+r9mCwGT3//So7/kPBcpsobgRevMq3Vv3K6DdPaNKE7q
 pS6T6irS4NiVpDxoh2dR9gjQkJlj6Js31F7cSLyi+tIaBnGYq8fI15VkPgk/BaUdF425
 465EhwkqOYq1Vjh+pxfOUmwuVx1vzHVorXkxKXK3ZEi+ph3snD8l6llmXTVaTSdZ6L3P
 w/6kFPzPlKoxL30srMV5/97JsQHL10A9bk+yUaUai5ZGjgjJ/BC91i2pRwFwFiZ3yaIn
 LV7A==
X-Gm-Message-State: AC+VfDwFUfyRLnCrzi5WFzNdX/uXATxxkofut1HgJsaJbg/GE0Qj5IPV
 toYP5yOF5oOeKioBvBYxX7xP8H/zUPSeoeDdgDQ=
X-Google-Smtp-Source: ACHHUZ4PlmCzqL6LFNKq8SgVbdI8J5/gzARoi0RL1DXibcfrCEpN7QjSFhGmm4sufxWmZrpEU4xqrVEoh0fqzf2Gxj8=
X-Received: by 2002:a54:4884:0:b0:39a:bdc8:d4d2 with SMTP id
 r4-20020a544884000000b0039abdc8d4d2mr12219697oic.5.1687180192863; Mon, 19 Jun
 2023 06:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
 <20230607130223.3533464-3-l.stach@pengutronix.de>
 <CAH9NwWfj0CKm3Q_bVjWi7PhhWfxQxeGfu1mo9bWdSe7xXrRW_w@mail.gmail.com>
 <10d769fb8eb39b439b3cc793664a242e443261a7.camel@pengutronix.de>
In-Reply-To: <10d769fb8eb39b439b3cc793664a242e443261a7.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 19 Jun 2023 15:09:41 +0200
Message-ID: <CAH9NwWfQuXMm25JBLOCd4jQPFMdsUNuJ+43xfosFVEQ4gEZ3wA@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/etnaviv: move runtime PM handling to events
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

Hi Lucas,

Am Do., 15. Juni 2023 um 11:37 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Hi Christian,
>
> Am Mittwoch, dem 14.06.2023 um 20:41 +0200 schrieb Christian Gmeiner:
> > Hi Lucas
> >
> > >
> > > Conceptually events are the right abstraction to handle the GPU
> > > runtime PM state: as long as any event is pending the GPU can not
> > > be idle. Events are also properly freed and reallocated when the
> > > GPU has been reset after a hang.
> > >
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > ---
> > >  drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 -
> > >  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 ---
> > >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 27 ++++++++++++--------
> > >  3 files changed, 16 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> > > index baa81cbf701a..a42d260cac2c 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> > > @@ -97,7 +97,6 @@ struct etnaviv_gem_submit {
> > >         struct list_head node; /* GPU active submit list */
> > >         struct etnaviv_cmdbuf cmdbuf;
> > >         struct pid *pid;       /* submitting process */
> > > -       bool runtime_resumed;
> > >         u32 exec_state;
> > >         u32 flags;
> > >         unsigned int nr_pmrs;
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > index 45403ea38906..2416c526f9b0 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > @@ -362,9 +362,6 @@ static void submit_cleanup(struct kref *kref)
> > >                         container_of(kref, struct etnaviv_gem_submit, refcount);
> > >         unsigned i;
> > >
> > > -       if (submit->runtime_resumed)
> > > -               pm_runtime_put_autosuspend(submit->gpu->dev);
> > > -
> > >         if (submit->cmdbuf.suballoc)
> > >                 etnaviv_cmdbuf_free(&submit->cmdbuf);
> > >
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > index 4e18aa8566c6..54a1249c5bca 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > @@ -1139,7 +1139,8 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
> > >         unsigned int *events)
> > >  {
> > >         unsigned long timeout = msecs_to_jiffies(10 * 10000);
> > > -       unsigned i, acquired = 0;
> > > +       unsigned i, acquired = 0, rpm_count = 0;
> >
> > rpm is the short form of runtime power management?
> >
> Yes, it's used in this way in multiple places in the kernel. Do you
> think it's clear enough from the code what's going on to keep it that
> way or should I change it to a longer name?
>

Yes it is clear what is going on - even with short variable name :)

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> Regards,
> Lucas
>
> > > +       int ret;
> > >
> > >         for (i = 0; i < nr_events; i++) {
> > >                 unsigned long ret;
> > > @@ -1148,6 +1149,7 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
> > >
> > >                 if (!ret) {
> > >                         dev_err(gpu->dev, "wait_for_completion_timeout failed");
> > > +                       ret = -EBUSY;
> > >                         goto out;
> > >                 }
> > >
> > > @@ -1167,13 +1169,23 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
> > >
> > >         spin_unlock(&gpu->event_spinlock);
> > >
> > > +       for (i = 0; i < nr_events; i++) {
> > > +               ret = pm_runtime_resume_and_get(gpu->dev);
> > > +               if (ret)
> > > +                       goto out_rpm;
> > > +               rpm_count++;
> > > +       }
> > > +
> > >         return 0;
> > >
> > > +out_rpm:
> > > +       for (i = 0; i < rpm_count; i++)
> > > +               pm_runtime_put_autosuspend(gpu->dev);
> > >  out:
> > >         for (i = 0; i < acquired; i++)
> > >                 complete(&gpu->event_free);
> > >
> > > -       return -EBUSY;
> > > +       return ret;
> > >  }
> > >
> > >  static void event_free(struct etnaviv_gpu *gpu, unsigned int event)
> > > @@ -1185,6 +1197,8 @@ static void event_free(struct etnaviv_gpu *gpu, unsigned int event)
> > >                 clear_bit(event, gpu->event_bitmap);
> > >                 complete(&gpu->event_free);
> > >         }
> > > +
> > > +       pm_runtime_put_autosuspend(gpu->dev);
> > >  }
> > >
> > >  /*
> > > @@ -1327,15 +1341,6 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
> > >         unsigned int i, nr_events = 1, event[3];
> > >         int ret;
> > >
> > > -       if (!submit->runtime_resumed) {
> > > -               ret = pm_runtime_get_sync(gpu->dev);
> > > -               if (ret < 0) {
> > > -                       pm_runtime_put_noidle(gpu->dev);
> > > -                       return NULL;
> > > -               }
> > > -               submit->runtime_resumed = true;
> > > -       }
> > > -
> > >         /*
> > >          * if there are performance monitor requests we need to have
> > >          * - a sync point to re-configure gpu and process ETNA_PM_PROCESS_PRE
> > > --
> > > 2.39.2
> > >
> >
> >
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
