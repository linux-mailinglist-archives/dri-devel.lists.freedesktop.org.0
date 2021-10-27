Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F343C36E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 09:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC5A6E52E;
	Wed, 27 Oct 2021 07:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC526E52E;
 Wed, 27 Oct 2021 07:01:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="316294448"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="316294448"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 00:01:33 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="494688516"
Received: from dzhang-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.142.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 00:01:33 -0700
Date: Wed, 27 Oct 2021 00:01:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: Re: [Intel-gfx] [PATCH 05/11] drm/i915: Prepare for multiple gts
Message-ID: <20211027070130.7foo6sssimylxjk3@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211008215635.2026385-6-matthew.d.roper@intel.com>
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

On Fri, Oct 08, 2021 at 02:56:29PM -0700, Matt Roper wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>Add some basic plumbing to support more than one dynamically allocated
>struct intel_gt.  Up to four gts are supported in i915->gts[], with slot
>zero shadowing the existing i915->gt to enable source compatibility with
>legacy driver paths.  A for_each_gt macro is added to iterate over the
>GTs and will be used by upcoming patches that convert various parts of
>the driver to be multi-gt aware.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_gt.c         | 74 ++++++++++++++++++++--
> drivers/gpu/drm/i915/gt/intel_gt.h         |  8 ++-
> drivers/gpu/drm/i915/gt/intel_gt_types.h   |  2 +
> drivers/gpu/drm/i915/i915_drv.c            |  2 +-
> drivers/gpu/drm/i915/i915_drv.h            |  6 ++
> drivers/gpu/drm/i915/intel_memory_region.h |  3 +
> 6 files changed, 86 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>index 863039d56cba..736725411f51 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt.c
>+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>@@ -23,10 +23,13 @@
> #include "shmem_utils.h"
> #include "pxp/intel_pxp.h"
>
>-void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
>+static void
>+__intel_gt_init_early(struct intel_gt *gt,
>+		      struct intel_uncore *uncore,
>+		      struct drm_i915_private *i915)
> {
> 	gt->i915 = i915;
>-	gt->uncore = &i915->uncore;
>+	gt->uncore = uncore;
>
> 	spin_lock_init(&gt->irq_lock);
>
>@@ -46,13 +49,18 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
> 	intel_rps_init_early(&gt->rps);
> }
>
>-int intel_gt_probe_lmem(struct intel_gt *gt)
>+static int intel_gt_probe_lmem(struct intel_gt *gt)
> {
> 	struct drm_i915_private *i915 = gt->i915;
>+	unsigned int instance = gt->info.id;
> 	struct intel_memory_region *mem;
> 	int id;
> 	int err;
>
>+	id = INTEL_REGION_LMEM + instance;
>+	if (drm_WARN_ON(&i915->drm, id >= INTEL_REGION_STOLEN_SMEM))
>+		return -ENODEV;
>+
> 	mem = intel_gt_setup_lmem(gt);
> 	if (mem == ERR_PTR(-ENODEV))
> 		mem = intel_gt_setup_fake_lmem(gt);
>@@ -67,9 +75,8 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
> 		return err;
> 	}
>
>-	id = INTEL_REGION_LMEM;
>-
> 	mem->id = id;
>+	mem->instance = instance;
>
> 	intel_memory_region_set_name(mem, "local%u", mem->instance);
>
>@@ -80,6 +87,11 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
> 	return 0;
> }
>
>+void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
>+{
>+	__intel_gt_init_early(gt, &i915->uncore, i915);
>+}
>+
> void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt)
> {
> 	gt->ggtt = ggtt;
>@@ -903,9 +915,29 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
> static int
> tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
> {
>+	struct drm_i915_private *i915 = gt->i915;
>+	struct intel_uncore *uncore;
>+	struct intel_uncore_mmio_debug *mmio_debug;
> 	int ret;
>
>-	intel_uncore_init_early(gt->uncore, gt);
>+	if (id) {
>+		uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
>+		if (!uncore)
>+			return -ENOMEM;
>+
>+		mmio_debug = kzalloc(sizeof(*mmio_debug), GFP_KERNEL);
>+		if (!mmio_debug) {
>+			kfree(uncore);
>+			return -ENOMEM;
>+		}
>+
>+		__intel_gt_init_early(gt, uncore, i915);
>+	} else {
>+		uncore = &i915->uncore;
>+		mmio_debug = &i915->mmio_debug;
>+	}
>+
>+	intel_uncore_init_early(uncore, gt);
>
> 	ret = intel_uncore_setup_mmio(gt->uncore, phys_addr);
> 	if (ret)
>@@ -919,6 +951,11 @@ tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
> static void tile_cleanup(struct intel_gt *gt)
> {
> 	intel_uncore_cleanup_mmio(gt->uncore);
>+
>+	if (gt->info.id) {
>+		kfree(gt->uncore);
>+		kfree(gt);
>+	}
> }
>
> int intel_probe_gts(struct drm_i915_private *i915)
>@@ -936,13 +973,36 @@ int intel_probe_gts(struct drm_i915_private *i915)
> 	if (ret)
> 		return ret;
>
>+	i915->gts[0] = &i915->gt;
>+
> 	/* TODO: add more tiles */
> 	return 0;
> }
>
>+int intel_gt_tiles_init(struct drm_i915_private *i915)
>+{
>+	struct intel_gt *gt;
>+	unsigned int id;
>+	int ret;
>+
>+	for_each_gt(i915, id, gt) {
>+		ret = intel_gt_probe_lmem(gt);
>+		if (ret)
>+			return ret;
>+	}
>+
>+	return 0;

same thing as with previous patches that makes me confused. gt == tile,
why do we have such a function in intel_gt.c - intel_gt_tiles_init()
that receive the device struct? IMO this belongs to i915_drv.c

>+}
>+
> void intel_gts_release(struct drm_i915_private *i915)
> {
>-	tile_cleanup(&i915->gt);
>+	struct intel_gt *gt;
>+	unsigned int id;
>+
>+	for_each_gt(i915, id, gt) {
>+		tile_cleanup(gt);
>+		i915->gts[id] = NULL;

ditto

Lucas De Marchi
