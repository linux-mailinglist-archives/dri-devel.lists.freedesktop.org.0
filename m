Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E24AB6A45
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 13:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485A910E613;
	Wed, 14 May 2025 11:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F0410E613
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 11:41:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------c4iwY8l2KMegcSdOGcU8JU7H"
Message-ID: <ea70e6fa-22a1-4adc-927a-5e9c2563f784@lankhorst.se>
Date: Wed, 14 May 2025 13:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [5/7] ttm: add initial memcg integration. (v4)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, christian.koenig@amd.com, Johannes Weiner
 <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250512061913.3522902-6-airlied@gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20250512061913.3522902-6-airlied@gmail.com>
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

This is a multi-part message in MIME format.
--------------c4iwY8l2KMegcSdOGcU8JU7H
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dave,

We've had a small discussion on irc, so I wanted to summarize it here: All memory allocated should be accounted, even memory that is being evicted from VRAM. This may cause the process that originally allocated the VRAM to go over the memcg limit,that should be solved by invoking OOM condition on the original process, which may have ways to solve it like purging purgeable memory, or as last resort OOM killing. The VRAM evicter is already memcg aware, so it should be possible to do the same for the shrinker. I created a patch to use the same cgroup for memcg as for dmem, we shouldprobably extract the cgroup from mm->owner, and create a function to charge dmemcg and memcg with a specified cgroup. For applications that use a centralised allocator, it might be needed to charge a different cgroup when exporting.

Kind regards, Maarten

On 2025-05-12 08:12, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> Doing proper integration of TTM system memory allocations with
> memcg is a difficult ask, primarily due to difficulties around
> accounting for evictions properly.
>
> However there are systems where userspace will be allocating
> objects in system memory and they won't be prone to migrating
> or evicting and we should start with at least accounting those.
>
> This adds a memcg group to ttm bo and tt objects.
>
> This memcg is used when:
> a) when a tt is populated (and unpopulated)
> b) the TTM_PL_FLAG_MEMCG is set on the placement for the
> bo when the tt is allocated.
>
> The placement flag is set for all non-eviction placements.
>
> This version moves back from the resource to the tt layer,
> when accounting at the resource layer, if an object is swapped
> out there was no way to remove it from the accounting, whereas
> the tt layer has more info for this.
>
> v4: move back to the tt layer from the resource layer to
> handle swap, but keep the memcg charging hooks for now.
> v3: moves from having a flags on the op ctx to the using a
> placement flag.
> v2: moved the charging up a level and also no longer used
> __GFP_ACCOUNT, or attached the memcg to object pages, it instead
> uses the same approach as socket memory and just charges/uncharges
> at the object level. This was suggested by Christian.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c      |  6 ++++--
>  drivers/gpu/drm/ttm/ttm_bo_util.c |  6 +++---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c   |  4 +++-
>  drivers/gpu/drm/ttm/ttm_tt.c      | 17 ++++++++++++++++-
>  include/drm/ttm/ttm_bo.h          |  7 +++++++
>  include/drm/ttm/ttm_placement.h   |  3 +++
>  include/drm/ttm/ttm_tt.h          |  9 ++++++++-
>  7 files changed, 44 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 5bf3c969907c..1630ef28e5a8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -140,7 +140,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>  			goto out_err;
>  
>  		if (mem->mem_type != TTM_PL_SYSTEM) {
> -			ret = ttm_bo_populate(bo, ctx);
> +			ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, ctx);
>  			if (ret)
>  				goto out_err;
>  		}
> @@ -1237,6 +1237,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>  /**
>   * ttm_bo_populate() - Ensure that a buffer object has backing pages
>   * @bo: The buffer object
> + * @memcg_account: account this memory with memcg if needed
>   * @ctx: The ttm_operation_ctx governing the operation.
>   *
>   * For buffer objects in a memory type whose manager uses
> @@ -1250,6 +1251,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>   * is set to true.
>   */
>  int ttm_bo_populate(struct ttm_buffer_object *bo,
> +		    bool memcg_account,
>  		    struct ttm_operation_ctx *ctx)
>  {
>  	struct ttm_tt *tt = bo->ttm;
> @@ -1262,7 +1264,7 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
>  		return 0;
>  
>  	swapped = ttm_tt_is_swapped(tt);
> -	ret = ttm_tt_populate(bo->bdev, tt, ctx);
> +	ret = ttm_tt_populate(bo->bdev, tt, memcg_account, ctx);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 15cab9bda17f..7d599d0707e4 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>  	src_man = ttm_manager_type(bdev, src_mem->mem_type);
>  	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>  		    dst_man->use_tt)) {
> -		ret = ttm_bo_populate(bo, ctx);
> +		ret = ttm_bo_populate(bo, dst_mem->placement & TTM_PL_FLAG_MEMCG, ctx);
>  		if (ret)
>  			return ret;
>  	}
> @@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>  
>  	BUG_ON(!ttm);
>  
> -	ret = ttm_bo_populate(bo, &ctx);
> +	ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, &ctx);
>  	if (ret)
>  		return ret;
>  
> @@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>  		pgprot_t prot;
>  		void *vaddr;
>  
> -		ret = ttm_bo_populate(bo, &ctx);
> +		ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, &ctx);
>  		if (ret)
>  			return ret;
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index a194db83421d..02aea23a34e7 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -224,7 +224,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>  		};
>  
>  		ttm = bo->ttm;
> -		err = ttm_bo_populate(bo, &ctx);
> +		err = ttm_bo_populate(bo,
> +				      bo->resource->placement & TTM_PL_FLAG_MEMCG,
> +				      &ctx);
>  		if (err) {
>  			if (err == -EINTR || err == -ERESTARTSYS ||
>  			    err == -EAGAIN)
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 698cd4bf5e46..81c4cbbeb130 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -161,6 +161,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>  	ttm->caching = caching;
>  	ttm->restore = NULL;
>  	ttm->backup = NULL;
> +	ttm->memcg = bo->memcg;
>  }
>  
>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> @@ -365,7 +366,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>  EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapout);
>  
>  int ttm_tt_populate(struct ttm_device *bdev,
> -		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
> +		    struct ttm_tt *ttm,
> +		    bool memcg_account_tt,
> +		    struct ttm_operation_ctx *ctx)
>  {
>  	int ret;
>  
> @@ -376,6 +379,14 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  		return 0;
>  
>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
> +		if (ttm->memcg && memcg_account_tt) {
> +			gfp_t gfp_flags = GFP_USER;
> +			if (ctx->gfp_retry_mayfail)
> +				gfp_flags |= __GFP_RETRY_MAYFAIL;
> +			if (!mem_cgroup_charge_gpu(ttm->memcg, ttm->num_pages, gfp_flags))
> +				return -ENOMEM;
> +			ttm->page_flags |= TTM_TT_FLAG_ACCOUNTED;
> +		}
>  		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>  		if (bdev->pool.use_dma32)
>  			atomic_long_add(ttm->num_pages,
> @@ -437,6 +448,10 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>  		ttm_pool_free(&bdev->pool, ttm);
>  
>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
> +		if (ttm->page_flags & TTM_TT_FLAG_ACCOUNTED) {
> +			mem_cgroup_uncharge_gpu(ttm->memcg, ttm->num_pages);
> +			ttm->page_flags &= ~TTM_TT_FLAG_ACCOUNTED;
> +		}
>  		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>  		if (bdev->pool.use_dma32)
>  			atomic_long_sub(ttm->num_pages,
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 903cd1030110..d7c0dd9e0746 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -135,6 +135,12 @@ struct ttm_buffer_object {
>  	 * reservation lock.
>  	 */
>  	struct sg_table *sg;
> +
> +	/**
> +	 * @memcg: memory cgroup to charge this to if it ends up using system memory.
> +	 * NULL means don't charge.
> +	 */
> +	struct mem_cgroup *memcg;
>  };
>  
>  #define TTM_BO_MAP_IOMEM_MASK 0x80
> @@ -486,6 +492,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
>  		     pgprot_t tmp);
>  void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>  int ttm_bo_populate(struct ttm_buffer_object *bo,
> +		    bool memcg_account,
>  		    struct ttm_operation_ctx *ctx);
>  
>  /* Driver LRU walk helpers initially targeted for shrinking. */
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index b510a4812609..668798072292 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -70,6 +70,9 @@
>  /* Placement is only used during eviction */
>  #define TTM_PL_FLAG_FALLBACK	(1 << 4)
>  
> +/* Placement causes memcg accounting */
> +#define TTM_PL_FLAG_MEMCG	(1 << 5)
> +
>  /**
>   * struct ttm_place
>   *
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 406437ad674b..2790fc82edc3 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -90,6 +90,8 @@ struct ttm_tt {
>  	 * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set if the
>  	 * struct ttm_tt has been (possibly partially) backed up.
>  	 *
> +	 * TTM_TT_FLAG_ACCOUNTED: TTM internal. This tt has been accounted.
> +	 *
>  	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
>  	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>  	 * then unset when TTM calls ttm_tt_unpopulate().
> @@ -101,8 +103,9 @@ struct ttm_tt {
>  #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>  #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>  #define TTM_TT_FLAG_BACKED_UP	        BIT(5)
> +#define TTM_TT_FLAG_ACCOUNTED	        BIT(6)
>  
> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(7)
>  	uint32_t page_flags;
>  	/** @num_pages: Number of pages in the page array. */
>  	uint32_t num_pages;
> @@ -126,6 +129,8 @@ struct ttm_tt {
>  	enum ttm_caching caching;
>  	/** @restore: Partial restoration from backup state. TTM private */
>  	struct ttm_pool_tt_restore *restore;
> +	/** @memcg: Memory cgroup for this TT allocation */
> +	struct mem_cgroup *memcg;
>  };
>  
>  /**
> @@ -245,11 +250,13 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>   *
>   * @bdev: the ttm_device this object belongs to
>   * @ttm: Pointer to the ttm_tt structure
> + * @mem_account_tt: Account this population to the memcg
>   * @ctx: operation context for populating the tt object.
>   *
>   * Calls the driver method to allocate pages for a ttm
>   */
>  int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
> +		    bool mem_account_tt,
>  		    struct ttm_operation_ctx *ctx);
>  
>  /**
--------------c4iwY8l2KMegcSdOGcU8JU7H
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre><font face="monospace">Hi Dave,</font></pre>
    <pre><font face="monospace">We've had a small discussion on irc, so I wanted to summarize it here:

</font><font face="monospace">All memory allocated should be accounted, even memory that is being
evicted from VRAM.

This may cause the process that originally allocated
the VRAM to go over the memcg limit,</font><font face="monospace"> that should be solved by invoking
OOM condition on the original process, which may have ways to solve it
like purging purgeable memory, or as last resort OOM killing.

</font><font face="monospace">The VRAM evicter is already memcg aware, so it should be possible to do
the same for the shrinker. I created a patch to use the same cgroup for
memcg as for dmem, we should</font><font face="monospace"> probably extract the cgroup from mm-&gt;owner,
and create a function to charge dmemcg and memcg with a specified cgroup.

For applications that use a centralised allocator, </font><font
    face="monospace">it might be needed to
charge a different cgroup when exporting.</font></pre>
    <pre><font face="monospace">Kind regards,
</font><font face="monospace">Maarten</font></pre>
    <div class="moz-cite-prefix">On 2025-05-12 08:12, Dave Airlie wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250512061913.3522902-6-airlied@gmail.com">
      <pre wrap="" class="moz-quote-pre">From: Dave Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>

Doing proper integration of TTM system memory allocations with
memcg is a difficult ask, primarily due to difficulties around
accounting for evictions properly.

However there are systems where userspace will be allocating
objects in system memory and they won't be prone to migrating
or evicting and we should start with at least accounting those.

This adds a memcg group to ttm bo and tt objects.

This memcg is used when:
a) when a tt is populated (and unpopulated)
b) the TTM_PL_FLAG_MEMCG is set on the placement for the
bo when the tt is allocated.

The placement flag is set for all non-eviction placements.

This version moves back from the resource to the tt layer,
when accounting at the resource layer, if an object is swapped
out there was no way to remove it from the accounting, whereas
the tt layer has more info for this.

v4: move back to the tt layer from the resource layer to
handle swap, but keep the memcg charging hooks for now.
v3: moves from having a flags on the op ctx to the using a
placement flag.
v2: moved the charging up a level and also no longer used
__GFP_ACCOUNT, or attached the memcg to object pages, it instead
uses the same approach as socket memory and just charges/uncharges
at the object level. This was suggested by Christian.

Signed-off-by: Dave Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>
---
 drivers/gpu/drm/ttm/ttm_bo.c      |  6 ++++--
 drivers/gpu/drm/ttm/ttm_bo_util.c |  6 +++---
 drivers/gpu/drm/ttm/ttm_bo_vm.c   |  4 +++-
 drivers/gpu/drm/ttm/ttm_tt.c      | 17 ++++++++++++++++-
 include/drm/ttm/ttm_bo.h          |  7 +++++++
 include/drm/ttm/ttm_placement.h   |  3 +++
 include/drm/ttm/ttm_tt.h          |  9 ++++++++-
 7 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 5bf3c969907c..1630ef28e5a8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -140,7 +140,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 			goto out_err;
 
 		if (mem-&gt;mem_type != TTM_PL_SYSTEM) {
-			ret = ttm_bo_populate(bo, ctx);
+			ret = ttm_bo_populate(bo, mem-&gt;placement &amp; TTM_PL_FLAG_MEMCG, ctx);
 			if (ret)
 				goto out_err;
 		}
@@ -1237,6 +1237,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 /**
  * ttm_bo_populate() - Ensure that a buffer object has backing pages
  * @bo: The buffer object
+ * @memcg_account: account this memory with memcg if needed
  * @ctx: The ttm_operation_ctx governing the operation.
  *
  * For buffer objects in a memory type whose manager uses
@@ -1250,6 +1251,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
  * is set to true.
  */
 int ttm_bo_populate(struct ttm_buffer_object *bo,
+		    bool memcg_account,
 		    struct ttm_operation_ctx *ctx)
 {
 	struct ttm_tt *tt = bo-&gt;ttm;
@@ -1262,7 +1264,7 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
 		return 0;
 
 	swapped = ttm_tt_is_swapped(tt);
-	ret = ttm_tt_populate(bo-&gt;bdev, tt, ctx);
+	ret = ttm_tt_populate(bo-&gt;bdev, tt, memcg_account, ctx);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 15cab9bda17f..7d599d0707e4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	src_man = ttm_manager_type(bdev, src_mem-&gt;mem_type);
 	if (ttm &amp;&amp; ((ttm-&gt;page_flags &amp; TTM_TT_FLAG_SWAPPED) ||
 		    dst_man-&gt;use_tt)) {
-		ret = ttm_bo_populate(bo, ctx);
+		ret = ttm_bo_populate(bo, dst_mem-&gt;placement &amp; TTM_PL_FLAG_MEMCG, ctx);
 		if (ret)
 			return ret;
 	}
@@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 
 	BUG_ON(!ttm);
 
-	ret = ttm_bo_populate(bo, &amp;ctx);
+	ret = ttm_bo_populate(bo, mem-&gt;placement &amp; TTM_PL_FLAG_MEMCG, &amp;ctx);
 	if (ret)
 		return ret;
 
@@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 		pgprot_t prot;
 		void *vaddr;
 
-		ret = ttm_bo_populate(bo, &amp;ctx);
+		ret = ttm_bo_populate(bo, mem-&gt;placement &amp; TTM_PL_FLAG_MEMCG, &amp;ctx);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index a194db83421d..02aea23a34e7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -224,7 +224,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		};
 
 		ttm = bo-&gt;ttm;
-		err = ttm_bo_populate(bo, &amp;ctx);
+		err = ttm_bo_populate(bo,
+				      bo-&gt;resource-&gt;placement &amp; TTM_PL_FLAG_MEMCG,
+				      &amp;ctx);
 		if (err) {
 			if (err == -EINTR || err == -ERESTARTSYS ||
 			    err == -EAGAIN)
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 698cd4bf5e46..81c4cbbeb130 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -161,6 +161,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 	ttm-&gt;caching = caching;
 	ttm-&gt;restore = NULL;
 	ttm-&gt;backup = NULL;
+	ttm-&gt;memcg = bo-&gt;memcg;
 }
 
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
@@ -365,7 +366,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
 EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapout);
 
 int ttm_tt_populate(struct ttm_device *bdev,
-		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
+		    struct ttm_tt *ttm,
+		    bool memcg_account_tt,
+		    struct ttm_operation_ctx *ctx)
 {
 	int ret;
 
@@ -376,6 +379,14 @@ int ttm_tt_populate(struct ttm_device *bdev,
 		return 0;
 
 	if (!(ttm-&gt;page_flags &amp; TTM_TT_FLAG_EXTERNAL)) {
+		if (ttm-&gt;memcg &amp;&amp; memcg_account_tt) {
+			gfp_t gfp_flags = GFP_USER;
+			if (ctx-&gt;gfp_retry_mayfail)
+				gfp_flags |= __GFP_RETRY_MAYFAIL;
+			if (!mem_cgroup_charge_gpu(ttm-&gt;memcg, ttm-&gt;num_pages, gfp_flags))
+				return -ENOMEM;
+			ttm-&gt;page_flags |= TTM_TT_FLAG_ACCOUNTED;
+		}
 		atomic_long_add(ttm-&gt;num_pages, &amp;ttm_pages_allocated);
 		if (bdev-&gt;pool.use_dma32)
 			atomic_long_add(ttm-&gt;num_pages,
@@ -437,6 +448,10 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 		ttm_pool_free(&amp;bdev-&gt;pool, ttm);
 
 	if (!(ttm-&gt;page_flags &amp; TTM_TT_FLAG_EXTERNAL)) {
+		if (ttm-&gt;page_flags &amp; TTM_TT_FLAG_ACCOUNTED) {
+			mem_cgroup_uncharge_gpu(ttm-&gt;memcg, ttm-&gt;num_pages);
+			ttm-&gt;page_flags &amp;= ~TTM_TT_FLAG_ACCOUNTED;
+		}
 		atomic_long_sub(ttm-&gt;num_pages, &amp;ttm_pages_allocated);
 		if (bdev-&gt;pool.use_dma32)
 			atomic_long_sub(ttm-&gt;num_pages,
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 903cd1030110..d7c0dd9e0746 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -135,6 +135,12 @@ struct ttm_buffer_object {
 	 * reservation lock.
 	 */
 	struct sg_table *sg;
+
+	/**
+	 * @memcg: memory cgroup to charge this to if it ends up using system memory.
+	 * NULL means don't charge.
+	 */
+	struct mem_cgroup *memcg;
 };
 
 #define TTM_BO_MAP_IOMEM_MASK 0x80
@@ -486,6 +492,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 		     pgprot_t tmp);
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 int ttm_bo_populate(struct ttm_buffer_object *bo,
+		    bool memcg_account,
 		    struct ttm_operation_ctx *ctx);
 
 /* Driver LRU walk helpers initially targeted for shrinking. */
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index b510a4812609..668798072292 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -70,6 +70,9 @@
 /* Placement is only used during eviction */
 #define TTM_PL_FLAG_FALLBACK	(1 &lt;&lt; 4)
 
+/* Placement causes memcg accounting */
+#define TTM_PL_FLAG_MEMCG	(1 &lt;&lt; 5)
+
 /**
  * struct ttm_place
  *
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 406437ad674b..2790fc82edc3 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -90,6 +90,8 @@ struct ttm_tt {
 	 * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set if the
 	 * struct ttm_tt has been (possibly partially) backed up.
 	 *
+	 * TTM_TT_FLAG_ACCOUNTED: TTM internal. This tt has been accounted.
+	 *
 	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
 	 * set by TTM after ttm_tt_populate() has successfully returned, and is
 	 * then unset when TTM calls ttm_tt_unpopulate().
@@ -101,8 +103,9 @@ struct ttm_tt {
 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
 #define TTM_TT_FLAG_DECRYPTED		BIT(4)
 #define TTM_TT_FLAG_BACKED_UP	        BIT(5)
+#define TTM_TT_FLAG_ACCOUNTED	        BIT(6)
 
-#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
+#define TTM_TT_FLAG_PRIV_POPULATED	BIT(7)
 	uint32_t page_flags;
 	/** @num_pages: Number of pages in the page array. */
 	uint32_t num_pages;
@@ -126,6 +129,8 @@ struct ttm_tt {
 	enum ttm_caching caching;
 	/** @restore: Partial restoration from backup state. TTM private */
 	struct ttm_pool_tt_restore *restore;
+	/** @memcg: Memory cgroup for this TT allocation */
+	struct mem_cgroup *memcg;
 };
 
 /**
@@ -245,11 +250,13 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
  *
  * @bdev: the ttm_device this object belongs to
  * @ttm: Pointer to the ttm_tt structure
+ * @mem_account_tt: Account this population to the memcg
  * @ctx: operation context for populating the tt object.
  *
  * Calls the driver method to allocate pages for a ttm
  */
 int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
+		    bool mem_account_tt,
 		    struct ttm_operation_ctx *ctx);
 
 /**
</pre>
    </blockquote>
  </body>
</html>

--------------c4iwY8l2KMegcSdOGcU8JU7H--
