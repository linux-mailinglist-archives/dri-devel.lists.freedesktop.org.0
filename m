Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D919F3B3606
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360306ECA8;
	Thu, 24 Jun 2021 18:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24436EC78
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 18:26:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 5B97D1F44214
From: Ezequiel Garcia <ezequiel@collabora.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] media: hantro: Avoid redundant hantro_get_{dst,
 src}_buf() calls
Date: Thu, 24 Jun 2021 15:26:05 -0300
Message-Id: <20210624182612.177969-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210624182612.177969-1-ezequiel@collabora.com>
References: <20210624182612.177969-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Jun 2021 18:47:09 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Ezequiel Garcia <ezequiel@collabora.com>,
 Alex Bee <knaerzche@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Getting the next src/dst buffer is relatively expensive
so avoid doing it multiple times.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../staging/media/hantro/hantro_g1_h264_dec.c | 17 ++++++++---------
 .../staging/media/hantro/hantro_g1_vp8_dec.c  | 18 +++++++++---------
 .../media/hantro/rockchip_vpu2_hw_vp8_dec.c   | 19 +++++++++----------
 3 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 5c792b7bcb79..2aa37baad0c3 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -19,13 +19,12 @@
 #include "hantro_hw.h"
 #include "hantro_v4l2.h"
 
-static void set_params(struct hantro_ctx *ctx)
+static void set_params(struct hantro_ctx *ctx, struct vb2_v4l2_buffer *src_buf)
 {
 	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
 	const struct v4l2_ctrl_h264_decode_params *dec_param = ctrls->decode;
 	const struct v4l2_ctrl_h264_sps *sps = ctrls->sps;
 	const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
-	struct vb2_v4l2_buffer *src_buf = hantro_get_src_buf(ctx);
 	struct hantro_dev *vpu = ctx->dev;
 	u32 reg;
 
@@ -226,22 +225,20 @@ static void set_ref(struct hantro_ctx *ctx)
 	}
 }
 
-static void set_buffers(struct hantro_ctx *ctx)
+static void set_buffers(struct hantro_ctx *ctx, struct vb2_v4l2_buffer *src_buf)
 {
 	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct vb2_v4l2_buffer *dst_buf;
 	struct hantro_dev *vpu = ctx->dev;
 	dma_addr_t src_dma, dst_dma;
 	size_t offset = 0;
 
-	src_buf = hantro_get_src_buf(ctx);
-	dst_buf = hantro_get_dst_buf(ctx);
-
 	/* Source (stream) buffer. */
 	src_dma = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	vdpu_write_relaxed(vpu, src_dma, G1_REG_ADDR_STR);
 
 	/* Destination (decoded frame) buffer. */
+	dst_buf = hantro_get_dst_buf(ctx);
 	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
 	/* Adjust dma addr to start at second line for bottom field */
 	if (ctrls->decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
@@ -276,6 +273,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 int hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *src_buf;
 	int ret;
 
 	/* Prepare the H264 decoder context. */
@@ -284,9 +282,10 @@ int hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 		return ret;
 
 	/* Configure hardware registers. */
-	set_params(ctx);
+	src_buf = hantro_get_src_buf(ctx);
+	set_params(ctx, src_buf);
 	set_ref(ctx);
-	set_buffers(ctx);
+	set_buffers(ctx, src_buf);
 
 	hantro_end_prepare_run(ctx);
 
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 2afd5996d75f..6180b23e7d94 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -367,13 +367,12 @@ static void cfg_tap(struct hantro_ctx *ctx,
 }
 
 static void cfg_ref(struct hantro_ctx *ctx,
-		    const struct v4l2_ctrl_vp8_frame *hdr)
+		    const struct v4l2_ctrl_vp8_frame *hdr,
+		    struct vb2_v4l2_buffer *vb2_dst)
 {
 	struct hantro_dev *vpu = ctx->dev;
-	struct vb2_v4l2_buffer *vb2_dst;
 	dma_addr_t ref;
 
-	vb2_dst = hantro_get_dst_buf(ctx);
 
 	ref = hantro_get_ref(ctx, hdr->last_frame_ts);
 	if (!ref) {
@@ -405,16 +404,14 @@ static void cfg_ref(struct hantro_ctx *ctx,
 }
 
 static void cfg_buffers(struct hantro_ctx *ctx,
-			const struct v4l2_ctrl_vp8_frame *hdr)
+			const struct v4l2_ctrl_vp8_frame *hdr,
+			struct vb2_v4l2_buffer *vb2_dst)
 {
 	const struct v4l2_vp8_segment *seg = &hdr->segment;
 	struct hantro_dev *vpu = ctx->dev;
-	struct vb2_v4l2_buffer *vb2_dst;
 	dma_addr_t dst_dma;
 	u32 reg;
 
-	vb2_dst = hantro_get_dst_buf(ctx);
-
 	/* Set probability table buffer address */
 	vdpu_write_relaxed(vpu, ctx->vp8_dec.prob_tbl.dma,
 			   G1_REG_ADDR_QTABLE);
@@ -436,6 +433,7 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 {
 	const struct v4l2_ctrl_vp8_frame *hdr;
 	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *vb2_dst;
 	size_t height = ctx->dst_fmt.height;
 	size_t width = ctx->dst_fmt.width;
 	u32 mb_width, mb_height;
@@ -499,8 +497,10 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 	cfg_qp(ctx, hdr);
 	cfg_parts(ctx, hdr);
 	cfg_tap(ctx, hdr);
-	cfg_ref(ctx, hdr);
-	cfg_buffers(ctx, hdr);
+
+	vb2_dst = hantro_get_dst_buf(ctx);
+	cfg_ref(ctx, hdr, vb2_dst);
+	cfg_buffers(ctx, hdr, vb2_dst);
 
 	hantro_end_prepare_run(ctx);
 
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
index 704607511b57..d079075448c9 100644
--- a/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
@@ -444,14 +444,12 @@ static void cfg_tap(struct hantro_ctx *ctx,
 }
 
 static void cfg_ref(struct hantro_ctx *ctx,
-		    const struct v4l2_ctrl_vp8_frame *hdr)
+		    const struct v4l2_ctrl_vp8_frame *hdr,
+		    struct vb2_v4l2_buffer *vb2_dst)
 {
 	struct hantro_dev *vpu = ctx->dev;
-	struct vb2_v4l2_buffer *vb2_dst;
 	dma_addr_t ref;
 
-	vb2_dst = hantro_get_dst_buf(ctx);
-
 	ref = hantro_get_ref(ctx, hdr->last_frame_ts);
 	if (!ref) {
 		vpu_debug(0, "failed to find last frame ts=%llu\n",
@@ -482,16 +480,14 @@ static void cfg_ref(struct hantro_ctx *ctx,
 }
 
 static void cfg_buffers(struct hantro_ctx *ctx,
-			const struct v4l2_ctrl_vp8_frame *hdr)
+			const struct v4l2_ctrl_vp8_frame *hdr,
+			struct vb2_v4l2_buffer *vb2_dst)
 {
 	const struct v4l2_vp8_segment *seg = &hdr->segment;
 	struct hantro_dev *vpu = ctx->dev;
-	struct vb2_v4l2_buffer *vb2_dst;
 	dma_addr_t dst_dma;
 	u32 reg;
 
-	vb2_dst = hantro_get_dst_buf(ctx);
-
 	/* Set probability table buffer address */
 	vdpu_write_relaxed(vpu, ctx->vp8_dec.prob_tbl.dma,
 			   VDPU_REG_ADDR_QTABLE);
@@ -514,6 +510,7 @@ int rockchip_vpu2_vp8_dec_run(struct hantro_ctx *ctx)
 {
 	const struct v4l2_ctrl_vp8_frame *hdr;
 	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *vb2_dst;
 	size_t height = ctx->dst_fmt.height;
 	size_t width = ctx->dst_fmt.width;
 	u32 mb_width, mb_height;
@@ -590,8 +587,10 @@ int rockchip_vpu2_vp8_dec_run(struct hantro_ctx *ctx)
 	cfg_qp(ctx, hdr);
 	cfg_parts(ctx, hdr);
 	cfg_tap(ctx, hdr);
-	cfg_ref(ctx, hdr);
-	cfg_buffers(ctx, hdr);
+
+	vb2_dst = hantro_get_dst_buf(ctx);
+	cfg_ref(ctx, hdr, vb2_dst);
+	cfg_buffers(ctx, hdr, vb2_dst);
 
 	hantro_end_prepare_run(ctx);
 
-- 
2.30.0

