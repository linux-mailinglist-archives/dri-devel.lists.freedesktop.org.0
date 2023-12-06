Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B809B80696A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 09:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D23F10E6BC;
	Wed,  6 Dec 2023 08:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999A210E6A6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 08:15:59 +0000 (UTC)
X-UUID: ad2748f4940f11eea33bb35ae8d461a2-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Qsu2a6pWuI9r9UzNG4biPlS5wzwndp0NR6vZ8LjQ+Ww=; 
 b=aNkzMuFt+xyj75croYNm+uUFJ9lKo86WpCLal75hPs5Q0EOQ6PLaG57a7unZ1KWahYLRGiJWyIu5by/4zwbhMLuFLbVucFMlehBC6flgNp0fwVygXLlYrFCpM52gtFZYmqS/ll0OqE6dQUeq/xHhIN1RkACpmbjgQhtKCxcy6lg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34, REQID:1eafc663-658d-4d73-96a7-86d0e864a1c1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:abefa75, CLOUDID:d02c59fd-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ad2748f4940f11eea33bb35ae8d461a2-20231206
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 366926902; Wed, 06 Dec 2023 16:15:54 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 16:15:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 16:15:52 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Subject: [PATCH v3,
 10/21] media: mediatek: vcodec: send share memory data to optee
Date: Wed, 6 Dec 2023 16:15:27 +0800
Message-ID: <20231206081538.17056-11-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206081538.17056-1-yunfei.dong@mediatek.com>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Steve Cho <stevecho@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-mediatek@lists.infradead.org, "T . J .
 Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setting msg and vsi information to shared buffer, then call tee invoke
function to send it to optee-os.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 140 ++++++++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_optee.h     |  51 +++++++
 2 files changed, 191 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
index 611fb0e56480..f29a8d143fee 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
@@ -241,3 +241,143 @@ void mtk_vcodec_dec_optee_release(struct mtk_vdec_optee_private *optee_private)
 	mutex_unlock(&optee_private->tee_mutex);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_release);
+
+static int mtk_vcodec_dec_optee_fill_shm(struct tee_param *command_params,
+					 struct mtk_vdec_optee_shm_memref *shm_memref,
+					 struct mtk_vdec_optee_data_to_shm *data,
+					 int index, struct device *dev)
+{
+	if (!data->msg_buf_size[index] || !data->msg_buf[index]) {
+		pr_err(MTK_DBG_VCODEC_STR "tee invalid buf param: %d.\n", index);
+		return -EINVAL;
+	}
+
+	*command_params = (struct tee_param) {
+		.attr = shm_memref->param_type,
+		.u.memref = {
+			.shm = shm_memref->msg_shm,
+			.size = data->msg_buf_size[index],
+			.shm_offs = 0,
+		},
+	};
+
+	if (!shm_memref->copy_to_ta) {
+		dev_dbg(dev, MTK_DBG_VCODEC_STR "share memref data: 0x%x param_type:%llu.\n",
+			*((unsigned int *)shm_memref->msg_shm_ca_buf), shm_memref->param_type);
+		return 0;
+	}
+
+	memset(shm_memref->msg_shm_ca_buf, 0, shm_memref->msg_shm_size);
+	memcpy(shm_memref->msg_shm_ca_buf, data->msg_buf[index], data->msg_buf_size[index]);
+
+	dev_dbg(dev, MTK_DBG_VCODEC_STR "share memref data => msg id:0x%x 0x%x param_type:%llu.\n",
+		*((unsigned int *)data->msg_buf[index]),
+		*((unsigned int *)shm_memref->msg_shm_ca_buf),
+		shm_memref->param_type);
+
+	return 0;
+}
+
+void mtk_vcodec_dec_optee_set_data(struct mtk_vdec_optee_data_to_shm *data,
+				   void *buf, int buf_size,
+				   enum mtk_vdec_optee_data_index index)
+{
+	data->msg_buf[index] = buf;
+	data->msg_buf_size[index] = buf_size;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_set_data);
+
+int mtk_vcodec_dec_optee_invokd_cmd(struct mtk_vdec_optee_private *optee_private,
+				    enum mtk_vdec_hw_id hw_id,
+				    struct mtk_vdec_optee_data_to_shm *data)
+{
+	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
+	struct tee_ioctl_invoke_arg trans_args;
+	struct tee_param command_params[MTK_OPTEE_MAX_TEE_PARAMS];
+	struct mtk_vdec_optee_ca_info *ca_info;
+	struct mtk_vdec_optee_shm_memref *shm_memref;
+	int ret, index;
+
+	if (hw_id == MTK_VDEC_LAT0)
+		ca_info = &optee_private->lat_ca;
+	else
+		ca_info = &optee_private->core_ca;
+
+	memset(&trans_args, 0, sizeof(trans_args));
+	memset(command_params, 0, sizeof(command_params));
+
+	trans_args = (struct tee_ioctl_invoke_arg) {
+		.func = ca_info->vdec_session_func,
+		.session = ca_info->vdec_session_id,
+		.num_params = MTK_OPTEE_MAX_TEE_PARAMS,
+	};
+
+	/* Fill msg command parameters */
+	for (index = 0; index < MTK_OPTEE_MAX_TEE_PARAMS; index++) {
+		shm_memref = &ca_info->shm_memref[index];
+
+		if (shm_memref->param_type == TEE_IOCTL_PARAM_ATTR_TYPE_NONE ||
+		    data->msg_buf_size[index] == 0)
+			continue;
+
+		dev_dbg(dev, MTK_DBG_VCODEC_STR "tee share memory data size: %d -> %d.\n",
+			data->msg_buf_size[index], shm_memref->msg_shm_size);
+
+		if (data->msg_buf_size[index] > shm_memref->msg_shm_size) {
+			dev_err(dev, MTK_DBG_VCODEC_STR "tee buf size big than shm (%d -> %d).\n",
+				data->msg_buf_size[index], shm_memref->msg_shm_size);
+			return -EINVAL;
+		}
+
+		ret = mtk_vcodec_dec_optee_fill_shm(&command_params[index], shm_memref,
+						    data, index, dev);
+		if (ret)
+			return ret;
+	}
+
+	ret = tee_client_invoke_func(optee_private->tee_vdec_ctx, &trans_args, command_params);
+	if (ret < 0 || trans_args.ret != 0) {
+		dev_err(dev, MTK_DBG_VCODEC_STR "tee submit command fail: 0x%x 0x%x.\n",
+			trans_args.ret, ret);
+		return (ret < 0) ? ret : trans_args.ret;
+	}
+
+	/* clear all attrs, set all command param to unused */
+	for (index = 0; index < MTK_OPTEE_MAX_TEE_PARAMS; index++) {
+		data->msg_buf[index] = NULL;
+		data->msg_buf_size[index] = 0;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_invokd_cmd);
+
+void *mtk_vcodec_dec_get_shm_buffer_va(struct mtk_vdec_optee_private *optee_private,
+				       enum mtk_vdec_hw_id hw_id,
+				       enum mtk_vdec_optee_data_index data_index)
+{
+	struct mtk_vdec_optee_ca_info *ca_info;
+
+	if (hw_id == MTK_VDEC_LAT0)
+		ca_info = &optee_private->lat_ca;
+	else
+		ca_info = &optee_private->core_ca;
+
+	return ca_info->shm_memref[data_index].msg_shm_ca_buf;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_get_shm_buffer_va);
+
+int mtk_vcodec_dec_get_shm_buffer_size(struct mtk_vdec_optee_private *optee_private,
+				       enum mtk_vdec_hw_id hw_id,
+				       enum mtk_vdec_optee_data_index data_index)
+{
+	struct mtk_vdec_optee_ca_info *ca_info;
+
+	if (hw_id == MTK_VDEC_LAT0)
+		ca_info = &optee_private->lat_ca;
+	else
+		ca_info = &optee_private->core_ca;
+
+	return ca_info->shm_memref[data_index].msg_shm_size;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_get_shm_buffer_size);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
index 24aa63af9887..c24a567ec877 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
@@ -62,6 +62,16 @@ enum mtk_vdec_optee_data_index {
 	OPTEE_MAX_INDEX,
 };
 
+/**
+ * struct mtk_vdec_optee_data_to_shm - shm data used for TA
+ * @msg_buf:     msg information to TA.
+ * @msg_buf_len: length of msg information.
+ */
+struct mtk_vdec_optee_data_to_shm {
+	void *msg_buf[MTK_OPTEE_MAX_TEE_PARAMS];
+	int msg_buf_size[MTK_OPTEE_MAX_TEE_PARAMS];
+};
+
 /**
  * struct mtk_vdec_optee_private - optee private data
  * @vcodec_dev:     pointer to the mtk_vcodec_dev of the device
@@ -102,4 +112,45 @@ int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev);
  */
 void mtk_vcodec_dec_optee_release(struct mtk_vdec_optee_private *optee_private);
 
+/**
+ * mtk_vcodec_dec_optee_set_data - set buffer to share memref.
+ * @vcodec_dev: normal world data used to init optee share memory
+ * @buf: normal world buffer address
+ * @buf_size: buf size
+ * @data_index: indentify each share memory informaiton
+ */
+void mtk_vcodec_dec_optee_set_data(struct mtk_vdec_optee_data_to_shm *data,
+				   void *buf, int buf_size,
+				   enum mtk_vdec_optee_data_index data_index);
+
+/**
+ * mtk_vcodec_dec_optee_invokd_cmd - send share memory data to optee .
+ * @optee_private: optee private context
+ * @hw_id: hardware index
+ * @data: normal world data used to init optee share memory
+ */
+int mtk_vcodec_dec_optee_invokd_cmd(struct mtk_vdec_optee_private *optee_private,
+				    enum mtk_vdec_hw_id hw_id,
+				    struct mtk_vdec_optee_data_to_shm *data);
+
+/**
+ * mtk_vcodec_dec_get_shm_buffer_va - close the communication channels with TA.
+ * @optee_private: optee private context
+ * @hw_id:         hardware index
+ * @@data_index: indentify each share memory informaiton
+ */
+void *mtk_vcodec_dec_get_shm_buffer_va(struct mtk_vdec_optee_private *optee_private,
+				       enum mtk_vdec_hw_id hw_id,
+				       enum mtk_vdec_optee_data_index data_index);
+
+/**
+ * mtk_vcodec_dec_get_shm_buffer_size - close the communication channels with TA.
+ * @optee_private: optee private context
+ * @hw_id:         hardware index
+ * @@data_index: indentify each share memory informaiton
+ */
+int mtk_vcodec_dec_get_shm_buffer_size(struct mtk_vdec_optee_private *optee_private,
+				       enum mtk_vdec_hw_id hw_id,
+				       enum mtk_vdec_optee_data_index data_index);
+
 #endif /* _MTK_VCODEC_FW_OPTEE_H_ */
-- 
2.18.0

