Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26BC5FB004
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 12:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4AD10E7E6;
	Tue, 11 Oct 2022 10:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2E410E51D;
 Tue, 11 Oct 2022 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665482504; x=1697018504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=niDb0mywGWpuXXVUWXdmmuqOz5Oq2nJNXHOGiwwI/So=;
 b=Dambd9H8aK0jiR+sxmNroVUN25BsBgtITR6X9B5hkCM1SSMgldrGCTGU
 pRePwzg3vs27IxGET7Z47IznaXdeu0vZd60Cvox+ZkGvIIOpChscbu0FJ
 60XoTqCPruv2NvAXRVjZlmFbC1qcS4UnUGX4/taWOkjsGy8fj6pXS9X9z
 +6+rOx4dRs+5+QWXImeZV27VuHJ79BkbpFZr6Is9Cy6k78x1Ux9pfYiHD
 b04vqvAKg6hPOiNvLWNfF8qokTw25cSyy/+O/u+BNN2+U40W5H9Whe7xo
 /UkN1+u+D46/tPPxlV8s6A+c/QH1jfPc6E3MyaC7BTlx25fTr21V3kUMn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="366454571"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="366454571"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 03:01:43 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="801402518"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="801402518"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 03:01:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm: split build lists one per line and sort
Date: Tue, 11 Oct 2022 13:01:37 +0300
Message-Id: <20221011100137.2838947-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While it takes more vertical space, sorted build lists with one object
per line are arguably easier to manage, especially when there are
conflicting changes.

Split anything with more than one object file.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Makefile         | 106 ++++++++++++++++++++++---------
 drivers/gpu/drm/display/Makefile |  14 ++--
 2 files changed, 84 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 25d0ba310509..c4e6ef321566 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,32 +3,70 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
-		drm_file.o drm_gem.o drm_ioctl.o \
-		drm_drv.o \
-		drm_sysfs.o drm_mm.o \
-		drm_crtc.o drm_fourcc.o drm_modes.o drm_edid.o drm_displayid.o \
-		drm_trace_points.o drm_prime.o \
-		drm_vma_manager.o \
-		drm_modeset_lock.o drm_atomic.o drm_bridge.o \
-		drm_framebuffer.o drm_connector.o drm_blend.o \
-		drm_encoder.o drm_mode_object.o drm_property.o \
-		drm_plane.o drm_color_mgmt.o drm_print.o \
-		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
-		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
-		drm_client_modeset.o drm_atomic_uapi.o \
-		drm_managed.o drm_vblank_work.o
-drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
-			    drm_hashtab.o drm_irq.o drm_legacy_misc.o drm_lock.o \
-			    drm_memory.o drm_scatter.o drm_vm.o
+drm-y := \
+	drm_aperture.o \
+	drm_atomic.o \
+	drm_atomic_uapi.o \
+	drm_auth.o drm_cache.o \
+	drm_blend.o \
+	drm_bridge.o \
+	drm_client.o \
+	drm_client_modeset.o \
+	drm_color_mgmt.o \
+	drm_connector.o \
+	drm_crtc.o \
+	drm_displayid.o \
+	drm_drv.o \
+	drm_dumb_buffers.o \
+	drm_edid.o \
+	drm_encoder.o \
+	drm_file.o \
+	drm_fourcc.o \
+	drm_framebuffer.o \
+	drm_gem.o \
+	drm_ioctl.o \
+	drm_lease.o \
+	drm_managed.o \
+	drm_mm.o \
+	drm_mode_config.o \
+	drm_mode_object.o \
+	drm_modes.o \
+	drm_modeset_lock.o \
+	drm_plane.o \
+	drm_prime.o \
+	drm_print.o \
+	drm_property.o \
+	drm_syncobj.o \
+	drm_sysfs.o \
+	drm_trace_points.o \
+	drm_vblank.o \
+	drm_vblank_work.o \
+	drm_vma_manager.o \
+	drm_writeback.o
+drm-$(CONFIG_DRM_LEGACY) += \
+	drm_agpsupport.o \
+	drm_bufs.o \
+	drm_context.o \
+	drm_dma.o \
+	drm_hashtab.o \
+	drm_irq.o \
+	drm_legacy_misc.o \
+	drm_lock.o \
+	drm_memory.o \
+	drm_scatter.o \
+	drm_vm.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
 drm-$(CONFIG_PCI) += drm_pci.o
-drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
+drm-$(CONFIG_DEBUG_FS) += \
+	drm_debugfs.o \
+	drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
-drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o
+drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
+	drm_privacy_screen.o \
+	drm_privacy_screen_x86.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_NOMODESET) += drm_nomodeset.o
@@ -57,16 +95,24 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 # Modesetting helpers
 #
 
-drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
-		drm_encoder_slave.o drm_flip_work.o \
-		drm_probe_helper.o \
-		drm_plane_helper.o drm_atomic_helper.o \
-		drm_kms_helper_common.o \
-		drm_simple_kms_helper.o drm_modeset_helper.o \
-		drm_gem_atomic_helper.o \
-		drm_gem_framebuffer_helper.o \
-		drm_atomic_state_helper.o drm_damage_helper.o \
-		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
+drm_kms_helper-y := \
+	drm_atomic_helper.o \
+	drm_atomic_state_helper.o \
+	drm_bridge_connector.o \
+	drm_crtc_helper.o \
+	drm_damage_helper.o \
+	drm_encoder_slave.o \
+	drm_flip_work.o \
+	drm_format_helper.o \
+	drm_gem_atomic_helper.o \
+	drm_gem_framebuffer_helper.o \
+	drm_kms_helper_common.o \
+	drm_modeset_helper.o \
+	drm_plane_helper.o \
+	drm_probe_helper.o \
+	drm_rect.o \
+	drm_self_refresh_helper.o \
+	drm_simple_kms_helper.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 52cdda1180d9..17ac4a1006a8 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -3,13 +3,15 @@
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
 drm_display_helper-y := drm_display_helper_mod.o
-drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += drm_dp_dual_mode_helper.o \
-						      drm_dp_helper.o \
-						      drm_dp_mst_topology.o \
-						      drm_dsc_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
+	drm_dp_dual_mode_helper.o \
+	drm_dp_helper.o \
+	drm_dp_mst_topology.o \
+	drm_dsc_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
-drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += drm_hdmi_helper.o \
-							drm_scdc_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
+	drm_hdmi_helper.o \
+	drm_scdc_helper.o
 drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 
-- 
2.34.1

