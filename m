Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A93906F0
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 18:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F6C6E406;
	Tue, 25 May 2021 16:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3196E25A;
 Tue, 25 May 2021 16:52:22 +0000 (UTC)
IronPort-SDR: oWFCi6fCAMW68zoqT3jdiAF5cbly/WPlCGzls0B6Fu/45EvUaDSf3HCND5Lp1ofsnJaZks/wOs
 PTkaSZcoEX3A==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182566403"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="182566403"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 09:52:14 -0700
IronPort-SDR: 6i2AB7w/feHH3pcDpQ/slT3nh+rm5UAF+DixQDy8J0VY+IWPkQyYBeZciQ+Gm6r8ueDC1EIIPD
 KhbGeO6wDt/Q==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="546702655"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 09:52:13 -0700
Date: Tue, 25 May 2021 09:45:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in
 the i915
Message-ID: <20210525164504.GA9971@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <de3965d8-d997-5685-0399-646d8823a27f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de3965d8-d997-5685-0399-646d8823a27f@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 11:32:26AM +0100, Tvrtko Ursulin wrote:
> 
> On 06/05/2021 20:13, Matthew Brost wrote:
> > Basic GuC submission support. This is the first bullet point in the
> > upstreaming plan covered in the following RFC [1].
> > 
> > At a very high level the GuC is a piece of firmware which sits between
> > the i915 and the GPU. It offloads some of the scheduling of contexts
> > from the i915 and programs the GPU to submit contexts. The i915
> > communicates with the GuC and the GuC communicates with the GPU.
> > 
> > GuC submission will be disabled by default on all current upstream
> > platforms behind a module parameter - enable_guc. A value of 3 will
> > enable submission and HuC loading via the GuC. GuC submission should
> > work on all gen11+ platforms assuming the GuC firmware is present.
> > 
> > This is a huge series and it is completely unrealistic to merge all of
> > these patches at once. Fortunately I believe we can break down the
> > series into different merges:
> > 
> > 1. Merge Chris Wilson's patches. These have already been reviewed
> > upstream and I fully agree with these patches as a precursor to GuC
> > submission.
> > 
> > 2. Update to GuC 60.1.2. These are largely Michal's patches.
> > 
> > 3. Turn on GuC/HuC auto mode by default.
> > 
> > 4. Additional patches needed to support GuC submission. This is any
> > patch not covered by 1-3 in the first 34 patches. e.g. 'Engine relative
> > MMIO'
> > 
> > 5. GuC submission support. Patches number 35+. These all don't have to
> > merge at once though as we don't actually allow GuC submission until the
> > last patch of this series.
> 
> For the GuC backend/submission part only - it seems to me none of my review
> comments I made in December 2019 have been implemented. At that point I

I wouldn't say none of the fixes have done, lots have just not
everything you wanted.

> stated, and this was all internally at the time mind you, that I do not
> think the series is ready and there were several high level issues that
> would need to be sorted out. I don't think I gave my ack or r-b back then
> and the promise was a few things would be worked on post (internal) merge.
> That was supposed to include upstream refactoring to enable GuC better
> slotting in as a backed. Fast forward a year and a half later and the only
> progress we had in this area has been deleted.
> 
> From the top of my head, and having glanced the series as posted:
> 
>  * Self-churn factor in the series is too high.

Not sure what you mean by this? The patches have been reworked
internally too much?

>  * Patch ordering issues.

We are going to clean up some of the ordering as these 97 patches are
posted in smaller mergeable series but at the end of the day this is a
bit of a bikeshed. GuC submission can't be turned until patch 97 so IMO
it really isn't all that big of a deal the order of which patches before
that land as we are not breaking anything.

>  * GuC context state machine is way too dodgy to have any confidence it can
> be read and race conditions understood.

I know you don't really like the state machine but no other real way to
not have DoS on resources and no real way to fairly distribute guc_ids
without it. I know you have had other suggestions here but none of your
suggestions either will work or they are no less complicated in the end.

For what it is worth, the state machine will get simplified when we hook
into the DRM scheduler as won't have to deal with submitting from IRQ
contexts in the backend or having more than 1 request in the backend at
a time.

>  * Context pinning code with it's magical two adds, subtract and cmpxchg is
> dodgy as well.

Daniele tried to remove this and it proved quite difficult + created
even more races in the backend code. This was prior to the pre-pin and
post-unpin code which makes this even more difficult to fix as I believe
these functions would need to be removed first. Not saying we can't
revisit this someday but I personally really like it - it is a clever
way to avoid reentering the pin / unpin code while asynchronous things
are happening rather than some complex locking scheme. Lastly, this code
has proved incredibly stable as I don't think we've had to fix a single
thing in this area since we've been using this code internally.

>  * Kludgy way of interfacing with rest of the driver instead of refactoring
> to fit (idling, breadcrumbs, scheduler, tasklets, ...).
>

Idling and breadcrumbs seem clean to me. Scheduler + tasklet are going
away once the DRM scheduler lands. No need rework those as we are just
going to rework this again.
 
> Now perhaps the latest plan is to ignore all these issues and still merge,
> then follow up with throwing it away, mostly or at least largely, in which
> case there isn't any point really to review the current state yet again. But
> it is sad that we got to this state. So just for the record - all this was
> reviewed in Nov/Dec 2019. By me among other folks and I at least deemed it
> not ready in this form.
> 

I personally don't think it is really in that bad of shape. The fact
that I could put together a PoC more or less fully integrating this
backend into the DRM scheduler within a few days I think speaks to the
quality and flexablitiy of this backend compared to execlists.

Matt 

> Regards,
> 
> Tvrtko
