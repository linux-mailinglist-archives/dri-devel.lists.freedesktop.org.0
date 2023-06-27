Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7EE73FD53
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 16:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1557410E2E8;
	Tue, 27 Jun 2023 14:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4F010E2E8;
 Tue, 27 Jun 2023 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687874742; x=1719410742;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A0BHjWoHFeCPHiEZfaGz7c0sHBpwOQmClpVoUUpMDD4=;
 b=CMf3UJE0N/F3GNk36bPhDUGG0/MPWud/IqS97KH6I/ZWV+mc7VFd6Ke5
 XuB5PK3pJYYo/YFZT1RvXanfS+PYkLP+19vxGmg2Wt/sM1QYQAP3h20Jv
 fRFbB5Pck//bX5VLyJTd/rUCKr2ggqsEED3d26f2mbTm0kzz+FIS/WH+u
 dVpjX3Vgvbo8AFrhi9zxAZH4q48pcQ/26PyLkvnemFNmyMtjX6MI0bdJf
 vOwOXpD066ImEBGaCpy849FtjeFpDRPccEKqQ/++iriYD3etIC1pYI7HD
 PdUkudvj6kDgy2XICYXn6Gpv1swRUWfir/mVgjXF2kPsgFr+Z7Mpkuv4+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="341916134"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="341916134"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 07:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="710648903"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="710648903"
Received: from acarotti-mobl1.ger.corp.intel.com (HELO [10.213.230.65])
 ([10.213.230.65])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 07:05:29 -0700
Message-ID: <b22c7111-0587-19b5-d912-9d07b81d2bb0@linux.intel.com>
Date: Tue, 27 Jun 2023 15:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 1/2] drm/i915: preparation for using PAT index
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, fei.yang@intel.com,
 intel-gfx@lists.freedesktop.org
References: <20230509165200.1740-1-fei.yang@intel.com>
 <20230509165200.1740-2-fei.yang@intel.com> <874jmtt4pb.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <874jmtt4pb.fsf@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/06/2023 14:28, Jani Nikula wrote:
> On Tue, 09 May 2023, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> This patch is a preparation for replacing enum i915_cache_level with PAT
>> index. Caching policy for buffer objects is set through the PAT index in
>> PTE, the old i915_cache_level is not sufficient to represent all caching
>> modes supported by the hardware.
>>
>> Preparing the transition by adding some platform dependent data structures
>> and helper functions to translate the cache_level to pat_index.
>>
>> cachelevel_to_pat: a platform dependent array mapping cache_level to
>>                     pat_index.
>>
>> max_pat_index: the maximum PAT index recommended in hardware specification
>>                 Needed for validating the PAT index passed in from user
>>                 space.
>>
>> i915_gem_get_pat_index: function to convert cache_level to PAT index.
>>
>> obj_to_i915(obj): macro moved to header file for wider usage.
>>
>> I915_MAX_CACHE_LEVEL: upper bound of i915_cache_level for the
>>                        convenience of coding.
>>
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> [snip]
> 
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> index f6a7c0bd2955..0eda8b4ee17f 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> @@ -123,7 +123,9 @@ struct drm_i915_private *mock_gem_device(void)
>>   	static struct dev_iommu fake_iommu = { .priv = (void *)-1 };
>>   #endif
>>   	struct drm_i915_private *i915;
>> +	struct intel_device_info *i915_info;
>>   	struct pci_dev *pdev;
>> +	unsigned int i;
>>   	int ret;
>>   
>>   	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
>> @@ -180,6 +182,13 @@ struct drm_i915_private *mock_gem_device(void)
>>   		I915_GTT_PAGE_SIZE_2M;
>>   
>>   	RUNTIME_INFO(i915)->memory_regions = REGION_SMEM;
>> +
>> +	/* simply use legacy cache level for mock device */
>> +	i915_info = (struct intel_device_info *)INTEL_INFO(i915);
> 
> This is not okay. It's not okay to modify device info at runtime. This
> is why we've separated runtime info from device info. This is why we've
> made device info const, and localized the modifications to a couple of
> places.
> 
> If you need to modify it, it belongs in runtime info. Even if it's only
> ever modified for mock devices.
> 
> We were at the brink of being able to finally convert INTEL_INFO() into
> a pointer to const rodata [1], where you are unable to modify it, but
> this having been merged as commit 5e352e32aec2 ("drm/i915: preparation
> for using PAT index") sets us back. (With [1] this oopses trying to
> modify read-only data.)
> 
> This has been posted to the public list 20+ times, and nobody noticed or
> pointed this out?!
> 
> Throwing away const should be a huge red flag to any developer or
> reviewer. Hell, *any* cast should be.
> 
> I've got a patch ready moving cachelevel_to_pat and max_pat_index to
> runtime info. It's not great, since we'd be doing it only for the mock
> device. Better ideas? I'm not waiting long.
> 
> 
> BR,
> Jani.
> 
> 
> [1] https://patchwork.freedesktop.org/patch/msgid/0badc36ce6dd6b030507bdfd8a42ab984fb38d12.1686236840.git.jani.nikula@intel.com
> 
> 
>> +	i915_info->max_pat_index = 3;
>> +	for (i = 0; i < I915_MAX_CACHE_LEVEL; i++)
>> +		i915_info->cachelevel_to_pat[i] = i;
>> +

I'd simply suggest having a local static const table for the mock 
device. It should be trivial once i915->__info becomes a pointer so in 
that series I guess.

While I am here - Fei - any plans to work on the promised cleanup? 
Abstracting the caching modes with a hw agnostic sw/driver 
representation, if you remember what we discussed.

Regards,

Tvrtko
