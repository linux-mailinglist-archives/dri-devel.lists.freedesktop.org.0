Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E5209688
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 00:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314336E0BF;
	Wed, 24 Jun 2020 22:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50B46E0BF;
 Wed, 24 Jun 2020 22:47:17 +0000 (UTC)
IronPort-SDR: 3hM6xRQGfUTITa1Wf+FunBz92XOweOF8YgYdPysZ+O2Gd2HhfaeCkdQci8PONYJ1RR5bjA/pz5
 Xe3HAi2dD1oQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="132110826"
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="132110826"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 15:47:16 -0700
IronPort-SDR: fj7uCr4+gfgWjoptZ15jySUo2cniGrs/T2oY0+lwgvYz2LpARLRSx3s4nTeO7RDQNRfPjMHOzU
 lUWNyU1NgNTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="479437828"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga005.fm.intel.com with ESMTP; 24 Jun 2020 15:47:15 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] Revert "drm/amd/display: Expose connector VRR range
 via debugfs"
Date: Wed, 24 Jun 2020 15:48:30 -0700
Message-Id: <20200624224830.26093-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200622142519.16214-4-bhanuprakash.modem@intel.com>
References: <20200622142519.16214-4-bhanuprakash.modem@intel.com>
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
2.19.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
