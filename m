Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D19F180C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 22:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C0110E45C;
	Fri, 13 Dec 2024 21:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZJ/R3QLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D649710E45C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 21:34:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDLUQJ0031856;
 Fri, 13 Dec 2024 21:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D064PfOKDOtq1tPHSSjv3h0osA353znKnL9kWE7Sx20=; b=ZJ/R3QLuqP+LmAfM
 oiv8qY6hdAKRwYedLJpHVqZW9dmaDBFHFbmxJwbaR1xMoRh+VJnftamtHcWAQxs+
 8XVzv0i1Wk4G5hDnm0N7KgaO+Y2aqXnjbHPSOcalHd1Oq9XbLKTsIinwHeRT6A79
 9SoULzO9646IN3f7e23kGI9THaAPE4j+avRMgV8DnmkpQXKLi7b0yzm+ec5a3iJZ
 Eb1PP/zbw2jAj5IrJVLO7XQjJlZBP1EjYtNmbFGfD1c9PxIWsSeI++lfyyzuChT/
 KueQD+1jbkFjDqAN98i5yxoZpwkullC1uWLb5QlpseodDfb0fPmH1JtXZtGIQYs1
 zzSI/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn2hps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 21:34:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDLY0Ps002653
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 21:34:00 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 13:34:00 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
 <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
 <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
Subject: [PATCH 1/7] bus: mhi: host: Refactor BHI/BHIe based firmware loading
Date: Fri, 13 Dec 2024 14:33:34 -0700
Message-ID: <20241213213340.2551697-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1WC8DdUN9SHSYJ2noMh_5jZijDvSZp5-
X-Proofpoint-ORIG-GUID: 1WC8DdUN9SHSYJ2noMh_5jZijDvSZp5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130152
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
 drivers/bus/mhi/host/boot.c | 155 +++++++++++++++++++++++++-----------
 1 file changed, 110 insertions(+), 45 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index e8c92972f9df..e3f3c07166ad 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -177,6 +177,37 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 }
 EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
 
+static inline void mhi_fw_load_error_dump(struct mhi_controller *mhi_cntrl)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
+	void __iomem *base = mhi_cntrl->bhi;
+	int ret;
+	u32 val;
+	int i;
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
@@ -226,24 +257,13 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
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
@@ -255,11 +275,9 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
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
 
@@ -274,18 +292,7 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 
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
 
@@ -296,6 +303,16 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
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
@@ -310,6 +327,47 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
 	kfree(image_info);
 }
 
+static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
+				struct image_info **image_info,
+				size_t alloc_size)
+{
+	struct image_info *img_info;
+	struct mhi_buf *mhi_buf;
+	int segments = 1;
+
+	img_info = kzalloc(sizeof(*img_info), GFP_KERNEL);
+	if (!img_info)
+		return -ENOMEM;
+
+	/* Allocate memory for entry */
+	img_info->mhi_buf = kcalloc(segments, sizeof(*img_info->mhi_buf),
+				    GFP_KERNEL);
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
+	img_info->entries = segments;
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
@@ -364,9 +422,18 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	return -ENOMEM;
 }
 
-static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
-			      const u8 *buf, size_t remainder,
-			      struct image_info *img_info)
+static void mhi_firmware_copy_bhi(struct mhi_controller *mhi_cntrl,
+				  const u8 *buf, size_t size,
+				  struct image_info *img_info)
+{
+	struct mhi_buf *mhi_buf = img_info->mhi_buf;
+
+	memcpy(mhi_buf->buf, buf, size);
+}
+
+static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
+				   const u8 *buf, size_t remainder,
+				   struct image_info *img_info)
 {
 	size_t to_cpy;
 	struct mhi_buf *mhi_buf = img_info->mhi_buf;
@@ -390,10 +457,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
 
@@ -452,17 +518,16 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
+	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
 
 	/* Download image using BHI */
-	memcpy(buf, fw_data, size);
-	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
-	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
+	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
+	mhi_free_bhi_buffer(mhi_cntrl, image);
 
 	/* Error or in EDL mode, we're done */
 	if (ret) {
@@ -493,7 +558,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 		}
 
 		/* Load the firmware into BHIE vec table */
-		mhi_firmware_copy(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
+		mhi_firmware_copy_bhie(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
 	}
 
 	release_firmware(firmware);
-- 
2.34.1

