Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF897205BB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 17:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526A110E053;
	Fri,  2 Jun 2023 15:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C75210E053;
 Fri,  2 Jun 2023 15:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685719060; x=1717255060;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=74UhatMK3UUnku/iBSUieKfKmyh3IZ573NQGhAHsK3w=;
 b=DVEZsSVOHxt9jhb4UZFg9TZYakbhIIggik8+qQDkJkpXbHp181jXVaQy
 Lr+MP5eGVCNPTRTkiYZ6L03V+FddbmFoLoXDrp4iPYQJwrqS+1KYCJk1z
 D2e5fQ6lhVqOa5s/F0zKuqlWjlNcHBQXCBDZ61B3kNLd8+yylS5mXxmSD
 n0a8ORnDcefnOI0qZaIiivNWF/cH8Y/tSMOiK22NuXc3HL66RdQwE22p1
 jTsc4xvFlI6zq+eoqX8QX9xGbhJa9QIT+c88P+HF+LoleC2JeZBrtCO4w
 sEu+IaF7PVYYs8TokMuGUb+zHuBTd6K1E6nJDqDhtO2Gm/LoWscP+GeVT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="340522819"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="340522819"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 08:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707887171"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="707887171"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.111])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 08:17:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Nathan Chancellor
 <nathan@kernel.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pxp: Fix size_t format specifier
 in gsccs_send_message()
In-Reply-To: <ZHZQ1gAWjdDql4Oi@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230530-i915-pxp-size_t-wformat-v1-1-9631081e2e5b@kernel.org>
 <ZHZQ1gAWjdDql4Oi@ashyti-mobl2.lan>
Date: Fri, 02 Jun 2023 18:17:32 +0300
Message-ID: <87zg5hdhbn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: tvrtko.ursulin@linux.intel.com, alan.previn.teres.alexis@intel.com,
 intel-gfx@lists.freedesktop.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 May 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Nathan,
>
> On Tue, May 30, 2023 at 11:37:56AM -0700, Nathan Chancellor wrote:
>> When building ARCH=i386 allmodconfig, the following warning occurs:
>> 
>>   In file included from include/linux/device.h:15,
>>                    from include/linux/node.h:18,
>>                    from include/linux/cpu.h:17,
>>                    from include/linux/static_call.h:135,
>>                    from arch/x86/include/asm/perf_event.h:5,
>>                    from include/linux/perf_event.h:25,
>>                    from drivers/gpu/drm/i915/i915_pmu.h:11,
>>                    from drivers/gpu/drm/i915/gt/intel_engine_types.h:21,
>>                    from drivers/gpu/drm/i915/gt/intel_context_types.h:18,
>>                    from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20,
>>                    from drivers/gpu/drm/i915/i915_request.h:34,
>>                    from drivers/gpu/drm/i915/i915_active.h:13,
>>                    from drivers/gpu/drm/i915/gt/intel_context.h:13,
>>                    from drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:8:
>>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c: In function 'gsccs_send_message':
>>   include/drm/drm_print.h:456:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
>>     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
>>         |                                       ^~~~~~~~
>>   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
>>     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>>         |                              ^~~
>>   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
>>     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
>>         |                                                             ^~~~~~~
>>   include/drm/drm_print.h:456:9: note: in expansion of macro 'dev_warn'
>>     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
>>         |         ^~~~
>>   include/drm/drm_print.h:466:9: note: in expansion of macro '__drm_printk'
>>     466 |         __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
>>         |         ^~~~~~~~~~~~
>>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:146:17: note: in expansion of macro 'drm_warn'
>>     146 |                 drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
>>         |                 ^~~~~~~~
>>   cc1: all warnings being treated as errors
>> 
>> Use the '%zu' format specifier, as the variable is a 'size_t'.
>> 
>> Fixes: dc9ac125d81f ("drm/i915/pxp: Add GSC-CS backend to send GSC fw messages")
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> yes, as specified in Documentation/core-api/printk-formats.rst.
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks for the patch and review, pushed to drm-intel-gt-next. The CI
failure was about hdac, hardly anything to do with this one.

BR,
Jani.


>
> Thanks,
> Andi

-- 
Jani Nikula, Intel Open Source Graphics Center
