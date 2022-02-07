Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C64AD331
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B734C10E505;
	Tue,  8 Feb 2022 08:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD6910F75B;
 Mon,  7 Feb 2022 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644230495; x=1675766495;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ArwuPTxElsiJl5IMoTxOH+10k1P9ZTtUYu/OMQhIIYk=;
 b=hYA8WV1XYW6SbUYBjWXya+QIaerkhQSRjEIfOgPs5f43Q2Stf7asezX2
 uSsHbu5u6UdbEWO7/u0bv7XHy8oXHWxTTJwTYmcECWmS6+umpLouZDnq1
 fgayPJ5p6n3Q5yjHYuwZVOBCQWziyaVvM9zFCggC9qFGzQg/EXxPHfjBc
 rnOe5khifmirYsZB1iwiAKLsMjI97BNmDqMPQxltT7QjRtmPnjnb5SCq5
 6ugXzRUYy4VSH1tTk2rRAzKzZKXXD4w8i1orjLk6OvZWbS3/mCxiQTY7j
 wKfB1nCWXIz2O2qrvIZhOM3LKBYlWPtWXP/SnSUuBX1hruLyLBch4MBzP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248453811"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="248453811"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 02:41:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="540044702"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.209.116])
 ([10.251.209.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 02:41:33 -0800
Message-ID: <bd9e2cf2-4cee-a99a-7550-3eaf32c93e5e@linux.intel.com>
Date: Mon, 7 Feb 2022 11:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Intel-gfx] [RFC 1/2] drm/i915/ttm: Add extra pages for handling
 ccs data
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220207093743.14467-1-ramalingam.c@intel.com>
 <20220207093743.14467-2-ramalingam.c@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220207093743.14467-2-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:23:40 +0000
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/02/2022 10:37, Ramalingam C wrote:
> While evicting the local memory data on flat-ccs capable platform we
> need to evict the ccs data associated to the data. For this, we are
> adding extra pages ((size / 256) >> PAGE_SIZE) into the ttm_tt.
>
> To achieve this we are adding a new param into the ttm_tt_init as
> ccs_pages_needed, which will be added into the ttm_tt->num_pages.
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Suggested-by: Thomas Hellstorm <thomas.hellstrom@intel.com>
> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c      |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 23 +++++++++++++++++++++-
>   drivers/gpu/drm/qxl/qxl_ttm.c              |  2 +-
>   drivers/gpu/drm/ttm/ttm_agp_backend.c      |  2 +-
>   drivers/gpu/drm/ttm/ttm_tt.c               | 12 ++++++-----
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
>   include/drm/ttm/ttm_tt.h                   |  4 +++-
>   7 files changed, 36 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 3f00192215d1..eef1f4dc7232 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -864,7 +864,7 @@ static struct ttm_tt *bo_driver_ttm_tt_create(struct ttm_buffer_object *bo,
>   	if (!tt)
>   		return NULL;
>   
> -	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached);
> +	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
>   	if (ret < 0)
>   		goto err_ttm_tt_init;
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 84cae740b4a5..bb71aa6d66c0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -16,6 +16,7 @@
>   #include "gem/i915_gem_ttm.h"
>   #include "gem/i915_gem_ttm_move.h"
>   #include "gem/i915_gem_ttm_pm.h"
> +#include "gt/intel_gpu_commands.h"
>   
>   #define I915_TTM_PRIO_PURGE     0
>   #define I915_TTM_PRIO_NO_PAGES  1
> @@ -242,12 +243,27 @@ static const struct i915_refct_sgt_ops tt_rsgt_ops = {
>   	.release = i915_ttm_tt_release
>   };
>   
> +static inline bool
> +i915_gem_object_has_lmem_placement(struct drm_i915_gem_object *obj)
> +{
> +	int i;
> +
> +	for (i = 0; i < obj->mm.n_placements; i++)
> +		if (obj->mm.placements[i]->type == INTEL_MEMORY_LOCAL)
> +			return true;
> +
> +	return false;
> +}
> +
>   static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   					 uint32_t page_flags)
>   {
> +	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
> +						     bdev);
>   	struct ttm_resource_manager *man =
>   		ttm_manager_type(bo->bdev, bo->resource->mem_type);
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +	unsigned long ccs_pages_needed = 0;
>   	enum ttm_caching caching;
>   	struct i915_ttm_tt *i915_tt;
>   	int ret;
> @@ -270,7 +286,12 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   		i915_tt->is_shmem = true;
>   	}
>   
> -	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching);
> +	if (HAS_FLAT_CCS(i915) && i915_gem_object_has_lmem_placement(obj))
> +		ccs_pages_needed = DIV_ROUND_UP(DIV_ROUND_UP(bo->base.size,
> +					       NUM_CCS_BYTES_PER_BLOCK), PAGE_SIZE);
> +
> +	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags,
> +			  caching, ccs_pages_needed);

I am wondering if we should do this in the driver itself and pass 
ttm->num_pages with CCS size included.


Regards,

Nirmoy


>   	if (ret)
>   		goto err_free;
>   
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index b2e33d5ba5d0..52156b54498f 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -113,7 +113,7 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
>   	ttm = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
>   	if (ttm == NULL)
>   		return NULL;
> -	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached)) {
> +	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached, 0)) {
>   		kfree(ttm);
>   		return NULL;
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> index 6ddc16f0fe2b..d27691f2e451 100644
> --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> @@ -134,7 +134,7 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
>   	agp_be->mem = NULL;
>   	agp_be->bridge = bridge;
>   
> -	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined)) {
> +	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined, 0)) {
>   		kfree(agp_be);
>   		return NULL;
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 79c870a3bef8..80355465f717 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -134,9 +134,10 @@ void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>   static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   			       struct ttm_buffer_object *bo,
>   			       uint32_t page_flags,
> -			       enum ttm_caching caching)
> +			       enum ttm_caching caching,
> +			       unsigned long ccs_pages)
>   {
> -	ttm->num_pages = PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT;
> +	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + ccs_pages;
>   	ttm->caching = ttm_cached;
>   	ttm->page_flags = page_flags;
>   	ttm->dma_address = NULL;
> @@ -146,9 +147,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   }
>   
>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> -		uint32_t page_flags, enum ttm_caching caching)
> +		uint32_t page_flags, enum ttm_caching caching,
> +		unsigned long ccs_pages)
>   {
> -	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> +	ttm_tt_init_fields(ttm, bo, page_flags, caching, ccs_pages);
>   
>   	if (ttm_tt_alloc_page_directory(ttm)) {
>   		pr_err("Failed allocating page table\n");
> @@ -180,7 +182,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>   {
>   	int ret;
>   
> -	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> +	ttm_tt_init_fields(ttm, bo, page_flags, caching, 0);
>   
>   	if (page_flags & TTM_TT_FLAG_EXTERNAL)
>   		ret = ttm_sg_tt_alloc_page_directory(ttm);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index b84ecc6d6611..4e3938e62c08 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -517,7 +517,7 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
>   				     ttm_cached);
>   	else
>   		ret = ttm_tt_init(&vmw_be->dma_ttm, bo, page_flags,
> -				  ttm_cached);
> +				  ttm_cached, 0);
>   	if (unlikely(ret != 0))
>   		goto out_no_init;
>   
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index f20832139815..2c4ff08ea354 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -140,6 +140,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
>    * @bo: The buffer object we create the ttm for.
>    * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
>    * @caching: the desired caching state of the pages
> + * @ccs_pages_needed: Extra pages needed for the ccs data of compression.
>    *
>    * Create a struct ttm_tt to back data with system memory pages.
>    * No pages are actually allocated.
> @@ -147,7 +148,8 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
>    * NULL: Out of memory.
>    */
>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> -		uint32_t page_flags, enum ttm_caching caching);
> +		uint32_t page_flags, enum ttm_caching caching,
> +		unsigned long ccs_pages_needed);
>   int ttm_sg_tt_init(struct ttm_tt *ttm_dma, struct ttm_buffer_object *bo,
>   		   uint32_t page_flags, enum ttm_caching caching);
>   
