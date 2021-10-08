Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF55426F3C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 18:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189A66E0EA;
	Fri,  8 Oct 2021 16:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9C96E0E7;
 Fri,  8 Oct 2021 16:42:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="213492430"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="213492430"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 09:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="569089740"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 08 Oct 2021 09:42:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 08 Oct 2021 19:42:32 +0300
Date: Fri, 8 Oct 2021 19:42:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andi Shyti <andi@etezian.org>
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/gt: move remaining debugfs
 interfaces into gt
Message-ID: <YWB0+Bls9kvUUk9z@intel.com>
References: <20211008112733.3600-1-andi@etezian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008112733.3600-1-andi@etezian.org>
X-Patchwork-Hint: comment
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

On Fri, Oct 08, 2021 at 01:27:33PM +0200, Andi Shyti wrote:
> +
> +	if (IS_CHERRYVIEW(i915)) {
> +		seq_printf(m, "Master Interrupt Control:\t%08x\n",
> +			   intel_uncore_read(uncore, GEN8_MASTER_IRQ));
> +
> +		for (i = 0; i < 4; i++) {
> +			seq_printf(m, "GT Interrupt IMR %d:\t%08x\n",
> +				   i, intel_uncore_read(uncore,
> +							GEN8_GT_IMR(i)));
> +			seq_printf(m, "GT Interrupt IIR %d:\t%08x\n",
> +				   i, intel_uncore_read(uncore,
> +							GEN8_GT_IIR(i)));
> +			seq_printf(m, "GT Interrupt IER %d:\t%08x\n",
> +				   i, intel_uncore_read(uncore,
> +							GEN8_GT_IER(i)));
> +		}
> +

Why does chv get its own block? Looks identical to the bdw block.

> +	} else if (GRAPHICS_VER(i915) >= 11) {
> +		seq_printf(m, "Master Interrupt Control:  %08x\n",
> +			   intel_uncore_read(uncore, GEN11_GFX_MSTR_IRQ));
> +
> +		seq_printf(m, "Render/Copy Intr Enable:   %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_RENDER_COPY_INTR_ENABLE));
> +		seq_printf(m, "VCS/VECS Intr Enable:      %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_VCS_VECS_INTR_ENABLE));
> +		seq_printf(m, "GUC/SG Intr Enable:\t   %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_GUC_SG_INTR_ENABLE));
> +		seq_printf(m, "GPM/WGBOXPERF Intr Enable: %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_GPM_WGBOXPERF_INTR_ENABLE));
> +		seq_printf(m, "Crypto Intr Enable:\t   %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_CRYPTO_RSVD_INTR_ENABLE));
> +		seq_printf(m, "GUnit/CSME Intr Enable:\t   %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_GUNIT_CSME_INTR_ENABLE));
> +
> +	} else if (GRAPHICS_VER(i915) >= 8) {
> +		seq_printf(m, "Master Interrupt Control:\t%08x\n",
> +			   intel_uncore_read(uncore, GEN8_MASTER_IRQ));
> +
> +		for (i = 0; i < 4; i++) {
> +			seq_printf(m, "GT Interrupt IMR %d:\t%08x\n",
> +				   i, intel_uncore_read(uncore,
> +							GEN8_GT_IMR(i)));
> +			seq_printf(m, "GT Interrupt IIR %d:\t%08x\n",
> +				   i, intel_uncore_read(uncore,
> +							GEN8_GT_IIR(i)));
> +			seq_printf(m, "GT Interrupt IER %d:\t%08x\n",
> +				   i, intel_uncore_read(uncore,
> +							GEN8_GT_IER(i)));
> +		}
> +
> +	} else if (IS_VALLEYVIEW(i915)) {
> +		seq_printf(m, "Master IER:\t%08x\n",
> +			   intel_uncore_read(uncore, VLV_MASTER_IER));
> +
> +		seq_printf(m, "Render IER:\t%08x\n",
> +			   intel_uncore_read(uncore, GTIER));
> +		seq_printf(m, "Render IIR:\t%08x\n",
> +			   intel_uncore_read(uncore, GTIIR));
> +		seq_printf(m, "Render IMR:\t%08x\n",
> +			   intel_uncore_read(uncore, GTIMR));
> +
> +		seq_printf(m, "PM IER:\t\t%08x\n",
> +			   intel_uncore_read(uncore, GEN6_PMIER));
> +		seq_printf(m, "PM IIR:\t\t%08x\n",
> +			   intel_uncore_read(uncore, GEN6_PMIIR));
> +		seq_printf(m, "PM IMR:\t\t%08x\n",
> +			   intel_uncore_read(uncore, GEN6_PMIMR));
> +
> +	} else if (!HAS_PCH_SPLIT(i915)) {

HAS_PCH_SPLIT in gt code looks a bit out of place.

> +		seq_printf(m, "Interrupt enable:    %08x\n",
> +			   intel_uncore_read(uncore, GEN2_IER));
> +		seq_printf(m, "Interrupt identity:  %08x\n",
> +			   intel_uncore_read(uncore, GEN2_IIR));
> +		seq_printf(m, "Interrupt mask:      %08x\n",
> +			   intel_uncore_read(uncore, GEN2_IMR));

Technically on gen2 these are 16 bits, on gen3+ 32 bits. I don't
quite remember now what happens when you read them as 32bit on gen2.
Might be the msbs just come out all zeroes.

> +	} else {
> +		seq_printf(m, "Graphics Interrupt enable:		%08x\n",
> +			   intel_uncore_read(uncore, GTIER));
> +		seq_printf(m, "Graphics Interrupt identity:		%08x\n",
> +			   intel_uncore_read(uncore, GTIIR));
> +		seq_printf(m, "Graphics Interrupt mask:		%08x\n",
> +			   intel_uncore_read(uncore, GTIMR));

Probably this should be before the previous block to keep things in
order. Also missing GEN6_PM stuff for snb+, and the master interrupt
stuff for ilk+.

> +	}
> +
> +	if (GRAPHICS_VER(i915) >= 11) {
> +		seq_printf(m, "RCS Intr Mask:\t %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_RCS0_RSVD_INTR_MASK));
> +		seq_printf(m, "BCS Intr Mask:\t %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_BCS_RSVD_INTR_MASK));
> +		seq_printf(m, "VCS0/VCS1 Intr Mask:\t %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_VCS0_VCS1_INTR_MASK));
> +		seq_printf(m, "VCS2/VCS3 Intr Mask:\t %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_VCS2_VCS3_INTR_MASK));
> +
> +		if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
> +			seq_printf(m, "VCS4/VCS5 Intr Mask:\t %08x\n",
> +				   intel_uncore_read(uncore,
> +						GEN12_VCS4_VCS5_INTR_MASK));
> +		if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
> +			seq_printf(m, "VCS6/VCS7 Intr Mask:\t %08x\n",
> +				   intel_uncore_read(uncore,
> +						GEN12_VCS6_VCS7_INTR_MASK));
> +
> +		seq_printf(m, "VECS0/VECS1 Intr Mask:\t %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_VECS0_VECS1_INTR_MASK));
> +
> +		if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
> +			seq_printf(m, "VECS2/VECS3 Intr Mask:\t %08x\n",
> +				   intel_uncore_read(uncore,
> +						GEN12_VECS2_VECS3_INTR_MASK));
> +
> +		seq_printf(m, "GUC/SG Intr Mask:\t %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_GUC_SG_INTR_MASK));
> +		seq_printf(m, "GPM/WGBOXPERF Intr Mask: %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_GPM_WGBOXPERF_INTR_MASK));
> +		seq_printf(m, "Crypto Intr Mask:\t %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_CRYPTO_RSVD_INTR_MASK));
> +		seq_printf(m, "Gunit/CSME Intr Mask:\t %08x\n",
> +			   intel_uncore_read(uncore,
> +					     GEN11_GUNIT_CSME_INTR_MASK));
> +
> +	} else if (GRAPHICS_VER(i915) >= 6) {
> +		for_each_engine(engine, gt, id) {
> +			seq_printf(m,
> +				   "Graphics Interrupt mask (%s):	%08x\n",
> +				   engine->name, ENGINE_READ(engine, RING_IMR));
> +		}
> +	}
> +
> +	intel_runtime_pm_put(uncore->rpm, wakeref);
> +
> +	return 0;
> +}
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(interrupt_info);
> +
> +void intel_gt_irq_debugfs_register(struct intel_gt *gt, struct dentry *root)
> +{
> +	static const struct intel_gt_debugfs_file files[] = {
> +		{ "interrupt_info", &interrupt_info_fops, NULL },
> +	};
> +
> +	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.h
> new file mode 100644
> index 000000000000..95e519705001
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2020 Intel Corporation
> + */
> +
> +#ifndef INTEL_GT_IRQ_DEBUGFS_H
> +#define INTEL_GT_IRQ_DEBUGFS_H
> +
> +struct intel_gt;
> +struct dentry;
> +
> +void intel_gt_irq_debugfs_register(struct intel_gt *gt, struct dentry *root);
> +
> +#endif /* INTEL_GT_IRQ_DEBUGFS_H */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 5f84ad602642..712c91d588eb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -19,6 +19,46 @@
>  #include "intel_sideband.h"
>  #include "intel_uncore.h"
>  
> +int __forcewake_user_open(struct intel_gt *gt)
> +{
> +	atomic_inc(&gt->user_wakeref);
> +	intel_gt_pm_get(gt);
> +	if (GRAPHICS_VER(gt->i915) >= 6)
> +		intel_uncore_forcewake_user_get(gt->uncore);
> +
> +	return 0;
> +}
> +
> +int __forcewake_user_release(struct intel_gt *gt)
> +{
> +	if (GRAPHICS_VER(gt->i915) >= 6)
> +		intel_uncore_forcewake_user_put(gt->uncore);
> +	intel_gt_pm_put(gt);
> +	atomic_dec(&gt->user_wakeref);
> +
> +	return 0;
> +}
> +
> +static int forcewake_user_open(struct inode *inode, struct file *file)
> +{
> +	struct intel_gt *gt = inode->i_private;
> +
> +	return __forcewake_user_open(gt);
> +}
> +
> +static int forcewake_user_release(struct inode *inode, struct file *file)
> +{
> +	struct intel_gt *gt = inode->i_private;
> +
> +	return __forcewake_user_release(gt);
> +}
> +
> +static const struct file_operations forcewake_user_fops = {
> +	.owner = THIS_MODULE,
> +	.open = forcewake_user_open,
> +	.release = forcewake_user_release,
> +};
> +
>  static int fw_domains_show(struct seq_file *m, void *data)
>  {
>  	struct intel_gt *gt = m->private;
> @@ -627,6 +667,7 @@ void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root)
>  		{ "drpc", &drpc_fops, NULL },
>  		{ "frequency", &frequency_fops, NULL },
>  		{ "forcewake", &fw_domains_fops, NULL },
> +		{ "forcewake_user", &forcewake_user_fops, NULL},
>  		{ "llc", &llc_fops, llc_eval },
>  		{ "rps_boost", &rps_boost_fops, rps_eval },
>  	};
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
> index 2b824289582b..fe306412b996 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
> @@ -13,4 +13,8 @@ struct drm_printer;
>  void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root);
>  void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *m);
>  
> +/* functions that need to be accessed by the upper level non-gt interfaces */
> +int __forcewake_user_open(struct intel_gt *gt);
> +int __forcewake_user_release(struct intel_gt *gt);
> +
>  #endif /* INTEL_GT_PM_DEBUGFS_H */
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index fdbd46ff59e0..fd7f5bd5f304 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -35,6 +35,7 @@
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_buffer_pool.h"
>  #include "gt/intel_gt_clock_utils.h"
> +#include "gt/intel_gt_debugfs.h"
>  #include "gt/intel_gt_pm.h"
>  #include "gt/intel_gt_pm_debugfs.h"
>  #include "gt/intel_gt_requests.h"
> @@ -554,36 +555,18 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
>  	return 0;
>  }
>  
> -static int
> -i915_wedged_get(void *data, u64 *val)
> +static int i915_wedged_get(void *data, u64 *val)
>  {
>  	struct drm_i915_private *i915 = data;
> -	int ret = intel_gt_terminally_wedged(&i915->gt);
>  
> -	switch (ret) {
> -	case -EIO:
> -		*val = 1;
> -		return 0;
> -	case 0:
> -		*val = 0;
> -		return 0;
> -	default:
> -		return ret;
> -	}
> +	return reset_show(&i915->gt, val);
>  }
>  
> -static int
> -i915_wedged_set(void *data, u64 val)
> +static int i915_wedged_set(void *data, u64 val)
>  {
>  	struct drm_i915_private *i915 = data;
>  
> -	/* Flush any previous reset before applying for a new one */
> -	wait_event(i915->gt.reset.queue,
> -		   !test_bit(I915_RESET_BACKOFF, &i915->gt.reset.flags));
> -
> -	intel_gt_handle_error(&i915->gt, val, I915_ERROR_CAPTURE,
> -			      "Manually set wedged engine mask = %llx", val);
> -	return 0;
> +	return reset_store(&i915->gt, val);
>  }
>  
>  DEFINE_SIMPLE_ATTRIBUTE(i915_wedged_fops,
> @@ -728,27 +711,15 @@ static int i915_sseu_status(struct seq_file *m, void *unused)
>  static int i915_forcewake_open(struct inode *inode, struct file *file)
>  {
>  	struct drm_i915_private *i915 = inode->i_private;
> -	struct intel_gt *gt = &i915->gt;
> -
> -	atomic_inc(&gt->user_wakeref);
> -	intel_gt_pm_get(gt);
> -	if (GRAPHICS_VER(i915) >= 6)
> -		intel_uncore_forcewake_user_get(gt->uncore);
>  
> -	return 0;
> +	return __forcewake_user_open(&i915->gt);
>  }
>  
>  static int i915_forcewake_release(struct inode *inode, struct file *file)
>  {
>  	struct drm_i915_private *i915 = inode->i_private;
> -	struct intel_gt *gt = &i915->gt;
>  
> -	if (GRAPHICS_VER(i915) >= 6)
> -		intel_uncore_forcewake_user_put(&i915->uncore);
> -	intel_gt_pm_put(gt);
> -	atomic_dec(&gt->user_wakeref);
> -
> -	return 0;
> +	return __forcewake_user_release(&i915->gt);
>  }
>  
>  static const struct file_operations i915_forcewake_fops = {
> -- 
> 2.27.0

-- 
Ville Syrjälä
Intel
