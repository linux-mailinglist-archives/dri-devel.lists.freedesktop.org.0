Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0022C652D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382D66ECB2;
	Fri, 27 Nov 2020 12:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4E16ECCD;
 Fri, 27 Nov 2020 12:10:49 +0000 (UTC)
IronPort-SDR: GrIKPUBFLHr6tG5FHW0m4YuRfm0YqqPBaghbPuG01BddLdpJJ3/KuoKe2oAvFvP/6NYDoY2+/d
 Oa33OKGhrcGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092800"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092800"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:41 -0800
IronPort-SDR: ySW8Y6BziYYz3xRKM1Wb9oz5MzkWn1LIIW5fcWOafI6QeoxkTUlaSnETzDKJE1TcZouAL6PEEW
 JgZWvMOxPK1w==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029476"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:39 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 105/162] drm/i915: Provide a way to disable PCIe relaxed
 write ordering
Date: Fri, 27 Nov 2020 12:06:21 +0000
Message-Id: <20201127120718.454037-106-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Stuart Summers <stuart.summers@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>

For performance writes over PCIe may not be strictly ordered by default.
This provides an option to expose a kernel configuration option to disable
relaxed ordering and turn on strict ordering instead for debug purposes.

Signed-off-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.debug         | 11 +++++++++++
 drivers/gpu/drm/i915/intel_memory_region.c | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 0fb7fd0ef717..65533cbbcb82 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -222,3 +222,14 @@ config DRM_I915_DEBUG_RUNTIME_PM
 	  driver loading, suspend and resume operations.
 
 	  If in doubt, say "N"
+
+config DRM_I915_PCIE_STRICT_WRITE_ORDERING
+	bool "Enable PCIe strict ordering "
+	depends on DRM_I915
+	default n
+	help
+	  Relaxed ordering in writes is enabled by default to improve system
+	  performance. Strict ordering can be selected instead to assist in
+	  debugging.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index cea44ddebe46..043541d409bd 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -286,6 +286,18 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 {
 	int err, i;
 
+	/* All platforms currently have system memory */
+	GEM_BUG_ON(!HAS_REGION(i915, REGION_SMEM));
+
+	if (IS_DGFX(i915)) {
+		if (IS_ENABLED(CONFIG_DRM_I915_PCIE_STRICT_WRITE_ORDERING))
+			pcie_capability_clear_word(i915->drm.pdev, PCI_EXP_DEVCTL,
+						   PCI_EXP_DEVCTL_RELAX_EN);
+		else
+			pcie_capability_set_word(i915->drm.pdev, PCI_EXP_DEVCTL,
+						 PCI_EXP_DEVCTL_RELAX_EN);
+	}
+
 	for (i = 0; i < ARRAY_SIZE(i915->mm.regions); i++) {
 		struct intel_memory_region *mem = ERR_PTR(-ENODEV);
 		u16 type, instance;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
