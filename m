Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750D140F70B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B396EC30;
	Fri, 17 Sep 2021 12:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F5C6EC2A;
 Fri, 17 Sep 2021 12:04:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="245178666"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="245178666"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 05:04:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="651863847"
Received: from alandaly-mobl.ger.corp.intel.com (HELO [10.252.5.237])
 ([10.252.5.237])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 05:03:59 -0700
Subject: Re: [PATCH v3 3/6] drm/i915 Implement LMEM backup and restore for
 suspend / resume
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210914193112.497379-1-thomas.hellstrom@linux.intel.com>
 <20210914193112.497379-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <b717eec5-7fe4-88d4-8345-e28679ab45f5@intel.com>
Date: Fri, 17 Sep 2021 13:03:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210914193112.497379-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 14/09/2021 20:31, Thomas Hellström wrote:
> Just evict unpinned objects to system. For pinned LMEM objects,
> make a backup system object and blit the contents to that.
> 
> Backup is performed in three steps,
> 1: Opportunistically evict evictable objects using the gpu blitter.
> 2: After gt idle, evict evictable objects using the gpu blitter. This will
> be modified in an upcoming patch to backup pinned objects that are not used
> by the blitter itself.
> 3: Backup remaining pinned objects using memcpy.
> 
> Also move uC suspend to after 2) to make sure we have a functional GuC
> during 2) if using GuC submission.
> 
> v2:
> - Major refactor to make sure gem_exec_suspend@hang-SX subtests work, and
>    suspend / resume works with a slightly modified GuC submission enabling
>    patch series.
> 
> v3:
> - Fix a potential use-after-free (Matthew Auld)
> - Use i915_gem_object_create_shmem() instead of
>    i915_gem_object_create_region (Matthew Auld)
> - Minor simplifications (Matthew Auld)
> - Fix up kerneldoc for i195_ttm_restore_region().
> - Final lmem_suspend() call moved to i915_gem_backup_suspend from
>    i915_gem_suspend_late, since the latter gets called at driver unload
>    and we don't unnecessarily want to run it at that time.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |   1 +
>   drivers/gpu/drm/i915/gem/i915_gem_pm.c        |  92 +++++++-
>   drivers/gpu/drm/i915/gem/i915_gem_pm.h        |   3 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  29 ++-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  10 +
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    | 203 ++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h    |  24 +++
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   4 +-
>   drivers/gpu/drm/i915/i915_drv.c               |  10 +-
>   drivers/gpu/drm/i915/i915_drv.h               |   2 +-
>   11 files changed, 362 insertions(+), 17 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 9d371be7dc5c..f9b69492a56c 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -154,6 +154,7 @@ gem-y += \
>   	gem/i915_gem_throttle.o \
>   	gem/i915_gem_tiling.o \
>   	gem/i915_gem_ttm.o \
> +	gem/i915_gem_ttm_pm.o \
>   	gem/i915_gem_userptr.o \
>   	gem/i915_gem_wait.o \
>   	gem/i915_gemfs.o
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 2471f36aaff3..734cc8e16481 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -534,6 +534,7 @@ struct drm_i915_gem_object {
>   	struct {
>   		struct sg_table *cached_io_st;
>   		struct i915_gem_object_page_iter get_io_page;
> +		struct drm_i915_gem_object *backup;
>   		bool created:1;
>   	} ttm;
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> index 8b9d7d14c4bd..8736ae1dfbb2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include "gem/i915_gem_pm.h"
> +#include "gem/i915_gem_ttm_pm.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_pm.h"
>   #include "gt/intel_gt_requests.h"
> @@ -39,7 +40,86 @@ void i915_gem_suspend(struct drm_i915_private *i915)
>   	i915_gem_drain_freed_objects(i915);
>   }
>   
> -void i915_gem_suspend_late(struct drm_i915_private *i915)
> +static int lmem_restore(struct drm_i915_private *i915, bool allow_gpu)
> +{
> +	struct intel_memory_region *mr;
> +	int ret = 0, id;
> +
> +	for_each_memory_region(mr, i915, id) {
> +		if (mr->type == INTEL_MEMORY_LOCAL) {
> +			ret = i915_ttm_restore_region(mr, allow_gpu);
> +			if (ret)
> +				break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int lmem_suspend(struct drm_i915_private *i915, bool allow_gpu,
> +			bool backup_pinned)
> +{
> +	struct intel_memory_region *mr;
> +	int ret = 0, id;
> +
> +	for_each_memory_region(mr, i915, id) {
> +		if (mr->type == INTEL_MEMORY_LOCAL) {
> +			ret = i915_ttm_backup_region(mr, allow_gpu, backup_pinned);
> +			if (ret)
> +				break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static void lmem_recover(struct drm_i915_private *i915)
> +{
> +	struct intel_memory_region *mr;
> +	int id;
> +
> +	for_each_memory_region(mr, i915, id)
> +		if (mr->type == INTEL_MEMORY_LOCAL)
> +			i915_ttm_recover_region(mr);
> +}
> +
> +int i915_gem_backup_suspend(struct drm_i915_private *i915)
> +{
> +	int ret;
> +
> +	/* Opportunistically try to evict unpinned objects */
> +	ret = lmem_suspend(i915, true, false);
> +	if (ret)
> +		goto out_recover;
> +
> +	i915_gem_suspend(i915);
> +
> +	/*
> +	 * More objects may have become unpinned as requests were
> +	 * retired. Now try to evict again. The gt may be wedged here
> +	 * in which case we automatically fall back to memcpy.
> +	 */
> +	ret = lmem_suspend(i915, true, false);
> +	if (ret)
> +		goto out_recover;
> +
> +	/*
> +	 * Remaining objects are backed up using memcpy once we've stopped
> +	 * using the migrate context.
> +	 */
> +	ret = lmem_suspend(i915, false, true);
> +	if (ret)
> +		goto out_recover;
> +
> +	return 0;
> +
> +out_recover:
> +	lmem_recover(i915);
> +
> +	return ret;
> +}
> +
> +int i915_gem_suspend_late(struct drm_i915_private *i915)
>   {
>   	struct drm_i915_gem_object *obj;
>   	struct list_head *phases[] = {
> @@ -83,6 +163,8 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
>   	spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
>   	if (flush)
>   		wbinvd_on_all_cpus();
> +
> +	return 0;


We can drop this change now?

I guess only slight concern is all the GEM_WARN_ON() instead of proper 
error handling in some places, but hopefully these should never be hit 
in practice,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
