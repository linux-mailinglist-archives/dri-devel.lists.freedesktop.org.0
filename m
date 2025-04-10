Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EE9A8452B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDB210E9C6;
	Thu, 10 Apr 2025 13:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBIf1QGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B4810E9C2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744292670; x=1775828670;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PcgLhjxU9wGXy0T4lTIA6CfDdvXXlZVuUwJaciUX2pk=;
 b=XBIf1QGqnlqyzQKmXcPFsdlWgX9aypmLzdxov1sv0kk9ek7WEVeyr4Lb
 rCNuYnXP+jnNzuwfRO9Pp3MjdMRNffKVPIiB1U5QaTJEqqiM3146YF4Ep
 4qLFkteLIq+YK9593q3bpARwqSJdtoaZn6dwlwUlRVaGZMbuKxDnrhYWc
 WLhAoDfSwp398pSmqZaNr8Z3m/+OzYZqhUb5w/JGnvxLnsSmneweoVR+r
 xyfbvelSPbrw2oMUuUyIEB51bdInfoJfuLimUTqfslsE87clwnRHpAFxY
 /9i9fGMZ/nWM+rL+x1dx3jHnEvHGn6xO6niZD3ghfpdguQM1bRY59vpl4 w==;
X-CSE-ConnectionGUID: W4dUAAn+TyWCLtWPX8L/uw==
X-CSE-MsgGUID: 5zQDzmmLSPGLIEg0W6D5Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="49614788"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="49614788"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 06:44:28 -0700
X-CSE-ConnectionGUID: 8iMRzOU9RQqO3t66c3pQHg==
X-CSE-MsgGUID: AuGwZPatTSuKzfnj1rYhVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133632857"
Received: from kwywiol-mobl1.ger.corp.intel.com (HELO [10.245.83.152])
 ([10.245.83.152])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 06:44:26 -0700
Message-ID: <9be4fc9c-979d-400f-9791-ad152e5444d2@linux.intel.com>
Date: Thu, 10 Apr 2025 15:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maciej.falkowski@linux.intel.com, ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20250408113247.418007-1-tzimmermann@suse.de>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250408113247.418007-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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

Applied to drm-misc-next

On 4/8/2025 1:31 PM, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/accel/ivpu/ivpu_gem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 212d21ad2bbd0..e0d242d9f3e50 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -30,7 +30,7 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>  		 "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %d mmu_mapped %d wc %d imported %d\n",
>  		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx ? bo->ctx->id : 0,
>  		 (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map_wc,
> -		 (bool)bo->base.base.import_attach);
> +		 (bool)drm_gem_is_imported(&bo->base.base));
>  }
>  
>  /*
> @@ -122,7 +122,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>  		bo->ctx = NULL;
>  	}
>  
> -	if (bo->base.base.import_attach)
> +	if (drm_gem_is_imported(&bo->base.base))
>  		return;
>  
>  	dma_resv_lock(bo->base.base.resv, NULL);
> @@ -461,7 +461,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
>  	if (bo->mmu_mapped)
>  		drm_printf(p, " mmu_mapped");
>  
> -	if (bo->base.base.import_attach)
> +	if (drm_gem_is_imported(&bo->base.base))
>  		drm_printf(p, " imported");
>  
>  	drm_printf(p, "\n");

