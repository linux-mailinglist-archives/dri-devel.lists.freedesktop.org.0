Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545D5489374
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4A012A946;
	Mon, 10 Jan 2022 08:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE572113F1F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:34:57 +0000 (UTC)
X-UUID: 31eb9187574448e691db08b03cfc2007-20220110
X-UUID: 31eb9187574448e691db08b03cfc2007-20220110
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 383103116; Mon, 10 Jan 2022 16:34:50 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 16:34:49 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 10 Jan 2022 16:34:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Jan 2022 16:34:46 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v4,
 02/15] media: mtk-vcodec: Using firmware type to separate different
 firmware architecture
Date: Mon, 10 Jan 2022 16:34:29 +0800
Message-ID: <20220110083442.32604-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110083442.32604-1-yunfei.dong@mediatek.com>
References: <20220110083442.32604-1-yunfei.dong@mediatek.com>
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

MT8173 platform use vpu firmware, mt8183/mt8192 will use scp
firmware instead, using chip name is not reasonable to separate
different firmware architecture. Using firmware type is much better.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateful.c   |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateless.c  |  2 --
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h  | 13 -------------
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  5 -----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c   |  6 ++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h   |  1 +
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c     |  4 ++--
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c     |  2 +-
 8 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index 04ca43c77e5f..7966c132be8f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -613,7 +613,6 @@ static struct vb2_ops mtk_vdec_frame_vb2_ops = {
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
-	.chip = MTK_MT8173,
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index 23d997ac114d..5aebf88f997b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -343,7 +343,6 @@ static struct vb2_ops mtk_vdec_request_vb2_ops = {
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
-	.chip = MTK_MT8183,
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
@@ -362,7 +361,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 
 /* This platform data is used for one lat and one core architecture. */
 const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
-	.chip = MTK_MT8192,
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 3fc747cea5c9..45d9e1be7063 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -335,13 +335,6 @@ struct mtk_vcodec_ctx {
 	struct vdec_msg_queue msg_queue;
 };
 
-enum mtk_chip {
-	MTK_MT8173,
-	MTK_MT8183,
-	MTK_MT8192,
-	MTK_MT8195,
-};
-
 /**
  * struct mtk_vdec_hw_arch - Used to separate different hardware architecture
  */
@@ -367,7 +360,6 @@ enum mtk_vdec_hw_arch {
  * @vdec_framesizes: supported video decoder frame sizes
  * @num_framesizes: count of video decoder frame sizes
  *
- * @chip: chip this decoder is compatible with
  * @hw_arch: hardware arch is used to separate pure_sin_core and lat_sin_core
  *
  * @is_subdev_supported: whether support parent-node architecture(subdev)
@@ -390,7 +382,6 @@ struct mtk_vcodec_dec_pdata {
 	const struct mtk_codec_framesizes *vdec_framesizes;
 	const int num_framesizes;
 
-	enum mtk_chip chip;
 	enum mtk_vdec_hw_arch hw_arch;
 
 	bool is_subdev_supported;
@@ -400,8 +391,6 @@ struct mtk_vcodec_dec_pdata {
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
  *
- * @chip: chip this encoder is compatible with
- *
  * @uses_ext: whether the encoder uses the extended firmware messaging format
  * @min_bitrate: minimum supported encoding bitrate
  * @max_bitrate: maximum supported encoding bitrate
@@ -412,8 +401,6 @@ struct mtk_vcodec_dec_pdata {
  * @core_id: stand for h264 or vp8 encode index
  */
 struct mtk_vcodec_enc_pdata {
-	enum mtk_chip chip;
-
 	bool uses_ext;
 	unsigned long min_bitrate;
 	unsigned long max_bitrate;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 507ad1ea2104..3ac6969c54c0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -378,7 +378,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
-	.chip = MTK_MT8173,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
 	.output_formats = mtk_video_formats_output,
@@ -389,7 +388,6 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
-	.chip = MTK_MT8173,
 	.capture_formats = mtk_video_formats_capture_vp8,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_vp8),
 	.output_formats = mtk_video_formats_output,
@@ -400,7 +398,6 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
-	.chip = MTK_MT8183,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -412,7 +409,6 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
-	.chip = MTK_MT8192,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -424,7 +420,6 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
-	.chip = MTK_MT8195,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
index 94b39ae5c2e1..556e54aadac9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
@@ -65,3 +65,9 @@ int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
 	return fw->ops->ipi_send(fw, id, buf, len, wait);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_ipi_send);
+
+int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw)
+{
+	return fw->type;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_type);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
index 539bb626772c..acd355961e3a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
@@ -39,5 +39,6 @@ int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw, int id,
 			       const char *name, void *priv);
 int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 			   void *buf, unsigned int len, unsigned int wait);
+int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
 
 #endif /* _MTK_VCODEC_FW_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index c84fac52fe26..21f6d9c5a371 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -33,8 +33,8 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 	 */
 	vpu->inst_id = 0xdeadbeef;
 
-	/* Firmware version field does not exist on MT8173. */
-	if (vpu->ctx->dev->vdec_pdata->chip == MTK_MT8173)
+	/* VPU firmware does not contain a version field. */
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VPU)
 		return;
 
 	/* Check firmware version. */
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index e7899d8a3e4e..d3570c4c177d 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -18,7 +18,7 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 					     msg->vpu_inst_addr);
 
 	/* Firmware version field value is unspecified on MT8173. */
-	if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VPU)
 		return;
 
 	/* Check firmware version. */
-- 
2.25.1

