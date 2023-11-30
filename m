Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0717FEA75
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 09:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B96D10E173;
	Thu, 30 Nov 2023 08:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CD210E173
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 08:26:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3E2C7B841FF;
 Thu, 30 Nov 2023 08:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3A1C433CA;
 Thu, 30 Nov 2023 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701332765;
 bh=BtRz+Y7hxsLxGACiC7aE/ah8oZo1Gqyj9qu8yNDvozU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GVr8PfBuWFgNaIixJBFfiDt1JmwDrd90RMDz8Z9oy5C/4UiaXE74/Hj1YHdxKMV3j
 zah6HNxIGGlf7pJFb14kJA8WRCGtqUTANDvVoIN8rmkQV4NXfDZ4zCBvz8hO9KTuoI
 cPDxT2l+6k9pS3UL9T/CrrHYeBYH1ztk6yx8V2LEnsqfA3nhXDaI2h4b0BTq1Lnwvw
 fy3MifJSQFp1u3Hg1EzI//fqCu+mpN6MCvQFfc/Whk/yUrgWbj9JfIiokNjYkeRsz8
 b+K9GqKdjnKYrFzJmCxLmcfLglaNf9PCS/EQAunop3a53ykIL2oJuXXKb4oH3vGc9W
 KgaqHfVYiwVgw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] accel/habanalabs/gaudi2: add signed dev info uAPI
Date: Thu, 30 Nov 2023 10:25:57 +0200
Message-Id: <20231130082557.1783532-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130082557.1783532-1-ogabbay@kernel.org>
References: <20231130082557.1783532-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Moti Haimovski <mhaimovski@habana.ai>

User will provide a nonce via the INFO ioctl, and will retrieve
the signed device info generated using given nonce.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c |  8 ++++
 drivers/accel/habanalabs/common/habanalabs.h  |  2 +
 .../habanalabs/common/habanalabs_ioctl.c      | 48 +++++++++++++++++++
 include/linux/habanalabs/cpucp_if.h           |  8 +++-
 include/uapi/drm/habanalabs_accel.h           | 23 +++++++++
 5 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 9e9dfe013659..3558a6a8e192 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -3244,6 +3244,14 @@ int hl_fw_get_sec_attest_info(struct hl_device *hdev, struct cpucp_sec_attest_in
 					HL_CPUCP_SEC_ATTEST_INFO_TINEOUT_USEC);
 }
 
+int hl_fw_get_dev_info_signed(struct hl_device *hdev,
+			      struct cpucp_dev_info_signed *dev_info_signed, u32 nonce)
+{
+	return hl_fw_get_sec_attest_data(hdev, CPUCP_PACKET_INFO_SIGNED_GET, dev_info_signed,
+					 sizeof(struct cpucp_dev_info_signed), nonce,
+					 HL_CPUCP_SEC_ATTEST_INFO_TINEOUT_USEC);
+}
+
 int hl_fw_send_generic_request(struct hl_device *hdev, enum hl_passthrough_type sub_opcode,
 						dma_addr_t buff, u32 *size)
 {
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 7b0209e5bad6..dd3fe3ddc00a 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3964,6 +3964,8 @@ long hl_fw_get_max_power(struct hl_device *hdev);
 void hl_fw_set_max_power(struct hl_device *hdev);
 int hl_fw_get_sec_attest_info(struct hl_device *hdev, struct cpucp_sec_attest_info *sec_attest_info,
 				u32 nonce);
+int hl_fw_get_dev_info_signed(struct hl_device *hdev,
+			      struct cpucp_dev_info_signed *dev_info_signed, u32 nonce);
 int hl_set_voltage(struct hl_device *hdev, int sensor_index, u32 attr, long value);
 int hl_set_current(struct hl_device *hdev, int sensor_index, u32 attr, long value);
 int hl_set_power(struct hl_device *hdev, int sensor_index, u32 attr, long value);
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 8ef36effb95b..a43d21c5136a 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -719,6 +719,51 @@ static int sec_attest_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
 	return rc;
 }
 
+static int dev_info_signed(struct hl_fpriv *hpriv, struct hl_info_args *args)
+{
+	void __user *out = (void __user *) (uintptr_t) args->return_pointer;
+	struct cpucp_dev_info_signed *dev_info_signed;
+	struct hl_info_signed *info;
+	u32 max_size = args->return_size;
+	int rc;
+
+	if ((!max_size) || (!out))
+		return -EINVAL;
+
+	dev_info_signed = kzalloc(sizeof(*dev_info_signed), GFP_KERNEL);
+	if (!dev_info_signed)
+		return -ENOMEM;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info) {
+		rc = -ENOMEM;
+		goto free_dev_info_signed;
+	}
+
+	rc = hl_fw_get_dev_info_signed(hpriv->hdev,
+					dev_info_signed, args->sec_attest_nonce);
+	if (rc)
+		goto free_info;
+
+	info->nonce = le32_to_cpu(dev_info_signed->nonce);
+	info->info_sig_len = dev_info_signed->info_sig_len;
+	info->pub_data_len = le16_to_cpu(dev_info_signed->pub_data_len);
+	info->certificate_len = le16_to_cpu(dev_info_signed->certificate_len);
+	memcpy(&info->info_sig, &dev_info_signed->info_sig, sizeof(info->info_sig));
+	memcpy(&info->public_data, &dev_info_signed->public_data, sizeof(info->public_data));
+	memcpy(&info->certificate, &dev_info_signed->certificate, sizeof(info->certificate));
+
+	rc = copy_to_user(out, info, min_t(size_t, max_size, sizeof(*info))) ? -EFAULT : 0;
+
+free_info:
+	kfree(info);
+free_dev_info_signed:
+	kfree(dev_info_signed);
+
+	return rc;
+}
+
+
 static int eventfd_register(struct hl_fpriv *hpriv, struct hl_info_args *args)
 {
 	int rc;
@@ -1089,6 +1134,9 @@ static int _hl_info_ioctl(struct hl_fpriv *hpriv, void *data,
 	case HL_INFO_FW_GENERIC_REQ:
 		return send_fw_generic_request(hdev, args);
 
+	case HL_INFO_DEV_SIGNED:
+		return dev_info_signed(hpriv, args);
+
 	default:
 		dev_err(dev, "Invalid request %d\n", args->op);
 		rc = -EINVAL;
diff --git a/include/linux/habanalabs/cpucp_if.h b/include/linux/habanalabs/cpucp_if.h
index 86ea7c63a0d2..f316c8d0f3fc 100644
--- a/include/linux/habanalabs/cpucp_if.h
+++ b/include/linux/habanalabs/cpucp_if.h
@@ -659,6 +659,12 @@ enum pq_init_status {
  *       number (nonce) provided by the host to prevent replay attacks.
  *       public key and certificate also provided as part of the FW response.
  *
+ * CPUCP_PACKET_INFO_SIGNED_GET -
+ *       Get the device information signed by the Trusted Platform device.
+ *       device info data is also hashed with some unique number (nonce) provided
+ *       by the host to prevent replay attacks. public key and certificate also
+ *       provided as part of the FW response.
+ *
  * CPUCP_PACKET_MONITOR_DUMP_GET -
  *       Get monitors registers dump from the CpuCP kernel.
  *       The CPU will put the registers dump in the a buffer allocated by the driver
@@ -733,7 +739,7 @@ enum cpucp_packet_id {
 	CPUCP_PACKET_ENGINE_CORE_ASID_SET,	/* internal */
 	CPUCP_PACKET_RESERVED2,			/* not used */
 	CPUCP_PACKET_SEC_ATTEST_GET,		/* internal */
-	CPUCP_PACKET_RESERVED3,			/* not used */
+	CPUCP_PACKET_INFO_SIGNED_GET,		/* internal */
 	CPUCP_PACKET_RESERVED4,			/* not used */
 	CPUCP_PACKET_MONITOR_DUMP_GET,		/* debugfs */
 	CPUCP_PACKET_RESERVED5,			/* not used */
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index 347c7b62e60e..3da0d3ac6056 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -846,6 +846,7 @@ enum hl_server_type {
 #define HL_INFO_HW_ERR_EVENT			36
 #define HL_INFO_FW_ERR_EVENT			37
 #define HL_INFO_USER_ENGINE_ERR_EVENT		38
+#define HL_INFO_DEV_SIGNED			40
 
 #define HL_INFO_VERSION_MAX_LEN			128
 #define HL_INFO_CARD_NAME_MAX_LEN		16
@@ -1290,6 +1291,28 @@ struct hl_info_sec_attest {
 	__u8 pad0[2];
 };
 
+/*
+ * struct hl_info_signed - device information signed by a secured device.
+ * @nonce: number only used once. random number provided by host. this also passed to the quote
+ *         command as a qualifying data.
+ * @pub_data_len: length of the public data (bytes)
+ * @certificate_len: length of the certificate (bytes)
+ * @info_sig_len: length of the attestation signature (bytes)
+ * @public_data: public key info signed info data (outPublic + name + qualifiedName)
+ * @certificate: certificate for the signing key
+ * @info_sig: signature of the info + nonce data.
+ */
+struct hl_info_signed {
+	__u32 nonce;
+	__u16 pub_data_len;
+	__u16 certificate_len;
+	__u8 info_sig_len;
+	__u8 public_data[SEC_PUB_DATA_BUF_SZ];
+	__u8 certificate[SEC_CERTIFICATE_BUF_SZ];
+	__u8 info_sig[SEC_SIGNATURE_BUF_SZ];
+	__u8 pad[4];
+};
+
 /**
  * struct hl_page_fault_info - page fault information.
  * @timestamp: timestamp of page fault.
-- 
2.34.1

