Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B823B35FF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8A66EC9D;
	Thu, 24 Jun 2021 18:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDB46E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 18:26:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 4D9CF1F44210
From: Ezequiel Garcia <ezequiel@collabora.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/12] hantro: vp8: Move noisy WARN_ON to vpu_debug
Date: Thu, 24 Jun 2021 15:26:03 -0300
Message-Id: <20210624182612.177969-4-ezequiel@collabora.com>
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Ezequiel Garcia <ezequiel@collabora.com>, Alex Bee <knaerzche@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Thierry Reding <thierry.reding@gmail.com>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Chris Healy <cphealy@gmail.com>, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the VP8 decoders can't find a reference frame,
the driver falls back to the current output frame.

This will probably produce some undesirable results,
leading to frame corruption, but shouldn't cause
noisy warnings.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c    | 13 ++++++++++---
 .../staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 96622a7f8279..2afd5996d75f 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -376,12 +376,17 @@ static void cfg_ref(struct hantro_ctx *ctx,
 	vb2_dst = hantro_get_dst_buf(ctx);
 
 	ref = hantro_get_ref(ctx, hdr->last_frame_ts);
-	if (!ref)
+	if (!ref) {
+		vpu_debug(0, "failed to find last frame ts=%llu\n",
+			  hdr->last_frame_ts);
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
+	}
 	vdpu_write_relaxed(vpu, ref, G1_REG_ADDR_REF(0));
 
 	ref = hantro_get_ref(ctx, hdr->golden_frame_ts);
-	WARN_ON(!ref && hdr->golden_frame_ts);
+	if (!ref && hdr->golden_frame_ts)
+		vpu_debug(0, "failed to find golden frame ts=%llu\n",
+			  hdr->golden_frame_ts);
 	if (!ref)
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
 	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN)
@@ -389,7 +394,9 @@ static void cfg_ref(struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, ref, G1_REG_ADDR_REF(4));
 
 	ref = hantro_get_ref(ctx, hdr->alt_frame_ts);
-	WARN_ON(!ref && hdr->alt_frame_ts);
+	if (!ref && hdr->alt_frame_ts)
+		vpu_debug(0, "failed to find alt frame ts=%llu\n",
+			  hdr->alt_frame_ts);
 	if (!ref)
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
 	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT)
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
index 951b55f58a61..704607511b57 100644
--- a/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
@@ -453,12 +453,17 @@ static void cfg_ref(struct hantro_ctx *ctx,
 	vb2_dst = hantro_get_dst_buf(ctx);
 
 	ref = hantro_get_ref(ctx, hdr->last_frame_ts);
-	if (!ref)
+	if (!ref) {
+		vpu_debug(0, "failed to find last frame ts=%llu\n",
+			  hdr->last_frame_ts);
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
+	}
 	vdpu_write_relaxed(vpu, ref, VDPU_REG_VP8_ADDR_REF0);
 
 	ref = hantro_get_ref(ctx, hdr->golden_frame_ts);
-	WARN_ON(!ref && hdr->golden_frame_ts);
+	if (!ref && hdr->golden_frame_ts)
+		vpu_debug(0, "failed to find golden frame ts=%llu\n",
+			  hdr->golden_frame_ts);
 	if (!ref)
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
 	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN)
@@ -466,7 +471,9 @@ static void cfg_ref(struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, ref, VDPU_REG_VP8_ADDR_REF2_5(2));
 
 	ref = hantro_get_ref(ctx, hdr->alt_frame_ts);
-	WARN_ON(!ref && hdr->alt_frame_ts);
+	if (!ref && hdr->alt_frame_ts)
+		vpu_debug(0, "failed to find alt frame ts=%llu\n",
+			  hdr->alt_frame_ts);
 	if (!ref)
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
 	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT)
-- 
2.30.0

