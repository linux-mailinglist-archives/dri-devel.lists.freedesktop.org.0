Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BEE411321
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 12:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CD26E4A2;
	Mon, 20 Sep 2021 10:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0586E49F;
 Mon, 20 Sep 2021 10:49:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="284116966"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="284116966"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 03:49:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="473553734"
Received: from yohlee-mobl1.gar.corp.intel.com (HELO [10.214.151.93])
 ([10.214.151.93])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 03:49:48 -0700
Subject: Re: [PATCH v3 3/6] drm/i915 Implement LMEM backup and restore for
 suspend / resume
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210914193112.497379-1-thomas.hellstrom@linux.intel.com>
 <20210914193112.497379-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <01a1827d-ab6f-bd88-7291-dd68676c0eae@intel.com>
Date: Mon, 20 Sep 2021 11:49:40 +0100
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

<snip>

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
> +	if (!backup)
> +		return 0;
> +
> +	if (!pm_apply->allow_gpu && (obj->flags & I915_BO_ALLOC_USER))
> +		return 0;

Hmm, do we ever hit this? I would presume anything that userspace 
directly allocated in lmem can be kicked out with ttm_bo_validate(sys) 
i.e backup == NULL?

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
> +
> +	if (!err)
> +		i915_gem_object_put(backup);
> +
> +	return err;
> +}
> +
