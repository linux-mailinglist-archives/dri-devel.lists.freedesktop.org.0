Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 983954ED1E0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 04:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4DF10F3A8;
	Thu, 31 Mar 2022 02:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F7D10F3A8
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 02:48:39 +0000 (UTC)
X-UUID: 7df92c2ab3594db88f0a6915c0a9ba41-20220331
X-UUID: 7df92c2ab3594db88f0a6915c0a9ba41-20220331
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 269154300; Thu, 31 Mar 2022 10:48:35 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 10:48:34 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 10:48:27 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v8,
 05/17] media: mediatek: vcodec: set each plane bytesused in buf
 prepare
Date: Thu, 31 Mar 2022 10:47:49 +0800
Message-ID: <20220331024801.29229-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331024801.29229-1-yunfei.dong@mediatek.com>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

call vb2_set_plane_payload to set each plane bytesused in buf prepare,
need not to set independently for stateless and statefull architectures.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c |  2 ++
 .../mediatek/vcodec/mtk_vcodec_dec_stateful.c |  5 -----
 .../vcodec/mtk_vcodec_dec_stateless.c         | 19 -------------------
 3 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index e42d5c17d90e..c1c3f439d7d1 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -741,6 +741,8 @@ int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 				i, vb2_plane_size(vb, i),
 				q_data->sizeimage[i]);
 		}
+		if (!V4L2_TYPE_IS_OUTPUT(vb->type))
+			vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
index 7966c132be8f..e7fd39180123 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
@@ -90,11 +90,6 @@ static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
 	vb = &dstbuf->m2m_buf.vb;
 	mutex_lock(&ctx->lock);
 	if (dstbuf->used) {
-		vb2_set_plane_payload(&vb->vb2_buf, 0, ctx->picinfo.fb_sz[0]);
-		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
-			vb2_set_plane_payload(&vb->vb2_buf, 1,
-					      ctx->picinfo.fb_sz[1]);
-
 		mtk_v4l2_debug(2, "[%d]status=%x queue id=%d to done_list %d",
 			       ctx->id, disp_frame_buffer->status,
 			       vb->vb2_buf.index, dstbuf->queued_in_vb2);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 5aebf88f997b..4df7b158ec5e 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -108,23 +108,6 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
 
 #define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
 
-static void mtk_vdec_stateless_set_dst_payload(struct mtk_vcodec_ctx *ctx,
-					       struct vdec_fb *fb)
-{
-	struct mtk_video_dec_buf *vdec_frame_buf =
-		container_of(fb, struct mtk_video_dec_buf, frame_buffer);
-	struct vb2_v4l2_buffer *vb = &vdec_frame_buf->m2m_buf.vb;
-	unsigned int cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
-
-	vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
-	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
-		unsigned int cap_c_size =
-			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
-
-		vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
-	}
-}
-
 static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
 					   struct vb2_v4l2_buffer *vb2_v4l2)
 {
@@ -220,8 +203,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 		}
 	}
 
-	mtk_vdec_stateless_set_dst_payload(ctx, dst_buf);
-
 	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
 					 ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
 
-- 
2.18.0

