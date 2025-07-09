Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB61AFEE05
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 17:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB50110E109;
	Wed,  9 Jul 2025 15:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9F9910E06E;
 Wed,  9 Jul 2025 15:48:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 682EE1516;
 Wed,  9 Jul 2025 08:48:13 -0700 (PDT)
Received: from [10.57.86.38] (unknown [10.57.86.38])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C4403F738;
 Wed,  9 Jul 2025 08:48:23 -0700 (PDT)
Message-ID: <6fe2409f-b561-4546-92e1-dd7f8d45ef12@arm.com>
Date: Wed, 9 Jul 2025 16:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix UAF in panthor_gem_create_with_handle()
 debugfs code
To: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Xe Development <intel-xe@lists.freedesktop.org>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Simona Vetter <simona.vetter@intel.com>
References: <20250707151814.603897-2-simona.vetter@ffwll.ch>
 <20250709135220.1428931-1-simona.vetter@ffwll.ch>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250709135220.1428931-1-simona.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8
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

On 09/07/2025 14:52, Simona Vetter wrote:
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
> v2: Fix build issues for !CONFIG_DEBUGFS (Adrián)
> 
> v3: Add linebreak and remove outdated comment (Liviu)
> 
> Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>

Reviewed-by: Steven Price <steven.price@arm.com>

Although a nit on the email subject - you're missing the "v3" tag ;)

Steve

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 31 +++++++++++++--------------
>  drivers/gpu/drm/panthor/panthor_gem.h |  3 ---
>  2 files changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 7c00fd77758b..a123bc740ba1 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -16,10 +16,15 @@
>  #include "panthor_mmu.h"
>  
>  #ifdef CONFIG_DEBUG_FS
> -static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> -				       struct panthor_gem_object *bo)
> +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
>  {
>  	INIT_LIST_HEAD(&bo->debugfs.node);
> +}
> +
> +static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> +{
> +	struct panthor_device *ptdev = container_of(bo->base.base.dev,
> +						    struct panthor_device, base);
>  
>  	bo->debugfs.creator.tgid = current->group_leader->pid;
>  	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
> @@ -44,14 +49,13 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
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
> +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
>  #endif
>  
>  static void panthor_gem_free_object(struct drm_gem_object *obj)
> @@ -246,7 +250,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
>  	mutex_init(&obj->label.lock);
>  
> -	panthor_gem_debugfs_bo_add(ptdev, obj);
> +	panthor_gem_debugfs_bo_init(obj);
>  
>  	return &obj->base.base;
>  }
> @@ -285,6 +289,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  		bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
>  	}
>  
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

