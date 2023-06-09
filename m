Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3B172990F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DF910E696;
	Fri,  9 Jun 2023 12:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F0010E694;
 Fri,  9 Jun 2023 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686312500; x=1717848500;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wHsk/r7TrGDab6Wxp2HJrKOkkbH7GLthxRsjehaiUYU=;
 b=BE+IoceNUjQxZt+lf/GpecwFsJNu07QbQHjEsws6lRNmmBPZc4zrn39J
 YWyWZ/wsoTQNr2ybWRPLqJcj7//1FfX8tmKZni9DaCDYiRGdNZyhYPs5j
 jcp5NSoRYSywoxTrweDrsqMb0n8cyyF6OiIhzQfFD1W9wSc5KvuxiEZMZ
 bEHwgAOAOpT1VVhJWDnpuIhnzjLsShD7BBBhMmiKGy1OpTOzzvWs2F75w
 ASXXGjDGn1+IiMrcM2Migl2qwtuHxs4AP5zTJwTzl+k2u/zNzTrCZCEI4
 GkLWSMHfpzZx5vATUBMclvFGdBPAVLyx746q8x1AA3EYFzzy7Fs0YZXpf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356473746"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="356473746"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="1040480704"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="1040480704"
Received: from pjdillon-mobl1.ger.corp.intel.com (HELO [10.213.210.241])
 ([10.213.210.241])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:08:13 -0700
Message-ID: <982c7f98-eaf8-7709-a90d-e192b666ade7@linux.intel.com>
Date: Fri, 9 Jun 2023 13:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Track buffer objects belonging
 to clients
Content-Language: en-US
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230608145133.1059554-1-tvrtko.ursulin@linux.intel.com>
 <20230608145133.1059554-2-tvrtko.ursulin@linux.intel.com>
 <b0990625-1d73-8b6d-d094-5e58be5ad6b0@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <b0990625-1d73-8b6d-d094-5e58be5ad6b0@intel.com>
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


On 09/06/2023 05:16, Iddamsetty, Aravind wrote:
> On 08-06-2023 20:21, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> In order to show per client memory usage lets start tracking which
>> objects belong to which clients.
>>
>> We start with objects explicitly created by object creation UAPI and
>> track it on a new per client lists, protected by a new per client lock.
>> In order for delayed destruction (post client exit), we make tracked
>> objects hold references to the owning client.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_create.c    | 32 ++++++++++++++--
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  6 +++
>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  | 12 ++++++
>>   drivers/gpu/drm/i915/i915_drm_client.c        | 36 +++++++++++++++++-
>>   drivers/gpu/drm/i915/i915_drm_client.h        | 37 ++++++++++++++++++-
>>   drivers/gpu/drm/i915/i915_gem.c               |  2 +-
>>   6 files changed, 119 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> index d24c0ce8805c..4f1957638207 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> @@ -11,6 +11,7 @@
>>   #include "gem/i915_gem_region.h"
>>   #include "pxp/intel_pxp.h"
>>   
>> +#include "i915_drm_client.h"
>>   #include "i915_drv.h"
>>   #include "i915_gem_create.h"
>>   #include "i915_trace.h"
>> @@ -164,6 +165,14 @@ __i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
>>   						 n_placements, 0);
>>   }
>>   
>> +static void add_file_obj(struct drm_file *file,
>> +			 struct drm_i915_gem_object *obj)
>> +{
>> +	struct drm_i915_file_private *fpriv = file->driver_priv;
>> +
>> +	i915_drm_client_add_object(fpriv->client, obj);
>> +}
>> +
>>   int
>>   i915_gem_dumb_create(struct drm_file *file,
>>   		     struct drm_device *dev,
>> @@ -174,6 +183,7 @@ i915_gem_dumb_create(struct drm_file *file,
>>   	enum intel_memory_type mem_type;
>>   	int cpp = DIV_ROUND_UP(args->bpp, 8);
>>   	u32 format;
>> +	int ret;
>>   
>>   	switch (cpp) {
>>   	case 1:
>> @@ -212,7 +222,12 @@ i915_gem_dumb_create(struct drm_file *file,
>>   	if (IS_ERR(obj))
>>   		return PTR_ERR(obj);
>>   
>> -	return i915_gem_publish(obj, file, &args->size, &args->handle);
>> +	ret = i915_gem_publish(obj, file, &args->size, &args->handle);
>> +
>> +	if (!ret)
>> +		add_file_obj(file, obj);
>> +
>> +	return ret;
>>   }
>>   
>>   /**
>> @@ -229,6 +244,7 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
>>   	struct drm_i915_gem_create *args = data;
>>   	struct drm_i915_gem_object *obj;
>>   	struct intel_memory_region *mr;
>> +	int ret;
>>   
>>   	mr = intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
>>   
>> @@ -236,7 +252,12 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
>>   	if (IS_ERR(obj))
>>   		return PTR_ERR(obj);
> 
> Do we intend to track only client created objects and not imported ?
> or is that taken care by this "obj->base.handle_count > 1"

I missed the imports, now added in v3 of the series.

They wouldn't have been handled by the above check in the importer - 
only the exporter would have seen (sometimes) changes in the ratio of 
total vs shared.

Regards,

Tvrtko
