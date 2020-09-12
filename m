Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CAA267C85
	for <lists+dri-devel@lfdr.de>; Sat, 12 Sep 2020 23:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EEE6E3CE;
	Sat, 12 Sep 2020 21:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A863A6E3D3
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 21:08:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599944933; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oSp/suOsDsR4evAaWOl0glHktXdMPpahVn+zl8rDo3Q=;
 b=sXgLm4TVjMWUVlT7fG0lvPXVh3f+QtPD2uCkclxrYhHHhBlvtz6b8TWCUN4N+VH1bm6o+h+v
 zhVvc1ykVTzwbvL0SaYSMWzEGhYnluNSlp/OFcGpX2cbrF3P8wE5Lqsoxg0ZYl2GI1jclIuj
 s30jwXm6CR3TXcaAcAGfz68gFEk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f5d38cd380a624e4d5414f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Sep 2020 21:08:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C2CECC43387; Sat, 12 Sep 2020 21:08:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 87BD0C433C6;
 Sat, 12 Sep 2020 21:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 87BD0C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/msm/dp: move debugfs node to
 /sys/kernel/debug/dri/*/
Date: Sat, 12 Sep 2020 14:08:13 -0700
Message-Id: <20200912210815.19726-3-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200912210815.19726-1-abhinavk@codeaurora.org>
References: <20200912210815.19726-1-abhinavk@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the MSM DP debugfs node from /sys/kernel/debug/drm_dp
to /sys/kernel/debug/dri/*/ as required for video pattern
compliance test suite.

Changes in v2: rebase on top of latest patchset of dependency

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  7 +++++
 drivers/gpu/drm/msm/dp/dp_debug.c       | 31 ++++++++--------------
 drivers/gpu/drm/msm/dp/dp_debug.h       |  5 +++-
 drivers/gpu/drm/msm/dp/dp_display.c     | 34 +++++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.h           |  2 ++
 5 files changed, 44 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index bcb5ee50568c..db9e2761085b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -195,10 +195,15 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	void *p = dpu_hw_util_get_log_mask_ptr();
 	struct dentry *entry;
+	struct drm_device *dev;
+	struct msm_drm_private *priv;
 
 	if (!p)
 		return -EINVAL;
 
+	dev = dpu_kms->dev;
+	priv = dev->dev_private;
+
 	entry = debugfs_create_dir("debug", minor->debugfs_root);
 
 	debugfs_create_x32(DPU_DEBUGFS_HWMASKNAME, 0600, entry, p);
@@ -207,6 +212,8 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	dpu_debugfs_vbif_init(dpu_kms, entry);
 	dpu_debugfs_core_irq_init(dpu_kms, entry);
 
+	msm_dp_debugfs_init(priv->dp, minor);
+
 	return dpu_core_perf_debugfs_init(dpu_kms, entry);
 }
 #endif
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 92019f3e1a1f..099e989f214d 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -7,6 +7,7 @@
 
 #include <linux/debugfs.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_file.h>
 
 #include "dp_parser.h"
 #include "dp_catalog.h"
@@ -15,7 +16,7 @@
 #include "dp_debug.h"
 #include "dp_display.h"
 
-#define DEBUG_NAME "drm_dp"
+#define DEBUG_NAME "msm_dp"
 
 struct dp_debug_private {
 	struct dentry *root;
@@ -25,6 +26,7 @@ struct dp_debug_private {
 	struct dp_panel *panel;
 	struct drm_connector **connector;
 	struct device *dev;
+	struct drm_device *drm_dev;
 
 	struct dp_debug dp_debug;
 };
@@ -206,41 +208,29 @@ static const struct file_operations dp_debug_fops = {
 	.read = dp_debug_read_info,
 };
 
-static int dp_debug_init(struct dp_debug *dp_debug)
+static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 {
 	int rc = 0;
 	struct dp_debug_private *debug = container_of(dp_debug,
 			struct dp_debug_private, dp_debug);
-	struct dentry *dir, *file;
+	struct dentry *file;
 
-	dir = debugfs_create_dir(DEBUG_NAME, NULL);
-	if (IS_ERR_OR_NULL(dir)) {
-		rc = PTR_ERR(dir);
-		DRM_ERROR("[%s] debugfs create dir failed, rc = %d\n",
-				  DEBUG_NAME, rc);
-		goto error;
-	}
-
-	file = debugfs_create_file("dp_debug", 0444, dir,
+	file = debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
 			debug, &dp_debug_fops);
 	if (IS_ERR_OR_NULL(file)) {
 		rc = PTR_ERR(file);
 		DRM_ERROR("[%s] debugfs create file failed, rc=%d\n",
 				  DEBUG_NAME, rc);
-		goto error_remove_dir;
 	}
 
-	debug->root = dir;
-	return rc;
- error_remove_dir:
-	debugfs_remove(dir);
- error:
+	debug->root = minor->debugfs_root;
+
 	return rc;
 }
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector)
+		struct drm_connector **connector, struct drm_minor *minor)
 {
 	int rc = 0;
 	struct dp_debug_private *debug;
@@ -263,6 +253,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	debug->link = link;
 	debug->panel = panel;
 	debug->dev = dev;
+	debug->drm_dev = minor->dev;
 	debug->connector = connector;
 
 	dp_debug = &debug->dp_debug;
@@ -270,7 +261,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	dp_debug->hdisplay = 0;
 	dp_debug->vrefresh = 0;
 
-	rc = dp_debug_init(dp_debug);
+	rc = dp_debug_init(dp_debug, minor);
 	if (rc) {
 		devm_kfree(dev, debug);
 		goto error;
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index fddf827ac089..377e166fd0ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -35,6 +35,7 @@ struct dp_debug {
  * @usbpd: instance of usbpd module
  * @link: instance of link module
  * @connector: double pointer to display connector
+ * @minor: pointer to drm minor number after device registration
  * return: pointer to allocated debug module data
  *
  * This function sets up the debug module and provides a way
@@ -42,7 +43,9 @@ struct dp_debug {
  */
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector);
+		struct drm_connector **connector,
+		struct drm_minor *minor);
+
 /**
  * dp_debug_put()
  *
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bcebde784570..646303fc2935 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -229,10 +229,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	}
 
 	rc = dp_register_audio_driver(dev, dp->audio);
-	if (rc) {
+	if (rc)
 		DRM_ERROR("Audio registration Dp failed\n");
-		goto end;
-	}
 
 end:
 	return rc;
@@ -773,19 +771,8 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_audio;
 	}
 
-	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
-			dp->link, &dp->dp_display.connector);
-	if (IS_ERR(dp->debug)) {
-		rc = PTR_ERR(dp->debug);
-		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
-		dp->debug = NULL;
-		goto error_debug;
-	}
-
 	return rc;
 
-error_debug:
-	dp_audio_put(dp->audio);
 error_audio:
 	dp_ctrl_put(dp->ctrl);
 error_ctrl:
@@ -1299,6 +1286,25 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
 }
 
+void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
+{
+	struct dp_display_private *dp;
+	struct device *dev;
+	int rc;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dev = &dp->pdev->dev;
+
+	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
+					dp->link, &dp->dp_display.connector,
+					minor);
+	if (IS_ERR(dp->debug)) {
+		rc = PTR_ERR(dp->debug);
+		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
+		dp->debug = NULL;
+	}
+}
+
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d30b2a2e25ec..0311a4f8bbe2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -390,6 +390,8 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *adjusted_mode);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 
+void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
+
 #else
 static inline int __init msm_dp_register(void)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
