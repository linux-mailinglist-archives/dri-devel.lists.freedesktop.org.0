Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76420959FC0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B9910E61D;
	Wed, 21 Aug 2024 14:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0684F10E61F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 14:26:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7B489A41C8A;
 Wed, 21 Aug 2024 14:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF895C32781;
 Wed, 21 Aug 2024 14:16:47 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 3/7] media: i2c: adv7511-v4l2: export InfoFrames to debugfs
Date: Wed, 21 Aug 2024 16:10:17 +0200
Message-ID: <9b2ebe2cb00bf3614bcf09a270ef92d06a9782a0.1724249420.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
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
 drivers/media/i2c/adv7511-v4l2.c | 91 ++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index e9406d552699..4036972af3a6 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -116,6 +116,9 @@ struct adv7511_state {
 	unsigned edid_detect_counter;
 	struct workqueue_struct *work_queue;
 	struct delayed_work edid_handler; /* work entry */
+
+	struct dentry *debugfs_dir;
+	struct v4l2_debugfs_if *infoframes;
 };
 
 static void adv7511_check_monitor_present_status(struct v4l2_subdev *sd);
@@ -483,27 +486,25 @@ static u8 hdmi_infoframe_checksum(u8 *ptr, size_t size)
 	return 256 - csum;
 }
 
-static void log_infoframe(struct v4l2_subdev *sd, const struct adv7511_cfg_read_infoframe *cri)
+static int read_infoframe(struct v4l2_subdev *sd,
+			  const struct adv7511_cfg_read_infoframe *cri,
+			  u8 *buffer)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct device *dev = &client->dev;
-	union hdmi_infoframe frame;
-	u8 buffer[32];
 	u8 len;
 	int i;
 
 	if (!(adv7511_rd(sd, cri->present_reg) & cri->present_mask)) {
 		v4l2_info(sd, "%s infoframe not transmitted\n", cri->desc);
-		return;
+		return 0;
 	}
 
 	memcpy(buffer, cri->header, sizeof(cri->header));
 
 	len = buffer[2];
 
-	if (len + 4 > sizeof(buffer)) {
+	if (len + 4 > V4L2_DEBUGFS_IF_MAX_LEN) {
 		v4l2_err(sd, "%s: invalid %s infoframe length %d\n", __func__, cri->desc, len);
-		return;
+		return 0;
 	}
 
 	if (cri->payload_addr >= 0x100) {
@@ -516,21 +517,38 @@ static void log_infoframe(struct v4l2_subdev *sd, const struct adv7511_cfg_read_
 	buffer[3] = 0;
 	buffer[3] = hdmi_infoframe_checksum(buffer, len + 4);
 
-	if (hdmi_infoframe_unpack(&frame, buffer, len + 4) < 0) {
-		v4l2_err(sd, "%s: unpack of %s infoframe failed\n", __func__, cri->desc);
+	return len + 4;
+}
+
+static void log_infoframe(struct v4l2_subdev *sd,
+			  const struct adv7511_cfg_read_infoframe *cri)
+{
+	union hdmi_infoframe frame;
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct device *dev = &client->dev;
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	int len = read_infoframe(sd, cri, buffer);
+
+	if (len <= 0)
+		return;
+
+	if (hdmi_infoframe_unpack(&frame, buffer, len) < 0) {
+		v4l2_err(sd, "%s: unpack of %s infoframe failed\n",
+			 __func__, cri->desc);
 		return;
 	}
 
 	hdmi_infoframe_log(KERN_INFO, dev, &frame);
 }
 
+static const struct adv7511_cfg_read_infoframe cri[] = {
+	{ "AVI", 0x44, 0x10, { 0x82, 2, 13 }, 0x55 },
+	{ "Audio", 0x44, 0x08, { 0x84, 1, 10 }, 0x73 },
+	{ "SDP", 0x40, 0x40, { 0x83, 1, 25 }, 0x103 },
+};
+
 static void adv7511_log_infoframes(struct v4l2_subdev *sd)
 {
-	static const struct adv7511_cfg_read_infoframe cri[] = {
-		{ "AVI", 0x44, 0x10, { 0x82, 2, 13 }, 0x55 },
-		{ "Audio", 0x44, 0x08, { 0x84, 1, 10 }, 0x73 },
-		{ "SDP", 0x40, 0x40, { 0x83, 1, 25 }, 0x103 },
-	};
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(cri); i++)
@@ -1693,6 +1711,34 @@ static bool adv7511_check_edid_status(struct v4l2_subdev *sd)
 	return false;
 }
 
+static ssize_t
+adv7511_debugfs_if_read(u32 type, void *priv,
+			struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	u8 buf[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	struct v4l2_subdev *sd = priv;
+	int index;
+	int len;
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
+	default:
+		return 0;
+	}
+	len = read_infoframe(sd, &cri[index], buf);
+	if (len > 0)
+		len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
+	return len < 0 ? 0 : len;
+}
+
 static int adv7511_registered(struct v4l2_subdev *sd)
 {
 	struct adv7511_state *state = get_adv7511_state(sd);
@@ -1700,9 +1746,16 @@ static int adv7511_registered(struct v4l2_subdev *sd)
 	int err;
 
 	err = cec_register_adapter(state->cec_adap, &client->dev);
-	if (err)
+	if (err) {
 		cec_delete_adapter(state->cec_adap);
-	return err;
+		return err;
+	}
+
+	state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
+	state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
+		V4L2_DEBUGFS_IF_AVI | V4L2_DEBUGFS_IF_AUDIO |
+		V4L2_DEBUGFS_IF_SPD, sd, adv7511_debugfs_if_read);
+	return 0;
 }
 
 static void adv7511_unregistered(struct v4l2_subdev *sd)
@@ -1710,6 +1763,10 @@ static void adv7511_unregistered(struct v4l2_subdev *sd)
 	struct adv7511_state *state = get_adv7511_state(sd);
 
 	cec_unregister_adapter(state->cec_adap);
+	v4l2_debugfs_if_free(state->infoframes);
+	state->infoframes = NULL;
+	debugfs_remove_recursive(state->debugfs_dir);
+	state->debugfs_dir = NULL;
 }
 
 static const struct v4l2_subdev_internal_ops adv7511_int_ops = {
-- 
2.43.0

