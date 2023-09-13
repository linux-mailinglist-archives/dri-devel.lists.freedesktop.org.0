Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA1879DFBB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 08:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826F610E45C;
	Wed, 13 Sep 2023 06:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2853F10E304;
 Wed, 13 Sep 2023 06:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694585517; x=1726121517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cGyWegQ4ujDYiMNAhW9bhu0wiGMVXKbeykuqabb1xD0=;
 b=eW7b8IAXhZS3IsBnH5J2brMDRmokoUgifRv2RDClbUAmIvkVswC0TI8M
 I5DTUh7oQ/66RmLFJ6Zglc3whBk/po/qPl+t9Rbw2sXIdiS0n0FgNUYVc
 qZtczE5F1/vmzGiyOyc3528R1gV1hOJScW542MELPQyfS2f54DqrbTSfO
 OdMvbqbqF+P+9S6Baqo8GeWSOCG/zX/vJl9zSoK/bvNaxLIIqkHhmm5eF
 egPEbKQSkbJrYluog9PdjyqypK4GQ4M8YdspSvpnEk6wA8DZG/2nlUSJR
 oBefiZ4vBggRrv1ISY1H5xAqp81X9gombpzjrAAMuohOaGIDS7pce18kT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377482586"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="377482586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 23:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="693741761"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="693741761"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orsmga003.jf.intel.com with ESMTP; 12 Sep 2023 23:11:44 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/8] drm/i915/dsc: Add debugfs entry to validate DSC
 fractional bpp
Date: Wed, 13 Sep 2023 11:36:05 +0530
Message-Id: <20230913060606.1105349-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 ankit.k.nautiyal@intel.com, swati2.sharma@intel.com
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
---
 .../drm/i915/display/intel_display_debugfs.c  | 83 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  1 +
 2 files changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index f05b52381a83..776ab96def1f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1244,6 +1244,8 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
 								      DP_DSC_YCbCr420_Native)),
 			   str_yes_no(drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd,
 								      DP_DSC_YCbCr444)));
+		seq_printf(m, "DSC_Sink_BPP_Precision: %d\n",
+			   drm_dp_dsc_sink_bpp_incr(intel_dp->dsc_dpcd));
 		seq_printf(m, "Force_DSC_Enable: %s\n",
 			   str_yes_no(intel_dp->force_dsc_en));
 		if (!intel_dp_is_edp(intel_dp))
@@ -1436,6 +1438,84 @@ static const struct file_operations i915_dsc_output_format_fops = {
 	.write = i915_dsc_output_format_write
 };
 
+static int i915_dsc_fractional_bpp_show(struct seq_file *m, void *data)
+{
+	struct drm_connector *connector = m->private;
+	struct drm_device *dev = connector->dev;
+	struct drm_crtc *crtc;
+	struct intel_dp *intel_dp;
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
@@ -1513,6 +1593,9 @@ void intel_connector_debugfs_add(struct intel_connector *intel_connector)
 
 		debugfs_create_file("i915_dsc_output_format", 0644, root,
 				    connector, &i915_dsc_output_format_fops);
+
+		debugfs_create_file("i915_dsc_fractional_bpp", 0644, root,
+				    connector, &i915_dsc_fractional_bpp_fops);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DSI ||
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 69bcabec4a29..27b31cb4c7b4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1797,6 +1797,7 @@ struct intel_dp {
 	/* Display stream compression testing */
 	bool force_dsc_en;
 	int force_dsc_output_format;
+	bool force_dsc_fractional_bpp_en;
 	int force_dsc_bpc;
 
 	bool hobl_failed;
-- 
2.25.1

