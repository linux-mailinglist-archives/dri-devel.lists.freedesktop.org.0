Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4865ABB3C
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 01:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543B510E94E;
	Fri,  2 Sep 2022 23:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A017510E943;
 Fri,  2 Sep 2022 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662161594; x=1693697594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uY+fJvshZNiD1fF0ohfl8G2A+0ye096XnRaY3AHjlgM=;
 b=SSfqaZjNGXIlfAWHz3pUEyDYoP1e/ODNAe9km5GZgVCRAJPe/3A61+zY
 F2lMM5ao39ypCp3aCKNi0hS3ZaNUykRhH/pjqtf00pTMChnkuSz4PzDpB
 fZeMn00UG7sRHkS0QoP/43jEoqWGu5bRkmd/Awc92yxcOhI6ui2Weggs8
 qtXsWzJorNSgtjFfUByEwRKr0Q/BOfbnufkhkDUz605we5HSNstRhniRy
 /183Yi9KcyPI7s0pmHq15HvhudDBT7omUkBm9kb7pHq9yc3EX4yK3+um2
 KVlpKCB2fjFmwk91lZ8JwL9l4pMMKkGeTf1NXt0lHU8ytONwVST3A2Itr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="279123431"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="279123431"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:13 -0700
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="941464216"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 12/12] drm/i915/mtl: Hook up interrupts for standalone media
Date: Fri,  2 Sep 2022 16:32:57 -0700
Message-Id: <20220902233257.3088492-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902233257.3088492-1-matthew.d.roper@intel.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Top-level handling of standalone media interrupts will be processed as
part of the primary GT's interrupt handler (since primary and media GTs
share an MMIO space, unlike remote tile setups).  When we get down to
the point of handling engine interrupts, we need to take care to lookup
VCS and VECS engines in the media GT rather than the primary.

There are also a couple of additional "other" instance bits that
correspond to the media GT's GuC and media GT's power management
interrupts; we need to direct those to the media GT instance as well.

Bspec: 45605
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c   | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 ++
 drivers/gpu/drm/i915/gt/intel_sa_media.c |  7 +++++++
 drivers/gpu/drm/i915/i915_drv.h          |  3 +++
 4 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 0dfd0c42d00d..f26882fdc24c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -59,11 +59,17 @@ static void
 gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
 			const u16 iir)
 {
+	struct intel_gt *media_gt = gt->i915->media_gt;
+
 	if (instance == OTHER_GUC_INSTANCE)
 		return guc_irq_handler(&gt->uc.guc, iir);
+	if (instance == OTHER_MEDIA_GUC_INSTANCE && media_gt)
+		return guc_irq_handler(&media_gt->uc.guc, iir);
 
 	if (instance == OTHER_GTPM_INSTANCE)
 		return gen11_rps_irq_handler(&gt->rps, iir);
+	if (instance == OTHER_MEDIA_GTPM_INSTANCE && media_gt)
+		return gen11_rps_irq_handler(&media_gt->rps, iir);
 
 	if (instance == OTHER_KCR_INSTANCE)
 		return intel_pxp_irq_handler(&gt->pxp, iir);
@@ -81,6 +87,18 @@ gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
 {
 	struct intel_engine_cs *engine;
 
+	/*
+	 * Platforms with standalone media have their media engines in another
+	 * GT.
+	 */
+	if (MEDIA_VER(gt->i915) >= 13 &&
+	    (class == VIDEO_DECODE_CLASS || class == VIDEO_ENHANCEMENT_CLASS)) {
+		if (!gt->i915->media_gt)
+			goto err;
+
+		gt = gt->i915->media_gt;
+	}
+
 	if (instance <= MAX_ENGINE_INSTANCE)
 		engine = gt->engine_class[class][instance];
 	else
@@ -89,6 +107,7 @@ gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
 	if (likely(engine))
 		return intel_engine_cs_irq(engine, iir);
 
+err:
 	WARN_ONCE(1, "unhandled engine interrupt class=0x%x, instance=0x%x\n",
 		  class, instance);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index fb2c56777480..2275ee47da95 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1554,6 +1554,8 @@
 #define   OTHER_GTPM_INSTANCE			1
 #define   OTHER_KCR_INSTANCE			4
 #define   OTHER_GSC_INSTANCE			6
+#define   OTHER_MEDIA_GUC_INSTANCE		16
+#define   OTHER_MEDIA_GTPM_INSTANCE		17
 
 #define GEN11_IIR_REG_SELECTOR(x)		_MMIO(0x190070 + ((x) * 4))
 
diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
index 5516e9c363a4..e8f3d18c12b8 100644
--- a/drivers/gpu/drm/i915/gt/intel_sa_media.c
+++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
@@ -36,5 +36,12 @@ int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
 	gt->uncore = uncore;
 	gt->phys_addr = phys_addr;
 
+	/*
+	 * For current platforms we can assume there's only a single
+	 * media GT and cache it for quick lookup.
+	 */
+	drm_WARN_ON(&i915->drm, i915->media_gt);
+	i915->media_gt = gt;
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index d4b45c7e931d..5a21242a6706 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -365,6 +365,9 @@ struct drm_i915_private {
 
 	struct kobject *sysfs_gt;
 
+	/* Quick lookup of media GT (current platforms only have one) */
+	struct intel_gt *media_gt;
+
 	struct {
 		struct i915_gem_contexts {
 			spinlock_t lock; /* locks list */
-- 
2.37.2

