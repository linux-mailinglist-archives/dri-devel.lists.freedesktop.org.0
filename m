Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF4633099
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 00:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5114410E350;
	Mon, 21 Nov 2022 23:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBB010E343;
 Mon, 21 Nov 2022 23:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669072383; x=1700608383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IGzufppaQtjxVab8ANL4EiTxA7qJpRLaAzPkiQQEv8=;
 b=gddCgUe9cRp0CRxNzc7ODy3X8AMcOdhvZw7cQqTXC7gTlAcZhW0mOM8J
 kaTaAGCitkNQQyjFOi1xkVCaIYRGbK3nJPhJMylYPAiHLUJJnKk7PXwU2
 FYx86GerNBp7twWn3dZhKGfUKxMlp9+Y1EcKhdfl9FhXv87kpd3Fbt/iR
 oapS9lwwilNbpmDFWKYbKOR/qJCgAfN/0ockzQeGWtGKqsmSkz6brqV9x
 9EZUp6jjrZ/PU9W0PRTkQ4VgTBlXOSBBmIAJvvHGOfVV8BLWnh1ESEAf7
 t6YUW0QTVf9Y4K3xyssMWmoXz1fMOC+yWAydDHK8UTkWzmc82K3u+4faG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="315503489"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="315503489"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 15:12:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="618993372"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="618993372"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 15:12:54 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded
Date: Mon, 21 Nov 2022 15:16:15 -0800
Message-Id: <20221121231617.1110329-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the GSC was loaded, the only way to stop it during the driver unload
flow is to do a driver-FLR.
The driver-FLR is not the same as PCI config space FLR in that
it doesn't reset the SGUnit and doesn't modify the PCI config
space. Thus, it doesn't require a re-enumeration of the PCI BARs.
However, the driver-FLR does cause a memory wipe of graphics memory
on all discrete GPU platforms or a wipe limited to stolen memory
on the integrated GPU platforms.

We perform the FLR as the last action before releasing the MMIO bar, so
that we don't have to care about the consequences of the reset on the
unload flow.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c |  9 +++++
 drivers/gpu/drm/i915/i915_reg.h           |  3 ++
 drivers/gpu/drm/i915/intel_uncore.c       | 45 +++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_uncore.h       | 13 +++++++
 4 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index 510fb47193ec..5dad3c19c445 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -173,6 +173,15 @@ int intel_gsc_fw_upload(struct intel_gsc_uc *gsc)
 	if (err)
 		goto fail;
 
+	/*
+	 * Once the GSC FW is loaded, the only way to kill it on driver unload
+	 * is to do a driver FLR. Given this is a very disruptive action, we
+	 * want to do it as the last action before releasing the access to the
+	 * MMIO bar, which means we need to do it as part of the primary uncore
+	 * cleanup.
+	 */
+	intel_uncore_set_flr_on_fini(&gt->i915->uncore);
+
 	/* FW is not fully operational until we enable SW proxy */
 	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8e1892d14774..60e55245200b 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -118,6 +118,9 @@
 
 #define GU_CNTL				_MMIO(0x101010)
 #define   LMEM_INIT			REG_BIT(7)
+#define   DRIVERFLR			REG_BIT(31)
+#define GU_DEBUG			_MMIO(0x101018)
+#define   DRIVERFLR_STATUS		REG_BIT(31)
 
 #define GEN6_STOLEN_RESERVED		_MMIO(0x1082C0)
 #define GEN6_STOLEN_RESERVED_ADDR_MASK	(0xFFF << 20)
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 8006a6c61466..c1befa33ff59 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2703,6 +2703,48 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
 	}
 }
 
+static void driver_flr(struct intel_uncore *uncore)
+{
+	struct drm_i915_private *i915 = uncore->i915;
+	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
+	int ret;
+
+	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
+
+	/*
+	 * Make sure any pending FLR requests have cleared by waiting for the
+	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
+	 * to make sure it's not still set from a prior attempt (it's a write to
+	 * clear bit).
+	 * Note that we should never be in a situation where a previous attempt
+	 * is still pending (unless the HW is totally dead), but better to be
+	 * safe in case something unexpected happens
+	 */
+	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
+	if (ret) {
+		drm_err(&i915->drm,
+			"Failed to wait for Driver-FLR bit to clear! %d\n",
+			ret);
+		return;
+	}
+	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
+
+	/* Trigger the actual Driver-FLR */
+	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
+
+	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
+					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
+					 flr_timeout_ms);
+	if (ret) {
+		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
+		return;
+	}
+
+	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
+
+	return;
+}
+
 /* Called via drm-managed action */
 void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
 {
@@ -2716,6 +2758,9 @@ void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
 		intel_uncore_fw_domains_fini(uncore);
 		iosf_mbi_punit_release();
 	}
+
+	if (intel_uncore_needs_flr_on_fini(uncore))
+		driver_flr(uncore);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 5449146a0624..a9fa0b11e7e4 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -153,6 +153,7 @@ struct intel_uncore {
 #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
 #define UNCORE_HAS_DBG_UNCLAIMED	BIT(2)
 #define UNCORE_HAS_FIFO			BIT(3)
+#define UNCORE_NEEDS_FLR_ON_FINI	BIT(3)
 
 	const struct intel_forcewake_range *fw_domains_table;
 	unsigned int fw_domains_table_entries;
@@ -223,6 +224,18 @@ intel_uncore_has_fifo(const struct intel_uncore *uncore)
 	return uncore->flags & UNCORE_HAS_FIFO;
 }
 
+static inline bool
+intel_uncore_needs_flr_on_fini(const struct intel_uncore *uncore)
+{
+	return uncore->flags & UNCORE_NEEDS_FLR_ON_FINI;
+}
+
+static inline bool
+intel_uncore_set_flr_on_fini(struct intel_uncore *uncore)
+{
+	return uncore->flags |= UNCORE_NEEDS_FLR_ON_FINI;
+}
+
 void intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915);
 void intel_uncore_init_early(struct intel_uncore *uncore,
 			     struct intel_gt *gt);
-- 
2.37.3

