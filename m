Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441273CB160
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 06:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942FB6E8F8;
	Fri, 16 Jul 2021 04:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559016E8F0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 04:12:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="271783369"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="271783369"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 21:12:07 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="495788572"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 21:12:06 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 03/15] drm/i915/pxp: define PXP device flag and kconfig
Date: Thu, 15 Jul 2021 21:10:22 -0700
Message-Id: <20210716041034.382-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
References: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ahead of the PXP implementation, define the relevant define flag and
kconfig option.

v2: flip kconfig default to N. Some machines have IFWIs that do not
support PXP, so we need it to be an opt-in until we add support to query
the caps from the mei device.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v1
---
 drivers/gpu/drm/i915/Kconfig             | 11 +++++++++++
 drivers/gpu/drm/i915/i915_drv.h          |  4 ++++
 drivers/gpu/drm/i915/intel_device_info.h |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index f960f5d7664e..5987c3d5d9fb 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -131,6 +131,17 @@ config DRM_I915_GVT_KVMGT
 	  Choose this option if you want to enable KVMGT support for
 	  Intel GVT-g.
 
+config DRM_I915_PXP
+	bool "Enable Intel PXP support for Intel Gen12+ platform"
+	depends on DRM_I915
+	depends on INTEL_MEI && INTEL_MEI_PXP
+	default n
+	help
+	  PXP (Protected Xe Path) is an i915 component, available on GEN12+
+	  GPUs, that helps to establish the hardware protected session and
+	  manage the status of the alive software session, as well as its life
+	  cycle.
+
 menu "drm/i915 Debugging"
 depends on DRM_I915
 depends on EXPERT
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c4747f4407ef..772f9f0b6ddb 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1752,6 +1752,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_VRR(i915)	(GRAPHICS_VER(i915) >= 12)
 
+#define HAS_PXP(dev_priv) (IS_ENABLED(CONFIG_DRM_I915_PXP) && \
+			   INTEL_INFO(dev_priv)->has_pxp) && \
+			   VDBOX_MASK(&dev_priv->gt)
+
 /* Only valid when HAS_DISPLAY() is true */
 #define INTEL_DISPLAY_ENABLED(dev_priv) \
 	(drm_WARN_ON(&(dev_priv)->drm, !HAS_DISPLAY(dev_priv)), !(dev_priv)->params.disable_display)
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index bd83004c78b6..8e9597008b8a 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -129,6 +129,7 @@ enum intel_ppgtt_type {
 	func(has_logical_ring_elsq); \
 	func(has_master_unit_irq); \
 	func(has_pooled_eu); \
+	func(has_pxp); \
 	func(has_rc6); \
 	func(has_rc6p); \
 	func(has_rps); \
-- 
2.32.0

