Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF9E4F8EF7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 08:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632C010F6F0;
	Fri,  8 Apr 2022 06:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F056F10EA7A;
 Fri,  8 Apr 2022 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649400965; x=1680936965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qufrRYEWXWrknet/HpR6fCSUT9AQSw/VcxGsDl6GRns=;
 b=c70Jy7ht5UW3CeApyFfUxA8JJbDOyh0hBZ2fhlRtU+4lzwdU/5lZcCNb
 oG8v4Dzyti8gcatpTSxuM2P3jUwvQbbxSbE6GS0UDnlDkZw+qh3YxYHNN
 MAwH5g/DxEbu1kC9TjhjFgGPHOaR34wfBtAv1gQOqq3p5Bq4ptZg8ItGT
 OgiHtuwiw5ld+g94pxqSM7ci5ehr3lxmVRjiTLdUTDktR8ewRNmsNR8CG
 8yd7jI6L+HTse5WbMapmnQ5by99TYjg/U99yazJyqcNp1wXbY3HvBCU7H
 zy4JArxaFZOnDczdH7ftmR7fqdlAfHN4BGazSxTaFw02R5KShFzPyapfn A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261219275"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="261219275"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 23:56:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="506457617"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 23:55:57 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Subject: [PATCH 3/3] drm/amd/display: Move connector debugfs to drm
Date: Fri,  8 Apr 2022 12:23:50 +0530
Message-Id: <20220408065350.1485328-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
References: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As drm_connector already have the display_info, instead of creating
"output_bpc" debugfs in vendor specific driver, move the logic to
the drm layer.

This patch will also move "Current" bpc to the crtc debugfs from
connector debugfs, since we are getting this info from crtc_state.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 --
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 38 +++++++------------
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.h |  2 -
 3 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 73423b805b54..f89651c71ec7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6615,14 +6615,12 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	return &state->base;
 }
 
-#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
 static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
 {
 	crtc_debugfs_init(crtc);
 
 	return 0;
 }
-#endif
 
 static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 {
@@ -6720,9 +6718,7 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.enable_vblank = dm_enable_vblank,
 	.disable_vblank = dm_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
-#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 	.late_register = amdgpu_dm_crtc_late_register,
-#endif
 };
 
 static enum drm_connector_status
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index da17ece1a2c5..3ee26083920b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -873,28 +873,18 @@ static int psr_capability_show(struct seq_file *m, void *data)
 }
 
 /*
- * Returns the current and maximum output bpc for the connector.
- * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
+ * Returns the current bpc for the crtc.
+ * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_bpc
  */
-static int output_bpc_show(struct seq_file *m, void *data)
+static int amdgpu_current_bpc_show(struct seq_file *m, void *data)
 {
-	struct drm_connector *connector = m->private;
-	struct drm_device *dev = connector->dev;
-	struct drm_crtc *crtc = NULL;
+	struct drm_crtc *crtc = m->private;
+	struct drm_device *dev = crtc->dev;
 	struct dm_crtc_state *dm_crtc_state = NULL;
 	int res = -ENODEV;
 	unsigned int bpc;
 
 	mutex_lock(&dev->mode_config.mutex);
-	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-
-	if (connector->state == NULL)
-		goto unlock;
-
-	crtc = connector->state->crtc;
-	if (crtc == NULL)
-		goto unlock;
-
 	drm_modeset_lock(&crtc->mutex, NULL);
 	if (crtc->state == NULL)
 		goto unlock;
@@ -924,18 +914,15 @@ static int output_bpc_show(struct seq_file *m, void *data)
 	}
 
 	seq_printf(m, "Current: %u\n", bpc);
-	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
 	res = 0;
 
 unlock:
-	if (crtc)
-		drm_modeset_unlock(&crtc->mutex);
-
-	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+	drm_modeset_unlock(&crtc->mutex);
 	mutex_unlock(&dev->mode_config.mutex);
 
 	return res;
 }
+DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
 
 /*
  * Example usage:
@@ -2541,7 +2528,6 @@ static int target_backlight_show(struct seq_file *m, void *unused)
 DEFINE_SHOW_ATTRIBUTE(dp_dsc_fec_support);
 DEFINE_SHOW_ATTRIBUTE(dmub_fw_state);
 DEFINE_SHOW_ATTRIBUTE(dmub_tracebuffer);
-DEFINE_SHOW_ATTRIBUTE(output_bpc);
 DEFINE_SHOW_ATTRIBUTE(dp_lttpr_status);
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 DEFINE_SHOW_ATTRIBUTE(hdcp_sink_capability);
@@ -2788,7 +2774,6 @@ static const struct {
 	const struct file_operations *fops;
 } connector_debugfs_entries[] = {
 		{"force_yuv420_output", &force_yuv420_output_fops},
-		{"output_bpc", &output_bpc_fops},
 		{"trigger_hotplug", &trigger_hotplug_debugfs_fops},
 		{"internal_display", &internal_display_fops}
 };
@@ -3172,9 +3157,10 @@ static int crc_win_update_get(void *data, u64 *val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(crc_win_update_fops, crc_win_update_get,
 			 crc_win_update_set, "%llu\n");
-
+#endif
 void crtc_debugfs_init(struct drm_crtc *crtc)
 {
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
 	struct dentry *dir = debugfs_lookup("crc", crtc->debugfs_entry);
 
 	if (!dir)
@@ -3190,9 +3176,11 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
 				   &crc_win_y_end_fops);
 	debugfs_create_file_unsafe("crc_win_update", 0644, dir, crtc,
 				   &crc_win_update_fops);
-
-}
 #endif
+	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
+			    crtc, &amdgpu_current_bpc_fops);
+}
+
 /*
  * Writes DTN log state to the user supplied buffer.
  * Example usage: cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
index 3366cb644053..071200473c27 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
@@ -31,8 +31,6 @@
 
 void connector_debugfs_init(struct amdgpu_dm_connector *connector);
 void dtn_debugfs_init(struct amdgpu_device *adev);
-#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 void crtc_debugfs_init(struct drm_crtc *crtc);
-#endif
 
 #endif
-- 
2.35.1

