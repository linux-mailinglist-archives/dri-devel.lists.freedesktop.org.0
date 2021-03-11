Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8358B33733D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 14:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8E56EC4C;
	Thu, 11 Mar 2021 13:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D5E6EC4C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:00:30 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3438E1F462D3;
 Thu, 11 Mar 2021 13:00:29 +0000 (GMT)
Date: Thu, 11 Mar 2021 14:00:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [RFC PATCH 0/7] drm/panfrost: Add a new submit ioctl
Message-ID: <20210311140023.2735aaa5@collabora.com>
In-Reply-To: <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
 <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

On Thu, 11 Mar 2021 12:16:33 +0000
Steven Price <steven.price@arm.com> wrote:

> On 11/03/2021 09:25, Boris Brezillon wrote:
> > Hello,
> > 
> > I've been playing with Vulkan lately and struggled quite a bit to
> > implement VkQueueSubmit with the submit ioctl we have. There are
> > several limiting factors that can be worked around if we really have to,
> > but I think it'd be much easier and future-proof if we introduce a new
> > ioctl that addresses the current limitations:  
> 
> Hi Boris,
> 
> I think what you've proposed is quite reasonable, some detailed comments 
> to your points below.
> 
> > 
> > 1/ There can only be one out_sync, but Vulkan might ask us to signal
> >     several VkSemaphores and possibly one VkFence too, both of those
> >     being based on sync objects in my PoC. Making out_sync an array of
> >     syncobjs to attach the render_done fence to would make that possible.
> >     The other option would be to collect syncobj updates in userspace
> >     in a separate thread and propagate those updates to all
> >     semaphores+fences waiting on those events (I think the v3dv driver
> >     does something like that, but I didn't spend enough time studying
> >     the code to be sure, so I might be wrong).  
> 
> You should be able to avoid the separate thread to propagate by having a 
> proxy object in user space that maps between the one outsync of the job 
> and the possibly many Vulkan objects. But I've had this argument before 
> with the DDK... and the upshot of it was that he Vulkan API is 
> unnecessarily complex here and makes this really hard to do in practise. 
> So I agree adding this capability to the kernel is likely the best approach.
> 
> > 2/ Queued jobs might be executed out-of-order (unless they have
> >     explicit/implicit deps between them), and Vulkan asks that the out
> >     fence be signaled when all jobs are done. Timeline syncobjs are a
> >     good match for that use case. All we need to do is pass the same
> >     fence syncobj to all jobs being attached to a single QueueSubmit
> >     request, but a different point on the timeline. The syncobj
> >     timeline wait does the rest and guarantees that we've reached a
> >     given timeline point (IOW, all jobs before that point are done)
> >     before declaring the fence as signaled.
> >     One alternative would be to have dummy 'synchronization' jobs that
> >     don't actually execute anything on the GPU but declare a dependency
> >     on all other jobs that are part of the QueueSubmit request, and
> >     signal the out fence (the scheduler would do most of the work for
> >     us, all we have to do is support NULL job heads and signal the
> >     fence directly when that happens instead of queueing the job).  
> 
> I have to admit to being rather hazy on the details of timeline 
> syncobjs, but I thought there was a requirement that the timeline moves 
> monotonically. I.e. if you have multiple jobs signalling the same 
> syncobj just with different points, then AFAIU the API requires that the 
> points are triggered in order.

I only started looking at the SYNCOBJ_TIMELINE API a few days ago, so I
might be wrong, but my understanding is that queuing fences (addition
of new points in the timeline) should happen in order, but signaling
can happen in any order. When checking for a signaled fence the
fence-chain logic starts from the last point (or from an explicit point
if you use the timeline wait flavor) and goes backward, stopping at the
first un-signaled node. If I'm correct, that means that fences that
are part of a chain can be signaled in any order.

Note that I also considered using a sync file, which has the ability to
merge fences, but that required 3 extra ioctls for each syncobj to merge
(for the export/merge/import round trip), and AFAICT, fences stay around
until the sync file is destroyed, which forces some garbage collection
if we want to keep the number of active fences low. One nice thing
about the fence-chain/syncobj-timeline logic is that signaled fences
are collected automatically when walking the chain.

> 
> So I'm not sure that you've actually fixed this point - you either need 
> to force an order (in which case the last job can signal the Vulkan 
> fence)

That options requires adding deps that do not really exist on the last
jobs, so I'm not sure I like it.

> or you still need a dummy job to do the many-to-one dependency.

Yeah, that's what I've considered doing before realizing timelined
syncojbs could solve this problem (assuming I got it right :-/).

> 
> Or I may have completely misunderstood timeline syncobjs - definitely a 
> possibility :)

I wouldn't pretend I got it right either :-).

> 
> > 3/ The current implementation lacks information about BO access,
> >     so we serialize all jobs accessing the same set of BOs, even
> >     if those jobs might just be reading from them (which can
> >     happen concurrently). Other drivers pass an access type to the
> >     list of referenced BOs to address that. Another option would be
> >     to disable implicit deps (deps based on BOs) and force the driver
> >     to pass all deps explicitly (interestingly, some drivers have
> >     both the no-implicit-dep and r/w flags, probably to support
> >     sub-resource access, so we might want to add that one too).
> >     I don't see any userspace workaround to that problem, so that one
> >     alone would justify extending the existing ioctl or adding a new
> >     one.  
> 
> Yeah - I think we need this. My only comment is that I think the 
> read/write terminology may come back to bite. Better to use 'shared' and 
> 'exclusive' - which better matches the dma_resv_xxx APIs anyway.
> 
> Also the current code completely ignores PANFROST_BO_REF_READ. So either 
> that should be defined as 0, or even better we support 3 modes:
> 
>   * Exclusive ('write' access)
>   * Shared ('read' access)
>   * No fence - ensures the BO is mapped, but doesn't add any implicit 
> fences.
> 
> The last may make sense when doing explicit fences and e.g. doing 
> front-buffer rendering with a display driver which does implicit fencing.

Sounds good to me.

> 
> > 4/ There's also the fact that submitting one job at a time adds an
> >     overhead when QueueSubmit is being passed more than one
> >     CommandBuffer. That one is less problematic, but if we're adding
> >     a new ioctl we'd better design it to limit the userspace -> kernel
> >     transition overhead.  
> 
> I've no objection - but I doubt the performance effect is significant. I 
> was pleased to see the handling of stride which makes the interface 
> extendable. In particular I suspect at some point we're going to want a 
> priority field in some form.
> 
> > Right now I'm just trying to collect feedback. I don't intend to get
> > those patches merged until we have a userspace user, but I thought
> > starting the discussion early would be a good thing.
> > 
> > Feel free to suggest other approaches.  
> 
> Other than the above I didn't see any obvious issues, and I know the 
> Vulkan API is problematic in terms of synchronisation primitives - so if 
> this makes it easier to implement then it seems like a good idea to me.

Thanks a lot for you review.

Regards,

Boris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
