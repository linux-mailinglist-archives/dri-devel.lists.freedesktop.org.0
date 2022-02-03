Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DB84A8130
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43DE10EAF1;
	Thu,  3 Feb 2022 09:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2560F10EAF1;
 Thu,  3 Feb 2022 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643879486; x=1675415486;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BX4ePms3SbXH5rP9oc6sAEmGEmHr74HDf2ZVw97RJpQ=;
 b=AdjGuNWAv1DcVzRUJ5VA95O//DnwJGhotye2mf4ibmdIjj7ibNI+190h
 5k2LySG3QfsAtMPnhsIgnZrK+m7ZUkwRMosMVZR3/pQY2mm0YqCIoSgx6
 s8amEbD4I6Nh42Xw5A+ob/RGe79GJkWIN/Z3XHjdIqNK/Uhy0Y6AjJQWs
 CnnuR8KJrEVZ/B9nECs05Iu84+aTLbiQvu2qxj/Sr5PwNJJ2mJ1toHmQf
 nNuwNrAv3GUypHXShcnlk7DOYXsmlc8LD4KtKP87vL/MBydlanttSgcMz
 KC556Px3eqHdASsWD7myRyIc75otqbsmXowaK93vhUVmjwlLPjiIoYdxg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="246938192"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="246938192"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:11:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="627371847"
Received: from blovejoy-mobl.ger.corp.intel.com (HELO [10.252.16.183])
 ([10.252.16.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:11:24 -0800
Message-ID: <e5ac977d-f948-9192-961c-b7bc69b94803@intel.com>
Date: Thu, 3 Feb 2022 09:11:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 15/20] drm/i915/selftests: handle allocation failures
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-16-matthew.auld@intel.com>
 <c699d513-d05f-9ea8-7df6-16e10c6c9729@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <c699d513-d05f-9ea8-7df6-16e10c6c9729@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2022 09:05, Thomas Hellström wrote:
> 
> On 1/26/22 16:21, Matthew Auld wrote:
>> If we have to contend with non-mappable LMEM, then we need to ensure the
>> object fits within the mappable portion, like in the selftests, where we
>> later try to CPU access the pages. However if it can't then we need to
>> gracefully handle this, without throwing an error.
>>
>> Also it looks like TTM will return -ENOMEM if the object can't be
>> placed.
> 
> We should probably have a look at why that happens. I thought ttm would 
> return -ENOSPC, which we then converted to -ENXIO in i915_ttm_err_to_gem().

IIRC it was in ttm_bo_mem_space(), where right at the end it does ret = 
-ENOMEM, after failing to evict buffers.

> 
> /Thomas
> 
> 
> 
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c      | 2 +-
>>   drivers/gpu/drm/i915/selftests/intel_memory_region.c | 8 +++++++-
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c 
>> b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> index 42db9cd30978..3caa178bbd07 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> @@ -1344,7 +1344,7 @@ static int igt_ppgtt_smoke_huge(void *arg)
>>           err = i915_gem_object_pin_pages_unlocked(obj);
>>           if (err) {
>> -            if (err == -ENXIO || err == -E2BIG) {
>> +            if (err == -ENXIO || err == -E2BIG || err == -ENOMEM) {
>>                   i915_gem_object_put(obj);
>>                   size >>= 1;
>>                   goto try_again;
>> diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c 
>> b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>> index 04ae29779206..87bff7f83554 100644
>> --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>> +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>> @@ -822,8 +822,14 @@ static int igt_lmem_create_with_ps(void *arg)
>>           i915_gem_object_lock(obj, NULL);
>>           err = i915_gem_object_pin_pages(obj);
>> -        if (err)
>> +        if (err) {
>> +            if (err == -ENXIO || err == -E2BIG || err == -ENOMEM) {
>> +                pr_info("%s not enough lmem for ps(%u) err=%d\n",
>> +                    __func__, ps, err);
>> +                err = 0;
>> +            }
>>               goto out_put;
>> +        }
>>           daddr = i915_gem_object_get_dma_address(obj, 0);
>>           if (!IS_ALIGNED(daddr, ps)) {
