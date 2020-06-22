Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F69202FBA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 08:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530D56E10C;
	Mon, 22 Jun 2020 06:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D056E08C;
 Mon, 22 Jun 2020 06:29:21 +0000 (UTC)
IronPort-SDR: rdAkhjes6paNYwDleUTTWPWi1S/u8i2RKkjzMMfwvNvLSy/ZwoJP4kWGWQZW1evNMquZUmIk/x
 BpXLnl6+JszQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="205153045"
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="205153045"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2020 23:29:21 -0700
IronPort-SDR: tlktYmtsMe6LFri9tEs5rWaoKPhpVS/hZrGQRO3IHDCK1jJd6i2tdpBa/0mxmNP1dUEemErjwf
 XEhlzvgdEbZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="300735626"
Received: from bhanu-nuc8i7beh.iind.intel.com ([10.145.162.210])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2020 23:29:20 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: bhanuprakash.modem@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [v1 3/3] Revert "drm/amd/display: Expose connector VRR range via
 debugfs"
Date: Mon, 22 Jun 2020 19:55:19 +0530
Message-Id: <20200622142519.16214-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200622142519.16214-1-bhanuprakash.modem@intel.com>
References: <20200622142519.16214-1-bhanuprakash.modem@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 076af267b488..71387d2af2ed 100644
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
@@ -1059,7 +1040,6 @@ static const struct {
 		{"phy_settings", &dp_phy_settings_debugfs_fop},
 		{"test_pattern", &dp_phy_test_pattern_fops},
 		{"output_bpc", &output_bpc_fops},
-		{"vrr_range", &vrr_range_fops},
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 		{"hdcp_sink_capability", &hdcp_sink_capability_fops},
 #endif
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
