Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24CA49AFD2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC48810EE03;
	Tue, 25 Jan 2022 09:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E135710EDFF;
 Tue, 25 Jan 2022 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643102935; x=1674638935;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/3uEJq4zPTSgXMeNYS74/NJZJxAc2UOZUhqwmZmqIfw=;
 b=bTNcKjQ4y/ekFOUHKFidqDUGH7863msbDffDaQ7OGxDEy04dAJE2hYpZ
 /ERIlXHxAPavVjy1UXJ5KxH7vzANtSrLzWxJWwETti1mBgWCBsIN4wi0/
 61yKIZ7P3PbNvodgTERY2AXniQLPjTdHnC6Okyvne1Ns5ZpHYwNu+P3If
 z8DRb4dCV97JGKhyrJ7d5YC5ieW2zjRdM3wf3KMknKUV8B3+zvOazaQ1V
 xRZT+om0y3fTZKVQ1hxXNOOXSq8W0LFAxNFhme1HZUh8JpEmcLMm3v4na
 Hy7uYXxUHW+p9zQt607xKg8uPU12+A75TPQe7x3IQ17nci9PGXCSr0kSQ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246044825"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="246044825"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:28:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="532366265"
Received: from thpham-mobl1.amr.corp.intel.com (HELO [10.213.172.16])
 ([10.213.172.16])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:28:51 -0800
Message-ID: <bab43c36-a3de-f96a-6530-4ab3a55b8ba0@linux.intel.com>
Date: Tue, 25 Jan 2022 09:28:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 17/54] gpu: drm: replace cpumask_weight with cpumask_empty
 where appropriate
Content-Language: en-US
To: Yury Norov <yury.norov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>, David Laight
 <David.Laight@aculab.com>, Joe Perches <joe@perches.com>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Alexey Klimov <aklimov@redhat.com>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220123183925.1052919-1-yury.norov@gmail.com>
 <20220123183925.1052919-18-yury.norov@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220123183925.1052919-18-yury.norov@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/01/2022 18:38, Yury Norov wrote:
> i915_pmu_cpu_online() calls cpumask_weight() to check if any bit of a
> given cpumask is set. We can do it more efficiently with cpumask_empty()
> because cpumask_empty() stops traversing the cpumask as soon as it finds
> first set bit, while cpumask_weight() counts all bits unconditionally.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index ea655161793e..1894c876b31d 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -1048,7 +1048,7 @@ static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>   	GEM_BUG_ON(!pmu->base.event_init);
>   
>   	/* Select the first online CPU as a designated reader. */
> -	if (!cpumask_weight(&i915_pmu_cpumask))
> +	if (cpumask_empty(&i915_pmu_cpumask))
>   		cpumask_set_cpu(cpu, &i915_pmu_cpumask);
>   
>   	return 0;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I see it's a large series which only partially appeared on our mailing 
lists. So for instance it hasn't got tested by our automated CI. (Not 
that I expect any problems in this patch.)

What are the plans in terms of which tree will it get merged through?

Regards,

Tvrtko
