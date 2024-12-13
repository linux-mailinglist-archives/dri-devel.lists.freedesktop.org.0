Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 490AE9F180A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 22:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D665110E142;
	Fri, 13 Dec 2024 21:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ia/EOror";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B21710F0DF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 21:34:08 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDJohjF022799;
 Fri, 13 Dec 2024 21:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AxjnS2XneeHwhIxD6Bwzlvv/KHyOduyIMoVnw8R1SVI=; b=ia/EOrorxZtzuPwY
 Uzu1k4/fKC1dFWv8W+hEyQSY/4gvmZr53i8oHbyIMoUk8ujVObB981YJgo9QHOkv
 Rb0ywLZWFFWyre/5IBqAWNKAHSZpla/wDUXzADXyc3ah+LCD9TO2eR4ugjm9itD7
 l0Wj3dyPtzPFqn5nG6jvxHwkTBbHBO6jc30excwkEi46WL+LbPGCSFNuqo5k0f1B
 T3K9YM+KwjIC+qZ5V7qmXNBr5fjfYN7iIvSSacvdhqNH/mCfzlFY1a5IAhGzx4PI
 BvwgOmrgTVcw7t7SdDVzqzUIiBfD9i4qccRdfoMdGI4RD+sxCo0V3D4PO5NmEaIS
 59omeQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wnbpkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 21:34:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDLY2e5002759
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 21:34:02 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 13:34:02 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
 <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
 <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
Subject: [PATCH 2/7] bus: mhi: host: Add a policy to enable image transfer via
 BHIe in PBL
Date: Fri, 13 Dec 2024 14:33:35 -0700
Message-ID: <20241213213340.2551697-3-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 5w4XY3yS30IYd93AJpSbR82hX6KWqxKF
X-Proofpoint-GUID: 5w4XY3yS30IYd93AJpSbR82hX6KWqxKF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130152
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

Currently, mhi host only performs firmware transfer via BHI in PBL and
BHIe from SBL. To support BHIe transfer directly from PBL, a policy
needs to be added.

With this policy, BHIe will be used to transfer firmware in PBL if the
mhi controller has bhie regs, sets seg_len, and does not set
fbc_download. The intention is to transfer firmware using BHIe in PBL
without further BHIe transfers in SBL.

Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/bus/mhi/host/boot.c     | 80 +++++++++++++++++++++++++++------
 drivers/bus/mhi/host/init.c     |  2 +-
 drivers/bus/mhi/host/internal.h |  8 ++++
 3 files changed, 75 insertions(+), 15 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index e3f3c07166ad..c9ecb6427209 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -452,12 +452,62 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
 	}
 }
 
+static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
+{
+	enum mhi_fw_load_type ret = MHI_FW_LOAD_UNKNOWN;
+
+	if (mhi_cntrl->fbc_download) {
+		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
+			ret = MHI_FW_LOAD_FBC;
+	} else {
+		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
+			ret = MHI_FW_LOAD_BHIE;
+		else
+			ret = MHI_FW_LOAD_BHI;
+	}
+	return ret;
+}
+
+static int mhi_send_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
+{
+	struct image_info *image;
+	int ret;
+
+	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
+	if (ret)
+		return ret;
+
+	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
+
+	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
+	mhi_free_bhi_buffer(mhi_cntrl, image);
+
+	return ret;
+}
+
+static int mhi_send_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
+{
+	struct image_info *image;
+	int ret;
+
+	ret = mhi_alloc_bhie_table(mhi_cntrl, &image, size);
+	if (ret)
+		return ret;
+
+	mhi_firmware_copy_bhie(mhi_cntrl, fw_data, size, image);
+
+	ret = mhi_fw_load_bhie(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
+	mhi_free_bhie_table(mhi_cntrl, image);
+
+	return ret;
+}
+
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 {
 	const struct firmware *firmware = NULL;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	enum mhi_fw_load_type fw_load_type;
 	enum mhi_pm_state new_state;
-	struct image_info *image;
 	const char *fw_name;
 	const u8 *fw_data;
 	size_t size, fw_sz;
@@ -481,6 +531,12 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
 		mhi_cntrl->edl_image : mhi_cntrl->fw_image;
 
+	fw_load_type = mhi_fw_load_type_get(mhi_cntrl);
+	if (fw_load_type == MHI_FW_LOAD_UNKNOWN) {
+		dev_err(dev, "Cannot load FW as load type is UNKNOWN\n");
+		return;
+	}
+
 	/* check if the driver has already provided the firmware data */
 	if (!fw_name && mhi_cntrl->fbc_download &&
 	    mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
@@ -518,20 +574,16 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	fw_sz = firmware->size;
 
 skip_req_fw:
-	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
-	if (ret) {
-		release_firmware(firmware);
-		goto error_fw_load;
-	}
-	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
-
-	/* Download image using BHI */
-	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
-	mhi_free_bhi_buffer(mhi_cntrl, image);
+	if (fw_load_type == MHI_FW_LOAD_BHIE)
+		ret = mhi_send_image_bhie(mhi_cntrl, fw_data, size);
+	else
+		ret = mhi_send_image_bhi(mhi_cntrl, fw_data, size);
 
 	/* Error or in EDL mode, we're done */
 	if (ret) {
-		dev_err(dev, "MHI did not load image over BHI, ret: %d\n", ret);
+		dev_err(dev, "MHI did not load image over BHI%s, ret: %d\n",
+			fw_load_type == MHI_FW_LOAD_BHIE ? "e" : "",
+			ret);
 		release_firmware(firmware);
 		goto error_fw_load;
 	}
@@ -550,7 +602,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	 * If we're doing fbc, populate vector tables while
 	 * device transitioning into MHI READY state
 	 */
-	if (mhi_cntrl->fbc_download) {
+	if (fw_load_type == MHI_FW_LOAD_FBC) {
 		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
 		if (ret) {
 			release_firmware(firmware);
@@ -575,7 +627,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	return;
 
 error_ready_state:
-	if (mhi_cntrl->fbc_download) {
+	if (fw_load_type == MHI_FW_LOAD_FBC) {
 		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
 		mhi_cntrl->fbc_image = NULL;
 	}
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index a9b1f8beee7b..13e7a55f54ff 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1144,7 +1144,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 	}
 	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
 
-	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
+	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size || mhi_cntrl->seg_len) {
 		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF,
 				   &bhie_off);
 		if (ret) {
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 3134f111be35..afcf536083bc 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -29,6 +29,14 @@ struct bhi_vec_entry {
 	u64 size;
 };
 
+enum mhi_fw_load_type {
+	MHI_FW_LOAD_UNKNOWN,
+	MHI_FW_LOAD_BHI,	/* BHI only in PBL */
+	MHI_FW_LOAD_BHIE,	/* BHIe only in PBL */
+	MHI_FW_LOAD_FBC,	/* BHI in PBL followed by BHIe in SBL */
+	MHI_FW_LOAD_MAX,
+};
+
 enum mhi_ch_state_type {
 	MHI_CH_STATE_TYPE_RESET,
 	MHI_CH_STATE_TYPE_STOP,
-- 
2.34.1

