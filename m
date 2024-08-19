Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD579568EA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 13:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4921D10E24E;
	Mon, 19 Aug 2024 11:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOiY0qnK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7E310E22F;
 Mon, 19 Aug 2024 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724065537; x=1755601537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5k5GAXhoWErJWqvYhtE0LSoY6NZ26Pxpzx6VBFiyEEo=;
 b=JOiY0qnK3PoiTIgdueeCE6FbmTLOyFurgQ0BGMonLsoTHhUwEa6i4zB5
 oqaLbXWLByx+ck6J8v6IFEI9Y1UBiD4pLAiI4WDkZy6y2kbhxQNRnrCaW
 wcYqlrU6Emi4iMCLam+uvv//8iwmdKHSAcJtQUPFvOpERM6eGoJqhwIES
 ftH6ds3v3XYmcfFR2B4lOAaBaYix+16tKrv8DuFgLSFFKSgJE55hiwhpy
 Oz9ko5m+WvuaMu50cMnWVin0oHOl5A2nNyYedm2chSuvOoNAd60JJYUSv
 /CtSMCGpaEMCTmP1X8HQEG+uxKOI6cEP8ckjfwufw8fmtI6r9R6596ccK g==;
X-CSE-ConnectionGUID: obVS+AvvQdixtlkleszMZg==
X-CSE-MsgGUID: qNAlHFlpTt+4XGkKjW+TfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="32924853"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="32924853"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 04:05:37 -0700
X-CSE-ConnectionGUID: i1TVMr7GRGGwvHr2vYuDLQ==
X-CSE-MsgGUID: MaqPERpSSt6VhkWyQ4no/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="61113774"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.159]) ([10.245.244.159])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 04:05:36 -0700
Message-ID: <5e986e65-6c6a-4243-9804-b9331a6fd9ae@intel.com>
Date: Mon, 19 Aug 2024 12:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe/lnl: Offload system clear page activity to
 GPU
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <20240816135154.19678-2-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240816135154.19678-2-nirmoy.das@intel.com>
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

On 16/08/2024 14:51, Nirmoy Das wrote:
> On LNL because of flat CCS, driver creates migrates job to clear
> CCS meta data. Extend that to also clear system pages using GPU.
> Inform TTM to allocate pages without __GFP_ZERO to avoid double page
> clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
> TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's clear
> on free as XE now takes care of clearing pages. If a bo is in system
> placement such as BO created with  DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
> and there is a cpu map then for such BO gpu clear will be avoided as
> there is no dma mapping for such BO at that moment to create migration
> jobs.
> 
> Tested this patch api_overhead_benchmark_l0 from
> https://github.com/intel/compute-benchmarks
> 
> Without the patch:
> api_overhead_benchmark_l0 --testFilter=UsmMemoryAllocation:
> UsmMemoryAllocation(api=l0 type=Host size=4KB) 84.206 us
> UsmMemoryAllocation(api=l0 type=Host size=1GB) 105775.56 us
> erf tool top 5 entries:
> 71.44% api_overhead_be  [kernel.kallsyms]   [k] clear_page_erms
> 6.34%  api_overhead_be  [kernel.kallsyms]   [k] __pageblock_pfn_to_page
> 2.24%  api_overhead_be  [kernel.kallsyms]   [k] cpa_flush
> 2.15%  api_overhead_be  [kernel.kallsyms]   [k] pages_are_mergeable
> 1.94%  api_overhead_be  [kernel.kallsyms]   [k] find_next_iomem_res
> 
> With the patch:
> api_overhead_benchmark_l0 --testFilter=UsmMemoryAllocation:
> UsmMemoryAllocation(api=l0 type=Host size=4KB) 79.439 us
> UsmMemoryAllocation(api=l0 type=Host size=1GB) 98677.75 us
> Perf tool top 5 entries:
> 11.16% api_overhead_be  [kernel.kallsyms]   [k] __pageblock_pfn_to_page
> 7.85%  api_overhead_be  [kernel.kallsyms]   [k] cpa_flush
> 7.59%  api_overhead_be  [kernel.kallsyms]   [k] find_next_iomem_res
> 7.24%  api_overhead_be  [kernel.kallsyms]   [k] pages_are_mergeable
> 5.53%  api_overhead_be  [kernel.kallsyms]   [k] lookup_address_in_pgd_attr
> 
> Without this patch clear_page_erms() dominates execution time which is
> also not pipelined with migration jobs. With this patch page clearing
> will get pipelined with migration job and will free CPU for more work.
> 
> v2: Handle regression on dgfx(Himal)
>      Update commit message as no ttm API changes needed.
> v3: Fix Kunit test.
> v4: handle data leak on cpu mmap(Thomas)
> v5: s/gpu_page_clear/gpu_page_clear_sys and move setting
>      it to xe_ttm_sys_mgr_init() and other nits (Matt Auld)
> v6: Disable it when init_on_alloc and/or init_on_free is active(Matt)
>      Use compute-benchmarks as reporter used it to report this
>      allocation latency issue also a proper test application than mime.
>      In v5, the test showed significant reduction in alloc latency but
>      that is not the case any more, I think this was mostly because
>      previous test was done on IFWI which had low mem BW from CPU.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
