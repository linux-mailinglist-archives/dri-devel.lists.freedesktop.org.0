Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE86DA15561
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 18:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C6D10EB4A;
	Fri, 17 Jan 2025 17:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cL8VmNlU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36F110EB4A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 17:10:15 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HC8wmr006852;
 Fri, 17 Jan 2025 17:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pPCHzNT7mG9/O/KEgDQI4DgnYBNnX/j0cy57RiLjz2E=; b=cL8VmNlUIIe7Pt6x
 mJwrfw9gh9/w4dkTiqcPMpD4dzceFYWRBXmOd09plnB4Ir4D/IGWH3+anU36LmFX
 d8zg9m51l31Q5SzpVazyQmkX8GBR8P7vFC3RFJJTlCQgtow4Vzfo2YTSrtvFuSBa
 B1yoJLifWo4k257CRu3KhAxzHiQbhS/jKlLypJbjtBBwvQILgb6TDdLyYTRgsjKr
 2eqKQRQ2hMidJlxbMPIEdmKPQ221LGUe6nygsUWw8P3h13fG4JdUMsrrE4mNaub1
 JGE7lthQcdqjQ5UUg/1kR7FmlNXB+ARLuAKaKOQFyDw+rUn6wOdo8XXdjrrIBz9P
 8N0Scw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447py0grcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2025 17:10:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HHA8MZ002064
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2025 17:10:08 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 17 Jan 2025 09:10:07 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
 <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
 <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
Subject: [PATCH v2 6/7] accel/qaic: Add config structs for supported cards
Date: Fri, 17 Jan 2025 10:09:42 -0700
Message-ID: <20250117170943.2643280-7-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: PdQZ-vXoFUHokHY2A2bQQJTN-FWlPY6s
X-Proofpoint-GUID: PdQZ-vXoFUHokHY2A2bQQJTN-FWlPY6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

As the number of cards supported by the driver grows, their
configurations will differ. The driver needs to become more dynamic
to support these configurations. Currently, each card may differ in
the exposed BARs, the regions they map to, and the family.

Create config structs for each card, and let the driver configure the
qaic_device struct based on the configurations passed to the driver.

Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/qaic/qaic.h          | 13 +++--
 drivers/accel/qaic/qaic_drv.c      | 76 ++++++++++++++++++++----------
 drivers/accel/qaic/qaic_timesync.c |  2 +-
 3 files changed, 61 insertions(+), 30 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 02561b6cecc6..cf97fd9a7e70 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -32,6 +32,11 @@
 #define to_accel_kdev(qddev) (to_drm(qddev)->accel->kdev) /* Return Linux device of accel node */
 #define to_qaic_device(dev) (to_qaic_drm_device((dev))->qdev)
 
+enum aic_families {
+	FAMILY_AIC100,
+	FAMILY_MAX,
+};
+
 enum __packed dev_states {
 	/* Device is offline or will be very soon */
 	QAIC_OFFLINE,
@@ -113,10 +118,10 @@ struct qaic_device {
 	struct pci_dev		*pdev;
 	/* Req. ID of request that will be queued next in MHI control device */
 	u32			next_seq_num;
-	/* Base address of bar 0 */
-	void __iomem		*bar_0;
-	/* Base address of bar 2 */
-	void __iomem		*bar_2;
+	/* Base address of the MHI bar */
+	void __iomem		*bar_mhi;
+	/* Base address of the DBCs bar */
+	void __iomem		*bar_dbc;
 	/* Controller structure for MHI devices */
 	struct mhi_controller	*mhi_cntrl;
 	/* MHI control channel device */
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 00fa07aebacd..4e63e475b389 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -34,13 +34,38 @@
 
 MODULE_IMPORT_NS("DMA_BUF");
 
-#define PCI_DEV_AIC080			0xa080
-#define PCI_DEV_AIC100			0xa100
+#define PCI_DEVICE_ID_QCOM_AIC080	0xa080
+#define PCI_DEVICE_ID_QCOM_AIC100	0xa100
 #define QAIC_NAME			"qaic"
 #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
 #define CNTL_MAJOR			5
 #define CNTL_MINOR			0
 
+struct qaic_device_config {
+	/* Indicates the AIC family the device belongs to */
+	int family;
+	/* A bitmask representing the available BARs */
+	int bar_mask;
+	/* An index value used to identify the MHI controller BAR */
+	unsigned int mhi_bar_idx;
+	/* An index value used to identify the DBCs BAR */
+	unsigned int dbc_bar_idx;
+};
+
+static const struct qaic_device_config aic080_config = {
+	.family = FAMILY_AIC100,
+	.bar_mask = BIT(0) | BIT(2) | BIT(4),
+	.mhi_bar_idx = 0,
+	.dbc_bar_idx = 2,
+};
+
+static const struct qaic_device_config aic100_config = {
+	.family = FAMILY_AIC100,
+	.bar_mask = BIT(0) | BIT(2) | BIT(4),
+	.mhi_bar_idx = 0,
+	.dbc_bar_idx = 2,
+};
+
 bool datapath_polling;
 module_param(datapath_polling, bool, 0400);
 MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
@@ -352,7 +377,8 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
 		release_dbc(qdev, i);
 }
 
-static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_device_id *id)
+static struct qaic_device *create_qdev(struct pci_dev *pdev,
+				       const struct qaic_device_config *config)
 {
 	struct device *dev = &pdev->dev;
 	struct qaic_drm_device *qddev;
@@ -365,12 +391,10 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
 		return NULL;
 
 	qdev->dev_state = QAIC_OFFLINE;
-	if (id->device == PCI_DEV_AIC080 || id->device == PCI_DEV_AIC100) {
-		qdev->num_dbc = 16;
-		qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
-		if (!qdev->dbc)
-			return NULL;
-	}
+	qdev->num_dbc = 16;
+	qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
+	if (!qdev->dbc)
+		return NULL;
 
 	qddev = devm_drm_dev_alloc(&pdev->dev, &qaic_accel_driver, struct qaic_drm_device, drm);
 	if (IS_ERR(qddev))
@@ -426,7 +450,8 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
 	return qdev;
 }
 
-static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
+static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev,
+		    const struct qaic_device_config *config)
 {
 	int bars;
 	int ret;
@@ -434,9 +459,9 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
 	bars = pci_select_bars(pdev, IORESOURCE_MEM) & 0x3f;
 
 	/* make sure the device has the expected BARs */
-	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
-		pci_dbg(pdev, "%s: expected BARs 0, 2, and 4 not found in device. Found 0x%x\n",
-			__func__, bars);
+	if (bars != config->bar_mask) {
+		pci_dbg(pdev, "%s: expected BARs %#x not found in device. Found %#x\n",
+			__func__, config->bar_mask, bars);
 		return -EINVAL;
 	}
 
@@ -449,13 +474,13 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
 		return ret;
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
 
-	qdev->bar_0 = devm_ioremap_resource(&pdev->dev, &pdev->resource[0]);
-	if (IS_ERR(qdev->bar_0))
-		return PTR_ERR(qdev->bar_0);
+	qdev->bar_mhi = devm_ioremap_resource(&pdev->dev, &pdev->resource[config->mhi_bar_idx]);
+	if (IS_ERR(qdev->bar_mhi))
+		return PTR_ERR(qdev->bar_mhi);
 
-	qdev->bar_2 = devm_ioremap_resource(&pdev->dev, &pdev->resource[2]);
-	if (IS_ERR(qdev->bar_2))
-		return PTR_ERR(qdev->bar_2);
+	qdev->bar_dbc = devm_ioremap_resource(&pdev->dev, &pdev->resource[config->dbc_bar_idx]);
+	if (IS_ERR(qdev->bar_dbc))
+		return PTR_ERR(qdev->bar_dbc);
 
 	/* Managed release since we use pcim_enable_device above */
 	pci_set_master(pdev);
@@ -517,21 +542,22 @@ static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
 
 static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	struct qaic_device_config *config = (struct qaic_device_config *)id->driver_data;
 	struct qaic_device *qdev;
 	int mhi_irq;
 	int ret;
 	int i;
 
-	qdev = create_qdev(pdev, id);
+	qdev = create_qdev(pdev, config);
 	if (!qdev)
 		return -ENOMEM;
 
-	ret = init_pci(qdev, pdev);
+	ret = init_pci(qdev, pdev, config);
 	if (ret)
 		return ret;
 
 	for (i = 0; i < qdev->num_dbc; ++i)
-		qdev->dbc[i].dbc_base = qdev->bar_2 + QAIC_DBC_OFF(i);
+		qdev->dbc[i].dbc_base = qdev->bar_dbc + QAIC_DBC_OFF(i);
 
 	mhi_irq = init_msi(qdev, pdev);
 	if (mhi_irq < 0)
@@ -541,7 +567,7 @@ static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_0, mhi_irq,
+	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_mhi, mhi_irq,
 						       qdev->single_msi);
 	if (IS_ERR(qdev->mhi_cntrl)) {
 		ret = PTR_ERR(qdev->mhi_cntrl);
@@ -609,8 +635,8 @@ static struct mhi_driver qaic_mhi_driver = {
 };
 
 static const struct pci_device_id qaic_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC080), },
-	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
+	{ PCI_DEVICE_DATA(QCOM, AIC080, (kernel_ulong_t)&aic080_config), },
+	{ PCI_DEVICE_DATA(QCOM, AIC100, (kernel_ulong_t)&aic100_config), },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, qaic_ids);
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 301f4462d51b..2473c66309d4 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -201,7 +201,7 @@ static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_devi
 		goto free_sync_msg;
 
 	/* Qtimer register pointer */
-	mqtsdev->qtimer_addr = qdev->bar_0 + QTIMER_REG_OFFSET;
+	mqtsdev->qtimer_addr = qdev->bar_mhi + QTIMER_REG_OFFSET;
 	timer_setup(timer, qaic_timesync_timer, 0);
 	timer->expires = jiffies + msecs_to_jiffies(timesync_delay_ms);
 	add_timer(timer);
-- 
2.34.1

