Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC068552DDA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 11:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EC01126F5;
	Tue, 21 Jun 2022 09:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0BF1126F5;
 Tue, 21 Jun 2022 09:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655802353; x=1687338353;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BNkMGInRETr2nf0+CZ8Igx060CCekOz5cwv0G4B8jnc=;
 b=WmOQ1VRGdERtKkkFcXJsymEXPAucYniMzIUKF8uXn7fZWoEOgLwE51De
 diHzb3OjVKGoASXZiT2CuQC0OnlA6cW/pwiPb8aBfuQKoibHGjzgAeHUu
 nxQRU05aYDZhQLrhqf86J2oqXJplbgWkuYX+HbpMXqPGfogF915pV7+eH
 j8cC2H5eNLQ5ukQ9zJO2nqrjB/O3MCUbw15DMSowyGGi4o4GqCbhyQ0rp
 U4NsfM8WYC9HzpnL+Yf6mokZ6BgmR8+yETISXWF3Xf2CUOzUQGLnEJ/av
 3LTr2J0bah2lBKE2Fw0aswaMp6oNUSjs+FyfZQMr6rdzCRnmvV5w+zb5E w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263104388"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="263104388"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 02:05:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="643534453"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.36.166])
 ([10.252.36.166])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 02:05:37 -0700
Message-ID: <20680d19-2b2c-583e-ce79-032f0a21e128@linux.intel.com>
Date: Tue, 21 Jun 2022 11:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 09/10] drm/i915: turn on small BAR support
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-10-matthew.auld@intel.com>
 <7cf923bd-ae17-24fb-24de-1a53aee34630@linux.intel.com>
 <d63ce1b2-cd44-665b-2b42-19dea4cc6f1c@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <d63ce1b2-cd44-665b-2b42-19dea4cc6f1c@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/21/2022 10:38 AM, Matthew Auld wrote:
> On 17/06/2022 13:33, Thomas Hellström wrote:
>>
>> On 5/25/22 20:43, Matthew Auld wrote:
>>> With the uAPI in place we should now have enough in place to ensure a
>>> working system on small BAR configurations.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_region_lmem.c | 10 ++++------
>>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c 
>>> b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>>> index e9c12e0d6f59..6c6f8cbd7321 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>>> @@ -111,12 +111,6 @@ static struct intel_memory_region 
>>> *setup_lmem(struct intel_gt *gt)
>>>           flat_ccs_base = intel_gt_read_register(gt, 
>>> XEHPSDV_FLAT_CCS_BASE_ADDR);
>>>           flat_ccs_base = (flat_ccs_base >> XEHPSDV_CCS_BASE_SHIFT) 
>>> * SZ_64K;
>>> -        /* FIXME: Remove this when we have small-bar enabled */
>>> -        if (pci_resource_len(pdev, 2) < lmem_size) {
>>> -            drm_err(&i915->drm, "System requires small-BAR support, 
>>> which is currently unsupported on this kernel\n");
>>> -            return ERR_PTR(-EINVAL);
>>> -        }
>>> -
>>>           if (GEM_WARN_ON(lmem_size < flat_ccs_base))
>>>               return ERR_PTR(-EIO);
>>> @@ -169,6 +163,10 @@ static struct intel_memory_region 
>>> *setup_lmem(struct intel_gt *gt)
>>>       drm_info(&i915->drm, "Local memory available: %pa\n",
>>>            &lmem_size);
>>> +    if (io_size < lmem_size)
>>> +        drm_info(&i915->drm, "Using a reduced BAR size of %lluMiB. 
>>> Consider enabling the full BAR size if available in the BIOS.\n",
>>> +             (u64)io_size >> 20);
>>> +
>>
>> Hmm. I wonder what BIOS uis typically call the mappable portion of 
>> VRAM. I'll se if I can check that on my DG1 system. Might be that an 
>> average user misinterprets "full BAR".
>
> "PCI Subsystem settings" -> "Above 4G memory [enabled/disabled]"
>
> Sample size of one though.
>
> Maybe s/full BAR size/full memory size/ ?


Or  s/full BAR size/re-sizable BAR/

In newer BIOS, there is a more direct option to enable re-sizable bar: 
"Re-Size BAR"/"Resizable BAR".


Nirmoy

>
>>
>> /Thomas
>>
>>
>>
>>>       return mem;
>>>   err_region_put:
