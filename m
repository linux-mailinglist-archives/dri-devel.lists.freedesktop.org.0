Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347EA1555F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 18:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5983910EB59;
	Fri, 17 Jan 2025 17:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cFu9+GCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140B210E336
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 17:10:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HFL7K7001383;
 Fri, 17 Jan 2025 17:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4nsCbfrZ390JN52NshwJe3FIDSL16ihcxjbalcZkljM=; b=cFu9+GCLhsiRVz/9
 ND9khpb0+lNBzKnGJcXYvdTVG40lcULfHAgeHFkVt0DDcopmQ8i/zjWGxAWst4KR
 /V9fAWVdm/4zlXFbudqgJeeZeCNuGVPsWal5M6zRSatjgHz7hZgrzShl2YpoCf42
 8Fmw7q/OE8OLMIIg72C2U4htAiP7rsIQYZYREMu+tZaCuXPbyZIxihJrI9omS7iH
 hH/MWHEaRS/dW18Qx1mGj9PdxqVGYtNyi2iR0lTEA+MASekbgp90VAHLMyURk8gD
 Np/Wo7UsbMxv5xcR8BkNdjsAvWJ6S5yVN+456is90n46mR1gqo8U70oBLzGzjGTh
 QZ0N4w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447ss108wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2025 17:10:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HHA1ZB032531
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2025 17:10:01 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 17 Jan 2025 09:10:01 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
 <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
 <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
Subject: [PATCH v2 1/7] bus: mhi: host: Refactor BHI/BHIe based firmware
 loading
Date: Fri, 17 Jan 2025 10:09:37 -0700
Message-ID: <20250117170943.2643280-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YrIVkr-k92Gb57jQgDnsBMl39vEMC_Nf
X-Proofpoint-GUID: YrIVkr-k92Gb57jQgDnsBMl39vEMC_Nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170134
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

From: Matthew Leung <quic_mattleun@quicinc.com>

Refactor the firmware loading code to have distinct helper functions for
BHI and BHIe operations. This lays the foundation for separating the
firmware loading protocol from the firmware being loaded and the EE it
is loaded in.

Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/bus/mhi/host/boot.c | 144 +++++++++++++++++++++++++-----------
 1 file changed, 99 insertions(+), 45 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index e8c92972f9df..9fe13d3f09f0 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -177,6 +177,36 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 }
 EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
 
+static void mhi_fw_load_error_dump(struct mhi_controller *mhi_cntrl)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
+	void __iomem *base = mhi_cntrl->bhi;
+	int ret, i;
+	u32 val;
+	struct {
+		char *name;
+		u32 offset;
+	} error_reg[] = {
+		{ "ERROR_CODE", BHI_ERRCODE },
+		{ "ERROR_DBG1", BHI_ERRDBG1 },
+		{ "ERROR_DBG2", BHI_ERRDBG2 },
+		{ "ERROR_DBG3", BHI_ERRDBG3 },
+		{ NULL },
+	};
+
+	read_lock_bh(pm_lock);
+	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
+		for (i = 0; error_reg[i].name; i++) {
+			ret = mhi_read_reg(mhi_cntrl, base, error_reg[i].offset, &val);
+			if (ret)
+				break;
+			dev_err(dev, "Reg: %s value: 0x%x\n", error_reg[i].name, val);
+		}
+	}
+	read_unlock_bh(pm_lock);
+}
+
 static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 			    const struct mhi_buf *mhi_buf)
 {
@@ -226,24 +256,13 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 }
 
 static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
-			   dma_addr_t dma_addr,
-			   size_t size)
+			    const struct mhi_buf *mhi_buf)
 {
-	u32 tx_status, val, session_id;
-	int i, ret;
-	void __iomem *base = mhi_cntrl->bhi;
-	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	struct {
-		char *name;
-		u32 offset;
-	} error_reg[] = {
-		{ "ERROR_CODE", BHI_ERRCODE },
-		{ "ERROR_DBG1", BHI_ERRDBG1 },
-		{ "ERROR_DBG2", BHI_ERRDBG2 },
-		{ "ERROR_DBG3", BHI_ERRDBG3 },
-		{ NULL },
-	};
+	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
+	void __iomem *base = mhi_cntrl->bhi;
+	u32 tx_status, session_id;
+	int ret;
 
 	read_lock_bh(pm_lock);
 	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
@@ -255,11 +274,9 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 	dev_dbg(dev, "Starting image download via BHI. Session ID: %u\n",
 		session_id);
 	mhi_write_reg(mhi_cntrl, base, BHI_STATUS, 0);
-	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH,
-		      upper_32_bits(dma_addr));
-	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_LOW,
-		      lower_32_bits(dma_addr));
-	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, size);
+	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH, upper_32_bits(mhi_buf->dma_addr));
+	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_LOW, lower_32_bits(mhi_buf->dma_addr));
+	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, mhi_buf->len);
 	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
 	read_unlock_bh(pm_lock);
 
@@ -274,18 +291,7 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 
 	if (tx_status == BHI_STATUS_ERROR) {
 		dev_err(dev, "Image transfer failed\n");
-		read_lock_bh(pm_lock);
-		if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
-			for (i = 0; error_reg[i].name; i++) {
-				ret = mhi_read_reg(mhi_cntrl, base,
-						   error_reg[i].offset, &val);
-				if (ret)
-					break;
-				dev_err(dev, "Reg: %s value: 0x%x\n",
-					error_reg[i].name, val);
-			}
-		}
-		read_unlock_bh(pm_lock);
+		mhi_fw_load_error_dump(mhi_cntrl);
 		goto invalid_pm_state;
 	}
 
@@ -296,6 +302,16 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 	return -EIO;
 }
 
+static void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
+				struct image_info *image_info)
+{
+	struct mhi_buf *mhi_buf = image_info->mhi_buf;
+
+	dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len, mhi_buf->buf, mhi_buf->dma_addr);
+	kfree(image_info->mhi_buf);
+	kfree(image_info);
+}
+
 void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
 			 struct image_info *image_info)
 {
@@ -310,6 +326,45 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
 	kfree(image_info);
 }
 
+static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
+				struct image_info **image_info,
+				size_t alloc_size)
+{
+	struct image_info *img_info;
+	struct mhi_buf *mhi_buf;
+
+	img_info = kzalloc(sizeof(*img_info), GFP_KERNEL);
+	if (!img_info)
+		return -ENOMEM;
+
+	/* Allocate memory for entry */
+	img_info->mhi_buf = kzalloc(sizeof(*img_info->mhi_buf), GFP_KERNEL);
+	if (!img_info->mhi_buf)
+		goto error_alloc_mhi_buf;
+
+	/* Allocate and populate vector table */
+	mhi_buf = img_info->mhi_buf;
+
+	mhi_buf->len = alloc_size;
+	mhi_buf->buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
+					  &mhi_buf->dma_addr, GFP_KERNEL);
+	if (!mhi_buf->buf)
+		goto error_alloc_segment;
+
+	img_info->bhi_vec = NULL;
+	img_info->entries = 1;
+	*image_info = img_info;
+
+	return 0;
+
+error_alloc_segment:
+	kfree(mhi_buf);
+error_alloc_mhi_buf:
+	kfree(img_info);
+
+	return -ENOMEM;
+}
+
 int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 			 struct image_info **image_info,
 			 size_t alloc_size)
@@ -364,9 +419,9 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	return -ENOMEM;
 }
 
-static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
-			      const u8 *buf, size_t remainder,
-			      struct image_info *img_info)
+static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
+				   const u8 *buf, size_t remainder,
+				   struct image_info *img_info)
 {
 	size_t to_cpy;
 	struct mhi_buf *mhi_buf = img_info->mhi_buf;
@@ -390,10 +445,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	const struct firmware *firmware = NULL;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_pm_state new_state;
+	struct image_info *image;
 	const char *fw_name;
 	const u8 *fw_data;
-	void *buf;
-	dma_addr_t dma_addr;
 	size_t size, fw_sz;
 	int ret;
 
@@ -452,17 +506,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	fw_sz = firmware->size;
 
 skip_req_fw:
-	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
-				 GFP_KERNEL);
-	if (!buf) {
+	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
+	if (ret) {
 		release_firmware(firmware);
 		goto error_fw_load;
 	}
+	/* Load the firmware into BHI vec table */
+	memcpy(image->mhi_buf->buf, fw_data, size);
 
 	/* Download image using BHI */
-	memcpy(buf, fw_data, size);
-	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
-	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
+	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
+	mhi_free_bhi_buffer(mhi_cntrl, image);
 
 	/* Error or in EDL mode, we're done */
 	if (ret) {
@@ -493,7 +547,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 		}
 
 		/* Load the firmware into BHIE vec table */
-		mhi_firmware_copy(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
+		mhi_firmware_copy_bhie(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
 	}
 
 	release_firmware(firmware);
-- 
2.34.1

