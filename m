Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F26480694A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 09:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4433210E6A4;
	Wed,  6 Dec 2023 08:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B32210E6B7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 08:15:58 +0000 (UTC)
X-UUID: ac822db0940f11ee8051498923ad61e6-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DMqBb8ywjQ0rZOsEH87m6D0Csn8bNMMs2dmXkp7WJNQ=; 
 b=suUdqM844XPz+3d51w7mqblLxLtywKOgUZYKmkvxOXiKzpC4tU9p08y0jNq4O/rdLk8uWbaq6EYduY3yIvTs55IBgESqyDyvZ37cRFkUPCpuyTFOeAMQSiDWrVbGpQCJSKoXr0Z+NVArgmn7qLd2pSr+k6wk/eLSE6oafP6wiQs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34, REQID:05ea089b-f07d-435d-a503-df301c288166, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:abefa75, CLOUDID:4679e060-c89d-4129-91cb-8ebfae4653fc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ac822db0940f11ee8051498923ad61e6-20231206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1809783144; Wed, 06 Dec 2023 16:15:53 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 16:15:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 16:15:50 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Subject: [PATCH v3,09/21] media: mediatek: vcodec: allocate tee share memory
Date: Wed, 6 Dec 2023 16:15:26 +0800
Message-ID: <20231206081538.17056-10-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206081538.17056-1-yunfei.dong@mediatek.com>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.400800-8.000000
X-TMASE-MatchedRID: +Xe+hmBfvL5A5/DRRISQHAPZZctd3P4BK2i9pofGVSuYBF1C0J2QPotf
 Mtu9FfbrPcGjGTU7TndXUz+XcOBhEYYCBZzro74fDB+ErBr0bAO2McZY43zJ423D6f6IpbLIyo3
 1HV/erwydBDUJwKypkLvrVFvaS3pv9A9EfhuU0xx1e7Xbb6Im2pRy1HDTPOXaW+jwVKpqvlI9yB
 u1TZGrQeLzNWBegCW2wgn7iDBesS3CttcwYNipX9TGCNBptnYun5DLLJVJV30sBvUgh06xuAKG4
 aT8V85fCMu1t+UdIjdWXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.400800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CE10DDF852BA61A8626F5852BC8342D41FA6139D30802DEEE943852D838DAF8B2000:8
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

Allocate two share memory for each lat and core hardware used to share
information with optee-os. Msg buffer used to send ipi command and get ack
command with optee-os, data buffer used to store vsi information which
used for hardware decode.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 80 ++++++++++++++++++-
 .../vcodec/decoder/mtk_vcodec_dec_optee.h     | 32 ++++++++
 2 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
index 38d9c1c1785a..611fb0e56480 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
@@ -47,13 +47,69 @@ int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev)
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_private_init);
 
+static void mtk_vcodec_dec_optee_deinit_memref(struct mtk_vdec_optee_ca_info *ca_info,
+					       enum mtk_vdec_optee_data_index data_index)
+{
+	tee_shm_free(ca_info->shm_memref[data_index].msg_shm);
+}
+
+static int mtk_vcodec_dec_optee_init_memref(struct tee_context *tee_vdec_ctx,
+					    struct mtk_vdec_optee_ca_info *ca_info,
+					    enum mtk_vdec_optee_data_index data_index)
+{
+	struct mtk_vdec_optee_shm_memref *shm_memref;
+	int alloc_size = 0, err = 0;
+	u64 shm_param_type = 0;
+	bool copy_buffer;
+
+	switch (data_index) {
+	case OPTEE_MSG_INDEX:
+		shm_param_type = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
+		alloc_size = MTK_VDEC_OPTEE_MSG_SIZE;
+		copy_buffer = true;
+		break;
+	case OPTEE_DATA_INDEX:
+		shm_param_type = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
+		alloc_size = MTK_VDEC_OPTEE_HW_SIZE;
+		copy_buffer = false;
+		break;
+	default:
+		pr_err(MTK_DBG_VCODEC_STR "tee invalid data_index: %d.\n", data_index);
+		return -EINVAL;
+	}
+
+	shm_memref = &ca_info->shm_memref[data_index];
+
+	/* Allocate dynamic shared memory with decoder TA */
+	shm_memref->msg_shm_size = alloc_size;
+	shm_memref->param_type = shm_param_type;
+	shm_memref->copy_to_ta = copy_buffer;
+	shm_memref->msg_shm = tee_shm_alloc_kernel_buf(tee_vdec_ctx, shm_memref->msg_shm_size);
+	if (IS_ERR(shm_memref->msg_shm)) {
+		pr_err(MTK_DBG_VCODEC_STR "tee alloc buf fail: data_index:%d.\n", data_index);
+		return -ENOMEM;
+	}
+
+	shm_memref->msg_shm_ca_buf = tee_shm_get_va(shm_memref->msg_shm, 0);
+	if (IS_ERR(shm_memref->msg_shm_ca_buf)) {
+		pr_err(MTK_DBG_VCODEC_STR "tee get shm va fail: data_index:%d.\n", data_index);
+		err = PTR_ERR(shm_memref->msg_shm_ca_buf);
+		goto err_get_msg_va;
+	}
+
+	return err;
+err_get_msg_va:
+	tee_shm_free(shm_memref->msg_shm);
+	return err;
+}
+
 static int mtk_vcodec_dec_optee_init_hw_info(struct mtk_vdec_optee_private *optee_private,
 					     enum mtk_vdec_hw_id hardware_index)
 {
 	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
 	struct tee_ioctl_open_session_arg session_arg;
 	struct mtk_vdec_optee_ca_info *ca_info;
-	int err = 0, session_func;
+	int err, i, j, session_func;
 
 	/* Open lat and core session with vdec TA. */
 	switch (hardware_index) {
@@ -87,6 +143,24 @@ static int mtk_vcodec_dec_optee_init_hw_info(struct mtk_vdec_optee_private *opte
 	dev_dbg(dev, MTK_DBG_VCODEC_STR "open vdec tee session hw_id:%d session_id=%x.\n",
 		hardware_index, ca_info->vdec_session_id);
 
+	/* Allocate dynamic shared memory with decoder TA */
+	for (i = 0; i < OPTEE_MAX_INDEX; i++) {
+		err = mtk_vcodec_dec_optee_init_memref(optee_private->tee_vdec_ctx, ca_info, i);
+		if (err) {
+			dev_err(dev, MTK_DBG_VCODEC_STR "init vdec memref failed: %d.\n", i);
+			goto err_init_memref;
+		}
+	}
+
+	return err;
+err_init_memref:
+	if (i != 0) {
+		for (j = 0; j < i; j++)
+			mtk_vcodec_dec_optee_deinit_memref(ca_info, j);
+	}
+
+	tee_client_close_session(optee_private->tee_vdec_ctx, ca_info->vdec_session_id);
+
 	return err;
 }
 
@@ -94,12 +168,16 @@ static void mtk_vcodec_dec_optee_deinit_hw_info(struct mtk_vdec_optee_private *o
 						enum mtk_vdec_hw_id hw_id)
 {
 	struct mtk_vdec_optee_ca_info *ca_info;
+	int i;
 
 	if (hw_id == MTK_VDEC_LAT0)
 		ca_info = &optee_private->lat_ca;
 	else
 		ca_info = &optee_private->core_ca;
 
+	for (i = 0; i < OPTEE_MAX_INDEX; i++)
+		mtk_vcodec_dec_optee_deinit_memref(ca_info, i);
+
 	tee_client_close_session(optee_private->tee_vdec_ctx, ca_info->vdec_session_id);
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
index 8b1dca49331e..24aa63af9887 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
@@ -18,16 +18,48 @@
 
 #define MTK_OPTEE_MAX_TEE_PARAMS 4
 
+#define MTK_VDEC_OPTEE_MSG_SIZE     128
+#define MTK_VDEC_OPTEE_HW_SIZE      (8 * SZ_1K)
+
+/**
+ * struct mtk_vdec_optee_shm_memref - share memory reference params
+ * @msg_shm:        message shared with TA in TEE.
+ * @msg_shm_ca_buf: ca buffer.
+ *
+ * @msg_shm_size:   share message size.
+ * @param_type:     each tee param types.
+ * @copy_to_ta:     need to copy data from ca to share memory.
+ */
+struct mtk_vdec_optee_shm_memref {
+	struct tee_shm *msg_shm;
+	u8 *msg_shm_ca_buf;
+
+	u32 msg_shm_size;
+	u64 param_type;
+	bool copy_to_ta;
+};
+
 /**
  * struct mtk_vdec_optee_ca_info - ca related param
  * @vdec_session_id:   optee TA session identifier.
  * @hw_id:             hardware index.
  * @vdec_session_func: trusted application function id used specific to the TA.
+ * @shm_memref:        share memory reference params.
  */
 struct mtk_vdec_optee_ca_info {
 	u32 vdec_session_id;
 	enum mtk_vdec_hw_id hw_id;
 	u32 vdec_session_func;
+	struct mtk_vdec_optee_shm_memref shm_memref[MTK_OPTEE_MAX_TEE_PARAMS];
+};
+
+/*
+ * enum mtk_vdec_optee_data_index - used to indentify each share memory information
+ */
+enum mtk_vdec_optee_data_index {
+	OPTEE_MSG_INDEX = 0,
+	OPTEE_DATA_INDEX,
+	OPTEE_MAX_INDEX,
 };
 
 /**
-- 
2.18.0

