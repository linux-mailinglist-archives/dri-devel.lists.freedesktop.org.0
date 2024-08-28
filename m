Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90302962A25
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 16:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE8A10E53E;
	Wed, 28 Aug 2024 14:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D946310E53D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 14:26:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 08117A40DAF;
 Wed, 28 Aug 2024 14:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9280DC4CEE3;
 Wed, 28 Aug 2024 14:26:22 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/7] media: i2c: adv7604: export InfoFrames to debugfs
Date: Wed, 28 Aug 2024 16:24:10 +0200
Message-ID: <2ce74f64339f2b1df8c59bedd88eee163fbe2d41.1724855053.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
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

Export InfoFrames to debugfs.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/adv7604.c | 90 ++++++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 48230d5109f0..3184a2fa1532 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -193,6 +193,9 @@ struct adv76xx_state {
 	struct delayed_work delayed_work_enable_hotplug;
 	bool restart_stdi_once;
 
+	struct dentry *debugfs_dir;
+	struct v4l2_debugfs_if *infoframes;
+
 	/* CEC */
 	struct cec_adapter *cec_adap;
 	u8   cec_addr[ADV76XX_MAX_ADDRS];
@@ -2458,10 +2461,9 @@ static const struct adv76xx_cfg_read_infoframe adv76xx_cri[] = {
 	{ "Vendor", 0x10, 0xec, 0x54 }
 };
 
-static int adv76xx_read_infoframe(struct v4l2_subdev *sd, int index,
-				  union hdmi_infoframe *frame)
+static int adv76xx_read_infoframe_buf(struct v4l2_subdev *sd, int index,
+				      u8 buf[V4L2_DEBUGFS_IF_MAX_LEN])
 {
-	uint8_t buffer[32];
 	u8 len;
 	int i;
 
@@ -2472,27 +2474,20 @@ static int adv76xx_read_infoframe(struct v4l2_subdev *sd, int index,
 	}
 
 	for (i = 0; i < 3; i++)
-		buffer[i] = infoframe_read(sd,
-					   adv76xx_cri[index].head_addr + i);
+		buf[i] = infoframe_read(sd, adv76xx_cri[index].head_addr + i);
 
-	len = buffer[2] + 1;
+	len = buf[2] + 1;
 
-	if (len + 3 > sizeof(buffer)) {
+	if (len + 3 > V4L2_DEBUGFS_IF_MAX_LEN) {
 		v4l2_err(sd, "%s: invalid %s infoframe length %d\n", __func__,
 			 adv76xx_cri[index].desc, len);
 		return -ENOENT;
 	}
 
 	for (i = 0; i < len; i++)
-		buffer[i + 3] = infoframe_read(sd,
-				       adv76xx_cri[index].payload_addr + i);
-
-	if (hdmi_infoframe_unpack(frame, buffer, len + 3) < 0) {
-		v4l2_err(sd, "%s: unpack of %s infoframe failed\n", __func__,
-			 adv76xx_cri[index].desc);
-		return -ENOENT;
-	}
-	return 0;
+		buf[i + 3] = infoframe_read(sd,
+					    adv76xx_cri[index].payload_addr + i);
+	return len + 3;
 }
 
 static void adv76xx_log_infoframes(struct v4l2_subdev *sd)
@@ -2505,10 +2500,19 @@ static void adv76xx_log_infoframes(struct v4l2_subdev *sd)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(adv76xx_cri); i++) {
-		union hdmi_infoframe frame;
 		struct i2c_client *client = v4l2_get_subdevdata(sd);
+		u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+		union hdmi_infoframe frame;
+		int len;
 
-		if (!adv76xx_read_infoframe(sd, i, &frame))
+		len = adv76xx_read_infoframe_buf(sd, i, buffer);
+		if (len < 0)
+			continue;
+
+		if (hdmi_infoframe_unpack(&frame, buffer, len) < 0)
+			v4l2_err(sd, "%s: unpack of %s infoframe failed\n",
+				 __func__, adv76xx_cri[i].desc);
+		else
 			hdmi_infoframe_log(KERN_INFO, &client->dev, &frame);
 	}
 }
@@ -2686,6 +2690,41 @@ static int adv76xx_subscribe_event(struct v4l2_subdev *sd,
 	}
 }
 
+static ssize_t
+adv76xx_debugfs_if_read(u32 type, void *priv, struct file *filp,
+			char __user *ubuf, size_t count, loff_t *ppos)
+{
+	u8 buf[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	struct v4l2_subdev *sd = priv;
+	int index;
+	int len;
+
+	if (!is_hdmi(sd))
+		return 0;
+
+	switch (type) {
+	case V4L2_DEBUGFS_IF_AVI:
+		index = 0;
+		break;
+	case V4L2_DEBUGFS_IF_AUDIO:
+		index = 1;
+		break;
+	case V4L2_DEBUGFS_IF_SPD:
+		index = 2;
+		break;
+	case V4L2_DEBUGFS_IF_HDMI:
+		index = 3;
+		break;
+	default:
+		return 0;
+	}
+
+	len = adv76xx_read_infoframe_buf(sd, index, buf);
+	if (len > 0)
+		len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
+	return len < 0 ? 0 : len;
+}
+
 static int adv76xx_registered(struct v4l2_subdev *sd)
 {
 	struct adv76xx_state *state = to_state(sd);
@@ -2693,9 +2732,16 @@ static int adv76xx_registered(struct v4l2_subdev *sd)
 	int err;
 
 	err = cec_register_adapter(state->cec_adap, &client->dev);
-	if (err)
+	if (err) {
 		cec_delete_adapter(state->cec_adap);
-	return err;
+		return err;
+	}
+	state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
+	state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
+		V4L2_DEBUGFS_IF_AVI | V4L2_DEBUGFS_IF_AUDIO |
+		V4L2_DEBUGFS_IF_SPD | V4L2_DEBUGFS_IF_HDMI, sd,
+		adv76xx_debugfs_if_read);
+	return 0;
 }
 
 static void adv76xx_unregistered(struct v4l2_subdev *sd)
@@ -2703,6 +2749,10 @@ static void adv76xx_unregistered(struct v4l2_subdev *sd)
 	struct adv76xx_state *state = to_state(sd);
 
 	cec_unregister_adapter(state->cec_adap);
+	v4l2_debugfs_if_free(state->infoframes);
+	state->infoframes = NULL;
+	debugfs_remove_recursive(state->debugfs_dir);
+	state->debugfs_dir = NULL;
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.43.0

