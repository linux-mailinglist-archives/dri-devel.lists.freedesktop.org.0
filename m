Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B518739D96C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 12:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED6F6E18F;
	Mon,  7 Jun 2021 10:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81656E18F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 10:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id F28903F5A7;
 Mon,  7 Jun 2021 12:15:34 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="jQ+xcVx6";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.689
X-Spam-Level: 
X-Spam-Status: No, score=-2.689 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPJZC6iPfqN6; Mon,  7 Jun 2021 12:15:34 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 49FD03F51E;
 Mon,  7 Jun 2021 12:15:33 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.55.55.41])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 485993601A1;
 Mon,  7 Jun 2021 12:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1623060932; bh=gh8dKSfNbCzyTAZ7iKmS9b6kamZn45BtoNWhz1it/is=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=jQ+xcVx63ZPren/8Kz5T3Ner+Tp3z3JuWlKSs9T0yddMD288s8g/XhH2mG+zbjM3l
 N5MeHdebqFNc8ieCWaRT/CNCI6wd597BBaMtLcFIy+MjmorVjZ7xjhl4M90wWg1nvG
 4o7ad9SCXq4RDn8kw27lKi0VDPMBF/PKCMyaobC0=
Subject: Re: [PATCH 10/10] drm/ttm: flip the switch for driver allocated
 resources v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <20210602100914.46246-10-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <c7163102-61e7-435d-f10a-83ee1926fe1f@shipmail.org>
Date: Mon, 7 Jun 2021 12:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602100914.46246-10-christian.koenig@amd.com>
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


On 6/2/21 12:09 PM, Christian König wrote:
> Instead of both driver and TTM allocating memory finalize embedding the
> ttm_resource object as base into the driver backends.
>
> v2: fix typo in vmwgfx grid mgr and double init in amdgpu_vram_mgr.c
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 44 ++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  2 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 60 +++++++++----------
>   drivers/gpu/drm/drm_gem_vram_helper.c         |  3 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.c          |  8 +--
>   drivers/gpu/drm/nouveau/nouveau_mem.c         | 11 ++--
>   drivers/gpu/drm/nouveau/nouveau_mem.h         | 14 ++---
>   drivers/gpu/drm/nouveau/nouveau_ttm.c         | 32 +++++-----
>   drivers/gpu/drm/ttm/ttm_range_manager.c       | 23 +++----
>   drivers/gpu/drm/ttm/ttm_resource.c            | 18 +-----
>   drivers/gpu/drm/ttm/ttm_sys_manager.c         | 12 ++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 24 ++++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 27 ++++-----
>   include/drm/ttm/ttm_range_manager.h           |  3 +-
>   include/drm/ttm/ttm_resource.h                | 43 ++++++-------
>   16 files changed, 140 insertions(+), 189 deletions(-)
...
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index ce5d07ca384c..c32e1aee2481 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -58,7 +58,7 @@ to_range_manager(struct ttm_resource_manager *man)
>   static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   			       struct ttm_buffer_object *bo,
>   			       const struct ttm_place *place,
> -			       struct ttm_resource *mem)
> +			       struct ttm_resource **res)
>   {
>   	struct ttm_range_manager *rman = to_range_manager(man);
>   	struct ttm_range_mgr_node *node;
> @@ -83,37 +83,30 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   
>   	spin_lock(&rman->lock);
>   	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
> -					  mem->num_pages, bo->page_alignment, 0,
> +					  node->base.num_pages,
> +					  bo->page_alignment, 0,
>   					  place->fpfn, lpfn, mode);
>   	spin_unlock(&rman->lock);
>   
> -	if (unlikely(ret)) {
> +	if (unlikely(ret))
>   		kfree(node);
> -	} else {
> -		mem->mm_node = &node->mm_nodes[0];
> -		mem->start = node->mm_nodes[0].start;
> -	}
> +	else
> +		node->base.start = node->mm_nodes[0].start;
>   
>   	return ret;
>   }

Looks like this patch forgets to assign *@res. Null pointer derefs when 
testing i915.

BTW shouldn't we return the struct ttm_resource ptr here rather than 
passing it as an argument?

/Thomas


