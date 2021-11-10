Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE41C44C0B5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 13:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CCA6E02E;
	Wed, 10 Nov 2021 12:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC246E02E;
 Wed, 10 Nov 2021 12:04:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="213383885"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="213383885"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 04:04:18 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="503939072"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.212.217])
 ([10.254.212.217])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 04:04:16 -0800
Message-ID: <7b2e1427-69cf-8f5d-0c15-73c4e602953d@linux.intel.com>
Date: Wed, 10 Nov 2021 20:04:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/i915: Use per device iommu check
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
References: <20211109121759.170915-1-tvrtko.ursulin@linux.intel.com>
 <6e8c55a7-45b6-57ab-35f7-d522401efccb@linux.intel.com>
 <4d1a0ab9-e0d8-2ed9-1fc4-9ffaf2f19bef@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
In-Reply-To: <4d1a0ab9-e0d8-2ed9-1fc4-9ffaf2f19bef@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 baolu.lu@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021/11/10 17:30, Tvrtko Ursulin wrote:
> 
> On 10/11/2021 07:12, Lu Baolu wrote:
>> Hi Tvrtko,
>>
>> On 2021/11/9 20:17, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
>>>
>>> On igfx + dgfx setups, it appears that intel_iommu=igfx_off option only
>>> disables the igfx iommu. Stop relying on global intel_iommu_gfx_mapped
>>> and probe presence of iommu domain per device to accurately reflect its
>>> status.
>>>
>>> Signed-off-by: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
>>> Cc: Lu Baolu<baolu.lu@linux.intel.com>
>>> ---
>>> Baolu, is my understanding here correct? Maybe I am confused by both
>>> intel_iommu_gfx_mapped and dmar_map_gfx being globals in the intel_iommu
>>> driver. But it certainly appears the setup can assign some iommu ops 
>>> (and
>>> assign the discrete i915 to iommu group) when those two are set to off.
>>
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>> b/drivers/gpu/drm/i915/i915_drv.h
>> index e967cd08f23e..9fb38a54f1fe 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -1763,26 +1763,27 @@ static inline bool run_as_guest(void)
>>   #define HAS_D12_PLANE_MINIMIZATION(dev_priv) 
>> (IS_ROCKETLAKE(dev_priv) || \
>>                             IS_ALDERLAKE_S(dev_priv))
>>
>> -static inline bool intel_vtd_active(void)
>> +static inline bool intel_vtd_active(struct drm_i915_private *i915)
>>   {
>> -#ifdef CONFIG_INTEL_IOMMU
>> -    if (intel_iommu_gfx_mapped)
>> +    if (iommu_get_domain_for_dev(i915->drm.dev))
>>           return true;
>> -#endif
>>
>>       /* Running as a guest, we assume the host is enforcing VT'd */
>>       return run_as_guest();
>>   }
>>
>> Have you verified this change? I am afraid that
>> iommu_get_domain_for_dev() always gets a valid iommu domain even
>> intel_iommu_gfx_mapped == 0.
> 
> Yes it seems to work as is:
> 
> default:
> 
> # grep -i iommu /sys/kernel/debug/dri/*/i915_capabilities
> /sys/kernel/debug/dri/0/i915_capabilities:iommu: enabled
> /sys/kernel/debug/dri/1/i915_capabilities:iommu: enabled
> 
> intel_iommu=igfx_off:
> 
> # grep -i iommu /sys/kernel/debug/dri/*/i915_capabilities
> /sys/kernel/debug/dri/0/i915_capabilities:iommu: disabled
> /sys/kernel/debug/dri/1/i915_capabilities:iommu: enabled
> 
> On my system dri device 0 is integrated graphics and 1 is discrete.

The drm device 0 has a dedicated iommu. When the user request igfx not
mapped, the VT-d implementation will turn it off to save power. But for
shared iommu, you definitely will get it enabled.

Best regards,
baolu
