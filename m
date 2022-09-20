Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4BF5BDF81
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 10:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A1E10E399;
	Tue, 20 Sep 2022 08:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A045010E3A4;
 Tue, 20 Sep 2022 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663661605; x=1695197605;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iiRr7V7CatTyRz3EY0Ux4FQ4dzfq07n3KeHmFJT0aOA=;
 b=DofHrRLUqcRopP2sTLUM9DMukADCk8j5ynq4OJ6sx5eDz1bq49BVUi24
 9NgLC2yAfIPPAUAuKdrLhmaR6JIGhBKkQYYH6JNyJamNHo642dEWpsGcr
 0sJ6a08XoV9KM7OlFKlKMmSp+zKwT6Sdxn1GyNzAqtDYwPEQCJ0aJ3oqI
 nHJt+3HYjoFrVZfkqZgRyesBn3FQrvhTm3++VIHcCj+jHGKiZI0WPfXgQ
 vHNUApJWBhiRsI2AZboYLSPpCjosgqXg/xLPtym4B2TmNAG4cn5a/gxBM
 RIwiFWbyuxApCmDOfk4XBg6sh5BEOQJrzf4gEItbCVIIKmHOVeUpfFoA4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282660233"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="282660233"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 01:13:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="596423026"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.47.95])
 ([10.249.47.95])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 01:13:21 -0700
Message-ID: <b169cc9f-a272-7d2a-da61-82470b5eaeb2@linux.intel.com>
Date: Tue, 20 Sep 2022 10:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/i915: Do not dereference NULL bo->resource
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Das, Nirmoy" <nirmoy.das@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220919150233.5457-1-nirmoy.das@intel.com>
 <CY5PR11MB62113BCB450D45C1DC8201DD954D9@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <CY5PR11MB62113BCB450D45C1DC8201DD954D9@CY5PR11MB6211.namprd11.prod.outlook.com>
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/19/2022 5:29 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Das, Nirmoy <nirmoy.das@intel.com>
>> Sent: Monday, September 19, 2022 8:33 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Auld, Matthew
>> <matthew.auld@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>
>> Subject: [PATCH] drm/i915: Do not dereference NULL bo->resource
>>
>> bo->resource could be NULL hence add a NULL check for resource before
>> bo->dereferencing it.
> Will bo->resource will be NULL only in case of object is smem or it can be NULL even in lmem case as well ?


It can happen with lmem too. I think we should just use 
i915_gem_object_is_lmem() instead of i915_ttm_cpu_maps_iomem here.


Nirmoy

> Thanks,
> Anshuman Gupta.
>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6850
>> Fixes: ad74457a6b5a96 ("drm/i915/dgfx: Release mmap on rpm suspend")
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 0544b0a4a43a..8608801cd9ab 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -513,7 +513,7 @@ static void i915_ttm_delete_mem_notify(struct
>> ttm_buffer_object *bo)
>>
>>   	if (likely(obj)) {
>>   		/* ttm_bo_release() already has dma_resv_lock */
>> -		if (i915_ttm_cpu_maps_iomem(bo->resource))
>> +		if (bo->resource && i915_ttm_cpu_maps_iomem(bo-
>>> resource))
>>   			wakeref = intel_runtime_pm_get(&to_i915(obj-
>>> base.dev)->runtime_pm);
>>   		__i915_gem_object_pages_fini(obj);
>> --
>> 2.37.3
