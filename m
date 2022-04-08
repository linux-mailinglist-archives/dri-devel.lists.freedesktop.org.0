Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719024F8EF9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 08:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A7110F72E;
	Fri,  8 Apr 2022 06:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F6F10F6B0;
 Fri,  8 Apr 2022 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649400964; x=1680936964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p9T8zrpe35Nae52kAiwGqClJ17030KLvJba4eJjBSqI=;
 b=SbZ6jXLW6NRWeVBN5MNhgbgRYsQwqdMy4x6Eljo8XpAQeaMEInLueDme
 wdFKOEds6XRCXOr4YE8uBX1J/CSuZ35Kcgx3Pj+lTvTdJAVhFdtFCOsEI
 kQqma7IfMLdL10Oc/Fb8Vm4fqq/xBOygweIQKk/Z2j/ogAm6ozimDhhla
 HFIUO97z+V2os2tCjU/XeaMhsn4G65CtPu3iTpKdSz2/b+ij7/s67NpAS
 OheZ65bsv5aw+pb4JYZCJpB1pxHTrJkcLyu11Ru0A4fbQskHTDfmS+Ifl
 mkF3SeNE+1o1Jn4gRLobGb6daAH1LxXqbzuAKvJ2qO8ku4Xmm1bbAfCYF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261219266"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="261219266"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 23:55:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="506457609"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 23:55:54 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Subject: [PATCH 2/3] drm/i915/display/debug: Expose crtc current bpc via
 debugfs
Date: Fri,  8 Apr 2022 12:23:49 +0530
Message-Id: <20220408065350.1485328-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
References: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
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

