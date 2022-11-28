Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B5F63AC50
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 16:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3F710E2C1;
	Mon, 28 Nov 2022 15:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A88C10E236
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 15:24:13 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B9D7A10000B;
 Mon, 28 Nov 2022 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1669649048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPx4tBfw7h+gvsEPNb76cRKwFVYUpeaYbykLmUstGkw=;
 b=kjQw2nZmpzWvV47Q8nEaUsV0ORj3ynAsAhaeVn+fffVJ2xInY+ahcLjklYKWP+hF7RuisI
 CB4AUefXpTAAzCit4sk/AbzyWf00e1a4j1um275MAEqGBCAymqfRco67WICoBka+cC+5wt
 c0JQaszFd9ldtCVXBqDh/KUxvOZdhcaPko727MLSxCDuj6NoJGTsMItga8oJfqm8pckKZW
 ANisFPuuKgsaUwNie0JZe7BfY1XeyEoo2p0hW8nafFS0n5CFNgDzEGacl+5npR0ecaoaq3
 wPhktVbNiTh00I72kN+pgJw1e0BCMjaI8mwCJwfec5fipk4O/iSPh7PjwrFwIg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 03/21] staging: media: tegra-video: fix
 .vidioc_enum_fmt_vid_cap to return all formats
Date: Mon, 28 Nov 2022 16:23:18 +0100
Message-Id: <20221128152336.133953-4-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .vidioc_enum_fmt_vid_cap (called tegra_channel_enum_format() here)
should return all the supported formats. Instead the current implementation
computes the intersection between the formats it supports and those
supported by the first subdev in the stream (typically the image sensor).

Remove all the unnecessary logic that supports such algorithm. In order to
do this, also change the Tegra210 CSI TPG formats from the current
open-coded implementation in vi_tpg_fmts_bitmap_init() to a const array in
tegra210.c, just like the one that describes the regular formats.

Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v2
---
 drivers/staging/media/tegra-video/tegra210.c |   7 +-
 drivers/staging/media/tegra-video/vi.c       | 103 +------------------
 drivers/staging/media/tegra-video/vi.h       |   4 -
 3 files changed, 9 insertions(+), 105 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index d58370a84737..eb19dd5107ce 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -683,8 +683,12 @@ enum tegra210_image_format {
 	V4L2_PIX_FMT_##FOURCC,						\
 }
 
-/* Tegra210 supported video formats */
 static const struct tegra_video_format tegra210_video_formats[] = {
+#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
+	/* VI only support 2 formats in TPG mode */
+	TEGRA210_VIDEO_FMT(RAW10,  10, SRGGB10_1X10,      2, T_R16_I,    SRGGB10),
+	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X32_PADHI, 4, T_A8B8G8R8, RGBX32),
+#else
 	/* RAW 8 */
 	TEGRA210_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 1, T_L8, SRGGB8),
 	TEGRA210_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 1, T_L8, SGRBG8),
@@ -714,6 +718,7 @@ static const struct tegra_video_format tegra210_video_formats[] = {
 	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, T_V8_Y8__U8_Y8, YUYV),
 	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, T_Y8_U8__Y8_V8, VYUY),
 	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, T_Y8_V8__Y8_U8, UYVY),
+#endif
 };
 
 /* Tegra210 VI operations */
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 9d46a36cc014..0fe3c7f6d234 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
  */
 
-#include <linux/bitmap.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/host1x.h>
@@ -73,15 +72,6 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 	return -1;
 }
 
-static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
-					  unsigned int index)
-{
-	if (index >= vi->soc->nformats)
-		return -EINVAL;
-
-	return vi->soc->video_formats[index].fourcc;
-}
-
 static const struct tegra_video_format *
 tegra_get_format_by_fourcc(struct tegra_vi *vi, u32 fourcc)
 {
@@ -430,19 +420,12 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 				     struct v4l2_fmtdesc *f)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
-	unsigned int index = 0, i;
-	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
-
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		fmts_bitmap = chan->fmts_bitmap;
+	const struct tegra_vi_soc *soc = chan->vi->soc;
 
-	if (f->index >= bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
+	if (f->index >= soc->nformats)
 		return -EINVAL;
 
-	for (i = 0; i < f->index + 1; i++, index++)
-		index = find_next_bit(fmts_bitmap, MAX_FORMAT_NUM, index);
-
-	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
+	f->pixelformat = soc->video_formats[f->index].fourcc;
 
 	return 0;
 }
@@ -1059,78 +1042,6 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	return 0;
 }
 
-/* VI only support 2 formats in TPG mode */
-static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
-{
-	int index;
-
-	bitmap_zero(chan->tpg_fmts_bitmap, MAX_FORMAT_NUM);
-
-	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
-
-	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
-					     0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
-}
-
-static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
-{
-	int index, ret, match_code = 0;
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_mbus_code_enum code = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-
-	bitmap_zero(chan->fmts_bitmap, MAX_FORMAT_NUM);
-
-	/*
-	 * Set the bitmap bits based on all the matched formats between the
-	 * available media bus formats of sub-device and the pre-defined Tegra
-	 * supported video formats.
-	 */
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	while (1) {
-		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
-				       NULL, &code);
-		if (ret < 0)
-			break;
-
-		index = tegra_get_format_idx_by_code(chan->vi, code.code, 0);
-		while (index >= 0) {
-			bitmap_set(chan->fmts_bitmap, index, 1);
-			if (!match_code)
-				match_code = code.code;
-			/* look for other formats with same mbus code */
-			index = tegra_get_format_idx_by_code(chan->vi,
-							     code.code,
-							     index + 1);
-		}
-
-		code.index++;
-	}
-
-	/*
-	 * Set the bitmap bit corresponding to default tegra video format if
-	 * there are no matched formats.
-	 */
-	if (!match_code) {
-		match_code = tegra_default_format.code;
-		index = tegra_get_format_idx_by_code(chan->vi, match_code, 0);
-		if (WARN_ON(index < 0))
-			return -EINVAL;
-
-		bitmap_set(chan->fmts_bitmap, index, 1);
-	}
-
-	/* initialize channel format to the sub-device active format */
-	tegra_channel_set_subdev_active_fmt(chan);
-
-	return 0;
-}
-
 static void tegra_channel_host1x_syncpts_free(struct tegra_vi_channel *chan)
 {
 	int i;
@@ -1501,7 +1412,6 @@ int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid)
 			goto cleanup;
 
 		v4l2_set_subdev_hostdata(&csi_chan->subdev, vi_chan);
-		vi_tpg_fmts_bitmap_init(vi_chan);
 		csi_chan = list_next_entry(csi_chan, list);
 	}
 
@@ -1721,13 +1631,6 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		goto unregister_video;
 	}
 
-	ret = vi_fmts_bitmap_init(chan);
-	if (ret < 0) {
-		dev_err(vi->dev,
-			"failed to initialize formats bitmap: %d\n", ret);
-		goto unregister_video;
-	}
-
 	subdev = tegra_channel_get_remote_csi_subdev(chan);
 	if (!subdev) {
 		ret = -ENODEV;
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index a68e2c02c7b0..183796c8a46a 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -163,8 +163,6 @@ struct tegra_vi_graph_entity {
  *
  * @ctrl_handler: V4L2 control handler of this video channel
  * @syncpt_timeout_retry: syncpt timeout retry count for the capture
- * @fmts_bitmap: a bitmap for supported formats matching v4l2 subdev formats
- * @tpg_fmts_bitmap: a bitmap for supported TPG formats
  * @pg_mode: test pattern generator mode (disabled/direct/patch)
  * @notifier: V4L2 asynchronous subdevs notifier
  */
@@ -205,8 +203,6 @@ struct tegra_vi_channel {
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	unsigned int syncpt_timeout_retry;
-	DECLARE_BITMAP(fmts_bitmap, MAX_FORMAT_NUM);
-	DECLARE_BITMAP(tpg_fmts_bitmap, MAX_FORMAT_NUM);
 	enum tegra_vi_pg_mode pg_mode;
 
 	struct v4l2_async_notifier notifier;
-- 
2.34.1

