Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D89CC4807F4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 10:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC7710E244;
	Tue, 28 Dec 2021 09:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD74C10E215
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 09:41:57 +0000 (UTC)
X-UUID: ba432fa5dd644f938644b79562471636-20211228
X-UUID: ba432fa5dd644f938644b79562471636-20211228
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 160006172; Tue, 28 Dec 2021 17:41:55 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Dec 2021 17:41:54 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Dec 2021 17:41:52 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v2,
 03/12] media: mtk-vcodec: get capture queue buffer size from scp
Date: Tue, 28 Dec 2021 17:41:37 +0800
Message-ID: <20211228094146.20505-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228094146.20505-1-yunfei.dong@mediatek.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
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
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

Different capture buffer format has different buffer size, need to get
real buffer size according to buffer type from scp.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  2 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 36 +++++++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 51 +++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   | 15 ++++++
 5 files changed, 106 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 130ecef2e766..87891ebd7246 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -466,6 +466,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 			}
 			ctx->state = MTK_STATE_INIT;
 		}
+	} else {
+		ctx->capture_fourcc = fmt->fourcc;
 	}
 
 	/*
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index a23a7646437c..95e07cf2cd3e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -277,6 +277,7 @@ struct vdec_pic_info {
  *		     to be used with encoder and stateful decoder.
  * @is_flushing: set to true if flushing is in progress.
  * @current_codec: current set input codec, in V4L2 pixel format
+ * @capture_fourcc: capture queue type in V4L2 pixel format
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
  * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
@@ -322,6 +323,7 @@ struct mtk_vcodec_ctx {
 	bool is_flushing;
 
 	u32 current_codec;
+	u32 capture_fourcc;
 
 	enum v4l2_colorspace colorspace;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 5daca8d52ebb..d00e555cf27a 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -20,6 +20,7 @@ enum vdec_ipi_msgid {
 	AP_IPIMSG_DEC_RESET = 0xA004,
 	AP_IPIMSG_DEC_CORE = 0xA005,
 	AP_IPIMSG_DEC_CORE_END = 0xA006,
+	AP_IPIMSG_DEC_GET_PARAM = 0xA007,
 
 	VPU_IPIMSG_DEC_INIT_ACK = 0xB000,
 	VPU_IPIMSG_DEC_START_ACK = 0xB001,
@@ -28,6 +29,7 @@ enum vdec_ipi_msgid {
 	VPU_IPIMSG_DEC_RESET_ACK = 0xB004,
 	VPU_IPIMSG_DEC_CORE_ACK = 0xB005,
 	VPU_IPIMSG_DEC_CORE_END_ACK = 0xB006,
+	VPU_IPIMSG_DEC_GET_PARAM_ACK = 0xB007,
 };
 
 /**
@@ -114,4 +116,38 @@ struct vdec_vpu_ipi_init_ack {
 	uint32_t inst_id;
 };
 
+/**
+ * struct vdec_ap_ipi_get_param - for AP_IPIMSG_SET_PARAM
+ * @msg_id	: AP_IPIMSG_DEC_START
+ * @inst_id     : instance ID. Used if the ABI version >= 2.
+ * @data	: picture information
+ * @param_type	: get param type
+ * @codec_type	: Codec fourcc
+ */
+struct vdec_ap_ipi_get_param {
+	uint32_t msg_id;
+	uint32_t inst_id;
+	uint32_t data[4];
+	uint32_t param_type;
+	uint32_t codec_type;
+};
+
+
+/**
+ * struct vdec_vpu_ipi_init_ack - for VPU_IPIMSG_DEC_INIT_ACK
+ * @msg_id	: VPU_IPIMSG_DEC_INIT_ACK
+ * @status	: VPU exeuction result
+ * @ap_inst_addr	: AP vcodec_vpu_inst instance address
+ * @data     : picture information from SCP.
+ * @param_type	: get param type
+ */
+struct vdec_vpu_ipi_get_param_ack {
+	uint32_t msg_id;
+	int32_t status;
+	uint64_t ap_inst_addr;
+	uint32_t data[4];
+	uint32_t param_type;
+	uint32_t reserved;
+};
+
 #endif
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 21f6d9c5a371..6f9bcc2b0bb9 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -54,6 +54,27 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 	}
 }
 
+static void handle_get_param_msg_ack(
+	const struct vdec_vpu_ipi_get_param_ack *msg)
+{
+	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
+					(unsigned long)msg->ap_inst_addr;
+
+	mtk_vcodec_debug(vpu, "+ ap_inst_addr = 0x%llx", msg->ap_inst_addr);
+
+	/* param_type is enum vdec_get_param_type */
+	switch(msg->param_type) {
+	case 2:
+		vpu->fb_sz[0] = msg->data[0];
+		vpu->fb_sz[1] = msg->data[1];
+		break;
+	default:
+		mtk_vcodec_err(vpu, "invalid get param type=%d", msg->param_type);
+		vpu->failure = 1;
+		break;
+	}
+}
+
 /*
  * vpu_dec_ipi_handler - Handler for VPU ipi message.
  *
@@ -89,6 +110,9 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 		case VPU_IPIMSG_DEC_CORE_END_ACK:
 			break;
 
+		case VPU_IPIMSG_DEC_GET_PARAM_ACK:
+			handle_get_param_msg_ack(data);
+			break;
 		default:
 			mtk_vcodec_err(vpu, "invalid msg=%X", msg->msg_id);
 			break;
@@ -217,6 +241,33 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 	return err;
 }
 
+int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
+	unsigned int len, unsigned int param_type)
+{
+	struct vdec_ap_ipi_get_param msg;
+	int i;
+	int err;
+
+	mtk_vcodec_debug_enter(vpu);
+
+	if (len > ARRAY_SIZE(msg.data)) {
+		mtk_vcodec_err(vpu, "invalid len = %d\n", len);
+		return -EINVAL;
+	}
+
+	memset(&msg, 0, sizeof(msg));
+	msg.msg_id = AP_IPIMSG_DEC_GET_PARAM;
+	msg.inst_id = vpu->inst_id;
+	for (i = 0; i < len; i++)
+		msg.data[i] = data[i];
+	msg.param_type = param_type;
+	msg.codec_type = vpu->codec_type;
+
+	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
+	mtk_vcodec_debug(vpu, "- ret=%d", err);
+	return err;
+}
+
 int vpu_dec_core(struct vdec_vpu_inst *vpu)
 {
 	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_CORE);
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index 4cb3c7f5a3ad..963f8d4877b7 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -28,6 +28,8 @@ struct mtk_vcodec_ctx;
  * @wq          : wait queue to wait VPU message ack
  * @handler     : ipi handler for each decoder
  * @codec_type     : use codec type to separate different codecs
+ * @capture_type    : used capture type to separate different capture format
+ * @fb_sz  : frame buffer size of each plane
  */
 struct vdec_vpu_inst {
 	int id;
@@ -42,6 +44,8 @@ struct vdec_vpu_inst {
 	wait_queue_head_t wq;
 	mtk_vcodec_ipi_handler handler;
 	unsigned int codec_type;
+	unsigned int capture_type;
+	unsigned int fb_sz[2];
 };
 
 /**
@@ -104,4 +108,15 @@ int vpu_dec_core(struct vdec_vpu_inst *vpu);
  */
 int vpu_dec_core_end(struct vdec_vpu_inst *vpu);
 
+/**
+ * vpu_dec_get_param - get param from scp
+ *
+ * @vpu : instance for vdec_vpu_inst
+ * @data: meta data to pass bitstream info to VPU decoder
+ * @len : meta data length
+ * @param_type : get param type
+ */
+int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
+	unsigned int len, unsigned int param_type);
+
 #endif
-- 
2.25.1

