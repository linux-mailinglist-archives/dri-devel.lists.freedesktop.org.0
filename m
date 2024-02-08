Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866AF84E3B0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84BB10E878;
	Thu,  8 Feb 2024 15:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gppuMxFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 08 Feb 2024 15:06:17 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB3810E878;
 Thu,  8 Feb 2024 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707404777; x=1738940777;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qjemyYTH1yJ69yHtj+7sgaziduff9Sx9Cu6/jk2+BJw=;
 b=gppuMxFOP7zaTS/J8zgFsqy7DzhPZ4rCbZd31UNYLsXvbZUV7Lcc5mAA
 yzKasf2bCx7LeJy/nsa4OwN2zAyQlOVeCJC0CEVoYIfhP/MtPfJ4mFgb6
 Ltl4JNlrrX+fsRC9YQVhI1tQcTq0R0hnmE9YvtmD+Zvhhy7xwLP9Vh4WC
 LozbPKTpoVrUB3Rp/K7qOcHFN07xCatN69sNkFJA/BwR25njVA+OIMim0
 tTwk7kziOBbtH/lCEZRwS/IM86R8JDAoGDSrCe2o2cADRq05bR77fhxJW
 mdE+m0lYH4rVos/mPlTS3RMPGkV9/JTq5ymtcO6OOuWnWAXSpJ3uv+Lav A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1100110"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1100110"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6286910"
Received: from waoconno-mobl1.ger.corp.intel.com (HELO [10.213.211.200])
 ([10.213.211.200])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:59:07 -0800
Message-ID: <db762e07-a5e1-4c47-b1b6-85742ce6498b@linux.intel.com>
Date: Thu, 8 Feb 2024 14:59:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915: Add GuC submission interface version query
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>
Cc: "kenneth@whitecape.org" <kenneth@whitecape.org>,
 "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Ghuge, Sagar" <sagar.ghuge@intel.com>,
 "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
 <20240208082510.1363268-1-tvrtko.ursulin@linux.intel.com>
 <8a0a964cc1312e5fcccf0850d72e6374bb578943.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <8a0a964cc1312e5fcccf0850d72e6374bb578943.camel@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/02/2024 14:30, Souza, Jose wrote:
> On Thu, 2024-02-08 at 08:25 +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Add a new query to the GuC submission interface version.
>>
>> Mesa intends to use this information to check for old firmware versions
>> with a known bug where using the render and compute command streamers
>> simultaneously can cause GPU hangs due issues in firmware scheduling.
>>
>> Based on patches from Vivaik and Joonas.
>>
>> Compile tested only.
>>
>> v2:
>>   * Added branch version.
> 
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
> Tested-by: José Roberto de Souza <jose.souza@intel.com>
> UMD: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233

Thanks, but please we also need to close down on the branch number 
situation. I.e. be sure what is the failure mode in shipping Mesa with 
the change as it stands in the MR linked. What platforms could start 
failing and when, depending on GuC FW release eventualities.

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>> Cc: Jose Souza <jose.souza@intel.com>
>> Cc: Sagar Ghuge <sagar.ghuge@intel.com>
>> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_query.c | 33 +++++++++++++++++++++++++++++++
>>   include/uapi/drm/i915_drm.h       | 12 +++++++++++
>>   2 files changed, 45 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>> index 00871ef99792..d4dba1240b40 100644
>> --- a/drivers/gpu/drm/i915/i915_query.c
>> +++ b/drivers/gpu/drm/i915/i915_query.c
>> @@ -551,6 +551,38 @@ static int query_hwconfig_blob(struct drm_i915_private *i915,
>>   	return hwconfig->size;
>>   }
>>   
>> +static int
>> +query_guc_submission_version(struct drm_i915_private *i915,
>> +			     struct drm_i915_query_item *query)
>> +{
>> +	struct drm_i915_query_guc_submission_version __user *query_ptr =
>> +					    u64_to_user_ptr(query->data_ptr);
>> +	struct drm_i915_query_guc_submission_version ver;
>> +	struct intel_guc *guc = &to_gt(i915)->uc.guc;
>> +	const size_t size = sizeof(ver);
>> +	int ret;
>> +
>> +	if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>> +		return -ENODEV;
>> +
>> +	ret = copy_query_item(&ver, size, size, query);
>> +	if (ret != 0)
>> +		return ret;
>> +
>> +	if (ver.branch || ver.major || ver.minor || ver.patch)
>> +		return -EINVAL;
>> +
>> +	ver.branch = 0;
>> +	ver.major = guc->submission_version.major;
>> +	ver.minor = guc->submission_version.minor;
>> +	ver.patch = guc->submission_version.patch;
>> +
>> +	if (copy_to_user(query_ptr, &ver, size))
>> +		return -EFAULT;
>> +
>> +	return 0;
>> +}
>> +
>>   static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>>   					struct drm_i915_query_item *query_item) = {
>>   	query_topology_info,
>> @@ -559,6 +591,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>>   	query_memregion_info,
>>   	query_hwconfig_blob,
>>   	query_geometry_subslices,
>> +	query_guc_submission_version,
>>   };
>>   
>>   int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 550c496ce76d..84fb7f7ea834 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -3038,6 +3038,7 @@ struct drm_i915_query_item {
>>   	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
>>   	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
>>   	 *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_query_topology_info)
>> +	 *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct drm_i915_query_guc_submission_version)
>>   	 */
>>   	__u64 query_id;
>>   #define DRM_I915_QUERY_TOPOLOGY_INFO		1
>> @@ -3046,6 +3047,7 @@ struct drm_i915_query_item {
>>   #define DRM_I915_QUERY_MEMORY_REGIONS		4
>>   #define DRM_I915_QUERY_HWCONFIG_BLOB		5
>>   #define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
>> +#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION	7
>>   /* Must be kept compact -- no holes and well documented */
>>   
>>   	/**
>> @@ -3591,6 +3593,16 @@ struct drm_i915_query_memory_regions {
>>   	struct drm_i915_memory_region_info regions[];
>>   };
>>   
>> +/**
>> +* struct drm_i915_query_guc_submission_version - query GuC submission interface version
>> +*/
>> +struct drm_i915_query_guc_submission_version {
>> +	__u32 branch;
>> +	__u32 major;
>> +	__u32 minor;
>> +	__u32 patch;
>> +};
>> +
>>   /**
>>    * DOC: GuC HWCONFIG blob uAPI
>>    *
> 
