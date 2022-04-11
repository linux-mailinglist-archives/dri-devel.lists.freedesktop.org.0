Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3BE4FB89C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C0C10EEA7;
	Mon, 11 Apr 2022 09:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFEF10EEA7;
 Mon, 11 Apr 2022 09:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670823; x=1681206823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p9T8zrpe35Nae52kAiwGqClJ17030KLvJba4eJjBSqI=;
 b=nm3guUKtyYQd/mAp9pfgcQyjBk3ezV478vErC+7YkghGmB8uPHAUS5h9
 UQDDaoXbd2ILBZDPkzzFbfm25ow6lJVmE4tv3v15BwfvvwIgr/aCk3gtM
 ZTQQlgM5thrrS+X78rrepTZzyD2VRf2VlB4nK4Nz3cEGBZUIYavGSXdnx
 633XoRA5DagXn7tTrtGv01GiSqBFmaMq2zlbA2+J3c2P86Wvh2C2HTB/w
 D+ADESOi34bNy+V7oWA6Npl5ThAjrUC3XtA4QTL+/zDexAYoG+7K7eHGp
 xgT9Sm1eFC0e7oBUFls6pLhV4+VRjuloCEwXlZS2IseXVpAVjMpbs782S w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="259673793"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="259673793"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:53:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="659985343"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:53:39 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Subject: [V2 2/3] drm/i915/display/debug: Expose crtc current bpc via debugfs
Date: Mon, 11 Apr 2022 15:21:28 +0530
Message-Id: <20220411095129.1652096-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This new debugfs will expose the currently using bpc by crtc.
It is very useful for verifying whether we enter the correct
output color depth from IGT.

This patch will also add the connector's max supported bpc to
"i915_display_info" debugfs.

Example:
cat /sys/kernel/debug/dri/0/crtc-0/i915_current_bpc
Current: 8

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 452d773fd4e3..6c3954479047 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -590,6 +590,8 @@ static void intel_connector_info(struct seq_file *m,
 	seq_puts(m, "\tHDCP version: ");
 	intel_hdcp_info(m, intel_connector);
 
+	seq_printf(m, "\tmax bpc: %u\n", connector->display_info.bpc);
+
 	intel_panel_info(m, intel_connector);
 
 	seq_printf(m, "\tmodes:\n");
@@ -2202,6 +2204,29 @@ static const struct file_operations i915_dsc_bpp_fops = {
 	.write = i915_dsc_bpp_write
 };
 
+/*
+ * Returns the Current CRTC's bpc.
+ * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/i915_current_bpc
+ */
+static int i915_current_bpc_show(struct seq_file *m, void *data)
+{
+	struct intel_crtc *crtc = to_intel_crtc(m->private);
+	struct intel_crtc_state *crtc_state;
+	int ret;
+
+	ret = drm_modeset_lock_single_interruptible(&crtc->base.mutex);
+	if (ret)
+		return ret;
+
+	crtc_state = to_intel_crtc_state(crtc->base.state);
+	seq_printf(m, "Current: %u\n", crtc_state->pipe_bpp / 3);
+
+	drm_modeset_unlock(&crtc->base.mutex);
+
+	return ret;
+}
+DEFINE_SHOW_ATTRIBUTE(i915_current_bpc);
+
 /**
  * intel_connector_debugfs_add - add i915 specific connector debugfs files
  * @connector: pointer to a registered drm_connector
@@ -2272,4 +2297,7 @@ void intel_crtc_debugfs_add(struct drm_crtc *crtc)
 
 	crtc_updates_add(crtc);
 	intel_fbc_crtc_debugfs_add(to_intel_crtc(crtc));
+
+	debugfs_create_file("i915_current_bpc", 0444, crtc->debugfs_entry, crtc,
+			    &i915_current_bpc_fops);
 }
-- 
2.35.1

