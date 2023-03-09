Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFC76B2762
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5E910E841;
	Thu,  9 Mar 2023 14:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC26D10E841
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:44:07 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 57D33FF815;
 Thu,  9 Mar 2023 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1678373045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqcbbv4oJ6Pa0no5bwC/XjBbgUtwrXcWqjjFdMw9yUA=;
 b=Zp8vIWAyrfqW6JHl3Q0ZhmbySdBBK8lY1DXIX4FUEWoiomUodOlFMBslGHRrgQC+5f1Xq2
 jUR/iUKGq93Y3TpDSkMTGqKgwUtKWQw3D7srVLCEiOIzUKOCtY1FW186BZK7jn/QiiUfrV
 +c+0lD4uud9mPd6WDuHNOqbYlqMqKBHtlOgGeP3IAwQbH6K+5APefwMTpfX85bjFg/5h+f
 tI7ADqcAe34ksq4yVGEvtn772GEoSGGJ7BGJtkES5VVdbh+flhP8feeQ1HTsrNw/jQHQRf
 AuyaKc7+hZ0HqQW7q3277k6KZcH45YVGSwSa6QDYJuDydQDMgRGCrpeLUAwczw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RESEND PATCH v4 13/21] staging: media: tegra-video: move
 tegra_channel_fmt_align to a per-soc op
Date: Thu,  9 Mar 2023 15:43:12 +0100
Message-Id: <20230309144320.2937553-14-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
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

tegra_channel_fmt_align() takes care of the size constraints, alignment and
rounding requirements of the Tegra210 VI peripheral. Tegra20 has different
constraints.

In preparation for adding Tegra20 support, move this function to a new op
in the soc-specific `struct tegra_vi_ops` .

Also move to tegra210.c the T210-specific defines used in the moved code.

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/tegra210.c | 36 ++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c       | 40 +++-----------------
 drivers/staging/media/tegra-video/vi.h       |  9 ++---
 3 files changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index eb19dd5107ce..71483d0c19bf 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -17,6 +17,13 @@
 #include "csi.h"
 #include "vi.h"
 
+#define TEGRA210_MIN_WIDTH	32U
+#define TEGRA210_MAX_WIDTH	32768U
+#define TEGRA210_MIN_HEIGHT	32U
+#define TEGRA210_MAX_HEIGHT	32768U
+
+#define SURFACE_ALIGN_BYTES	64
+
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
 /* Tegra210 VI registers */
@@ -172,6 +179,34 @@ static u32 vi_csi_read(struct tegra_vi_channel *chan, u8 portno,
 /*
  * Tegra210 VI channel capture operations
  */
+static void tegra210_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
+{
+	unsigned int min_bpl;
+	unsigned int max_bpl;
+	unsigned int bpl;
+
+	/*
+	 * The transfer alignment requirements are expressed in bytes.
+	 * Clamp the requested width and height to the limits.
+	 */
+	pix->width = clamp(pix->width, TEGRA210_MIN_WIDTH, TEGRA210_MAX_WIDTH);
+	pix->height = clamp(pix->height, TEGRA210_MIN_HEIGHT, TEGRA210_MAX_HEIGHT);
+
+	/* Clamp the requested bytes per line value. If the maximum bytes per
+	 * line value is zero, the module doesn't support user configurable
+	 * line sizes. Override the requested value with the minimum in that
+	 * case.
+	 */
+	min_bpl = pix->width * bpp;
+	max_bpl = rounddown(TEGRA210_MAX_WIDTH, SURFACE_ALIGN_BYTES);
+	bpl = roundup(pix->bytesperline, SURFACE_ALIGN_BYTES);
+
+	pix->bytesperline = clamp(bpl, min_bpl, max_bpl);
+	pix->sizeimage = pix->bytesperline * pix->height;
+	if (pix->pixelformat == V4L2_PIX_FMT_NV16)
+		pix->sizeimage *= 2;
+}
+
 static int tegra_channel_capture_setup(struct tegra_vi_channel *chan,
 				       u8 portno)
 {
@@ -723,6 +758,7 @@ static const struct tegra_video_format tegra210_video_formats[] = {
 
 /* Tegra210 VI operations */
 static const struct tegra_vi_ops tegra210_vi_ops = {
+	.vi_fmt_align = tegra210_fmt_align,
 	.vi_start_streaming = tegra210_vi_start_streaming,
 	.vi_stop_streaming = tegra210_vi_stop_streaming,
 };
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 4e48eaa0fbdc..a76cad0e3026 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -456,36 +456,6 @@ static int tegra_channel_get_format(struct file *file, void *fh,
 	return 0;
 }
 
-static void tegra_channel_fmt_align(struct tegra_vi_channel *chan,
-				    struct v4l2_pix_format *pix,
-				    unsigned int bpp)
-{
-	unsigned int min_bpl;
-	unsigned int max_bpl;
-	unsigned int bpl;
-
-	/*
-	 * The transfer alignment requirements are expressed in bytes.
-	 * Clamp the requested width and height to the limits.
-	 */
-	pix->width = clamp(pix->width, TEGRA_MIN_WIDTH, TEGRA_MAX_WIDTH);
-	pix->height = clamp(pix->height, TEGRA_MIN_HEIGHT, TEGRA_MAX_HEIGHT);
-
-	/* Clamp the requested bytes per line value. If the maximum bytes per
-	 * line value is zero, the module doesn't support user configurable
-	 * line sizes. Override the requested value with the minimum in that
-	 * case.
-	 */
-	min_bpl = pix->width * bpp;
-	max_bpl = rounddown(TEGRA_MAX_WIDTH, SURFACE_ALIGN_BYTES);
-	bpl = roundup(pix->bytesperline, SURFACE_ALIGN_BYTES);
-
-	pix->bytesperline = clamp(bpl, min_bpl, max_bpl);
-	pix->sizeimage = pix->bytesperline * pix->height;
-	if (pix->pixelformat == V4L2_PIX_FMT_NV16)
-		pix->sizeimage *= 2;
-}
-
 static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 				      struct v4l2_pix_format *pix)
 {
@@ -561,7 +531,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 		return ret;
 
 	v4l2_fill_pix_format(pix, &fmt.format);
-	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
+	chan->vi->ops->vi_fmt_align(pix, fmtinfo->bpp);
 
 	__v4l2_subdev_state_free(sd_state);
 
@@ -613,7 +583,7 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 		return ret;
 
 	v4l2_fill_pix_format(pix, &fmt.format);
-	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
+	chan->vi->ops->vi_fmt_align(pix, fmtinfo->bpp);
 
 	chan->format = *pix;
 	chan->fmtinfo = fmtinfo;
@@ -649,7 +619,7 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
 	chan->format.bytesperline = chan->format.width * chan->fmtinfo->bpp;
 	chan->format.sizeimage = chan->format.bytesperline *
 				 chan->format.height;
-	tegra_channel_fmt_align(chan, &chan->format, chan->fmtinfo->bpp);
+	chan->vi->ops->vi_fmt_align(&chan->format, chan->fmtinfo->bpp);
 	tegra_channel_update_gangports(chan);
 
 	return 0;
@@ -818,7 +788,7 @@ static int tegra_channel_s_dv_timings(struct file *file, void *fh,
 	chan->format.height = bt->height;
 	chan->format.bytesperline = bt->width * chan->fmtinfo->bpp;
 	chan->format.sizeimage = chan->format.bytesperline * bt->height;
-	tegra_channel_fmt_align(chan, &chan->format, chan->fmtinfo->bpp);
+	chan->vi->ops->vi_fmt_align(&chan->format, chan->fmtinfo->bpp);
 	tegra_channel_update_gangports(chan);
 
 	return 0;
@@ -1149,7 +1119,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	chan->format.height = TEGRA_DEF_HEIGHT;
 	chan->format.bytesperline = TEGRA_DEF_WIDTH * chan->fmtinfo->bpp;
 	chan->format.sizeimage = chan->format.bytesperline * TEGRA_DEF_HEIGHT;
-	tegra_channel_fmt_align(chan, &chan->format, chan->fmtinfo->bpp);
+	vi->ops->vi_fmt_align(&chan->format, chan->fmtinfo->bpp);
 
 	ret = tegra_channel_host1x_syncpt_init(chan);
 	if (ret)
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index dfd834a69848..1021c730b595 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -25,17 +25,11 @@
 
 #define V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY	(V4L2_CTRL_CLASS_CAMERA | 0x1001)
 
-#define TEGRA_MIN_WIDTH		32U
-#define TEGRA_MAX_WIDTH		32768U
-#define TEGRA_MIN_HEIGHT	32U
-#define TEGRA_MAX_HEIGHT	32768U
-
 #define TEGRA_DEF_WIDTH		1920
 #define TEGRA_DEF_HEIGHT	1080
 #define TEGRA_IMAGE_FORMAT_DEF	32
 
 #define MAX_FORMAT_NUM		64
-#define SURFACE_ALIGN_BYTES	64
 
 enum tegra_vi_pg_mode {
 	TEGRA_VI_PG_DISABLED = 0,
@@ -45,6 +39,8 @@ enum tegra_vi_pg_mode {
 
 /**
  * struct tegra_vi_ops - Tegra VI operations
+ * @vi_fmt_align: modify `pix` to fit the hardware alignment
+ *		requirements and fill image geometry
  * @vi_start_streaming: starts media pipeline, subdevice streaming, sets up
  *		VI for capture and runs capture start and capture finish
  *		kthreads for capturing frames to buffer and returns them back.
@@ -52,6 +48,7 @@ enum tegra_vi_pg_mode {
  *		back any queued buffers.
  */
 struct tegra_vi_ops {
+	void (*vi_fmt_align)(struct v4l2_pix_format *pix, unsigned int bpp);
 	int (*vi_start_streaming)(struct vb2_queue *vq, u32 count);
 	void (*vi_stop_streaming)(struct vb2_queue *vq);
 };
-- 
2.34.1

