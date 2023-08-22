Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD7E78484B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 19:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9EC10E3B4;
	Tue, 22 Aug 2023 17:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AC710E3B4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 17:16:06 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so629858566b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692724565; x=1693329365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n40OSQ1aOHwb0xjPdR9jQ6wxnoOkYuHmQ4PP3H0EIQU=;
 b=lySY5a8lyrGGnlYYXmf1l1ocOBL9p7YeIXrDkyjNrsw/anYfz+6MrKn1NRW7rt0Ny1
 KihWqC/l79F/2GTS93KM2VYg0m+/U4ZVc6uNlRpIjmnSZ0Sut5sNdvCRogdQcnP1Jwjc
 HaVZ93SoZcSeQMmHWgJdoPfeVJAbkvtXKctBEytkDo8/yyOSFyWLNukLQCZ22UcVLcw9
 S9oIJ8C5urTiccIpXY4yjOWXK/FgflI2yb/rxybAUkaM2Tg4mU0dn4uJ8eecyyW0k7N1
 QTNad9C61A1jPmghWekm/9TE/GUQZqqUJr/zFssq50uYC8EQlJ98t5Se/kpQvL2a3A9J
 5AFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692724565; x=1693329365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n40OSQ1aOHwb0xjPdR9jQ6wxnoOkYuHmQ4PP3H0EIQU=;
 b=TBb3lPnTtdUUZMuEaPjMUp+Q2rKNadzxVNSzfw2aVEd5qKfLy3jvDXoqYb1wQjJu/d
 n8mzqI+UsGdZnW7EAOGD8uj+k4vAlFeGtasI5fUXHS5yzJw5xcxIKlC0yThLhAjwtXUj
 antjxxPDpWRpymcOl5mzG72HfFeR+pq+I6yoPfXdJmFlux72z3Q4gaz/UMNUABkg6lWK
 uUM08uOaiQglY0bPrCzGWt2RmZn2Gz4rDE9zBGhiwlsQn2gr0lKroNXiAX/VyjO+koTn
 At2h7snC5sjV3qMoP4FS6LAzKrs6thiLWC+A6UlZ9pyhKdy+6B6DiO5aF90ZM1Y6gwcR
 2Scg==
X-Gm-Message-State: AOJu0Ywmdf2w6BYVBglwVWw1pfWdWUx6R3O2hbiXbDiuim3OntKVSI9t
 +XFEmJMk0HcqhuPDK2/WTxeMiks6dP1tDyQf5L0=
X-Google-Smtp-Source: AGHT+IFI95FHGpr6x2Y7yipCMx8Cu+PjNr67/q+7Cwc3a0nItV0XK4fS+gMtRy1kJ5SZXKsg6cGwBCClIR0xrahkDBI=
X-Received: by 2002:a17:906:28d:b0:99c:3b4:940f with SMTP id
 13-20020a170906028d00b0099c03b4940fmr8855243ejf.27.1692724564539; Tue, 22 Aug
 2023 10:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230818145939.39697-1-robdclark@gmail.com>
 <a05e0c2e-fd62-4a8e-9fa4-dffaf86f7730@gmail.com>
In-Reply-To: <a05e0c2e-fd62-4a8e-9fa4-dffaf86f7730@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 22 Aug 2023 10:15:52 -0700
Message-ID: <CAF6AEGs+6cveKbv=onEJSZJERk8m56YJzza6A2+eLd3+6MuWMg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v2] dma-buf/sw_sync: Avoid recursive lock
 during fence signal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 6:01=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 18.08.23 um 16:59 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If a signal callback releases the sw_sync fence, that will trigger a
> > deadlock as the timeline_fence_release recurses onto the fence->lock
> > (used both for signaling and the the timeline tree).
> >
> > To avoid that, temporarily hold an extra reference to the signalled
> > fences until after we drop the lock.
> >
> > (This is an alternative implementation of https://patchwork.kernel.org/=
patch/11664717/
> > which avoids some potential UAF issues with the original patch.)
> >
> > v2: Remove now obsolete comment, use list_move_tail() and
> >      list_del_init()
> >
> > Reported-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Fixes: d3c6dd1fb30d ("dma-buf/sw_sync: Synchronize signal vs syncpt fre=
e")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thanks, any chance you could take this via drm-misc?

BR,
-R

>
> > ---
> >   drivers/dma-buf/sw_sync.c | 18 +++++++++---------
> >   1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > index 63f0aeb66db6..f0a35277fd84 100644
> > --- a/drivers/dma-buf/sw_sync.c
> > +++ b/drivers/dma-buf/sw_sync.c
> > @@ -191,6 +191,7 @@ static const struct dma_fence_ops timeline_fence_op=
s =3D {
> >    */
> >   static void sync_timeline_signal(struct sync_timeline *obj, unsigned =
int inc)
> >   {
> > +     LIST_HEAD(signalled);
> >       struct sync_pt *pt, *next;
> >
> >       trace_sync_timeline(obj);
> > @@ -203,21 +204,20 @@ static void sync_timeline_signal(struct sync_time=
line *obj, unsigned int inc)
> >               if (!timeline_fence_signaled(&pt->base))
> >                       break;
> >
> > -             list_del_init(&pt->link);
> > +             dma_fence_get(&pt->base);
> > +
> > +             list_move_tail(&pt->link, &signalled);
> >               rb_erase(&pt->node, &obj->pt_tree);
> >
> > -             /*
> > -              * A signal callback may release the last reference to th=
is
> > -              * fence, causing it to be freed. That operation has to b=
e
> > -              * last to avoid a use after free inside this loop, and m=
ust
> > -              * be after we remove the fence from the timeline in orde=
r to
> > -              * prevent deadlocking on timeline->lock inside
> > -              * timeline_fence_release().
> > -              */
> >               dma_fence_signal_locked(&pt->base);
> >       }
> >
> >       spin_unlock_irq(&obj->lock);
> > +
> > +     list_for_each_entry_safe(pt, next, &signalled, link) {
> > +             list_del_init(&pt->link);
> > +             dma_fence_put(&pt->base);
> > +     }
> >   }
> >
> >   /**
>
