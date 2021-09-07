Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FBF402DC8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199CF6E03D;
	Tue,  7 Sep 2021 17:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3006E091;
 Tue,  7 Sep 2021 17:38:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="217115343"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="217115343"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:38:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="524295384"
Received: from tcarvalx-mobl.ger.corp.intel.com (HELO [10.252.28.225])
 ([10.252.28.225])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:38:01 -0700
Subject: Re: [PATCH v2 3/6] drm/i915 Implement LMEM backup and restore for
 suspend / resume
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210906165515.450541-1-thomas.hellstrom@linux.intel.com>
 <20210906165515.450541-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <51111df6-bf0c-ba09-4a9a-5bd59bec5fa9@intel.com>
Date: Tue, 7 Sep 2021 18:37:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210906165515.450541-4-thomas.hellstrom@linux.intel.com>
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

On 06/09/2021 17:55, Thomas Hellström wrote:
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
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

<snip>

> +
> +static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
> +			   struct drm_i915_gem_object *obj)
> +{
> +	struct i915_gem_ttm_pm_apply *pm_apply =
> +		container_of(apply, typeof(*pm_apply), base);
> +	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> +	struct ttm_buffer_object *backup_bo;
> +	struct drm_i915_private *i915 =
> +		container_of(bo->bdev, typeof(*i915), bdev);
> +	struct intel_memory_region *sys_region;
> +	struct drm_i915_gem_object *backup;
> +	struct ttm_operation_ctx ctx = {};
> +	int err = 0;
> +
> +	if (bo->resource->mem_type == I915_PL_SYSTEM || obj->ttm.backup)
> +		return 0;
> +
> +	if (pm_apply->allow_gpu && i915_gem_object_evictable(obj))
> +		return ttm_bo_validate(bo, i915_ttm_sys_placement(), &ctx);
> +
> +	if (!pm_apply->backup_pinned)
> +		return 0;
> +
> +	sys_region = i915->mm.regions[INTEL_REGION_SMEM];
> +	backup = i915_gem_object_create_region(sys_region,
> +					       obj->base.size,
> +					       0, 0);

create_shmem()?

> +	if (IS_ERR(backup))
> +		return PTR_ERR(backup);
> +
> +	err = i915_gem_object_lock(backup, apply->ww);
> +	if (err)
> +		goto out_no_lock;
> +
> +	backup_bo = i915_gem_to_ttm(backup);
> +	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
> +	if (err)
> +		goto out_no_populate;
> +
> +	err = i915_gem_obj_copy_ttm(backup, obj, pm_apply->allow_gpu, false);
> +	GEM_WARN_ON(err);
> +
> +	obj->ttm.backup = backup;
> +	return 0;
> +
> +out_no_populate:
> +	i915_gem_ww_unlock_single(backup);
> +out_no_lock:
> +	i915_gem_object_put(backup);
> +
> +	return err;
> +}
> +
> +static int i915_ttm_recover(struct i915_gem_apply_to_region *apply,
> +			    struct drm_i915_gem_object *obj)
> +{
> +	i915_ttm_backup_free(obj);
> +	return 0;
> +}
> +
> +/**
> + * i915_ttm_recover_region - Free the backup of all objects of a region
> + * @mr: The memory region
> + *
> + * Checks all objects of a region if there is backup attached and if so
> + * frees that backup. Typically this is called to recover after a partially
> + * performed backup.
> + */
> +void i915_ttm_recover_region(struct intel_memory_region *mr)
> +{
> +	static const struct i915_gem_apply_to_region_ops recover_ops = {
> +		.process_obj = i915_ttm_recover,
> +	};
> +	struct i915_gem_apply_to_region apply = {.ops = &recover_ops};
> +	int ret;
> +
> +	ret = i915_gem_process_region(mr, &apply);
> +	GEM_WARN_ON(ret);
> +}
> +
> +/**
> + * i915_ttm_backup_region - Back up all objects of a region to smem.
> + * @mr: The memory region
> + * @allow_gpu: Whether to allow the gpu blitter for this backup.
> + * @backup_pinned: Backup also pinned objects.
> + *
> + * Loops over all objects of a region and either evicts them if they are
> + * evictable or backs them up using a backup object if they are pinned.
> + *
> + * Return: Zero on success. Negative error code on error.
> + */
> +int i915_ttm_backup_region(struct intel_memory_region *mr, bool allow_gpu,
> +			   bool backup_pinned)
> +{
> +	static const struct i915_gem_apply_to_region_ops backup_ops = {
> +		.process_obj = i915_ttm_backup,
> +	};
> +	struct i915_gem_ttm_pm_apply pm_apply = {
> +		.base = {.ops = &backup_ops},
> +		.allow_gpu = allow_gpu,
> +		.backup_pinned = backup_pinned,
> +	};
> +
> +	return i915_gem_process_region(mr, &pm_apply.base);
> +}
> +
> +static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
> +			    struct drm_i915_gem_object *obj)
> +{
> +	struct i915_gem_ttm_pm_apply *pm_apply =
> +		container_of(apply, typeof(*pm_apply), base);
> +	struct drm_i915_gem_object *backup = obj->ttm.backup;
> +	struct ttm_buffer_object *backup_bo = i915_gem_to_ttm(backup);
> +	struct ttm_operation_ctx ctx = {};
> +	int err;
> +
> +	if (!obj->ttm.backup)

if (!backup)

> +		return 0;
> +
> +	if (!pm_apply->allow_gpu && (obj->flags & I915_BO_ALLOC_USER))
> +		return 0;
> +
> +	err = i915_gem_object_lock(backup, apply->ww);
> +	if (err)
> +		return err;
> +
> +	/* Content may have been swapped. */
> +	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
> +	if (!err) {
> +		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
> +					    false);
> +		GEM_WARN_ON(err);
> +
> +		obj->ttm.backup = NULL;
> +		err = 0;
> +	}
> +
> +	i915_gem_ww_unlock_single(backup);
> +	i915_gem_object_put(backup);

I assume we need to set ttm.backup = NULL somewhere here on the failure 
path, or don't drop the ref? Or at least it looks like potential uaf later?

> +
> +	return err;
> +}
> +
