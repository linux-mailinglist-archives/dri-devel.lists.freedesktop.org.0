Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD554E06A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F10311A4A9;
	Thu, 16 Jun 2022 12:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFF21134EC;
 Thu, 16 Jun 2022 12:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655380886; x=1686916886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fHsDgzEnq7qjTAV60psifkAowBGHTR58dn0jlcaOlVI=;
 b=f4oJEm1+6BXBAIsTEoye4q4XFxcR/3whSxa0yf5sf+5/bZs6lYQcgPGR
 /7C6GwIK1kixAWbFRey4dI3gKTFrRU4LEyRiRYbZxV2YAWw1nBIVyULwB
 pluQ+80DxYLSxAFJz+crhpw17mRQACig0cjUX9bVWisIv6G28RnzZnvjQ
 tvwlCziq11TnzACkfqBZtPkgXXVTa4v7rSdVc4N1n2bpxzLLnT6cIdw1q
 ZerFJXW3TOuGRc66KvNirjOi1VgvwKAsLsHwxnQg2y/FYOZdAJYiIsEbW
 RiwHwtbG1Jgd4gQ0yVD+lcnUeUQaJ1CGvjjCpK51pbgrrKtPCS7GBN/e1 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343189548"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="343189548"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="713330861"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:23 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/9] drm/i915/dgfx: OpRegion VRAM Self Refresh Support
Date: Thu, 16 Jun 2022 17:30:58 +0530
Message-Id: <20220616120106.24353-2-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220616120106.24353-1-anshuman.gupta@intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
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
Cc: tilak.tangudu@intel.com, tvrtko.ursulin@intel.com,
 Jani Nikula <jani.nikula@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 jon.ewins@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Intel DGFX cards provides a feature Video Ram Self Refrsh(VRSR).
DGFX VRSR can be enabled with runtime suspend D3Cold flow and with
opportunistic S0ix system wide suspend flow as well.

Without VRSR enablement i915 has to evict the lmem objects to
system memory. Depending on some heuristics driver will evict
lmem objects without VRSR.

VRSR feature requires Host BIOS support, VRSR will be enable/disable
by HOST BIOS using ACPI OpRegion.

Adding OpRegion VRSR support in order to enable/disable
VRSR on discrete cards.

BSpec: 53440
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_opregion.c | 62 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_opregion.h | 11 ++++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 6876ba30d5a9..11d8c5bb23ac 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -53,6 +53,8 @@
 #define MBOX_ASLE_EXT		BIT(4)	/* Mailbox #5 */
 #define MBOX_BACKLIGHT		BIT(5)	/* Mailbox #2 (valid from v3.x) */
 
+#define PCON_DGFX_BIOS_SUPPORTS_VRSR			BIT(11)
+#define PCON_DGFX_BIOS_SUPPORTS_VRSR_FIELD_VALID	BIT(12)
 #define PCON_HEADLESS_SKU	BIT(13)
 
 struct opregion_header {
@@ -130,7 +132,8 @@ struct opregion_asle {
 	u64 rvda;	/* Physical (2.0) or relative from opregion (2.1+)
 			 * address of raw VBT data. */
 	u32 rvds;	/* Size of raw vbt data */
-	u8 rsvd[58];
+	u8 vrsr;	/* DGFX Video Ram Self Refresh */
+	u8 rsvd[57];
 } __packed;
 
 /* OpRegion mailbox #5: ASLE ext */
@@ -201,6 +204,9 @@ struct opregion_asle_ext {
 
 #define ASLE_PHED_EDID_VALID_MASK	0x3
 
+/* VRAM SR */
+#define ASLE_VRSR_ENABLE		BIT(0)
+
 /* Software System Control Interrupt (SWSCI) */
 #define SWSCI_SCIC_INDICATOR		(1 << 0)
 #define SWSCI_SCIC_MAIN_FUNCTION_SHIFT	1
@@ -921,6 +927,8 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 		opregion->header->over.minor,
 		opregion->header->over.revision);
 
+	drm_dbg(&dev_priv->drm, "OpRegion PCON values 0x%x\n", opregion->header->pcon);
+
 	mboxes = opregion->header->mboxes;
 	if (mboxes & MBOX_ACPI) {
 		drm_dbg(&dev_priv->drm, "Public ACPI methods supported\n");
@@ -1246,3 +1254,55 @@ void intel_opregion_unregister(struct drm_i915_private *i915)
 	opregion->vbt = NULL;
 	opregion->lid_state = NULL;
 }
+
+/**
+ * intel_opregion_bios_supports_vram_sr() get HOST BIOS VRAM Self
+ * Refresh capability support.
+ * @i915: pointer to i915 device.
+ *
+ * It checks opregion pcon vram_sr fields to get HOST BIOS vram_sr
+ * capability support. It is only applocable to DGFX.
+ *
+ * Returns:
+ * true when bios supports vram_sr, or false if bios doesn't support.
+ */
+bool intel_opregion_bios_supports_vram_sr(struct drm_i915_private *i915)
+{
+	struct intel_opregion *opregion = &i915->opregion;
+
+	if (!IS_DGFX(i915))
+		return false;
+
+	if (!opregion)
+		return false;
+
+	if (opregion->header->pcon & PCON_DGFX_BIOS_SUPPORTS_VRSR_FIELD_VALID)
+		return opregion->header->pcon & PCON_DGFX_BIOS_SUPPORTS_VRSR;
+	else
+		return false;
+}
+
+/**
+ * intel_opregion_vram_sr() - enable/disable VRAM Self Refresh.
+ * @i915: pointer to i915 device.
+ * @enable: Argument to enable/disable VRSR.
+ *
+ * It enables/disables vram_sr in opregion ASLE MBOX, based upon that
+ * HOST BIOS will enables and disbales VRAM_SR during
+ * ACPI _PS3/_OFF and _PS/_ON glue method.
+ */
+void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable)
+{
+	struct intel_opregion *opregion = &i915->opregion;
+
+	if (!opregion)
+		return;
+
+	if (drm_WARN(&i915->drm, !opregion->asle, "ASLE MAILBOX3 is not available\n"))
+		return;
+
+	if (enable)
+		opregion->asle->vrsr |= ASLE_VRSR_ENABLE;
+	else
+		opregion->asle->vrsr &= ~ASLE_VRSR_ENABLE;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
index 2f261f985400..73c9d81d5ee6 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.h
+++ b/drivers/gpu/drm/i915/display/intel_opregion.h
@@ -75,6 +75,8 @@ int intel_opregion_notify_adapter(struct drm_i915_private *dev_priv,
 				  pci_power_t state);
 int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
 struct edid *intel_opregion_get_edid(struct intel_connector *connector);
+bool intel_opregion_bios_supports_vram_sr(struct drm_i915_private *i915);
+void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable);
 
 bool intel_opregion_headless_sku(struct drm_i915_private *i915);
 
@@ -134,6 +136,15 @@ static inline bool intel_opregion_headless_sku(struct drm_i915_private *i915)
 	return false;
 }
 
+static bool intel_opregion_bios_supports_vram_sr(struct drm_i915_private *i915)
+{
+	return false;
+}
+
+static void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable)
+{
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif
-- 
2.26.2

