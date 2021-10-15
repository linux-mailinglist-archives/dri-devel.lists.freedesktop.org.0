Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1C42FEA3
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 01:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915A86E405;
	Fri, 15 Oct 2021 23:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1120D6EE09
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 23:20:25 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id t4so15214458oie.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DD82WbwLimEkgGB+aqUxdRRvDUvC5eko9EPcFoU6FmI=;
 b=AhJ3Do4G3wf9WT1ezdE5nzrmWxhISeH0AOiqeZyU4KSH/W7Bjk28ABCdvJfF1hfnU4
 fIkxC1K0Xvf8BWqtvZIAE0DLEGHqdrieVTBtQ7um3kKRaQKYpewbhiqzZKqejxVHJJk9
 hb3CBDYze1eqI425iw2jJ18TzM4y4lCGN347X+HF7ELktKgrfTvPookXs/roaNp/jnSA
 vhRWBWd3ZkTuEfKIL3hGeknD/CaWnoVVL/BrJnMaINHr0OdKLQpQV0ZPyr6CWP6U6h7m
 jCNwEmWYURz3l9mel7VAz7NeEty3YOxAAqv82kmSH9PAWuCABkBHqS6HFTOEg01s43Ap
 L0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DD82WbwLimEkgGB+aqUxdRRvDUvC5eko9EPcFoU6FmI=;
 b=ao/dCpObfbeiNJrWwKbZhuXqBE1XhqSqrk4fFisgEPmpZisEZR1za8Yw8vSSSSKZGh
 a3FIw50PJWCGVWpAtusfDXX3zjSoCQQB2f2PQbVJ1DE+8l6vmCYpK2Nqc622ZHtFkDBL
 8bGyGpfqyCVRIpaUDwbWfluuNqu8jZPq/8ee0UznwGyjKFBNPq0hH6dLdPF+HiP4d4Zx
 K297/X3Dxmsh/Nam/wpVAYmsJB6jR40xZE8uRp9oViVcdZHNoMVNUAOsVGXm2gYHiO6q
 8uvBcNrhE2eGk8+Y0ENFiY4GZ4/ZzrFLAxJGrnnDrpJGrfGcY0CAU9qgtMcpe/XnAquY
 Skyw==
X-Gm-Message-State: AOAM530e2MgLu4fbQCYdUyeXdiAwxMFh7cJVBs6F7LIdc6VhTi+hF3gF
 poABL5OSERihcnIedz1qDVOZ7A==
X-Google-Smtp-Source: ABdhPJy2SDO5EKvHjmmHCwx9iQyT6dYLKNJH3Ys4wn7X1Fw2Sx+xc7KKz8CLc26+UkzTOhfTUnWC+w==
X-Received: by 2002:a05:6808:21a1:: with SMTP id
 be33mr10295809oib.161.1634340024131; 
 Fri, 15 Oct 2021 16:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 a6sm1233150ooi.3.2021.10.15.16.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 16:20:23 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dp: Use the connector passed to dp_debug_get()
Date: Fri, 15 Oct 2021 16:22:13 -0700
Message-Id: <20211015232213.1839472-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
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

The debugfs code is provided an array of a single drm_connector. Then to
access the connector, the list of all connectors of the DRM device is
traversed and all non-DisplayPort connectors are skipped, to find the
one and only DisplayPort connector.

But as we move to support multiple DisplayPort controllers this will now
find multiple connectors and has no way to distinguish them.

Pass the single connector to dp_debug_get() and use this in the debugfs
functions instead, both to simplify the code and the support the
multiple instances.

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Reduce the indirection in the !DEBUG_FS stub function in dp_debug.h as well

 drivers/gpu/drm/msm/dp/dp_debug.c   | 131 ++++++++++------------------
 drivers/gpu/drm/msm/dp/dp_debug.h   |   4 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   2 +-
 3 files changed, 47 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index af709d93bb9f..da4323556ef3 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -24,7 +24,7 @@ struct dp_debug_private {
 	struct dp_usbpd *usbpd;
 	struct dp_link *link;
 	struct dp_panel *panel;
-	struct drm_connector **connector;
+	struct drm_connector *connector;
 	struct device *dev;
 	struct drm_device *drm_dev;
 
@@ -97,59 +97,35 @@ DEFINE_SHOW_ATTRIBUTE(dp_debug);
 
 static int dp_test_data_show(struct seq_file *m, void *data)
 {
-	struct drm_device *dev;
-	struct dp_debug_private *debug;
-	struct drm_connector *connector;
-	struct drm_connector_list_iter conn_iter;
+	const struct dp_debug_private *debug = m->private;
+	const struct drm_connector *connector = debug->connector;
 	u32 bpc;
 
-	debug = m->private;
-	dev = debug->drm_dev;
-	drm_connector_list_iter_begin(dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter) {
-
-		if (connector->connector_type !=
-			DRM_MODE_CONNECTOR_DisplayPort)
-			continue;
-
-		if (connector->status == connector_status_connected) {
-			bpc = debug->link->test_video.test_bit_depth;
-			seq_printf(m, "hdisplay: %d\n",
-					debug->link->test_video.test_h_width);
-			seq_printf(m, "vdisplay: %d\n",
-					debug->link->test_video.test_v_height);
-			seq_printf(m, "bpc: %u\n",
-					dp_link_bit_depth_to_bpc(bpc));
-		} else
-			seq_puts(m, "0");
+	if (connector->status == connector_status_connected) {
+		bpc = debug->link->test_video.test_bit_depth;
+		seq_printf(m, "hdisplay: %d\n",
+				debug->link->test_video.test_h_width);
+		seq_printf(m, "vdisplay: %d\n",
+				debug->link->test_video.test_v_height);
+		seq_printf(m, "bpc: %u\n",
+				dp_link_bit_depth_to_bpc(bpc));
+	} else {
+		seq_puts(m, "0");
 	}
 
-	drm_connector_list_iter_end(&conn_iter);
-
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(dp_test_data);
 
 static int dp_test_type_show(struct seq_file *m, void *data)
 {
-	struct dp_debug_private *debug = m->private;
-	struct drm_device *dev = debug->drm_dev;
-	struct drm_connector *connector;
-	struct drm_connector_list_iter conn_iter;
-
-	drm_connector_list_iter_begin(dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter) {
-
-		if (connector->connector_type !=
-			DRM_MODE_CONNECTOR_DisplayPort)
-			continue;
+	const struct dp_debug_private *debug = m->private;
+	const struct drm_connector *connector = debug->connector;
 
-		if (connector->status == connector_status_connected)
-			seq_printf(m, "%02x", DP_TEST_LINK_VIDEO_PATTERN);
-		else
-			seq_puts(m, "0");
-	}
-	drm_connector_list_iter_end(&conn_iter);
+	if (connector->status == connector_status_connected)
+		seq_printf(m, "%02x", DP_TEST_LINK_VIDEO_PATTERN);
+	else
+		seq_puts(m, "0");
 
 	return 0;
 }
@@ -161,14 +137,12 @@ static ssize_t dp_test_active_write(struct file *file,
 {
 	char *input_buffer;
 	int status = 0;
-	struct dp_debug_private *debug;
-	struct drm_device *dev;
-	struct drm_connector *connector;
-	struct drm_connector_list_iter conn_iter;
+	const struct dp_debug_private *debug;
+	const struct drm_connector *connector;
 	int val = 0;
 
 	debug = ((struct seq_file *)file->private_data)->private;
-	dev = debug->drm_dev;
+	connector = debug->connector;
 
 	if (len == 0)
 		return 0;
@@ -179,30 +153,22 @@ static ssize_t dp_test_active_write(struct file *file,
 
 	DRM_DEBUG_DRIVER("Copied %d bytes from user\n", (unsigned int)len);
 
-	drm_connector_list_iter_begin(dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter) {
-		if (connector->connector_type !=
-			DRM_MODE_CONNECTOR_DisplayPort)
-			continue;
-
-		if (connector->status == connector_status_connected) {
-			status = kstrtoint(input_buffer, 10, &val);
-			if (status < 0)
-				break;
-			DRM_DEBUG_DRIVER("Got %d for test active\n", val);
-			/* To prevent erroneous activation of the compliance
-			 * testing code, only accept an actual value of 1 here
-			 */
-			if (val == 1)
-				debug->panel->video_test = true;
-			else
-				debug->panel->video_test = false;
+	if (connector->status == connector_status_connected) {
+		status = kstrtoint(input_buffer, 10, &val);
+		if (status < 0) {
+			kfree(input_buffer);
+			return status;
 		}
+		DRM_DEBUG_DRIVER("Got %d for test active\n", val);
+		/* To prevent erroneous activation of the compliance
+		 * testing code, only accept an actual value of 1 here
+		 */
+		if (val == 1)
+			debug->panel->video_test = true;
+		else
+			debug->panel->video_test = false;
 	}
-	drm_connector_list_iter_end(&conn_iter);
 	kfree(input_buffer);
-	if (status < 0)
-		return status;
 
 	*offp += len;
 	return len;
@@ -211,25 +177,16 @@ static ssize_t dp_test_active_write(struct file *file,
 static int dp_test_active_show(struct seq_file *m, void *data)
 {
 	struct dp_debug_private *debug = m->private;
-	struct drm_device *dev = debug->drm_dev;
-	struct drm_connector *connector;
-	struct drm_connector_list_iter conn_iter;
-
-	drm_connector_list_iter_begin(dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter) {
-		if (connector->connector_type !=
-			DRM_MODE_CONNECTOR_DisplayPort)
-			continue;
-
-		if (connector->status == connector_status_connected) {
-			if (debug->panel->video_test)
-				seq_puts(m, "1");
-			else
-				seq_puts(m, "0");
-		} else
+	struct drm_connector *connector = debug->connector;
+
+	if (connector->status == connector_status_connected) {
+		if (debug->panel->video_test)
+			seq_puts(m, "1");
+		else
 			seq_puts(m, "0");
+	} else {
+		seq_puts(m, "0");
 	}
-	drm_connector_list_iter_end(&conn_iter);
 
 	return 0;
 }
@@ -278,7 +235,7 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector, struct drm_minor *minor)
+		struct drm_connector *connector, struct drm_minor *minor)
 {
 	int rc = 0;
 	struct dp_debug_private *debug;
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 7eaedfbb149c..8c0d0b5178fd 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -43,7 +43,7 @@ struct dp_debug {
  */
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector,
+		struct drm_connector *connector,
 		struct drm_minor *minor);
 
 /**
@@ -60,7 +60,7 @@ void dp_debug_put(struct dp_debug *dp_debug);
 static inline
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector, struct drm_minor *minor)
+		struct drm_connector *connector, struct drm_minor *minor)
 {
 	return ERR_PTR(-EINVAL);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2a7239ef94d1..3aa67c53dbc0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1464,7 +1464,7 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	dev = &dp->pdev->dev;
 
 	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
-					dp->link, &dp->dp_display.connector,
+					dp->link, dp->dp_display.connector,
 					minor);
 	if (IS_ERR(dp->debug)) {
 		rc = PTR_ERR(dp->debug);
-- 
2.29.2

