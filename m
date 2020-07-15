Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95C220D13
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 14:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776698944A;
	Wed, 15 Jul 2020 12:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA96893D0;
 Wed, 15 Jul 2020 12:40:15 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21826909-1500050 for multiple; Wed, 15 Jul 2020 13:40:09 +0100
MIME-Version: 1.0
In-Reply-To: <159481570397.13728.7155187046112827709@build.alporthouse.com>
References: <20200715104905.11006-1-chris@chris-wilson.co.uk>
 <20200715104905.11006-2-chris@chris-wilson.co.uk>
 <20200715121022.GK3278063@phenom.ffwll.local>
 <159481570397.13728.7155187046112827709@build.alporthouse.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] dma-buf/dma-fence: Add quick tests before
 dma_fence_remove_callback
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Jul 2020 13:40:08 +0100
Message-ID: <159481680826.13728.12654400528941223194@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Chris Wilson (2020-07-15 13:21:43)
> Quoting Daniel Vetter (2020-07-15 13:10:22)
> > On Wed, Jul 15, 2020 at 11:49:05AM +0100, Chris Wilson wrote:
> > > When waiting with a callback on the stack, we must remove the callback
> > > upon wait completion. Since this will be notified by the fence signal
> > > callback, the removal often contends with the fence->lock being held by
> > > the signaler. We can look at the list entry to see if the callback was
> > > already signaled before we take the contended lock.
> > > 
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > ---
> > >  drivers/dma-buf/dma-fence.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > index 8d5bdfce638e..b910d7bc0854 100644
> > > --- a/drivers/dma-buf/dma-fence.c
> > > +++ b/drivers/dma-buf/dma-fence.c
> > > @@ -420,6 +420,9 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
> > >       unsigned long flags;
> > >       bool ret;
> > >  
> > > +     if (list_empty(&cb->node))
> > 
> > I was about to say "but the races" but then noticed that Paul fixed
> > list_empty to use READ_ONCE like 5 years ago :-)
> 
> I'm always going "when exactly do we need list_empty_careful()"?
> 
> We can rule out a concurrent dma_fence_add_callback() for the same
> dma_fence_cb, as that is a lost cause. So we only have to worry about
> the concurrent list_del_init() from dma_fence_signal_locked(). So it's
> the timing of
>         list_del_init(): WRITE_ONCE(list->next, list)
> vs
>         READ_ONCE(list->next) == list
> and we don't need to care about the trailing instructions in
> list_del_init()...
> 
> Wait that trailing instruction is actually important here if the
> dma_fence_cb is on the stack, or other imminent free.
> 
> Ok, this does need to be list_empty_careful!

There's a further problem in that we call INIT_LIST_HEAD on the
dma_fence_cb before the signal callback. So even if list_empty_careful()
confirms the dma_fence_cb to be completely decoupled, the containing
struct may still be inuse.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
