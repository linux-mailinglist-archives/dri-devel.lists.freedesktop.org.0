Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F757AEFDC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 17:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854A410E135;
	Tue, 26 Sep 2023 15:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CAB10E104;
 Tue, 26 Sep 2023 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695742979; x=1727278979;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kSGp+NMFWW6MBSTU8n+62TzJXUOw3BjhZpIaHabZOXo=;
 b=cFdyloYAl3KThNTe9OEHwumf/vhifwGocHeHtyouR/pH2NSSruPih7SV
 eOrGjLKjnrnTX6I9yEr6oAgDzCOgy8Vemagieekcr6ORBXRFUpXDSlnxf
 SjZegUnJD/YxcQWJtkSZ5UpUX3JQX1q+M4ESba/Df3fbJHDW3l309lsFG
 E+4bWhqTvgT7KnmY6NmkVXOkO2SL4tHAeC1jDiu5h3lDb4S8verqWKBgV
 K4B7ls3f4YpycOqP9lwWzbYS3yeTdx5liGxw0UnqV77BTgVZ7ER9PU0HL
 yDJ0b31TZ6khnj6+tabjg46TiZUvKHoR0PnFItz6WKllQEgEjkSN/7GAr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381496949"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="381496949"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 08:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892243328"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="892243328"
Received: from dilipban-mobl.ger.corp.intel.com (HELO [10.213.201.63])
 ([10.213.201.63])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 08:41:51 -0700
Message-ID: <d7a022e9-411c-043b-fe71-b056f88176ff@linux.intel.com>
Date: Tue, 26 Sep 2023 16:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/6] drm/i915: Add stable memory region names
Content-Language: en-US
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
 <20230922134700.235039-6-tvrtko.ursulin@linux.intel.com>
 <4530159c-d3c6-533f-9e4b-f50dba6ffea2@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <4530159c-d3c6-533f-9e4b-f50dba6ffea2@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/09/2023 16:29, Iddamsetty, Aravind wrote:
> On 22-09-2023 19:16, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> At the moment memory region names are a bit too varied and too
>> inconsistent to be used for ABI purposes, like for upcoming fdinfo
>> memory stats.
>>
>> System memory can be either system or system-ttm. Local memory has the
>> instance number appended, others do not. Not only incosistent but thi
>> kind of implementation detail is uninteresting for intended users of
>> fdinfo memory stats.
>>
>> Add a stable name always formed as $type$instance. Could have chosen a
>> different stable scheme, but I think any consistent and stable scheme
>> should do just fine.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/intel_memory_region.c | 19 +++++++++++++++++++
>>   drivers/gpu/drm/i915/intel_memory_region.h |  1 +
>>   2 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
>> index 3d1fdea9811d..60a03340bbd4 100644
>> --- a/drivers/gpu/drm/i915/intel_memory_region.c
>> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
>> @@ -216,6 +216,22 @@ static int intel_memory_region_memtest(struct intel_memory_region *mem,
>>   	return err;
>>   }
>>   
>> +static const char *region_type_str(u16 type)
>> +{
>> +	switch (type) {
>> +	case INTEL_MEMORY_SYSTEM:
>> +		return "system";
>> +	case INTEL_MEMORY_LOCAL:
>> +		return "local";
>> +	case INTEL_MEMORY_STOLEN_LOCAL:
>> +		return "stolen-local";
>> +	case INTEL_MEMORY_STOLEN_SYSTEM:
>> +		return "stolen-system";
>> +	default:
>> +		return "unknown";
>> +	}
>> +}
>> +
>>   struct intel_memory_region *
>>   intel_memory_region_create(struct drm_i915_private *i915,
>>   			   resource_size_t start,
>> @@ -244,6 +260,9 @@ intel_memory_region_create(struct drm_i915_private *i915,
>>   	mem->type = type;
>>   	mem->instance = instance;
>>   
>> +	snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
>> +		 region_type_str(type), instance);
>> +
>>   	mutex_init(&mem->objects.lock);
>>   	INIT_LIST_HEAD(&mem->objects.list);
>>   
>> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
>> index 2953ed5c3248..9ba36454e51b 100644
>> --- a/drivers/gpu/drm/i915/intel_memory_region.h
>> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
>> @@ -80,6 +80,7 @@ struct intel_memory_region {
>>   	u16 instance;
>>   	enum intel_region_id id;
>>   	char name[16];
>> +	char uabi_name[16];
> 
> Just a thought instead of creating a new field, can't we derive this
> with name and instance?

I'd rather not snprintf on every fdinfo read - for every pid and every 
drm fd versus 2-3 strings kept around.

I did briefly wonder if mr->name could be dropped, that is renamed to 
mr->uabi_name, but I guess there is some value to print the internal 
name in some log messages, to leave a trace of what underlying 
implementation is used. Although I am not too sure about the value of 
that either since it is implied from the kernel version.

Then on top the usage in i915_gem_create/repr_name I could replace with 
mr->uabi_name and simplify. If there is any value in printing the name 
there, versus just uabi type:instance integers. Dunno. All I know is 
fdinfo should have stable names and not confuse with implementation 
details so I need something..

Regards,

Tvrtko
