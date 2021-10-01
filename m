Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64BB41F0E8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B966EE1C;
	Fri,  1 Oct 2021 15:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F4A6EE1C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 15:13:02 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id b16so9233722qtt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 08:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aS8Ttbpk/y0A79nbsqCPQ/2cLHWIrqPVhcDRQjza9yI=;
 b=HrsJBkn7/HzZHSTO9dSW1zGj91MXv0m7A1vr3QtRCzc0/2cFiYarApDTYJrL57N1Z2
 ZZcJw9KosrMCOXF0wdQcqPPDkq3gpXV8o27nRfA8RyEdlNkkg/MBVGEJKSc4HbAPkMgI
 g51ubdwFqL1AiCDS3X79tQnxRrYimDEpMQ1l3b+O3KjKUFsKUvT1ajULHgeuY4ALq09v
 Gg2swhODS3Ejkdf6R8dlHXXIUdPTqCXIeAQFwMVoBCF8hFAEa5Keo6IgkSSKFQbKZfOl
 aNj/LtBxdHeiD/ov9Aw7Zdqey54zxxR684YX2Qg18Y2/lYE4GtnQlupVRQrUFnbyja08
 c9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aS8Ttbpk/y0A79nbsqCPQ/2cLHWIrqPVhcDRQjza9yI=;
 b=mNvLKtU5IZoJuazkflJxDXgQxKIJmydG4FsrrStGQ2MzAAxZrbLNf2vN+vJuvMuqzt
 jGVUQzCPgwm16xsB7ppSgJKpgY+vT3YFxZoSv42yc0mIh/IN7EpkUFTmwIkA1VZMjlTm
 dz/GYyuCssYfj454aydsafCU7HIGJr33y48T3Fu35HxihMhSf06up+Wg52HS7GqSwMku
 H5niWnIQHOE51nUAZh32jL/tv91b907Hyxj70q1mSXz0mATm1hVeMKFpfpTg/UXySeTp
 Ss1Xty0jjZJBFqzsoZ7UzwPNDbYWM6eW1omaLTlCjipEF/uiTrq3Jt6t1d85faafZx1K
 Lvsw==
X-Gm-Message-State: AOAM531qVglhnEDW6T02Q5oKoGGK2Khr2tOy0rb7te1vl5wRmh7PTIwP
 LHlsXblNHQMk0Er8KtI/AfFO9i2+at1K5g==
X-Google-Smtp-Source: ABdhPJyF0d8zHDSOjIJkU//+8vsJC78LwvkBJ+yftx5dxWh+GFqSUhLHpi/aH2mVZ96b0qclq/6IFQ==
X-Received: by 2002:ac8:1e06:: with SMTP id n6mr13584198qtl.280.1633101181256; 
 Fri, 01 Oct 2021 08:13:01 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id l7sm3638271qtr.87.2021.10.01.08.13.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Oct 2021 08:13:00 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, jani.nikula@linux.intel.com,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 14/14] drm/msm: Implement HDCP 1.x using the new drm HDCP
 helpers
Date: Fri,  1 Oct 2021 11:11:43 -0400
Message-Id: <20211001151145.55916-15-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211001151145.55916-1-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds HDCP 1.x support to msm DP connectors using the new HDCP
helpers.

Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2

Changes in v2:
-Squash [1] into this patch with the following changes (Stephen)
  -Update the sc7180 dtsi file
  -Remove resource names and just use index (Stephen)
Changes in v3:
-Split out the dtsi change from v2 (Stephen)
-Fix set-but-unused warning identified by 0-day
-Fix up a couple of style nits (Stephen)
-Store HDCP key directly in dp_hdcp struct (Stephen)
-Remove wmb in HDCP key initialization, move an_seed (Stephen)
-Use FIELD_PREP for bstatus/bcaps (Stephen)
-#define read_poll_timeout values (Stephen)
-Remove unnecessary parentheses in dp_hdcp_store_ksv_fifo (Stephen)
-Add compatible string for hdcp (Stephen)
-Rename dp_hdcp_write_* functions (Abhinav)
-Add 1us delay between An reads (Abhinav)
-Delete unused dp_hdcp_read_* functions

[1] https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-14-sean@poorly.run
---
 drivers/gpu/drm/msm/Makefile        |   1 +
 drivers/gpu/drm/msm/dp/dp_debug.c   |  46 ++-
 drivers/gpu/drm/msm/dp/dp_debug.h   |   6 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  47 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |   5 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  68 ++++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |   5 +
 drivers/gpu/drm/msm/dp/dp_hdcp.c    | 445 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_hdcp.h    |  27 ++
 drivers/gpu/drm/msm/dp/dp_parser.c  |  23 +-
 drivers/gpu/drm/msm/dp/dp_parser.h  |   4 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  44 ++-
 drivers/gpu/drm/msm/msm_atomic.c    |  15 +
 13 files changed, 717 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 904535eda0c4..98731fd262d6 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -109,6 +109,7 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
+	dp/dp_hdcp.o \
 	dp/dp_hpd.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f6247e80e9d..25dc55b5f083 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -8,6 +8,7 @@
 #include <linux/debugfs.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_file.h>
+#include <drm/drm_hdcp.h>
 
 #include "dp_parser.h"
 #include "dp_catalog.h"
@@ -15,6 +16,7 @@
 #include "dp_ctrl.h"
 #include "dp_debug.h"
 #include "dp_display.h"
+#include "dp_hdcp.h"
 
 #define DEBUG_NAME "msm_dp"
 
@@ -24,6 +26,7 @@ struct dp_debug_private {
 	struct dp_usbpd *usbpd;
 	struct dp_link *link;
 	struct dp_panel *panel;
+	struct dp_hdcp *hdcp;
 	struct drm_connector **connector;
 	struct device *dev;
 	struct drm_device *drm_dev;
@@ -349,6 +352,35 @@ static int dp_test_active_open(struct inode *inode,
 			inode->i_private);
 }
 
+static ssize_t dp_hdcp_key_write(struct file *file, const char __user *ubuf,
+				 size_t len, loff_t *offp)
+{
+	char *input_buffer;
+	int ret;
+	struct dp_debug_private *debug = file->private_data;
+
+	if (len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN))
+		return -EINVAL;
+
+	if (!debug->hdcp)
+		return -ENOENT;
+
+	input_buffer = memdup_user_nul(ubuf, len);
+	if (IS_ERR(input_buffer))
+		return PTR_ERR(input_buffer);
+
+	ret = dp_hdcp_ingest_key(debug->hdcp, input_buffer, len);
+
+	kfree(input_buffer);
+	if (ret < 0) {
+		DRM_ERROR("Could not ingest HDCP key, ret=%d\n", ret);
+		return ret;
+	}
+
+	*offp += len;
+	return len;
+}
+
 static const struct file_operations dp_debug_fops = {
 	.open = simple_open,
 	.read = dp_debug_read_info,
@@ -363,6 +395,12 @@ static const struct file_operations test_active_fops = {
 	.write = dp_test_active_write
 };
 
+static const struct file_operations dp_hdcp_key_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = dp_hdcp_key_write,
+};
+
 static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 {
 	int rc = 0;
@@ -384,6 +422,10 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 			minor->debugfs_root,
 			debug, &dp_test_type_fops);
 
+	debugfs_create_file("msm_dp_hdcp_key", 0222,
+			minor->debugfs_root,
+			debug, &dp_hdcp_key_fops);
+
 	debug->root = minor->debugfs_root;
 
 	return rc;
@@ -391,7 +433,8 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector, struct drm_minor *minor)
+		struct dp_hdcp *hdcp, struct drm_connector **connector,
+		struct drm_minor *minor)
 {
 	int rc = 0;
 	struct dp_debug_private *debug;
@@ -413,6 +456,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	debug->usbpd = usbpd;
 	debug->link = link;
 	debug->panel = panel;
+	debug->hdcp = hdcp;
 	debug->dev = dev;
 	debug->drm_dev = minor->dev;
 	debug->connector = connector;
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 7eaedfbb149c..c4481339c0c5 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -6,6 +6,7 @@
 #ifndef _DP_DEBUG_H_
 #define _DP_DEBUG_H_
 
+#include "dp_hdcp.h"
 #include "dp_panel.h"
 #include "dp_link.h"
 
@@ -43,7 +44,7 @@ struct dp_debug {
  */
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector,
+		struct dp_hdcp *hdcp, struct drm_connector **connector,
 		struct drm_minor *minor);
 
 /**
@@ -60,7 +61,8 @@ void dp_debug_put(struct dp_debug *dp_debug);
 static inline
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector, struct drm_minor *minor)
+		struct dp_hdcp *hdcp, struct drm_connector **connector,
+		struct drm_minor *minor)
 {
 	return ERR_PTR(-EINVAL);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 19946024e235..e62bac306da5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -26,6 +26,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_hdcp.h"
 
 static struct msm_dp *g_dp_display;
 #define HPD_STRING_SIZE 30
@@ -96,6 +97,7 @@ struct dp_display_private {
 	struct dp_panel   *panel;
 	struct dp_ctrl    *ctrl;
 	struct dp_debug   *debug;
+	struct dp_hdcp	  *hdcp;
 
 	struct dp_usbpd_cb usbpd_cb;
 	struct dp_display_mode dp_mode;
@@ -118,9 +120,19 @@ struct dp_display_private {
 
 static const struct of_device_id dp_dt_match[] = {
 	{.compatible = "qcom,sc7180-dp"},
+	{.compatible = "qcom,sc7180-dp-hdcp"},
 	{}
 };
 
+struct dp_hdcp *dp_display_connector_to_hdcp(struct drm_connector *connector)
+{
+	struct msm_dp *dp_display = msm_dp_from_connector(connector);
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	return dp->hdcp;
+}
+
 static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
 						u32 data, u32 delay)
 {
@@ -714,6 +726,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
 	dp_debug_put(dp->debug);
+	dp_hdcp_put(dp->hdcp);
 	dp_audio_put(dp->audio);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
@@ -810,8 +823,18 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
+	dp->hdcp = dp_hdcp_get(dp->parser, dp->aux);
+	if (IS_ERR(dp->hdcp)) {
+		rc = PTR_ERR(dp->hdcp);
+		DRM_ERROR("failed to initialize hdcp, rc = %d\n", rc);
+		dp->hdcp = NULL;
+		goto error_hdcp;
+	}
+
 	return rc;
 
+error_hdcp:
+	dp_audio_put(dp->audio);
 error_ctrl:
 	dp_panel_put(dp->panel);
 error_link:
@@ -930,6 +953,16 @@ int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 	return 0;
 }
 
+void dp_display_hdcp_commit(struct msm_dp *dp, struct drm_atomic_state *state)
+{
+	struct dp_display_private *dp_display;
+
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
+
+	if (dp_display->hdcp)
+		dp_hdcp_commit(dp_display->hdcp, state);
+}
+
 int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
 {
 	const u32 num_components = 3, default_bpp = 24;
@@ -1429,8 +1462,8 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	dev = &dp->pdev->dev;
 
 	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
-					dp->link, &dp->dp_display.connector,
-					minor);
+					dp->link, dp->hdcp,
+					&dp->dp_display.connector, minor);
 	if (IS_ERR(dp->debug)) {
 		rc = PTR_ERR(dp->debug);
 		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
@@ -1441,12 +1474,16 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
+	struct dp_display_private *dp_display_priv;
 	struct msm_drm_private *priv;
 	int ret;
 
 	if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
 		return -EINVAL;
 
+	dp_display_priv = container_of(dp_display, struct dp_display_private,
+				       dp_display);
+
 	priv = dev->dev_private;
 	dp_display->drm_dev = dev;
 
@@ -1467,6 +1504,12 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 		return ret;
 	}
 
+	ret = dp_hdcp_attach(dp_display_priv->hdcp, dp_display->connector);
+	if (ret) {
+		DRM_ERROR("Failed to attach hdcp, ret=%d\n", ret);
+		return ret;
+	}
+
 	priv->connectors[priv->num_connectors++] = dp_display->connector;
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 8b47cdabb67e..421268e47f30 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -27,8 +27,13 @@ struct msm_dp {
 	struct dp_audio *dp_audio;
 };
 
+struct drm_atomic_state;
+
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev);
+struct dp_hdcp *dp_display_connector_to_hdcp(struct drm_connector *connector);
+void dp_display_hdcp_commit(struct msm_dp *dp_display,
+			    struct drm_atomic_state *state);
 int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
 int dp_display_get_modes(struct msm_dp *dp_display,
 		struct dp_display_mode *dp_mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 764f4b81017e..8e62558b4fc3 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -5,11 +5,20 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_hdcp.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "dp_drm.h"
+#include "dp_hdcp.h"
+
+struct dp_connector_state {
+	struct drm_connector_state base;
+	bool hdcp_transition;
+};
+#define to_dp_connector_state(x) container_of(x, struct dp_connector_state, base)
 
 struct dp_connector {
 	struct drm_connector base;
@@ -17,6 +26,11 @@ struct dp_connector {
 };
 #define to_dp_connector(x) container_of(x, struct dp_connector, base)
 
+struct msm_dp *msm_dp_from_connector(struct drm_connector *connector)
+{
+	return to_dp_connector(connector)->dp_display;
+}
+
 /**
  * dp_connector_detect - callback to determine if connector is connected
  * @conn: Pointer to drm connector structure
@@ -114,20 +128,72 @@ static enum drm_mode_status dp_connector_mode_valid(
 	return dp_display_validate_mode(dp_disp, mode->clock);
 }
 
+static int dp_connector_atomic_check(struct drm_connector *connector,
+				     struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state;
+	struct dp_connector_state *dp_state;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	dp_state = to_dp_connector_state(conn_state);
+
+	dp_state->hdcp_transition = drm_hdcp_atomic_check(connector, state);
+
+	return 0;
+}
+
+static struct drm_connector_state *
+dp_connector_atomic_duplicate_state(struct drm_connector *connector)
+{
+	struct dp_connector_state *state;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	state->hdcp_transition = false;
+
+	__drm_atomic_helper_connector_duplicate_state(connector, &state->base);
+	return &state->base;
+}
+
 static const struct drm_connector_funcs dp_connector_funcs = {
 	.detect = dp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_duplicate_state = dp_connector_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
 	.get_modes = dp_connector_get_modes,
 	.mode_valid = dp_connector_mode_valid,
+	.atomic_check = dp_connector_atomic_check,
 };
 
+bool dp_drm_is_connector_msm_dp(struct drm_connector *connector)
+{
+	return connector->funcs == &dp_connector_funcs;
+}
+
+void dp_drm_atomic_commit(struct drm_connector *connector,
+			  struct drm_connector_state *conn_state,
+			  struct drm_atomic_state *state)
+{
+	struct dp_connector_state *dp_state;
+	struct msm_dp *dp_disp;
+
+	dp_state = to_dp_connector_state(conn_state);
+
+	if (!dp_state->hdcp_transition)
+		return;
+
+	dp_disp = msm_dp_from_connector(connector);
+
+	dp_display_hdcp_commit(dp_disp, state);
+}
+
 /* connector initialization */
 struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index c27bfceefdf0..a5d95c6acd67 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -14,5 +14,10 @@
 #include "dp_display.h"
 
 struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display);
+struct msm_dp *msm_dp_from_connector(struct drm_connector *connector);
+bool dp_drm_is_connector_msm_dp(struct drm_connector *connector);
+void dp_drm_atomic_commit(struct drm_connector *connector,
+			  struct drm_connector_state *conn_state,
+			  struct drm_atomic_state *state);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.c b/drivers/gpu/drm/msm/dp/dp_hdcp.c
new file mode 100644
index 000000000000..49bd4d2b46d8
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_hdcp.c
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (C) 2021 Google, Inc.
+ *
+ * Authors:
+ * Sean Paul <seanpaul@chromium.org>
+ */
+
+#include "dp_display.h"
+#include "dp_drm.h"
+#include "dp_hdcp.h"
+#include "dp_reg.h"
+
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+#include <drm/drm_dp_helper.h>
+#include <drm/drm_hdcp.h>
+#include <drm/drm_print.h>
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+#include <linux/slab.h>
+
+/* Offsets based on hdcp_ksv mmio */
+#define DP_HDCP_KSV_AN_LSB			0x0
+#define DP_HDCP_KSV_AN_MSB			0x4
+#define DP_HDCP_KSV_AKSV_MSB			0x1D8
+#define DP_HDCP_KSV_AKSV_LSB			0x1DC
+
+/* Key offsets based on hdcp_key mmio */
+#define DP_HDCP_KEY_BASE			0x30
+#define  DP_HDCP_KEY_MSB(x) 			(DP_HDCP_KEY_BASE + (x * 8))
+#define  DP_HDCP_KEY_LSB(x) 			(DP_HDCP_KEY_MSB(x) + 4)
+#define DP_HDCP_KEY_VALID			0x170
+#define  DP_HDCP_SW_KEY_VALID			BIT(0)
+
+/* Timeouts */
+#define DP_KEYS_VALID_SLEEP_US			(20 * 1000)
+#define DP_KEYS_VALID_TIMEOUT_US		(100 * 1000)
+#define DP_AN_READY_SLEEP_US			100
+#define DP_AN_READY_TIMEOUT_US			(10 * 1000)
+#define DP_R0_READY_SLEEP_US			100
+#define DP_R0_READY_TIMEOUT_US			(10 * 1000)
+#define DP_RI_MATCH_SLEEP_US			(20 * 1000)
+#define DP_RI_MATCH_TIMEOUT_US			(100 * 1000)
+#define DP_KSV_WRITTEN_SLEEP_US			100
+#define DP_KSV_WRITTEN_TIMEOUT_US		(100 * 1000)
+#define DP_SHA_COMPUTATION_SLEEP_US		100
+#define DP_SHA_COMPUTATION_TIMEOUT_US		(100 * 1000)
+#define DP_AN_READ_DELAY_US			1
+
+/*
+ * dp_hdcp_key - structure which contains an HDCP key set
+ * @ksv: The key selection vector
+ * @keys: Contains 40 keys
+ */
+struct dp_hdcp_key {
+	struct drm_hdcp_ksv ksv;
+	union {
+		u32 words[2];
+		u8 bytes[DP_HDCP_KEY_LEN];
+	} keys[DP_HDCP_NUM_KEYS];
+	bool valid;
+};
+
+struct dp_hdcp {
+	struct drm_device *dev;
+	struct drm_connector *connector;
+
+	struct drm_dp_aux *aux;
+	struct dp_parser *parser;
+
+	struct drm_hdcp_helper_data *helper_data;
+
+	struct mutex key_lock;
+	struct dp_hdcp_key key;
+};
+
+static inline void dp_hdcp_write_dp(struct dp_hdcp *hdcp, u32 offset, u32 val)
+{
+	writel(val, hdcp->parser->io.dp_controller.base + offset);
+}
+
+static inline u32 dp_hdcp_read_dp(struct dp_hdcp *hdcp, u32 offset)
+{
+	return readl(hdcp->parser->io.dp_controller.base + offset);
+}
+
+static inline void dp_hdcp_write_tz(struct dp_hdcp *hdcp, u32 offset, u32 val)
+{
+	writel(val, hdcp->parser->io.hdcp_key.base + offset);
+}
+
+static inline void dp_hdcp_write_tz_hlos(struct dp_hdcp *hdcp, u32 offset,
+					 u32 val)
+{
+	writel(val, hdcp->parser->io.hdcp_tz.base + offset);
+}
+
+int dp_hdcp_ingest_key(struct dp_hdcp *hdcp, const u8 *raw_key, int raw_len)
+{
+	unsigned int ksv_weight;
+	int i, ret = 0;
+
+	if (raw_len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN)) {
+		DRM_ERROR("Invalid HDCP key length expected=%d actual=%d\n",
+			  (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN),
+			  raw_len);
+		return -EINVAL;
+	}
+
+	mutex_lock(&hdcp->key_lock);
+
+	memcpy(hdcp->key.ksv.bytes, raw_key, DRM_HDCP_KSV_LEN);
+	ksv_weight = hweight32(hdcp->key.ksv.words[0]) +
+		     hweight32(hdcp->key.ksv.words[1]);
+	if (ksv_weight != 20) {
+		DRM_ERROR("Invalid ksv weight, expected=20 actual=%d\n",
+			  ksv_weight);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	raw_key += DRM_HDCP_KSV_LEN;
+	for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
+		memcpy(hdcp->key.keys[i].bytes, raw_key, DP_HDCP_KEY_LEN);
+		raw_key += DP_HDCP_KEY_LEN;
+	}
+
+	DRM_DEBUG_DRIVER("Successfully ingested HDCP key\n");
+	hdcp->key.valid = true;
+
+out:
+	mutex_unlock(&hdcp->key_lock);
+	return ret;
+}
+
+static bool dp_hdcp_are_keys_valid(struct drm_connector *connector)
+{
+	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
+	u32 val;
+
+	val = dp_hdcp_read_dp(hdcp, DP_HDCP_STATUS);
+	return FIELD_GET(DP_HDCP_KEY_STATUS, val) == DP_HDCP_KEY_STATUS_VALID;
+}
+
+static int dp_hdcp_load_keys(struct drm_connector *connector)
+{
+	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
+	int i, ret = 0;
+	u64 an_seed = get_random_u64();
+
+	mutex_lock(&hdcp->key_lock);
+
+	if (!hdcp->key.valid) {
+		ret = -ENOENT;
+		goto out;
+	}
+
+	dp_hdcp_write_dp(hdcp, DP_HDCP_SW_LOWER_AKSV, hdcp->key.ksv.words[0]);
+	dp_hdcp_write_dp(hdcp, DP_HDCP_SW_UPPER_AKSV, hdcp->key.ksv.words[1]);
+
+	for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
+		dp_hdcp_write_tz(hdcp, DP_HDCP_KEY_LSB(i),
+				 hdcp->key.keys[i].words[0]);
+		dp_hdcp_write_tz(hdcp, DP_HDCP_KEY_MSB(i),
+				 hdcp->key.keys[i].words[1]);
+	}
+
+	dp_hdcp_write_tz(hdcp, DP_HDCP_KEY_VALID, DP_HDCP_SW_KEY_VALID);
+
+	dp_hdcp_write_dp(hdcp, DP_HDCP_ENTROPY_CTRL0,
+			 FIELD_GET(GENMASK(31,0), an_seed));
+	dp_hdcp_write_dp(hdcp, DP_HDCP_ENTROPY_CTRL1,
+			 FIELD_GET(GENMASK_ULL(63,32), an_seed));
+
+out:
+	mutex_unlock(&hdcp->key_lock);
+	return ret;
+}
+
+static int dp_hdcp_hdcp2_capable(struct drm_connector *connector, bool *capable)
+{
+	*capable = false;
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_read_an_aksv(struct drm_connector *connector,
+				      u32 *an, u32 *aksv)
+{
+	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
+	bool keys_valid;
+	int ret;
+	u32 val;
+
+	dp_hdcp_write_dp(hdcp, DP_HDCP_CTRL, 1);
+
+	ret = read_poll_timeout(dp_hdcp_are_keys_valid, keys_valid, keys_valid,
+				DP_KEYS_VALID_SLEEP_US,
+				DP_KEYS_VALID_TIMEOUT_US, false, connector);
+	if (ret) {
+		drm_err(hdcp->dev, "HDCP keys invalid %d\n", ret);
+		return ret;
+	}
+
+	/* Clear AInfo */
+	dp_hdcp_write_dp(hdcp, DP_HDCP_RCVPORT_DATA4, 0);
+
+	aksv[0] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA3);
+	aksv[1] = GENMASK(7, 0) & dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA4);
+
+	ret = read_poll_timeout(dp_hdcp_read_dp, val,
+		(val & DP_HDCP_AN_READY_MASK) == DP_HDCP_AN_READY_MASK,
+		DP_AN_READY_SLEEP_US, DP_AN_READY_TIMEOUT_US,
+		false, hdcp, DP_HDCP_STATUS);
+	if (ret) {
+		drm_err(hdcp->dev, "AN failed to become ready %x/%d\n", val,
+			ret);
+		return ret;
+	}
+
+	/*
+	 * Get An from hardware, for unknown reasons we need to read the reg
+	 * twice to get valid data.
+	 */
+	dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA5);
+	an[0] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA5);
+
+	udelay(DP_AN_READ_DELAY_US);
+
+	dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA6);
+	an[1] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA6);
+
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_store_receiver_info(struct drm_connector *connector,
+					     u32 *ksv, u32 status, u8 bcaps,
+					     bool is_repeater)
+{
+	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
+	u32 val;
+
+	dp_hdcp_write_tz_hlos(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0,
+			      ksv[0]);
+	dp_hdcp_write_tz_hlos(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1,
+			      ksv[1]);
+
+	val = FIELD_PREP(GENMASK(23, 8), status) |
+	      FIELD_PREP(GENMASK(7, 0), bcaps);
+
+	dp_hdcp_write_tz_hlos(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA12,
+			      val);
+
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_enable_encryption(struct drm_connector *connector)
+{
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_wait_for_r0(struct drm_connector *connector)
+{
+	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
+	int ret;
+	u32 val;
+
+	ret = read_poll_timeout(dp_hdcp_read_dp, val, (val & DP_HDCP_R0_READY),
+				DP_R0_READY_SLEEP_US, DP_R0_READY_TIMEOUT_US,
+				false, hdcp, DP_HDCP_STATUS);
+	if (ret) {
+		drm_err(hdcp->dev, "HDCP R0 not ready %x/%d\n", val, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_match_ri(struct drm_connector *connector, u32 ri_prime)
+{
+	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
+	int ret;
+	u32 val;
+
+	dp_hdcp_write_dp(hdcp, DP_HDCP_RCVPORT_DATA2_0, ri_prime);
+
+	ret = read_poll_timeout(dp_hdcp_read_dp, val, (val & DP_HDCP_RI_MATCH),
+				DP_RI_MATCH_SLEEP_US, DP_RI_MATCH_TIMEOUT_US,
+				false, hdcp, DP_HDCP_STATUS);
+	if (ret) {
+		drm_err(hdcp->dev, "Failed to match Ri and Ri` (%08x) %08x/%d\n",
+			ri_prime, val, ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_store_ksv_fifo(struct drm_connector *connector,
+					u8 *ksv_fifo, u8 num_downstream,
+					u8 *bstatus, u32 *vprime)
+{
+	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
+	int num_bytes = num_downstream * DRM_HDCP_KSV_LEN;
+	int ret, i;
+	u32 val;
+
+	/* Reset the SHA computation block */
+	dp_hdcp_write_tz_hlos(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL,
+			      DP_HDCP_SHA_CTRL_RESET);
+	dp_hdcp_write_tz_hlos(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL, 0);
+
+	/*
+	 * KSV info gets written a byte at a time in the same order it was
+	 * received. Every 64 bytes, we need to wait for the SHA_BLOCK_DONE
+	 * bit to be set in SHA_CTRL.
+	 */
+	for (i = 0; i < num_bytes; i++) {
+		val = FIELD_PREP(DP_HDCP_SHA_DATA_MASK, ksv_fifo[i]);
+
+		if (i == (num_bytes - 1))
+			val |= DP_HDCP_SHA_DATA_DONE;
+
+		dp_hdcp_write_tz_hlos(hdcp,
+				      HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_DATA,
+				      val);
+
+		if (((i + 1) % 64) != 0)
+			continue;
+
+		ret = read_poll_timeout(dp_hdcp_read_dp, val,
+					(val & DP_HDCP_SHA_DONE),
+					DP_KSV_WRITTEN_SLEEP_US,
+					DP_KSV_WRITTEN_TIMEOUT_US, false, hdcp,
+					DP_HDCP_SHA_STATUS);
+		if (ret) {
+			drm_err(hdcp->dev, "SHA block incomplete %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = read_poll_timeout(dp_hdcp_read_dp, val,
+				(val & DP_HDCP_SHA_COMP_DONE),
+				DP_SHA_COMPUTATION_SLEEP_US,
+				DP_SHA_COMPUTATION_TIMEOUT_US,
+				false, hdcp, DP_HDCP_SHA_STATUS);
+	if (ret) {
+		drm_err(hdcp->dev, "SHA computation incomplete %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_disable(struct drm_connector *connector)
+{
+	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
+	u32 val;
+
+	val = dp_hdcp_read_dp(hdcp, REG_DP_SW_RESET);
+	dp_hdcp_write_dp(hdcp, REG_DP_SW_RESET, val | DP_HDCP_SW_RESET);
+
+	/* Disable encryption and disable the HDCP block */
+	dp_hdcp_write_dp(hdcp, DP_HDCP_CTRL, 0);
+
+	dp_hdcp_write_dp(hdcp, REG_DP_SW_RESET, val);
+
+	return 0;
+}
+
+void dp_hdcp_commit(struct dp_hdcp *hdcp, struct drm_atomic_state *state)
+{
+	drm_hdcp_helper_atomic_commit(hdcp->helper_data, state, NULL);
+}
+
+static const struct drm_hdcp_helper_funcs dp_hdcp_funcs = {
+	.are_keys_valid = dp_hdcp_are_keys_valid,
+	.load_keys = dp_hdcp_load_keys,
+	.hdcp2_capable = dp_hdcp_hdcp2_capable,
+	.hdcp1_read_an_aksv = dp_hdcp_hdcp1_read_an_aksv,
+	.hdcp1_store_receiver_info = dp_hdcp_hdcp1_store_receiver_info,
+	.hdcp1_enable_encryption = dp_hdcp_hdcp1_enable_encryption,
+	.hdcp1_wait_for_r0 = dp_hdcp_hdcp1_wait_for_r0,
+	.hdcp1_match_ri = dp_hdcp_hdcp1_match_ri,
+	.hdcp1_store_ksv_fifo = dp_hdcp_hdcp1_store_ksv_fifo,
+	.hdcp1_disable = dp_hdcp_hdcp1_disable,
+};
+
+int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_hdcp_helper_data *helper_data;
+	int ret;
+
+	/* HDCP is not configured for this device */
+	if (!hdcp)
+		return 0;
+
+	helper_data = drm_hdcp_helper_initialize_dp(connector, hdcp->aux,
+						    &dp_hdcp_funcs, false);
+	if (IS_ERR_OR_NULL(helper_data))
+		return PTR_ERR(helper_data);
+
+	ret = drm_connector_attach_content_protection_property(connector, false);
+	if (ret) {
+		drm_hdcp_helper_destroy(helper_data);
+		drm_err(dev, "Failed to attach content protection prop %d\n", ret);
+		return ret;
+	}
+
+	hdcp->dev = connector->dev;
+	hdcp->connector = connector;
+	hdcp->helper_data = helper_data;
+
+	return 0;
+}
+
+struct dp_hdcp *dp_hdcp_get(struct dp_parser *parser, struct drm_dp_aux *aux)
+{
+	struct device *dev = &parser->pdev->dev;
+	struct dp_hdcp *hdcp;
+
+	if (!of_device_is_compatible(dev->of_node, "qcom,sc7180-dp-hdcp"))
+		return NULL;
+
+	hdcp = devm_kzalloc(dev, sizeof(*hdcp), GFP_KERNEL);
+	if (!hdcp)
+		return ERR_PTR(-ENOMEM);
+
+	hdcp->parser = parser;
+	hdcp->aux = aux;
+
+	mutex_init(&hdcp->key_lock);
+
+	return hdcp;
+}
+
+void dp_hdcp_put(struct dp_hdcp *hdcp)
+{
+	if (hdcp)
+		drm_hdcp_helper_destroy(hdcp->helper_data);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.h b/drivers/gpu/drm/msm/dp/dp_hdcp.h
new file mode 100644
index 000000000000..5637a9b0dea2
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_hdcp.h
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (C) 2021 Google, Inc.
+ *
+ * Authors:
+ * Sean Paul <seanpaul@chromium.org>
+ */
+
+#ifndef DP_HDCP_H_
+#define DP_HDCP_H_
+
+#define DP_HDCP_KEY_LEN				7
+#define DP_HDCP_NUM_KEYS			40
+
+struct dp_hdcp;
+struct dp_parser;
+struct drm_atomic_state;
+struct drm_dp_aux;
+
+struct dp_hdcp *dp_hdcp_get(struct dp_parser *parser, struct drm_dp_aux *aux);
+void dp_hdcp_put(struct dp_hdcp *hdcp);
+
+int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector);
+int dp_hdcp_ingest_key(struct dp_hdcp *hdcp, const u8 *raw_key, int raw_len);
+void dp_hdcp_commit(struct dp_hdcp *hdcp, struct drm_atomic_state *state);
+
+#endif
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 0519dd3ac3c3..7e84c1915df4 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
 
@@ -20,14 +21,13 @@ static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
 };
 
 static int msm_dss_ioremap(struct platform_device *pdev,
-				struct dss_io_data *io_data)
+				struct dss_io_data *io_data, int idx)
 {
 	struct resource *res = NULL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
 	if (!res) {
-		DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
-			__builtin_return_address(0), __func__);
+		DRM_ERROR("Failed to map registers idx=%d\n", idx);
 		return -ENODEV;
 	}
 
@@ -55,6 +55,8 @@ static void dp_parser_unmap_io_resources(struct dp_parser *parser)
 {
 	struct dp_io *io = &parser->io;
 
+	msm_dss_iounmap(&io->hdcp_tz);
+	msm_dss_iounmap(&io->hdcp_key);
 	msm_dss_iounmap(&io->dp_controller);
 }
 
@@ -64,12 +66,21 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	struct platform_device *pdev = parser->pdev;
 	struct dp_io *io = &parser->io;
 
-	rc = msm_dss_ioremap(pdev, &io->dp_controller);
+	rc = msm_dss_ioremap(pdev, &io->dp_controller, 0);
 	if (rc) {
-		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
 		goto err;
 	}
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sc7180-dp-hdcp")) {
+		rc = msm_dss_ioremap(pdev, &io->hdcp_key, 1);
+		if (rc)
+			goto err;
+
+		rc = msm_dss_ioremap(pdev, &io->hdcp_tz, 2);
+		if (rc)
+			goto err;
+	}
+
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy)) {
 		rc = PTR_ERR(io->phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 34b49628bbaf..09d876620175 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -62,10 +62,14 @@ struct dp_display_data {
  * struct dp_ctrl_resource - controller's IO related data
  *
  * @dp_controller: Display Port controller mapped memory address
+ * @hdcp_key: mapped memory for HDCP key ingestion
+ * @hdcp_tz: mapped memory for HDCP TZ interaction
  * @phy_io: phy's mapped memory address
  */
 struct dp_io {
 	struct dss_io_data dp_controller;
+	struct dss_io_data hdcp_key;
+	struct dss_io_data hdcp_tz;
 	struct phy *phy;
 	union phy_configure_opts phy_opts;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 268602803d9a..bc53c56d6120 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -6,11 +6,14 @@
 #ifndef _DP_REG_H_
 #define _DP_REG_H_
 
+#include <linux/bits.h>
+
 /* DP_TX Registers */
 #define REG_DP_HW_VERSION			(0x00000000)
 
 #define REG_DP_SW_RESET				(0x00000010)
-#define DP_SW_RESET				(0x00000001)
+#define  DP_SW_RESET				BIT(0)
+#define  DP_HDCP_SW_RESET			BIT(1)
 
 #define REG_DP_PHY_CTRL				(0x00000014)
 #define DP_PHY_CTRL_SW_RESET_PLL		(0x00000001)
@@ -283,19 +286,46 @@
 /* DP HDCP 1.3 registers */
 #define DP_HDCP_CTRL                                   (0x0A0)
 #define DP_HDCP_STATUS                                 (0x0A4)
-#define DP_HDCP_SW_UPPER_AKSV                          (0x098)
-#define DP_HDCP_SW_LOWER_AKSV                          (0x09C)
-#define DP_HDCP_ENTROPY_CTRL0                          (0x350)
-#define DP_HDCP_ENTROPY_CTRL1                          (0x35C)
+#define  DP_HDCP_KEY_STATUS			       GENMASK(18, 16)
+#define   DP_HDCP_KEY_STATUS_NO_KEYS		       0
+#define   DP_HDCP_KEY_STATUS_NOT_CHECKED	       1
+#define   DP_HDCP_KEY_STATUS_CHECKING		       2
+#define   DP_HDCP_KEY_STATUS_VALID		       3
+#define   DP_HDCP_KEY_STATUS_INVALID_AKSV	       4
+#define   DP_HDCP_KEY_STATUS_BAD_CHECKSUM	       5
+#define   DP_HDCP_KEY_STATUS_PROD_AKSV		       6
+#define   DP_HDCP_KEY_STATUS_RESV		       7
+#define  DP_HDCP_R0_READY			       BIT(14)
+#define  DP_HDCP_SHA_V_MATCH			       BIT(13)
+#define  DP_HDCP_RI_MATCH			       BIT(12)
+#define  DP_HDCP_AN_MSB_READY			       BIT(9)
+#define  DP_HDCP_AN_LSB_READY			       BIT(8)
+#define  DP_HDCP_AN_READY_MASK			       (DP_HDCP_AN_MSB_READY | DP_HDCP_AN_LSB_READY)
+#define  DP_HDCP_AUTH_FAIL_INFO			       GENMASK(7, 4)
+#define   DP_HDCP_AUTH_FAIL_INVALID_AKSV	       3
+#define   DP_HDCP_AUTH_FAIL_INVALID_BKSV	       4
+#define   DP_HDCP_AUTH_FAIL_RI_MISMATCH		       5
+#define  DP_HDCP_AUTH_FAIL			       BIT(2)
+#define  DP_HDCP_AUTH_SUCCESS			       BIT(0)
+#define DP_HDCP_SW_UPPER_AKSV                          (0x298)
+#define DP_HDCP_SW_LOWER_AKSV                          (0x29C)
+#define DP_HDCP_ENTROPY_CTRL0                          (0x750)
+#define DP_HDCP_ENTROPY_CTRL1                          (0x75C)
 #define DP_HDCP_SHA_STATUS                             (0x0C8)
+#define  DP_HDCP_SHA_COMP_DONE			       BIT(4)
+#define  DP_HDCP_SHA_DONE			       BIT(0)
 #define DP_HDCP_RCVPORT_DATA2_0                        (0x0B0)
-#define DP_HDCP_RCVPORT_DATA3                          (0x0A4)
-#define DP_HDCP_RCVPORT_DATA4                          (0x0A8)
+#define DP_HDCP_RCVPORT_DATA3                          (0x2A4)
+#define DP_HDCP_RCVPORT_DATA4                          (0x2A8)
 #define DP_HDCP_RCVPORT_DATA5                          (0x0C0)
 #define DP_HDCP_RCVPORT_DATA6                          (0x0C4)
+#define DP_HDCP_RCVPORT_DATA7                          (0x0C8)
 
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL           (0x024)
+#define  DP_HDCP_SHA_CTRL_RESET			       BIT(0)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_DATA           (0x028)
+#define  DP_HDCP_SHA_DATA_MASK			       GENMASK(23, 16)
+#define  DP_HDCP_SHA_DATA_DONE			       BIT(0)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0      (0x004)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1      (0x008)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA7      (0x00C)
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index fab09e7c6efc..444515277a1d 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -8,6 +8,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_vblank.h>
 
+#include "dp_drm.h"
 #include "msm_atomic_trace.h"
 #include "msm_drv.h"
 #include "msm_gem.h"
@@ -203,6 +204,18 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
 	return mask;
 }
 
+static void msm_atomic_commit_connectors(struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state;
+	struct drm_connector *connector;
+	int i;
+
+	for_each_new_connector_in_state(state, connector, conn_state, i) {
+		if (dp_drm_is_connector_msm_dp(connector))
+			dp_drm_atomic_commit(connector, conn_state, state);
+	}
+}
+
 void msm_atomic_commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
@@ -239,6 +252,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	drm_atomic_helper_commit_planes(dev, state, 0);
 	drm_atomic_helper_commit_modeset_enables(dev, state);
 
+	msm_atomic_commit_connectors(state);
+
 	if (async) {
 		struct msm_pending_timer *timer =
 			&kms->pending_timers[drm_crtc_index(async_crtc)];
-- 
Sean Paul, Software Engineer, Google / Chromium OS

