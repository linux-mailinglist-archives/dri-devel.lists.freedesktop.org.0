Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB627B8DDA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 22:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA89F10E1AA;
	Wed,  4 Oct 2023 20:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0687A10E1AA;
 Wed,  4 Oct 2023 20:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696450191; x=1727986191;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C8H2pZoVdO9jqd7l/wGlMIKPHgelzs/rav/qFlV4dsI=;
 b=Qs/fPc9McWozZNIR3HmcAFv4D3lRg+aYCZ2slqXrOUndl97w9aj3dcn4
 EvliY7MudlAgWakokVGukT+LXpIOp2viFz+acYednsGz7kBQ+x3zVOwsM
 U6Y/en9T7jPPFm3B4Mx2M7dDE6yScbfJ08+f1fwskKd9nhCoi1fWcKQgb
 n/tpz20XkAYWkQfrg5Pykoqc6butR52U57rJo5OCvuiCyK8RV1iKnlA6+
 kwNOIBIQ/bjFlxetHrH31QToO7F7tLeWDxo47kJhKKkGb5VGzfju8ENz3
 c4CTKLTsAD4jD8pcSHYSUwwuX3eMxb38T9UOvqpfIwutenlJue4WjQ0gu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447476137"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="447476137"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 13:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842046915"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="842046915"
Received: from nurf174x-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.147.206])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 13:09:44 -0700
Date: Wed, 4 Oct 2023 22:09:37 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH] drm/i915/gt: Do not treat MCR locking
 timeouts as errors
Message-ID: <ZR3GgUGu6GeZlk1b@ashyti-mobl2.lan>
References: <20231004094357.634895-1-andi.shyti@linux.intel.com>
 <eefc8c62-1ac5-6604-2ee5-576ca87c2be5@linux.intel.com>
 <ZR1x0jlEzrCUNoip@ashyti-mobl2.lan>
 <4feb3f2e-ecbd-1fca-9568-409830f50ee5@intel.com>
 <ZR2+fyV6fW9PyILs@ashyti-mobl2.lan>
 <e8747e83-a78b-058b-e76b-06bb63e85c7d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8747e83-a78b-058b-e76b-06bb63e85c7d@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, gregory.f.germano@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

> > > > > > The MCR steering semaphore is a shared lock entry between i915
> > > > > > and various firmware components.
> > > > > > 
> > > > > > Getting the lock might sinchronize on some shared resources.
> > > > > > Sometimes though, it might happen that the firmware forgets to
> > > > > > unlock causing unnecessary noise in the driver which keeps doing
> > > > > > what was supposed to do, ignoring the problem.
> > > > > > 
> > > > > > Do not consider this failure as an error, but just print a debug
> > > > > > message stating that the MCR locking has been skipped.
> > > > > > 
> > > > > > On the driver side we still have spinlocks that make sure that
> > > > > > the access to the resources is serialized.
> > > > > > 
> > > > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > > > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
> > > > > >     1 file changed, 2 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > > index 326c2ed1d99b..51eb693df39b 100644
> > > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > > @@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
> > > > > >     	 * would indicate some hardware/firmware is misbehaving and not
> > > > > >     	 * releasing it properly.
> > > > > >     	 */
> > > > > > -	if (err == -ETIMEDOUT) {
> > > > > > -		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
> > > > > > -		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
> > > > > > -	}
> > > > > > +	if (err == -ETIMEDOUT)
> > > > > > +		gt_dbg(gt, "hardware MCR steering semaphore timed out");
> > > > > >     }
> > > > > >     /**
> > > > > Are we sure this does not warrant a level higher than dbg, such as
> > > > > notice/warn?
> > > > We might make it a warn, but this doesn't change much the economy
> > > > of the driver as we will keep doing what we were supposed to do.
> > > > 
> > > > > Because how can we be sure the two entities will not stomp on
> > > > > each other toes if we failed to obtain lock?
> > > > So far, in all the research I've done, no one looks like using
> > > > MCR lock, but yet someone is stuck in it.
> > > If someone has the lock then that someone thinks they are using it. Just
> > > because you can't see what someone piece of IFWI is doing doesn't mean it
> > > isn't doing it. And if it is a genuinely missing unlock then it needs to be
> > > tracked down and fixed with an IFWI update otherwise the system is going to
> > > be unstable from that point on.
> > But I'm not changing here the behavior of the driver. The driver
> > will keep doing what was doing before.
> And what it is doing is dangerous and can lead to unpredictable results
> because a critical section resource access is no longer wrapped with a
> critical section lock. Hence there is an error message to say Here Be
> Dragons.

hehe!

What are you suggesting, then? Should we reset the GT after
hitting the MCR lock issue?

We could, but I rather prefer to work with what's available.

> > Because this most probably won't be noticed by the user, then I
> > don't see why it should shout out loud that the system is
> > unusable when most probably it is.
> Just because a race condition is hard to hit doesn't mean it won't be hit.

We are hitting it, constantly, but it's not producing any effect.
Even when raising the MCR wait timeout. Which means that most
probably someone is having a nap on the lock.

> The point of shouting out loud is that we know for a fact a problem has
> occurred. That problem might lead to nothing or it might lead to subtle data
> corruption, gross crashes or anything in between.

yes, agree... the message still stays, though, with a bit of a
lower catastrophy.

> > BTW, at my understanding this is not an IFWI problem. We checked
> > with different version of IFWI and the issue is the same.
> Which implies it is a driver bug after all? In which case you absolutely
> should not be papering over it in the driver.

This section is serialized by a spinlock and besides I haven't
found any place else except for the TLB invalidation and the
resume where we can incur a locking situation.

Thanks a lot for your inputs and discussion!
Andi
