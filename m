Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6607CB0E0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 19:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E7410E235;
	Mon, 16 Oct 2023 17:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE1910E236
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 17:01:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39GCvVxK000688; Mon, 16 Oct 2023 17:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Ikpmv8XMkxaZhQ029tgFjYHr7NyJv24F3tc5j5v41k4=;
 b=kdM2KQYtJs7MyEB4QFvZqcZNUNSr0/nTHHG/TDhqKQR1Cx9psO/DnPrfRXHoLKY9FLUt
 PGxTdYLLeaXkZjAeqlqmVQ+3Ylq+wCV7kJKL7i1syzsGlbRlTEaluD8jSddAZEazCMti
 M2HsTjRJDNKZpsjMy5P4pzo7xm4mn5zz2Lyp/4jzKJ/bvxkS/ZT3q4g9QrymRT+qDDWv
 7OUE+tZtfMfb5RaObziuueiLIAGw9mbOQtG89fV3w9B8JRTFk/7UaGFaku+Y1ipqivLF
 blNKnFh3azgbDokInzERpr1GoHZ/uq1hjdv73VLmbChZ4Oppm/CiTLdMu1uqrOITvT1X CA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ts49w8uh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Oct 2023 17:01:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39GH1ZBw006509
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Oct 2023 17:01:35 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 16 Oct 2023 10:01:35 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_ajitpals@quicinc.com>, <quic_carlv@quicinc.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <ogabbay@kernel.org>
Subject: [PATCH v2 2/2] accel/qaic: Support MHI QAIC_TIMESYNC channel
Date: Mon, 16 Oct 2023 11:01:14 -0600
Message-ID: <20231016170114.5446-3-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231016170114.5446-1-quic_jhugo@quicinc.com>
References: <20231016170114.5446-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: b-7O3WAJuJgwHSWiLnu5f_sowyqIhRok
X-Proofpoint-ORIG-GUID: b-7O3WAJuJgwHSWiLnu5f_sowyqIhRok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_10,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310160148
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
Cc: linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Use QAIC_TIMESYNC MHI channel to send UTC time to device in SBL
environment. Remove support for QAIC_TIMESYNC MHI channel in AMSS
environment as it is not used in that environment.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 Documentation/accel/qaic/aic100.rst |   2 +-
 drivers/accel/qaic/mhi_controller.c |   4 +-
 drivers/accel/qaic/qaic.h           |   4 +
 drivers/accel/qaic/qaic_drv.c       |   7 ++
 drivers/accel/qaic/qaic_timesync.c  | 154 +++++++++++++++++++++++++++-
 5 files changed, 166 insertions(+), 5 deletions(-)

diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
index 78f6a4cbcc42..17f7b3551608 100644
--- a/Documentation/accel/qaic/aic100.rst
+++ b/Documentation/accel/qaic/aic100.rst
@@ -220,7 +220,7 @@ of the defined channels, and their uses.
 +----------------+---------+----------+----------------------------------------+
 | QAIC_DEBUG     | 18 & 19 | AMSS     | Not used.                              |
 +----------------+---------+----------+----------------------------------------+
-| QAIC_TIMESYNC  | 20 & 21 | SBL/AMSS | Used to synchronize timestamps in the  |
+| QAIC_TIMESYNC  | 20 & 21 | SBL      | Used to synchronize timestamps in the  |
 |                |         |          | device side logs with the host time    |
 |                |         |          | source.                                |
 +----------------+---------+----------+----------------------------------------+
diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index bea428e6d2e9..2ca52de2b184 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -348,7 +348,7 @@ static struct mhi_channel_config aic100_channels[] = {
 		.local_elements = 0,
 		.event_ring = 0,
 		.dir = DMA_TO_DEVICE,
-		.ee_mask = MHI_CH_EE_SBL | MHI_CH_EE_AMSS,
+		.ee_mask = MHI_CH_EE_SBL,
 		.pollcfg = 0,
 		.doorbell = MHI_DB_BRST_DISABLE,
 		.lpm_notify = false,
@@ -364,7 +364,7 @@ static struct mhi_channel_config aic100_channels[] = {
 		.local_elements = 0,
 		.event_ring = 0,
 		.dir = DMA_FROM_DEVICE,
-		.ee_mask = MHI_CH_EE_SBL | MHI_CH_EE_AMSS,
+		.ee_mask = MHI_CH_EE_SBL,
 		.pollcfg = 0,
 		.doorbell = MHI_DB_BRST_DISABLE,
 		.lpm_notify = false,
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index e3f4c30f3ffd..2f42de3ae9be 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -137,6 +137,10 @@ struct qaic_device {
 	u32 (*gen_crc)(void *msg);
 	/* Validate the CRC of a control message */
 	bool (*valid_crc)(void *msg);
+	/* MHI "QAIC_TIMESYNC" channel device */
+	struct mhi_device	*qts_ch;
+	/* Work queue for tasks related to MHI "QAIC_TIMESYNC" channel */
+	struct workqueue_struct	*qts_wq;
 };
 
 struct qaic_drm_device {
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 4f449ea7eb2f..4d3585a711ca 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -325,6 +325,7 @@ static void cleanup_qdev(struct qaic_device *qdev)
 	cleanup_srcu_struct(&qdev->dev_lock);
 	pci_set_drvdata(qdev->pdev, NULL);
 	destroy_workqueue(qdev->cntl_wq);
+	destroy_workqueue(qdev->qts_wq);
 }
 
 static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_device_id *id)
@@ -348,6 +349,12 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
 	if (!qdev->cntl_wq)
 		return NULL;
 
+	qdev->qts_wq = alloc_workqueue("qaic_ts", WQ_UNBOUND, 0);
+	if (!qdev->qts_wq) {
+		destroy_workqueue(qdev->cntl_wq);
+		return NULL;
+	}
+
 	pci_set_drvdata(pdev, qdev);
 	qdev->pdev = pdev;
 
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 769250272c21..301f4462d51b 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -22,7 +22,8 @@ module_param(timesync_delay_ms, uint, 0600);
 MODULE_PARM_DESC(timesync_delay_ms, "Delay in ms between two consecutive timesync operations");
 
 enum qts_msg_type {
-	QAIC_TS_SYNC_REQ = 1,
+	QAIC_TS_CMD_TO_HOST,
+	QAIC_TS_SYNC_REQ,
 	QAIC_TS_ACK_TO_HOST,
 	QAIC_TS_MSG_TYPE_MAX
 };
@@ -83,6 +84,16 @@ struct mqts_dev {
 	struct qts_host_time_sync_msg_data *sync_msg;
 };
 
+struct qts_resp_msg {
+	struct qts_hdr	hdr;
+} __packed;
+
+struct qts_resp {
+	struct qts_resp_msg	data;
+	struct work_struct	work;
+	struct qaic_device	*qdev;
+};
+
 #ifdef readq
 static u64 read_qtimer(const volatile void __iomem *addr)
 {
@@ -234,12 +245,151 @@ static struct mhi_driver qaic_timesync_driver = {
 	},
 };
 
+static void qaic_boot_timesync_worker(struct work_struct *work)
+{
+	struct qts_resp *resp = container_of(work, struct qts_resp, work);
+	struct qts_host_time_sync_msg_data *req;
+	struct qts_resp_msg data = resp->data;
+	struct qaic_device *qdev = resp->qdev;
+	struct mhi_device *mhi_dev;
+	struct timespec64 ts;
+	int ret;
+
+	mhi_dev = qdev->qts_ch;
+	/* Queue the response message beforehand to avoid race conditions */
+	ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, &resp->data, sizeof(resp->data), MHI_EOT);
+	if (ret) {
+		kfree(resp);
+		dev_warn(&mhi_dev->dev, "Failed to re-queue response buffer %d\n", ret);
+		return;
+	}
+
+	switch (data.hdr.msg_type) {
+	case QAIC_TS_CMD_TO_HOST:
+		req = kzalloc(sizeof(*req), GFP_KERNEL);
+		if (!req)
+			break;
+
+		req->header = data.hdr;
+		req->header.msg_type = QAIC_TS_SYNC_REQ;
+		ktime_get_real_ts64(&ts);
+		req->data.tv_sec = cpu_to_le64(ts.tv_sec);
+		req->data.tv_usec = cpu_to_le64(div_u64(ts.tv_nsec, NSEC_PER_USEC));
+
+		ret = mhi_queue_buf(mhi_dev, DMA_TO_DEVICE, req, sizeof(*req), MHI_EOT);
+		if (ret) {
+			kfree(req);
+			dev_dbg(&mhi_dev->dev, "Failed to send request message. Error %d\n", ret);
+		}
+		break;
+	case QAIC_TS_ACK_TO_HOST:
+		dev_dbg(&mhi_dev->dev, "ACK received from device\n");
+		break;
+	default:
+		dev_err(&mhi_dev->dev, "Invalid message type %u.\n", data.hdr.msg_type);
+	}
+}
+
+static int qaic_boot_timesync_queue_resp(struct mhi_device *mhi_dev, struct qaic_device *qdev)
+{
+	struct qts_resp *resp;
+	int ret;
+
+	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	resp->qdev = qdev;
+	INIT_WORK(&resp->work, qaic_boot_timesync_worker);
+
+	ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, &resp->data, sizeof(resp->data), MHI_EOT);
+	if (ret) {
+		kfree(resp);
+		dev_warn(&mhi_dev->dev, "Failed to queue response buffer %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void qaic_boot_timesync_remove(struct mhi_device *mhi_dev)
+{
+	struct qaic_device *qdev;
+
+	qdev = dev_get_drvdata(&mhi_dev->dev);
+	mhi_unprepare_from_transfer(qdev->qts_ch);
+	qdev->qts_ch = NULL;
+}
+
+static int qaic_boot_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
+	int ret;
+
+	ret = mhi_prepare_for_transfer(mhi_dev);
+	if (ret)
+		return ret;
+
+	qdev->qts_ch = mhi_dev;
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+
+	ret = qaic_boot_timesync_queue_resp(mhi_dev, qdev);
+	if (ret) {
+		dev_set_drvdata(&mhi_dev->dev, NULL);
+		qdev->qts_ch = NULL;
+		mhi_unprepare_from_transfer(mhi_dev);
+	}
+
+	return ret;
+}
+
+static void qaic_boot_timesync_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
+{
+	kfree(mhi_result->buf_addr);
+}
+
+static void qaic_boot_timesync_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
+{
+	struct qts_resp *resp = container_of(mhi_result->buf_addr, struct qts_resp, data);
+
+	if (mhi_result->transaction_status || mhi_result->bytes_xferd != sizeof(resp->data)) {
+		kfree(resp);
+		return;
+	}
+
+	queue_work(resp->qdev->qts_wq, &resp->work);
+}
+
+static const struct mhi_device_id qaic_boot_timesync_match_table[] = {
+	{ .chan = "QAIC_TIMESYNC"},
+	{},
+};
+
+static struct mhi_driver qaic_boot_timesync_driver = {
+	.id_table = qaic_boot_timesync_match_table,
+	.remove = qaic_boot_timesync_remove,
+	.probe = qaic_boot_timesync_probe,
+	.ul_xfer_cb = qaic_boot_timesync_ul_xfer_cb,
+	.dl_xfer_cb = qaic_boot_timesync_dl_xfer_cb,
+	.driver = {
+		.name = "qaic_timesync",
+	},
+};
+
 int qaic_timesync_init(void)
 {
-	return mhi_driver_register(&qaic_timesync_driver);
+	int ret;
+
+	ret = mhi_driver_register(&qaic_timesync_driver);
+	if (ret)
+		return ret;
+	ret = mhi_driver_register(&qaic_boot_timesync_driver);
+
+	return ret;
 }
 
 void qaic_timesync_deinit(void)
 {
+	mhi_driver_unregister(&qaic_boot_timesync_driver);
 	mhi_driver_unregister(&qaic_timesync_driver);
 }
-- 
2.40.1

