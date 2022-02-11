Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF1D4B2A1F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 17:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA1E10EAC7;
	Fri, 11 Feb 2022 16:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C3C10EAB8;
 Fri, 11 Feb 2022 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644596410; x=1676132410;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rjBaKou1SggQZNDW+0V5dlFmB6ixKQxsY2j9egax5dA=;
 b=T3UbDxsqmw8mwlo/J9R7ryl7OTFsFgxaBeu13pjCgsUA936lswF8nrod
 xRIxUcZ4J7pyQCEy6S3Nw8Z1PmbdFGH9rYHlqGtgDGydBCtOribE8MZ5k
 mMqyXh52j3g9FQzTnt+jzXBrmNKurv8oB9gT/Ujm4vishL/kfJZudcfFR
 VPHFQB52EnqHQ3FMoxcsfS+ZZCNTXMifySl1MaBELBMF5iP/WiEZZ3Smt
 XIISw3PPWD8FS5YuSCpBw8cBxHgjg54BVhMJv5/f5VrVW/eWkxKJzKdnV
 LqtWatLn8aVZ6LTTcUBZbwgyS/evGN/MaJeN5F9xZSkhx3ICvxXkyuj9R A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248590720"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="248590720"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 08:20:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="483484701"
Received: from phughe1x-mobl2.ger.corp.intel.com (HELO [10.213.201.219])
 ([10.213.201.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 08:20:06 -0800
Message-ID: <1cc547fb-b220-3384-8a30-54dae9b2e037@linux.intel.com>
Date: Fri, 11 Feb 2022 16:20:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/1] drm/i915/gt: Move wbvind_on_all_cpus #define
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220210214216.1227694-1-michael.cheng@intel.com>
 <20220210214216.1227694-2-michael.cheng@intel.com> <87iltl7cjy.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87iltl7cjy.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com, dri-devel@lists.freedesktop.org,
 wayne.boyer@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/02/2022 13:33, Jani Nikula wrote:
> On Thu, 10 Feb 2022, Michael Cheng <michael.cheng@intel.com> wrote:
>> Move wbvind_on_all_cpus to intel_gt.h. This will allow other wbind_on_all_cpus
>> calls to benefit from the #define logic, and prevent compiler errors
>> when building for non-x86 architectures.
>>
>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_pm.c | 7 -------
>>   drivers/gpu/drm/i915/gt/intel_gt.h     | 7 +++++++
>>   2 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
>> index 6da68b38f00f..ff7340ae5ac8 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
>> @@ -12,13 +12,6 @@
>>   
>>   #include "i915_drv.h"
>>   
>> -#if defined(CONFIG_X86)
>> -#include <asm/smp.h>
>> -#else
>> -#define wbinvd_on_all_cpus() \
>> -	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
>> -#endif
>> -
>>   void i915_gem_suspend(struct drm_i915_private *i915)
>>   {
>>   	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>> index 2dad46c3eff2..149e8c13e402 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>> @@ -10,6 +10,13 @@
>>   #include "intel_gt_types.h"
>>   #include "intel_reset.h"
>>   
>> +#if defined(CONFIG_X86)
>> +#include <asm/smp.h>
>> +#else
>> +#define wbinvd_on_all_cpus() \
>> +         pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
>> +#endif
> 
> Don't include headers from headers if it can be avoided.
> 
> gt/intel_gt.h is included from 79 files. We don't want all of them to
> include <asm/smp.h> when only 3 files actually need
> wbinvd_on_all_cpus().
> 
> Also, gt/intel_gt.h has absolutely nothing to do with
> wbinvd_on_all_cpus() or asm/smp.h. Please don't use topical headers as
> dumping grounds for random things.
> 
> Maybe a better idea is to add a local wrapper for wbinvd_on_all_cpus()
> that does the right thing. Or add the above in a dedicated header.

+1, noting the naming angle:

WBINVD — Write Back and Invalidate Cache

Is an x86 instruction. Also interesting comment:

          * XXX: Consider doing a vmap flush or something, where possible.
          * Currently we just do a heavy handed wbinvd_on_all_cpus() here since
          * the underlying sg_table might not even point to struct pages, so we
          * can't just call drm_clflush_sg or similar, like we do elsewhere in
          * the driver.
          */
         if (i915_gem_object_can_bypass_llc(obj) ||
             (!HAS_LLC(i915) && !IS_DG1(i915)))
                 wbinvd_on_all_cpus();

The two together to me sound like the fix is to either find an equivalent existing platform agnostic API in the kernel, or if it does not exist create one and name it generically.

Either per-platform i915, if we go for my proposal, or I guess drm_cache.c if we don't.

Regards,

Tvrtko
