Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0277B8E5F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 22:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D192010E13A;
	Wed,  4 Oct 2023 20:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD9110E13A;
 Wed,  4 Oct 2023 20:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696453128; x=1727989128;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y5pXNFXelbboT4gg6FROl4vJrEX+k8iW+Y6+T7mpP5s=;
 b=O892v3rG5K/u6EypQC3rsDASYOE8+rc3WdBHXIeT1pCfxB5sMnmM8X4j
 nTqomqK/nwMTPJKXz6UQIiIfpE216G1K7xCxxyxkLAIoZoDzQkwA5FztK
 pOXHDJRprGP2wA5gHRhRZTkH3PkttBZFMUZq0AoC5WxRX9p6HD014jUdH
 bpUYmerXBcDBlEcBwpP33EZAjn+elLxC6yYnG7AwOBGFJmZ9XLvHIIl6p
 nGJLmR4rhDgO4Dwo3SJLNr05dEh9nQc0C9SFkxdVCfq37rrvSkgifgYrx
 rHi0q6pB4x0fFnNg/PwVD4EOQutBviL02UlpHzSD78bvl+WVF3pUMceym w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469573936"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="469573936"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 13:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="875267222"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="875267222"
Received: from nurf174x-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.147.206])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 13:58:39 -0700
Date: Wed, 4 Oct 2023 22:58:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH] drm/i915/gt: Do not treat MCR locking
 timeouts as errors
Message-ID: <ZR3R+Hr5pv/YGeFu@ashyti-mobl2.lan>
References: <20231004094357.634895-1-andi.shyti@linux.intel.com>
 <eefc8c62-1ac5-6604-2ee5-576ca87c2be5@linux.intel.com>
 <ZR1x0jlEzrCUNoip@ashyti-mobl2.lan>
 <4feb3f2e-ecbd-1fca-9568-409830f50ee5@intel.com>
 <ZR2+fyV6fW9PyILs@ashyti-mobl2.lan>
 <20231004200544.GE53570@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004200544.GE53570@mdroper-desk1.amr.corp.intel.com>
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
 John Harrison <john.c.harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

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
> > > > > >    drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
> > > > > >    1 file changed, 2 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > > index 326c2ed1d99b..51eb693df39b 100644
> > > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > > @@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
> > > > > >    	 * would indicate some hardware/firmware is misbehaving and not
> > > > > >    	 * releasing it properly.
> > > > > >    	 */
> > > > > > -	if (err == -ETIMEDOUT) {
> > > > > > -		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
> > > > > > -		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
> > > > > > -	}
> > > > > > +	if (err == -ETIMEDOUT)
> > > > > > +		gt_dbg(gt, "hardware MCR steering semaphore timed out");
> > > > > >    }
> > > > > >    /**
> > > > > Are we sure this does not warrant a level higher than dbg, such as
> > > > > notice/warn?
> > > > We might make it a warn, but this doesn't change much the economy
> > > > of the driver as we will keep doing what we were supposed to do.
> > > > 
> > > > > Because how can we be sure the two entities will not stomp on
> > > > > each other toes if we failed to obtain lock?
> > > > So far, in all the research I've done, no one looks like using
> > > > MCR lock, but yet someone is stuck in it.
> > > 
> > > If someone has the lock then that someone thinks they are using it. Just
> > > because you can't see what someone piece of IFWI is doing doesn't mean it
> > > isn't doing it. And if it is a genuinely missing unlock then it needs to be
> > > tracked down and fixed with an IFWI update otherwise the system is going to
> > > be unstable from that point on.
> > 
> > But I'm not changing here the behavior of the driver. The driver
> > will keep doing what was doing before.
> > 
> > Because this most probably won't be noticed by the user, then I
> > don't see why it should shout out loud that the system is
> > unusable when most probably it is.
> 
> That's like saying that any random race condition isn't likely to be
> noticed by the user so it's not a big deal if we're missing a few
> mutexes or spinlocks somewhere...even though there's likely to be no
> user-visible impact to any race condition 99% of the time, it's the 1%
> that winds up being absolutely catastrophic.

Not really... normally if you hit a spinlock/mutex race
condition, you end up in a deadlock and stall the system. In this
case, I agree that the lock should be sorted out by the hardware,
but in the meantime i915 is *already* ignoring it.

I'm not making any behavioral change with this patch.

What I'm trying to say is that if the system doesn't crash, then
let it go... don't crash it on purpose just because there is a
locking situation and we think it has a catastrophic effect, but
in reality is not producing anything (like practically in our
case, you can check the CI results[*]).

[*] https://patchwork.freedesktop.org/patch/560733/?series=124599&rev=1

> If we're not obtaining the MCR lock as expected and are simply moving
> forward to force our own steering (possibly at the same time firmware is
> programming steering to a different value), you probably won't actually
> see a problem either because the operations won't wind up interleaving
> in a problematic order, or because the driver and the firmware both
> happen to be trying to steer to the same instance (e.g., instance #0 is
> a quite common target).  But even if they're hard to hit, the
> possibility for a major problem is still there and basically we need to
> consider the whole platform to be in an unknown, unstable state once
> we've detected one of these issues.
> 
> Based on some earlier experiments, it sounds like the problem at the
> moment is that we've just been too hasty with deciding that the lock is
> "stuck."  There's no formal guidance on what an appropriate timeout is,
> but Jonathan's patch to increase the timeout by 10x (from 100ms to 1s)
> should hopefully take care of those cases and prevent us from causing
> any unprotected races.

Unfortunately it doesn't. Here[**] you can see how the situation
doesn't change in mtlp-8.

[**] https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_124576v2/index.html?

> If we have any other problems where the lock is
> truly stuck (as was seen after an S3 resume), that's a critical error
> that needs to be escalated to whichever component is the culprit --- any
> such system simply cannot be used safely.  Even if the KMD didn't notice
> such stuck semaphores itself, one misbehaving firmware agent could still
> block other firmware agents and cause major problems for the health of
> the system.

Agree... we are working with hardware guys to get down to the
root cause. We knew already when we merged this patch[***] that
this wouldn't fix the issue as the issue still lies underneath.

[***] 37280ef5c1c4 ("drm/i915: Clean steer semaphore on resume")

> > BTW, at my understanding this is not an IFWI problem. We checked
> > with different version of IFWI and the issue is the same.
> 
> It may not be an IFWI _regression_, but unless we're contending with
> ourselves (via different CPU threads, which I think we've already ruled
> out through some ftrace experiments), then it does mean that something
> in the IFWI is causing the lock to be held longer than expected.  That
> may have always been the behavior since day 1 and we just didn't notice
> until we got a relatively clean CI setup to start seeing these errors.
> 
> > 
> > Besides we received reports also from systems that are not using
> > IFWI at all.
> 
> What does this mean?  IFWI is just the generic term we use for the blob
> we flash onto the system that bundles a bunch of different types of
> firmware.  E.g., stuff like pcode firmware, csme, EFI GOP, etc.  If a
> 3rd party is putting together a MTL device, they probably refer to their
> firmware bundles with some term other than "IFWI" and may swap out some
> of the specific components, but at the end of the day the system still
> has the important low-level firmware running for things like pcode.
> 
> > 
> > > 
> > > > 
> > > > > (How can we be sure about
> > > > > "forgot to unlock" vs "in prolonged active use"?
> > > > There is a patch from Jonathan that is testing a different
> > > > timeout.
> > > > 
> > > > > Or if we can be sure, can
> > > > > we force unlock and take the lock for the driver explicitly?)
> > > > I sent a patch with this solution and Matt turned it down.
> > > 
> > > Presumably because both forcing a lock and ignoring a failed lock are Bad
> > > Things to be doing!
> > > Just because some entity out of our control isn't playing friendly doesn't
> > > mean we can ignore the problem. The lock is there for a reason. If someone
> > > else owns the lock then any steered access by i915 is potentially going to
> > > be routed to the wrong register as the other entity re-directs the steering
> > > behind out back. That is why there is an error message being printed.
> > > Because things are quite possibly going to fail in some unknown manner.
> > 
> > Yes, agree. This has been already discussed here[*] where I sent
> > such RFC for the sole purpose of receiving some opinions and
> > check how CI would behave.
> > 
> > BTW, we are already doing this during the GT resume[**]... it's a
> > bit of a different context, but it still forces the release of
> > the lock.
> 
> That resume-time patch is only deemed safe because we got explicit
> confirmation from the architects that it's not possible for any of the
> external agents to truly be using the MCR lock at that point during
> driver load and S3 resume.  It's still a serious bug in some firmware
> component, but in that specific case it's one that we can fix up
> ourselves without risk.  Any locking failures seen later on during
> regular system use cannot be solves safely.

Yes! Agree! :-)

Thanks, Matt!
Andi
