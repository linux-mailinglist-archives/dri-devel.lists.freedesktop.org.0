Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69922959FC3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E036D10E621;
	Wed, 21 Aug 2024 14:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFB210E620
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 14:26:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 976C4A41C98;
 Wed, 21 Aug 2024 14:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128D9C4AF0E;
 Wed, 21 Aug 2024 14:16:51 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 6/7] media: i2c: tda1997x: export InfoFrames to debugfs
Date: Wed, 21 Aug 2024 16:10:20 +0200
Message-ID: <2333708a0be80d59fb5413c1c1328d5a49e2ba37.1724249421.git.hverkuil-cisco@xs4all.nl>
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
---
 drivers/media/i2c/tda1997x.c | 50 ++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 3b7e5ff5b010..2b33fdecb2d2 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -259,6 +259,10 @@ struct tda1997x_state {
 	struct v4l2_ctrl *detect_tx_5v_ctrl;
 	struct v4l2_ctrl *rgb_quantization_range_ctrl;
 
+	/* debugfs */
+	struct dentry *debugfs_dir;
+	struct v4l2_debugfs_if *infoframes;
+
 	/* audio */
 	u8  audio_ch_alloc;
 	int audio_samplerate;
@@ -1263,7 +1267,7 @@ tda1997x_parse_infoframe(struct tda1997x_state *state, u16 addr)
 {
 	struct v4l2_subdev *sd = &state->sd;
 	union hdmi_infoframe frame;
-	u8 buffer[40] = { 0 };
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = { 0 };
 	u8 reg;
 	int len, err;
 
@@ -1938,11 +1942,44 @@ static const struct v4l2_subdev_pad_ops tda1997x_pad_ops = {
  * v4l2_subdev_core_ops
  */
 
+static ssize_t
+tda1997x_debugfs_if_read(u32 type, void *priv, struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct v4l2_subdev *sd = priv;
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	int addr, len;
+
+	switch (type) {
+	case V4L2_DEBUGFS_IF_AVI:
+		addr = AVI_IF;
+		break;
+	case V4L2_DEBUGFS_IF_AUDIO:
+		addr = AUD_IF;
+		break;
+	case V4L2_DEBUGFS_IF_SPD:
+		addr = SPD_IF;
+		break;
+	default:
+		return 0;
+	}
+
+	/* read data */
+	len = io_readn(sd, addr, sizeof(buffer), buffer);
+	if (len > 0) {
+		len = buffer[2] + 4;
+		if (len > V4L2_DEBUGFS_IF_MAX_LEN)
+			len = -EIO;
+	}
+	if (len > 0)
+		len = simple_read_from_buffer(ubuf, count, ppos, buffer, len);
+	return len < 0 ? 0 : len;
+}
+
 static int tda1997x_log_infoframe(struct v4l2_subdev *sd, int addr)
 {
 	struct tda1997x_state *state = to_state(sd);
 	union hdmi_infoframe frame;
-	u8 buffer[40] = { 0 };
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = {};
 	int len, err;
 
 	/* read data */
@@ -2791,6 +2828,12 @@ static int tda1997x_probe(struct i2c_client *client)
 		goto err_free_media;
 	}
 
+	state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
+	state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
+		V4L2_DEBUGFS_IF_AVI | V4L2_DEBUGFS_IF_AUDIO |
+		V4L2_DEBUGFS_IF_SPD, sd,
+		tda1997x_debugfs_if_read);
+
 	return 0;
 
 err_free_media:
@@ -2815,6 +2858,9 @@ static void tda1997x_remove(struct i2c_client *client)
 	struct tda1997x_state *state = to_state(sd);
 	struct tda1997x_platform_data *pdata = &state->pdata;
 
+	v4l2_debugfs_if_free(state->infoframes);
+	debugfs_remove_recursive(state->debugfs_dir);
+
 	if (pdata->audout_format) {
 		mutex_destroy(&state->audio_lock);
 	}
-- 
2.43.0

