Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BF80694F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 09:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4C510E6A7;
	Wed,  6 Dec 2023 08:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A83910E6A0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 08:16:01 +0000 (UTC)
X-UUID: ae1be184940f11ee8051498923ad61e6-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9iSSK3aCMn3USGH6OeE2/3/hdEQJKNChvSI8XpPt0hI=; 
 b=kD2OWiYmYRpoVL2ICWr3NUKs3DBmkfwbD9pwRDi0xsCYLlDNPQdOFaAzRl/fAa9e+HFI5WJJpWgRZWjeDMEwKQ6jO5AQYmS3AFQUbtbVN2oZDCdxcTTtBRkW8ma1FabmeOn31avMX38v49STWeAMBHn6HEQ5OJsIkVFzUUh6eZQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34, REQID:bd7de911-606d-4638-9d0d-453c074cbf1a, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:abefa75, CLOUDID:b7e87773-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ae1be184940f11ee8051498923ad61e6-20231206
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 504411420; Wed, 06 Dec 2023 16:15:56 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 16:15:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 16:15:53 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Subject: [PATCH v3,
 11/21] media: mediatek: vcodec: initialize msg and vsi information
Date: Wed, 6 Dec 2023 16:15:28 +0800
Message-ID: <20231206081538.17056-12-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206081538.17056-1-yunfei.dong@mediatek.com>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.774500-8.000000
X-TMASE-MatchedRID: jC5X9J9XZ3oiRWw1gHaWSxuZoNKc6pl+MJlSCRpjLV32MjGUf5GHsWb6
 PphVtfZgVkkQSrH2rvhtS1CTbpfjUP/Js/ghYmSK7spMO3HwKCARWG8HyxfLI7lmMfLNiukaG/k
 B0flY/cWGe+0MUSZloS2Rxuw/iP4W2HzzjwqZ3wJPuMJi/ZAk8V3HHpZF/7mw/RM/+SKR6qe25B
 ylI3cMJL1QsHlkpLKtihP7kE5hi1yxP8oxx7elnqngbqTYC4GHfS0Ip2eEHnz3IzXlXlpamPoLR
 4+zsDTtIAmDJ33CtzyiELxJofS438QP+HUm8MfQsqrYSToICJNpYEssH22PmfNWhMFTXr/W
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.774500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D8C33EF720B5545E0DD5663B3336768C28B3C073E19819F8C276C55AC8EA34262000:8
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Steve Cho <stevecho@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-mediatek@lists.infradead.org, "T
 . J . Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Need to initialize msg and vsi information before sending to optee-os, then
calling optee invoke command to send the information to optee-os.

For the optee communication interface is different with scp, using
flag to separate them.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     | 49 ++++++++++++++++---
 .../mediatek/vcodec/decoder/vdec_vpu_if.h     |  4 ++
 3 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index b1a2107f2a1e..47eca245dc07 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -175,6 +175,7 @@ struct mtk_vcodec_dec_pdata {
  * @vpu_inst: vpu instance pointer.
  *
  * @is_10bit_bitstream: set to true if it's 10bit bitstream
+ * @is_secure_playback: Secure Video Playback (SVP) mode
  */
 struct mtk_vcodec_dec_ctx {
 	enum mtk_instance_type type;
@@ -220,6 +221,7 @@ struct mtk_vcodec_dec_ctx {
 	void *vpu_inst;
 
 	bool is_10bit_bitstream;
+	bool is_secure_playback;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 82e57ae983d5..5336769a3fb5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -148,7 +148,10 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 {
-	int err, id, msgid;
+	struct mtk_vdec_optee_data_to_shm *optee_data;
+	int data_size, id, hw_id, msgid;
+	void *ack_msg, *data_msg;
+	int err;
 
 	msgid = *(uint32_t *)msg;
 	mtk_vdec_debug(vpu->ctx, "id=%X", msgid);
@@ -158,16 +161,46 @@ static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 
 	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
 		if (msgid == AP_IPIMSG_DEC_CORE ||
-		    msgid == AP_IPIMSG_DEC_CORE_END)
+		    msgid == AP_IPIMSG_DEC_CORE_END) {
+			optee_data = &vpu->core_optee_info;
 			id = vpu->core_id;
-		else
+		} else {
+			optee_data = &vpu->lat_optee_info;
 			id = vpu->id;
+		}
 	} else {
+		optee_data = &vpu->lat_optee_info;
 		id = vpu->id;
 	}
 
-	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, id, msg,
-				     len, 2000);
+	if (!vpu->ctx->is_secure_playback) {
+		err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, id, msg, len, 2000);
+	} else {
+		hw_id = (id == SCP_IPI_VDEC_LAT) ? MTK_VDEC_LAT0 : MTK_VDEC_CORE;
+
+		mtk_vcodec_dec_optee_set_data(optee_data, msg, len, OPTEE_MSG_INDEX);
+
+		/* There is no need to copy the data (VSI) message to shared memory,
+		 * but we still need to set the buffer size to a non-zero value.
+		 */
+		if (msgid == AP_IPIMSG_DEC_CORE || msgid == AP_IPIMSG_DEC_START) {
+			data_msg = mtk_vcodec_dec_get_shm_buffer_va(vpu->ctx->dev->optee_private,
+								    hw_id, OPTEE_DATA_INDEX);
+			data_size = mtk_vcodec_dec_get_shm_buffer_size(vpu->ctx->dev->optee_private,
+								       hw_id, OPTEE_DATA_INDEX);
+			mtk_vcodec_dec_optee_set_data(optee_data, data_msg, data_size,
+						      OPTEE_DATA_INDEX);
+		}
+
+		err = mtk_vcodec_dec_optee_invokd_cmd(vpu->ctx->dev->optee_private,
+						      hw_id, optee_data);
+		vpu->failure = err;
+
+		ack_msg = mtk_vcodec_dec_get_shm_buffer_va(vpu->ctx->dev->optee_private, hw_id,
+							   OPTEE_MSG_INDEX);
+		vpu_dec_ipi_handler(ack_msg, 0, vpu->ctx->dev);
+	}
+
 	if (err) {
 		mtk_vdec_err(vpu->ctx, "send fail vpu_id=%d msg_id=%X status=%d",
 			     id, msgid, err);
@@ -213,7 +246,11 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 		return err;
 	}
 
-	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
+	/* Using tee interface to communicate with optee os directly for SVP mode,
+	 * fw ipi interface is used for normal playback.
+	 */
+	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE &&
+	    !vpu->ctx->is_secure_playback) {
 		err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
 						 vpu->core_id, vpu->handler,
 						 "vdec", vpu->ctx->dev);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
index fbb3f34a73f0..946e5abcc7d3 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
@@ -28,6 +28,8 @@ struct mtk_vcodec_dec_ctx;
  * @codec_type     : use codec type to separate different codecs
  * @capture_type:	used capture type to separate different capture format
  * @fb_sz  : frame buffer size of each plane
+ * @lat_optee_info  : used to send msg to optee shm buffer
+ * @core_optee_info  : used to send msg to optee shm buffer
  */
 struct vdec_vpu_inst {
 	int id;
@@ -44,6 +46,8 @@ struct vdec_vpu_inst {
 	unsigned int codec_type;
 	unsigned int capture_type;
 	unsigned int fb_sz[2];
+	struct mtk_vdec_optee_data_to_shm lat_optee_info;
+	struct mtk_vdec_optee_data_to_shm core_optee_info;
 };
 
 /**
-- 
2.18.0

