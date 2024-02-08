Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6817984DB9B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 09:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D679110E3D5;
	Thu,  8 Feb 2024 08:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W12n/EWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1923310E51E;
 Thu,  8 Feb 2024 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707381723; x=1738917723;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bgyy3x8w6e7qrmWAidfU/tEQwZkvzu6arv+fKXQHIyQ=;
 b=W12n/EWkD0idXfasBVtNJ1jvIfRebDSn8ifpYnNVZXQTyiBucyVE+ZUf
 heA/GPQZ9EKso/2gh6PPIossWT2L60g1yzHasUZ1GWdaxM6xRyFOINc/C
 5m0+2BQSxE315GQPkhLDaFHEVKBpZ72kTwwOYE0GvazdZqJHXMiiy+XVE
 cP8JEGn9qGZ6T002Cr7aM+wo6iDf8sIwxxBMpN5t5btUZNny06ysm8Sx+
 dZSytf1Y9/JfvpA22ammdJUEvFvGZd7k88eyy8bCrNqhDz3NFU5jhg4Dz
 VRIz+o2OgP7D9h9N8AWsDaXZqfM9Cmme9SZSfma/J6T8PBZ43k7gs12LV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4156066"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="4156066"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 00:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="6256400"
Received: from waoconno-mobl1.ger.corp.intel.com (HELO [10.213.211.200])
 ([10.213.211.200])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 00:42:00 -0800
Message-ID: <c70e4b09-4e2a-4369-82f4-2eb13771f217@linux.intel.com>
Date: Thu, 8 Feb 2024 08:41:57 +0000
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
 <82ac1c74-5aa1-484d-9132-9b023c0e7a33@linux.intel.com>
 <1efb4711-80e7-4e22-a2e3-a7190bad69eb@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1efb4711-80e7-4e22-a2e3-a7190bad69eb@intel.com>
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


On 07/02/2024 19:34, John Harrison wrote:
> On 2/7/2024 10:49, Tvrtko Ursulin wrote:
>> On 07/02/2024 18:12, John Harrison wrote:
>>> On 2/7/2024 03:56, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Add a new query to the GuC submission interface version.
>>>>
>>>> Mesa intends to use this information to check for old firmware versions
>>>> with a known bug where using the render and compute command streamers
>>>> simultaneously can cause GPU hangs due issues in firmware scheduling.
>>>>
>>>> Based on patches from Vivaik and Joonas.
>>>>
>>>> There is a little bit of an open around the width required for 
>>>> versions.
>>>> While the GuC FW iface tells they are u8, i915 GuC code uses u32:
>>>>
>>>>   #define CSS_SW_VERSION_UC_MAJOR               (0xFF << 16)
>>>>   #define CSS_SW_VERSION_UC_MINOR               (0xFF << 8)
>>>>   #define CSS_SW_VERSION_UC_PATCH               (0xFF << 0)
>>>> ...
>>>>   struct intel_uc_fw_ver {
>>>>           u32 major;
>>>>           u32 minor;
>>>>           u32 patch;
>>>>           u32 build;
>>>>   };
>>> This is copied from generic code which supports firmwares other than 
>>> GuC. Only GuC promises to use 8-bit version components. Other 
>>> firmwares very definitely do not. There is no open.
>>
>> Ack.
>>
>>>>
>>>> So we could make the query u8, and refactor the struct intel_uc_fw_ver
>>>> to use u8, or not. To avoid any doubts on why are we assigning u32 to
>>>> u8 I simply opted to use u64. Which avoids the need to add any padding
>>>> too.
>>> I don't follow how potential 8 vs 32 confusion means jump to 64?!
>>
>> Suggestion was to use u8 in the uapi in order to align with GuC FW ABI 
>> (or however it's called), in which case there would be:
>>
>>    ver.major = guc->submission_version.major;
>>
>> which would be:
>>
>>    (u8) = (u32)
>>
>> And I was anticipating someone not liking that either. Using too wide 
>> u64 simply avoids the need to add a padding element to the uapi struct.
>>
>> If you are positive we need to include a branch number, even though it 
>> does not seem to be implemented in the code even(*) then I can make 
>> uapi 4x u32 and achieve the same.
> It's not implemented in the code because we've never had to, and it is 
> yet another train wreck waiting to happen. There are a bunch of issues 
> at different levels that need to be resolved. But that is all in the 
> kernel and/or firmware and so can be added by a later kernel update when 
> necessary. However, if the UMDs are not already taking it into account 
> or its not even in the UAPI, then we can't back fill in the kernel 
> later, we are just broken.
> 
>>
>> (*)
>> static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 
>> css_value)
>> {
>>     /* Get version numbers from the CSS header */
>>     ver->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css_value);
>>     ver->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css_value);
>>     ver->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css_value);
>> }
>>
>> No branch field in the CSS header?
> I think there is, it's just not officially implemented yet.
> 
>>
>> And Why is UMD supposed to reject a non-zero branch? Like how would 
>> 1.1.3.0 be fine and 1.1.3.1 be bad? I don't get it. But anyway, I can 
>> respin if you definitely confirm.
> Because that is backwards. The branch number goes at the front.
> 
> So, for example (using made up numbers, I don't recall offhand what 
> versions we have where) say we currently have 0.1.3.0 in tip and 0.1.1.0 
> in the last LTS. We then need to ship a critical security fix and back 
> port it to the LTS. Tip becomes 0.1.3.1 but the LTS can't become 0.1.1.1 
> because that version already exists in the history of tip and does not 
> contain the fix. So the LTS gets branched to 1.1.0.0. We then have both 
> branches potentially moving forwards with completely independent 
> versioning.
> 
> Exactly the same as 5.8.x, 5.9,y, 6.0.z, etc in the Linux kernel 
> versioning. You cannot make any assumptions about what might be in 
> 1.4.5.6 compared to 0.1.2.3. 1.4.5.6 could actually 0.1.0.3 with a stack 
> of security fixes but none of the features, workarounds or bug fixes 
> that are in 0.1.2.3.
> 
> Hence, if the branch number changes then all bets are off. You have to 
> start over and reject anything you do not explicitly know about.
> 
> This is why we were saying that exposing version numbers to UMDs breaks 
> down horribly as soon as we have to start branching. There is no clean 
> or simple way to do this.

Right, thank you, I know we talked about the challenges with version 
numbers in the past and fully agreed. I just did not think to idea is to 
conceptually put the branch number first.

(It is called build btw in the i915 struct if that needs cleanup at some 
point. Or maybe name depends on the firmware type.)

But as the plan to piggy back on the existing semaphore capability flag 
has failed and i915 definitely does not want to keep a database of 
version branches to bugs fixes, and Mesa is immovable that they cannot 
ship without something, agreement was to let them have it that 
something. At least from the pretend level one can say it makes sense to 
expose the version and don't care what people are doing with it. Even if 
in practice it potentially never manages to see any old firmware.

Hmmm although now I can imagine that if the policy needs to be reject 
unknown branch numbers, it will make a "nice" maintenance burden to Mesa 
to ship updates synchronized with the firmware releases, in order to 
keep the feature active i.e. not inadvertently revert to disabled when 
say 0.1.1.3 goes to 1.1.1.3 (or 1.1.1.4) to unrelated fix getting added.

Jose could you double check that angle please? Will it just work or will 
it need constant Mesa updates in this situation otherwise we are back at 
square one - silently not exposing maximum performance.

Anyways, I've sent v2 with the branch included and fields shrunk to u32 
since as mentioned before four fields now align to quad-word nicely.

Regards,

Tvrtko


> 
> John.
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>
>>>> Compile tested only.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>>> Cc: Jose Souza <jose.souza@intel.com>
>>>> Cc: Sagar Ghuge <sagar.ghuge@intel.com>
>>>> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/i915_query.c | 32 
>>>> +++++++++++++++++++++++++++++++
>>>>   include/uapi/drm/i915_drm.h       | 11 +++++++++++
>>>>   2 files changed, 43 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_query.c 
>>>> b/drivers/gpu/drm/i915/i915_query.c
>>>> index 00871ef99792..999687f6a3d4 100644
>>>> --- a/drivers/gpu/drm/i915/i915_query.c
>>>> +++ b/drivers/gpu/drm/i915/i915_query.c
>>>> @@ -551,6 +551,37 @@ static int query_hwconfig_blob(struct 
>>>> drm_i915_private *i915,
>>>>       return hwconfig->size;
>>>>   }
>>>> +static int
>>>> +query_guc_submission_version(struct drm_i915_private *i915,
>>>> +                 struct drm_i915_query_item *query)
>>>> +{
>>>> +    struct drm_i915_query_guc_submission_version __user *query_ptr =
>>>> +                        u64_to_user_ptr(query->data_ptr);
>>>> +    struct drm_i915_query_guc_submission_version ver;
>>>> +    struct intel_guc *guc = &to_gt(i915)->uc.guc;
>>>> +    const size_t size = sizeof(ver);
>>>> +    int ret;
>>>> +
>>>> +    if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>>> +        return -ENODEV;
>>>> +
>>>> +    ret = copy_query_item(&ver, size, size, query);
>>>> +    if (ret != 0)
>>>> +        return ret;
>>>> +
>>>> +    if (ver.major || ver.minor || ver.patch)
>>>> +        return -EINVAL;
>>>> +
>>>> +    ver.major = guc->submission_version.major;
>>>> +    ver.minor = guc->submission_version.minor;
>>>> +    ver.patch = guc->submission_version.patch;
>>> This needs to include the branch version (currently set to zero) in 
>>> the definition. And the UMD needs to barf if branch comes back as 
>>> non-zero. I.e. there is no guarantee that a branched version will 
>>> have the w/a + fix that they are wanting.
>>>
>>> John.
>>>
>>>
>>>> +
>>>> +    if (copy_to_user(query_ptr, &ver, size))
>>>> +        return -EFAULT;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static int (* const i915_query_funcs[])(struct drm_i915_private 
>>>> *dev_priv,
>>>>                       struct drm_i915_query_item *query_item) = {
>>>>       query_topology_info,
>>>> @@ -559,6 +590,7 @@ static int (* const i915_query_funcs[])(struct 
>>>> drm_i915_private *dev_priv,
>>>>       query_memregion_info,
>>>>       query_hwconfig_blob,
>>>>       query_geometry_subslices,
>>>> +    query_guc_submission_version,
>>>>   };
>>>>   int i915_query_ioctl(struct drm_device *dev, void *data, struct 
>>>> drm_file *file)
>>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>> index 550c496ce76d..d80d9b5e1eda 100644
>>>> --- a/include/uapi/drm/i915_drm.h
>>>> +++ b/include/uapi/drm/i915_drm.h
>>>> @@ -3038,6 +3038,7 @@ struct drm_i915_query_item {
>>>>        *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct 
>>>> drm_i915_query_memory_regions)
>>>>        *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob 
>>>> uAPI`)
>>>>        *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct 
>>>> drm_i915_query_topology_info)
>>>> +     *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct 
>>>> drm_i915_query_guc_submission_version)
>>>>        */
>>>>       __u64 query_id;
>>>>   #define DRM_I915_QUERY_TOPOLOGY_INFO        1
>>>> @@ -3046,6 +3047,7 @@ struct drm_i915_query_item {
>>>>   #define DRM_I915_QUERY_MEMORY_REGIONS        4
>>>>   #define DRM_I915_QUERY_HWCONFIG_BLOB        5
>>>>   #define DRM_I915_QUERY_GEOMETRY_SUBSLICES    6
>>>> +#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION    7
>>>>   /* Must be kept compact -- no holes and well documented */
>>>>       /**
>>>> @@ -3591,6 +3593,15 @@ struct drm_i915_query_memory_regions {
>>>>       struct drm_i915_memory_region_info regions[];
>>>>   };
>>>> +/**
>>>> +* struct drm_i915_query_guc_submission_version - query GuC 
>>>> submission interface version
>>>> +*/
>>>> +struct drm_i915_query_guc_submission_version {
>>>> +    __u64 major;
>>>> +    __u64 minor;
>>>> +    __u64 patch;
>>>> +};
>>>> +
>>>>   /**
>>>>    * DOC: GuC HWCONFIG blob uAPI
>>>>    *
>>>
> 
