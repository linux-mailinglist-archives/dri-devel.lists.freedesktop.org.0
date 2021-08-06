Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DD93E2F4C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 20:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D8A6EC06;
	Fri,  6 Aug 2021 18:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2946EC06;
 Fri,  6 Aug 2021 18:29:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="275467109"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="275467109"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 11:29:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="513579185"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 11:29:21 -0700
Date: Fri, 6 Aug 2021 18:29:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix syncmap memory leak
Message-ID: <20210806182920.GA104981@DUT151-ICLU.fm.intel.com>
References: <20210730195342.110234-1-matthew.brost@intel.com>
 <de37e95c-b3e1-0479-db7e-e820077beaa3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de37e95c-b3e1-0479-db7e-e820077beaa3@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 06, 2021 at 11:23:06AM -0700, John Harrison wrote:
> On 7/30/2021 12:53, Matthew Brost wrote:
> > A small race exists between intel_gt_retire_requests_timeout and
> > intel_timeline_exit which could result in the syncmap not getting
> > free'd. Rather than work to hard to seal this race, simply cleanup the
> free'd -> freed
> 

Sure.

> > syncmap on fini.
> > 
> > unreferenced object 0xffff88813bc53b18 (size 96):
> >    comm "gem_close_race", pid 5410, jiffies 4294917818 (age 1105.600s)
> >    hex dump (first 32 bytes):
> >      01 00 00 00 00 00 00 00 00 00 00 00 0a 00 00 00  ................
> >      00 00 00 00 00 00 00 00 6b 6b 6b 6b 06 00 00 00  ........kkkk....
> >    backtrace:
> >      [<00000000120b863a>] __sync_alloc_leaf+0x1e/0x40 [i915]
> >      [<00000000042f6959>] __sync_set+0x1bb/0x240 [i915]
> >      [<0000000090f0e90f>] i915_request_await_dma_fence+0x1c7/0x400 [i915]
> >      [<0000000056a48219>] i915_request_await_object+0x222/0x360 [i915]
> >      [<00000000aaac4ee3>] i915_gem_do_execbuffer+0x1bd0/0x2250 [i915]
> >      [<000000003c9d830f>] i915_gem_execbuffer2_ioctl+0x405/0xce0 [i915]
> >      [<00000000fd7a8e68>] drm_ioctl_kernel+0xb0/0xf0 [drm]
> >      [<00000000e721ee87>] drm_ioctl+0x305/0x3c0 [drm]
> >      [<000000008b0d8986>] __x64_sys_ioctl+0x71/0xb0
> >      [<0000000076c362a4>] do_syscall_64+0x33/0x80
> >      [<00000000eb7a4831>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Fixes: 531958f6f357 ("drm/i915/gt: Track timeline activeness in enter/exit")
> > Cc: <stable@vger.kernel.org>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_timeline.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
> > index c4a126c8caef..1257f4f11e66 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> > @@ -127,6 +127,15 @@ static void intel_timeline_fini(struct rcu_head *rcu)
> >   	i915_vma_put(timeline->hwsp_ggtt);
> >   	i915_active_fini(&timeline->active);
> > +
> > +	/*
> > +	 * A small race exists between intel_gt_retire_requests_timeout and
> > +	 * intel_timeline_exit which could result in the syncmap not getting
> > +	 * free'd. Rather than work to hard to seal this race, simply cleanup
> > +	 * the syncmap on fini.
> What is the race? I'm going round in circles just trying to work out how
> intel_gt_retire_requests_timeout is supposed to get to intel_timeline_exit
> in the first place.
> 

intel_gt_retire_requests_timeout increments tl->active_count, active_count == 2
intel_timeline_exit is called, returns on atomic_add_unless, active_count == 1
intel_gt_retire_requests_timeout decrements tl->active_count, active_count == 0
i915_syncmap_free is never called, memory leak

Matt

> Also, free'd -> freed.
> 
> John.
> 
> 
> > +	 */
> > +	i915_syncmap_free(&timeline->sync);
> > +
> >   	kfree(timeline);
> >   }
> 
