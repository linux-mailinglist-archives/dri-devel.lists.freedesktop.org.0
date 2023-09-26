Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731A87AEA08
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 12:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B2E10E397;
	Tue, 26 Sep 2023 10:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Tue, 26 Sep 2023 10:10:53 UTC
Received: from mgamail.intel.com (unknown [198.175.65.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E8810E389;
 Tue, 26 Sep 2023 10:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695723054; x=1727259054;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qwKYWRuF1ObaOkqWlf8IjpbYZ64/s+PDxB2Lmueb5kc=;
 b=E5NfjV9EHGchA18qAoVvi+0j3WUnJxyFz8yecsbu/FQz53zU8UG3vu5Z
 6HbOwCTr3t+QbdFCr3u7e6heHc3cMvGB1FGEYyK+vqme+GNDtfvdcNtDJ
 jGVPpimu2wPeLZJug4EIMf+fvINSAZimCQCGH50UicliJ9c6xa5yF6bff
 HQpa9FjZAHqW6u9K+/srKnMAzMuMvj07sjCwq64OeqSLOnvaf5bDenwn1
 9m9Jagr7mlPkFnkZ9CSJ9l5eUEN9kEO7OfXd3l3+VoFwv2Kvup59b4PUl
 xT92iiXM4oCgh4F7ftDXjFx7qvoi8YJa5pqOAtwUG4+rPruFHbgkTQP+x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="174571"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="174571"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 03:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838973973"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="838973973"
Received: from dilipban-mobl.ger.corp.intel.com (HELO [10.213.201.63])
 ([10.213.201.63])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 03:03:45 -0700
Message-ID: <28a7da40-9589-b81f-f32f-f7c3bb30836c@linux.intel.com>
Date: Tue, 26 Sep 2023 11:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Do not disable preemption for resets
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230705093025.3689748-1-tvrtko.ursulin@linux.intel.com>
 <ZRKhy6QcQ28Z2cPT@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZRKhy6QcQ28Z2cPT@ashyti-mobl2.lan>
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
 Intel-gfx@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/09/2023 10:18, Andi Shyti wrote:
> Hi Tvrtko,
> 
>> Commit ade8a0f59844 ("drm/i915: Make all GPU resets atomic") added a
>> preempt disable section over the hardware reset callback to prepare the
>> driver for being able to reset from atomic contexts.
>>
>> In retrospect I can see that the work item at a time was about removing
>> the struct mutex from the reset path. Code base also briefly entertained
>> the idea of doing the reset under stop_machine in order to serialize
>> userspace mmap and temporary glitch in the fence registers (see
>> eb8d0f5af4ec ("drm/i915: Remove GPU reset dependence on struct_mutex"),
>> but that never materialized and was soon removed in 2caffbf11762
>> ("drm/i915: Revoke mmaps and prevent access to fence registers across
>> reset") and replaced with a SRCU based solution.
>>
>> As such, as far as I can see, today we still have a requirement that
>> resets must not sleep (invoked from submission tasklets), but no need to
>> support invoking them from a truly atomic context.
>>
>> Given that the preemption section is problematic on RT kernels, since the
>> uncore lock becomes a sleeping lock and so is invalid in such section,
>> lets try and remove it. Potential downside is that our short waits on GPU
>> to complete the reset may get extended if CPU scheduling interferes, but
>> in practice that probably isn't a deal breaker.
>>
>> In terms of mechanics, since the preemption disabled block is being
>> removed we just need to replace a few of the wait_for_atomic macros into
>> busy looping versions which will work (and not complain) when called from
>> non-atomic sections.
> 
> looks reasonable, few unrelated questions
> 
>> ---
>>   drivers/gpu/drm/i915/gt/intel_reset.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index e2152f75ba2e..6916eba3bd33 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -167,13 +167,13 @@ static int i915_do_reset(struct intel_gt *gt,
>>   	/* Assert reset for at least 20 usec, and wait for acknowledgement. */
> 
> is this /20/50/ ?

Unrelated change but okay.

> 
>>   	pci_write_config_byte(pdev, I915_GDRST, GRDOM_RESET_ENABLE);
>>   	udelay(50);
>> -	err = wait_for_atomic(i915_in_reset(pdev), 50);
>> +	err = _wait_for_atomic(i915_in_reset(pdev), 50, 0);
> 
> wait_for_atomic() waits in milliseconds, while _wait_for_atomic()
> waits in microseconds, I think you need to update the timer.

Ah.. well spotted!

> Do you think we might need a wait_for_atomic_preempt() macro?
> 
> 	err = wait_for_atomic_preempt(i915_in_reset(pdev), 50);

I don't see what it would do? _wait_for_atomic when ATOMIC == 0 already 
enables preemption. To allow passing in milliseconds? I fear one more 
macro would create more confusion.

Regards,

Tvrtko
