Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21908617B03
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 11:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0082910E5D4;
	Thu,  3 Nov 2022 10:45:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8EE10E5D4;
 Thu,  3 Nov 2022 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667472347; x=1699008347;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fwMqHTvcTHgIJ6GDMEvidIpmIf3iVKlm+j5YQ4n592I=;
 b=GlFTTScSVtJwsMcNHs8aEYKzl2s2yhygMyFNWAvrObvIPooKa2n4R6f5
 oooFwW8Ote0bD2HsTiF8iVg/T9UGCesmV0LcCIZxCsSwhFGTlE9l937Y2
 PBtMyK8w9hGXkES8FW6E2xII1S4ormGUMZvootAiQIgJb1dcgzZpkaaJH
 bzXumz9PIIzZ9F6+Ml+UEoMPANE1F9XNNBQIeh+oW8LKRLs6LbZFdn3RH
 k5GX0EWIaIAzW2V27tXd1W2EMVyHNcW8USxLY0plBNOZjoCkdOxU0NB61
 5aSnoYKqjK6rTrEKmCCNnziqBQ63f5DKnI9v5+c8QMnqK+fml26EGZ9me A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="292969459"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="292969459"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 03:45:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="612604329"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="612604329"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 03:45:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't wait forever in drop_caches
In-Reply-To: <5e22de43-d75c-fc21-9ae7-f27d116c5688@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
 <87k04d7dyn.fsf@intel.com>
 <c710a428-50f6-6181-3f93-4d7667a9ac3f@linux.intel.com>
 <5e22de43-d75c-fc21-9ae7-f27d116c5688@intel.com>
Date: Thu, 03 Nov 2022 12:45:23 +0200
Message-ID: <87y1ssb9ks.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 02 Nov 2022, John Harrison <john.c.harrison@intel.com> wrote:
> On 11/2/2022 07:20, Tvrtko Ursulin wrote:
>> On 02/11/2022 12:12, Jani Nikula wrote:
>>> On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> At the end of each test, IGT does a drop caches call via sysfs with
>>>
>>> sysfs?
> Sorry, that was meant to say debugfs. I've also been working on some=20
> sysfs IGT issues and evidently got my wires crossed!
>
>>>
>>>> special flags set. One of the possible paths waits for idle with an
>>>> infinite timeout. That causes problems for debugging issues when CI
>>>> catches a "can't go idle" test failure. Best case, the CI system times
>>>> out (after 90s), attempts a bunch of state dump actions and then
>>>> reboots the system to recover it. Worst case, the CI system can't do
>>>> anything at all and then times out (after 1000s) and simply reboots.
>>>> Sometimes a serial port log of dmesg might be available, sometimes not.
>>>>
>>>> So rather than making life hard for ourselves, change the timeout to
>>>> be 10s rather than infinite. Also, trigger the standard
>>>> wedge/reset/recover sequence so that testing can continue with a
>>>> working system (if possible).
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>> =C2=A0 drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>>>> =C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c=20
>>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>>> index ae987e92251dd..9d916fbbfc27c 100644
>>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>>> @@ -641,6 +641,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRO=
P_RESET_ACTIVE | \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRO=
P_RESET_SEQNO | \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRO=
P_RCU)
>>>> +
>>>> +#define DROP_IDLE_TIMEOUT=C2=A0=C2=A0=C2=A0 (HZ * 10)
>>>
>>> I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also only used
>>> here.
>>
>> So move here, dropping i915 prefix, next to the newly proposed one?
> Sure, can do that.
>
>>
>>> I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
>>> gt/intel_gt.c.
>>
>> Move there and rename to GT_IDLE_TIMEOUT?
>>
>>> I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in intel_gt_pm.c.
>>
>> No action needed, maybe drop i915 prefix if wanted.
>>
> These two are totally unrelated and in code not being touched by this=20
> change. I would rather not conflate changing random other things with=20
> fixing this specific issue.
>
>>> I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.
>>
>> Add _MS suffix if wanted.
>>
>>> My head spins.
>>
>> I follow and raise that the newly proposed DROP_IDLE_TIMEOUT applies=20
>> to DROP_ACTIVE and not only DROP_IDLE.
> My original intention for the name was that is the 'drop caches timeout=20
> for intel_gt_wait_for_idle'. Which is quite the mouthful and hence=20
> abbreviated to DROP_IDLE_TIMEOUT. But yes, I realised later that name=20
> can be conflated with the DROP_IDLE flag. Will rename.
>
>
>>
>> Things get refactored, code moves around, bits get left behind, who=20
>> knows. No reason to get too worked up. :) As long as people are taking=20
>> a wider view when touching the code base, and are not afraid to send=20
>> cleanups, things should be good.
> On the other hand, if every patch gets blocked in code review because=20
> someone points out some completely unrelated piece of code could be a=20
> bit better then nothing ever gets fixed. If you spot something that you=20
> think should be improved, isn't the general idea that you should post a=20
> patch yourself to improve it?

The general idea is that every change should improve the driver. If you
need to modify something that's a mess, you fix the mess instead of
adding to the mess. You can't put the onus on cleaning up after you on
someone else.

Sure, the patch at hand is neglible, but hey, so are the fixes.

BR,
Jani.


>
>
>>
>> For the actual functional change at hand - it would be nice if code=20
>> paths in question could handle SIGINT and then we could punt the=20
>> decision on how long someone wants to wait purely to userspace. But=20
>> it's probably hard and it's only debugfs so whatever.
>>
> The code paths in question will already abort on a signal won't they?=20
> Both intel_gt_wait_for_idle() and intel_guc_wait_for_pending_msg(),=20
> which is where the uc_wait_for_idle eventually ends up, have an=20
> 'if(signal_pending) return -EINTR;' check. Beyond that, it sounds like=20
> what you are asking for is a change in the IGT libraries and/or CI=20
> framework to start sending signals after some specific timeout. That=20
> seems like a significantly more complex change (in terms of the number=20
> of entities affected and number of groups involved) and unnecessary.
>
>> Whether or not 10s is enough CI will hopefully tell us. I'd probably=20
>> err on the side of safety and make it longer, but at most half from=20
>> the test runner timeout.
> This is supposed to be test clean up. This is not about how long a=20
> particular test takes to complete but about how long it takes to declare=
=20
> the system broken after the test has already finished. I would argue=20
> that even 10s is massively longer than required.
>
>>
>> I am not convinced that wedging is correct though. Conceptually could=20
>> be just that the timeout is too short. What does wedging really give=20
>> us, on top of limiting the wait, when latter AFAIU is the key factor=20
>> which would prevent the need to reboot the machine?
>>
> It gives us a system that knows what state it is in. If we can't idle=20
> the GT then something is very badly wrong. Wedging indicates that. It=20
> also ensure that a full GT reset will be attempted before the next test=20
> is run. Helping to prevent a failure on test X from propagating into=20
> failures of unrelated tests X+1, X+2, ... And if the GT reset does not=20
> work because the system is really that badly broken then future tests=20
> will not run rather than report erroneous failures.
>
> This is not about getting a more stable system for end users by sweeping=
=20
> issues under the carpet and pretending all is well. End users don't run=20
> IGTs or explicitly call dodgy debugfs entry points. The sole motivation=20
> here is to get more accurate results from CI. That is, correctly=20
> identifying which test has hit a problem, getting valid debug analysis=20
> for that test (logs and such) and allowing further testing to complete=20
> correctly in the case where the system can be recovered.
>
> John.
>
>> Regards,
>>
>> Tvrtko
>

--=20
Jani Nikula, Intel Open Source Graphics Center
