Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928A9956F96
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FC710E2F3;
	Mon, 19 Aug 2024 16:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kn6rTSs0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD4010E2F4;
 Mon, 19 Aug 2024 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724083317; x=1755619317;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JmU1MvSGMDh6FkJGGMid9Byw+WIE5fO7ws5z68rrZZs=;
 b=kn6rTSs0Z8vTpC3pt4lJrA4HVXEw4pYWL1rFKDO5MsH/+Wnfh9VcPh2K
 FWKq7HFyn8MBrV3+FaXF8W4wywAP8Ymfe7G9WNLP3JA6JprMnGt9N48x0
 izzfgMpibIjornarNynvoDe4/kZ4gTIQBHPHj3CUJ0VmTa2DEe8YafCrn
 HbzEaVxwgTcslKTms/Q72YQlb23C+Pqbp6DlfgJEbkWH/8VOi2nzkm6Ec
 3ZbGPcgyseEf0qQaJEyUF0LJyhTx+wbObRqyfNg4F7HG+l0RSf4j8Qsmf
 5r1IW/6EuvRgyvwt3P4ChL22EQfugV+kaRDJs34zkdSnsNphaVnOqF+VI g==;
X-CSE-ConnectionGUID: GTNXN++lSQqMsxuwEsxb9Q==
X-CSE-MsgGUID: aWc6UDTVRnCx4IOn6Nhu7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26135300"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="26135300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 09:01:57 -0700
X-CSE-ConnectionGUID: aDs5SHRMQ3WR+UlAvcO8bQ==
X-CSE-MsgGUID: gqHtTYqCSwmiJkb/RCd1mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="60991327"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.49.79])
 ([10.246.49.79])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 09:01:54 -0700
Message-ID: <b393e5ab-d69c-4bde-9ba2-3801ad8d5b48@linux.intel.com>
Date: Mon, 19 Aug 2024 18:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe/lnl: Offload system clear page activity to
 GPU
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <20240816135154.19678-2-nirmoy.das@intel.com>
 <5e986e65-6c6a-4243-9804-b9331a6fd9ae@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <5e986e65-6c6a-4243-9804-b9331a6fd9ae@intel.com>
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


On 8/19/2024 1:05 PM, Matthew Auld wrote:
> On 16/08/2024 14:51, Nirmoy Das wrote:
>> On LNL because of flat CCS, driver creates migrates job to clear
>> CCS meta data. Extend that to also clear system pages using GPU.
>> Inform TTM to allocate pages without __GFP_ZERO to avoid double page
>> clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
>> TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's clear
>> on free as XE now takes care of clearing pages. If a bo is in system
>> placement such as BO created with DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
>> and there is a cpu map then for such BO gpu clear will be avoided as
>> there is no dma mapping for such BO at that moment to create migration
>> jobs.
>>
>> Tested this patch api_overhead_benchmark_l0 from
>> https://github.com/intel/compute-benchmarks
>>
>> Without the patch:
>> api_overhead_benchmark_l0 --testFilter=UsmMemoryAllocation:
>> UsmMemoryAllocation(api=l0 type=Host size=4KB) 84.206 us
>> UsmMemoryAllocation(api=l0 type=Host size=1GB) 105775.56 us
>> erf tool top 5 entries:
>> 71.44% api_overhead_be  [kernel.kallsyms]   [k] clear_page_erms
>> 6.34%  api_overhead_be  [kernel.kallsyms]   [k] __pageblock_pfn_to_page
>> 2.24%  api_overhead_be  [kernel.kallsyms]   [k] cpa_flush
>> 2.15%  api_overhead_be  [kernel.kallsyms]   [k] pages_are_mergeable
>> 1.94%  api_overhead_be  [kernel.kallsyms]   [k] find_next_iomem_res
>>
>> With the patch:
>> api_overhead_benchmark_l0 --testFilter=UsmMemoryAllocation:
>> UsmMemoryAllocation(api=l0 type=Host size=4KB) 79.439 us
>> UsmMemoryAllocation(api=l0 type=Host size=1GB) 98677.75 us
>> Perf tool top 5 entries:
>> 11.16% api_overhead_be  [kernel.kallsyms]   [k] __pageblock_pfn_to_page
>> 7.85%  api_overhead_be  [kernel.kallsyms]   [k] cpa_flush
>> 7.59%  api_overhead_be  [kernel.kallsyms]   [k] find_next_iomem_res
>> 7.24%  api_overhead_be  [kernel.kallsyms]   [k] pages_are_mergeable
>> 5.53%  api_overhead_be  [kernel.kallsyms]   [k] 
>> lookup_address_in_pgd_attr
>>
>> Without this patch clear_page_erms() dominates execution time which is
>> also not pipelined with migration jobs. With this patch page clearing
>> will get pipelined with migration job and will free CPU for more work.
>>
>> v2: Handle regression on dgfx(Himal)
>>      Update commit message as no ttm API changes needed.
>> v3: Fix Kunit test.
>> v4: handle data leak on cpu mmap(Thomas)
>> v5: s/gpu_page_clear/gpu_page_clear_sys and move setting
>>      it to xe_ttm_sys_mgr_init() and other nits (Matt Auld)
>> v6: Disable it when init_on_alloc and/or init_on_free is active(Matt)
>>      Use compute-benchmarks as reporter used it to report this
>>      allocation latency issue also a proper test application than mime.
>>      In v5, the test showed significant reduction in alloc latency but
>>      that is not the case any more, I think this was mostly because
>>      previous test was done on IFWI which had low mem BW from CPU.
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>


Thanks Matt.

Pushed this to drm-xe-next. The series contains a ttm pool change which 
as agreed with Christian

is small enough to not cause any issue so can be pulled though drm-xe-next.


Regards,

Nirmoy

