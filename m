Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E366094C258
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 18:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74E410E78A;
	Thu,  8 Aug 2024 16:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wg3kITz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE9010E78A;
 Thu,  8 Aug 2024 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723133524; x=1754669524;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iX8Kig3Llgt6uvhaXGkFTLeu+qarpXSnjQO4KTesgqE=;
 b=Wg3kITz/RDsuKdSMKPAUlsSLcjYnRWVmgjwEVmUiFolXy2PeespCPIyv
 vcLpqHGJpT2KhFK3lRj78EBJI16GMGYiKBFXlWwKXUHVPaORiKJaTE4JQ
 NsRpDGZ/xSyF9YZF/Ur/fUfKRtoaT9BWRWt+BwluronO27eP9sqVo+cmx
 Lb1DdW/6NjgVsc9ZFUuShjGmtDf3Miqhk1wPI25Z+/m552U+1+JeWgd2A
 Jvdb88weKmZne0e90dTvfNXLyU6y9If0Nvaa1TtTy/jXvnmlcuvr/dMU6
 eaHmJqbkPKOHzrer63AcHn4poWkkRmp+W7PeUwvqjvhnXpyrGhjWdLStn g==;
X-CSE-ConnectionGUID: Zo8mGv2HRDm0LN4O3ROO/w==
X-CSE-MsgGUID: upYm1niuQ5GN0QwTzlIgdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25032347"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="25032347"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:12:04 -0700
X-CSE-ConnectionGUID: GhntoA7ASEmhPy3k4PmxiQ==
X-CSE-MsgGUID: yRxUQfbVS8OXcbyROGcQow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="62118610"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.146.117])
 ([10.245.146.117])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:12:02 -0700
Message-ID: <82c5131c-6d85-4d57-bd1d-30e80b06d360@linux.intel.com>
Date: Thu, 8 Aug 2024 18:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/gem: Do not look for the exact address in
 node
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
 <20240807100521.478266-2-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240807100521.478266-2-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/7/2024 12:05 PM, Andi Shyti wrote:
> In preparation for the upcoming partial memory mapping feature,
> we want to make sure that when looking for a node we consider
> also the offset and not just the starting address of the virtual
> memory node.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index cac6d4184506..d3ee8ef7ea2f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -1071,9 +1071,9 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>   
>   	rcu_read_lock();
>   	drm_vma_offset_lock_lookup(dev->vma_offset_manager);
> -	node = drm_vma_offset_exact_lookup_locked(dev->vma_offset_manager,
> -						  vma->vm_pgoff,
> -						  vma_pages(vma));
> +	node = drm_vma_offset_lookup_locked(dev->vma_offset_manager,
> +					    vma->vm_pgoff,
> +					    vma_pages(vma));
>   	if (node && drm_vma_node_is_allowed(node, priv)) {
>   		/*
>   		 * Skip 0-refcnted objects as it is in the process of being
