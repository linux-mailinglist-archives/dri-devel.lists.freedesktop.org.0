Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBED45EF82
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 15:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CAE6F4BA;
	Fri, 26 Nov 2021 14:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DD06F4BA;
 Fri, 26 Nov 2021 14:00:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="215690852"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="215690852"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 06:00:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="498409003"
Received: from slee54-mobl2.amr.corp.intel.com (HELO [10.209.166.109])
 ([10.209.166.109])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 06:00:39 -0800
Message-ID: <deee7289-17ab-436a-ad58-98a588926b7e@linux.intel.com>
Date: Fri, 26 Nov 2021 14:00:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/i915: Use per device iommu check
Content-Language: en-US
To: Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, 
 Intel-gfx@lists.freedesktop.org
References: <20211125104202.417171-1-tvrtko.ursulin@linux.intel.com>
 <a4d089ad-995c-7a6b-4446-46b03d373070@arm.com>
 <aedb0861-f6d6-0568-f7cb-2afc0f9ceb01@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <aedb0861-f6d6-0568-f7cb-2afc0f9ceb01@linux.intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/11/2021 08:26, Lu Baolu wrote:
> On 2021/11/25 19:47, Robin Murphy wrote:
>> On 2021-11-25 10:42, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> With both integrated and discrete Intel GPUs in a system, the current
>>> global check of intel_iommu_gfx_mapped, as done from intel_vtd_active()
>>> may not be completely accurate.
>>>
>>> In this patch we add i915 parameter to intel_vtd_active() in order to
>>> prepare it for multiple GPUs and we also change the check away from 
>>> Intel
>>> specific intel_iommu_gfx_mapped (global exported by the Intel IOMMU
>>> driver) to probing the presence of IOMMU domain on a specific device
>>> using iommu_get_domain_for_dev().
>>
>> FWIW the way you have it now is functionally equivalent to using 
>> device_iommu_mapped(), which I think might be slightly clearer for the 
>> current intent, but I don't have a significantly strong preference 
>> (after all, this *was* the de-facto way of checking before 
>> device_iommu_mapped() was introduced, and there are still other 
>> examples of it around). So from the IOMMU perspective,
>>
>> Acked-by: Robin Murphy <robin.murphy@arm.com>
>>
>> Perhaps the AGP driver could also be tweaked and 
>> intel_iommu_gfx_mapped cleaned away entirely, but I'll leave that for 
>> Baolu to think about :)
> 
> I fully agreed with Robin.
> 
> I prefer device_iommu_mapped() more than iommu_get_domain_for_dev().
> 
> "iommu_get_domain_for_dev(dev) == NULL" simply means that the device
> does not have any domain attached. Although at present, it is equivalent
> to device DMAing without IOMMU translation. But I'm sure it will change
> in the future.
> 
> With device_iommu_mapped() replaced,
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

I have empirically established device_iommu_mapped() matches 1:1 with 
intel_iommu_gfx_mapped and a simple non-NULL check against 
iommu_get_domain_for_dev(), so okay, I will respin with that change.

We leave the problem of being able to distinguish between pass-through 
and address translation from the drivers for later. Thanks both!

Regards,

Tvrtko
