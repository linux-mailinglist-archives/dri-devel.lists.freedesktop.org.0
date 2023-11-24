Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD9B7F88C9
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 08:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747BF10E116;
	Sat, 25 Nov 2023 07:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21A910E7BC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:53:26 +0000 (UTC)
X-UUID: e9bd55288aa611ee8051498923ad61e6-20231124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=wDb7QOniywV6HjHzP9YpA989cdkc2ofjSnAMzlzZR64=; 
 b=uOw73C1BSVDriNEcXBjujs5gWAnabvpARhaMLyxPd11z5Ds/16bGI4FmHzwYiy/5OWUSOCwz7cZmJ982cC27EvJQqStnG8/WgIR8oefmhJnxakHNkvY2DAwZDfAVzmOsf9XJdcqf5IlvS+OUnXo2tSQBGzwAI62X8HQY39eag8Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:5474f377-926e-4570-acaa-371e23b201e7, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:364b77b, CLOUDID:19a6c495-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 2,OSH|NGT
X-CID-BAS: 2,OSH|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e9bd55288aa611ee8051498923ad61e6-20231124
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <mac.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2083240128; Fri, 24 Nov 2023 16:53:18 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 24 Nov 2023 16:53:17 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 24 Nov 2023 16:53:16 +0800
From: mac.shen <mac.shen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
Subject: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Date: Fri, 24 Nov 2023 16:53:46 +0800
Message-ID: <20231124085346.26602-1-mac.shen@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 25 Nov 2023 07:24:41 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mac.shen@mediatek.com, shuijing.li@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add tee client application, HDCP 1.x and 2.x authentication for DisplayPort
to support the HDCP feature.

Signed-off-by: mac.shen <mac.shen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile         |    7 +-
 drivers/gpu/drm/mediatek/ca/tci.h         |  143 +++
 drivers/gpu/drm/mediatek/ca/tlDPHdcpCMD.h |   36 +
 drivers/gpu/drm/mediatek/ca/tlcDpHdcp.c   |  638 +++++++++++++
 drivers/gpu/drm/mediatek/ca/tlcDpHdcp.h   |  305 +++++++
 drivers/gpu/drm/mediatek/mtk_dp.c         |  159 +++-
 drivers/gpu/drm/mediatek/mtk_dp.h         |   17 +
 drivers/gpu/drm/mediatek/mtk_dp_hdcp.h    |  154 ++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c  |  646 +++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h  |   55 ++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c   | 1008 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h   |   75 ++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h     |    6 +-
 13 files changed, 3233 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/ca/tci.h
 create mode 100644 drivers/gpu/drm/mediatek/ca/tlDPHdcpCMD.h
 create mode 100644 drivers/gpu/drm/mediatek/ca/tlcDpHdcp.c
 create mode 100644 drivers/gpu/drm/mediatek/ca/tlcDpHdcp.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index d4d193f60271..6839c96221e3 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -26,4 +26,9 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
 
-obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
+mtk-dp-objs := mtk_dp_hdcp1x.o \
+		  mtk_dp_hdcp2.o \
+		  ca/tlcDpHdcp.o \
+		  mtk_dp.o
+
+obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk-dp.o
diff --git a/drivers/gpu/drm/mediatek/ca/tci.h b/drivers/gpu/drm/mediatek/ca/tci.h
new file mode 100644
index 000000000000..527f77d9308d
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/ca/tci.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2023 MediaTek Inc.
+ */
+
+#ifndef _TCI_H_
+#define _TCI_H_
+
+#define RET_COMPARE_PASS 0
+#define RET_COMPARE_FAIL 1
+#define RET_NEW_DEVICE 2
+#define RET_STORED_DEVICE 3
+
+#define AN_LEN 8
+#define AKSV_LEN 5
+#define BKSV_LEN 5
+#define CERT_LEN 522
+#define EKM_LEN 16
+#define M_LEN 16
+#define ENC_KM_LEN 128
+#define RXX_LEN 8
+#define CAPS_LEN 3
+#define RN_LEN 8
+#define RIV_LEN 8
+
+#define TYPE_HDCP_PARAM_AN 10
+#define TYPE_HDCP_PARAM_RST_1 11
+#define TYPE_HDCP_PARAM_RST_2 12
+#define TYPE_HDCP_ENABLE_ENCRYPT 13
+#define TYPE_HDCP_DISABLE_ENCRYPT 14
+
+#define TYPE_HDCP13_KEY 20
+#define TYPE_HDCP22_KEY 21
+
+#define TCI_LENGTH sizeof(struct tci_t)
+
+struct cryptokeys_t {
+	u8 type;
+	u32 len;
+	u32 key;
+};
+
+struct cmd_hdcp_init_for_verion_t {
+	u32 version;
+	bool need_load_key;
+};
+
+struct cmd_hdcp_write_val_t {
+	u8 type;
+	u8 len;
+	u32 val;
+};
+
+struct cmd_hdcp_calculate_lm_t {
+	u8 bksv[BKSV_LEN];
+};
+
+struct cmd_hdcp_get_aksv_t {
+	u8 aksv[AKSV_LEN];
+};
+
+struct cmd_hdcp_sha1_t {
+	u32 message_len;
+	u32 message_addr;
+};
+
+struct cmd_hdcp_ake_certificate_t {
+	u8 certification[CERT_LEN];
+	bool stored;
+	u8 m[M_LEN];
+	u8 ekm[EKM_LEN];
+};
+
+struct cmd_hdcp_ake_paring_t {
+	u8 ekm[EKM_LEN];
+};
+
+struct cmd_hdcp_enc_km_t {
+	u8 enc_km[ENC_KM_LEN];
+};
+
+struct cmd_hdcp_ake_h_prime_t {
+	u8 rtx[RXX_LEN];
+	u8 rrx[RXX_LEN];
+	u8 rx_caps[CAPS_LEN];
+	u8 tx_caps[CAPS_LEN];
+	u32 rx_h_len;
+	u32 rx_h;
+};
+
+struct cmd_hdcp_lc_l_prime_t {
+	u8 rn[RN_LEN];
+	u32 rx_l_len;
+	u32 rx_l;
+};
+
+struct cmd_hdcp_ske_eks_t {
+	u8 riv[RIV_LEN];
+	u32 eks_len;
+	u32 eks;
+};
+
+struct cmd_hdcp_compare_t {
+	u32 rx_val_len;
+	u32 rx_val;
+	u32 param_len;
+	u32 param;
+	u32 out_len;
+	u32 out;
+};
+
+union tci_cmd_body_t {
+	/* Init with special HDCP version */
+	struct cmd_hdcp_init_for_verion_t cmd_hdcp_init_for_verion;
+	/* Write uint32 data to hw */
+	struct cmd_hdcp_write_val_t cmd_hdcp_write_val;
+	/* Get aksv */
+	struct cmd_hdcp_get_aksv_t cmd_hdcp_get_aksv;
+	/* Calculate r0 */
+	struct cmd_hdcp_calculate_lm_t cmd_hdcp_calculate_lm;
+	/* Generate signature for certificate */
+	struct cmd_hdcp_ake_certificate_t cmd_hdcp_ake_certificate;
+	/* To store ekm */
+	struct cmd_hdcp_ake_paring_t cmd_hdcp_ake_paring;
+	/* Encrypt km for V2.2 */
+	struct cmd_hdcp_enc_km_t cmd_hdcp_enc_km;
+	/* Compute H prime */
+	struct cmd_hdcp_ake_h_prime_t cmd_hdcp_ake_h_prime;
+	/* Compute L prime */
+	struct cmd_hdcp_lc_l_prime_t cmd_hdcp_lc_l_prime;
+	/* Compute eks */
+	struct cmd_hdcp_ske_eks_t cmd_hdcp_ske_eks;
+	/* Compare */
+	struct cmd_hdcp_compare_t cmd_hdcp_compare;
+} __packed;
+
+struct tci_t {
+	u32 command_id;
+	u32 return_code;
+	union tci_cmd_body_t cmd_body;
+};
+
+#endif /* _TCI_H_ */
diff --git a/drivers/gpu/drm/mediatek/ca/tlDPHdcpCMD.h b/drivers/gpu/drm/mediatek/ca/tlDPHdcpCMD.h
new file mode 100644
index 000000000000..5687aec9bdd9
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/ca/tlDPHdcpCMD.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2023 MediaTek Inc.
+ */
+
+#ifndef _TLDPHDCP_CMD_H_
+#define _TLDPHDCP_CMD_H_
+
+#define CMD_DEVICE_ADDED        1
+#define CMD_DEVICE_REMOVE       2
+#define CMD_WRITE_VAL           3
+#define CMD_DEVICE_CLEAN        4
+#define CMD_ENABLE_ENCRYPT      5
+
+/* V1.3 */
+#define CMD_CALCULATE_LM        11
+#define CMD_COMPARE_R0          12
+#define CMD_COMPARE_V1          13
+#define CMD_GET_AKSV            14
+
+/* V2.2 */
+#define CMD_AKE_CERTIFICATE     20
+#define CMD_ENC_KM              21
+#define CMD_AKE_H_PRIME         22
+#define CMD_AKE_PARING          23
+#define CMD_LC_L_PRIME          24
+#define CMD_COMPARE_L           25
+#define CMD_SKE_CAL_EKS         26
+
+#define CMD_COMPARE_V2          27
+#define CMD_COMPARE_M           28
+
+/* Need remove in furture */
+#define CMD_LOAD_KEY            50
+
+#endif /* _TLDPHDCP_CMD_H_ */
diff --git a/drivers/gpu/drm/mediatek/ca/tlcDpHdcp.c b/drivers/gpu/drm/mediatek/ca/tlcDpHdcp.c
new file mode 100644
index 000000000000..2979d38ee230
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/ca/tlcDpHdcp.c
@@ -0,0 +1,638 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2023 MediaTek Inc.
+ */
+
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include "tlcDpHdcp.h"
+
+#define AN_LEN 8
+#define AKSV_LEN 5
+#define DEFAULT_WRITE_VAL_LEN 1
+#define DEFAULT_WRITE_VAL 0
+
+/*
+ * TA_FTPM_UUID: 99975014-3c7c-54ea-8487-a80d215ea92c
+ *
+ * Randomly generated, and must correspond to the GUID on the TA side.
+ * Defined here in the reference implementation:
+ * https://github.com/microsoft/ms-tpm-20-ref/blob/master/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/include/fTPM.h#L42
+ */
+static const uuid_t dp_ta_uuid =
+	UUID_INIT(0x99975014, 0x3c7c, 0x54ea,
+		  0x84, 0x87, 0xa8, 0x0d, 0x21, 0x5e, 0xa9, 0x2c);
+
+/**
+ * dp_tee_op_send() - send dp commands through the TEE shared memory.
+ * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
+ * @buf:	the buffer to send.
+ * @len:	the number of bytes to send.
+ *
+ * Return:
+ *	In case of success, returns 0.
+ *	On failure, -errno
+ */
+static int dp_tee_op_send(struct dp_tee_private *dp_tee_priv, u8 *buf, size_t len, u32 cmd_id)
+{
+	int rc;
+	u8 *temp_buf;
+	struct tee_ioctl_invoke_arg transceive_args;
+	struct tee_param command_params[4];
+	struct tee_shm *shm = dp_tee_priv->shm;
+
+	if (len > MAX_COMMAND_SIZE) {
+		TLCERR("%s: len=%zd exceeds MAX_COMMAND_SIZE supported by dp TA\n", __func__, len);
+		return -EIO;
+	}
+
+	memset(&transceive_args, 0, sizeof(transceive_args));
+	memset(command_params, 0, sizeof(command_params));
+	dp_tee_priv->resp_len = 0;
+
+	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of dp TA */
+	transceive_args = (struct tee_ioctl_invoke_arg) {
+		.func = cmd_id,
+		.session = dp_tee_priv->session,
+		.num_params = 4,
+	};
+
+	/* Fill FTPM_OPTEE_TA_SUBMIT_COMMAND parameters */
+	command_params[0] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
+		.u.memref = {
+			.shm = shm,
+			.size = len,
+			.shm_offs = 0,
+		},
+	};
+
+	temp_buf = tee_shm_get_va(shm, 0);
+	if (IS_ERR(temp_buf)) {
+		TLCERR("%s: tee_shm_get_va failed for transmit\n", __func__);
+		return PTR_ERR(temp_buf);
+	}
+
+	memcpy(temp_buf, buf, len);
+
+	command_params[1] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
+		.u.memref = {
+			.shm = shm,
+			.size = MAX_RESPONSE_SIZE,
+			.shm_offs = MAX_COMMAND_SIZE,
+		},
+	};
+
+	rc = tee_client_invoke_func(dp_tee_priv->ctx, &transceive_args,
+				    command_params);
+	if (rc < 0 || transceive_args.ret != 0) {
+		TLCERR("%s: invoke error: 0x%x\n", __func__, transceive_args.ret);
+		return (rc < 0) ? rc : transceive_args.ret;
+	}
+
+	temp_buf = tee_shm_get_va(shm, command_params[1].u.memref.shm_offs);
+	if (IS_ERR(temp_buf)) {
+		TLCERR("%s: tee_shm_get_va failed for receive\n", __func__);
+		return PTR_ERR(temp_buf);
+	}
+
+	/* Sanity checks look good, cache the response */
+	memcpy(dp_tee_priv->resp_buf, temp_buf, MAX_RESPONSE_SIZE / 2);
+	dp_tee_priv->resp_len = MAX_RESPONSE_SIZE / 2;
+
+	return 0;
+}
+
+/*
+ * Check whether this driver supports the dp TA in the TEE instance
+ * represented by the params (ver/data) to this function.
+ */
+static int dp_tee_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	/*
+	 * Currently this driver only support GP Complaint OPTEE based dp TA
+	 */
+	if (ver->impl_id == TEE_IMPL_ID_OPTEE && ver->gen_caps & TEE_GEN_CAP_GP)
+		return 1;
+	else
+		return 0;
+}
+
+int tee_add_device(struct mtk_hdcp_info *hdcp_info, u32 version)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = NULL;
+	struct tee_ioctl_open_session_arg sess_arg;
+	struct tci_t *tci;
+
+	if (hdcp_info->g_init)
+		tee_remove_device(hdcp_info);
+
+	dp_tee_priv = kzalloc(sizeof(*dp_tee_priv), GFP_KERNEL);
+	if (!dp_tee_priv) {
+		kfree(dp_tee_priv);
+		TLCERR("%s: tee_alloc_memory failed\n", __func__);
+		return -ENOMEM;
+	}
+	hdcp_info->g_dp_tee_priv = dp_tee_priv;
+
+	/* Open context with TEE driver */
+	dp_tee_priv->ctx = tee_client_open_context(NULL, dp_tee_match, NULL, NULL);
+	if (IS_ERR(dp_tee_priv->ctx)) {
+		if (PTR_ERR(dp_tee_priv->ctx) == -ENOENT) {
+			kfree(dp_tee_priv);
+			return -EPROBE_DEFER;
+		}
+		kfree(dp_tee_priv);
+		TLCERR("%s: tee_client_open_context failed\n", __func__);
+		return PTR_ERR(dp_tee_priv->ctx);
+	}
+
+	/* Open a session with dp TA */
+	memset(&sess_arg, 0, sizeof(sess_arg));
+	export_uuid(sess_arg.uuid, &dp_ta_uuid);
+	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
+	sess_arg.num_params = 0;
+
+	rc = tee_client_open_session(dp_tee_priv->ctx, &sess_arg, NULL);
+	if (rc < 0 || sess_arg.ret != 0) {
+		kfree(dp_tee_priv);
+		TLCERR("tee_client_open_session failed, err=%x\n", sess_arg.ret);
+		rc = -EINVAL;
+		goto out_tee_session;
+	}
+	dp_tee_priv->session = sess_arg.session;
+
+	/* Allocate dynamic shared memory with dp TA */
+	dp_tee_priv->shm = tee_shm_alloc_kernel_buf(dp_tee_priv->ctx, MAX_COMMAND_SIZE
+	 + MAX_RESPONSE_SIZE);
+	if (IS_ERR(dp_tee_priv->shm)) {
+		kfree(dp_tee_priv);
+		TLCERR("%s: tee_shm_alloc_kernel_buf failed\n", __func__);
+		rc = -ENOMEM;
+		goto out_shm_alloc;
+	}
+	TLCINFO("Register 8k share memory successfully, (%p)",
+		dp_tee_priv->shm->kaddr);
+
+	/* Copy parameter for add new device */
+	tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_DEVICE_ADDED;
+	tci->cmd_body.cmd_hdcp_init_for_verion.version = version;
+	tci->cmd_body.cmd_hdcp_init_for_verion.need_load_key = true;
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH, CMD_DEVICE_ADDED);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		tee_remove_device(hdcp_info);
+		return rc;
+	}
+
+	hdcp_info->g_init = true;
+
+	return rc;
+
+out_shm_alloc:
+	tee_client_close_session(dp_tee_priv->ctx, dp_tee_priv->session);
+out_tee_session:
+	tee_client_close_context(dp_tee_priv->ctx);
+
+	return rc;
+}
+
+void tee_remove_device(struct mtk_hdcp_info *hdcp_info)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+
+	if (!hdcp_info->g_init)
+		return;
+
+	hdcp_info->g_init = false;
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_DEVICE_REMOVE;
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH, CMD_DEVICE_REMOVE);
+	if (rc != 0)
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+
+	/* Free the shared memory pool */
+	tee_shm_free(dp_tee_priv->shm);
+
+	/* Close the existing session with fTPM TA */
+	tee_client_close_session(dp_tee_priv->ctx, dp_tee_priv->session);
+
+	/* Close the context with TEE driver */
+	tee_client_close_context(dp_tee_priv->ctx);
+
+	/* Free the memory */
+	kfree(dp_tee_priv);
+}
+
+int tee_clear_paring(struct mtk_hdcp_info *hdcp_info)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_DEVICE_CLEAN;
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH, CMD_DEVICE_CLEAN);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return rc;
+}
+
+int tee_hdcp1x_set_tx_an(struct mtk_hdcp_info *hdcp_info, u8 *an_code)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_WRITE_VAL;
+	tci->cmd_body.cmd_hdcp_write_val.len = AN_LEN;
+	tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_PARAM_AN;
+	memcpy(share_buffer + TCI_LENGTH, an_code, AN_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH + AN_LEN, CMD_WRITE_VAL);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return rc;
+}
+
+int tee_hdcp_enable_encrypt(struct mtk_hdcp_info *hdcp_info, bool enable, u8 version)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_ENABLE_ENCRYPT;
+	if (enable)
+		tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_ENABLE_ENCRYPT;
+	else
+		tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_DISABLE_ENCRYPT;
+
+	/* Set HDCP version supportted by device */
+	tci->cmd_body.cmd_hdcp_write_val.len = 1;
+	memset(share_buffer + TCI_LENGTH, version, 1);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH + 1, CMD_ENABLE_ENCRYPT);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return rc;
+}
+
+int tee_hdcp1x_soft_rst(struct mtk_hdcp_info *hdcp_info)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_WRITE_VAL;
+	tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_PARAM_RST_1;
+	/* No need input. Set default value 0 for check */
+	tci->cmd_body.cmd_hdcp_write_val.len = DEFAULT_WRITE_VAL_LEN;
+	memset(share_buffer + TCI_LENGTH, DEFAULT_WRITE_VAL, DEFAULT_WRITE_VAL_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH
+	 + DEFAULT_WRITE_VAL_LEN, CMD_WRITE_VAL);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return rc;
+}
+
+int tee_hdcp2_soft_rst(struct mtk_hdcp_info *hdcp_info)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_WRITE_VAL;
+	tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_PARAM_RST_2;
+	/* No need input. Set default value 0 for check */
+	tci->cmd_body.cmd_hdcp_write_val.len =
+		DEFAULT_WRITE_VAL_LEN;
+	memset(share_buffer + TCI_LENGTH, DEFAULT_WRITE_VAL, DEFAULT_WRITE_VAL_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH
+	 + DEFAULT_WRITE_VAL_LEN, CMD_WRITE_VAL);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return rc;
+}
+
+/** V1.X **/
+int tee_get_aksv(struct mtk_hdcp_info *hdcp_info, u8 *aksv)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_GET_AKSV;
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH, CMD_GET_AKSV);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	tci = (struct tci_t *)dp_tee_priv->resp_buf;
+	memcpy(aksv, tci->cmd_body.cmd_hdcp_get_aksv.aksv, AKSV_LEN);
+
+	return rc;
+}
+
+int tee_calculate_lm(struct mtk_hdcp_info *hdcp_info, u8 *bksv)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_CALCULATE_LM;
+	memcpy(tci->cmd_body.cmd_hdcp_calculate_lm.bksv, bksv, BKSV_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH, CMD_CALCULATE_LM);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return rc;
+}
+
+int tee_compare_r0(struct mtk_hdcp_info *hdcp_info, u8 *r0, u32 len)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_COMPARE_R0;
+	tci->cmd_body.cmd_hdcp_compare.rx_val_len = len;
+	memcpy(share_buffer + TCI_LENGTH, r0, len);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH + len, CMD_COMPARE_R0);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return rc;
+}
+
+int tee_hdcp1x_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
+				 u8 *crypto_param, u32 param_len, u8 *rx_v)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_COMPARE_V1;
+	tci->cmd_body.cmd_hdcp_compare.rx_val_len = 20;
+	tci->cmd_body.cmd_hdcp_compare.param_len = param_len;
+	memcpy(share_buffer + TCI_LENGTH, rx_v, 20);
+	memcpy(share_buffer + TCI_LENGTH + 20, crypto_param, param_len);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH + param_len + 20, CMD_COMPARE_V1);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return rc;
+}
+
+/** V2.X **/
+int tee_ake_certificate(struct mtk_hdcp_info *hdcp_info,
+			u8 *certificate, bool *stored, u8 *out_m, u8 *out_ekm)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_AKE_CERTIFICATE;
+	memcpy(tci->cmd_body.cmd_hdcp_ake_certificate.certification,
+	       certificate, CERT_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH, CMD_AKE_CERTIFICATE);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	TLCINFO("verify signature: result %d", rc);
+	tci = (struct tci_t *)dp_tee_priv->resp_buf;
+	*stored = tci->cmd_body.cmd_hdcp_ake_certificate.stored;
+	memcpy(out_m, tci->cmd_body.cmd_hdcp_ake_certificate.m, M_LEN);
+	memcpy(out_ekm, tci->cmd_body.cmd_hdcp_ake_certificate.ekm, EKM_LEN);
+
+	return rc;
+}
+
+int tee_enc_rsaes_oaep(struct mtk_hdcp_info *hdcp_info, u8 *ekm)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_ENC_KM;
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH, CMD_ENC_KM);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	tci = (struct tci_t *)dp_tee_priv->resp_buf;
+	memcpy(ekm, tci->cmd_body.cmd_hdcp_enc_km.enc_km, ENC_KM_LEN);
+
+	return rc;
+}
+
+int tee_ake_h_prime(struct mtk_hdcp_info *hdcp_info,
+		    u8 *rtx, u8 *rrx, u8 *rx_caps, u8 *tx_caps, u8 *rx_h, u32 rx_h_len)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_AKE_H_PRIME;
+	tci->cmd_body.cmd_hdcp_ake_h_prime.rx_h_len = rx_h_len;
+
+	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rtx, rtx, RXX_LEN);
+	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rrx, rrx, RXX_LEN);
+	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rx_caps, rx_caps, CAPS_LEN);
+	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.tx_caps, tx_caps, CAPS_LEN);
+	memcpy(share_buffer + TCI_LENGTH, rx_h, rx_h_len);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH + rx_h_len, CMD_AKE_H_PRIME);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	tci = (struct tci_t *)dp_tee_priv->resp_buf;
+	return tci->return_code;
+}
+
+int tee_ake_paring(struct mtk_hdcp_info *hdcp_info, u8 *rx_ekm)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_AKE_PARING;
+	memcpy(tci->cmd_body.cmd_hdcp_ake_paring.ekm, rx_ekm, EKM_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH, CMD_AKE_PARING);
+	if (rc != 0)
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+
+	return rc;
+}
+
+int tee_lc_l_prime(struct mtk_hdcp_info *hdcp_info, u8 *rn, u8 *rx_l, u32 len)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_LC_L_PRIME;
+	memcpy(tci->cmd_body.cmd_hdcp_lc_l_prime.rn, rn, RN_LEN);
+	tci->cmd_body.cmd_hdcp_lc_l_prime.rx_l_len = len;
+	memcpy(share_buffer + TCI_LENGTH, rx_l, len);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH + len, CMD_LC_L_PRIME);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	tci = (struct tci_t *)dp_tee_priv->resp_buf;
+	return tci->return_code;
+}
+
+int tee_ske_enc_ks(struct mtk_hdcp_info *hdcp_info, u8 *riv, u8 *eks)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_SKE_CAL_EKS;
+	memcpy(tci->cmd_body.cmd_hdcp_ske_eks.riv, riv, RIV_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH + 16, CMD_SKE_CAL_EKS);
+	if (rc != 0)
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+
+	share_buffer = (u8 *)dp_tee_priv->resp_buf;
+	memcpy(eks, share_buffer + TCI_LENGTH, 16);
+
+	return rc;
+}
+
+int tee_hdcp2_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
+				u8 *crypto_param, u32 param_len, u8 *rx_v, u8 *tx_v)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_COMPARE_V2;
+	tci->cmd_body.cmd_hdcp_compare.rx_val_len = 16;
+	tci->cmd_body.cmd_hdcp_compare.param_len = param_len;
+	memcpy(share_buffer + TCI_LENGTH, rx_v, 16);
+	memcpy(share_buffer + TCI_LENGTH + 16, crypto_param, param_len);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH + param_len + 16, CMD_COMPARE_V2);
+	if (rc != 0) {
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	share_buffer = (u8 *)dp_tee_priv->resp_buf;
+	memcpy(tx_v, share_buffer + TCI_LENGTH, 16);
+
+	return rc;
+}
+
+int tee_hdcp2_compute_compare_m(struct mtk_hdcp_info *hdcp_info,
+				u8 *crypto_param, u32 param_len, u8 *rx_m)
+{
+	int rc;
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = (u8 *)dp_tee_priv->shm->kaddr;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_COMPARE_M;
+	tci->cmd_body.cmd_hdcp_compare.rx_val_len = 32;
+	tci->cmd_body.cmd_hdcp_compare.param_len = param_len;
+	memcpy(share_buffer + TCI_LENGTH, rx_m, 32);
+	memcpy(share_buffer + TCI_LENGTH + 32, crypto_param, param_len);
+
+	rc = dp_tee_op_send(dp_tee_priv, (u8 *)tci, TCI_LENGTH + param_len + 32, CMD_COMPARE_M);
+	if (rc != 0)
+		TLCERR("tee_op_send failed, error=%x\n", rc);
+
+	return rc;
+}
+
diff --git a/drivers/gpu/drm/mediatek/ca/tlcDpHdcp.h b/drivers/gpu/drm/mediatek/ca/tlcDpHdcp.h
new file mode 100644
index 000000000000..72e713dd96bf
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/ca/tlcDpHdcp.h
@@ -0,0 +1,305 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2023 MediaTek Inc.
+ */
+
+#ifndef _TLCDPHDCP_H_
+#define _TLCDPHDCP_H_
+
+#include <linux/printk.h>
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+#include "tci.h"
+#include "tlDPHdcpCMD.h"
+#include "mtk_dp_hdcp.h"
+
+#define TLCINFO(string, args...) pr_info("[TLC_HDCP]info: "string, ##args)
+#define TLCERR(string, args...) pr_info("[TLC_HDCP]line:%d,err:%s:"string,\
+	__LINE__, __func__, ##args)
+
+#define RET_SUCCESS 0
+
+/**
+ * hdcp version definitions
+ */
+#define HDCP_NONE                0x0 // No HDCP supported, no secure data path
+#define HDCP_V1                  0x1 // HDCP version 1.0
+#define HDCP_V2                  0x2 // HDCP version 2.0 Type 1
+#define HDCP_V2_1                0x3 // HDCP version 2.1 Type 1
+#define HDCP_V2_2                0x4 // HDCP version 2.2 Type 1
+#define HDCP_V2_3                0x5 // HDCP version 2.3 Type 1
+
+/* Local display only(content required version use only) */
+#define HDCP_LOCAL_DISPLAY_ONLY  0xf
+#define HDCP_NO_DIGITAL_OUTPUT   0xff // No digital output
+#define HDCP_DEFAULT             HDCP_NO_DIGITAL_OUTPUT // Default value
+
+#define HDCP_VERSION_1X 1
+#define HDCP_VERSION_2X 2
+
+/* max. buffer size supported by dp  */
+#define MAX_COMMAND_SIZE       4096
+#define MAX_RESPONSE_SIZE      4096
+
+struct dp_header {
+	__be16 tag;
+	__be32 length;
+	union {
+		__be32 ordinal;
+		__be32 return_code;
+	};
+} __packed;
+
+/**
+ * struct dp_tee_private - fTPM's private data
+ * @session:  dp TA session identifier.
+ * @resp_len: cached response buffer length.
+ * @resp_buf: cached response buffer.
+ * @ctx:      TEE context handler.
+ * @shm:      Memory pool shared with fTPM TA in TEE.
+ */
+struct dp_tee_private {
+	u32 session;
+	size_t resp_len;
+	u8 resp_buf[MAX_RESPONSE_SIZE];
+	struct tee_context *ctx;
+	struct tee_shm *shm;
+};
+
+#ifdef __cplusplus
+extern "C"
+{
+#endif
+
+/*
+ *Description:
+ *  A device connect and do some initializations.
+ *
+ *Input:
+ *  version: HDCP version
+ *
+ *Returns:
+ *  TEEC_SUCCESS success*
+ */
+int tee_add_device(struct mtk_hdcp_info *hdcp_info, u32 version);
+
+/*
+ *Description:
+ *  Device disconnect.
+ *
+ *Returns:
+ *  N/A
+ */
+void tee_remove_device(struct mtk_hdcp_info *hdcp_info);
+
+/*
+ *Description:
+ *  Clearing paring info.
+ *
+ *Returns:
+ *  TEEC_SUCCESS success*
+ */
+int tee_clear_paring(struct mtk_hdcp_info *hdcp_info);
+
+/*
+ *Description:
+ *  Calculate Km base on Bksv and write it to HW.
+ *
+ *Input:
+ *  bksv[5] input
+ *
+ *Returns:
+ *  TEEC_SUCCESS success
+ */
+int tee_calculate_lm(struct mtk_hdcp_info *hdcp_info, u8 *bksv);
+
+/*
+ *Description:
+ *  Get Aksv from TEE.
+ *
+ *Output:
+ *  aksv[5]
+ *
+ *Returns:
+ *  TEEC_SUCCESS success
+ */
+int tee_get_aksv(struct mtk_hdcp_info *hdcp_info, u8 *aksv);
+
+/*
+ *Description:
+ *  Get r0 from HW and compare to rx_r0.
+ *
+ *Parameters:
+ *  r0[len] input
+ *
+ *Returns:
+ *  TEEC_SUCCESS success
+ */
+int tee_compare_r0(struct mtk_hdcp_info *hdcp_info, u8 *r0, u32 len);
+
+/*
+ *Description:
+ *  Compute and compare v value.
+ *
+ *Input:
+ *  crypto_param[param_len] params used to calculate
+ *  rx_v[20] v value from rx
+ *
+ *Returns:
+ *  RET_COMPARE_PASS verify pass
+ */
+int tee_hdcp1x_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
+				 u8 *crypto_param, u32 param_len, u8 *rx_v);
+
+/*
+ *Description:
+ *  Write An to HW.
+ *
+ *Input:
+ *  an_code[8]
+ *
+ *Returns:
+ *  TEEC_SUCCESS success
+ */
+int tee_hdcp1x_set_tx_an(struct mtk_hdcp_info *hdcp_info, u8 *an_code);
+
+/*
+ *Description:
+ *  Write RST to HW.
+ *
+ *Returns:
+ *  TEEC_SUCCESS success
+ */
+int tee_hdcp1x_soft_rst(struct mtk_hdcp_info *hdcp_info);
+int tee_hdcp2_soft_rst(struct mtk_hdcp_info *hdcp_info);
+
+/*
+ *Description:
+ *  Set enable or disable to HW.
+ *
+ *Returns:
+ *  TEEC_SUCCESS success
+ */
+int tee_hdcp_enable_encrypt(struct mtk_hdcp_info *hdcp_info, bool enable, u8 version);
+
+/*
+ *Description:
+ *  AKE cetificate verify.
+ *
+ *Input:
+ *  certificate[522]: cert use to calculate
+ *output:
+ *  stored: whether be stored before
+ *  out_m[16]
+ *  out_ekm[16]
+ *
+ *Returns:
+ *  TEEC_SUCCESS success*
+ */
+int tee_ake_certificate(struct mtk_hdcp_info *hdcp_info,
+			u8 *certificate, bool *stored, u8 *out_m, u8 *out_ekm);
+
+/*
+ *Description:
+ *  Encrypt km.
+ *
+ *Output:
+ *  ekm[128]: encrypted km
+ *
+ *Returns:
+ *  TEEC_SUCCESS success*
+ */
+int tee_enc_rsaes_oaep(struct mtk_hdcp_info *hdcp_info, u8 *ekm);
+
+/*
+ *Description:
+ *  Calculate h prime and compare to rx_h
+ *
+ *Input:
+ *  rtx[8]
+ *  rrx[8]
+ *  rx_caps[3]
+ *  tx_caps[3]
+ *  rx_h[rx_h_len]
+ *
+ *Returns:
+ *  RET_COMPARE_PASS: compare pass
+ */
+int tee_ake_h_prime(struct mtk_hdcp_info *hdcp_info,
+		    u8 *rtx, u8 *rrx, u8 *rx_caps, u8 *tx_caps, u8 *rx_h, u32 rx_h_len);
+
+/*
+ *Description:
+ *  Store paring info.
+ *
+ *Input:
+ *  rx_ekm[16]
+ *
+ *Returns:
+ *  TEEC_SUCCESS success*
+ */
+int tee_ake_paring(struct mtk_hdcp_info *hdcp_info, u8 *rx_ekm);
+
+/*
+ *Description:
+ *  Calculate l prime and compare.
+ *
+ *Input:
+ *  rn[8]
+ *  rx_l[len]
+ *
+ *Returns:
+ *  RET_COMPARE_PASS compare pass
+ */
+int tee_lc_l_prime(struct mtk_hdcp_info *hdcp_info, u8 *rn, u8 *rx_l, u32 len);
+
+/*
+ *Description:
+ *  Encrypt ks
+ *  Write contentkey and riv to hw
+ *
+ *Input:
+ *  riv[8]
+ *Output:
+ *  eks[16]
+ *
+ *Returns:
+ *  TEEC_SUCCESS success*
+ */
+int tee_ske_enc_ks(struct mtk_hdcp_info *hdcp_info, u8 *riv, u8 *eks);
+
+/*
+ *Description:
+ *  Calculate and compare v prime for repeater.
+ *
+ *Input:
+ *  crypto_param[param_len] params used to calculate
+ *  rx_v[16] v value from rx
+ *Output:
+ *  tx_v[16]
+ *
+ *Returns:
+ *  TEEC_SUCCESS success*
+ */
+int tee_hdcp2_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
+				u8 *crypto_param, u32 param_len, u8 *rx_v, u8 *tx_v);
+
+/*
+ *Description:
+ *  Calculate and compare m prime for repeater.
+ *
+ *Input:
+ *  crypto_param[param_len] params used to calculate
+ *  rx_m[32] m value from rx
+ *
+ *Returns:
+ *  RET_COMPARE_PASS verify pass
+ */
+int tee_hdcp2_compute_compare_m(struct mtk_hdcp_info *hdcp_info,
+				u8 *crypto_param, u32 param_len, u8 *rx_m);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* _TLCDPHDCP_H_ */
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e4c16ba9902d..a5fa682f2b3c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2019-2022 MediaTek Inc.
+ * Copyright (c) 2019-2023 MediaTek Inc.
  * Copyright (c) 2022 BayLibre
  */
 
@@ -33,7 +33,12 @@
 #include <sound/hdmi-codec.h>
 #include <video/videomode.h>
 
+#include "mtk_dp.h"
 #include "mtk_dp_reg.h"
+#include "mtk_dp_hdcp.h"
+#include "mtk_dp_hdcp1x.h"
+#include "mtk_dp_hdcp2.h"
+#include "ca/tlcDpHdcp.h"
 
 #define MTK_DP_SIP_CONTROL_AARCH32	MTK_SIP_SMC_CMD(0x523)
 #define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
@@ -120,6 +125,9 @@ struct mtk_dp {
 	const struct mtk_dp_data *data;
 	struct mtk_dp_info info;
 	struct mtk_dp_train_info train_info;
+	struct mtk_hdcp_info hdcp_info;
+	struct work_struct hdcp_work;
+	struct workqueue_struct *hdcp_workqueue;
 
 	struct platform_device *phy_dev;
 	struct phy *phy;
@@ -324,21 +332,25 @@ static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
 	return container_of(b, struct mtk_dp, bridge);
 }
 
-static u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
+u32 mtk_dp_reg_read(struct regmap *regs, u32 offset)
 {
 	u32 read_val;
 	int ret;
 
-	ret = regmap_read(mtk_dp->regs, offset, &read_val);
+	ret = regmap_read(regs, offset, &read_val);
 	if (ret) {
-		dev_err(mtk_dp->dev, "Failed to read register 0x%x: %d\n",
-			offset, ret);
+		pr_err("Failed to read register 0x%x: %d\n", offset, ret);
 		return 0;
 	}
 
 	return read_val;
 }
 
+u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
+{
+	return mtk_dp_reg_read(mtk_dp->regs, offset);
+}
+
 static int mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
 {
 	int ret = regmap_write(mtk_dp->regs, offset, val);
@@ -350,18 +362,23 @@ static int mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
 	return ret;
 }
 
-static int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
-			      u32 val, u32 mask)
+int mtk_dp_reg_update_bits(struct regmap *regs, u32 offset,
+			   u32 val, u32 mask)
 {
-	int ret = regmap_update_bits(mtk_dp->regs, offset, mask, val);
+	int ret = regmap_update_bits(regs, offset, mask, val);
 
 	if (ret)
-		dev_err(mtk_dp->dev,
-			"Failed to update register 0x%x with value 0x%x, mask 0x%x\n",
-			offset, val, mask);
+		pr_err("Failed to update register 0x%x with value 0x%x, mask 0x%x\n",
+		       offset, val, mask);
 	return ret;
 }
 
+int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
+		       u32 val, u32 mask)
+{
+	return mtk_dp_reg_update_bits(mtk_dp->regs, offset, val, mask);
+}
+
 static void mtk_dp_bulk_16bit_write(struct mtk_dp *mtk_dp, u32 offset, u8 *buf,
 				    size_t length)
 {
@@ -1865,6 +1882,40 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
 	mtk_dp_digital_sw_reset(mtk_dp);
 }
 
+static void mtk_dp_check_sink_esi(struct mtk_dp *mtk_dp)
+{
+	u8 clear_cp_irq = BIT(2);
+
+	if (mtk_dp->hdcp_info.hdcp2_info.enable) {
+		mdrv_dp_tx_hdcp2_irq(&mtk_dp->hdcp_info);
+		drm_dp_dpcd_write(mtk_dp->hdcp_info.aux,
+				  DP_DEVICE_SERVICE_IRQ_VECTOR, &clear_cp_irq, 0x1);
+	}
+	/*hdcp 1.x do not need irq*/
+}
+
+static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
+{
+	ssize_t ret;
+	u8 sink_count;
+	u8 sink_count_200;
+
+	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT_ESI, &sink_count);
+	if (ret < 0) {
+		drm_info(mtk_dp->drm_dev, "Read sink count failed: %ld\n", ret);
+		return;
+	}
+
+	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count_200);
+	if (ret < 0) {
+		drm_info(mtk_dp->drm_dev,
+			 "Read DP_SINK_COUNT_ESI failed: %ld\n", ret);
+		return;
+	}
+
+	mtk_dp_check_sink_esi(mtk_dp);
+}
+
 static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 {
 	struct mtk_dp *mtk_dp = dev;
@@ -1894,9 +1945,11 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 		}
 	}
 
-	if (status & MTK_DP_THREAD_HPD_EVENT)
+	if (status & MTK_DP_THREAD_HPD_EVENT) {
 		dev_dbg(mtk_dp->dev, "Receive IRQ from sink devices\n");
-
+		/*check if need clear hpd irq*/
+		mtk_dp_hpd_sink_event(mtk_dp);
+	}
 	return IRQ_HANDLED;
 }
 
@@ -2271,7 +2324,7 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	mtk_dp->enabled = true;
 	mtk_dp_update_plugged_status(mtk_dp);
-
+	mtk_dp_re_authentication(&mtk_dp->hdcp_info);
 	return;
 power_off_aux:
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
@@ -2284,6 +2337,11 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
+	if (mtk_dp->hdcp_info.hdcp2_info.enable)
+		mdrv_dp_tx_hdcp2_set_start_auth(&mtk_dp->hdcp_info, false);
+	else if (mtk_dp->hdcp_info.hdcp1x_info.enable)
+		mdrv_dp_tx_hdcp1x_set_start_auth(&mtk_dp->hdcp_info, false);
+
 	mtk_dp->enabled = false;
 	mtk_dp_update_plugged_status(mtk_dp);
 	mtk_dp_video_enable(mtk_dp, false);
@@ -2589,6 +2647,69 @@ static int mtk_dp_edp_link_panel(struct drm_dp_aux *mtk_aux)
 	return 0;
 }
 
+void mtk_dp_re_authentication(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+
+	if (!mtk_dp->train_info.cable_plugged_in)
+		return;
+
+	hdcp_info->auth_status = AUTH_PREPARE;
+
+	dev_info(mtk_dp->dev, "dp start HDCP work");
+	queue_work(mtk_dp->hdcp_workqueue, &mtk_dp->hdcp_work);
+}
+
+void mtk_dp_check_hdcp_version(struct mtk_dp *mtk_dp, bool only_hdcp1x)
+{
+	if (!only_hdcp1x && mdrv_dp_tx_hdcp2_support(&mtk_dp->hdcp_info))
+		return;
+
+	if (mdrv_dp_tx_hdcp1x_support(&mtk_dp->hdcp_info))
+		return;
+
+	if (tee_add_device(&mtk_dp->hdcp_info, HDCP_NONE) != RET_SUCCESS)
+		mtk_dp->hdcp_info.auth_status = AUTH_FAIL;
+}
+
+static void mtk_dp_hdcp_handle(struct work_struct *data)
+{
+	struct mtk_dp *mtk_dp = container_of(data, struct mtk_dp, hdcp_work);
+
+	if (!mtk_dp->train_info.cable_plugged_in)
+		return;
+
+	if (mtk_dp->hdcp_info.auth_status == AUTH_PREPARE) {
+		mtk_dp_check_hdcp_version(mtk_dp, false);
+		if (mtk_dp->hdcp_info.hdcp2_info.enable)
+			mdrv_dp_tx_hdcp2_set_start_auth(&mtk_dp->hdcp_info, true);
+		else if (mtk_dp->hdcp_info.hdcp1x_info.enable)
+			mdrv_dp_tx_hdcp1x_set_start_auth(&mtk_dp->hdcp_info, true);
+		else
+			mtk_dp->hdcp_info.auth_status = AUTH_ZERO;
+	}
+
+	while ((mtk_dp->hdcp_info.hdcp1x_info.enable ||
+		mtk_dp->hdcp_info.hdcp2_info.enable) &&
+			mtk_dp->hdcp_info.auth_status != AUTH_FAIL &&
+			mtk_dp->hdcp_info.auth_status != AUTH_PASS) {
+		if (mtk_dp->hdcp_info.hdcp2_info.enable) {
+			mdrv_dp_tx_hdcp2_fsm(&mtk_dp->hdcp_info);
+			if (mtk_dp->hdcp_info.auth_status == AUTH_FAIL) {
+				tee_remove_device(&mtk_dp->hdcp_info);
+				mtk_dp_check_hdcp_version(mtk_dp, true);
+				if (mtk_dp->hdcp_info.hdcp1x_info.enable) {
+					mtk_dp->hdcp_info.hdcp2_info.enable = false;
+					mdrv_dp_tx_hdcp1x_set_start_auth(&mtk_dp->hdcp_info, true);
+				}
+			}
+		}
+
+		if (mtk_dp->hdcp_info.hdcp1x_info.enable)
+			mdrv_dp_tx_hdcp1x_fsm(&mtk_dp->hdcp_info);
+	}
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2657,6 +2778,16 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	INIT_WORK(&mtk_dp->hdcp_work, mtk_dp_hdcp_handle);
+	mtk_dp->hdcp_workqueue = create_workqueue("mtk_dp_hdcp_work");
+	if (!mtk_dp->hdcp_workqueue) {
+		dev_err(mtk_dp->dev, "failed to create hdcp work queue");
+		return -ENOMEM;
+	}
+
+	mtk_dp->hdcp_info.aux = &mtk_dp->aux;
+	mtk_dp->hdcp_info.regs = mtk_dp->regs;
+
 	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.h b/drivers/gpu/drm/mediatek/mtk_dp.h
new file mode 100644
index 000000000000..3eeb33664598
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2023 MediaTek Inc.
+ */
+
+#ifndef _MTK_DP_H_
+#define _MTK_DP_H_
+
+#include "mtk_dp_hdcp.h"
+
+u32 mtk_dp_reg_read(struct regmap *regs, u32 offset);
+
+int mtk_dp_reg_update_bits(struct regmap *regs, u32 offset, u32 val, u32 mask);
+
+void mtk_dp_re_authentication(struct mtk_hdcp_info *hdcp_info);
+
+#endif /* _MTK_DP_H_ */
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp.h b/drivers/gpu/drm/mediatek/mtk_dp_hdcp.h
new file mode 100644
index 000000000000..8575a6b6b8d7
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp.h
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2023 MediaTek Inc.
+ */
+
+#ifndef _MTK_DP_HDCP_H_
+#define _MTK_DP_HDCP_H_
+
+#include <linux/types.h>
+#include <drm/display/drm_dp_helper.h>
+#include <linux/sched/clock.h>
+
+#define HDCP2_RXSTATUS_SIZE              1
+#define HDCP2_RTX_SIZE                   8
+#define HDCP2_RRX_SIZE                   8
+#define HDCP2_TXCAPS_SIZE                3
+#define HDCP2_RXCAPS_SIZE                3
+#define HDCP2_M_SIZE                     16
+#define HDCP2_KD_SIZE                    32
+#define HDCP2_CERTRX_SIZE                522
+#define HDCP2_EKPUBKM_SIZE               128
+#define HDCP2_EKHKM_SIZE                 16
+#define HDCP2_KM_SIZE                    16
+#define HDCP2_KH_SIZE                    16
+#define HDCP2_RN_SIZE                    8
+#define HDCP2_LPRIME_SIZE                32
+#define HDCP2_EDKEYKS_SIZE               16
+#define HDCP2_KS_SIZE                    16
+#define HDCP2_RIV_SIZE                   8
+#define HDCP2_RXINFO_SIZE                2
+#define HDCP2_SEQ_NUM_V_SIZE             3
+#define HDCP2_RECVID_SIZE                5
+#define HDCP2_VPRIME_SIZE                16
+#define HDCP2_RECV_ID_LIST_SIZE          155
+#define HDCP2_SEQ_NUM_M_SIZE             3
+#define HDCP2_STREAMID_TYPE_SIZE         2
+#define HDCP2_K_SIZE                     2
+#define HDCP2_REP_MPRIME_SIZE            32
+#define HDCP2_HPRIME_SIZE                32
+#define HDCP2_RX_ENCKEY_SIZE             104
+#define HDCP2_TX_ENCKEY_SIZE             448
+#define HDCP2_LC128_SIZE                 16
+#define HDCP2_KPUBRX_MODULUS_SIZE        128
+#define HDCP2_KPUBRX_EXPONENT_SIZE       3
+#define HDCP2_KPUBRX_RESERVED_SIZE       2
+#define HDCP2_MAX_DEVICE_COUNT           31
+#define HDCP2_MAX_DEPTH_LEVEL            4
+#define HDCP2_KPUB_SIZE                  384
+
+struct hdcp2_info_tx {
+	u8 rtx[HDCP2_RTX_SIZE];
+	u8 tx_caps[HDCP2_TXCAPS_SIZE];
+	u8 ekpub_km[HDCP2_EKPUBKM_SIZE];
+	u8 eks[HDCP2_EDKEYKS_SIZE];
+	u8 v_prime[HDCP2_VPRIME_SIZE];
+	u8 rn[HDCP2_RN_SIZE];
+	u8 riv[HDCP2_RIV_SIZE];
+	u8 seq_num_m[HDCP2_SEQ_NUM_M_SIZE];
+	u8 k[HDCP2_K_SIZE];
+	u8 stream_id_type[HDCP2_STREAMID_TYPE_SIZE];
+};
+
+struct hdcp2_info_rx {
+	u8 cert[HDCP2_CERTRX_SIZE];
+	u8 rrx[HDCP2_RRX_SIZE];
+	u8 rx_caps[HDCP2_RXCAPS_SIZE];
+	u8 rx_info[HDCP2_RXINFO_SIZE];
+	u8 ekh_km[HDCP2_EKHKM_SIZE];
+	u8 v_prime[HDCP2_VPRIME_SIZE];
+	u8 m_prime[HDCP2_REP_MPRIME_SIZE];
+	u8 h_prime[HDCP2_HPRIME_SIZE];
+	u8 l_prime[HDCP2_LPRIME_SIZE];
+	u8 recv_id_list[HDCP2_MAX_DEVICE_COUNT * HDCP2_RECVID_SIZE];
+	u8 seq_num_v[HDCP2_SEQ_NUM_V_SIZE];
+};
+
+struct hdcp2_handler {
+	u8 main_state;
+	u8 sub_state;
+	u8 down_stream_dev_cnt;
+	u8 hdcp_rx_ver;
+	bool send_ake_init:1;
+	bool get_recv_id_list:1;
+	bool stored_km:1;
+	bool send_lc_init:1;
+	bool send_ack:1;
+	bool sink_is_repeater:1;
+	bool recv_msg:1;
+	bool send_pair:1;
+	u32 seq_num_v_cnt;
+	u32 retry_cnt;
+};
+
+struct hdcp2_pairing_info {
+	u8 m[HDCP2_M_SIZE];
+	u8 ekh_km[HDCP2_EKHKM_SIZE];
+};
+
+struct hdcp1x_info {
+	bool enable;
+	bool repeater;
+	bool r0_read;
+	bool ksv_ready;
+	bool max_cascade;
+	bool max_devs;
+	u8 b_status;
+	u8 b_ksv[5];
+	u8 a_ksv[5];
+	u8 v[20];
+	u8 b_info[2];
+	u8 ksvfifo[5 * 127];
+	u8 device_count;
+	u8 retry_count;
+	int main_states;
+	int sub_states;
+};
+
+struct hdcp2_info {
+	struct hdcp2_info_tx hdcp_tx;
+	struct hdcp2_info_rx hdcp_rx;
+	struct hdcp2_handler hdcp_handler;
+	struct hdcp2_pairing_info stored_pairing_info;
+	bool enable;
+	bool repeater;
+	bool read_certrx;
+	bool read_h_prime;
+	bool read_pairing;
+	bool read_l_prime;
+	bool ks_exchange_done;
+	bool read_v_prime;
+	u8 retry_count;
+	u8 device_count;
+	u8 stream_id_type;
+};
+
+struct mtk_hdcp_info {
+	u8 auth_status;
+	bool g_init;
+	struct dp_tee_private *g_dp_tee_priv;
+	struct drm_dp_aux *aux;
+	struct regmap *regs;
+	struct hdcp1x_info hdcp1x_info;
+	struct hdcp2_info hdcp2_info;
+};
+
+enum HDCP_RESULT {
+	AUTH_ZERO = 0,
+	AUTH_PREPARE = 1,
+	AUTH_INIT = 2,
+	AUTH_PASS = 3,
+	AUTH_FAIL = 4,
+};
+
+#endif /* _MTK_DP_HDCP_H_ */
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
new file mode 100644
index 000000000000..2f30516e6009
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
@@ -0,0 +1,646 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2023 MediaTek Inc.
+ */
+
+#include "mtk_dp_hdcp1x.h"
+#include "mtk_dp_reg.h"
+#include "ca/tlcDpHdcp.h"
+#include "mtk_dp_hdcp.h"
+#include "mtk_dp.h"
+#include <linux/regmap.h>
+
+static u32 get_system_time(void)
+{
+	u32 tms = (u32)((sched_clock() / 1000000) % 1000000);
+	return tms;
+}
+
+static u32 get_time_diff(u32 pre_time)
+{
+	u32 post_time = get_system_time();
+
+	if (pre_time > post_time)
+		return ((1000000 - pre_time) + post_time);
+	else
+		return (post_time - pre_time);
+}
+
+static void mhal_dp_tx_hdcp1x_start_cipher(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	if (enable) {
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_3480,
+				       REQ_BLOCK_CIPHER_AUTH, REQ_BLOCK_CIPHER_AUTH);
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_3480,
+				       KM_GENERATED, KM_GENERATED);
+	} else {
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_3480, 0, KM_GENERATED);
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_3480, 0,
+				       REQ_BLOCK_CIPHER_AUTH);
+	}
+}
+
+static bool mhal_dp_tx_hdcp1x_get_r0_available(struct mtk_hdcp_info *hdcp_info)
+{
+	bool R0_available;
+	u32 ret;
+
+	ret = mtk_dp_reg_read(hdcp_info->regs, MTK_DP_TRANS_P0_34A4);
+	if (ret & BIT(12))
+		R0_available = true;
+	else
+		R0_available = false;
+
+	return R0_available;
+}
+
+static void mhal_dp_tx_hdcp1x_set_repeater(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	if (enable)
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_34A4, BIT(15), BIT(15));
+	else
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_34A4, 0,  BIT(15));
+
+#ifdef IF_ZERO
+	if (hdcp_info->hdcp1x_info.repeater) {
+		u8 temp;
+
+		temp = BIT(0); /* REAUTHENTICATION_ENABLE_IRQ_HPD */
+		drm_dp_dpcd_write(hdcp_info->aux, DPCD_6803B, &temp, 1);
+	}
+#endif
+}
+
+void mdrv_dp_tx_hdcp1x_set_start_auth(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	hdcp_info->hdcp1x_info.enable = enable;
+
+	if (enable) {
+		hdcp_info->auth_status = AUTH_INIT;
+		hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A0;
+		hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_IDLE;
+	} else {
+		hdcp_info->auth_status = AUTH_ZERO;
+		hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_H2;
+		hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_IDLE;
+		tee_hdcp_enable_encrypt(hdcp_info, false, HDCP_NONE);
+		mhal_dp_tx_hdcp1x_start_cipher(hdcp_info, false);
+		tee_hdcp1x_soft_rst(hdcp_info);
+	}
+
+	hdcp_info->hdcp1x_info.retry_count = 0;
+}
+
+bool mdrv_dp_tx_hdcp1x_support(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 temp_buffer[2];
+	int ret;
+
+	drm_dp_dpcd_read(hdcp_info->aux, DP_AUX_HDCP_BCAPS, temp_buffer, 0x1);
+
+	hdcp_info->hdcp1x_info.enable = temp_buffer[0x0] & BIT(0);
+	hdcp_info->hdcp1x_info.repeater = (temp_buffer[0x0] & BIT(1)) >> 1;
+
+	pr_info("HDCP1.3 CAPABLE: %d, Reapeater: %d\n",
+		hdcp_info->hdcp1x_info.enable,
+		hdcp_info->hdcp1x_info.repeater);
+
+	if (!hdcp_info->hdcp1x_info.enable)
+		return false;
+
+	ret = tee_add_device(hdcp_info, HDCP_VERSION_1X);
+	if (ret != RET_SUCCESS) {
+		pr_err("HDCP TA has some error\n");
+		hdcp_info->hdcp1x_info.enable = false;
+	}
+
+	return hdcp_info->hdcp1x_info.enable;
+}
+
+static bool mdrv_dp_tx_hdcp1x_init(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 i;
+
+	hdcp_info->hdcp1x_info.ksv_ready = false;
+	hdcp_info->hdcp1x_info.r0_read = false;
+	hdcp_info->hdcp1x_info.b_status = 0x00;
+	for (i = 0; i < 5; i++) {
+		hdcp_info->hdcp1x_info.b_ksv[i] = 0x00;
+		hdcp_info->hdcp1x_info.a_ksv[i] = 0x00;
+	}
+
+	for (i = 0; i < 5; i++)
+		hdcp_info->hdcp1x_info.v[i] = 0x00;
+
+	hdcp_info->hdcp1x_info.b_info[0] = 0x00;
+	hdcp_info->hdcp1x_info.b_info[1] = 0x00;
+	hdcp_info->hdcp1x_info.max_cascade = false;
+	hdcp_info->hdcp1x_info.max_devs = false;
+	hdcp_info->hdcp1x_info.device_count = 0x00;
+
+	tee_hdcp_enable_encrypt(hdcp_info, false, HDCP_NONE);
+	mhal_dp_tx_hdcp1x_start_cipher(hdcp_info, false);
+	tee_hdcp1x_soft_rst(hdcp_info);
+
+	return true;
+}
+
+static bool mdrv_dp_tx_hdcp1x_read_sink_b_ksv(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 read_buffer[5], i;
+
+	if (hdcp_info->hdcp1x_info.enable) {
+		drm_dp_dpcd_read(hdcp_info->aux, DP_AUX_HDCP_BKSV, read_buffer, 5);
+
+		for (i = 0; i < 5; i++) {
+			hdcp_info->hdcp1x_info.b_ksv[i] =
+				read_buffer[i];
+			pr_info("Bksv = 0x%x\n", read_buffer[i]);
+		}
+	}
+
+	return true;
+}
+
+static bool mdrv_dp_tx_hdcp1x_check_sink_ksv_ready(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 read_buffer;
+
+	drm_dp_dpcd_read(hdcp_info->aux, DP_AUX_HDCP_BSTATUS, &read_buffer, 1);
+
+	hdcp_info->hdcp1x_info.ksv_ready =
+		(read_buffer & BIT(0))  ? true : false;
+
+	return hdcp_info->hdcp1x_info.ksv_ready;
+}
+
+static bool mdrv_dp_tx_hdcp1x_check_sink_cap(struct mtk_hdcp_info *hdcp_info)
+{
+	u8  read_buffer[0x2];
+
+	drm_dp_dpcd_read(hdcp_info->aux, DP_AUX_HDCP_BCAPS, read_buffer, 1);
+
+	hdcp_info->hdcp1x_info.repeater =
+		(read_buffer[0] & BIT(1)) ? true : false;
+
+	return true;
+}
+
+static bool mdrv_dp_tx_hdcp1x_read_sink_b_info(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 read_buffer[2];
+
+	drm_dp_dpcd_read(hdcp_info->aux, DP_AUX_HDCP_BINFO, read_buffer, 2);
+
+	hdcp_info->hdcp1x_info.b_info[0] = read_buffer[0];
+	hdcp_info->hdcp1x_info.b_info[1] = read_buffer[1];
+	hdcp_info->hdcp1x_info.max_cascade =
+		(read_buffer[1] & BIT(3)) ? true : false;
+	hdcp_info->hdcp1x_info.max_devs =
+		(read_buffer[0] & BIT(7)) ? true : false;
+	hdcp_info->hdcp1x_info.device_count = read_buffer[0] & 0x7F;
+
+	pr_info("HDCP Binfo max_cascade_EXCEEDED = %d\n",
+		hdcp_info->hdcp1x_info.max_cascade);
+	pr_info("HDCP Binfo DEPTH = %d\n", read_buffer[1] & 0x07);
+	pr_info("HDCP Binfo max_devs_EXCEEDED = %d\n",
+		hdcp_info->hdcp1x_info.max_devs);
+	pr_info("HDCP Binfo device_count = %d\n",
+		hdcp_info->hdcp1x_info.device_count);
+	return true;
+}
+
+static bool mdrv_dp_tx_hdcp1x_read_sink_ksv(struct mtk_hdcp_info *hdcp_info,
+					    u8 dev_count)
+{
+	u8 i;
+	u8 times = dev_count / 3;
+	u8 remain = dev_count % 3;
+
+	if (times > 0) {
+		for (i = 0; i < times; i++)
+			drm_dp_dpcd_read(hdcp_info->aux, DP_AUX_HDCP_KSV_FIFO,
+					 hdcp_info->hdcp1x_info.ksvfifo + i * 15,
+				15);
+	}
+
+	if (remain > 0)
+		drm_dp_dpcd_read(hdcp_info->aux, DP_AUX_HDCP_KSV_FIFO,
+				 hdcp_info->hdcp1x_info.ksvfifo + times * 15,
+			remain * 5);
+
+	pr_info("HDCP Read ksvfifo = %x\n",	hdcp_info->hdcp1x_info.ksvfifo[0]);
+	pr_info("HDCP Read ksvfifo = %x\n",	hdcp_info->hdcp1x_info.ksvfifo[1]);
+	pr_info("HDCP Read ksvfifo = %x\n",	hdcp_info->hdcp1x_info.ksvfifo[2]);
+	pr_info("HDCP Read ksvfifo = %x\n",	hdcp_info->hdcp1x_info.ksvfifo[3]);
+	pr_info("HDCP Read ksvfifo = %x\n",	hdcp_info->hdcp1x_info.ksvfifo[4]);
+
+	return true;
+}
+
+static bool mdrv_dp_tx_hdcp1x_read_sink_sha_v(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 read_buffer[4], i, j;
+
+	for (i = 0; i < 5; i++) {
+		drm_dp_dpcd_read(hdcp_info->aux,
+				 0x68014 + (i * 4), read_buffer, 4);
+		for (j = 0; j < 4; j++) {
+			hdcp_info->hdcp1x_info.v[(i * 4) + j] =
+				read_buffer[3 - j];
+			pr_info("HDCP Read sink V = %x\n",
+				hdcp_info->hdcp1x_info.v[(i * 4) + j]);
+		}
+	}
+
+	return true;
+}
+
+static bool mdrv_dp_tx_hdcp1x_auth_with_repeater(struct mtk_hdcp_info *hdcp_info)
+{
+	bool ret = false;
+	u8 *buffer = NULL;
+	u32 len = 0;
+	int tmp = 0;
+
+	if (hdcp_info->hdcp1x_info.device_count > HDCP1X_REP_MAXDEVS) {
+		pr_err("HDCP Repeater: %d DEVs!\n",
+		       hdcp_info->hdcp1x_info.device_count);
+		return false;
+	}
+
+	mdrv_dp_tx_hdcp1x_read_sink_ksv(hdcp_info,
+					hdcp_info->hdcp1x_info.device_count);
+	mdrv_dp_tx_hdcp1x_read_sink_sha_v(hdcp_info);
+
+	len = hdcp_info->hdcp1x_info.device_count * 5 + 2;
+	buffer = kmalloc(len, GFP_KERNEL);
+	if (!buffer) {
+		pr_err("Out of Memory\n");
+		return false;
+	}
+
+	memcpy(buffer, hdcp_info->hdcp1x_info.ksvfifo, len - 2);
+	memcpy(buffer + (len - 2), hdcp_info->hdcp1x_info.b_info, 2);
+	tmp = tee_hdcp1x_compute_compare_v(hdcp_info, buffer, len, hdcp_info->hdcp1x_info.v);
+	if (tmp == RET_COMPARE_PASS) {
+		pr_info("Check V' PASS\n");
+		ret = true;
+	} else {
+		pr_info("Check V' Fail\n");
+	}
+
+	kfree(buffer);
+	return ret;
+}
+
+static bool mdrv_dp_tx_hdcp1x_verify_b_ksv(struct mtk_hdcp_info *hdcp_info)
+{
+	int i, j, k = 0;
+	u8 ksv;
+
+	for (i = 0; i < 5; i++) {
+		ksv = hdcp_info->hdcp1x_info.b_ksv[i];
+		for (j = 0; j < 8; j++)
+			k += (ksv >> j) & 0x01;
+	}
+
+	if (k != 20) {
+		pr_err("Check BKSV 20'1' 20'0' Fail\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool mdrv_dp_tx_hdcp1x_write_a_ksv(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 temp;
+	int i, k, j;
+
+	tee_get_aksv(hdcp_info, hdcp_info->hdcp1x_info.a_ksv);
+	drm_dp_dpcd_write(hdcp_info->aux, DP_AUX_HDCP_AKSV,
+			  hdcp_info->hdcp1x_info.a_ksv, 5);
+
+	for (i = 0, k = 0; i < 5; i++) {
+		temp = hdcp_info->hdcp1x_info.a_ksv[i];
+
+		for (j = 0; j < 8; j++)
+			k += (temp >> j) & 0x01;
+		pr_info("Aksv 0x%x\n", temp);
+	}
+
+	if (k != 20) {
+		pr_err("Check AKSV 20'1' 20'0' Fail\n");
+		return false;
+	}
+
+	return true;
+}
+
+static void mdrv_dp_tx_hdcp1x_write_an(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 an_value[0x8] = { /* on DP Spec p99 */
+		0x03, 0x04, 0x07, 0x0C, 0x13, 0x1C, 0x27, 0x34};
+
+	tee_hdcp1x_set_tx_an(hdcp_info, an_value);
+	drm_dp_dpcd_write(hdcp_info->aux, DP_AUX_HDCP_AN, an_value, 8);
+	mdelay(5);
+}
+
+static bool mdrv_dp_tx_hdcp1x_check_r0(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 temp_value[2];
+	u8 retry_count = 0;
+	bool sink_R0_available = false;
+	bool ret;
+	int tmp;
+
+	ret = mhal_dp_tx_hdcp1x_get_r0_available(hdcp_info);
+	if (!ret) {
+		pr_err("HDCP ERR: R0 No Available\n");
+		return false;
+	}
+
+	if (!hdcp_info->hdcp1x_info.r0_read) {
+		drm_dp_dpcd_read(hdcp_info->aux, DP_AUX_HDCP_BSTATUS, temp_value, 1);
+		sink_R0_available =
+			((temp_value[0x0] & BIT(1)) == BIT(1)) ? true : false;
+
+		if (!sink_R0_available) {
+			drm_dp_dpcd_read(hdcp_info->aux,
+					 DP_AUX_HDCP_BSTATUS, temp_value, 1);
+			sink_R0_available =
+				((temp_value[0x0] & BIT(1)) == BIT(1))
+					? true : false;
+
+			if (!sink_R0_available)
+				return false;
+		}
+	}
+
+	while (retry_count < 3) {
+		drm_dp_dpcd_read(hdcp_info->aux,
+				 DP_AUX_HDCP_RI_PRIME, temp_value, 2);
+
+		tmp = tee_compare_r0(hdcp_info, temp_value, 2);
+		if (tmp == RET_COMPARE_PASS)
+			return true;
+
+		pr_info("R0 check FAIL:Rx_R0=0x%x%x\n",
+			temp_value[0x1], temp_value[0x0]);
+		mdelay(5);
+
+		retry_count++;
+	}
+	return false;
+}
+
+static void mdrv_dp_tx_hdcp1x_state_rst(struct mtk_hdcp_info *hdcp_info)
+{
+	pr_info("Before State Reset:(M : S)= (%d, %d)",
+		hdcp_info->hdcp1x_info.main_states,
+		hdcp_info->hdcp1x_info.sub_states);
+	hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A0;
+	hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_IDLE;
+}
+
+void mdrv_dp_tx_hdcp1x_fsm(struct mtk_hdcp_info *hdcp_info)
+{
+	static int pre_main, pre_sub;
+	static u32 pre_time;
+	u32 time;
+	bool ret;
+
+	if (pre_main != hdcp_info->hdcp1x_info.main_states ||
+	    hdcp_info->hdcp1x_info.sub_states != pre_sub) {
+		pr_info("HDCP1.x State(M : S)= (%d, %d)",
+			hdcp_info->hdcp1x_info.main_states,
+			hdcp_info->hdcp1x_info.sub_states);
+		pre_main = hdcp_info->hdcp1x_info.main_states;
+		pre_sub = hdcp_info->hdcp1x_info.sub_states;
+	}
+
+	switch (hdcp_info->hdcp1x_info.main_states) {
+	case HDCP1X_main_state_H2:
+		switch (hdcp_info->hdcp1x_info.sub_states) {
+		case HDCP1X_sub_FSM_IDLE:
+			break;
+		case HDCP1X_sub_FSM_auth_fail:
+			tee_hdcp_enable_encrypt(hdcp_info, false, HDCP_NONE);
+			pr_info("HDCP1.3 Authentication Fail\n");
+			hdcp_info->auth_status = AUTH_FAIL;
+			hdcp_info->hdcp1x_info.main_states =
+					HDCP1X_main_state_H2;
+			hdcp_info->hdcp1x_info.sub_states =
+					HDCP1X_sub_FSM_IDLE;
+			break;
+		}
+		break;
+	case HDCP1X_main_state_A0:
+		switch (hdcp_info->hdcp1x_info.sub_states) {
+		case HDCP1X_sub_FSM_IDLE:
+			if (hdcp_info->hdcp1x_info.retry_count
+				> HDCP1X_REAUNTH_COUNT) {
+				pr_info("Too much retry!\n");
+				hdcp_info->hdcp1x_info.main_states =
+					HDCP1X_main_state_H2;
+				hdcp_info->hdcp1x_info.sub_states =
+					HDCP1X_sub_FSM_auth_fail;
+			} else {
+				mdrv_dp_tx_hdcp1x_init(hdcp_info);
+				hdcp_info->hdcp1x_info.main_states =
+					HDCP1X_main_state_A0;
+				hdcp_info->hdcp1x_info.sub_states =
+					HDCP1X_sub_FSM_CHECKHDCPCAPABLE;
+			}
+
+			break;
+		case HDCP1X_sub_FSM_CHECKHDCPCAPABLE:
+			if (hdcp_info->hdcp1x_info.enable) {
+				hdcp_info->hdcp1x_info.retry_count++;
+				hdcp_info->hdcp1x_info.main_states =
+					HDCP1X_main_state_A1;
+				hdcp_info->hdcp1x_info.sub_states =
+					HDCP1X_sub_FSM_exchange_KSV;
+			} else {
+				mdrv_dp_tx_hdcp1x_state_rst(hdcp_info);
+			}
+			break;
+		}
+		break;
+	case HDCP1X_main_state_A1:
+		switch (hdcp_info->hdcp1x_info.sub_states) {
+		case HDCP1X_sub_FSM_exchange_KSV:
+			mdrv_dp_tx_hdcp1x_write_an(hdcp_info);
+			ret = mdrv_dp_tx_hdcp1x_write_a_ksv(hdcp_info);
+			if (ret) {
+				pre_time = get_system_time();
+				hdcp_info->hdcp1x_info.main_states =
+					HDCP1X_main_state_A1;
+				hdcp_info->hdcp1x_info.sub_states =
+					HDCP1X_sub_FSM_verify_bksv;
+			} else {
+				mdrv_dp_tx_hdcp1x_state_rst(hdcp_info);
+			}
+			break;
+
+		case HDCP1X_sub_FSM_verify_bksv:
+			mdrv_dp_tx_hdcp1x_read_sink_b_ksv(hdcp_info);
+			mhal_dp_tx_hdcp1x_set_repeater(hdcp_info,
+						       hdcp_info->hdcp1x_info.repeater);
+
+			time = get_time_diff(pre_time);
+			if (time < HDCP1X_BSTATUS_TIMEOUT_CNT) {
+				pre_time = get_system_time();
+				ret = mdrv_dp_tx_hdcp1x_verify_b_ksv(hdcp_info);
+				if (ret) {
+					hdcp_info->hdcp1x_info.main_states =
+						HDCP1X_main_state_A2;
+					hdcp_info->hdcp1x_info.sub_states =
+						HDCP1X_sub_FSM_computation;
+				} else {
+					mdrv_dp_tx_hdcp1x_state_rst(hdcp_info);
+					pr_info("Invalid BKSV!!\n");
+				}
+			} else {
+				mdrv_dp_tx_hdcp1x_state_rst(hdcp_info);
+				}
+			break;
+		}
+		break;
+
+	case HDCP1X_main_state_A2:
+		switch (hdcp_info->hdcp1x_info.sub_states) {
+		case HDCP1X_sub_FSM_computation:
+			tee_calculate_lm(hdcp_info, hdcp_info->hdcp1x_info.b_ksv);
+			mhal_dp_tx_hdcp1x_start_cipher(hdcp_info, true);
+			hdcp_info->hdcp1x_info.main_states =
+				HDCP1X_main_state_A3;
+			hdcp_info->hdcp1x_info.sub_states =
+				HDCP1X_sub_FSM_check_R0;
+			pre_time = get_system_time();
+			break;
+		}
+		break;
+
+	case HDCP1X_main_state_A3:
+		switch (hdcp_info->hdcp1x_info.sub_states) {
+		case HDCP1X_sub_FSM_check_R0:
+			/* Wait 100ms(at least) before check R0 */
+			time = get_time_diff(pre_time);
+			if (time < HDCP1X_R0_WDT &&
+			    !hdcp_info->hdcp1x_info.r0_read) {
+				mdelay(10);
+				break;
+			}
+
+			ret = mdrv_dp_tx_hdcp1x_check_r0(hdcp_info);
+			if (ret) {
+				tee_hdcp_enable_encrypt(hdcp_info, true, HDCP_V1);
+				hdcp_info->hdcp1x_info.main_states =
+					HDCP1X_main_state_A5;
+				hdcp_info->hdcp1x_info.sub_states =
+					HDCP1X_sub_FSM_IDLE;
+			} else {
+				mdrv_dp_tx_hdcp1x_state_rst(hdcp_info);
+			}
+
+			break;
+		}
+		break;
+
+	case HDCP1X_main_state_A4:
+		switch (hdcp_info->hdcp1x_info.sub_states) {
+		case HDCP1X_sub_FSM_IDLE:
+			break;
+		case HDCP1X_sub_FSM_auth_done:
+			pr_info("HDCP1X: Authentication done!\n");
+			hdcp_info->hdcp1x_info.retry_count = 0;
+			hdcp_info->auth_status = AUTH_PASS;
+			hdcp_info->hdcp1x_info.main_states =
+						HDCP1X_main_state_A4;
+			hdcp_info->hdcp1x_info.sub_states =
+						HDCP1X_sub_FSM_IDLE;
+
+			/* unmute */
+			break;
+		}
+		break;
+
+	case HDCP1X_main_state_A5:
+		switch (hdcp_info->hdcp1x_info.sub_states) {
+		case HDCP1X_sub_FSM_IDLE:
+			mdrv_dp_tx_hdcp1x_check_sink_cap(hdcp_info);
+			if (hdcp_info->hdcp1x_info.repeater) {
+				pr_info("HDCP1X:Repeater!\n");
+				pre_time = get_system_time();
+				hdcp_info->hdcp1x_info.main_states =
+					HDCP1X_main_state_A6;
+				hdcp_info->hdcp1x_info.sub_states =
+					HDCP1X_sub_FSM_polling_rdy_bit;
+			} else {
+				pr_info("HDCP1X:No Repeater!\n");
+				hdcp_info->hdcp1x_info.main_states =
+						HDCP1X_main_state_A4;
+				hdcp_info->hdcp1x_info.sub_states =
+						HDCP1X_sub_FSM_auth_done;
+			}
+			break;
+		}
+		break;
+
+	case HDCP1X_main_state_A6:
+		switch (hdcp_info->hdcp1x_info.sub_states) {
+		case HDCP1X_sub_FSM_polling_rdy_bit:
+			time = get_time_diff(pre_time);
+			if (time > HDCP1X_REP_RDY_WDT) {
+				mdrv_dp_tx_hdcp1x_state_rst(hdcp_info);
+				break;
+			}
+
+			time = get_time_diff(pre_time);
+			if (!hdcp_info->hdcp1x_info.ksv_ready &&
+			    time > HDCP1X_REP_RDY_WDT / 2)
+				mdrv_dp_tx_hdcp1x_check_sink_ksv_ready(hdcp_info);
+
+			if (hdcp_info->hdcp1x_info.ksv_ready) {
+				mdrv_dp_tx_hdcp1x_read_sink_b_info(hdcp_info);
+				hdcp_info->hdcp1x_info.main_states =
+					HDCP1X_main_state_A7;
+				hdcp_info->hdcp1x_info.sub_states =
+					HDCP1X_sub_FSM_auth_with_repeater;
+				hdcp_info->hdcp1x_info.ksv_ready = false;
+			}
+			break;
+		}
+		break;
+
+	case HDCP1X_main_state_A7:
+		switch (hdcp_info->hdcp1x_info.sub_states) {
+		case HDCP1X_sub_FSM_auth_with_repeater:
+			if (hdcp_info->hdcp1x_info.max_cascade ||
+			    hdcp_info->hdcp1x_info.max_devs){
+				pr_err("MAX CASCADE or MAX DEVS!\n");
+				mdrv_dp_tx_hdcp1x_state_rst(hdcp_info);
+				break;
+			}
+
+			ret = mdrv_dp_tx_hdcp1x_auth_with_repeater(hdcp_info);
+			if (ret) {
+				hdcp_info->hdcp1x_info.main_states =
+						HDCP1X_main_state_A4;
+				hdcp_info->hdcp1x_info.sub_states =
+						HDCP1X_sub_FSM_auth_done;
+			} else {
+				mdrv_dp_tx_hdcp1x_state_rst(hdcp_info);
+			}
+
+			break;
+		}
+		break;
+
+	default:
+		break;
+	}
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h
new file mode 100644
index 000000000000..2fd169f5c3cb
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2023 MediaTek Inc.
+ */
+
+#ifndef _MTK_DP_HDCP1X_H_
+#define _MTK_DP_HDCP1X_H_
+
+#include "mtk_dp_hdcp.h"
+
+#define DP_HDCP1_BINFO_SIZE			2
+#define DP_HDCP1_BCAPS_SIZE			1
+#define DP_HDCP1_BSTATUS_SIZE			1
+#define DP_HDCP1_AN_SIZE			8
+#define DP_HDCP1_AKSV_SIZE			5
+#define DP_HDCP1_BKSV_SIZE			5
+#define DP_HDCP1_AINFO_SIZE			1
+
+#define HDCP1X_BSTATUS_TIMEOUT_CNT              600
+#define HDCP1X_R0_WDT                           100
+#define HDCP1X_REP_RDY_WDT                      5000
+
+#define HDCP1X_REP_MAXDEVS            128
+#define HDCP1X_REAUNTH_COUNT          3
+
+enum DPTX_DRV_HDCP1X_main_states {
+	HDCP1X_main_state_H2 = 0,
+	HDCP1X_main_state_A0 = 1,
+	HDCP1X_main_state_A1 = 2,
+	HDCP1X_main_state_A2 = 3,
+	HDCP1X_main_state_A3 = 4,
+	HDCP1X_main_state_A4 = 5,
+	HDCP1X_main_state_A5 = 6,
+	HDCP1X_main_state_A6 = 7,
+	HDCP1X_main_state_A7 = 8,
+};
+
+enum DPTX_DRV_HDCP1X_sub_states {
+	HDCP1X_sub_FSM_IDLE              = 0,
+	HDCP1X_sub_FSM_CHECKHDCPCAPABLE	= 1,
+	HDCP1X_sub_FSM_exchange_KSV       = 2,
+	HDCP1X_sub_FSM_verify_bksv        = 3,
+	HDCP1X_sub_FSM_computation       = 4,
+	HDCP1X_sub_FSM_check_R0           = 5,
+	HDCP1X_sub_FSM_auth_done          = 6,
+	HDCP1X_sub_FSM_polling_rdy_bit     = 7,
+	HDCP1X_sub_FSM_auth_with_repeater  = 8,
+	HDCP1X_sub_FSM_auth_fail          = 9,
+};
+
+bool mdrv_dp_tx_hdcp1x_support(struct mtk_hdcp_info *hdcp_info);
+void mdrv_dp_tx_hdcp1x_fsm(struct mtk_hdcp_info *hdcp_info);
+void mdrv_dp_tx_hdcp1x_set_start_auth(struct mtk_hdcp_info *hdcp_info, bool enable);
+
+#endif /* _MTK_DP_HDCP1X_H_ */
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
new file mode 100644
index 000000000000..09100292182d
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
@@ -0,0 +1,1008 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2023 MediaTek Inc.
+ */
+
+#include "mtk_dp_hdcp2.h"
+#include "mtk_dp_reg.h"
+#include "ca/tlcDpHdcp.h"
+#include "mtk_dp_hdcp.h"
+#include "mtk_dp.h"
+#include <linux/regmap.h>
+
+#define DPTXHDCPFUNC(fmt, arg...)		\
+	pr_info("[DPTXHDCP][%s line:%d]"pr_fmt(fmt), __func__, __LINE__, ##arg)
+
+#define DPTXHDCPMSG(fmt, arg...)                                  \
+		pr_info("[DPTXHDCP]"pr_fmt(fmt), ##arg)
+
+u8 t_rtx[HDCP2_RTX_SIZE] = {
+	0x18, 0xfa, 0xe4, 0x20, 0x6a, 0xfb, 0x51, 0x49
+};
+
+u8 t_tx_caps[HDCP2_TXCAPS_SIZE] = {
+	0x02, 0x00, 0x00
+};
+
+u8 t_rn[HDCP2_RN_SIZE] = {
+	0x32, 0x75, 0x3e, 0xa8, 0x78, 0xa6, 0x38, 0x1c
+};
+
+u8 t_riv[HDCP2_RIV_SIZE] = {
+	0x40, 0x2b, 0x6b, 0x43, 0xc5, 0xe8, 0x86, 0xd8
+};
+
+static u32 get_system_time(void)
+{
+	u32 tms = (u32)((sched_clock() / 1000000) % 1000000);
+	return tms;
+}
+
+static u32 get_time_diff(u32 pre_time)
+{
+	u32 post_time = get_system_time();
+
+	if (pre_time > post_time)
+		return ((1000000 - pre_time) + post_time);
+	else
+		return (post_time - pre_time);
+}
+
+static void mhal_dp_tx_hdcp2_fill_stream_type(struct mtk_hdcp_info *hdcp_info, u8 uc_type)
+{
+	mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_34D0, uc_type, 0xff);
+}
+
+static void mdrv_dp_tx_hdcp2_set_state(struct mtk_hdcp_info *hdcp_info, u8 main_state, u8 sub_state)
+{
+	hdcp_info->hdcp2_info.hdcp_handler.main_state = main_state;
+	hdcp_info->hdcp2_info.hdcp_handler.sub_state = sub_state;
+}
+
+static void mdrv_dp_tx_hdcp2_set_auth_pass(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	if (enable) {
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_3400, BIT(11), BIT(11));
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_34A4, BIT(4), BIT(4));
+	} else {
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_3400, 0, BIT(11));
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_TRANS_P0_34A4, 0, BIT(4));
+	}
+}
+
+static void mdrv_dp_tx_hdcp2_enable_auth(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	DPTXHDCPFUNC();
+	mdrv_dp_tx_hdcp2_set_auth_pass(hdcp_info, enable);
+	if (enable) {
+		u32 version = HDCP_V2_3;
+
+		if (hdcp_info->hdcp2_info.hdcp_rx.rx_info[1] & BIT(0))
+			version = HDCP_V1;
+		else if (hdcp_info->hdcp2_info.hdcp_rx.rx_info[1] & BIT(1))
+			version = HDCP_V2;
+
+		tee_hdcp_enable_encrypt(hdcp_info, enable, version);
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_ENC0_P0_3000, BIT(5), BIT(5));
+	} else {
+		tee_hdcp_enable_encrypt(hdcp_info, enable, HDCP_NONE);
+		mtk_dp_reg_update_bits(hdcp_info->regs, MTK_DP_ENC0_P0_3000, 0, BIT(5));
+	}
+}
+
+static int mdrv_dp_tx_hdcp2_init(struct mtk_hdcp_info *hdcp_info)
+{
+	int err_code = HDCP_ERR_NONE;
+
+	DPTXHDCPFUNC();
+
+	memset(&hdcp_info->hdcp2_info.hdcp_tx, 0, sizeof(struct hdcp2_info_tx));
+	memset(&hdcp_info->hdcp2_info.hdcp_rx, 0, sizeof(struct hdcp2_info_rx));
+	memcpy(hdcp_info->hdcp2_info.hdcp_tx.rtx, t_rtx, HDCP2_RTX_SIZE);
+	memcpy(hdcp_info->hdcp2_info.hdcp_tx.tx_caps, t_tx_caps, HDCP2_TXCAPS_SIZE);
+	memcpy(hdcp_info->hdcp2_info.hdcp_tx.rn, t_rn, HDCP2_RN_SIZE);
+	memcpy(hdcp_info->hdcp2_info.hdcp_tx.riv, t_riv, HDCP2_RIV_SIZE);
+
+	memset(&hdcp_info->hdcp2_info.hdcp_handler, 0, sizeof(struct hdcp2_handler));
+	memset(&hdcp_info->hdcp2_info.stored_pairing_info, 0, sizeof(struct hdcp2_pairing_info));
+
+	mdrv_dp_tx_hdcp2_enable_auth(hdcp_info, false);
+
+	return err_code;
+}
+
+static bool mdrv_dp_tx_hdcp2_inc_seq_num_m(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 i = 0;
+	u32 temp_value = 0;
+
+	for (i = 0; i < HDCP2_SEQ_NUM_M_SIZE; i++)
+		temp_value |= hdcp_info->hdcp2_info.hdcp_tx.seq_num_m[i] << (i * 8);
+
+	if (temp_value == 0xFFFFFF)
+		return false;
+
+	temp_value++;
+
+	for (i = 0; i < HDCP2_SEQ_NUM_M_SIZE; i++)
+		hdcp_info->hdcp2_info.hdcp_tx.seq_num_m[i] =
+			(temp_value & ((u32)0xFF << (i * 8))) >> (i * 8);
+	return true;
+}
+
+static bool mdrv_dp_tx_hdcp2_process_rep_auth_stream_manage(struct mtk_hdcp_info *hdcp_info)
+{
+	bool ret = false;
+
+	hdcp_info->hdcp2_info.hdcp_tx.k[0] = 0x00;
+	hdcp_info->hdcp2_info.hdcp_tx.k[1] = 0x01;
+
+	hdcp_info->hdcp2_info.hdcp_tx.stream_id_type[0] = 0x00; //Payload ID
+	hdcp_info->hdcp2_info.hdcp_tx.stream_id_type[1] = hdcp_info->hdcp2_info.stream_id_type;
+
+	ret = mdrv_dp_tx_hdcp2_inc_seq_num_m(hdcp_info);
+
+	return ret;
+}
+
+static bool mdrv_dp_tx_hdcp2_recv_rep_auth_send_recv_id_list(struct mtk_hdcp_info *hdcp_info)
+{
+	bool ret = false;
+	u8 *buffer = NULL;
+	u32 len = 0, len_recv_id_list = 0;
+	int rc = 0;
+
+	len_recv_id_list =
+		hdcp_info->hdcp2_info.device_count * HDCP2_RECVID_SIZE;
+	len = len_recv_id_list + HDCP2_RXINFO_SIZE + HDCP2_SEQ_NUM_V_SIZE;
+	buffer = kmalloc(len, GFP_KERNEL);
+	if (!buffer) {
+		pr_err("Out of Memory\n");
+		return ret;
+	}
+
+	memcpy(buffer, hdcp_info->hdcp2_info.hdcp_rx.recv_id_list, len_recv_id_list);
+	memcpy(buffer + len_recv_id_list, hdcp_info->hdcp2_info.hdcp_rx.rx_info, HDCP2_RXINFO_SIZE);
+	memcpy(buffer + len_recv_id_list + HDCP2_RXINFO_SIZE,
+	       hdcp_info->hdcp2_info.hdcp_rx.seq_num_v, HDCP2_SEQ_NUM_V_SIZE);
+
+	rc = tee_hdcp2_compute_compare_v(hdcp_info, buffer, len,
+					 hdcp_info->hdcp2_info.hdcp_rx.v_prime,
+					 hdcp_info->hdcp2_info.hdcp_tx.v_prime);
+
+	if (rc == RET_COMPARE_PASS) {
+		ret = true;
+		DPTXHDCPMSG("V' is PASS!!\n");
+	} else {
+		DPTXHDCPMSG("V' is FAIL!!\n");
+	}
+
+	kfree(buffer);
+	return ret;
+}
+
+static bool mdrv_dp_tx_hdcp2_recv_rep_auth_stream_ready(struct mtk_hdcp_info *hdcp_info)
+{
+	bool ret = false;
+	u8 *buffer = NULL;
+	u32 len = 0;
+	int temp = 0;
+
+	len = HDCP2_STREAMID_TYPE_SIZE + HDCP2_SEQ_NUM_M_SIZE;
+	buffer = kmalloc(len, GFP_KERNEL);
+	if (!buffer) {
+		pr_err("Out of Memory\n");
+		return ret;
+	}
+
+	memcpy(buffer, hdcp_info->hdcp2_info.hdcp_tx.stream_id_type, HDCP2_STREAMID_TYPE_SIZE);
+	memcpy(buffer + HDCP2_STREAMID_TYPE_SIZE, hdcp_info->hdcp2_info.hdcp_tx.seq_num_m,
+	       HDCP2_SEQ_NUM_M_SIZE);
+	temp = tee_hdcp2_compute_compare_m(hdcp_info, buffer, len,
+					   hdcp_info->hdcp2_info.hdcp_rx.m_prime);
+
+	if (temp == RET_COMPARE_PASS) {
+		ret = true;
+		DPTXHDCPMSG("M' is PASS!!\n");
+	} else {
+		DPTXHDCPMSG("M' is FAIL!!\n");
+	}
+
+	kfree(buffer);
+	return ret;
+}
+
+static bool mdrv_dp_tx_hdcp2_check_seq_num_v(struct mtk_hdcp_info *hdcp_info)
+{
+	if ((hdcp_info->hdcp2_info.hdcp_rx.seq_num_v[0] == 0x00 &&
+	     hdcp_info->hdcp2_info.hdcp_rx.seq_num_v[1] == 0x00 &&
+			hdcp_info->hdcp2_info.hdcp_rx.seq_num_v[2] == 0x00) &&
+		hdcp_info->hdcp2_info.hdcp_handler.seq_num_v_cnt > 0xFFFFFF) {
+		DPTXHDCPMSG("SeqNumV Rollover!\n");
+		return false;
+	}
+
+	if ((hdcp_info->hdcp2_info.hdcp_rx.seq_num_v[0]
+		!= (u8)((hdcp_info->hdcp2_info.hdcp_handler.seq_num_v_cnt & 0xFF0000) >> 16)) ||
+			(hdcp_info->hdcp2_info.hdcp_rx.seq_num_v[1]
+		!= (u8)((hdcp_info->hdcp2_info.hdcp_handler.seq_num_v_cnt & 0x00FF00) >> 8)) ||
+			(hdcp_info->hdcp2_info.hdcp_rx.seq_num_v[2]
+		!= (u8)((hdcp_info->hdcp2_info.hdcp_handler.seq_num_v_cnt & 0x0000FF)))) {
+		DPTXHDCPMSG("Invalid Seq_num_V!\n");
+		return false;
+	}
+
+	hdcp_info->hdcp2_info.hdcp_handler.seq_num_v_cnt++;
+	return true;
+}
+
+static void mdrv_dp_tx_hdcp2_err_handle(struct mtk_hdcp_info *hdcp_info, int err_msg, int line)
+{
+	pr_err("MainState:%d; SubState:%d;\n", hdcp_info->hdcp2_info.hdcp_handler.main_state,
+	       hdcp_info->hdcp2_info.hdcp_handler.sub_state);
+
+	switch (err_msg) {
+	case HDCP_ERR_UNKNOWN_STATE:
+		pr_err("Unknown State, line:%d\n", line);
+		mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_H1P1, HDCP2_MSG_AUTH_FAIL);
+		break;
+
+	case HDCP_ERR_SEND_MSG_FAIL:
+		pr_err("Send Msg Fail, line:%d\n", line);
+		mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A0F0, HDCP2_MSG_ZERO);
+		break;
+	case HDCP_ERR_RESPONSE_TIMEROUT:
+		pr_err("Response Timeout, line:%d!\n", line);
+		mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A0F0, HDCP2_MSG_ZERO);
+		break;
+
+	case HDCP_ERR_PROCESS_FAIL:
+		pr_err("Process Fail, line:%d!\n", line);
+		mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A0F0, HDCP2_MSG_ZERO);
+		break;
+
+	default:
+		pr_err("NO ERROR!");
+		break;
+	}
+}
+
+static bool mdrv_dp_tx_hdcp2_read_msg(struct mtk_hdcp_info *hdcp_info, u8 cmd_ID)
+{
+	bool ret = false;
+	u8 size = 0;
+
+	switch (cmd_ID) {
+	case HDCP2_MSG_AKE_SEND_CERT:
+		drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_CERT_RX_OFFSET,
+				 hdcp_info->hdcp2_info.hdcp_rx.cert, HDCP2_CERTRX_SIZE);
+		drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_RRX_OFFSET,
+				 hdcp_info->hdcp2_info.hdcp_rx.rrx, HDCP2_RRX_SIZE);
+		drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
+				 hdcp_info->hdcp2_info.hdcp_rx.rx_caps, HDCP2_RXCAPS_SIZE);
+
+		hdcp_info->hdcp2_info.read_certrx = false;
+		hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
+		ret = true;
+		DPTXHDCPMSG("HDCP2_MSG_AKE_SEND_CERT\n");
+		break;
+
+	case HDCP2_MSG_AKE_SEND_H_PRIME:
+		drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_HPRIME_OFFSET,
+				 hdcp_info->hdcp2_info.hdcp_rx.h_prime, HDCP2_HPRIME_SIZE);
+
+		hdcp_info->hdcp2_info.read_h_prime = false;
+		hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
+		ret = true;
+
+		DPTXHDCPMSG("HDCP2_MSG_AKE_SEND_H_PRIME\n");
+		break;
+
+	case HDCP2_MSG_AKE_SEND_PAIRING_INFO:
+		drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_EKH_KM_RD_OFFSET,
+				 hdcp_info->hdcp2_info.hdcp_rx.ekh_km, HDCP2_EKHKM_SIZE);
+		hdcp_info->hdcp2_info.read_pairing = false;
+		hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
+		ret = true;
+		DPTXHDCPMSG("HDCP2_MSG_AKE_SEND_PAIRING_INFO\n");
+		break;
+
+	case HDCP2_MSG_LC_SEND_L_PRIME:
+		drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_LPRIME_OFFSET,
+				 hdcp_info->hdcp2_info.hdcp_rx.l_prime, HDCP2_LPRIME_SIZE);
+
+		hdcp_info->hdcp2_info.read_l_prime = false;
+		hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
+		ret = true;
+		DPTXHDCPMSG("HDCP2_MSG_LC_SEND_L_PRIME\n");
+		break;
+
+	case HDCP2_MSG_REPAUTH_SEND_RECVID_LIST:
+		drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_RXINFO_OFFSET,
+				 hdcp_info->hdcp2_info.hdcp_rx.rx_info, HDCP2_RXINFO_SIZE);
+		hdcp_info->hdcp2_info.device_count =
+			((hdcp_info->hdcp2_info.hdcp_rx.rx_info[1] & 0xf0) >> 4)
+				| ((hdcp_info->hdcp2_info.hdcp_rx.rx_info[0] & BIT(0)) << 4);
+
+		drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_SEQ_NUM_V_OFFSET,
+				 hdcp_info->hdcp2_info.hdcp_rx.seq_num_v, HDCP2_SEQ_NUM_V_SIZE);
+		drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_VPRIME_OFFSET,
+				 hdcp_info->hdcp2_info.hdcp_rx.v_prime, HDCP2_VPRIME_SIZE);
+		drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_RECV_ID_LIST_OFFSET,
+				 hdcp_info->hdcp2_info.hdcp_rx.recv_id_list,
+			hdcp_info->hdcp2_info.device_count
+				* HDCP2_RECVID_SIZE);
+
+		hdcp_info->hdcp2_info.read_v_prime = false;
+		hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
+		ret = true;
+		DPTXHDCPMSG("HDCP2_MSG_REPAUTH_SEND_RECVID_LIST\n");
+		break;
+
+	case HDCP2_MSG_REPAUTH_STREAM_READY:
+		size = drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_MPRIME_OFFSET,
+					hdcp_info->hdcp2_info.hdcp_rx.m_prime,
+					HDCP2_REP_MPRIME_SIZE);
+
+		if (size == HDCP2_REP_MPRIME_SIZE)
+			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
+		ret = true;
+		DPTXHDCPMSG("HDCP2_MSG_REPAUTH_STREAM_READY\n");
+		break;
+
+	default:
+		DPTXHDCPMSG("Invalid DPTX_HDCP2_OffSETADDR_ReadMessage !\n");
+		break;
+	}
+
+	return ret;
+}
+
+static bool mdrv_dp_tx_hdcp2_write_msg(struct mtk_hdcp_info *hdcp_info, u8 cmd_ID)
+{
+	bool ret = false;
+
+	switch (cmd_ID) {
+	case HDCP2_MSG_AKE_INIT:
+		tee_hdcp2_soft_rst(hdcp_info);
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_RTX_OFFSET,
+				  hdcp_info->hdcp2_info.hdcp_tx.rtx, HDCP2_RTX_SIZE);
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_TXCAPS_OFFSET,
+				  hdcp_info->hdcp2_info.hdcp_tx.tx_caps, HDCP2_TXCAPS_SIZE);
+
+		ret = true;
+		DPTXHDCPMSG("HDCP2_MSG_AKE_Init !\n");
+		break;
+
+	case HDCP2_MSG_AKE_NO_STORED_KM:
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_EKPUB_KM_OFFSET,
+				  hdcp_info->hdcp2_info.hdcp_tx.ekpub_km, HDCP2_EKPUBKM_SIZE);
+
+		ret = true;
+
+		DPTXHDCPMSG("HDCP2_MSG_AKE_NO_STORED_KM !\n");
+		break;
+
+	case HDCP2_MSG_AKE_STORED_KM:
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_EKH_KM_WR_OFFSET,
+				  hdcp_info->hdcp2_info.stored_pairing_info.ekh_km,
+				  HDCP2_EKHKM_SIZE);
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_M_OFFSET,
+				  hdcp_info->hdcp2_info.stored_pairing_info.m, HDCP2_M_SIZE);
+
+		ret = true;
+
+		DPTXHDCPMSG("DPTX_HDCP2_MSG_AKE_STORED_KM !\n");
+		break;
+
+	case HDCP2_MSG_LC_INIT:
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_RN_OFFSET,
+				  hdcp_info->hdcp2_info.hdcp_tx.rn, HDCP2_RN_SIZE);
+
+		hdcp_info->hdcp2_info.read_l_prime = true;
+		ret = true;
+
+		DPTXHDCPMSG("HDCP2_MSG_LC_INIT !\n");
+		break;
+
+	case HDCP2_MSG_SKE_SEND_EKS:
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_EDKEY_KS_OFFSET,
+				  hdcp_info->hdcp2_info.hdcp_tx.eks, HDCP2_EDKEYKS_SIZE);
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_RIV_OFFSET,
+				  hdcp_info->hdcp2_info.hdcp_tx.riv, HDCP2_RIV_SIZE);
+
+		hdcp_info->hdcp2_info.ks_exchange_done = true;
+
+		ret = true;
+		DPTXHDCPMSG("HDCP2_MSG_SKE_SEND_EKS !\n");
+		break;
+
+	case HDCP2_MSG_REPAUTH_SEND_ACK:
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_V_OFFSET,
+				  hdcp_info->hdcp2_info.hdcp_tx.v_prime, HDCP2_VPRIME_SIZE);
+
+		ret = true;
+		DPTXHDCPMSG("HDCP2_MSG_SEND_ACK !\n");
+		break;
+
+	case HDCP2_MSG_REPAUTH_STREAM_MANAGE:
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_SEQ_NUM_M_OFFSET,
+				  hdcp_info->hdcp2_info.hdcp_tx.seq_num_m, HDCP2_SEQ_NUM_M_SIZE);
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_K_OFFSET,
+				  hdcp_info->hdcp2_info.hdcp_tx.k, HDCP2_K_SIZE);
+		drm_dp_dpcd_write(hdcp_info->aux, DP_HDCP_2_2_REG_STREAM_ID_TYPE_OFFSET,
+				  hdcp_info->hdcp2_info.hdcp_tx.stream_id_type,
+				  HDCP2_STREAMID_TYPE_SIZE);
+
+		mhal_dp_tx_hdcp2_fill_stream_type(hdcp_info,
+						  hdcp_info->hdcp2_info.stream_id_type);
+
+		ret = true;
+		DPTXHDCPMSG("HDCP2_MSG_STREAM_MANAGE !\n");
+		break;
+
+	default:
+		DPTXHDCPMSG("Invalid HDCP2_OffSETADDR_WriteMessage !\n");
+		break;
+	}
+
+	return ret;
+}
+
+static void mdrv_dp_tx_hdcp2_rest_variable(struct mtk_hdcp_info *hdcp_info)
+{
+	hdcp_info->hdcp2_info.read_certrx = false;
+	hdcp_info->hdcp2_info.read_h_prime = false;
+	hdcp_info->hdcp2_info.read_pairing = false;
+	hdcp_info->hdcp2_info.read_l_prime = false;
+	hdcp_info->hdcp2_info.ks_exchange_done = false;
+	hdcp_info->hdcp2_info.read_v_prime = false;
+}
+
+int mdrv_dp_tx_hdcp2_fsm(struct mtk_hdcp_info *hdcp_info)
+{
+	static u32 timeout_value;
+	static u8 pre_main;
+	static u8 pre_sub;
+	static u32 pre_time;
+	int err_code = HDCP_ERR_NONE;
+	bool stored = false;
+	u32 time;
+	int ret = 0;
+	bool tmp = false;
+
+	if (pre_main != hdcp_info->hdcp2_info.hdcp_handler.main_state ||
+	    hdcp_info->hdcp2_info.hdcp_handler.sub_state != pre_sub) {
+		DPTXHDCPMSG("Port(M : S)= (%d, %d)", hdcp_info->hdcp2_info.hdcp_handler.main_state,
+			    hdcp_info->hdcp2_info.hdcp_handler.sub_state);
+		pre_main = hdcp_info->hdcp2_info.hdcp_handler.main_state;
+		pre_sub = hdcp_info->hdcp2_info.hdcp_handler.sub_state;
+	}
+
+	switch (hdcp_info->hdcp2_info.hdcp_handler.main_state) {
+	case HDCP2_MS_H1P1:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_ZERO:
+			break;
+		case HDCP2_MSG_AUTH_FAIL:
+			pr_err("HDCP2.x Authentication Fail\n");
+			mdrv_dp_tx_hdcp2_enable_auth(hdcp_info, false);
+			hdcp_info->auth_status = AUTH_FAIL;
+			break;
+		}
+		break;
+	case HDCP2_MS_A0F0:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_ZERO:
+			if (hdcp_info->hdcp2_info.enable) {
+				mdrv_dp_tx_hdcp2_init(hdcp_info);
+				mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1,
+							   HDCP2_MSG_ZERO);
+				DPTXHDCPMSG("Sink Support Hdcp2x!\n");
+			} else {
+				mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_H1P1,
+							   HDCP2_MSG_AUTH_FAIL);
+				DPTXHDCPMSG("Sink Doesn't Support Hdcp2x!\n");
+			}
+			break;
+		}
+		break;
+
+	case HDCP2_MS_A1F1:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_ZERO:
+			if (hdcp_info->hdcp2_info.retry_count
+				< HDCP2_TX_RETRY_CNT) {
+				hdcp_info->hdcp2_info.retry_count++;
+				mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1,
+							   HDCP2_MSG_AKE_INIT);
+			} else {
+				mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_H1P1,
+							   HDCP2_MSG_AUTH_FAIL);
+				pr_err("Try Max Count\n");
+			}
+			break;
+
+		case HDCP2_MSG_AKE_INIT:
+			tmp = mdrv_dp_tx_hdcp2_write_msg(hdcp_info, HDCP2_MSG_AKE_INIT);
+			if (!tmp) {
+				err_code = HDCP_ERR_SEND_MSG_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+			mdrv_dp_tx_hdcp2_rest_variable(hdcp_info);
+			hdcp_info->hdcp2_info.read_certrx = true;
+
+			hdcp_info->hdcp2_info.hdcp_handler.send_ake_init = true;
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1,
+						   HDCP2_MSG_AKE_SEND_CERT);
+			pre_time = get_system_time();
+			break;
+
+		case HDCP2_MSG_AKE_SEND_CERT:
+			time = get_time_diff(pre_time);
+			if (time < HDCP2_AKESENDCERT_WDT) {
+				msleep(20);
+				break;
+			}
+			if (hdcp_info->hdcp2_info.read_certrx)
+				mdrv_dp_tx_hdcp2_read_msg(hdcp_info, HDCP2_MSG_AKE_SEND_CERT);
+
+			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg)
+				break;
+
+			ret = tee_ake_certificate(hdcp_info, hdcp_info->hdcp2_info.hdcp_rx.cert,
+						  &stored,
+				hdcp_info->hdcp2_info.stored_pairing_info.m,
+				hdcp_info->hdcp2_info.stored_pairing_info.ekh_km);
+
+			if (ret != RET_COMPARE_PASS) {
+				err_code = HDCP_ERR_PROCESS_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			hdcp_info->hdcp2_info.hdcp_handler.stored_km = stored;
+			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1,
+						   hdcp_info->hdcp2_info.hdcp_handler.stored_km ?
+					HDCP2_MSG_AKE_STORED_KM :
+					HDCP2_MSG_AKE_NO_STORED_KM);
+			break;
+
+		case HDCP2_MSG_AKE_NO_STORED_KM:
+			DPTXHDCPMSG("4. Get Km, derive Ekpub(km)\n");
+
+			tee_enc_rsaes_oaep(hdcp_info, hdcp_info->hdcp2_info.hdcp_tx.ekpub_km);
+			/* Prepare ekpub_km to send */
+			tmp = mdrv_dp_tx_hdcp2_write_msg(hdcp_info,
+							 HDCP2_MSG_AKE_NO_STORED_KM);
+			if (!tmp) {
+				err_code = HDCP_ERR_SEND_MSG_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1,
+						   HDCP2_MSG_AKE_SEND_H_PRIME);
+			timeout_value = HDCP2_AKESENDHPRIME_NO_STORED_WDT;
+			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
+			pre_time = get_system_time();
+			break;
+		case HDCP2_MSG_AKE_STORED_KM:
+			/* Prepare ekh_km & M to send */
+			tmp = mdrv_dp_tx_hdcp2_write_msg(hdcp_info, HDCP2_MSG_AKE_STORED_KM);
+			if (!tmp) {
+				err_code = HDCP_ERR_SEND_MSG_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			err_code = HDCP_ERR_NONE;
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1,
+						   HDCP2_MSG_AKE_SEND_H_PRIME);
+			timeout_value = HDCP2_AKESENDHPRIME_STORED_WDT;
+			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
+			pre_time = get_system_time();
+			break;
+
+		case HDCP2_MSG_AKE_SEND_H_PRIME:
+			if (hdcp_info->hdcp2_info.read_h_prime) {
+				mdrv_dp_tx_hdcp2_read_msg(hdcp_info,
+							  HDCP2_MSG_AKE_SEND_H_PRIME);
+				}
+			time = get_time_diff(pre_time);
+			if (time > timeout_value) {
+				err_code = HDCP_ERR_RESPONSE_TIMEROUT;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg)
+				break;
+
+			ret = tee_ake_h_prime(hdcp_info, hdcp_info->hdcp2_info.hdcp_tx.rtx,
+					      hdcp_info->hdcp2_info.hdcp_rx.rrx,
+				hdcp_info->hdcp2_info.hdcp_rx.rx_caps,
+				hdcp_info->hdcp2_info.hdcp_tx.tx_caps,
+				hdcp_info->hdcp2_info.hdcp_rx.h_prime,
+				HDCP2_HPRIME_SIZE);
+			if (ret != RET_COMPARE_PASS) {
+				if (hdcp_info->hdcp2_info.hdcp_handler.stored_km)
+					tee_clear_paring(hdcp_info);
+				err_code = HDCP_ERR_PROCESS_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			if (hdcp_info->hdcp2_info.hdcp_handler.stored_km)
+				mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A2F2,
+							   HDCP2_MSG_LC_INIT);
+			else
+				mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1,
+							   HDCP2_MSG_AKE_SEND_PAIRING_INFO);
+
+			pre_time = get_system_time();
+			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
+			break;
+
+		case HDCP2_MSG_AKE_SEND_PAIRING_INFO:
+			if (hdcp_info->hdcp2_info.read_pairing)
+				mdrv_dp_tx_hdcp2_read_msg(hdcp_info,
+							  HDCP2_MSG_AKE_SEND_PAIRING_INFO);
+
+			/* Ekh_Km must be available less than 200ms, Give mode time for some Rx */
+			time = get_time_diff(pre_time);
+			if (time >	HDCP2_AKESENDPAIRINGINFO_WDT * 2) {
+				err_code = HDCP_ERR_RESPONSE_TIMEROUT;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg)
+				break;
+
+			/* Store m, km, Ekh(km) */
+			tee_ake_paring(hdcp_info, hdcp_info->hdcp2_info.hdcp_rx.ekh_km);
+
+			hdcp_info->hdcp2_info.hdcp_handler.send_pair = true;
+			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A2F2, HDCP2_MSG_LC_INIT);
+			pre_time = get_system_time();
+			break;
+		}
+		break;
+
+	case HDCP2_MS_A2F2:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_LC_INIT:
+			/* prepare Rn to send */
+			tmp = mdrv_dp_tx_hdcp2_write_msg(hdcp_info, HDCP2_MSG_LC_INIT);
+			if (!tmp) {
+				err_code = HDCP_ERR_SEND_MSG_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+			hdcp_info->hdcp2_info.hdcp_handler.send_lc_init = true;
+
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A2F2,
+						   HDCP2_MSG_LC_SEND_L_PRIME);
+			pre_time = get_system_time();
+			break;
+
+		case HDCP2_MSG_LC_SEND_L_PRIME:
+			time = get_time_diff(pre_time);
+			if (time < HDCP2_LCSENDLPRIME_WDT)
+				break;
+
+			if (hdcp_info->hdcp2_info.read_l_prime)
+				mdrv_dp_tx_hdcp2_read_msg(hdcp_info,
+							  HDCP2_MSG_LC_SEND_L_PRIME);
+
+			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg)
+				break;
+
+			ret = tee_lc_l_prime(hdcp_info, hdcp_info->hdcp2_info.hdcp_tx.rn,
+					     hdcp_info->hdcp2_info.hdcp_rx.l_prime,
+				HDCP2_LPRIME_SIZE);
+			if (ret != RET_COMPARE_PASS) {
+				err_code = HDCP_ERR_PROCESS_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			DPTXHDCPMSG("L' is PASS!!\n");
+			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A3F3, HDCP2_MSG_ZERO);
+			pre_time = get_system_time();
+			break;
+		}
+		break;
+
+	case HDCP2_MS_A3F3:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_ZERO:
+			tee_ske_enc_ks(hdcp_info, hdcp_info->hdcp2_info.hdcp_tx.riv,
+				       hdcp_info->hdcp2_info.hdcp_tx.eks);
+
+			tmp = mdrv_dp_tx_hdcp2_write_msg(hdcp_info, HDCP2_MSG_SKE_SEND_EKS);
+			if (!tmp) {
+				err_code = HDCP_ERR_SEND_MSG_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A3F3,
+						   HDCP2_MSG_SKE_SEND_EKS);
+			pre_time = get_system_time();
+			break;
+
+		case HDCP2_MSG_SKE_SEND_EKS:
+			time = get_time_diff(pre_time);
+			if (time >= HDCP2_ENC_EN_TIMER) {
+				mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A4F4,
+							   HDCP2_MSG_ZERO);
+			}
+			break;
+		}
+		break;
+
+	case HDCP2_MS_A4F4:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_ZERO:
+			if (!hdcp_info->hdcp2_info.repeater) {
+				mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A5F5,
+							   HDCP2_MSG_AUTH_DONE);
+			} else {
+				mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A6F6,
+							   HDCP2_MSG_REPAUTH_SEND_RECVID_LIST);
+				hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
+				pre_time = get_system_time();
+			}
+			break;
+		}
+		break;
+
+	case HDCP2_MS_A5F5:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_ZERO:
+			break;
+		case HDCP2_MSG_AUTH_DONE:
+			DPTXHDCPMSG("HDCP2.x Authentication done.\n");
+			hdcp_info->auth_status = AUTH_PASS;
+			hdcp_info->hdcp2_info.retry_count = 0;
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A5F5, HDCP2_MSG_ZERO);
+			mdrv_dp_tx_hdcp2_enable_auth(hdcp_info, true);
+			break;
+		}
+		break;
+	case HDCP2_MS_A6F6:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_REPAUTH_SEND_RECVID_LIST:
+			if (hdcp_info->hdcp2_info.read_v_prime)
+				mdrv_dp_tx_hdcp2_read_msg(hdcp_info,
+							  HDCP2_MSG_REPAUTH_SEND_RECVID_LIST);
+
+			time = get_time_diff(pre_time);
+			if (time > HDCP2_REPAUTHSENDRECVID_WDT) {
+				err_code = HDCP_ERR_RESPONSE_TIMEROUT;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg)
+				break;
+
+			pre_time = get_system_time();
+			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A7F7,
+						   HDCP2_MSG_REPAUTH_VERIFY_RECVID_LIST);
+			break;
+		}
+		break;
+
+	case HDCP2_MS_A7F7:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_REPAUTH_VERIFY_RECVID_LIST:
+			if ((hdcp_info->hdcp2_info.hdcp_rx.rx_info[1] & (BIT(2) | BIT(3))) != 0) {
+				pr_err("DEVS_EXCEEDED or CASCADE_EXCEDDED!\n");
+				err_code = HDCP_ERR_PROCESS_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			/* check seqNumV here */
+			tmp = mdrv_dp_tx_hdcp2_check_seq_num_v(hdcp_info);
+			if (!tmp) {
+				err_code = HDCP_ERR_PROCESS_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			tmp = mdrv_dp_tx_hdcp2_recv_rep_auth_send_recv_id_list(hdcp_info);
+			if (!tmp) {
+				err_code = HDCP_ERR_PROCESS_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A8F8,
+						   HDCP2_MSG_REPAUTH_SEND_ACK);
+			break;
+		}
+		break;
+
+	case HDCP2_MS_A8F8:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_REPAUTH_SEND_ACK:
+			tmp = mdrv_dp_tx_hdcp2_write_msg(hdcp_info,
+							 HDCP2_MSG_REPAUTH_SEND_ACK);
+			if (!tmp) {
+				err_code = HDCP_ERR_SEND_MSG_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			time = get_time_diff(pre_time);
+			if (time > HDCP2_REP_SEND_ACK) {
+				err_code = HDCP_ERR_RESPONSE_TIMEROUT;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A9F9,
+						   HDCP2_MSG_REPAUTH_STREAM_MANAGE);
+			hdcp_info->hdcp2_info.hdcp_handler.retry_cnt = 0;
+			break;
+		}
+		break;
+
+	case HDCP2_MS_A9F9:
+		switch (hdcp_info->hdcp2_info.hdcp_handler.sub_state) {
+		case HDCP2_MSG_REPAUTH_STREAM_MANAGE:
+			tmp = mdrv_dp_tx_hdcp2_process_rep_auth_stream_manage(hdcp_info);
+			if (!tmp) {
+				err_code = HDCP_ERR_PROCESS_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			tmp = mdrv_dp_tx_hdcp2_write_msg(hdcp_info,
+							 HDCP2_MSG_REPAUTH_STREAM_MANAGE);
+			if (!tmp) {
+				err_code = HDCP_ERR_SEND_MSG_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			pre_time = get_system_time();
+			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A9F9,
+						   HDCP2_MSG_REPAUTH_STREAM_READY);
+			break;
+		case HDCP2_MSG_REPAUTH_STREAM_READY:
+			time = get_time_diff(pre_time);
+			if (time > HDCP2_REPAUTHSTREAMRDY_WDT / 2)
+				mdrv_dp_tx_hdcp2_read_msg(hdcp_info,
+							  HDCP2_MSG_REPAUTH_STREAM_READY);
+			else
+				break;
+
+			time = get_time_diff(pre_time);
+			if (time > HDCP2_REPAUTHSTREAMRDY_WDT) {
+				err_code = HDCP_ERR_RESPONSE_TIMEROUT;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			} else if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg) {
+				if (hdcp_info->hdcp2_info.hdcp_handler.retry_cnt
+					>= HDCP2_STREAM_MANAGE_RETRY_CNT) {
+					err_code = HDCP_ERR_RESPONSE_TIMEROUT;
+					mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+					break;
+				}
+
+				hdcp_info->hdcp2_info.hdcp_handler.retry_cnt++;
+
+				mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A9F9,
+							   HDCP2_MSG_REPAUTH_STREAM_READY);
+				break;
+			}
+
+			tmp = mdrv_dp_tx_hdcp2_recv_rep_auth_stream_ready(hdcp_info);
+			if (!tmp) {
+				err_code = HDCP_ERR_PROCESS_FAIL;
+				mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+				break;
+			}
+
+			mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A5F5,
+						   HDCP2_MSG_AUTH_DONE);
+			break;
+		}
+		break;
+	default:
+		err_code = HDCP_ERR_UNKNOWN_STATE;
+		mdrv_dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
+		break;
+	}
+
+	return err_code;
+}
+
+void mdrv_dp_tx_hdcp2_set_start_auth(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	hdcp_info->hdcp2_info.enable = enable;
+
+	if (enable) {
+		hdcp_info->auth_status = AUTH_INIT;
+		mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A0F0, HDCP2_MSG_ZERO);
+	} else {
+		hdcp_info->auth_status = AUTH_ZERO;
+		mdrv_dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_H1P1, HDCP2_MSG_ZERO);
+		mdrv_dp_tx_hdcp2_enable_auth(hdcp_info, false);
+	}
+
+	hdcp_info->hdcp2_info.retry_count = 0;
+}
+
+bool mdrv_dp_tx_hdcp2_support(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 temp_buffer[3];
+	int ret;
+
+	drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_RX_CAPS_OFFSET, temp_buffer, 0x3);
+
+	if ((temp_buffer[2] & BIT(1)) && temp_buffer[0] == 0x02) {
+		hdcp_info->hdcp2_info.enable = true;
+		hdcp_info->hdcp2_info.repeater = temp_buffer[2] & BIT(0);
+	} else {
+		hdcp_info->hdcp2_info.enable = false;
+	}
+
+	DPTXHDCPMSG("HDCP.2x CAPABLE: %d, Reapeater: %d\n",
+		    hdcp_info->hdcp2_info.enable,
+		hdcp_info->hdcp2_info.repeater);
+
+	if (!hdcp_info->hdcp2_info.enable)
+		return false;
+
+	ret = tee_add_device(hdcp_info, HDCP_VERSION_2X);
+	if (ret != RET_SUCCESS) {
+		pr_err("HDCP TA has some error\n");
+		hdcp_info->hdcp2_info.enable = false;
+	}
+
+	return hdcp_info->hdcp2_info.enable;
+}
+
+bool mdrv_dp_tx_hdcp2_irq(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 rx_status = 0;
+
+	drm_dp_dpcd_read(hdcp_info->aux, DP_HDCP_2_2_REG_RXSTATUS_OFFSET, &rx_status,
+			 HDCP2_RXSTATUS_SIZE);
+
+	if (rx_status & BIT(0)) {
+		DPTXHDCPMSG("READY_BIT0 Ready!\n");
+		hdcp_info->hdcp2_info.read_v_prime = true;
+	}
+
+	if (rx_status & BIT(1)) {
+		DPTXHDCPMSG("H'_AVAILABLE Ready!\n");
+		hdcp_info->hdcp2_info.read_h_prime = true;
+	}
+
+	if (rx_status & BIT(2)) {
+		DPTXHDCPMSG("PAIRING_AVAILABLE Ready!\n");
+		hdcp_info->hdcp2_info.read_pairing = true;
+	}
+
+	if (rx_status & BIT(4) || rx_status & BIT(3)) {
+		DPTXHDCPMSG("Re-Auth HDCP2X!\n");
+		mdrv_dp_tx_hdcp2_set_start_auth(hdcp_info, true);
+		mtk_dp_re_authentication(hdcp_info);
+	}
+
+	return true;
+}
+
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h
new file mode 100644
index 000000000000..f4f4b3dc7c9b
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2023 MediaTek Inc.
+ */
+
+#ifndef _MTK_dp_HDCP2_H_
+#define _MTK_dp_HDCP2_H_
+
+#include "mtk_dp_hdcp.h"
+
+/* Timeout relative */
+#define HDCP2_AKESENDCERT_WDT               100      // 100ms
+#define HDCP2_AKESENDHPRIME_NO_STORED_WDT   1000     // 1sec
+#define HDCP2_AKESENDHPRIME_STORED_WDT      200      // 200ms
+#define HDCP2_AKESENDPAIRINGINFO_WDT        200      // 200ms
+#define HDCP2_LCSENDLPRIME_WDT              7        // 7ms
+#define HDCP2_ENC_EN_TIMER                  200      // 200 ms
+#define HDCP2_REPAUTHSENDRECVID_WDT         3000     // 3 sec
+#define HDCP2_REP_SEND_ACK                  2000     // 2 Sec
+#define HDCP2_REPAUTHSTREAMRDY_WDT          100      // 100 ms
+
+/* Patch for QD980 LLCTS */
+#define HDCP2_TX_RETRY_CNT      3
+#define HDCP2_TX_LC_RETRY_CNT   1023
+#define HDCP2_STREAM_MANAGE_RETRY_CNT   8
+
+enum ENUM_HDCP2TX_MAIN_STATE {
+	HDCP2_MS_H1P1 = 0,
+	HDCP2_MS_A0F0 = 1,
+	HDCP2_MS_A1F1 = 2,
+	HDCP2_MS_A2F2 = 3,
+	HDCP2_MS_A3F3 = 4,
+	HDCP2_MS_A4F4 = 5,
+	HDCP2_MS_A5F5 = 6,
+	HDCP2_MS_A6F6 = 7,
+	HDCP2_MS_A7F7 = 8,
+	HDCP2_MS_A8F8 = 9,
+	HDCP2_MS_A9F9 = 10
+};
+
+enum ENUM_HDCP2_MSG_LIST {
+	HDCP2_MSG_ZERO                            = 0,
+	HDCP2_MSG_AKE_INIT                        = 1,
+	HDCP2_MSG_AKE_SEND_CERT                   = 2,
+	HDCP2_MSG_AKE_NO_STORED_KM                = 3,
+	HDCP2_MSG_AKE_STORED_KM                   = 4,
+	HDCP2_MSG_AKE_SEND_H_PRIME                = 5,
+	HDCP2_MSG_AKE_SEND_PAIRING_INFO           = 6,
+	HDCP2_MSG_LC_INIT                         = 7,
+	HDCP2_MSG_LC_SEND_L_PRIME                 = 8,
+	HDCP2_MSG_SKE_SEND_EKS                    = 9,
+	HDCP2_MSG_REPAUTH_SEND_RECVID_LIST        = 10,
+	HDCP2_MSG_REPAUTH_VERIFY_RECVID_LIST      = 11,
+	HDCP2_MSG_REPAUTH_SEND_ACK                = 12,
+	HDCP2_MSG_REPAUTH_STREAM_MANAGE           = 13,
+	HDCP2_MSG_REPAUTH_STREAM_READY            = 14,
+	HDCP2_MSG_AUTH_FAIL	                  = 15,
+	HDCP2_MSG_AUTH_DONE	                  = 16,
+};
+
+enum ENUM_HDCP_ERR_CODE {
+	HDCP_ERR_NONE = 0,
+	HDCP_ERR_UNKNOWN_STATE,
+	HDCP_ERR_SEND_MSG_FAIL,
+	HDCP_ERR_RESPONSE_TIMEROUT,
+	HDCP_ERR_PROCESS_FAIL
+};
+
+int mdrv_dp_tx_hdcp2_fsm(struct mtk_hdcp_info *hdcp_info);
+void mdrv_dp_tx_hdcp2_set_start_auth(struct mtk_hdcp_info *hdcp_info, bool enable);
+bool mdrv_dp_tx_hdcp2_support(struct mtk_hdcp_info *hdcp_info);
+bool mdrv_dp_tx_hdcp2_irq(struct mtk_hdcp_info *hdcp_info);
+
+#endif /* _MTK_dp_HDCP2_H_ */
+
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 709b79480693..a1e4531c0e59 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2019-2022 MediaTek Inc.
+ * Copyright (c) 2019-2023 MediaTek Inc.
  * Copyright (c) 2022 BayLibre
  */
 #ifndef _MTK_DP_REG_H_
@@ -275,8 +275,12 @@
 #define MTK_DP_TRANS_P0_3430				0x3430
 #define HPD_INT_THD_ECO_DP_TRANS_P0_MASK			GENMASK(1, 0)
 #define HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT		BIT(1)
+#define MTK_DP_TRANS_P0_3480                0x3480
+#define REQ_BLOCK_CIPHER_AUTH                           BIT(12)
+#define KM_GENERATED                                    BIT(4)
 #define MTK_DP_TRANS_P0_34A4				0x34a4
 #define LANE_NUM_DP_TRANS_P0_MASK				GENMASK(3, 2)
+#define MTK_DP_TRANS_P0_34D0                0x34D0
 #define MTK_DP_TRANS_P0_3540				0x3540
 #define FEC_EN_DP_TRANS_P0_MASK					BIT(0)
 #define FEC_CLOCK_EN_MODE_DP_TRANS_P0				BIT(3)
-- 
2.40.1

