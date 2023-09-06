Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A927937E1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCA010E5B1;
	Wed,  6 Sep 2023 09:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2BD10E5A9;
 Wed,  6 Sep 2023 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693991855; x=1725527855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=59bLv4KLEPTsW/Kpuzfm11fkHZsbY2iGvbMNU7NcZ9o=;
 b=TPYGUIKD4en0yJV6SzO7mMQblLQtcvTgnZ3p9M7Q0hEK53wdOARy3VhB
 D3CBEOowQvnbqYiPjoOcB/hBAJAhfkC+P0CJ/4X4rZnmDn+tkwMDzPL9m
 k5WbxK9B/4BiuQTtnAHBWRknQpbOE1uXaUe/DmnWcMqH/iJg+Zk6e2GqW
 J9f6YDtUigPVJW2JN9DLXkp7oqxsZzezfec+3w7b0HFe7WFdS0F3ChI52
 O0R8ro6ow6r4y29NouQVgHTW7cluABLlDUTpC+RrUk50Io4PgLVfUOsWo
 o9m7LjRkDJyfRjMo8J3M+Eg+35t1lTfO7Lm1FnpggGXCekKzFsQ9TKB5V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375916951"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="375916951"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="988161031"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="988161031"
Received: from kmiranda-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.216.135])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:17:32 -0700
Date: Wed, 6 Sep 2023 11:17:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH v5] drm/i915: Avoid circular locking dependency when
 flush delayed work on gt reset
Message-ID: <ZPhDqTusn9FYY8qV@ashyti-mobl2.lan>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
 <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
 <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
 <ZPCc4CU+S6Gv6GzQ@ashyti-mobl2.lan>
 <983eb186-5b6a-8df3-1e67-eb7da6a8dbcd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <983eb186-5b6a-8df3-1e67-eb7da6a8dbcd@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Zhanjun Dong <zhanjun.dong@intel.com>,
 intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

> > > > > >     static void guc_cancel_busyness_worker(struct intel_guc *guc)
> > > > > >     {
> > > > > > -	cancel_delayed_work_sync(&guc->timestamp.work);
> > > > > > +	/*
> > > > > > +	 * When intel_gt_reset was called, task will hold a lock.
> > > > > > +	 * To cacel delayed work here, the _sync version will also acquire a lock, which might
> > > > > > +	 * trigger the possible cirular locking dependency warning.
> > > > > > +	 * Check the reset_in_progress flag, call async verion if reset is in progress.
> > > > > > +	 */
> > > > > This needs to explain in much more detail what is going on and why it is not
> > > > > a problem. E.g.:
> > > > > 
> > > > >      The busyness worker needs to be cancelled. In general that means
> > > > >      using the synchronous cancel version to ensure that an in-progress
> > > > >      worker will not keep executing beyond whatever is happening that
> > > > >      needs the cancel. E.g. suspend, driver unload, etc. However, in the
> > > > >      case of a reset, the synchronous version is not required and can
> > > > >      trigger a false deadlock detection warning.
> > > > > 
> > > > >      The business worker takes the reset mutex to protect against resets
> > > > >      interfering with it. However, it does a trylock and bails out if the
> > > > >      reset lock is already acquired. Thus there is no actual deadlock or
> > > > >      other concern with the worker running concurrently with a reset. So
> > > > >      an asynchronous cancel is safe in the case of a reset rather than a
> > > > >      driver unload or suspend type operation. On the other hand, if the
> > > > >      cancel_sync version is used when a reset is in progress then the
> > > > >      mutex deadlock detection sees the mutex being acquired through
> > > > >      multiple paths and complains.
> > > > > 
> > > > >      So just don't bother. That keeps the detection code happy and is
> > > > >      safe because of the trylock code described above.
> > > > So why do we even need to cancel anything if it doesn't do anything while
> > > > the reset is in progress?
> > > It still needs to be cancelled. The worker only aborts if it is actively
> > > executing concurrently with the reset. It might not start to execute until
> > > after the reset has completed. And there is presumably a reason why the
> > > cancel is being called, a reason not necessarily related to resets at all.
> > > Leaving the worker to run arbitrarily after the driver is expecting it to be
> > > stopped will lead to much worse things than a fake lockdep splat, e.g. a use
> > > after free pointer deref.
> > I was actually thinking why not leave things as they are and just
> > disable lockdep from CI. This doesn't look like a relevant report
> > to me.
> > 
> > Andi
> Disable lockdep? The whole of lockdep? We absolutely do not want to disable
> an extremely important deadlock testing infrastructure in our test
> framework. That would be defeating the whole point of CI.
> 
> Potentially we could annotate this one particular scenario to suppress this
> one particular error.  But it seems simpler and safer to just update the
> code to not hit that scenario in the first place.

yes... lockdep is a debug tool and might provide false reports...
We need to have a great willingness to start fixing and hunting
debug lockdep's false positives (like this one, for instance).

It's even more annoying to reduce our CI pass rates, especially
when in BAT tests, with such false deadlocks.

It's the developer's responsibility to test its code with
debug_lockdep and fix all the potential deadlocks and ignore the
false ones.

I sent a patch for this[*] already.

Andi

[*] https://gitlab.freedesktop.org/gfx-ci/i915-infra/-/merge_requests/128
