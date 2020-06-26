Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D81EF20BD0E
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 01:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3106E4F9;
	Fri, 26 Jun 2020 23:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3D56E4F4;
 Fri, 26 Jun 2020 23:11:17 +0000 (UTC)
IronPort-SDR: HsZweuVE1IitmLNLcwn4P8us8DE0DE9YrhaH/IB89Lq+Z2cQA2/FPuFvbH2wPux30l7mYjO/Xp
 oSPUKYIEe7dQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9664"; a="143740944"
X-IronPort-AV: E=Sophos;i="5.75,285,1589266800"; d="scan'208";a="143740944"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 16:11:15 -0700
IronPort-SDR: jI8pQgU4CmSZ0fL4vX7cyZJEguw7/FC/Rr04uHsPj3g0lcEcm0bCt/LlhjSXLOqf61Ew1Q99i3
 N4RE1PNpfPcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,285,1589266800"; d="scan'208";a="479972669"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2020 16:11:15 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4] Revert "drm/amd/display: Expose connector VRR range via
 debugfs"
Date: Fri, 26 Jun 2020 16:12:42 -0700
Message-Id: <20200626231242.15010-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
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
Cc: AMD gfx <amd-gfx@lists.freedesktop.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

v3:
* Rebase (Manasi)
v2:
* Rebase (Manasi)

As both VRR min and max are already part of drm_display_info,
drm can expose this VRR range for each connector.

Hence this logic should move to core DRM.

This reverts commit 727962f030c23422a01e8b22d0f463815fb15ec4.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: AMD gfx <amd-gfx@lists.freedesktop.org>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 1d692f4f42f3..b246354967bc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -820,24 +820,6 @@ static int output_bpc_show(struct seq_file *m, void *data)
 	return res;
 }
 
-/*
- * Returns the min and max vrr vfreq through the connector's debugfs file.
- * Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
- */
-static int vrr_range_show(struct seq_file *m, void *data)
-{
-	struct drm_connector *connector = m->private;
-	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
-
-	if (connector->status != connector_status_connected)
-		return -ENODEV;
-
-	seq_printf(m, "Min: %u\n", (unsigned int)aconnector->min_vfreq);
-	seq_printf(m, "Max: %u\n", (unsigned int)aconnector->max_vfreq);
-
-	return 0;
-}
-
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 /*
  * Returns the HDCP capability of the Display (1.4 for now).
@@ -1001,7 +983,6 @@ static ssize_t dp_dpcd_data_read(struct file *f, char __user *buf,
 DEFINE_SHOW_ATTRIBUTE(dmub_fw_state);
 DEFINE_SHOW_ATTRIBUTE(dmub_tracebuffer);
 DEFINE_SHOW_ATTRIBUTE(output_bpc);
-DEFINE_SHOW_ATTRIBUTE(vrr_range);
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 DEFINE_SHOW_ATTRIBUTE(hdcp_sink_capability);
 #endif
@@ -1058,7 +1039,6 @@ static const struct {
 		{"link_settings", &dp_link_settings_debugfs_fops},
 		{"phy_settings", &dp_phy_settings_debugfs_fop},
 		{"test_pattern", &dp_phy_test_pattern_fops},
-		{"vrr_range", &vrr_range_fops},
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 		{"hdcp_sink_capability", &hdcp_sink_capability_fops},
 #endif
-- 
2.19.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
