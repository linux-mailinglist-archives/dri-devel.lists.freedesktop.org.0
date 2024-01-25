Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCE583CEFF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E4C10E3A3;
	Thu, 25 Jan 2024 21:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED10510E346;
 Thu, 25 Jan 2024 21:57:08 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a30e445602cso232542966b.0; 
 Thu, 25 Jan 2024 13:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706219767; x=1706824567; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cN3OmOMgfyPuSvBA5vFQXddd5rvPdZCLO/OyrwkAhQ0=;
 b=MululRk8YRvosC8z31UnOCp4SujU1QE194uykF0zdYk1PUQ+jhhCSWncvf+GfGCNgi
 vs5WkgOvQxfPyRiDy1btgxcmPL0OTW7SXY4LFMFkJD9Jfr6788sXChZC5RPEocCK0Yia
 wXzLOCdIdwo40W1Xu5c4PoJeF3xyYWgC8eOLqswXAYfWbRlvhNAzf+I1/36rR9/LHK8I
 DtNPjUFd3BJJG6OA8UJ9irHYPYtgBs/olhD39zZLvEZ7eg/omUi33A9qm26IH8XTuNL5
 iUXwsHO/x22EvFMQxtxWHZrc9PoNI3kr7ZDTy2sL3TSlfhi6oY1sEFEL6ZRfn3QoBZRU
 /G5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706219767; x=1706824567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cN3OmOMgfyPuSvBA5vFQXddd5rvPdZCLO/OyrwkAhQ0=;
 b=ZWu5beVG5xvkFGC7nTed6v6trnB0CCO84DiJFw6uLH5+ieLmb2Oixy0Kmmo1nR+1nO
 bysfVGohXNsOoqwv/wG/Puw3UFXzsda+/3Ur1f1cCyx1b1FeBsLYKAn8lzWg5AL+YOiO
 HeQ7hzJgr9p/2rjN8yepWgdXREMEn1sU34sRrUOC87OL+bNf0R0hWTa9ZdYTnWgByCxS
 qii3yVQjsmt1FZtXupUZauXjKSguEWdWgtN7qeoS0qJRjPSzhoe2d/rT7lLc7H10D06l
 JburRHwoUfv/r4dd1CJoG50UDCMlvPBTGdJIPgOMWDyEzkP6/5dQZAjZ7g00u07n1jIe
 TDkQ==
X-Gm-Message-State: AOJu0YxqbJoe6FtRShj7qhixBYXiav3ryaA4fVkdHhFqr5gc/SHlFVDI
 Q7ws7xVl9UtVHakBcfRp7dIU3TK+/byg6YFxkhKBkHPDhH0+t0IfYimqLm3ZZM5vQ/S2BMdr3C8
 alGagyYXsC7iGGfQxnmGgmX0N5yN8PXdX
X-Google-Smtp-Source: AGHT+IG8S7W8tdmHQZXFG8V98javCrYKjOlT77mP9zWrp6dwE/CsLnF/haMXtnlZkwtxphtZaetm0GjuBFHdF2SUs+I=
X-Received: by 2002:a17:907:985b:b0:a2d:a38c:7b7f with SMTP id
 jj27-20020a170907985b00b00a2da38c7b7fmr196289ejc.19.1706219767039; Thu, 25
 Jan 2024 13:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20240123072538.1290035-1-airlied@gmail.com>
 <ZbKm0EqOVe9Ihqgz@phenom.ffwll.local>
In-Reply-To: <ZbKm0EqOVe9Ihqgz@phenom.ffwll.local>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 Jan 2024 07:55:55 +1000
Message-ID: <CAPM=9tyxHMzD+WBhWSeyaD1Rvwmwvra7p3OK8otqfjSSvwSVBw@mail.gmail.com>
Subject: Re: [PATCH] nouveau: rip out fence irq allow/block sequences.
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Jan 2024 at 04:28, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jan 23, 2024 at 05:25:38PM +1000, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > fences are signalled on nvidia hw using non-stall interrupts.
> >
> > non-stall interrupts are not latched from my reading.
> >
> > When nouveau emits a fence, it requests a NON_STALL signalling,
> > but it only calls the interface to allow the non-stall irq to happen
> > after it has already emitted the fence. A recent change
> > eacabb546271 ("nouveau: push event block/allowing out of the fence context")
> > made this worse by pushing out the fence allow/block to a workqueue.
> >
> > However I can't see how this could ever work great, since when
> > enable signalling is called, the semaphore has already been emitted
> > to the ring, and the hw could already have tried to set the bits,
> > but it's been masked off. Changing the allowed mask later won't make
> > the interrupt get called again.
> >
> > For now rip all of this out.
> >
> > This fixes a bunch of stalls seen running VK CTS sync tests.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_fence.c | 77 +++++--------------------
> >  drivers/gpu/drm/nouveau/nouveau_fence.h |  2 -
> >  2 files changed, 16 insertions(+), 63 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index 5057d976fa57..d6d50cdccf75 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -50,24 +50,14 @@ nouveau_fctx(struct nouveau_fence *fence)
> >       return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
> >  }
> >
> > -static int
> > +static void
> >  nouveau_fence_signal(struct nouveau_fence *fence)
> >  {
> > -     int drop = 0;
> > -
> >       dma_fence_signal_locked(&fence->base);
> >       list_del(&fence->head);
> >       rcu_assign_pointer(fence->channel, NULL);
> >
> > -     if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
> > -             struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> > -
> > -             if (atomic_dec_and_test(&fctx->notify_ref))
> > -                     drop = 1;
> > -     }
> > -
> >       dma_fence_put(&fence->base);
> > -     return drop;
> >  }
> >
> >  static struct nouveau_fence *
> > @@ -93,8 +83,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
> >               if (error)
> >                       dma_fence_set_error(&fence->base, error);
> >
> > -             if (nouveau_fence_signal(fence))
> > -                     nvif_event_block(&fctx->event);
> > +             nouveau_fence_signal(fence);
> >       }
> >       fctx->killed = 1;
> >       spin_unlock_irqrestore(&fctx->lock, flags);
> > @@ -103,8 +92,8 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
> >  void
> >  nouveau_fence_context_del(struct nouveau_fence_chan *fctx)
> >  {
> > -     cancel_work_sync(&fctx->allow_block_work);
> >       nouveau_fence_context_kill(fctx, 0);
> > +     nvif_event_block(&fctx->event);
> >       nvif_event_dtor(&fctx->event);
> >       fctx->dead = 1;
> >
> > @@ -127,11 +116,10 @@ nouveau_fence_context_free(struct nouveau_fence_chan *fctx)
> >       kref_put(&fctx->fence_ref, nouveau_fence_context_put);
> >  }
> >
> > -static int
> > +static void
> >  nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
> >  {
> >       struct nouveau_fence *fence;
> > -     int drop = 0;
> >       u32 seq = fctx->read(chan);
> >
> >       while (!list_empty(&fctx->pending)) {
> > @@ -140,10 +128,8 @@ nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fc
> >               if ((int)(seq - fence->base.seqno) < 0)
> >                       break;
> >
> > -             drop |= nouveau_fence_signal(fence);
> > +             nouveau_fence_signal(fence);
> >       }
> > -
> > -     return drop;
> >  }
> >
> >  static int
> > @@ -160,26 +146,13 @@ nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc
> >
> >               fence = list_entry(fctx->pending.next, typeof(*fence), head);
> >               chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> > -             if (nouveau_fence_update(chan, fctx))
> > -                     ret = NVIF_EVENT_DROP;
> > +             nouveau_fence_update(chan, fctx);
> >       }
> >       spin_unlock_irqrestore(&fctx->lock, flags);
> >
> >       return ret;
> >  }
> >
> > -static void
> > -nouveau_fence_work_allow_block(struct work_struct *work)
> > -{
> > -     struct nouveau_fence_chan *fctx = container_of(work, struct nouveau_fence_chan,
> > -                                                    allow_block_work);
> > -
> > -     if (atomic_read(&fctx->notify_ref) == 0)
> > -             nvif_event_block(&fctx->event);
> > -     else
> > -             nvif_event_allow(&fctx->event);
> > -}
> > -
> >  void
> >  nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
> >  {
> > @@ -191,7 +164,6 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
> >       } args;
> >       int ret;
> >
> > -     INIT_WORK(&fctx->allow_block_work, nouveau_fence_work_allow_block);
> >       INIT_LIST_HEAD(&fctx->flip);
> >       INIT_LIST_HEAD(&fctx->pending);
> >       spin_lock_init(&fctx->lock);
> > @@ -216,6 +188,12 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
> >                             &args.base, sizeof(args), &fctx->event);
> >
> >       WARN_ON(ret);
> > +
> > +     /*
> > +      * Always allow non-stall irq events - previously this code tried to
> > +      * enable/disable them, but that just seems racy as nonstall irqs are unlatched.
> > +      */
> > +     nvif_event_allow(&fctx->event);
> >  }
> >
> >  int
> > @@ -247,8 +225,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
> >                       return -ENODEV;
> >               }
> >
> > -             if (nouveau_fence_update(chan, fctx))
> > -                     nvif_event_block(&fctx->event);
> > +             nouveau_fence_update(chan, fctx);
> >
> >               list_add_tail(&fence->head, &fctx->pending);
> >               spin_unlock_irq(&fctx->lock);
> > @@ -271,8 +248,8 @@ nouveau_fence_done(struct nouveau_fence *fence)
> >
> >               spin_lock_irqsave(&fctx->lock, flags);
> >               chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> > -             if (chan && nouveau_fence_update(chan, fctx))
> > -                     nvif_event_block(&fctx->event);
> > +             if (chan)
> > +                     nouveau_fence_update(chan, fctx);
> >               spin_unlock_irqrestore(&fctx->lock, flags);
> >       }
> >       return dma_fence_is_signaled(&fence->base);
> > @@ -530,32 +507,10 @@ static const struct dma_fence_ops nouveau_fence_ops_legacy = {
> >       .release = nouveau_fence_release
> >  };
> >
> > -static bool nouveau_fence_enable_signaling(struct dma_fence *f)
> > -{
> > -     struct nouveau_fence *fence = from_fence(f);
> > -     struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> > -     bool ret;
> > -     bool do_work;
> > -
> > -     if (atomic_inc_return(&fctx->notify_ref) == 0)
> > -             do_work = true;
> > -
> > -     ret = nouveau_fence_no_signaling(f);
> > -     if (ret)
> > -             set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
> > -     else if (atomic_dec_and_test(&fctx->notify_ref))
> > -             do_work = true;
> > -
> > -     if (do_work)
> > -             schedule_work(&fctx->allow_block_work);
> > -
> > -     return ret;
> > -}
> > -
> >  static const struct dma_fence_ops nouveau_fence_ops_uevent = {
> >       .get_driver_name = nouveau_fence_get_get_driver_name,
> >       .get_timeline_name = nouveau_fence_get_timeline_name,
> > -     .enable_signaling = nouveau_fence_enable_signaling,
> > +     .enable_signaling = nouveau_fence_no_signaling,
>
> I think you can rip nouveau_fence_no_signaling out too, it doesn't do
> anything more than what the signalling codepath does too.
>
> But maybe separate path since maybe this makes an existing leak more of a
> sieve, but it really should be an existing one since you cannot assume
> that someone external will ever look at whether your fence is signalled or
> not.
> -Sima
>

I think it might be overkill to rip this out, but the fix I put in 6.7
is also having bad side effects, so I'm going to try and revert that
and fix that problem first.

I think I'd like to keep this irq handling stuff as it seems to
matter, but I think the atomic in fctx is wrongly handled and it's a
case of misusing atomics instead of locks and I'm going to spend next
week considering it in a bit more depth.

Dave.
