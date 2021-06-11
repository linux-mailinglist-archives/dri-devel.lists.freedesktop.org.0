Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02643A3B68
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 07:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4FD6E1B5;
	Fri, 11 Jun 2021 05:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447DE6E1B5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 05:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D96683F87B;
 Fri, 11 Jun 2021 07:34:08 +0200 (CEST)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="cRnqcCsF";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.689
X-Spam-Level: 
X-Spam-Status: No, score=-2.689 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fgv1tPU7SVai; Fri, 11 Jun 2021 07:34:07 +0200 (CEST)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 905ED3F870;
 Fri, 11 Jun 2021 07:34:07 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C5EC4360190;
 Fri, 11 Jun 2021 07:34:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1623389647; bh=VPNa11hYzmPQVRd90dNSPO1ASJb3r2ycCuSwlU/BXjg=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=cRnqcCsFyOIED52jdRlILyPAyoak3mXc117arHx0u4G7IjCk+lycBRXcGojhj00qg
 dPXIj8lLLV/e2K/9tFFR0uYTBU1/Ujrf65RW9BsHoTZeSUEUl6fbCkMSGU/jOZjkTV
 WaZdX/8k23ViElxQmnRhn84x/1wlnC/UcUZYFcWM=
Subject: Re: [PATCH 1/4] drm/ttm: add a pointer to the allocating BO into
 ttm_resource
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210610110559.1758-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <eaa54fe7-37c3-831b-390a-7e7cc8b414af@shipmail.org>
Date: Fri, 11 Jun 2021 07:34:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610110559.1758-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi, Christian,

I know you have a lot on your plate, and that the drm community is a bit 
lax about following the kernel patch submitting guidelines, but now that 
we're also spinning up a number of Intel developers on TTM could we 
please make a better effort with cover letters and commit messages so 
that they understand what the purpose and end goal of the series is. A 
reviewer shouldn't have to look at the last patch to try to get an 
understanding what the series is doing and why.

On 6/10/21 1:05 PM, Christian König wrote:
> We are going to need this for the next patch


> and it allows us to clean
> up amdgpu as well.

The amdgpu changes are not reflected in the commit title.


>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 47 ++++++++-------------
>   drivers/gpu/drm/ttm/ttm_resource.c          |  1 +
>   include/drm/ttm/ttm_resource.h              |  1 +
>   3 files changed, 19 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 194f9eecf89c..8e3f5da44e4f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -26,23 +26,12 @@
>   
>   #include "amdgpu.h"
>   
> -struct amdgpu_gtt_node {
> -	struct ttm_buffer_object *tbo;
> -	struct ttm_range_mgr_node base;
> -};
> -
>   static inline struct amdgpu_gtt_mgr *
>   to_gtt_mgr(struct ttm_resource_manager *man)
>   {
>   	return container_of(man, struct amdgpu_gtt_mgr, manager);
>   }
>   
> -static inline struct amdgpu_gtt_node *
> -to_amdgpu_gtt_node(struct ttm_resource *res)
> -{
> -	return container_of(res, struct amdgpu_gtt_node, base.base);
> -}
> -
>   /**
>    * DOC: mem_info_gtt_total
>    *
> @@ -107,9 +96,9 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
>    */
>   bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
>   {
> -	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
> +	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
>   
> -	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
> +	return drm_mm_node_allocated(&node->mm_nodes[0]);
>   }
>   
>   /**
> @@ -129,7 +118,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   {
>   	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
>   	uint32_t num_pages = PFN_UP(tbo->base.size);
> -	struct amdgpu_gtt_node *node;
> +	struct ttm_range_mgr_node *node;
>   	int r;
>   
>   	spin_lock(&mgr->lock);
> @@ -141,19 +130,17 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   	atomic64_sub(num_pages, &mgr->available);
>   	spin_unlock(&mgr->lock);
>   
> -	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
> +	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
>   	if (!node) {
>   		r = -ENOMEM;
>   		goto err_out;
>   	}
>   
> -	node->tbo = tbo;
> -	ttm_resource_init(tbo, place, &node->base.base);
> -
> +	ttm_resource_init(tbo, place, &node->base);
>   	if (place->lpfn) {
>   		spin_lock(&mgr->lock);
>   		r = drm_mm_insert_node_in_range(&mgr->mm,
> -						&node->base.mm_nodes[0],
> +						&node->mm_nodes[0],
>   						num_pages, tbo->page_alignment,
>   						0, place->fpfn, place->lpfn,
>   						DRM_MM_INSERT_BEST);
> @@ -161,14 +148,14 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   		if (unlikely(r))
>   			goto err_free;
>   
> -		node->base.base.start = node->base.mm_nodes[0].start;
> +		node->base.start = node->mm_nodes[0].start;
>   	} else {
> -		node->base.mm_nodes[0].start = 0;
> -		node->base.mm_nodes[0].size = node->base.base.num_pages;
> -		node->base.base.start = AMDGPU_BO_INVALID_OFFSET;
> +		node->mm_nodes[0].start = 0;
> +		node->mm_nodes[0].size = node->base.num_pages;
> +		node->base.start = AMDGPU_BO_INVALID_OFFSET;
>   	}
>   
> -	*res = &node->base.base;
> +	*res = &node->base;
>   	return 0;
>   
>   err_free:
> @@ -191,12 +178,12 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>   			       struct ttm_resource *res)
>   {
> -	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
> +	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
>   	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
>   
>   	spin_lock(&mgr->lock);
> -	if (drm_mm_node_allocated(&node->base.mm_nodes[0]))
> -		drm_mm_remove_node(&node->base.mm_nodes[0]);
> +	if (drm_mm_node_allocated(&node->mm_nodes[0]))
> +		drm_mm_remove_node(&node->mm_nodes[0]);
>   	spin_unlock(&mgr->lock);
>   	atomic64_add(res->num_pages, &mgr->available);
>   
> @@ -228,14 +215,14 @@ uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man)
>   int amdgpu_gtt_mgr_recover(struct ttm_resource_manager *man)
>   {
>   	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
> -	struct amdgpu_gtt_node *node;
> +	struct ttm_range_mgr_node *node;
>   	struct drm_mm_node *mm_node;
>   	int r = 0;
>   
>   	spin_lock(&mgr->lock);
>   	drm_mm_for_each_node(mm_node, &mgr->mm) {
> -		node = container_of(mm_node, typeof(*node), base.mm_nodes[0]);
> -		r = amdgpu_ttm_recover_gart(node->tbo);
> +		node = container_of(mm_node, typeof(*node), mm_nodes[0]);
> +		r = amdgpu_ttm_recover_gart(node->base.bo);
>   		if (r)
>   			break;
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 2431717376e7..7ff6194154fe 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -41,6 +41,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   	res->bus.offset = 0;
>   	res->bus.is_iomem = false;
>   	res->bus.caching = ttm_cached;
> +	res->bo = bo;
>   }
>   EXPORT_SYMBOL(ttm_resource_init);
>   
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 140b6b9a8bbe..6d0b7a6d2169 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -171,6 +171,7 @@ struct ttm_resource {
>   	uint32_t mem_type;
>   	uint32_t placement;
>   	struct ttm_bus_placement bus;
> +	struct ttm_buffer_object *bo;

Not that I'm against this change by itself, but this bo pointer is not 
refcounted, and therefore needs a description when it's needed and why. 
What happens, for example when the resource is moved to a ghost object, 
or the bo is killed while the resource is remaining on a lru list (which 
I understand was one of the main purposes with free-standing resources). 
Weak references need a guarantee that the object they pointed to is 
alive. What is that guarantee?

Also could we introduce new TTM structure members where they are first 
used /referenced by TTM and not where they are used by amdgpu? Without 
finding out in patch 3 that this member is needed to look up the bo from 
a lru list the correct response to this patch would have been: That bo 
is amdgpu-specific and needs to be in a driver private struct...


Thanks,

/Thomas


>   };
>   
>   /**
