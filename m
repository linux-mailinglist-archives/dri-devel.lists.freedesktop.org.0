Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7CC73471
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DFA10E734;
	Thu, 20 Nov 2025 09:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMLkLR5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E9C10E29C;
 Thu, 20 Nov 2025 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763632011; x=1795168011;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Nfu7tGio74UPcnBECi0coJgR7u+YHcd1lcMkZHue7MM=;
 b=OMLkLR5DThc5eZa9vF2Ofn3a8haOk12xpcchzer8qiJQ24lmt9Nz60Rx
 2UDHijbdhS/qooVkGWmIduCu0Z5PdXqAbCvuJCPqbvtgnAoTMH1M99NFz
 j1BXbNe4Aco0L0TeYVv1atMs2VjPdUMuw8Qr6sHImm3PcTmqahvEF2v4m
 zH78PC/YeFx4ZPHFhuWfGfjxRvu8XVfLeRKQpz5hCcBlLc7uRO0bzX5F2
 izrx3OjwpSILlC++MATJxvlnodGvs3YYqhd25Nz63CK0O/6xNxh0PTz2c
 tM0HI3+xPJMg1cvQNSfE51ce+PrPxQbaKszmiggLgay9csWVdzhOmrFLf Q==;
X-CSE-ConnectionGUID: UfOvszBPSBKn358YoBxr+w==
X-CSE-MsgGUID: GSsK+0CEQPKr8xR4jDs4lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83082549"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="83082549"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 01:46:50 -0800
X-CSE-ConnectionGUID: rwdDKX3ERhKY+PtWV0TA0g==
X-CSE-MsgGUID: DF2sVwAmQ1miFYbt1xMdOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="196282856"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.162])
 ([10.245.244.162])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 01:46:48 -0800
Message-ID: <370852a0-508b-4635-b46c-344e1b488363@intel.com>
Date: Thu, 20 Nov 2025 09:46:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: release free_trees array on buddy mm teardown
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, Arunpravin.PaneerSelvam@amd.com,
 thomas.hellstrom@linux.intel.com
References: <20251120093022.276551-1-michal.grzelak@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251120093022.276551-1-michal.grzelak@intel.com>
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

On 20/11/2025 09:30, Michał Grzelak wrote:
> During initialization of DRM buddy memory manager at drm_buddy_init,
> mm->free_trees array is allocated for both clear and dirty RB trees.
> During cleanup happening at drm_buddy_fini it is never freed, leading to
> following memory leaks observed on xe module load & unload cycles:
> 
>      kmemleak_alloc+0x4a/0x90
>      __kmalloc_cache_noprof+0x488/0x800
>      drm_buddy_init+0xc2/0x330 [drm_buddy]
>      __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
>      xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
>      xe_device_probe+0x326/0x9e0 [xe]
>      xe_pci_probe+0x39a/0x610 [xe]
>      local_pci_probe+0x47/0xb0
>      pci_device_probe+0xf3/0x260
>      really_probe+0xf1/0x3c0
>      __driver_probe_device+0x8c/0x180
>      driver_probe_device+0x24/0xd0
>      __driver_attach+0x10f/0x220
>      bus_for_each_dev+0x7f/0xe0
>      driver_attach+0x1e/0x30
>      bus_add_driver+0x151/0x290
> 
> Deallocate array for free trees when cleaning up buddy memory manager
> in the same way as if going through out_free_tree label.
> 
> Fixes: d4cd665c ("drm/buddy: Separate clear and dirty free block trees")
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/drm_buddy.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 2f279b46bd2c..8308116058cc 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -420,6 +420,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   
>   	for_each_free_tree(i)
>   		kfree(mm->free_trees[i]);
> +	kfree(mm->free_trees);
>   	kfree(mm->roots);
>   }
>   EXPORT_SYMBOL(drm_buddy_fini);

