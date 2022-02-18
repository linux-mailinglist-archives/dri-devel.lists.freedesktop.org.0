Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1084BC1B8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2A010E12F;
	Fri, 18 Feb 2022 21:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA11510E4E4;
 Fri, 18 Feb 2022 21:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645219086; x=1676755086;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jwVJBU9vgNSTgqCm7b3i5DhRq0atBi5cZrPTnuHHWkU=;
 b=VTcLrjsV5haLmJ8B06s1wUIIprqVJ+xNOTHerbZific2vhcwHjLUL8D0
 EGmRY8KMTL8Jgdzc/T9jqum5xI7XA6Ec9KoanLks+SeVN5GE+wKhnv5Z5
 k7pFszPvKJRRKCszkKMdUOQukZ9ACuL9sYTUHUh5KfQI2a6ziL5JZn6Qv
 3UgBVIfjuUu6lQyjPnA+Z4uvoflzqXyBvaIwDrr3VTag2OQHqagZwwJ9O
 3UzbGlRFYxJnySpJsjjFnAiX999PNbMoHJu8UQalCGPVNv26CpKjG5+Uz
 MtXy+7VSkxHVAAaGjHVj+cjC7HRzp6m/3i7xXAvMQSuQxSCic83ZZL5s1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="231846766"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="231846766"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:18:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="506896596"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:18:05 -0800
Date: Fri, 18 Feb 2022 13:12:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 16/16] drm/i915/guc: Remove plain ads_blob pointer
Message-ID: <20220218211214.GA3890@jons-linux-dev-box>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
 <20220216174147.3073235-17-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216174147.3073235-17-lucas.demarchi@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 09:41:47AM -0800, Lucas De Marchi wrote:
> Now we have the access to content of GuC ADS either using iosys_map
> API or using a temporary buffer. Remove guc->ads_blob as there shouldn't
> be updates using the bare pointer anymore.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h     | 3 +--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 8 ++++----
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index f857e9190750..bf7079480d47 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -147,8 +147,7 @@ struct intel_guc {
>  
>  	/** @ads_vma: object allocated to hold the GuC ADS */
>  	struct i915_vma *ads_vma;
> -	/** @ads_blob: contents of the GuC ADS */
> -	struct __guc_ads_blob *ads_blob;
> +	/** @ads_map: contents of the GuC ADS */
>  	struct iosys_map ads_map;
>  	/** @ads_regset_size: size of the save/restore regsets in the ADS */
>  	u32 ads_regset_size;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index d0593063c0dc..847e00390b00 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -667,6 +667,7 @@ static void __guc_ads_init(struct intel_guc *guc)
>   */
>  int intel_guc_ads_create(struct intel_guc *guc)
>  {
> +	void *ads_blob;
>  	u32 size;
>  	int ret;
>  
> @@ -691,14 +692,14 @@ int intel_guc_ads_create(struct intel_guc *guc)
>  	size = guc_ads_blob_size(guc);
>  
>  	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->ads_vma,
> -					     (void **)&guc->ads_blob);
> +					     &ads_blob);
>  	if (ret)
>  		return ret;
>  
>  	if (i915_gem_object_is_lmem(guc->ads_vma->obj))
> -		iosys_map_set_vaddr_iomem(&guc->ads_map, (void __iomem *)guc->ads_blob);
> +		iosys_map_set_vaddr_iomem(&guc->ads_map, (void __iomem *)ads_blob);
>  	else
> -		iosys_map_set_vaddr(&guc->ads_map, guc->ads_blob);
> +		iosys_map_set_vaddr(&guc->ads_map, ads_blob);
>  
>  	__guc_ads_init(guc);
>  
> @@ -720,7 +721,6 @@ void intel_guc_ads_init_late(struct intel_guc *guc)
>  void intel_guc_ads_destroy(struct intel_guc *guc)
>  {
>  	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
> -	guc->ads_blob = NULL;
>  	iosys_map_clear(&guc->ads_map);
>  	kfree(guc->ads_regset);
>  }
> -- 
> 2.35.1
> 
