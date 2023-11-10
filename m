Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595E7E7B4A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69A510E979;
	Fri, 10 Nov 2023 10:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAFF10E975;
 Fri, 10 Nov 2023 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699611393; x=1731147393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RBuWFyvVeIfDCRHhRsb1sEXTMjo6BGt6A96aMabR9vs=;
 b=NFC65+fnr4+L6rUlBCBtSCvdrYafIuIY1/Ows8ozVlAmnlamXBp/jMHG
 2oeXy2yGjv1beIXRGC4OeXy6io8D3ALuA5fx09g//e6hVMxF8kVp1YTm2
 P3qqI72Uc6JJ7zkmyAa2ZzFNuIlO3glivhIk4bg1TsSvpwIylF1PWyn5O
 sl3tQjxxRK4+4R7QuQJCjtemxT1tjsAqpq400NWcIEiOAb9TcSjJmxqQ3
 JbGNJqmXKPEJgN4i2pjZ2/nEzADBdL/llQg3rBfnIQ03w0BQWf9qb8ZME
 tqzvQTPGYP5pmnAZnNJKQ4QsoYOpBzgIHp+5du9/WBSvHLVujVyMZkn11 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11712826"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="11712826"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="4816421"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:30 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/11] drm/i915/dsc: Add debugfs entry to validate DSC
 fractional bpp
Date: Fri, 10 Nov 2023 15:40:16 +0530
Message-Id: <20231110101020.4067342-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, suraj.kandpal@intel.com,
 suijingfeng@loongson.cn, swati2.sharma@intel.com
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

v2:
Add drm_modeset_unlock to new line(Suraj)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 .../drm/i915/display/intel_display_debugfs.c  | 84 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  1 +
 2 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index f3700c18d685..915420d0cef8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1256,6 +1256,8 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
 								      DP_DSC_YCbCr420_Native)),
 			   str_yes_no(drm_dp_dsc_sink_supports_format(connector->dp.dsc_dpcd,
 								      DP_DSC_YCbCr444)));
+		seq_printf(m, "DSC_Sink_BPP_Precision: %d\n",
+			   drm_dp_dsc_sink_bpp_incr(connector->dp.dsc_dpcd));
 		seq_printf(m, "Force_DSC_Enable: %s\n",
 			   str_yes_no(intel_dp->force_dsc_en));
 		if (!intel_dp_is_edp(intel_dp))
@@ -1448,6 +1450,85 @@ static const struct file_operations i915_dsc_output_format_fops = {
 	.write = i915_dsc_output_format_write
 };
 
+static int i915_dsc_fractional_bpp_show(struct seq_file *m, void *data)
+{
+	struct drm_connector *connector = m->private;
+	struct drm_device *dev = connector->dev;
+	struct drm_crtc *crtc;
+	struct intel_dp *intel_dp;
+	struct intel_connector *intel_connector = to_intel_connector(connector);
+	struct intel_encoder *encoder = intel_attached_encoder(intel_connector);
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
+	intel_dp = intel_attached_dp(intel_connector);
+	seq_printf(m, "Force_DSC_Fractional_BPP_Enable: %s\n",
+		   str_yes_no(intel_dp->force_dsc_fractional_bpp_en));
+
+out:
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
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
@@ -1525,6 +1606,9 @@ void intel_connector_debugfs_add(struct intel_connector *intel_connector)
 
 		debugfs_create_file("i915_dsc_output_format", 0644, root,
 				    connector, &i915_dsc_output_format_fops);
+
+		debugfs_create_file("i915_dsc_fractional_bpp", 0644, root,
+				    connector, &i915_dsc_fractional_bpp_fops);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DSI ||
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 19e7e6e2e7a6..900515c30e73 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1811,6 +1811,7 @@ struct intel_dp {
 	/* Display stream compression testing */
 	bool force_dsc_en;
 	int force_dsc_output_format;
+	bool force_dsc_fractional_bpp_en;
 	int force_dsc_bpc;
 
 	bool hobl_failed;
-- 
2.40.1

