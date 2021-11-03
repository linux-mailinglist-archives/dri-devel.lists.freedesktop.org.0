Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B08443BEA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 04:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA5B6E056;
	Wed,  3 Nov 2021 03:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A936E056
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 03:37:17 +0000 (UTC)
X-UUID: 865cbfb917494ae18ed211057195df6b-20211103
X-UUID: 865cbfb917494ae18ed211057195df6b-20211103
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1412010393; Wed, 03 Nov 2021 11:37:13 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 11:37:12 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 3 Nov 2021 11:37:12 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Nov 2021 11:37:10 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Steve Cho <stevecho@google.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v2] media: mtk-vcodec: Align width and height to 64 bytes
Date: Wed, 3 Nov 2021 11:37:08 +0800
Message-ID: <20211103033708.14469-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Irui Wang <irui.wang@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Width and height need to 64 bytes aligned when setting the format.
Need to make sure all is 64 bytes align when use width and height to
calculate buffer size.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Change-Id: I39886b1a6b433c92565ddbf297eb193456eec1d2
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h        | 1 +
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index e30806c1faea..66cd6d2242c3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -11,6 +11,7 @@
 #include <media/videobuf2-core.h>
 #include <media/v4l2-mem2mem.h>
 
+#define VCODEC_DEC_ALIGNED_64 64
 #define VCODEC_CAPABILITY_4K_DISABLED	0x10
 #define VCODEC_DEC_4K_CODED_WIDTH	4096U
 #define VCODEC_DEC_4K_CODED_HEIGHT	2304U
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
index d402fc4bda69..e1a3011772a9 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
@@ -562,8 +562,8 @@ static void get_pic_info(struct vdec_h264_slice_inst *inst,
 {
 	struct mtk_vcodec_ctx *ctx = inst->ctx;
 
-	ctx->picinfo.buf_w = (ctx->picinfo.pic_w + 15) & 0xFFFFFFF0;
-	ctx->picinfo.buf_h = (ctx->picinfo.pic_h + 31) & 0xFFFFFFE0;
+	ctx->picinfo.buf_w = ALIGN(ctx->picinfo.pic_w, VCODEC_DEC_ALIGNED_64);
+	ctx->picinfo.buf_h = ALIGN(ctx->picinfo.pic_h, VCODEC_DEC_ALIGNED_64);
 	ctx->picinfo.fb_sz[0] = ctx->picinfo.buf_w * ctx->picinfo.buf_h;
 	ctx->picinfo.fb_sz[1] = ctx->picinfo.fb_sz[0] >> 1;
 	inst->vsi_ctx.dec.cap_num_planes =
-- 
2.25.1

