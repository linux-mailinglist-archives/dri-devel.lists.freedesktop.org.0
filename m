Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D124B44BDCC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 10:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6CB6E3C4;
	Wed, 10 Nov 2021 09:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BBE6E123;
 Wed, 10 Nov 2021 09:31:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232482169"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="232482169"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 01:31:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="582588283"
Received: from dkeohane-mobl1.ger.corp.intel.com (HELO [10.213.222.153])
 ([10.213.222.153])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 01:30:50 -0800
Subject: Re: [PATCH] drm/i915: Use per device iommu check
To: Lu Baolu <baolu.lu@linux.intel.com>, Intel-gfx@lists.freedesktop.org
References: <20211109121759.170915-1-tvrtko.ursulin@linux.intel.com>
 <6e8c55a7-45b6-57ab-35f7-d522401efccb@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <4d1a0ab9-e0d8-2ed9-1fc4-9ffaf2f19bef@linux.intel.com>
Date: Wed, 10 Nov 2021 09:30:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6e8c55a7-45b6-57ab-35f7-d522401efccb@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/11/2021 07:12, Lu Baolu wrote:
> Hi Tvrtko,
> 
> On 2021/11/9 20:17, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
>>
>> On igfx + dgfx setups, it appears that intel_iommu=igfx_off option only
>> disables the igfx iommu. Stop relying on global intel_iommu_gfx_mapped
>> and probe presence of iommu domain per device to accurately reflect its
>> status.
>>
>> Signed-off-by: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
>> Cc: Lu Baolu<baolu.lu@linux.intel.com>
>> ---
>> Baolu, is my understanding here correct? Maybe I am confused by both
>> intel_iommu_gfx_mapped and dmar_map_gfx being globals in the intel_iommu
>> driver. But it certainly appears the setup can assign some iommu ops (and
>> assign the discrete i915 to iommu group) when those two are set to off.
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
> b/drivers/gpu/drm/i915/i915_drv.h
> index e967cd08f23e..9fb38a54f1fe 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1763,26 +1763,27 @@ static inline bool run_as_guest(void)
>   #define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) 
> || \
>                             IS_ALDERLAKE_S(dev_priv))
> 
> -static inline bool intel_vtd_active(void)
> +static inline bool intel_vtd_active(struct drm_i915_private *i915)
>   {
> -#ifdef CONFIG_INTEL_IOMMU
> -    if (intel_iommu_gfx_mapped)
> +    if (iommu_get_domain_for_dev(i915->drm.dev))
>           return true;
> -#endif
> 
>       /* Running as a guest, we assume the host is enforcing VT'd */
>       return run_as_guest();
>   }
> 
> Have you verified this change? I am afraid that
> iommu_get_domain_for_dev() always gets a valid iommu domain even
> intel_iommu_gfx_mapped == 0.

Yes it seems to work as is:

default:

# grep -i iommu /sys/kernel/debug/dri/*/i915_capabilities
/sys/kernel/debug/dri/0/i915_capabilities:iommu: enabled
/sys/kernel/debug/dri/1/i915_capabilities:iommu: enabled

intel_iommu=igfx_off:

# grep -i iommu /sys/kernel/debug/dri/*/i915_capabilities
/sys/kernel/debug/dri/0/i915_capabilities:iommu: disabled
/sys/kernel/debug/dri/1/i915_capabilities:iommu: enabled

On my system dri device 0 is integrated graphics and 1 is discrete.

Regards,

Tvrtko

> 
> A possible way could look like this:
> 
> static bool intel_vtd_active(struct drm_i915_private *i915)
> {
>          struct iommu_domain *domain;
> 
>          domain = iommu_get_domain_for_dev(i915->drm.dev);
> 
>          if (domain && (domain->type & __IOMMU_DOMAIN_PAGING))
>                  return true;
> 
>      ... ...
> }
> 
> Actually I don't like this either since it checks the domain->type out
> of the iommu subsystem. We could refactor this later by export an iommu
> interface for this check.
> 
> Best regards,
> baolu
