Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAFB84D1A9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 19:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EA010E6C2;
	Wed,  7 Feb 2024 18:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XA+/mgx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4B810E3C0;
 Wed,  7 Feb 2024 18:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707331779; x=1738867779;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=w3TU3DPv4WUE+JfEFSV5dgpQiFFbYIKVyny2PvdjPnk=;
 b=XA+/mgx+wZ1TQKvh+wtBAVOWKMvttpjzO+K314TTwQgtuGo7rARoU3wB
 Y4ZH131v5Sm3MB/qLJeeXWioEt+xY3SrAFc/FrDR1krP0BUOdXImo2eEM
 Y+KRIMFx03dyKgPCKIz/7TZ7NG4S4wfsglV/SkhuNOBD7Ss/95n7iEyfd
 Hs2pyLQpLPiZSBpz8CzxwOUickLx/eebfsNcLOrFLTREXRuH5oy+/oDfs
 7xeol1YtCjWVS0YMV9J8xgH4ZnkK31TBs1WwTbS3k3p4hc4Z+jl+t0edS
 EMPBoWASoEMKNgFVSNZnkBlnQ9KRQTlMTJ/5d3tPVsSPPb2zrgYQoeh3M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4043509"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="4043509"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:49:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6023902"
Received: from ahamill-mobl2.ger.corp.intel.com (HELO [10.213.228.167])
 ([10.213.228.167])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:49:34 -0800
Message-ID: <82ac1c74-5aa1-484d-9132-9b023c0e7a33@linux.intel.com>
Date: Wed, 7 Feb 2024 18:49:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/i915: Add GuC submission interface version query
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, Jose Souza <jose.souza@intel.com>,
 Sagar Ghuge <sagar.ghuge@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
 <32d9d60b-1cfc-4201-8817-d293abe1b39d@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <32d9d60b-1cfc-4201-8817-d293abe1b39d@intel.com>
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


On 07/02/2024 18:12, John Harrison wrote:
> On 2/7/2024 03:56, Tvrtko Ursulin wrote:
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
>> There is a little bit of an open around the width required for versions.
>> While the GuC FW iface tells they are u8, i915 GuC code uses u32:
>>
>>   #define CSS_SW_VERSION_UC_MAJOR               (0xFF << 16)
>>   #define CSS_SW_VERSION_UC_MINOR               (0xFF << 8)
>>   #define CSS_SW_VERSION_UC_PATCH               (0xFF << 0)
>> ...
>>   struct intel_uc_fw_ver {
>>           u32 major;
>>           u32 minor;
>>           u32 patch;
>>           u32 build;
>>   };
> This is copied from generic code which supports firmwares other than 
> GuC. Only GuC promises to use 8-bit version components. Other firmwares 
> very definitely do not. There is no open.

Ack.

>>
>> So we could make the query u8, and refactor the struct intel_uc_fw_ver
>> to use u8, or not. To avoid any doubts on why are we assigning u32 to
>> u8 I simply opted to use u64. Which avoids the need to add any padding
>> too.
> I don't follow how potential 8 vs 32 confusion means jump to 64?!

Suggestion was to use u8 in the uapi in order to align with GuC FW ABI (or however it's called), in which case there would be:

    ver.major = guc->submission_version.major;

which would be:

    (u8) = (u32)

And I was anticipating someone not liking that either. Using too wide u64 simply avoids the need to add a padding element to the uapi struct.

If you are positive we need to include a branch number, even though it does not seem to be implemented in the code even(*) then I can make uapi 4x u32 and achieve the same.

(*)
static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 css_value)
{
	/* Get version numbers from the CSS header */
	ver->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css_value);
	ver->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css_value);
	ver->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css_value);
}

No branch field in the CSS header?

And Why is UMD supposed to reject a non-zero branch? Like how would 1.1.3.0 be fine and 1.1.3.1 be bad? I don't get it. But anyway, I can respin if you definitely confirm.

Regards,

Tvrtko

>>
>> Compile tested only.
>>
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
>> ---
>>   drivers/gpu/drm/i915/i915_query.c | 32 +++++++++++++++++++++++++++++++
>>   include/uapi/drm/i915_drm.h       | 11 +++++++++++
>>   2 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_query.c 
>> b/drivers/gpu/drm/i915/i915_query.c
>> index 00871ef99792..999687f6a3d4 100644
>> --- a/drivers/gpu/drm/i915/i915_query.c
>> +++ b/drivers/gpu/drm/i915/i915_query.c
>> @@ -551,6 +551,37 @@ static int query_hwconfig_blob(struct 
>> drm_i915_private *i915,
>>       return hwconfig->size;
>>   }
>> +static int
>> +query_guc_submission_version(struct drm_i915_private *i915,
>> +                 struct drm_i915_query_item *query)
>> +{
>> +    struct drm_i915_query_guc_submission_version __user *query_ptr =
>> +                        u64_to_user_ptr(query->data_ptr);
>> +    struct drm_i915_query_guc_submission_version ver;
>> +    struct intel_guc *guc = &to_gt(i915)->uc.guc;
>> +    const size_t size = sizeof(ver);
>> +    int ret;
>> +
>> +    if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>> +        return -ENODEV;
>> +
>> +    ret = copy_query_item(&ver, size, size, query);
>> +    if (ret != 0)
>> +        return ret;
>> +
>> +    if (ver.major || ver.minor || ver.patch)
>> +        return -EINVAL;
>> +
>> +    ver.major = guc->submission_version.major;
>> +    ver.minor = guc->submission_version.minor;
>> +    ver.patch = guc->submission_version.patch;
> This needs to include the branch version (currently set to zero) in the 
> definition. And the UMD needs to barf if branch comes back as non-zero. 
> I.e. there is no guarantee that a branched version will have the w/a + 
> fix that they are wanting.
> 
> John.
> 
> 
>> +
>> +    if (copy_to_user(query_ptr, &ver, size))
>> +        return -EFAULT;
>> +
>> +    return 0;
>> +}
>> +
>>   static int (* const i915_query_funcs[])(struct drm_i915_private 
>> *dev_priv,
>>                       struct drm_i915_query_item *query_item) = {
>>       query_topology_info,
>> @@ -559,6 +590,7 @@ static int (* const i915_query_funcs[])(struct 
>> drm_i915_private *dev_priv,
>>       query_memregion_info,
>>       query_hwconfig_blob,
>>       query_geometry_subslices,
>> +    query_guc_submission_version,
>>   };
>>   int i915_query_ioctl(struct drm_device *dev, void *data, struct 
>> drm_file *file)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 550c496ce76d..d80d9b5e1eda 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -3038,6 +3038,7 @@ struct drm_i915_query_item {
>>        *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct 
>> drm_i915_query_memory_regions)
>>        *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
>>        *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct 
>> drm_i915_query_topology_info)
>> +     *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct 
>> drm_i915_query_guc_submission_version)
>>        */
>>       __u64 query_id;
>>   #define DRM_I915_QUERY_TOPOLOGY_INFO        1
>> @@ -3046,6 +3047,7 @@ struct drm_i915_query_item {
>>   #define DRM_I915_QUERY_MEMORY_REGIONS        4
>>   #define DRM_I915_QUERY_HWCONFIG_BLOB        5
>>   #define DRM_I915_QUERY_GEOMETRY_SUBSLICES    6
>> +#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION    7
>>   /* Must be kept compact -- no holes and well documented */
>>       /**
>> @@ -3591,6 +3593,15 @@ struct drm_i915_query_memory_regions {
>>       struct drm_i915_memory_region_info regions[];
>>   };
>> +/**
>> +* struct drm_i915_query_guc_submission_version - query GuC submission 
>> interface version
>> +*/
>> +struct drm_i915_query_guc_submission_version {
>> +    __u64 major;
>> +    __u64 minor;
>> +    __u64 patch;
>> +};
>> +
>>   /**
>>    * DOC: GuC HWCONFIG blob uAPI
>>    *
> 
