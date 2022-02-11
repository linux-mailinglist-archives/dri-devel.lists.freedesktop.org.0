Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A308C4B1DF9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 06:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCF489165;
	Fri, 11 Feb 2022 05:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D7810E9E5;
 Fri, 11 Feb 2022 05:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644558534; x=1676094534;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mnp4+fdeIdsEA6E7aB8TBAXHKRWg9If7Edz7k7ia4sY=;
 b=Iyh7Mmyuemis1zA6koHRJHqMG24UGZbsAO4LLJihrz/lWlZIQsvM2Xi0
 oxck7k+5KUgi5NVdSi+c9SOTiMTM4jeCuOI4U/ci0AQZusgwnnqANUCyz
 a2ezI9eMjEtXAb8I4344C+4pCYzspMriTibkJTksgc/CtGC3UjcltmLTU
 EWDX8h3d3UEUzcvs4VNjDgBXiiHV7T5pn4y01PH6x+Uct5NGMB3qd7jC9
 n2LRFKgCKmB5evKEIl8biM7I66e14vPpLH5LzfNAi+PGWRqABv2q8ioVB
 YG9NERynf2sS+M3u5SmWBBiZ8kWYR48R83hiL+3+THzL8ghp5uEXVcUNv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="230309093"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="230309093"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 21:48:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="701981572"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 21:48:51 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/dg2: Don't try to process TBT interrupts
Date: Fri, 11 Feb 2022 11:19:03 +0530
Message-Id: <20220211054903.24671-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

DG2 is the first platform, that supports TC but not TBT.
interrupt code is updated to avoid trying to process
TBT-specific bits and registers.

Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          |  1 +
 drivers/gpu/drm/i915/i915_irq.c          | 12 ++++++++----
 drivers/gpu/drm/i915/i915_pci.c          |  1 +
 drivers/gpu/drm/i915/intel_device_info.h |  1 +
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 5b6fd792a8d7..b9294ff5a1e6 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1433,6 +1433,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_PSR(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_psr)
 #define HAS_PSR_HW_TRACKING(dev_priv) \
 	(INTEL_INFO(dev_priv)->display.has_psr_hw_tracking)
+#define HAS_TC_WITHOUT_TBT(dev_priv)	 (INTEL_INFO(dev_priv)->display.has_tc_without_tbt)
 #define HAS_PSR2_SEL_FETCH(dev_priv)	 (DISPLAY_VER(dev_priv) >= 12)
 #define HAS_TRANSCODER(dev_priv, trans)	 ((INTEL_INFO(dev_priv)->display.cpu_transcoder_mask & BIT(trans)) != 0)
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index fdd568ba4a16..72b9888b2acf 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2245,7 +2245,8 @@ static void gen11_hpd_irq_handler(struct drm_i915_private *dev_priv, u32 iir)
 {
 	u32 pin_mask = 0, long_mask = 0;
 	u32 trigger_tc = iir & GEN11_DE_TC_HOTPLUG_MASK;
-	u32 trigger_tbt = iir & GEN11_DE_TBT_HOTPLUG_MASK;
+	u32 trigger_tbt = HAS_TC_WITHOUT_TBT(dev_priv) ? 0 :
+		iir & GEN11_DE_TBT_HOTPLUG_MASK;
 
 	if (trigger_tc) {
 		u32 dig_hotplug_reg;
@@ -3468,7 +3469,8 @@ static void gen11_hpd_irq_setup(struct drm_i915_private *dev_priv)
 	intel_uncore_posting_read(&dev_priv->uncore, GEN11_DE_HPD_IMR);
 
 	gen11_tc_hpd_detection_setup(dev_priv);
-	gen11_tbt_hpd_detection_setup(dev_priv);
+	if (!HAS_TC_WITHOUT_TBT(dev_priv))
+		gen11_tbt_hpd_detection_setup(dev_priv);
 
 	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
 		icp_hpd_irq_setup(dev_priv);
@@ -3828,8 +3830,10 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 
 	if (DISPLAY_VER(dev_priv) >= 11) {
 		u32 de_hpd_masked = 0;
-		u32 de_hpd_enables = GEN11_DE_TC_HOTPLUG_MASK |
-				     GEN11_DE_TBT_HOTPLUG_MASK;
+		u32 de_hpd_enables = GEN11_DE_TC_HOTPLUG_MASK;
+
+		if (!HAS_TC_WITHOUT_TBT(dev_priv))
+			de_hpd_enables |= GEN11_DE_TBT_HOTPLUG_MASK;
 
 		GEN3_IRQ_INIT(uncore, GEN11_DE_HPD_, ~de_hpd_masked,
 			      de_hpd_enables);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 467252f885c2..1ad5593e925f 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1046,6 +1046,7 @@ static const struct intel_device_info dg2_info = {
 	.graphics.rel = 55,
 	.media.rel = 55,
 	PLATFORM(INTEL_DG2),
+	.display.has_tc_without_tbt = 1,
 	.has_guc_deprivilege = 1,
 	.has_64k_pages = 1,
 	.platform_engine_mask =
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 27dcfe6f2429..4d8cfd41aa31 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -171,6 +171,7 @@ enum intel_ppgtt_type {
 	func(has_overlay); \
 	func(has_psr); \
 	func(has_psr_hw_tracking); \
+	func(has_tc_without_tbt); \
 	func(overlay_needs_physical); \
 	func(supports_tv);
 
-- 
2.20.1

