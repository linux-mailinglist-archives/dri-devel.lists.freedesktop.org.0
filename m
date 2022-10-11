Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCA35FB446
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 16:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0334F10E57B;
	Tue, 11 Oct 2022 14:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D2310E3FB;
 Tue, 11 Oct 2022 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665497332; x=1697033332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=raL1nVfHAaYxhgmFWPlTE8cO7fuNxs2iZHEDa4VOcqk=;
 b=OmqrzPJy9kZyHjM3cAJfOOPu6pMl4TVRKF9qInQsIAVmwIGnxBb6dBum
 nkkc/BS7YzvF6xBsu4ChrDAWi2c3A3Edwj2PzCHqhqHUsGGH+U3v6ZDXF
 gqxB84xRNL7TFwuIg7HsRyZEuHRo0RW3mLdfxcFc2YalF804vB4+QxhGE
 YzwYeZ8ILMxYz5PqA+Y1U6TsKE0Ft5o7YoDhRW6xlGW11gz/tdbiHsXjJ
 1HQh/WzUPQg+g2XwtJlhY1JdZU9zS3e8gFa/qFwwxVq+M+Tfw5oAJgF7Q
 vPCelwiv4wSC5cW8AM3eQ3PHgomTfBr48TLoOLceo9b17MHfndZrtloHQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="366503025"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="366503025"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 07:08:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="657361464"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="657361464"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 07:08:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: split build lists one per line and sort
Date: Tue, 11 Oct 2022 17:08:30 +0300
Message-Id: <20221011140830.3257655-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While it takes more vertical space, sorted build lists with one object
per line are arguably easier to manage, especially when there are
conflicting changes.

Split anything with more than one object file.

v2: also split drm_cache.o and put it after drm_bridge.o (Andi)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/Makefile         | 107 ++++++++++++++++++++++---------
 drivers/gpu/drm/display/Makefile |  14 ++--
 2 files changed, 85 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 25d0ba310509..6ad98d3ceff7 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,32 +3,71 @@
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
+	drm_auth.o \
+	drm_blend.o \
+	drm_bridge.o \
+	drm_cache.o \
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
@@ -57,16 +96,24 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
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

