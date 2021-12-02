Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2694664CF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 14:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137316FBFA;
	Thu,  2 Dec 2021 13:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6D26FBFA;
 Thu,  2 Dec 2021 13:56:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="236651033"
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="236651033"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 05:56:54 -0800
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="500751556"
Received: from dev.igk.intel.com (HELO localhost) ([10.102.12.162])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 05:56:52 -0800
From: Maciej Patelczyk <maciej.patelczyk@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/debugfs: Do not return '0' if there is nothing
 to return
In-Reply-To: <20211127011715.274205-1-andi.shyti@linux.intel.com>
References: <20211127011715.274205-1-andi.shyti@linux.intel.com>
Date: Thu, 02 Dec 2021 14:53:59 +0100
Message-ID: <87bl1z15ag.fsf@dev.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi@etezian.org>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andi Shyti <andi.shyti@linux.intel.com> writes:

> Change functions that always return '0' to be void type.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    |  7 ++++---
>  drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 16 ++++++++--------
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h |  4 ++--
>  drivers/gpu/drm/i915/i915_debugfs.c           | 12 +++++++++---
>  5 files changed, 24 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> index f103664b71d4..53b90b4f73d7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> @@ -29,7 +29,7 @@ int intel_gt_debugfs_reset_show(struct intel_gt *gt, u64 *val)
>  	}
>  }
>  
> -int intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val)
> +void intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val)
>  {
>  	/* Flush any previous reset before applying for a new one */
>  	wait_event(gt->reset.queue,
> @@ -37,7 +37,6 @@ int intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val)
>  
>  	intel_gt_handle_error(gt, val, I915_ERROR_CAPTURE,
>  			      "Manually reset engine mask to %llx", val);
> -	return 0;
>  }
>  
>  /*
> @@ -51,7 +50,9 @@ static int __intel_gt_debugfs_reset_show(void *data, u64 *val)
>  
>  static int __intel_gt_debugfs_reset_store(void *data, u64 val)
>  {
> -	return intel_gt_debugfs_reset_store(data, val);
> +	intel_gt_debugfs_reset_store(data, val);
> +
> +	return 0;
>  }
>  
>  DEFINE_SIMPLE_ATTRIBUTE(reset_fops, __intel_gt_debugfs_reset_show,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> index e307ceb99031..a4baf8e7f068 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> @@ -37,6 +37,6 @@ void intel_gt_debugfs_register_files(struct dentry *root,
>  
>  /* functions that need to be accessed by the upper level non-gt interfaces */
>  int intel_gt_debugfs_reset_show(struct intel_gt *gt, u64 *val);
> -int intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val);
> +void intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val);
>  
>  #endif /* INTEL_GT_DEBUGFS_H */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 404dfa7673c6..7a30157aa9d3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -20,38 +20,38 @@
>  #include "intel_uncore.h"
>  #include "vlv_sideband.h"
>  
> -int intel_gt_pm_debugfs_forcewake_user_open(struct intel_gt *gt)
> +void intel_gt_pm_debugfs_forcewake_user_open(struct intel_gt *gt)
>  {
>  	atomic_inc(&gt->user_wakeref);
>  	intel_gt_pm_get(gt);
>  	if (GRAPHICS_VER(gt->i915) >= 6)
>  		intel_uncore_forcewake_user_get(gt->uncore);
> -
> -	return 0;
>  }
>  
> -int intel_gt_pm_debugfs_forcewake_user_release(struct intel_gt *gt)
> +void intel_gt_pm_debugfs_forcewake_user_release(struct intel_gt *gt)
>  {
>  	if (GRAPHICS_VER(gt->i915) >= 6)
>  		intel_uncore_forcewake_user_put(gt->uncore);
>  	intel_gt_pm_put(gt);
>  	atomic_dec(&gt->user_wakeref);
> -
> -	return 0;
>  }
>  
>  static int forcewake_user_open(struct inode *inode, struct file *file)
>  {
>  	struct intel_gt *gt = inode->i_private;
>  
> -	return intel_gt_pm_debugfs_forcewake_user_open(gt);
> +	intel_gt_pm_debugfs_forcewake_user_open(gt);
> +
> +	return 0;
>  }
>  
>  static int forcewake_user_release(struct inode *inode, struct file *file)
>  {
>  	struct intel_gt *gt = inode->i_private;
>  
> -	return intel_gt_pm_debugfs_forcewake_user_release(gt);
> +	intel_gt_pm_debugfs_forcewake_user_release(gt);
> +
> +	return 0;
>  }
>  
>  static const struct file_operations forcewake_user_fops = {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
> index a8457887ec65..0ace8c2da0ac 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
> @@ -14,7 +14,7 @@ void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root);
>  void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *m);
>  
>  /* functions that need to be accessed by the upper level non-gt interfaces */
> -int intel_gt_pm_debugfs_forcewake_user_open(struct intel_gt *gt);
> -int intel_gt_pm_debugfs_forcewake_user_release(struct intel_gt *gt);
> +void intel_gt_pm_debugfs_forcewake_user_open(struct intel_gt *gt);
> +void intel_gt_pm_debugfs_forcewake_user_release(struct intel_gt *gt);
>  
>  #endif /* INTEL_GT_PM_DEBUGFS_H */
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index fe638b5da7c0..88ef63f05ead 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -565,7 +565,9 @@ static int i915_wedged_set(void *data, u64 val)
>  {
>  	struct drm_i915_private *i915 = data;
>  
> -	return intel_gt_debugfs_reset_store(&i915->gt, val);
> +	intel_gt_debugfs_reset_store(&i915->gt, val);
> +
> +	return 0;
>  }
>  
>  DEFINE_SIMPLE_ATTRIBUTE(i915_wedged_fops,
> @@ -711,14 +713,18 @@ static int i915_forcewake_open(struct inode *inode, struct file *file)
>  {
>  	struct drm_i915_private *i915 = inode->i_private;
>  
> -	return intel_gt_pm_debugfs_forcewake_user_open(&i915->gt);
> +	intel_gt_pm_debugfs_forcewake_user_open(&i915->gt);
> +
> +	return 0;
>  }
>  
>  static int i915_forcewake_release(struct inode *inode, struct file *file)
>  {
>  	struct drm_i915_private *i915 = inode->i_private;
>  
> -	return intel_gt_pm_debugfs_forcewake_user_release(&i915->gt);
> +	intel_gt_pm_debugfs_forcewake_user_release(&i915->gt);
> +
> +	return 0;
>  }
>  
>  static const struct file_operations i915_forcewake_fops = {
> -- 
> 2.34.0

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
