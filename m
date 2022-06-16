Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF90754E06B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D52011A4AC;
	Thu, 16 Jun 2022 12:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE88211A4AC;
 Thu, 16 Jun 2022 12:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655380890; x=1686916890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KyeKOIb9ToFUz0oO+c4cuz+Em5bBHZji6YQ4o1dfiy4=;
 b=HMCBPEzT3SJNhCe7rbSrMfCGz8eIvs9jq+y2Oz21w1KBH44PyobIV6A0
 U+kuNzoEOCiDWWTCrRkPw3AuJPYLuvq0zVERezPqxzzD+yUpL9MqXXE2Q
 E43C1yF9Sl2c6mCtJSpnVKydLaNPFa4VPRae04PsAOqrH7tRm9SOIvHjc
 DHgHzhmqU0baz74wi63/KNnOwD9KUYmcRMTjLcF7+f20RHt6a571+9nRs
 nTBkWxzeHDLIQOhFmQagCBtiXS6N26+B9RdkZit9v17tjSGstr7USZjpd
 9fhnYCYi1wD0azfmr44K+sGDRB473V4sGqkF6YYyqYJoB1PTUaJ2ETEKI Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343189568"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="343189568"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="713330880"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:26 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/9] drm/i915/dg1: OpRegion PCON DG1 MBD config support
Date: Thu, 16 Jun 2022 17:30:59 +0530
Message-Id: <20220616120106.24353-3-anshuman.gupta@intel.com>
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

DGFX cards support both Add in Card(AIC) and Mother Board Down(MBD)
configs. MBD config requires HOST BIOS GPIO toggling support
in order to enable/disable VRAM SR using ACPI OpRegion.

i915 requires to check OpRegion PCON MBD Config bits to
discover whether Gfx Card is MBD config before enabling
VRSR.

BSpec: 53440
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_opregion.c | 43 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_opregion.h |  6 +++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 11d8c5bb23ac..c8cdcde89dfc 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -53,6 +53,8 @@
 #define MBOX_ASLE_EXT		BIT(4)	/* Mailbox #5 */
 #define MBOX_BACKLIGHT		BIT(5)	/* Mailbox #2 (valid from v3.x) */
 
+#define PCON_DG1_MBD_CONFIG				BIT(9)
+#define PCON_DG1_MBD_CONFIG_FIELD_VALID			BIT(10)
 #define PCON_DGFX_BIOS_SUPPORTS_VRSR			BIT(11)
 #define PCON_DGFX_BIOS_SUPPORTS_VRSR_FIELD_VALID	BIT(12)
 #define PCON_HEADLESS_SKU	BIT(13)
@@ -1255,6 +1257,44 @@ void intel_opregion_unregister(struct drm_i915_private *i915)
 	opregion->lid_state = NULL;
 }
 
+static bool intel_opregion_dg1_mbd_config(struct drm_i915_private *i915)
+{
+	struct intel_opregion *opregion = &i915->opregion;
+
+	if (!IS_DG1(i915))
+		return false;
+
+	if (!opregion)
+		return false;
+
+	if (opregion->header->pcon & PCON_DG1_MBD_CONFIG_FIELD_VALID)
+		return opregion->header->pcon & PCON_DG1_MBD_CONFIG;
+	else
+		return false;
+}
+
+/**
+ * intel_opregion_vram_sr_required().
+ * @i915 i915 device priv data.
+ *
+ * It checks whether a DGFX card is Mother Board Down config depending
+ * on respective discrete platform.
+ *
+ * Returns:
+ * It returns a boolean whether opregion vram_sr support is required.
+ */
+bool
+intel_opregion_vram_sr_required(struct drm_i915_private *i915)
+{
+	if (!IS_DGFX(i915))
+		return false;
+
+	if (IS_DG1(i915))
+		return intel_opregion_dg1_mbd_config(i915);
+
+	return false;
+}
+
 /**
  * intel_opregion_bios_supports_vram_sr() get HOST BIOS VRAM Self
  * Refresh capability support.
@@ -1298,6 +1338,9 @@ void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable)
 	if (!opregion)
 		return;
 
+	if (!intel_opregion_vram_sr_required(i915))
+		return;
+
 	if (drm_WARN(&i915->drm, !opregion->asle, "ASLE MAILBOX3 is not available\n"))
 		return;
 
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
index 73c9d81d5ee6..ad40c97f9565 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.h
+++ b/drivers/gpu/drm/i915/display/intel_opregion.h
@@ -77,6 +77,7 @@ int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
 struct edid *intel_opregion_get_edid(struct intel_connector *connector);
 bool intel_opregion_bios_supports_vram_sr(struct drm_i915_private *i915);
 void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable);
+bool intel_opregion_vram_sr_required(struct drm_i915_private *i915);
 
 bool intel_opregion_headless_sku(struct drm_i915_private *i915);
 
@@ -145,6 +146,11 @@ static void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable)
 {
 }
 
+static bool intel_opregion_vram_sr_required(struct drm_i915_private *i915)
+{
+	return false;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif
-- 
2.26.2

