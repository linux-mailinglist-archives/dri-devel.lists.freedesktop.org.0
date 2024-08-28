Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCE1962A27
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 16:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DC010E53F;
	Wed, 28 Aug 2024 14:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213D910E53B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 14:26:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5E4EFA40DB9;
 Wed, 28 Aug 2024 14:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E2AC4CEE5;
 Wed, 28 Aug 2024 14:26:25 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/7] media: i2c: tc358743: export InfoFrames to debugfs
Date: Wed, 28 Aug 2024 16:24:12 +0200
Message-ID: <4570f3d5f8e543b4d3d845528afbf3a6dd647f7a.1724855053.git.hverkuil-cisco@xs4all.nl>
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
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/tc358743.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 65d58ddf0287..fd49bf824051 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -87,6 +87,10 @@ struct tc358743_state {
 	struct timer_list timer;
 	struct work_struct work_i2c_poll;
 
+	/* debugfs */
+	struct dentry *debugfs_dir;
+	struct v4l2_debugfs_if *infoframes;
+
 	/* edid  */
 	u8 edid_blocks_written;
 
@@ -430,12 +434,35 @@ static void tc358743_erase_bksv(struct v4l2_subdev *sd)
 
 /* --------------- AVI infoframe --------------- */
 
+static ssize_t
+tc358743_debugfs_if_read(u32 type, void *priv, struct file *filp,
+			 char __user *ubuf, size_t count, loff_t *ppos)
+{
+	u8 buf[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	struct v4l2_subdev *sd = priv;
+	int len;
+
+	if (!is_hdmi(sd))
+		return 0;
+
+	if (type != V4L2_DEBUGFS_IF_AVI)
+		return 0;
+
+	i2c_rd(sd, PK_AVI_0HEAD, buf, PK_AVI_16BYTE - PK_AVI_0HEAD + 1);
+	len = buf[2] + 4;
+	if (len > V4L2_DEBUGFS_IF_MAX_LEN)
+		len = -ENOENT;
+	if (len > 0)
+		len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
+	return len < 0 ? 0 : len;
+}
+
 static void print_avi_infoframe(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct device *dev = &client->dev;
 	union hdmi_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
+	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)] = {};
 
 	if (!is_hdmi(sd)) {
 		v4l2_info(sd, "DVI-D signal - AVI infoframe not supported\n");
@@ -2161,6 +2188,11 @@ static int tc358743_probe(struct i2c_client *client)
 	if (err < 0)
 		goto err_work_queues;
 
+	state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
+	state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
+						  V4L2_DEBUGFS_IF_AVI, sd,
+						  tc358743_debugfs_if_read);
+
 	v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
 		  client->addr << 1, client->adapter->name);
 
@@ -2188,6 +2220,8 @@ static void tc358743_remove(struct i2c_client *client)
 		flush_work(&state->work_i2c_poll);
 	}
 	cancel_delayed_work_sync(&state->delayed_work_enable_hotplug);
+	v4l2_debugfs_if_free(state->infoframes);
+	debugfs_remove_recursive(state->debugfs_dir);
 	cec_unregister_adapter(state->cec_adap);
 	v4l2_async_unregister_subdev(sd);
 	v4l2_device_unregister_subdev(sd);
-- 
2.43.0

