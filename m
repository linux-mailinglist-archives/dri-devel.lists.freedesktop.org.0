Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83677337ABC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 18:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBBB6EAA1;
	Thu, 11 Mar 2021 17:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D977A6EAA1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 17:25:02 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6000B1F46594;
 Thu, 11 Mar 2021 17:25:01 +0000 (GMT)
Date: Thu, 11 Mar 2021 18:24:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [RFC PATCH 0/7] drm/panfrost: Add a new submit ioctl
Message-ID: <20210311182458.0e0140a1@collabora.com>
In-Reply-To: <CAOFGe94rnS+5FeJ1A8bLxgVDZB4_0Wp2Nx25iCCYGJ=j3KpOCA@mail.gmail.com>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
 <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
 <20210311140023.2735aaa5@collabora.com>
 <CAOFGe94rnS+5FeJ1A8bLxgVDZB4_0Wp2Nx25iCCYGJ=j3KpOCA@mail.gmail.com>
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
Cc: Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

On Thu, 11 Mar 2021 10:58:46 -0600
Jason Ekstrand <jason@jlekstrand.net> wrote:

> Hi all,
> 
> Dropping in where I may or may not be wanted to feel free to ignore. : -)

I'm glad you decided to chime in. :-)

 
> > > > 2/ Queued jobs might be executed out-of-order (unless they have
> > > >     explicit/implicit deps between them), and Vulkan asks that the out
> > > >     fence be signaled when all jobs are done. Timeline syncobjs are a
> > > >     good match for that use case. All we need to do is pass the same
> > > >     fence syncobj to all jobs being attached to a single QueueSubmit
> > > >     request, but a different point on the timeline. The syncobj
> > > >     timeline wait does the rest and guarantees that we've reached a
> > > >     given timeline point (IOW, all jobs before that point are done)
> > > >     before declaring the fence as signaled.
> > > >     One alternative would be to have dummy 'synchronization' jobs that
> > > >     don't actually execute anything on the GPU but declare a dependency
> > > >     on all other jobs that are part of the QueueSubmit request, and
> > > >     signal the out fence (the scheduler would do most of the work for
> > > >     us, all we have to do is support NULL job heads and signal the
> > > >     fence directly when that happens instead of queueing the job).  
> > >
> > > I have to admit to being rather hazy on the details of timeline
> > > syncobjs, but I thought there was a requirement that the timeline moves
> > > monotonically. I.e. if you have multiple jobs signalling the same
> > > syncobj just with different points, then AFAIU the API requires that the
> > > points are triggered in order.  
> >
> > I only started looking at the SYNCOBJ_TIMELINE API a few days ago, so I
> > might be wrong, but my understanding is that queuing fences (addition
> > of new points in the timeline) should happen in order, but signaling
> > can happen in any order. When checking for a signaled fence the
> > fence-chain logic starts from the last point (or from an explicit point
> > if you use the timeline wait flavor) and goes backward, stopping at the
> > first un-signaled node. If I'm correct, that means that fences that
> > are part of a chain can be signaled in any order.  
> 
> You don't even need a timeline for this.  Just have a single syncobj
> per-queue and make each submit wait on it and then signal it.
> Alternatively, you can just always hang on to the out-fence from the
> previous submit and make the next one wait on that.

That's what I have right now, but it forces the serialization of all
jobs that are pushed during a submit (and there can be more than one
per command buffer on panfrost :-/). Maybe I'm wrong, but I thought it'd
be better to not force this serialization if we can avoid it.

> Timelines are overkill here, IMO.

Mind developing why you think this is overkill? After looking at the
kernel implementation I thought using timeline syncobjs would be
pretty cheap compared to the other options I considered.

> 
> > Note that I also considered using a sync file, which has the ability to
> > merge fences, but that required 3 extra ioctls for each syncobj to merge
> > (for the export/merge/import round trip), and AFAICT, fences stay around
> > until the sync file is destroyed, which forces some garbage collection
> > if we want to keep the number of active fences low. One nice thing
> > about the fence-chain/syncobj-timeline logic is that signaled fences
> > are collected automatically when walking the chain.  
> 
> Yeah, that's the pain when working with sync files.  This is one of
> the reasons why our driver takes an arbitrary number of in/out
> syncobjs.
> 
> > > So I'm not sure that you've actually fixed this point - you either need
> > > to force an order (in which case the last job can signal the Vulkan
> > > fence)  
> >
> > That options requires adding deps that do not really exist on the last
> > jobs, so I'm not sure I like it.
> >  
> > > or you still need a dummy job to do the many-to-one dependency.  
> >
> > Yeah, that's what I've considered doing before realizing timelined
> > syncojbs could solve this problem (assuming I got it right :-/).
> >  
> > >
> > > Or I may have completely misunderstood timeline syncobjs - definitely a
> > > possibility :)  
> >
> > I wouldn't pretend I got it right either :-).
> >  
> > >  
> > > > 3/ The current implementation lacks information about BO access,
> > > >     so we serialize all jobs accessing the same set of BOs, even
> > > >     if those jobs might just be reading from them (which can
> > > >     happen concurrently). Other drivers pass an access type to the
> > > >     list of referenced BOs to address that. Another option would be
> > > >     to disable implicit deps (deps based on BOs) and force the driver
> > > >     to pass all deps explicitly (interestingly, some drivers have
> > > >     both the no-implicit-dep and r/w flags, probably to support
> > > >     sub-resource access, so we might want to add that one too).
> > > >     I don't see any userspace workaround to that problem, so that one
> > > >     alone would justify extending the existing ioctl or adding a new
> > > >     one.  
> > >
> > > Yeah - I think we need this. My only comment is that I think the
> > > read/write terminology may come back to bite. Better to use 'shared' and
> > > 'exclusive' - which better matches the dma_resv_xxx APIs anyway.
> > >
> > > Also the current code completely ignores PANFROST_BO_REF_READ. So either
> > > that should be defined as 0, or even better we support 3 modes:
> > >
> > >   * Exclusive ('write' access)
> > >   * Shared ('read' access)
> > >   * No fence - ensures the BO is mapped, but doesn't add any implicit
> > > fences.
> > >
> > > The last may make sense when doing explicit fences and e.g. doing
> > > front-buffer rendering with a display driver which does implicit fencing.  
> 
> This one's really annoying.  TBH, we've still not gotten it right on
> Intel, AFAICT.  That is roughly the set of modes you need but you'll
> have to watch out for window-system buffers.  RADV and ANV take
> slightly different approaches here and they each have their own
> problems.  On the balance, I'd look at what RADV is doing rather than
> ANV because ANV's results in some over-synchronization every time you
> vkWaitForFences on the WSI fence.  I've got a patch floating round
> somewhere that adds some new kernel API to make that case a bit better
> but it's a snarly mess.  Sorry for being cryptic but it's a 5-page
> e-mail if I type out all the annoying details. (-:

Ok, I'll have a look at the RADV driver.

Thanks for your feedback.

Boris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
