Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC89552D2F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 10:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE94210E00C;
	Tue, 21 Jun 2022 08:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F2710E00C;
 Tue, 21 Jun 2022 08:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655800735; x=1687336735;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VBTXa9/FMwHuJlYOTBjaeQy8a9a5URwXVDsvhFoAUN4=;
 b=fJV/78EezAPkd+iTLr3wR7E0ee3Cg84G1B5mnV1v2OLx8l+tOwF+DPFI
 IvIN1kzJ4sDK3TG1WpxvHcLMYYSqXDN4OjVRjD4wLRbnbE71h5AdLfLIz
 tAtaWRzruSyovE/205O0ywfXtlNi+JeJcjwBaueLQa3r1DQ28nqiPe3P9
 JZPker5CDor+V460+h/qeCfJzSegCj2unO1to8s47XT8sBgNQlDrGRIMi
 e3LOIRNDBzCxV6YrtzvksjfPgxV7ZX3RcydOiMFKkHiytFnr6sSso6af2
 GF64Ch+a2qsYPSJB0MOZog5PW4+drE52qpF+D85V6uP2Lhsp/qkvyxkGe g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="277614203"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="277614203"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 01:38:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="676902266"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO [10.213.200.10])
 ([10.213.200.10])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 01:38:51 -0700
Message-ID: <d63ce1b2-cd44-665b-2b42-19dea4cc6f1c@intel.com>
Date: Tue, 21 Jun 2022 09:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 09/10] drm/i915: turn on small BAR support
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-10-matthew.auld@intel.com>
 <7cf923bd-ae17-24fb-24de-1a53aee34630@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <7cf923bd-ae17-24fb-24de-1a53aee34630@linux.intel.com>
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

On 17/06/2022 13:33, Thomas Hellström wrote:
> 
> On 5/25/22 20:43, Matthew Auld wrote:
>> With the uAPI in place we should now have enough in place to ensure a
>> working system on small BAR configurations.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_region_lmem.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c 
>> b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>> index e9c12e0d6f59..6c6f8cbd7321 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>> @@ -111,12 +111,6 @@ static struct intel_memory_region 
>> *setup_lmem(struct intel_gt *gt)
>>           flat_ccs_base = intel_gt_read_register(gt, 
>> XEHPSDV_FLAT_CCS_BASE_ADDR);
>>           flat_ccs_base = (flat_ccs_base >> XEHPSDV_CCS_BASE_SHIFT) * 
>> SZ_64K;
>> -        /* FIXME: Remove this when we have small-bar enabled */
>> -        if (pci_resource_len(pdev, 2) < lmem_size) {
>> -            drm_err(&i915->drm, "System requires small-BAR support, 
>> which is currently unsupported on this kernel\n");
>> -            return ERR_PTR(-EINVAL);
>> -        }
>> -
>>           if (GEM_WARN_ON(lmem_size < flat_ccs_base))
>>               return ERR_PTR(-EIO);
>> @@ -169,6 +163,10 @@ static struct intel_memory_region 
>> *setup_lmem(struct intel_gt *gt)
>>       drm_info(&i915->drm, "Local memory available: %pa\n",
>>            &lmem_size);
>> +    if (io_size < lmem_size)
>> +        drm_info(&i915->drm, "Using a reduced BAR size of %lluMiB. 
>> Consider enabling the full BAR size if available in the BIOS.\n",
>> +             (u64)io_size >> 20);
>> +
> 
> Hmm. I wonder what BIOS uis typically call the mappable portion of VRAM. 
> I'll se if I can check that on my DG1 system. Might be that an average 
> user misinterprets "full BAR".

"PCI Subsystem settings" -> "Above 4G memory [enabled/disabled]"

Sample size of one though.

Maybe s/full BAR size/full memory size/ ?

> 
> /Thomas
> 
> 
> 
>>       return mem;
>>   err_region_put:
