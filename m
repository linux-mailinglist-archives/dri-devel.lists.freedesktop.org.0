Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48186B1B86
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 07:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FD410E7A7;
	Thu,  9 Mar 2023 06:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0AE10E7A7;
 Thu,  9 Mar 2023 06:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678343405; x=1709879405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wcUiNKCHLCVu4jOpkf5PLXYNbVFpWZxxXTB7L/9KxXs=;
 b=QB72cEXHB6kO8oE+Lx2V7SgMgxu4HXPNW6hNPpqKVgBOJT+NQYikwwnE
 zzxbqyBKRD4PpiLfSVYqA9OrawGLubahBitO+Aa/5XUkBMIsTCMezPTsk
 kSmn/j6j8HvhgiLL2+e8ZyXSL/ZLW4gSCUd8U/I+4O6t63uAdEw4kn2N6
 YdTGrwtIGThXvAdsTt6JUfBxbTgmpSLOJnvY+n99FeOcnn+flLs1Pq68s
 KzvycTSo7zaQ5d3+xz/6gDz/8hLoCbRDURa36xz6nixlo33dl+/mABwGY
 dM67Qa31a6ILlpAWh8Nsp0svYyVokH8dx6mr68TA9qwj3HHqxU68FCGcE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335070039"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="335070039"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 22:30:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006614924"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="1006614924"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 22:30:02 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/i915/dsc: Add debugfs entry to validate DSC output
 formats
Date: Thu,  9 Mar 2023 11:58:55 +0530
Message-Id: <20230309062855.393087-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309062855.393087-1-suraj.kandpal@intel.com>
References: <20230309062855.393087-1-suraj.kandpal@intel.com>
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
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Swati Sharma <swati2.sharma@intel.com>

DSC_Output_Format_Sink_Support entry is added to i915_dsc_fec_support_show
to depict if sink supports DSC output formats (RGB/YCbCr420/YCbCr444).
Also, new debugfs entry is created to enforce output format. This is
required because of our driver policy. For ex. if a mode is supported
in both RGB and YCbCr420 output formats by the sink, our policy is to
try RGB first and fall back to YCbCr420, if mode cannot be shown
using RGB. So, to test other output formats like YCbCr420 or YCbCr444,
we need a debugfs entry (force_dsc_output_format) to force this
output format.

v2: -Func name changed to intel_output_format_name() (Jani N)
    -Return forced o/p format from intel_dp_output_format() (Jani N)
v3: -output_format_str[] to remain static (Jani N)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_crtc_state_dump.c  |  4 +-
 .../drm/i915/display/intel_crtc_state_dump.h  |  2 +
 .../drm/i915/display/intel_display_debugfs.c  | 78 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  4 +
 5 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 766633566fd6..54c8adc0702e 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -123,7 +123,7 @@ static const char * const output_format_str[] = {
 	[INTEL_OUTPUT_FORMAT_YCBCR444] = "YCBCR4:4:4",
 };
 
-static const char *output_formats(enum intel_output_format format)
+const char *intel_output_format_name(enum intel_output_format format)
 {
 	if (format >= ARRAY_SIZE(output_format_str))
 		return "invalid";
@@ -181,7 +181,7 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 		    "active: %s, output_types: %s (0x%x), output format: %s\n",
 		    str_yes_no(pipe_config->hw.active),
 		    buf, pipe_config->output_types,
-		    output_formats(pipe_config->output_format));
+		    intel_output_format_name(pipe_config->output_format));
 
 	drm_dbg_kms(&i915->drm,
 		    "cpu_transcoder: %s, pipe bpp: %i, dithering: %i\n",
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.h b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.h
index 9399c35b7e5e..780f3f1190d7 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.h
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.h
@@ -8,9 +8,11 @@
 
 struct intel_crtc_state;
 struct intel_atomic_state;
+enum intel_output_format;
 
 void intel_crtc_state_dump(const struct intel_crtc_state *crtc_state,
 			   struct intel_atomic_state *state,
 			   const char *context);
+const char *intel_output_format_name(enum intel_output_format format);
 
 #endif /* __INTEL_CRTC_STATE_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 1e654ddd0815..fc2905574e5b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -12,6 +12,7 @@
 #include "i915_irq.h"
 #include "i915_reg.h"
 #include "intel_de.h"
+#include "intel_crtc_state_dump.h"
 #include "intel_display_debugfs.h"
 #include "intel_display_power.h"
 #include "intel_display_power_well.h"
@@ -1535,6 +1536,13 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
 			   str_yes_no(crtc_state->dsc.compression_enable));
 		seq_printf(m, "DSC_Sink_Support: %s\n",
 			   str_yes_no(drm_dp_sink_supports_dsc(intel_dp->dsc_dpcd)));
+		seq_printf(m, "DSC_Output_Format_Sink_Support: RGB: %s YCBCR420: %s YCBCR444: %s\n",
+			   str_yes_no(drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd,
+								      DP_DSC_RGB)),
+			   str_yes_no(drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd,
+								      DP_DSC_YCbCr420_Native)),
+			   str_yes_no(drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd,
+								      DP_DSC_YCbCr444)));
 		seq_printf(m, "Force_DSC_Enable: %s\n",
 			   str_yes_no(intel_dp->force_dsc_en));
 		if (!intel_dp_is_edp(intel_dp))
@@ -1660,6 +1668,73 @@ static const struct file_operations i915_dsc_bpc_fops = {
 	.write = i915_dsc_bpc_write
 };
 
+static int i915_dsc_output_format_show(struct seq_file *m, void *data)
+{
+	struct drm_connector *connector = m->private;
+	struct drm_device *dev = connector->dev;
+	struct drm_crtc *crtc;
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
+	crtc_state = to_intel_crtc_state(crtc->state);
+	seq_printf(m, "DSC_Output_Format: %s\n",
+		   intel_output_format_name(crtc_state->output_format));
+
+out:	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+
+	return ret;
+}
+
+static ssize_t i915_dsc_output_format_write(struct file *file,
+					    const char __user *ubuf,
+					    size_t len, loff_t *offp)
+{
+	struct drm_connector *connector =
+		((struct seq_file *)file->private_data)->private;
+	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+	int dsc_output_format = 0;
+	int ret;
+
+	ret = kstrtoint_from_user(ubuf, len, 0, &dsc_output_format);
+	if (ret < 0)
+		return ret;
+
+	intel_dp->force_dsc_output_format = dsc_output_format;
+	*offp += len;
+
+	return len;
+}
+
+static int i915_dsc_output_format_open(struct inode *inode,
+				       struct file *file)
+{
+	return single_open(file, i915_dsc_output_format_show, inode->i_private);
+}
+
+static const struct file_operations i915_dsc_output_format_fops = {
+	.owner = THIS_MODULE,
+	.open = i915_dsc_output_format_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.write = i915_dsc_output_format_write
+};
+
 /*
  * Returns the Current CRTC's bpc.
  * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/i915_current_bpc
@@ -1731,6 +1806,9 @@ void intel_connector_debugfs_add(struct intel_connector *intel_connector)
 
 		debugfs_create_file("i915_dsc_bpc", 0644, root,
 				    connector, &i915_dsc_bpc_fops);
+
+		debugfs_create_file("i915_dsc_output_format", 0644, root,
+				    connector, &i915_dsc_output_format_fops);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DSI ||
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c32bfba06ca1..59c0340d102b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1735,6 +1735,7 @@ struct intel_dp {
 
 	/* Display stream compression testing */
 	bool force_dsc_en;
+	int force_dsc_output_format;
 	int force_dsc_bpc;
 
 	bool hobl_failed;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b40bb5fd9abb..cdfec559d423 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -76,6 +76,7 @@
 #include "intel_tc.h"
 #include "intel_vdsc.h"
 #include "intel_vrr.h"
+#include "intel_crtc_state_dump.h"
 
 /* DP DSC throughput values used for slice count calculations KPixels/s */
 #define DP_DSC_PEAK_PIXEL_RATE			2720000
@@ -810,6 +811,9 @@ intel_dp_output_format(struct intel_connector *connector,
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 
+	if (intel_dp->force_dsc_output_format)
+		return intel_dp->force_dsc_output_format;
+
 	if (!connector->base.ycbcr_420_allowed || !ycbcr_420_output)
 		return INTEL_OUTPUT_FORMAT_RGB;
 
-- 
2.25.1

