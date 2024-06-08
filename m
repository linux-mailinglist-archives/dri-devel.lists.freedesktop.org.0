Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D08E901165
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 14:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971D310E1A9;
	Sat,  8 Jun 2024 12:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="cWi85E2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5E810E0AC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2024 12:02:33 +0000 (UTC)
X-UUID: f9c28e88258e11efa54bbfbb386b949c-20240608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nXnjaljrBy0xyFNzWlj5NQ7P7C6kO3RByuaxIWKM88o=; 
 b=cWi85E2juXn3uHPX+gkfPo0qgMViGZcqV1fpQgBRQ3xAPw4+lJ3+RWOhm8ssqxUuq0AaiO8vWsacaqiYdnGkIoOzzzNO243kxUW1Y7Gje6wz/DkiUa6TeVxeA+EATv8FfkONa8++eW0kzLpt0JGskposM+C1XaMRO6p7RfZ3FQ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:29bc0a66-b003-4d23-8098-0516b92a76cc, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:287a5a44-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f9c28e88258e11efa54bbfbb386b949c-20240608
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <mac.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 491041951; Sat, 08 Jun 2024 20:02:27 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 8 Jun 2024 20:02:23 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 8 Jun 2024 20:02:23 +0800
From: mac.shen <mac.shen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <mac.shen@mediatek.com>, <shuijing.li@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/3] Subject: [PATCH] drm/mediatek/dp: Add tee client
 application for HDCP feature
Date: Sat, 8 Jun 2024 20:01:04 +0800
Message-ID: <20240608120219.21817-2-mac.shen@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240608120219.21817-1-mac.shen@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.035000-8.000000
X-TMASE-MatchedRID: 51OwghI2yt8wXOfjPox36hIRh9wkXSlFWjRJreaOWv5o5YsPsbyLXXXd
 7xOm1pHBYANd3JpXt1lV5DQZ6ZiszyZM0GOuX4IBH5YQyOg71ZbDx2NobQWtm+9Jtzyqge7RaUX
 s6FguVy2cPcDHCp4L+uSWVqW5qzmOl722oUhn92Dd+fuf9kcapjuvYa1v2IFhDpCUEeEFm7AnCd
 iFPpzToRtNa8R++BXOygfKxbMvCF+39BLh6Bkc7spQKjU7fBXVH5EWj6tpjQJ2Cr1D6VVk8hd25
 1g4pLw6X9XZnALDiUYPZx5l8y6PlhiQc5OixN2zYwaJXrf2IXRT4DtiSkMnWEJqedX9vt/ZXh71
 gH1P5QMwSqfCFy7Nv8r5AVdin4a1Exh28GN3X3AmEURBmKrZlIfsPVs/8Vw6lBd6Z8DODY3JTte
 BOzpbgtbjbddbaGl7wEBYRaV0KQ2pl11JQiuwkk1rhQ5+QlI0BGvINcfHqhf7efdnqtsaExETud
 PHaLpdff1/prWVq6GIYMBzxnoy6NjTzYyhzXBGjtK7dC6UBnk0AKed0u9fBx9tGS4ZwmJYCg6cu
 qIlJ8clyceLNLyfP7q1jNQn9oGkeAx+Vznu+gR99e0rIz5z663iVpZ0luwMhWdOaWKi6CmUHgk1
 4u8KyeLzNWBegCW2wgn7iDBesS3CttcwYNipX6EgUQ6c3OJwnqQqPfcojctSrkbBwCdqetxZ0gf
 +iEc9kBXHqG3UFVlWXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.035000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FD621E83C4E5B37FB2722CC9F6DC35C24A9FA6B8B7A7CFBF47FC350284F023322000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add tee client application which will be used for
HDCP 1.x and 2.x authentication in DisplayPort.

Changes in v3:
- remove useless define
- refine the return value
- remove the define which control the log output
- remove the struct hdcp2_handler for HDCP 2.X
- refine the struct for the HDCP information
per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek
/patch/20240205055055.25340-2-mac.shen@mediatek.com/

Signed-off-by: mac.shen <mac.shen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile      |   5 +-
 drivers/gpu/drm/mediatek/tci.h         | 143 ++++++
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c | 595 +++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h | 133 ++++++
 4 files changed, 875 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/tci.h
 create mode 100644 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c
 create mode 100644 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 32a2ed6c0cfe..f27ddfbd2e12 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -27,4 +27,7 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
 
-obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
+mtk-dp-objs := tlc_dp_hdcp.o \
+		  mtk_dp.o
+
+obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk-dp.o
diff --git a/drivers/gpu/drm/mediatek/tci.h b/drivers/gpu/drm/mediatek/tci.h
new file mode 100644
index 000000000000..48710ce5d391
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/tci.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2024 MediaTek Inc.
+ */
+
+#ifndef _TCI_H_
+#define _TCI_H_
+
+#include <drm/display/drm_hdcp.h>
+
+#define CMD_DEVICE_ADDED        1
+#define CMD_DEVICE_REMOVE       2
+#define CMD_WRITE_VAL           3
+#define CMD_DEVICE_CLEAN        4
+#define CMD_ENABLE_ENCRYPT      5
+
+/* V1.x */
+#define CMD_CALCULATE_LM        11
+#define CMD_COMPARE_R0          12
+#define CMD_COMPARE_V1          13
+#define CMD_GET_AKSV            14
+
+/* V2.x */
+#define CMD_AKE_CERTIFICATE     20
+#define CMD_ENC_KM              21
+#define CMD_AKE_H_PRIME         22
+#define CMD_AKE_PARING          23
+#define CMD_LC_L_PRIME          24
+#define CMD_SKE_CAL_EKS         26
+#define CMD_COMPARE_V2          27
+#define CMD_COMPARE_M           28
+
+#define TYPE_HDCP_PARAM_AN 10
+#define TYPE_HDCP_PARAM_RST_1 11
+#define TYPE_HDCP_PARAM_RST_2 12
+#define TYPE_HDCP_ENABLE_ENCRYPT 13
+#define TYPE_HDCP_DISABLE_ENCRYPT 14
+
+/* reserved:2 */
+#define HDCP2_CERTRX_LEN (HDCP_2_2_RECEIVER_ID_LEN + HDCP_2_2_K_PUB_RX_LEN + \
+	2 + HDCP_2_2_DCP_LLC_SIG_LEN)
+/* version:1 */
+#define HDCP_2_2_TXCAPS_LEN (HDCP_2_2_TXCAP_MASK_LEN + 1)
+#define PARAM_LEN 1024
+
+#define TCI_LENGTH sizeof(struct tci_t)
+
+struct cmd_hdcp_init_for_verion_t {
+	u32 version;
+	bool need_load_key;
+};
+
+struct cmd_hdcp_write_val_t {
+	u8 type;
+	u8 len;
+	u8 val[DRM_HDCP_AN_LEN];
+};
+
+struct cmd_hdcp_calculate_lm_t {
+	u8 bksv[DRM_HDCP_KSV_LEN];
+};
+
+struct cmd_hdcp_get_aksv_t {
+	u8 aksv[DRM_HDCP_KSV_LEN];
+};
+
+struct cmd_hdcp_ake_certificate_t {
+	u8 certification[HDCP2_CERTRX_LEN];
+	bool stored;
+	u8 m[HDCP_2_2_E_KH_KM_M_LEN - HDCP_2_2_E_KH_KM_LEN];
+	u8 ekm[HDCP_2_2_E_KH_KM_LEN];
+};
+
+struct cmd_hdcp_ake_paring_t {
+	u8 ekm[HDCP_2_2_E_KH_KM_LEN];
+};
+
+struct cmd_hdcp_enc_km_t {
+	u8 enc_km[HDCP_2_2_E_KPUB_KM_LEN];
+};
+
+struct cmd_hdcp_ake_h_prime_t {
+	u8 rtx[HDCP_2_2_RTX_LEN];
+	u8 rrx[HDCP_2_2_RRX_LEN];
+	u8 rx_caps[HDCP_2_2_RXCAPS_LEN];
+	u8 tx_caps[HDCP_2_2_TXCAPS_LEN];
+	u32 rx_h_len;
+	u8 rx_h[HDCP_2_2_H_PRIME_LEN];
+};
+
+struct cmd_hdcp_lc_l_prime_t {
+	u8 rn[HDCP_2_2_RN_LEN];
+	u32 rx_l_len;
+	u8 rx_l[HDCP_2_2_L_PRIME_LEN];
+};
+
+struct cmd_hdcp_ske_eks_t {
+	u8 riv[HDCP_2_2_RIV_LEN];
+	u32 eks_len;
+	u32 eks;
+};
+
+struct cmd_hdcp_compare_t {
+	u32 rx_val_len;
+	u8 rx_val[HDCP_2_2_MPRIME_LEN];
+	u32 param_len;
+	u8 param[PARAM_LEN];
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
diff --git a/drivers/gpu/drm/mediatek/tlc_dp_hdcp.c b/drivers/gpu/drm/mediatek/tlc_dp_hdcp.c
new file mode 100644
index 000000000000..8ae0548ae022
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/tlc_dp_hdcp.c
@@ -0,0 +1,595 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2024 MediaTek Inc.
+ */
+
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include "tlc_dp_hdcp.h"
+
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
+/* Send dp commands through the TEE shared memory */
+static int dp_tee_op_send(struct dp_tee_private *dp_tee_priv, size_t len, u32 cmd_id)
+{
+	struct tee_ioctl_invoke_arg transceive_args;
+	struct tee_shm *shm = dp_tee_priv->shm;
+	struct tee_param command_params[4];
+	u8 *temp_buf;
+	int rc;
+
+	if (len > MAX_COMMAND_SIZE) {
+		pr_err("[TLC_HDCP] Len %zd exceeds MAX_COMMAND_SIZE supported by dp TA\n", len);
+		return -EINVAL;
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
+	command_params[1] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
+		.u.memref = {
+			.shm = shm,
+			.size = MAX_RESPONSE_SIZE,
+			.shm_offs = MAX_COMMAND_SIZE,
+		},
+	};
+
+	rc = tee_client_invoke_func(dp_tee_priv->ctx, &transceive_args, command_params);
+	if (rc < 0 || transceive_args.ret != 0) {
+		pr_err("[TLC_HDCP] rc:%d, invoke error:0x%x\n", rc, transceive_args.ret);
+		return -EBUSY;
+	}
+
+	temp_buf = tee_shm_get_va(shm, command_params[1].u.memref.shm_offs);
+	if (IS_ERR(temp_buf)) {
+		pr_err("[TLC_HDCP] tee_shm_get_va failed for receive\n");
+		return -ENOMEM;
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
+ *
+ * Note that currently this driver only supports GP Compliant OPTEE
+ * based dp TA.
+ */
+static int dp_tee_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return ver->impl_id == TEE_IMPL_ID_OPTEE &&
+			ver->gen_caps & TEE_GEN_CAP_GP;
+}
+
+int tee_add_device(struct mtk_hdcp_info *hdcp_info, u32 version)
+{
+	struct tee_ioctl_open_session_arg sess_arg;
+	struct dp_tee_private *dp_tee_priv;
+	struct tci_t *tci;
+	int rc;
+
+	if (hdcp_info->g_init)
+		tee_remove_device(hdcp_info);
+
+	dp_tee_priv = kzalloc(sizeof(*dp_tee_priv), GFP_KERNEL);
+	if (!dp_tee_priv)
+		return -ENOMEM;
+
+	hdcp_info->g_dp_tee_priv = dp_tee_priv;
+
+	/* Open context with TEE driver */
+	dp_tee_priv->ctx = tee_client_open_context(NULL, dp_tee_match, NULL, NULL);
+	if (IS_ERR(dp_tee_priv->ctx)) {
+		pr_err("[TLC_HDCP] tee_client_open_context failed\n");
+		rc = PTR_ERR(dp_tee_priv->ctx);
+		goto free_priv;
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
+		pr_err("[TLC_HDCP] tee_client_open_session failed, err:%x\n", sess_arg.ret);
+		rc = -EINVAL;
+		goto out_tee_session;
+	}
+	dp_tee_priv->session = sess_arg.session;
+
+	/* Allocate dynamic shared memory with dp TA */
+	dp_tee_priv->shm = tee_shm_alloc_kernel_buf(dp_tee_priv->ctx, MAX_COMMAND_SIZE
+	 + MAX_RESPONSE_SIZE);
+	if (IS_ERR(dp_tee_priv->shm)) {
+		pr_err("[TLC_HDCP] tee_shm_alloc_kernel_buf failed\n");
+		rc = -ENOMEM;
+		goto out_shm_alloc;
+	}
+
+	/* Copy parameter for add new device */
+	tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_DEVICE_ADDED;
+	tci->cmd_body.cmd_hdcp_init_for_verion.version = version;
+	tci->cmd_body.cmd_hdcp_init_for_verion.need_load_key = true;
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_DEVICE_ADDED);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error:%x\n", rc);
+		tee_remove_device(hdcp_info);
+		return rc;
+	}
+
+	hdcp_info->g_init = true;
+
+	return 0;
+
+out_shm_alloc:
+	tee_client_close_session(dp_tee_priv->ctx, dp_tee_priv->session);
+out_tee_session:
+	tee_client_close_context(dp_tee_priv->ctx);
+free_priv:
+	kfree(dp_tee_priv);
+
+	return rc;
+}
+
+void tee_remove_device(struct mtk_hdcp_info *hdcp_info)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	if (!hdcp_info->g_init)
+		return;
+
+	hdcp_info->g_init = false;
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_DEVICE_REMOVE;
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_DEVICE_REMOVE);
+	if (rc)
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
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
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	/* Copy parameters */
+	memset(tci, 0, TCI_LENGTH);
+	tci->command_id = CMD_DEVICE_CLEAN;
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_DEVICE_CLEAN);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+/* Write An to HW */
+int tee_hdcp1x_set_tx_an(struct mtk_hdcp_info *hdcp_info, u8 *an_code)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_WRITE_VAL;
+	tci->cmd_body.cmd_hdcp_write_val.len = DRM_HDCP_AN_LEN;
+	tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_PARAM_AN;
+	memcpy(tci->cmd_body.cmd_hdcp_write_val.val, an_code, DRM_HDCP_AN_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_WRITE_VAL);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+int tee_hdcp_enable_encrypt(struct mtk_hdcp_info *hdcp_info, bool enable, u8 version)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_ENABLE_ENCRYPT;
+	tci->cmd_body.cmd_hdcp_write_val.type = enable ? TYPE_HDCP_ENABLE_ENCRYPT :
+		TYPE_HDCP_DISABLE_ENCRYPT;
+
+	/* Set HDCP version supportted by device */
+	tci->cmd_body.cmd_hdcp_write_val.len = 1;
+	tci->cmd_body.cmd_hdcp_write_val.val[0] = version;
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_ENABLE_ENCRYPT);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+int tee_hdcp1x_soft_rst(struct mtk_hdcp_info *hdcp_info)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_WRITE_VAL;
+	tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_PARAM_RST_1;
+	/* No need input. Set default value 0 for check */
+	tci->cmd_body.cmd_hdcp_write_val.len = DEFAULT_WRITE_VAL_LEN;
+	memset(tci->cmd_body.cmd_hdcp_write_val.val, DEFAULT_WRITE_VAL, DEFAULT_WRITE_VAL_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_WRITE_VAL);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+int tee_hdcp2_soft_rst(struct mtk_hdcp_info *hdcp_info)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	tci->command_id = CMD_WRITE_VAL;
+	tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_PARAM_RST_2;
+	/* No need input. Set default value 0 for check */
+	tci->cmd_body.cmd_hdcp_write_val.len = DEFAULT_WRITE_VAL_LEN;
+	memset(tci->cmd_body.cmd_hdcp_write_val.val, DEFAULT_WRITE_VAL, DEFAULT_WRITE_VAL_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_WRITE_VAL);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+/** V1.X **/
+int tee_get_aksv(struct mtk_hdcp_info *hdcp_info, u8 *aksv)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	struct tci_t *tci_resp;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_GET_AKSV;
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_GET_AKSV);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	tci_resp = (struct tci_t *)dp_tee_priv->resp_buf;
+	memcpy(aksv, tci_resp->cmd_body.cmd_hdcp_get_aksv.aksv, DRM_HDCP_KSV_LEN);
+
+	return 0;
+}
+
+/* Calculate Km base on Bksv and write it to HW */
+int tee_calculate_lm(struct mtk_hdcp_info *hdcp_info, u8 *bksv)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_CALCULATE_LM;
+	memcpy(tci->cmd_body.cmd_hdcp_calculate_lm.bksv, bksv, DRM_HDCP_KSV_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_CALCULATE_LM);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+/*  Get r0 from HW and compare to rx_r0 */
+int tee_compare_r0(struct mtk_hdcp_info *hdcp_info, u8 *r0, u32 len)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_COMPARE_R0;
+	tci->cmd_body.cmd_hdcp_compare.rx_val_len = len;
+	memcpy(tci->cmd_body.cmd_hdcp_compare.rx_val, r0, len);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_COMPARE_R0);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+/* Compute and compare v value */
+int tee_hdcp1x_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
+				 u8 *crypto_param, u32 param_len, u8 *rx_v)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_COMPARE_V1;
+	tci->cmd_body.cmd_hdcp_compare.rx_val_len = 20;
+	tci->cmd_body.cmd_hdcp_compare.param_len = param_len;
+	memcpy(tci->cmd_body.cmd_hdcp_compare.rx_val, rx_v, 20);
+	memcpy(tci->cmd_body.cmd_hdcp_compare.param, crypto_param, param_len);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_COMPARE_V1);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+/** V2.X **/
+int tee_ake_certificate(struct mtk_hdcp_info *hdcp_info,
+			u8 *certificate, bool *stored, u8 *out_m, u8 *out_ekm)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	struct tci_t *tci_resp;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_AKE_CERTIFICATE;
+	memcpy(tci->cmd_body.cmd_hdcp_ake_certificate.certification,
+	       certificate, HDCP2_CERTRX_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_AKE_CERTIFICATE);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	pr_info("[TLC_HDCP] verify signature: result %d\n", rc);
+	tci_resp = (struct tci_t *)dp_tee_priv->resp_buf;
+	*stored = tci_resp->cmd_body.cmd_hdcp_ake_certificate.stored;
+	memcpy(out_m, tci_resp->cmd_body.cmd_hdcp_ake_certificate.m,
+	       HDCP_2_2_E_KH_KM_M_LEN - HDCP_2_2_E_KH_KM_LEN);
+	memcpy(out_ekm, tci_resp->cmd_body.cmd_hdcp_ake_certificate.ekm, HDCP_2_2_E_KH_KM_LEN);
+
+	return 0;
+}
+
+/* Encrypt km */
+int tee_enc_rsaes_oaep(struct mtk_hdcp_info *hdcp_info, u8 *ekm)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	struct tci_t *tci_resp;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_ENC_KM;
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_ENC_KM);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	tci_resp = (struct tci_t *)dp_tee_priv->resp_buf;
+	memcpy(ekm, tci_resp->cmd_body.cmd_hdcp_enc_km.enc_km, HDCP_2_2_E_KPUB_KM_LEN);
+
+	return 0;
+}
+
+/* Calculate h prime and compare to rx_h */
+int tee_ake_h_prime(struct mtk_hdcp_info *hdcp_info,
+		    u8 *rtx, u8 *rrx, u8 *rx_caps, u8 *tx_caps, u8 *rx_h, u32 rx_h_len)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	struct tci_t *tci_resp;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_AKE_H_PRIME;
+	tci->cmd_body.cmd_hdcp_ake_h_prime.rx_h_len = rx_h_len;
+
+	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rtx, rtx, HDCP_2_2_RTX_LEN);
+	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rrx, rrx, HDCP_2_2_RRX_LEN);
+	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rx_caps, rx_caps, HDCP_2_2_RXCAPS_LEN);
+	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.tx_caps, tx_caps, HDCP_2_2_TXCAPS_LEN);
+	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rx_h, rx_h, rx_h_len);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_AKE_H_PRIME);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	tci_resp = (struct tci_t *)dp_tee_priv->resp_buf;
+
+	return tci_resp->return_code;
+}
+
+/* Store paring info */
+int tee_ake_paring(struct mtk_hdcp_info *hdcp_info, u8 *rx_ekm)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_AKE_PARING;
+	memcpy(tci->cmd_body.cmd_hdcp_ake_paring.ekm, rx_ekm, HDCP_2_2_E_KH_KM_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_AKE_PARING);
+	if (rc)
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+
+	return 0;
+}
+
+/* Calculate l prime and compare */
+int tee_lc_l_prime(struct mtk_hdcp_info *hdcp_info, u8 *rn, u8 *rx_l, u32 len)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	struct tci_t *tci_resp;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_LC_L_PRIME;
+	memcpy(tci->cmd_body.cmd_hdcp_lc_l_prime.rn, rn, HDCP_2_2_RN_LEN);
+	tci->cmd_body.cmd_hdcp_lc_l_prime.rx_l_len = len;
+	memcpy(tci->cmd_body.cmd_hdcp_lc_l_prime.rx_l, rx_l, len);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_LC_L_PRIME);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	tci_resp = (struct tci_t *)dp_tee_priv->resp_buf;
+
+	return tci_resp->return_code;
+}
+
+int tee_ske_enc_ks(struct mtk_hdcp_info *hdcp_info, u8 *riv, u8 *eks)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = NULL;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_SKE_CAL_EKS;
+	memcpy(tci->cmd_body.cmd_hdcp_ske_eks.riv, riv, HDCP_2_2_RIV_LEN);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH + 16, CMD_SKE_CAL_EKS);
+	if (rc)
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+
+	share_buffer = (u8 *)dp_tee_priv->resp_buf;
+	memcpy(eks, share_buffer + TCI_LENGTH, 16);
+
+	return 0;
+}
+
+/* Calculate and compare v prime for repeater */
+int tee_hdcp2_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
+				u8 *crypto_param, u32 param_len, u8 *rx_v, u8 *tx_v)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	u8 *share_buffer = NULL;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_COMPARE_V2;
+	tci->cmd_body.cmd_hdcp_compare.rx_val_len = 16;
+	tci->cmd_body.cmd_hdcp_compare.param_len = param_len;
+	memcpy(tci->cmd_body.cmd_hdcp_compare.rx_val, rx_v, 16);
+	memcpy(tci->cmd_body.cmd_hdcp_compare.param, crypto_param, param_len);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_COMPARE_V2);
+	if (rc) {
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+		return rc;
+	}
+
+	share_buffer = (u8 *)dp_tee_priv->resp_buf;
+	memcpy(tx_v, share_buffer + TCI_LENGTH, 16);
+
+	return 0;
+}
+
+/* Calculate and compare m prime for repeater */
+int tee_hdcp2_compute_compare_m(struct mtk_hdcp_info *hdcp_info,
+				u8 *crypto_param, u32 param_len, u8 *rx_m)
+{
+	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
+	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
+	int rc;
+
+	/* Copy parameters */
+	tci->command_id = CMD_COMPARE_M;
+	tci->cmd_body.cmd_hdcp_compare.rx_val_len = HDCP_2_2_MPRIME_LEN;
+	tci->cmd_body.cmd_hdcp_compare.param_len = param_len;
+	memcpy(tci->cmd_body.cmd_hdcp_compare.rx_val, rx_m, HDCP_2_2_MPRIME_LEN);
+	memcpy(tci->cmd_body.cmd_hdcp_compare.param, crypto_param, param_len);
+
+	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_COMPARE_M);
+	if (rc)
+		pr_err("[TLC_HDCP] tee_op_send failed, error=%x\n", rc);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/mediatek/tlc_dp_hdcp.h b/drivers/gpu/drm/mediatek/tlc_dp_hdcp.h
new file mode 100644
index 000000000000..871d3fec5835
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/tlc_dp_hdcp.h
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2024 MediaTek Inc.
+ */
+
+#ifndef _TLC_DP_HDCP_H_
+#define _TLC_DP_HDCP_H_
+
+#include <linux/printk.h>
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+#include <linux/types.h>
+#include <linux/sched/clock.h>
+#include <drm/display/drm_dp_helper.h>
+#include "tci.h"
+
+/* HDCP version definitions */
+#define HDCP_NONE                0x0 /* No HDCP supported, no secure data path */
+#define HDCP_V1                  0x1 /* HDCP version 1.0 */
+#define HDCP_V2                  0x2 /* HDCP version 2.0 Type 1 */
+#define HDCP_V2_3                0x5 /* HDCP version 2.3 Type 1 */
+
+/* Max buffer size supported by dp */
+#define MAX_COMMAND_SIZE       4096
+#define MAX_RESPONSE_SIZE      MAX_COMMAND_SIZE
+
+#define HDCP1X_REP_MAXDEVS 128
+#define HDCP1X_V_LEN 20
+#define HDCP1X_B_INFO_LEN 2
+
+#define HDCP2_K_LEN 2
+#define HDCP2_STREAMID_TYPE_LEN 2
+
+enum hdcp_result {
+	AUTH_ZERO = 0,
+	AUTH_INIT = 2,
+	AUTH_PASS = 3,
+	AUTH_FAIL = 4,
+};
+
+struct dp_tee_private {
+	u32 session;
+	size_t resp_len;
+	u8 resp_buf[MAX_RESPONSE_SIZE];
+	struct tee_context *ctx;
+	struct tee_shm *shm;
+};
+
+struct hdcp2_info_tx {
+	struct hdcp2_ake_init ake_init;
+	struct hdcp2_ake_no_stored_km no_stored_km;
+	struct hdcp2_ske_send_eks send_eks;
+	struct hdcp2_lc_init lc_init;
+	struct hdcp2_rep_stream_manage stream_manage;
+	struct hdcp2_rep_send_ack send_ack;
+	struct hdcp2_tx_caps tx_caps;
+	u8 k[HDCP2_K_LEN];
+	u8 stream_id_type[HDCP2_STREAMID_TYPE_LEN];
+};
+
+struct hdcp2_info_rx {
+	struct hdcp2_cert_rx cert_rx;
+	struct hdcp2_ake_send_cert send_cert;
+	struct hdcp2_rep_send_receiverid_list recvid_list;
+	struct hdcp2_ake_send_pairing_info pairing_info;
+	struct hdcp2_rep_stream_ready stream_ready;
+	struct hdcp2_ake_send_hprime send_hprime;
+	struct hdcp2_lc_send_lprime send_lprime;
+};
+
+struct hdcp1x_info {
+	bool capable;
+	bool repeater;
+	u8 device_count;
+	u8 v[HDCP1X_V_LEN];
+	u8 b_ksv[DRM_HDCP_KSV_LEN];
+	u8 a_ksv[DRM_HDCP_KSV_LEN];
+	u8 b_info[HDCP1X_B_INFO_LEN];
+	u8 ksvfifo[DRM_HDCP_KSV_LEN * (HDCP1X_REP_MAXDEVS - 1)];
+};
+
+struct hdcp2_info {
+	bool capable;
+	bool repeater;
+	bool stored_km;
+	u8 device_count;
+	u8 stream_id_type;
+	u32 seq_num_v_cnt;
+	atomic_t cp_irq;
+	int cp_irq_cached;
+	wait_queue_head_t cp_irq_queue;
+	struct hdcp2_info_tx hdcp_tx;
+	struct hdcp2_info_rx hdcp_rx;
+	struct hdcp2_ake_stored_km ake_stored_km;
+};
+
+struct mtk_hdcp_info {
+	bool g_init;
+	u8 auth_status;
+	u8 auth_version;
+	u32 hdcp_content_type;
+	u32 content_protection;
+	struct hdcp2_info hdcp2_info;
+	struct hdcp1x_info hdcp1x_info;
+	struct dp_tee_private *g_dp_tee_priv;
+};
+
+int tee_add_device(struct mtk_hdcp_info *hdcp_info, u32 version);
+void tee_remove_device(struct mtk_hdcp_info *hdcp_info);
+int tee_clear_paring(struct mtk_hdcp_info *hdcp_info);
+int tee_calculate_lm(struct mtk_hdcp_info *hdcp_info, u8 *bksv);
+int tee_get_aksv(struct mtk_hdcp_info *hdcp_info, u8 *aksv);
+int tee_compare_r0(struct mtk_hdcp_info *hdcp_info, u8 *r0, u32 len);
+int tee_hdcp1x_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
+				 u8 *crypto_param, u32 param_len, u8 *rx_v);
+int tee_hdcp1x_set_tx_an(struct mtk_hdcp_info *hdcp_info, u8 *an_code);
+int tee_hdcp1x_soft_rst(struct mtk_hdcp_info *hdcp_info);
+int tee_hdcp2_soft_rst(struct mtk_hdcp_info *hdcp_info);
+int tee_hdcp_enable_encrypt(struct mtk_hdcp_info *hdcp_info, bool enable, u8 version);
+int tee_ake_certificate(struct mtk_hdcp_info *hdcp_info,
+			u8 *certificate, bool *stored, u8 *out_m, u8 *out_ekm);
+int tee_enc_rsaes_oaep(struct mtk_hdcp_info *hdcp_info, u8 *ekm);
+int tee_ake_h_prime(struct mtk_hdcp_info *hdcp_info,
+		    u8 *rtx, u8 *rrx, u8 *rx_caps, u8 *tx_caps, u8 *rx_h, u32 rx_h_len);
+int tee_ake_paring(struct mtk_hdcp_info *hdcp_info, u8 *rx_ekm);
+int tee_lc_l_prime(struct mtk_hdcp_info *hdcp_info, u8 *rn, u8 *rx_l, u32 len);
+
+int tee_ske_enc_ks(struct mtk_hdcp_info *hdcp_info, u8 *riv, u8 *eks);
+int tee_hdcp2_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
+				u8 *crypto_param, u32 param_len, u8 *rx_v, u8 *tx_v);
+int tee_hdcp2_compute_compare_m(struct mtk_hdcp_info *hdcp_info,
+				u8 *crypto_param, u32 param_len, u8 *rx_m);
+#endif /* _TLC_DP_HDCP_H_ */
-- 
2.43.0

