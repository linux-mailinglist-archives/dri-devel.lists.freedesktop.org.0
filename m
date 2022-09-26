Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4665EAC3E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 18:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F71B89B62;
	Mon, 26 Sep 2022 16:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C4E89B62;
 Mon, 26 Sep 2022 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664208946; x=1695744946;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=M/uVZNf8YBIDTy4LA8GPjlmwdEqlDipHYGsaFfA0pjY=;
 b=ctUCrjFt6mnLJ6rrqE/bLuwZcYNgUiRP/BN8gd7WaZ2Fc7Q0rRejfGHG
 D51bAbYlM59GzKlITf4gft2GKo9sffimBH0l5NBBypOqdA1TpbaAyb74a
 w2Z9TdHOWaKRfTkKA/RY/Nu49LPmNQzWCpnG+ueGc2J3EZ8DonQJ13+4Y
 AU4lvKD97BFzLHuiTOnwnYamBG7mzpABEp9z++xqub/mb2km+MaEZESJE
 8Y50kTsU40g5yWn39NcAcdELOQ0zmhKgr2tfGIilgj8QbIoEAuFMU6OPl
 FUo03XwEz3v5y8aGA8jU9SBc8n+wrQOrec25sg4yEU0c4SrxLa+P5cOja g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="327423649"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="327423649"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 09:15:45 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="683588945"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="683588945"
Received: from tahirmuh-mobl1.ger.corp.intel.com (HELO [10.213.192.246])
 ([10.213.192.246])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 09:15:44 -0700
Message-ID: <37c12259-2190-5299-8d4e-f9ec9fe8a2f5@linux.intel.com>
Date: Mon, 26 Sep 2022 17:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/huc: only load HuC on GTs that
 have VCS engines
Content-Language: en-US
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-2-daniele.ceraolospurio@intel.com>
 <b6d78e11-f0f7-de86-e5c3-e2a12fe55203@linux.intel.com>
 <f0a77865-265c-6d65-df34-d2d76960d64e@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f0a77865-265c-6d65-df34-d2d76960d64e@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/09/2022 16:41, Ceraolo Spurio, Daniele wrote:
> On 9/23/2022 3:53 AM, Tvrtko Ursulin wrote:
>>
>> On 22/09/2022 23:11, Daniele Ceraolo Spurio wrote:
>>> On MTL the primary GT doesn't have any media capabilities, so no video
>>> engines and no HuC. We must therefore skip the HuC fetch and load on
>>> that specific case. Given that other multi-GT platforms might have HuC
>>> on the primary GT, we can't just check for that and it is easier to
>>> instead check for the lack of VCS engines.
>>>
>>> Based on code from Aravind Iddamsetty
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 21 +++++++++++++++++++++
>>>   drivers/gpu/drm/i915/i915_drv.h        |  9 ++++++---
>>>   2 files changed, 27 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> index 3bb8838e325a..d4e2b252f16c 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> @@ -42,12 +42,33 @@
>>>    * HuC-specific commands.
>>>    */
>>>   +static bool vcs_supported(struct intel_gt *gt)
>>> +{
>>> +    intel_engine_mask_t mask = gt->info.engine_mask;
>>> +
>>> +    /*
>>> +     * we can reach here from i915_driver_early_probe for primary
>>> +     * GT with it being not fully setup hence fall back to the 
>>> device info's
>>> +     * engine mask
>>> +     */
>>> +    if (!mask && gt_is_root(gt))
>>> +        mask = RUNTIME_INFO(gt->i915)->platform_engine_mask;
>>
>> Is it possible for all instances to be fused off? Wondering if the 
>> function shouldn't just use platform_engine_mask.
> 
> The spec says that there is always going to be at least 1 VCS (bspec 
> 55417 in case you want to double-check). I don't see that changing in 
> the future, because what's the point of having a media GT if you don't 
> have any enabled VCS engines on it?

That was my gut feeling as well, however..

> Also, platform_engine_mask only contains the entries of the primary GT, 
> for the other GTs we'd have to navigate the array in the device info 
> structure and I don't think we want to do that from here when we've 
> already copied the mask inside gt->info.engine_mask.

... this is very annoying. Because function is now a bit dodgy, no? 
Maybe gets the caller a real answer for a _specific_ gt, or maybe gets a 
fake-ish answer for a root gt. Or if not a root gt and called too early 
maybe it returns a false zero?

Hm would GEM_BUG_ON(!mask && !gt_is_root(gt)) be correct?

And not even bother to implement is as fallback?

if (gt_is_root)
	return platform_mask;
else
	return gt_mask;

Would that be clearer? Coupled with the comment from the patch, maybe 
expanded with the statement that if there are some vcs engines, at least 
one must remain post fusing?

Regards,

Tvrtko

>>> +
>>> +    return __ENGINE_INSTANCES_MASK(mask, VCS0, I915_MAX_VCS);
>>> +}
>>> +
>>>   void intel_huc_init_early(struct intel_huc *huc)
>>>   {
>>>       struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
>>> +    struct intel_gt *gt = huc_to_gt(huc);
>>>         intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
>>>   +    if (!vcs_supported(gt)) {
>>> +        intel_uc_fw_change_status(&huc->fw, 
>>> INTEL_UC_FIRMWARE_NOT_SUPPORTED);
>>> +        return;
>>> +    }
>>> +
>>>       if (GRAPHICS_VER(i915) >= 11) {
>>>           huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
>>>           huc->status.mask = HUC_LOAD_SUCCESSFUL;
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>>> b/drivers/gpu/drm/i915/i915_drv.h
>>> index 134fc1621821..8ca575202e5d 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -777,12 +777,15 @@ IS_SUBPLATFORM(const struct drm_i915_private 
>>> *i915,
>>>   #define __HAS_ENGINE(engine_mask, id) ((engine_mask) & BIT(id))
>>>   #define HAS_ENGINE(gt, id) __HAS_ENGINE((gt)->info.engine_mask, id)
>>>   -#define ENGINE_INSTANCES_MASK(gt, first, count) ({        \
>>> +#define __ENGINE_INSTANCES_MASK(mask, first, count) ({            \
>>>       unsigned int first__ = (first);                    \
>>>       unsigned int count__ = (count);                    \
>>> -    ((gt)->info.engine_mask &                        \
>>> -     GENMASK(first__ + count__ - 1, first__)) >> first__;        \
>>> +    ((mask) & GENMASK(first__ + count__ - 1, first__)) >> first__;    \
>>>   })
>>> +
>>> +#define ENGINE_INSTANCES_MASK(gt, first, count) \
>>> +    __ENGINE_INSTANCES_MASK((gt)->info.engine_mask, first, count)
>>> +
>>>   #define RCS_MASK(gt) \
>>>       ENGINE_INSTANCES_MASK(gt, RCS0, I915_MAX_RCS)
>>>   #define BCS_MASK(gt) \
> 
