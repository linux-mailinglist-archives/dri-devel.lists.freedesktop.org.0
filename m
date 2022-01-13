Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D61948D147
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 05:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137D210F76F;
	Thu, 13 Jan 2022 04:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45C410F714
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 04:11:27 +0000 (UTC)
X-UUID: b2db786f171548f48251f887c565ea4f-20220113
X-UUID: b2db786f171548f48251f887c565ea4f-20220113
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1877832670; Thu, 13 Jan 2022 12:11:24 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 13 Jan 2022 12:11:23 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 12:11:22 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v19,
 17/19] media: mtk-vcodec: Use codec type to separate different
 hardware
Date: Thu, 13 Jan 2022 12:10:53 +0800
Message-ID: <20220113041055.25213-18-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113041055.25213-1-yunfei.dong@mediatek.com>
References: <20220113041055.25213-1-yunfei.dong@mediatek.com>
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is just one core thread, in order to separate different
hardware, using codec type to separeate it in scp driver.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 12 ++++---
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 34 ++++++++++++++++---
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  4 +++
 3 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 9d8079c4f976..bf54d6d9a857 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -35,6 +35,8 @@ enum vdec_ipi_msgid {
  * @msg_id	: vdec_ipi_msgid
  * @vpu_inst_addr : VPU decoder instance address. Used if ABI version < 2.
  * @inst_id     : instance ID. Used if the ABI version >= 2.
+ * @codec_type	: codec fourcc
+ * @reserved	: reserved param
  */
 struct vdec_ap_ipi_cmd {
 	uint32_t msg_id;
@@ -42,6 +44,8 @@ struct vdec_ap_ipi_cmd {
 		uint32_t vpu_inst_addr;
 		uint32_t inst_id;
 	};
+	u32 codec_type;
+	u32 reserved;
 };
 
 /**
@@ -59,12 +63,12 @@ struct vdec_vpu_ipi_ack {
 /**
  * struct vdec_ap_ipi_init - for AP_IPIMSG_DEC_INIT
  * @msg_id	: AP_IPIMSG_DEC_INIT
- * @reserved	: Reserved field
+ * @codec_type	: codec fourcc
  * @ap_inst_addr	: AP video decoder instance address
  */
 struct vdec_ap_ipi_init {
 	uint32_t msg_id;
-	uint32_t reserved;
+	u32 codec_type;
 	uint64_t ap_inst_addr;
 };
 
@@ -77,7 +81,7 @@ struct vdec_ap_ipi_init {
  *	H264 decoder [0]:buf_sz [1]:nal_start
  *	VP8 decoder  [0]:width/height
  *	VP9 decoder  [0]:profile, [1][2] width/height
- * @reserved	: Reserved field
+ * @codec_type	: codec fourcc
  */
 struct vdec_ap_ipi_dec_start {
 	uint32_t msg_id;
@@ -86,7 +90,7 @@ struct vdec_ap_ipi_dec_start {
 		uint32_t inst_id;
 	};
 	uint32_t data[3];
-	uint32_t reserved;
+	u32 codec_type;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index bfd8e87dceff..dd35d2c5f920 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -100,18 +100,29 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 {
-	int err;
+	int err, id, msgid;
 
-	mtk_vcodec_debug(vpu, "id=%X", *(uint32_t *)msg);
+	msgid = *(uint32_t *)msg;
+	mtk_vcodec_debug(vpu, "id=%X", msgid);
 
 	vpu->failure = 0;
 	vpu->signaled = 0;
 
-	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, vpu->id, msg,
+	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
+		if (msgid == AP_IPIMSG_DEC_CORE ||
+		    msgid == AP_IPIMSG_DEC_CORE_END)
+			id = vpu->core_id;
+		else
+			id = vpu->id;
+	} else {
+		id = vpu->id;
+	}
+
+	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, id, msg,
 				     len, 2000);
 	if (err) {
 		mtk_vcodec_err(vpu, "send fail vpu_id=%d msg_id=%X status=%d",
-			       vpu->id, *(uint32_t *)msg, err);
+			       id, msgid, err);
 		return err;
 	}
 
@@ -131,6 +142,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 		msg.vpu_inst_addr = vpu->inst_addr;
 	else
 		msg.inst_id = vpu->inst_id;
+	msg.codec_type = vpu->codec_type;
 
 	err = vcodec_vpu_send_msg(vpu, &msg, sizeof(msg));
 	mtk_vcodec_debug(vpu, "- id=%X ret=%d", msg_id, err);
@@ -149,14 +161,25 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 
 	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
 					 vpu->handler, "vdec", NULL);
-	if (err != 0) {
+	if (err) {
 		mtk_vcodec_err(vpu, "vpu_ipi_register fail status=%d", err);
 		return err;
 	}
 
+	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
+		err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
+						 vpu->core_id, vpu->handler,
+						 "vdec", NULL);
+		if (err) {
+			mtk_vcodec_err(vpu, "vpu_ipi_register core fail status=%d", err);
+			return err;
+		}
+	}
+
 	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = AP_IPIMSG_DEC_INIT;
 	msg.ap_inst_addr = (unsigned long)vpu;
+	msg.codec_type = vpu->codec_type;
 
 	mtk_vcodec_debug(vpu, "vdec_inst=%p", vpu);
 
@@ -187,6 +210,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 
 	for (i = 0; i < len; i++)
 		msg.data[i] = data[i];
+	msg.codec_type = vpu->codec_type;
 
 	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
 	mtk_vcodec_debug(vpu, "- ret=%d", err);
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index ae24b75d1649..4cb3c7f5a3ad 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -14,6 +14,7 @@ struct mtk_vcodec_ctx;
 /**
  * struct vdec_vpu_inst - VPU instance for video codec
  * @id          : ipi msg id for each decoder
+ * @core_id     : core id used to separate different hardware
  * @vsi         : driver structure allocated by VPU side and shared to AP side
  *                for control and info share
  * @failure     : VPU execution result status, 0: success, others: fail
@@ -26,9 +27,11 @@ struct mtk_vcodec_ctx;
  * @dev		: platform device of VPU
  * @wq          : wait queue to wait VPU message ack
  * @handler     : ipi handler for each decoder
+ * @codec_type     : use codec type to separate different codecs
  */
 struct vdec_vpu_inst {
 	int id;
+	int core_id;
 	void *vsi;
 	int32_t failure;
 	uint32_t inst_addr;
@@ -38,6 +41,7 @@ struct vdec_vpu_inst {
 	struct mtk_vcodec_ctx *ctx;
 	wait_queue_head_t wq;
 	mtk_vcodec_ipi_handler handler;
+	unsigned int codec_type;
 };
 
 /**
-- 
2.25.1

