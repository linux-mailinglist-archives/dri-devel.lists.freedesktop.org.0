Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C942A44B7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 13:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF1C6E8D3;
	Tue,  3 Nov 2020 12:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD436E8D3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 12:02:25 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E47B91F45647;
 Tue,  3 Nov 2020 12:02:23 +0000 (GMT)
Date: Tue, 3 Nov 2020 13:02:21 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3] drm/panfrost: Move the GPU reset bits outside the
 timeout handler
Message-ID: <20201103130221.3367da07@collabora.com>
In-Reply-To: <20201103110847.GG401619@phenom.ffwll.local>
References: <20201103081347.1000139-1-boris.brezillon@collabora.com>
 <20201103102540.GB401619@phenom.ffwll.local>
 <20201103120326.10037005@collabora.com>
 <20201103110847.GG401619@phenom.ffwll.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Nov 2020 12:08:47 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Nov 03, 2020 at 12:03:26PM +0100, Boris Brezillon wrote:
> > On Tue, 3 Nov 2020 11:25:40 +0100
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >   
> > > On Tue, Nov 03, 2020 at 09:13:47AM +0100, Boris Brezillon wrote:  
> > > > We've fixed many races in panfrost_job_timedout() but some remain.
> > > > Instead of trying to fix it again, let's simplify the logic and move
> > > > the reset bits to a separate work scheduled when one of the queue
> > > > reports a timeout.
> > > > 
> > > > v3:
> > > > - Replace the atomic_cmpxchg() by an atomic_xchg() (Robin Murphy)
> > > > - Add Steven's R-b
> > > > 
> > > > v2:
> > > > - Use atomic_cmpxchg() to conditionally schedule the reset work (Steven Price)
> > > > 
> > > > Fixes: 1a11a88cfd9a ("drm/panfrost: Fix job timeout handling")
> > > > Cc: <stable@vger.kernel.org>
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Reviewed-by: Steven Price <steven.price@arm.com>    
> > > 
> > > Sprinkling the dma_fence annotations over this would be really nice ...  
> > 
> > You mean something like that?  
> 
> That's just the irq annotations, i.e. the one that's already guaranteed by
> the irq vs. locks checks. So this does nothing.
> 
> What I mean is annotating your new reset work (it's part of the critical
> path to complete batches, since it's holding up other batches that are
> stuck in the scheduler still), and the drm/scheduler annotations I've
> floated a while ago. The drm/scheduler annotations are stuck somewhat for
> lack of feedback from any of the driver teams using it though :-/
> 
> The thing is pulling something out into a worker of it's own generally
> doesn't fix any deadlocks, it just hides them from lockdep.

Hm, except that's not exactly a deadlock we were trying to fix here (as
in, not a situation where 2 threads try to acquire locks in different
orders), just a situation where the scheduler stops dequeuing jobs
because it ends up in an inconsistent state (which is caused by a
bad/lack-of synchronization between timeout handlers). The problem here
is that we have 3 schedulers (one per HW queue) but when a timeout
occurs on one of them, we need to reset them all, thus requiring some
synchronization between the different timeout works. Moving the reset
logic to a separate work simplifies the synchronization.

> So it would be
> good to make sure lockdep can see through your maze again.

Okay, but it's not clear to me which part of the panfrost_reset()
function should be annotated. I mean, I probably call functions that
can signal fences, but I don't call dma_signal_fence() directly. Are
callers of the dma_sched_xxx() helpers expected to place such
annotations?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
