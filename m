Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A36A41604A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 15:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915DF6ED27;
	Thu, 23 Sep 2021 13:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5D56ED26;
 Thu, 23 Sep 2021 13:51:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="220645507"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="220645507"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 06:51:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="702722334"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 06:51:15 -0700
Date: Thu, 23 Sep 2021 06:51:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH RESEND] drm/i915: Flush buffer pools on driver remove
Message-ID: <20210923135114.GA3389343@mdroper-desk1.amr.corp.intel.com>
References: <20210903142320.216705-1-janusz.krzysztofik@linux.intel.com>
 <20210922222429.GY3389343@mdroper-desk1.amr.corp.intel.com>
 <70976479.RN2Pgac3cq@jkrzyszt-mobl1.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70976479.RN2Pgac3cq@jkrzyszt-mobl1.ger.corp.intel.com>
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

On Thu, Sep 23, 2021 at 03:07:06PM +0200, Janusz Krzysztofik wrote:
> Hi Matt,
> 
> Thanks for review.
> 
> On czwartek, 23 września 2021 00:24:29 CEST Matt Roper wrote:
> > On Fri, Sep 03, 2021 at 04:23:20PM +0200, Janusz Krzysztofik wrote:
> > > In preparation for clean driver release, attempts to drain work queues
> > > and release freed objects are taken at driver remove time.  However, GT
> > > buffer pools are now not flushed before the driver release phase.
> > > Since unused objects may stay there for up to one second, some may
> > > survive until driver release is attempted.  That can potentially
> > > explain sporadic then hardly reproducible issues observed at driver
> > > release time, like non-zero shrink counter or outstanding address space
> > 
> > So just to make sure I'm understanding the description here:
> >  - We currently do an explicit flush of the buffer pools within the call
> >    path of drm_driver.release(); this removes all buffers, regardless of
> >    their age.
> 
> And also triggers release of the buffers' underlying resources (objects, 
> address space areas).
> 
> >  - However there may be other code that runs *earlier* within the
> >    drm_driver.release() call chain 
> 
> Yes, within the drm_driver.release() call chain, but not necessarily earlier 
> -- that's irrelevant, I believe, ...
> 
> >    that expects buffer pools have
> >    already been flushed and are already empty.
> 
> ... since that other code expects not just buffer pools but resource 
> categories they consume (objects, address space areas) to be flushed already, 
> while some may still be busy with old buffers not auto-flushed yet.
> 
> >  - Since buffer pools auto-flush old buffers once per second in a worker
> >    thread, there's a small window where if we remove the driver while
> >    there are still buffers with an age of less than one second, the
> >    assumptions of the other release code may be violated.
> 
> Correct.
> 
> > So by moving the flush to driver remove (which executes earlier via the
> > pci_driver.remove() flow) you're ensuring that all buffers are flushed
> > before _any_ code in drm_driver.release() executes.
> 
> And also flushed before some other code in pci_driver.remove() flushes those 
> other resource categories released on buffer pools flush, then completeness of 
> all those flushes is checked in drm_driver.release().
> 
> May I copy-paste some of you wording while rephrasing my commit description?

Sure go ahead.

Thanks.


Matt

> 
> Thanks,
> Janusz
> 
> > 
> > I found the wording of the commit message here somewhat confusing since
> > it's talking about flushes we do in driver release, but mentions
> > problems that arise during driver release due to lack of flushing.  You
> > might want to reword the commit message somewhat to help clarify.
> > Otherwise, the code change itself looks reasonable to me.
> > 
> > BTW, I do notice that drm_driver.release() in general is technically
> > deprecated at this point (with a suggestion in the drm_drv.h comments to
> > switch to using drmm_add_action(), drmm_kmalloc(), etc. to manage the
> > cleanup of resources).  At some point in the future me may want to
> > rework the i915 cleanup in general according to that guidance.
> > 
> > 
> > Matt
> > 
> > > areas.
> > > 
> > > Flush buffer pools on GT remove as a fix.  On driver release, don't
> > > flush the pools again, just assert that the flush was called and
> > > nothing added more in between.
> > > 
> > > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > ---
> > > Resending with Cc: dri-devel@lists.freedesktop.org as requested, and a
> > > typo in commit description fixed.
> > > 
> > > Thanks,
> > > Janusz
> > > 
> > >  drivers/gpu/drm/i915/gt/intel_gt.c             | 2 ++
> > >  drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c | 2 --
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > index 62d40c986642..8f322a4ecd87 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > @@ -737,6 +737,8 @@ void intel_gt_driver_remove(struct intel_gt *gt)
> > >  	intel_uc_driver_remove(&gt->uc);
> > >  
> > >  	intel_engines_release(gt);
> > > +
> > > +	intel_gt_flush_buffer_pool(gt);
> > >  }
> > >  
> > >  void intel_gt_driver_unregister(struct intel_gt *gt)
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
> > > index aa0a59c5b614..acc49c56a9f3 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
> > > @@ -245,8 +245,6 @@ void intel_gt_fini_buffer_pool(struct intel_gt *gt)
> > >  	struct intel_gt_buffer_pool *pool = &gt->buffer_pool;
> > >  	int n;
> > >  
> > > -	intel_gt_flush_buffer_pool(gt);
> > > -
> > >  	for (n = 0; n < ARRAY_SIZE(pool->cache_list); n++)
> > >  		GEM_BUG_ON(!list_empty(&pool->cache_list[n]));
> > >  }
> > 
> > 
> 
> 
> 
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
