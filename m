Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF747B8D7A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 21:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED83D10E1A1;
	Wed,  4 Oct 2023 19:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EF010E190;
 Wed,  4 Oct 2023 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696448150; x=1727984150;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3MSgrpK0tcCSWMxrKSqhu3dNqQFYyjpZUHdVjLgFTbw=;
 b=k5NrNiwuC3INGdWktbxgB6/srlnPKuGx4ZCJh3gfoqgl63h6ajhnTNIx
 ewlr3I+e3ULfwqFyldYaD/uBF4GalhWWiav6X86L9JLFkb0exAfpk4W2E
 HTzCrIbcjJV2w4PUub/nxgtfkux+0LicKkM0oKixgU9q0VXB2MUt5eG/j
 KO6iyp3kBN79KgGWjTgExUQ9TMkR90dUJ/ySJkcIgxolNnQxqOEHGH6PY
 RHuzTd4w1rbG+s31vxlfxJb4ixMIxQQgsTYrJ1or4ftAvd3oVtzf0JqVI
 1DCofWSS6iPzxs09RTYp37aa+dskytUSywADk4lVYFUMPin4z6c7rbyAU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380561155"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="380561155"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 12:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998626171"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="998626171"
Received: from nurf174x-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.147.206])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 12:35:34 -0700
Date: Wed, 4 Oct 2023 21:35:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH] drm/i915/gt: Do not treat MCR locking
 timeouts as errors
Message-ID: <ZR2+fyV6fW9PyILs@ashyti-mobl2.lan>
References: <20231004094357.634895-1-andi.shyti@linux.intel.com>
 <eefc8c62-1ac5-6604-2ee5-576ca87c2be5@linux.intel.com>
 <ZR1x0jlEzrCUNoip@ashyti-mobl2.lan>
 <4feb3f2e-ecbd-1fca-9568-409830f50ee5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4feb3f2e-ecbd-1fca-9568-409830f50ee5@intel.com>
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

> > > > The MCR steering semaphore is a shared lock entry between i915
> > > > and various firmware components.
> > > > 
> > > > Getting the lock might sinchronize on some shared resources.
> > > > Sometimes though, it might happen that the firmware forgets to
> > > > unlock causing unnecessary noise in the driver which keeps doing
> > > > what was supposed to do, ignoring the problem.
> > > > 
> > > > Do not consider this failure as an error, but just print a debug
> > > > message stating that the MCR locking has been skipped.
> > > > 
> > > > On the driver side we still have spinlocks that make sure that
> > > > the access to the resources is serialized.
> > > > 
> > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
> > > >    1 file changed, 2 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > index 326c2ed1d99b..51eb693df39b 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > @@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
> > > >    	 * would indicate some hardware/firmware is misbehaving and not
> > > >    	 * releasing it properly.
> > > >    	 */
> > > > -	if (err == -ETIMEDOUT) {
> > > > -		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
> > > > -		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
> > > > -	}
> > > > +	if (err == -ETIMEDOUT)
> > > > +		gt_dbg(gt, "hardware MCR steering semaphore timed out");
> > > >    }
> > > >    /**
> > > Are we sure this does not warrant a level higher than dbg, such as
> > > notice/warn?
> > We might make it a warn, but this doesn't change much the economy
> > of the driver as we will keep doing what we were supposed to do.
> > 
> > > Because how can we be sure the two entities will not stomp on
> > > each other toes if we failed to obtain lock?
> > So far, in all the research I've done, no one looks like using
> > MCR lock, but yet someone is stuck in it.
> 
> If someone has the lock then that someone thinks they are using it. Just
> because you can't see what someone piece of IFWI is doing doesn't mean it
> isn't doing it. And if it is a genuinely missing unlock then it needs to be
> tracked down and fixed with an IFWI update otherwise the system is going to
> be unstable from that point on.

But I'm not changing here the behavior of the driver. The driver
will keep doing what was doing before.

Because this most probably won't be noticed by the user, then I
don't see why it should shout out loud that the system is
unusable when most probably it is.

BTW, at my understanding this is not an IFWI problem. We checked
with different version of IFWI and the issue is the same.

Besides we received reports also from systems that are not using
IFWI at all.

> 
> > 
> > > (How can we be sure about
> > > "forgot to unlock" vs "in prolonged active use"?
> > There is a patch from Jonathan that is testing a different
> > timeout.
> > 
> > > Or if we can be sure, can
> > > we force unlock and take the lock for the driver explicitly?)
> > I sent a patch with this solution and Matt turned it down.
> 
> Presumably because both forcing a lock and ignoring a failed lock are Bad
> Things to be doing!
> Just because some entity out of our control isn't playing friendly doesn't
> mean we can ignore the problem. The lock is there for a reason. If someone
> else owns the lock then any steered access by i915 is potentially going to
> be routed to the wrong register as the other entity re-directs the steering
> behind out back. That is why there is an error message being printed.
> Because things are quite possibly going to fail in some unknown manner.

Yes, agree. This has been already discussed here[*] where I sent
such RFC for the sole purpose of receiving some opinions and
check how CI would behave.

BTW, we are already doing this during the GT resume[**]... it's a
bit of a different context, but it still forces the release of
the lock.

This patch, anyway, is not doing this.

Thanks a lot,
Andi

[*] https://patchwork.freedesktop.org/series/124402/
[**] 37280ef5c1c4 ("drm/i915: Clean steer semaphore on resume")
