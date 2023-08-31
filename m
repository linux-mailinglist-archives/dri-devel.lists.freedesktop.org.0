Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10FD78EF1C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 16:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF0310E67D;
	Thu, 31 Aug 2023 14:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E3010E67D;
 Thu, 31 Aug 2023 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693490409; x=1725026409;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l/N6qgGvc2QkylKf6Jd7o1STK1wQt1v0FMLV2M6zGzA=;
 b=FTos3LbUcy54NY82JTDqBwHzOsjKDQkSnh/0qpEuKEBW3kCfGxoHUFJx
 iiTuGMDfXpL6CpPgrTQDu0UKK81Y3M+QYB8Q5R61kf3SqBGybwhg+0WyU
 NSOqgwkov3kYSNAtrJ1crRxzA/oRqS7HAm9mhiJRNkzn/y9oZknK6PcTL
 5IdcjUVcBE5OJPPCQJNffaeZYh/qO3hXEo/LyQcsQmUTt08s/aG/SCoKi
 caZy/qofeJF51e+XoEXkJJaHjZRRYf+CEh4lrK7jNyZrfdOX8QHsiWsIY
 pkUy86aAxgQOt9PhSxoID6nPApRdUlglFjb1K4lPgX7C7ur3rDfsNKZ3C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355451315"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="355451315"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 07:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="689366445"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="689366445"
Received: from dineshba-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.214.161])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 07:00:04 -0700
Date: Thu, 31 Aug 2023 16:00:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH v5] drm/i915: Avoid circular locking dependency when
 flush delayed work on gt reset
Message-ID: <ZPCc4CU+S6Gv6GzQ@ashyti-mobl2.lan>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
 <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
 <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > index a0e3ef1c65d2..600388c849f7 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > @@ -1359,7 +1359,16 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
> > > >    static void guc_cancel_busyness_worker(struct intel_guc *guc)
> > > >    {
> > > > -	cancel_delayed_work_sync(&guc->timestamp.work);
> > > > +	/*
> > > > +	 * When intel_gt_reset was called, task will hold a lock.
> > > > +	 * To cacel delayed work here, the _sync version will also acquire a lock, which might
> > > > +	 * trigger the possible cirular locking dependency warning.
> > > > +	 * Check the reset_in_progress flag, call async verion if reset is in progress.
> > > > +	 */
> > > This needs to explain in much more detail what is going on and why it is not
> > > a problem. E.g.:
> > > 
> > >     The busyness worker needs to be cancelled. In general that means
> > >     using the synchronous cancel version to ensure that an in-progress
> > >     worker will not keep executing beyond whatever is happening that
> > >     needs the cancel. E.g. suspend, driver unload, etc. However, in the
> > >     case of a reset, the synchronous version is not required and can
> > >     trigger a false deadlock detection warning.
> > > 
> > >     The business worker takes the reset mutex to protect against resets
> > >     interfering with it. However, it does a trylock and bails out if the
> > >     reset lock is already acquired. Thus there is no actual deadlock or
> > >     other concern with the worker running concurrently with a reset. So
> > >     an asynchronous cancel is safe in the case of a reset rather than a
> > >     driver unload or suspend type operation. On the other hand, if the
> > >     cancel_sync version is used when a reset is in progress then the
> > >     mutex deadlock detection sees the mutex being acquired through
> > >     multiple paths and complains.
> > > 
> > >     So just don't bother. That keeps the detection code happy and is
> > >     safe because of the trylock code described above.
> > So why do we even need to cancel anything if it doesn't do anything while
> > the reset is in progress?
> It still needs to be cancelled. The worker only aborts if it is actively
> executing concurrently with the reset. It might not start to execute until
> after the reset has completed. And there is presumably a reason why the
> cancel is being called, a reason not necessarily related to resets at all.
> Leaving the worker to run arbitrarily after the driver is expecting it to be
> stopped will lead to much worse things than a fake lockdep splat, e.g. a use
> after free pointer deref.

I was actually thinking why not leave things as they are and just
disable lockdep from CI. This doesn't look like a relevant report
to me.

Andi
