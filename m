Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12810674B0A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F4D10EA3A;
	Fri, 20 Jan 2023 04:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0159E10EA35;
 Fri, 20 Jan 2023 04:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189754; x=1705725754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aa18igxwrlQtzhVl5VRJyDXyPNbmo5y+wzQK3bKprYA=;
 b=Q/qeVhRf+QmvCBMcRi6rV3sPXmUdmSg9vIABqihHO8EPcsku7iJF2vTq
 fFFmi/6M1mrFbIhh07TeEsauzZ3vaj/YrvofJt1ZFb1aH4Rxd9E4STGMO
 ZW1DFJJEakpZ/ENdPx+Hwwy6JGyYItAJn2IXeCYprOmQEHh8z1e22VOCZ
 gCJz/shd2gWek3PzrMNAbXCuH8ZhsS6Ixo2tE0YTtY4H5EhPg4LGQO5zj
 SRnx73LvxJa9VLflJN+jXF4Q/ooKg/JR1/SpF97b67s78Woxrqkgm1fsh
 VuGlnaeJLXDQl3dvgtTOH3SrtNnAlv10f5Q2Z+cG5b8Yu3fhb4WGiKMOp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195608"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195608"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692735095"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692735095"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:31 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 15/16] drm/i915/dsc: Add debugfs entry to validate DSC
 fractional bpp
Date: Fri, 20 Jan 2023 10:08:43 +0530
Message-Id: <20230120043844.3761895-16-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Swati Sharma <swati2.sharma@intel.com>

DSC_Sink_BPP_Precision entry is added to i915_dsc_fec_support_show
to depict sink's precision.
Also, new debugfs entry is created to enforce fractional bpp.
If Force_DSC_Fractional_BPP_en is set then while iterating over
output bpp with fractional step size we will continue if output_bpp is
computed as integer. With this approach, we will be able to validate
DSC with fractional bpp.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  | 84 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  1 +
 2 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 7bcd90384a46..2b36ec812293 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1772,6 +1772,8 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
 			   str_yes_no(drm_dp_sink_supports_dsc(intel_dp->dsc_dpcd)));
 		seq_printf(m, "Force_DSC_Enable: %s\n",
 			   str_yes_no(intel_dp->force_dsc_en));
+		seq_printf(m, "DSC_Sink_BPP_Precision: %d\n",
+			   drm_dp_dsc_sink_bpp_incr(intel_dp->dsc_dpcd));
 		if (!intel_dp_is_edp(intel_dp))
 			seq_printf(m, "FEC_Sink_Support: %s\n",
 				   str_yes_no(drm_dp_sink_supports_fec(intel_dp->fec_capable)));
@@ -1895,6 +1897,85 @@ static const struct file_operations i915_dsc_bpc_fops = {
 	.write = i915_dsc_bpc_write
 };
 
+static int i915_dsc_fractional_bpp_show(struct seq_file *m, void *data)
+{
+	struct drm_connector *connector = m->private;
+	struct drm_device *dev = connector->dev;
+	struct drm_crtc *crtc;
+	struct intel_dp *intel_dp;
+	struct intel_crtc_state *crtc_state;
+	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
+	int ret;
+
+	if (!encoder)
+		return -ENODEV;
+
+	ret = drm_modeset_lock_single_interruptible(&dev->mode_config.connection_mutex);
+	if (ret)
+		return ret;
+
+	crtc = connector->state->crtc;
+	if (connector->status != connector_status_connected || !crtc) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	intel_dp = intel_attached_dp(to_intel_connector(connector));
+	crtc_state = to_intel_crtc_state(crtc->state);
+	seq_printf(m, "Force_DSC_Fractional_BPP_Enable: %s\n",
+		   str_yes_no(intel_dp->force_dsc_fractional_bpp_en));
+
+out:	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+
+	return ret;
+}
+
+static ssize_t i915_dsc_fractional_bpp_write(struct file *file,
+					     const char __user *ubuf,
+					     size_t len, loff_t *offp)
+{
+	struct drm_connector *connector =
+		((struct seq_file *)file->private_data)->private;
+	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
+	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+	bool dsc_fractional_bpp_enable = false;
+	int ret;
+
+	if (len == 0)
+		return 0;
+
+	drm_dbg(&i915->drm,
+		"Copied %zu bytes from user to force fractional bpp for DSC\n", len);
+
+	ret = kstrtobool_from_user(ubuf, len, &dsc_fractional_bpp_enable);
+	if (ret < 0)
+		return ret;
+
+	drm_dbg(&i915->drm, "Got %s for DSC Fractional BPP Enable\n",
+		(dsc_fractional_bpp_enable) ? "true" : "false");
+	intel_dp->force_dsc_fractional_bpp_en = dsc_fractional_bpp_enable;
+
+	*offp += len;
+
+	return len;
+}
+
+static int i915_dsc_fractional_bpp_open(struct inode *inode,
+					struct file *file)
+{
+	return single_open(file, i915_dsc_fractional_bpp_show, inode->i_private);
+}
+
+static const struct file_operations i915_dsc_fractional_bpp_fops = {
+	.owner = THIS_MODULE,
+	.open = i915_dsc_fractional_bpp_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.write = i915_dsc_fractional_bpp_write
+};
+
 /*
  * Returns the Current CRTC's bpc.
  * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/i915_current_bpc
@@ -1966,6 +2047,9 @@ void intel_connector_debugfs_add(struct intel_connector *intel_connector)
 
 		debugfs_create_file("i915_dsc_bpc", 0644, root,
 				    connector, &i915_dsc_bpc_fops);
+
+		debugfs_create_file("i915_dsc_fractional_bpp", 0644, root,
+				    connector, &i915_dsc_fractional_bpp_fops);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DSI ||
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e879a9483148..1c5930d78749 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1737,6 +1737,7 @@ struct intel_dp {
 
 	/* Display stream compression testing */
 	bool force_dsc_en;
+	bool force_dsc_fractional_bpp_en;
 	int force_dsc_bpc;
 
 	bool hobl_failed;
-- 
2.25.1

