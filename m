Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C9446D56D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 15:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68186FECC;
	Wed,  8 Dec 2021 14:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242C96FEB3;
 Wed,  8 Dec 2021 14:16:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="217861172"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="217861172"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 06:16:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="516252129"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 06:16:32 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/i915: Add has_64k_pages flag
Date: Wed,  8 Dec 2021 19:46:10 +0530
Message-Id: <20211208141613.7251-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208141613.7251-1-ramalingam.c@intel.com>
References: <20211208141613.7251-1-ramalingam.c@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

Add a new platform flag, has_64k_pages, to mark the requirement of 64K
GTT page sizes or larger for device local memory access.

Also implies that we require or at least support the compact PT layout
for the ppGTT when using 64K GTT pages.

v2: More explanation for the flag [Thomas]

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 8 ++++++++
 drivers/gpu/drm/i915/i915_pci.c          | 2 ++
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 85bb8d3107f0..e63c62f69ec5 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1528,6 +1528,14 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_MSLICES(dev_priv) \
 	(INTEL_INFO(dev_priv)->has_mslices)
 
+/*
+ * Set this flag, when platform requires 64K GTT page sizes or larger for
+ * device local memory access. Also this flag implies that we require or
+ * at least support the compact PT layout for the ppGTT when using the 64K
+ * GTT pages.
+ */
+#define HAS_64K_PAGES(dev_priv) (INTEL_INFO(dev_priv)->has_64k_pages)
+
 #define HAS_IPC(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_ipc)
 
 #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 6aaa7c644c9b..634282edadb7 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1029,6 +1029,7 @@ static const struct intel_device_info xehpsdv_info = {
 	DGFX_FEATURES,
 	PLATFORM(INTEL_XEHPSDV),
 	.display = { },
+	.has_64k_pages = 1,
 	.pipe_mask = 0,
 	.platform_engine_mask =
 		BIT(RCS0) | BIT(BCS0) |
@@ -1047,6 +1048,7 @@ static const struct intel_device_info dg2_info = {
 	.graphics.rel = 55,
 	.media.rel = 55,
 	PLATFORM(INTEL_DG2),
+	.has_64k_pages = 1,
 	.platform_engine_mask =
 		BIT(RCS0) | BIT(BCS0) |
 		BIT(VECS0) | BIT(VECS1) |
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 669f0d26c3c3..f38ac5bd837b 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -123,6 +123,7 @@ enum intel_ppgtt_type {
 	func(is_dgfx); \
 	/* Keep has_* in alphabetical order */ \
 	func(has_64bit_reloc); \
+	func(has_64k_pages); \
 	func(gpu_reset_clobbers_display); \
 	func(has_reset_engine); \
 	func(has_global_mocs); \
-- 
2.20.1

