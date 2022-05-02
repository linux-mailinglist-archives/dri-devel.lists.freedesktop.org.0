Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF0A517454
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466AB10F05E;
	Mon,  2 May 2022 16:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6607B10F025;
 Mon,  2 May 2022 16:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651509261; x=1683045261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xZIcIY/rcqnqG1AtNPqmr8fGr4epQ12bWcgLjjVnv9o=;
 b=OFy44fZlBHBP2KFBq5VNhtfxPKqmXZnNpahupU5vBkjDkHsh3Qx7lw+M
 AaGJui4jLVFMiWNHIes3sOd2znFPiH4g+1fDYmK1pcxcVv3N2cAB1Wk6c
 vu+fDSlDC5PUN/FN1YEYgpNXWpyNPu7rdccrJxIvGal6t1KFN9GHFKcim
 SgUIPYDMpCKDc3OtFRW0Wfj9au5/R+JBtwBZfg6h3VkNL0ywR6i2dSNbs
 zZyuQaVtMDxd/P42H+1DGPeya6V5RNIvHwv5W72lQyMCb/FXffkOAhfq9
 hA5vlfk4K9K82qXjgvs+IjwKEfumkWrV6oUe1cQv925X1DrknLuDlibYs A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266104995"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="266104995"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583781811"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/11] drm/i915/pvc: add initial Ponte Vecchio definitions
Date: Mon,  2 May 2022 09:34:07 -0700
Message-Id: <20220502163417.2635462-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502163417.2635462-1-matthew.d.roper@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

Additional blitter and media engines will be enabled later.

Bspec: 44481, 44482
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          |  2 ++
 drivers/gpu/drm/i915/i915_pci.c          | 21 +++++++++++++++++++++
 drivers/gpu/drm/i915/intel_device_info.c |  1 +
 drivers/gpu/drm/i915/intel_device_info.h |  1 +
 4 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 24111bf42ce0..2dddc27a1b0e 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1062,6 +1062,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, INTEL_ALDERLAKE_P)
 #define IS_XEHPSDV(dev_priv) IS_PLATFORM(dev_priv, INTEL_XEHPSDV)
 #define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, INTEL_DG2)
+#define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, INTEL_PONTEVECCHIO)
+
 #define IS_DG2_G10(dev_priv) \
 	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10)
 #define IS_DG2_G11(dev_priv) \
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 7739d6c33481..498708b33924 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1074,6 +1074,27 @@ static const struct intel_device_info ats_m_info = {
 	.require_force_probe = 1,
 };
 
+#define XE_HPC_FEATURES \
+	XE_HP_FEATURES, \
+	.dma_mask_size = 52
+
+__maybe_unused
+static const struct intel_device_info pvc_info = {
+	XE_HPC_FEATURES,
+	XE_HPM_FEATURES,
+	DGFX_FEATURES,
+	.graphics.rel = 60,
+	.media.rel = 60,
+	PLATFORM(INTEL_PONTEVECCHIO),
+	.display = { 0 },
+	.has_flat_ccs = 0,
+	.platform_engine_mask =
+		BIT(BCS0) |
+		BIT(VCS0) |
+		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3),
+	.require_force_probe = 1,
+};
+
 #undef PLATFORM
 
 /*
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 63e05cd15a90..f0bf23726ed8 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -72,6 +72,7 @@ static const char * const platform_names[] = {
 	PLATFORM_NAME(ALDERLAKE_P),
 	PLATFORM_NAME(XEHPSDV),
 	PLATFORM_NAME(DG2),
+	PLATFORM_NAME(PONTEVECCHIO),
 };
 #undef PLATFORM_NAME
 
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 20c351c8d5bd..e7d2cf7d65c8 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -88,6 +88,7 @@ enum intel_platform {
 	INTEL_ALDERLAKE_P,
 	INTEL_XEHPSDV,
 	INTEL_DG2,
+	INTEL_PONTEVECCHIO,
 	INTEL_MAX_PLATFORMS
 };
 
-- 
2.35.1

