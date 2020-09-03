Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F8925CDEC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 00:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA73E6EA3E;
	Thu,  3 Sep 2020 22:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034B46E20F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 22:43:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599173041; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=o96q20H0sfoC2Y98IPIA4WWtAwc9JpmUeLGMlfxH4i0=;
 b=EjQEW88w/e8bHib5TsTiD6pGzfSDqX7wOnXx1AnfbIbgXhNax9SgIrO5OvVNU8IXk2+ajjgE
 6r/Xi1VM/x5BrZ6+kjQFDUrXi5/sYsqlQ6kyUnfHzIzd7otE3NWEQGIWJXcAMVRvVIKaVUI9
 x6TyzHNb3EcRcRyOGd/2NLb8OiE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f5171a5380a624e4d6f3164 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 22:43:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 08FF2C4339C; Thu,  3 Sep 2020 22:43:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F433C43391;
 Thu,  3 Sep 2020 22:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F433C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm/dp: add debugfs nodes for video pattern tests
Date: Thu,  3 Sep 2020 15:43:27 -0700
Message-Id: <20200903224328.26452-4-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200903224328.26452-1-abhinavk@codeaurora.org>
References: <20200903224328.26452-1-abhinavk@codeaurora.org>
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
 tanmay@codeaurora.org, aravindh@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the debugfs nodes needed for the video pattern
compliance tests to MSM DP driver.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 184 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h  |  23 ++++
 2 files changed, 207 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 099e989f214d..16861aade93b 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -203,17 +203,174 @@ static ssize_t dp_debug_read_info(struct file *file, char __user *user_buff,
 	return -EINVAL;
 }
 
+static int dp_test_data_show(struct seq_file *m, void *data)
+{
+	struct drm_device *dev;
+	struct dp_debug_private *debug;
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+	u32 bpc;
+
+	debug = m->private;
+	dev = debug->drm_dev;
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+
+		if (connector->connector_type !=
+			DRM_MODE_CONNECTOR_DisplayPort)
+			continue;
+
+		if (connector->status == connector_status_connected) {
+			bpc = debug->link->test_video.test_bit_depth;
+			seq_printf(m, "hdisplay: %d\n",
+					debug->link->test_video.test_h_width);
+			seq_printf(m, "vdisplay: %d\n",
+					debug->link->test_video.test_v_height);
+					seq_printf(m, "bpc: %u\n",
+					dp_link_bit_depth_to_bpc(bpc));
+		} else
+			seq_puts(m, "0");
+	}
+
+	drm_connector_list_iter_end(&conn_iter);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(dp_test_data);
+
+static int dp_test_type_show(struct seq_file *m, void *data)
+{
+	struct dp_debug_private *debug = m->private;
+	struct drm_device *dev = debug->drm_dev;
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+
+		if (connector->connector_type !=
+			DRM_MODE_CONNECTOR_DisplayPort)
+			continue;
+
+		if (connector->status == connector_status_connected)
+			seq_printf(m, "%02lx", DP_TEST_LINK_VIDEO_PATTERN);
+		else
+			seq_puts(m, "0");
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(dp_test_type);
+
+static ssize_t dp_test_active_write(struct file *file,
+		const char __user *ubuf,
+		size_t len, loff_t *offp)
+{
+	char *input_buffer;
+	int status = 0;
+	struct dp_debug_private *debug;
+	struct drm_device *dev;
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+	int val = 0;
+
+	debug = ((struct seq_file *)file->private_data)->private;
+	dev = debug->drm_dev;
+
+	if (len == 0)
+		return 0;
+
+	input_buffer = memdup_user_nul(ubuf, len);
+	if (IS_ERR(input_buffer))
+		return PTR_ERR(input_buffer);
+
+	DRM_DEBUG_DRIVER("Copied %d bytes from user\n", (unsigned int)len);
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (connector->connector_type !=
+			DRM_MODE_CONNECTOR_DisplayPort)
+			continue;
+
+		if (connector->status == connector_status_connected) {
+			status = kstrtoint(input_buffer, 10, &val);
+			if (status < 0)
+				break;
+			DRM_DEBUG_DRIVER("Got %d for test active\n", val);
+			/* To prevent erroneous activation of the compliance
+			 * testing code, only accept an actual value of 1 here
+			 */
+			if (val == 1)
+				debug->panel->video_test = true;
+			else
+				debug->panel->video_test = false;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+	kfree(input_buffer);
+	if (status < 0)
+		return status;
+
+	*offp += len;
+	return len;
+}
+
+static int dp_test_active_show(struct seq_file *m, void *data)
+{
+	struct dp_debug_private *debug = m->private;
+	struct drm_device *dev = debug->drm_dev;
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (connector->connector_type !=
+			DRM_MODE_CONNECTOR_DisplayPort)
+			continue;
+
+		if (connector->status == connector_status_connected) {
+			if (debug->panel->video_test)
+				seq_puts(m, "1");
+			else
+				seq_puts(m, "0");
+		} else
+			seq_puts(m, "0");
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return 0;
+}
+
+static int dp_test_active_open(struct inode *inode,
+		struct file *file)
+{
+	return single_open(file, dp_test_active_show,
+			inode->i_private);
+}
+
 static const struct file_operations dp_debug_fops = {
 	.open = simple_open,
 	.read = dp_debug_read_info,
 };
 
+static const struct file_operations test_active_fops = {
+	.owner = THIS_MODULE,
+	.open = dp_test_active_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.write = dp_test_active_write
+};
+
 static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 {
 	int rc = 0;
 	struct dp_debug_private *debug = container_of(dp_debug,
 			struct dp_debug_private, dp_debug);
 	struct dentry *file;
+	struct dentry *test_active;
+	struct dentry *test_data, *test_type;
 
 	file = debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
 			debug, &dp_debug_fops);
@@ -223,6 +380,33 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 				  DEBUG_NAME, rc);
 	}
 
+	test_active = debugfs_create_file("msm_dp_test_active", 0444,
+			minor->debugfs_root,
+			debug, &test_active_fops);
+	if (IS_ERR_OR_NULL(test_active)) {
+		rc = PTR_ERR(test_active);
+		DRM_ERROR("[%s] debugfs test_active failed, rc=%d\n",
+				  DEBUG_NAME, rc);
+	}
+
+	test_data = debugfs_create_file("msm_dp_test_data", 0444,
+			minor->debugfs_root,
+			debug, &dp_test_data_fops);
+	if (IS_ERR_OR_NULL(test_data)) {
+		rc = PTR_ERR(test_data);
+		DRM_ERROR("[%s] debugfs test_data failed, rc=%d\n",
+				  DEBUG_NAME, rc);
+	}
+
+	test_type = debugfs_create_file("msm_dp_test_type", 0444,
+			minor->debugfs_root,
+			debug, &dp_test_type_fops);
+	if (IS_ERR_OR_NULL(test_type)) {
+		rc = PTR_ERR(test_type);
+		DRM_ERROR("[%s] debugfs test_type failed, rc=%d\n",
+				  DEBUG_NAME, rc);
+	}
+
 	debug->root = minor->debugfs_root;
 
 	return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index e9d54db8fb61..49811b6221e5 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -112,6 +112,29 @@ static inline u32 dp_link_bit_depth_to_bpp(u32 tbd)
 	}
 }
 
+/**
+ * dp_test_bit_depth_to_bpc() - convert test bit depth to bpc
+ * @tbd: test bit depth
+ *
+ * Returns the bits per comp (bpc) to be used corresponding to the
+ * bit depth value. This function assumes that bit depth has
+ * already been validated.
+ */
+static inline u32 dp_link_bit_depth_to_bpc(u32 tbd)
+{
+	switch (tbd) {
+	case DP_TEST_BIT_DEPTH_6:
+		return 6;
+	case DP_TEST_BIT_DEPTH_8:
+		return 8;
+	case DP_TEST_BIT_DEPTH_10:
+		return 10;
+	case DP_TEST_BIT_DEPTH_UNKNOWN:
+	default:
+		return 0;
+	}
+}
+
 u32 dp_link_get_test_bits_depth(struct dp_link *dp_link, u32 bpp);
 int dp_link_process_request(struct dp_link *dp_link);
 int dp_link_get_colorimetry_config(struct dp_link *dp_link);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
