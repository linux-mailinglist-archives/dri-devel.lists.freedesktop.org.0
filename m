Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8236EC8AC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DF010E180;
	Mon, 24 Apr 2023 09:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAAE10E069;
 Mon, 24 Apr 2023 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682328183; x=1713864183;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=/vDGTCQFwdjlS+Oe5/CgRNuy0hh7uFu2+Tbbnv7ZnfE=;
 b=VFsXEuo6VEGzDQPR33pcg7mI4kiMJJVviguYKQzUac3qWdTHA/FqXaG/
 LKnE7YzpXGN8Wr96Cbqs29YGHaw+Niw6K/P8JwuZuwJRh939OEzbOk85l
 6WQtNMlba/b8Z55P0i3c0LVOg8up8C2ugZ36xfo/LXMV4W7OP6q7zcehN
 g0SPxhc/s/065nE3MBonTYRYYjuNSu5cx+2qeVY/wjkaJM27UOMz3rvju
 wzTJOw1yAp7CN1UwLI7cg8//lhzGnD8xU1iTBFBF6w6GNl9vKzJC3KBfI
 LWi9PsFyGH1JNgIVqNfKEQ175s+oADWleWC2iD/Hq2yIJ39Sqjv6qoE5K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="326724693"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="326724693"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 02:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="817188319"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="817188319"
Received: from maisasax-mobl.ger.corp.intel.com (HELO [10.213.209.63])
 ([10.213.209.63])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 02:23:01 -0700
Message-ID: <44564d4e-57c9-cc04-e146-fa065ab784de@linux.intel.com>
Date: Mon, 24 Apr 2023 10:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-8-fei.yang@intel.com>
 <3405a3c8-8ad4-958f-c1dd-4b3105daca31@linux.intel.com>
 <BYAPR11MB2567E4680658824BD81D01229A669@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Language: en-US
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB2567E4680658824BD81D01229A669@BYAPR11MB2567.namprd11.prod.outlook.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/04/2023 07:52, Yang, Fei wrote:
>> On 20/04/2023 00:00, fei.yang@intel.com wrote:
>>> From: Fei Yang <fei.yang@intel.com>
>>>
>>> Currently the KMD is using enum i915_cache_level to set caching policy for
>>> buffer objects. This is flaky because the PAT index which really controls
>>> the caching behavior in PTE has far more levels than what's defined in the
>>> enum. In addition, the PAT index is platform dependent, having to translate
>>> between i915_cache_level and PAT index is not reliable, and makes the code
>>> more complicated.
>>>
>>> >From UMD's perspective there is also a necessity to set caching policy for
>>> performance fine tuning. It's much easier for the UMD to directly use PAT
>>> index because the behavior of each PAT index is clearly defined in Bspec.
>>> Having the abstracted i915_cache_level sitting in between would only cause
>>> more ambiguity.
>>>
>>> For these reasons this patch replaces i915_cache_level with PAT index. Also
>>> note, the cache_level is not completely removed yet, because the KMD still
>>> has the need of creating buffer objects with simple cache settings such as
>>> cached, uncached, or writethrough. For such simple cases, using cache_level
>>> would help simplify the code.
>>>
>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> I think have some ideas no how to perhaps make this simpler, please bear
>> with me.
>>
>> In my mind get/set caching ioctls need to be failing once explicit pat
>> index has been set by userspace. Or at least not return false information.
> 
> By design we are ending the support for set caching ioctl. The patch is included
> in this series, "drm/i915/mtl: end support for set caching ioctl"
> 
> +       if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +               return -EOPNOTSUPP;
> +
> 
>> And I don't like i915_gem_object_has_cache_level and
>> i915_gem_get_pat_index as a refactoring step.
>>
>> It also seems that the driver has a need to query the caching mode set
>> regardless of the route (of setting).
> 
> Only for the objects created by the KMD. For UMD created objects with PAT
> index set KMD should never touch the setting.
> 
>> So how about this.
>>
>> Three callers which query the caching mode: use_cpu_reloc, vm_fault_gtt,
>> gpu_write_needs_clflush.
>>
>> We convert them to be like:
>>
>> i915_gem_object_has_caching_mode(obj, PAT_UC / PAT_WT / ...);
> 
> PAT_UC/WT/WB are platform dependent (https://gfxspecs.intel.com/Predator/Home/Index/45101),
> performing this check you would have to do something like,
> 
> if (MTL)
>          ...
> else if (PVC)
>          ...
> else if (GEN12)
>          ...
> else
>          ...

No, it would be doable with a table as I suggested below. And that table 
could be re-used for debugfs pretty-printing simplifying that code too.

>> Then apart from the per platform tables for mapping between cache level
>> to pat index, you add tables which map pat index to caching modes
>> (PAT_UC, etc, naming TBD, just enums or bitmasks also TBD, I haven't
>> looked at the bspec to see how exactly it works).
>>
>> You would use that table in the i915_gem_object_has_caching_mode helper,
>> called from the above three functions instead of obj->cache_level direct
>> comparison.
>>
>> I am assuming at least for instance cache_level != I915_CACHE_NONE would
>> be equivalent to i915_gem_object_has_caching_mode(obj, PAT_UC), etc.
> 
> So far kernel only needs 4 cache levels defined in enum i915_cache_level,
> kernel doesn't need to understand all PAT indices. By desgin if the userspace
> is setting PAT index directly, kernel only needs to pass the setting to PTE.
> 
> For objects created by kernel (including objects created by userspace without
> specifying pat index), there are only 4 options (defined in the cachelevel_to_pat).
> 
> For objects created by userspace with PAT index set (GEM_CREATE + set_pat extension),
> kernel should not touch the setting, just pass it to the PAT index bits in PTE.
> 
> That's why I was only checking cache_level. Handling PAT index is much more
> complicated because of its platform dependent nature and even the number of
> PAT indices varies from platform to platform. Fortunately kernel doesn't need
> to understand that.

Yeah but I think you maybe missed the spirit of my proposal - which is 
to simplify the internal code paths by not having the duality of 
cache_level-vs-pat almost all the way down. But instead cut it at the 
top API level.

You have this:

+	.cachelevel_to_pat = { \
+		[I915_CACHE_NONE]   = 0, \
+		[I915_CACHE_LLC]    = 1, \
+		[I915_CACHE_L3_LLC] = 2, \
+		[I915_CACHE_WT]     = 3, \
+	}

I propose to add something like:

.legacy_platform_pat = { /* pat index to driver logical flags */
     [0] = PAT_UC,
     [1] = PAT_WB | PAT_LLC, /* Just illustrating the principle */
};

i915->platform_pat = &legacy_platform_pat

i915_gem_object_has_caching_mode(obj, PAT_UC)
...
	return i915->platform_pat & PAT_UC == PAT_UC /* give or take */


get/set_caching_ioctl
{
...
	if (obj->has_pat_index) /* set in the extension only */
		return -EINVAL;

debugfs:

i915_show_pat_flags(i915->platform_pat[obj->pat_index]); /* generic! */

etc...

Set obj->pat_index in the extension or set_cache_level _only_. No 
internal code paths then need to use anything but it. No sprinkling of 
conversion helpers needed or dubious has_cache_level query.

Regards,

Tvrtko

>> Same mapping table could also be used in debugfs (i915_cache_level_str)
>> to universally describe any obj->pat_index, with no need to have
>> anything platform dependend there.
>>
>> In set caching set you always set obj->pat_index and so low level code
>> can always just use that.
>>
>> Unless I am missing something (possible) I think like that we end up
>> with no i915_gem_get_pat_index sprinkled around and also no confusing
>> i915_gem_object_has_cache_level.
>>
>> Obj->pat_index would be a single point of truth, while obj->cache_level
>> is just a legacy field for get/set_caching ioctl - not used in the
>> internal driver flows.
>>
>> We would need an additional field for storing the boolean of whether
>> userspace had overriden the PAT.
>>
>> Regards,
>>
>> Tvrtko
