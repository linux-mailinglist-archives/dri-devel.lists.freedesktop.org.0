Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4360F4C8DAB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA03110E1BF;
	Tue,  1 Mar 2022 14:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C1310E1BF;
 Tue,  1 Mar 2022 14:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646144843; x=1677680843;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Olj/7Og0cDEDlC4o+iiIESvBX+/QWh5RtbWHEWn/m6c=;
 b=j85YKD1GIB+1gh9rpDqxURql62UOfd+E5wodhQ918SAxPqlR7NPpIFbO
 dMWGd0wyrZIwU6ZdNKXNh62VJrEfKx++prIGAwSH+84qoewj4yudRoJMS
 Fa1Avd14fBfLf8bBv1aO7h1WDm1Z0/OVCY+Nn4y7S0IZf/Wb8hQngTsjk
 WYX9yD4NPsqDpxHZxflKy/MrQmQZvXSvvmGAnvJnvR0135iSAESH71Xpy
 mMG7QNIKcKnfHyU1MWau6Tdb5/3Oa8zDXym5yVCT3yzxl/zzR2VbkbTkJ
 BqGRh84NX1eWdgwsNmju4XdADzd4q+o5HBHh8/SXNsMWraVMksEJi3e/p w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="313859936"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="313859936"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 06:27:22 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="510528592"
Received: from ssahani-mobl.amr.corp.intel.com (HELO [10.212.127.177])
 ([10.212.127.177])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 06:27:21 -0800
Message-ID: <42282635-50a8-505f-0bd5-5aef9945e3d3@linux.intel.com>
Date: Tue, 1 Mar 2022 14:27:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915: Depend on !PREEMPT_RT.
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <YgqmfKhwU5spS069@linutronix.de> <YhlgRb1lZO38gAz5@linutronix.de>
 <474ded6f-4fe8-8355-9a96-2254401d10fc@linux.intel.com>
 <YhylgaoHtSKi7+el@linutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YhylgaoHtSKi7+el@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/02/2022 10:35, Sebastian Andrzej Siewior wrote:
> On 2022-02-28 10:10:48 [+0000], Tvrtko Ursulin wrote:
>> Hi,
> Hi,
> 
>> Could you paste a link to the queue of i915 patches pending for a quick
>> overview of how much work there is and in what areas?
> 
> Last post to the list:
>    https://https://lkml.kernel.org/r/.kernel.org/all/20211214140301.520464-1-bigeasy@linutronix.de/
> 
> or if you look at the DRM section in
>     https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/tree/patches/series?h=v5.17-rc6-rt10-patches#n156

Thanks!

> you see:
>     0003-drm-i915-Use-preempt_disable-enable_rt-where-recomme.patch
>     0004-drm-i915-Don-t-disable-interrupts-on-PREEMPT_RT-duri.patch

Two for the display folks.

>     0005-drm-i915-Don-t-check-for-atomic-context-on-PREEMPT_R.patch

What do preempt_disable/enable do on PREEMPT_RT? Thinking if instead the 
solution could be to always force the !ATOMIC path (for the whole 
_wait_for_atomic macro) on PREEMPT_RT.

>     0006-drm-i915-Disable-tracing-points-on-PREEMPT_RT.patch

If the issue is only with certain trace points why disable all?

>     0007-drm-i915-skip-DRM_I915_LOW_LEVEL_TRACEPOINTS-with-NO.patch

Didn't quite fully understand, why is this not fixable? Especially 
thinking if the option of not blanket disabling all tracepoints in the 
previous patch.

>     0008-drm-i915-gt-Queue-and-wait-for-the-irq_work-item.patch

Not sure about why cond_resched was put between irq_work_queue and 
irq_work_sync - would it not be like-for-like change to have the two 
together? Commit message makes me think _queue already starts the 
handler on x86 at least.

>     0009-drm-i915-gt-Use-spin_lock_irq-instead-of-local_irq_d.patch

I think this is okay. The part after the unlock is serialized by the 
tasklet already.

Slight doubt due the comment:

   local_irq_enable(); /* flush irq_work (e.g. breadcrumb enabling) */

Makes me want to think about it harder but not now.

Another thing to check is if execlists_context_status_change still needs 
the atomic notifier chain with this change.

>     0010-drm-i915-Drop-the-irqs_disabled-check.patch

LGTM.

>     Revert-drm-i915-Depend-on-PREEMPT_RT.patch

Okay.

And finally for this very patch (the thread I am replying to):

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> 
> and you could view them from
>     https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/tree/patches?h=v5.17-rc6-rt10-patches
> 
>> Also, I assume due absence of ARCH_SUPPORTS_RT being defined by any arch,
>> that something more is not yet ready?
> 
> Correct. Looking at what I have queued for the next merge window I have
> less than 20 patches (excluding i915 and printk) before ARCH_SUPPORTS_RT
> can be enabled for x86-64.
>   
>> Regards,
>>
>> Tvrtko
> 
> Sebastian
