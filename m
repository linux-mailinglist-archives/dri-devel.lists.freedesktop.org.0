Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8ACAC9EC7
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jun 2025 16:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710F810E38E;
	Sun,  1 Jun 2025 14:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="c5TqTt9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA1510E378;
 Sun,  1 Jun 2025 14:06:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748786782; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FZwbNdhPDtDQxwQaPdYXI84BFaqqxn109VuWglswNu/bo1NLU6E8kYBhHlZhXI3m/Qfpx6pq0lw3Y8Ju63nBiZymD2aVGYd5EHWoKRRf9jb7LAaAOfXRUdbSAmI48ZDnqMN+0QRt+Dknl6Bw9f8pR3cl4RlnWSmL0fELfqpr3vo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748786782;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=P0f5Bkez0JkWxt9RiYU1m5wASyTrdTYnFhWyQtJzhPI=; 
 b=HTA0SzgwjsvjWDibJ6qydfCavFvoB+rWjT3o4nZYxoFGt5actKdPwH7dZ579wcZvXj0L0V3O6nD9vfYuaJ2AgY6aiVkgdLhwSYECo6WlS/t2nAIRvVgjfhcdw7kaHHD2F8Imwb2eEg7irugmm2SqJNEbrY9OeEAiJbhtsLbxVAQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748786782; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=P0f5Bkez0JkWxt9RiYU1m5wASyTrdTYnFhWyQtJzhPI=;
 b=c5TqTt9LjPF9Ko/l79WU3WY8l9A/Z5oIID3n5qwTnEdzNP1jkvg11dr5cgpYjjQe
 Fuse2NAJhUpCyD6miYQ2d5x2uHjiyY9yEjPfTWXQrE3ZSardkndw+tZ+nGv264bhyB4
 bjfz1SDgqjHepbjpo1leus74ACz+4Rx58J2Ch7Mw=
Received: by mx.zohomail.com with SMTPS id 1748786779449218.4167769281894;
 Sun, 1 Jun 2025 07:06:19 -0700 (PDT)
Date: Sun, 1 Jun 2025 15:06:15 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 intel-xe@lists.freedesktop.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH 3/8] drm/panthor: Fix UAF in
 panthor_gem_create_with_handle() debugfs code
Message-ID: <jq6d2nxsp7g6sq2uo4bknqgfod7ssdoqyvtlorpq2xij2ikgjc@6y64ebpjeq7p>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-4-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528091307.1894940-4-simona.vetter@ffwll.ch>
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

Hi Simona,

On 28.05.2025 11:13, Simona Vetter wrote:
> The object is potentially already gone after the drm_gem_object_put().
> In general the object should be fully constructed before calling
> drm_gem_handle_create(), except the debugfs tracking uses a separate
> lock and list and separate flag to denotate whether the object is
> actually initilized.
>
> Since I'm touching this all anyway simplify this by only adding the
> object to the debugfs when it's ready for that, which allows us to
> delete that separate flag. panthor_gem_debugfs_bo_rm() already checks
> whether we've actually been added to the list or this is some error
> path cleanup.
>
> Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 31 +++++++++++++--------------
>  drivers/gpu/drm/panthor/panthor_gem.h |  3 ---
>  2 files changed, 15 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 7c00fd77758b..f334444cb5df 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -16,9 +16,11 @@
>  #include "panthor_mmu.h"
>
>  #ifdef CONFIG_DEBUG_FS
> -static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> -				       struct panthor_gem_object *bo)
> +static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
>  {
> +	struct panthor_device *ptdev = container_of(bo->base.base.dev,
> +						    struct panthor_device, base);
> +
>  	INIT_LIST_HEAD(&bo->debugfs.node);
>
>  	bo->debugfs.creator.tgid = current->group_leader->pid;
> @@ -44,12 +46,10 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
>
>  static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
>  {
> -	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> +	bo->debugfs.flags = usage_flags;
> +	panthor_gem_debugfs_bo_add(bo);
>  }
>  #else
> -static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> -				       struct panthor_gem_object *bo)
> -{}
>  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
>  static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
>  #endif
> @@ -246,7 +246,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
>  	mutex_init(&obj->label.lock);
>
> -	panthor_gem_debugfs_bo_add(ptdev, obj);
> +	INIT_LIST_HEAD(&obj->debugfs.node);

This is going to break builds with no DebugFS support.

>  	return &obj->base.base;
>  }
> @@ -285,6 +285,12 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  		bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
>  	}
>
> +	/*
> +	 * No explicit flags are needed in the call below, since the
> +	 * function internally sets the INITIALIZED bit for us.
> +	 */

If we got rid of the INITIALIZED usage flag, then this comment should also be reworded.

> +	panthor_gem_debugfs_set_usage_flags(bo, 0);
> +
>  	/*
>  	 * Allocate an id of idr table where the obj is registered
>  	 * and handle has the id what user can see.
> @@ -296,12 +302,6 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  	/* drop reference from allocate - handle holds it now. */
>  	drm_gem_object_put(&shmem->base);
>
> -	/*
> -	 * No explicit flags are needed in the call below, since the
> -	 * function internally sets the INITIALIZED bit for us.
> -	 */
> -	panthor_gem_debugfs_set_usage_flags(bo, 0);
> -
>  	return ret;
>  }
>
> @@ -387,7 +387,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
>  	unsigned int refcount = kref_read(&bo->base.base.refcount);
>  	char creator_info[32] = {};
>  	size_t resident_size;
> -	u32 gem_usage_flags = bo->debugfs.flags & (u32)~PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> +	u32 gem_usage_flags = bo->debugfs.flags;
>  	u32 gem_state_flags = 0;
>
>  	/* Skip BOs being destroyed. */
> @@ -436,8 +436,7 @@ void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
>
>  	scoped_guard(mutex, &ptdev->gems.lock) {
>  		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
> -			if (bo->debugfs.flags & PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED)
> -				panthor_gem_debugfs_bo_print(bo, m, &totals);
> +			panthor_gem_debugfs_bo_print(bo, m, &totals);
>  		}
>  	}
>
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 4dd732dcd59f..8fc7215e9b90 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -35,9 +35,6 @@ enum panthor_debugfs_gem_usage_flags {
>
>  	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED: BO is mapped on the FW VM. */
>  	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED = BIT(PANTHOR_DEBUGFS_GEM_USAGE_FW_MAPPED_BIT),
> -
> -	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED: BO is ready for DebugFS display. */
> -	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED = BIT(31),
>  };
>
>  /**
> --
> 2.49.0

There's a Panfrost port of the functionality this patch fixes pending merge into drm-misc,
so I should probably ask either Boris or Steven to hold off on merging them till I've made
sure there's no potential UAF in it.

Adrian Larumbe
