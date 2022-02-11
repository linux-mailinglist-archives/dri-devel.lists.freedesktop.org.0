Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9464B22C9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 11:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4214210EA68;
	Fri, 11 Feb 2022 10:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A3510EA66;
 Fri, 11 Feb 2022 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644574113; x=1676110113;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2w1KGRlPO1ekJJP0djcgNWRwWyd6EDNZVSTMardu3qQ=;
 b=g71KXCBxKUoVww67IwtwS2FL+qtM6nv+56MimE38qMPHG7Z/lbmopKm7
 acJbk3o79JBM1GUC+CYoLJLp/T/83CnTFppNOllkqi4n8k0YwvOX/MLmS
 d1KUotsgKFxcFuGNNgN1axR3+YJ+de2UHBDp2xC2WPHPCtvSwESNBCHAD
 7cbSM9mya8Ygmg87wI2rxoklEmFqaZXS4nhrrwNYpbt/p+ywE5/ubPDvB
 oCl+HFQkZNuqZsR55MG64s35bOLctPsQ6L3oIsJZ6Cq/b6JjEp3CNRe2y
 4lwEWB1KB0WwUN2JBnXZNDH8s2HYqWBblyxLQaQV+yKS9QYlXt/yCLCOf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249912603"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="249912603"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:08:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="774202435"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:08:30 -0800
Message-ID: <4c825fe9-7bb6-e627-4d8f-fc24c23879bc@linux.intel.com>
Date: Fri, 11 Feb 2022 11:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 15/15] drm/i915/lmem: don't treat small BAR as an error
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220210121313.701004-1-matthew.auld@intel.com>
 <20220210121313.701004-16-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220210121313.701004-16-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/10/22 13:13, Matthew Auld wrote:
> Just pass along the probed io_size. The backend should be able to
> utilize the entire range here, even if some of it is non-mappable.
>
> It does leave open with what to do with stolen local-memory.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index 01838b8ce4c7..ad3cf348b4a8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -201,6 +201,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   	struct intel_memory_region *mem;
>   	resource_size_t min_page_size;
>   	resource_size_t io_start;
> +	resource_size_t io_size;
>   	resource_size_t lmem_size;
>   	int err;
>   
> @@ -211,7 +212,8 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
>   
>   	io_start = pci_resource_start(pdev, 2);
> -	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
> +	io_size = min(pci_resource_len(pdev, 2), lmem_size);
> +	if (!io_size)
>   		return ERR_PTR(-ENODEV);
>   
>   	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
> @@ -221,7 +223,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   					 lmem_size,
>   					 min_page_size,
>   					 io_start,
> -					 lmem_size,
> +					 io_size,
>   					 INTEL_MEMORY_LOCAL,
>   					 0,
>   					 &intel_region_lmem_ops);
