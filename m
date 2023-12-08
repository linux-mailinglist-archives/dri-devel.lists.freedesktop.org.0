Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDBF80A925
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F2710EAD6;
	Fri,  8 Dec 2023 16:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211EB10EACB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:35:27 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8DAfUm006243; Fri, 8 Dec 2023 16:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=vr+31rPoRzQ/fNw/iknB/PioBSoeOKu/itL5g6Ecv9A=;
 b=E7go9gyHoujQhQV718H6FyCwg2MWyf/u17cA/H/gDp4jZLn5ZtCICDp8Uz3c/pflrK1E
 wKDgvcCByfqLeWGm+LyJk6R1BsxkXPotM8flMCbhMBlZckddmuCMDFInlWg5y8PkEZkV
 /Gd/3/Tzqx/tWR4nsKecslSzUP+S7YoFk1px2jfDMVNKojo64Lqs1KBio3Rxnvqdolra
 DtqapfGkozz8oP6JvV18cbqsm3b4v3XX9M1f9ecnMXNmrS205jGP6lCWo9tS6J0K0CHo
 9WYvtfBGbYdOt+wdeUC428rOGIGmRf6gHigFBVlUjOYfWV2F2SfUQniHYjmJMCBlvYAB xQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuu209h8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 16:35:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GZLQX002131
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 16:35:21 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:35:21 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 6/7] accel/qaic: Leverage DRM managed APIs to release resources
Date: Fri, 8 Dec 2023 09:34:56 -0700
Message-ID: <20231208163457.1295993-7-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4A7Co0SytY4IjgaOyf27JHi9FZdHiuWR
X-Proofpoint-ORIG-GUID: 4A7Co0SytY4IjgaOyf27JHi9FZdHiuWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=961
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080136
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Offload the balancing of init and destroy calls to DRM managed APIs.
mutex destroy for ->cntl_mutex is not called during device release and
destroy workqueue is not called in error path of create_qdev(). So, use
DRM managed APIs to manage the release of resources and avoid such
problems.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic.h     |   1 +
 drivers/accel/qaic/qaic_drv.c | 138 ++++++++++++++++++++++------------
 2 files changed, 89 insertions(+), 50 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 2b3ef588b717..9256653b3036 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -30,6 +30,7 @@
 #define to_qaic_drm_device(dev) container_of(dev, struct qaic_drm_device, drm)
 #define to_drm(qddev) (&(qddev)->drm)
 #define to_accel_kdev(qddev) (to_drm(qddev)->accel->kdev) /* Return Linux device of accel node */
+#define to_qaic_device(dev) (to_qaic_drm_device((dev))->qdev)
 
 enum __packed dev_states {
 	/* Device is offline or will be very soon */
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 2a313eb69b12..10a43d02844f 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -44,6 +44,53 @@ MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
 static bool link_up;
 static DEFINE_IDA(qaic_usrs);
 
+static void qaicm_wq_release(struct drm_device *dev, void *res)
+{
+	struct workqueue_struct *wq = res;
+
+	destroy_workqueue(wq);
+}
+
+static struct workqueue_struct *qaicm_wq_init(struct drm_device *dev, const char *fmt)
+{
+	struct workqueue_struct *wq;
+	int ret;
+
+	wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
+	if (!wq)
+		return ERR_PTR(-ENOMEM);
+	ret = drmm_add_action_or_reset(dev, qaicm_wq_release, wq);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return wq;
+}
+
+static void qaicm_srcu_release(struct drm_device *dev, void *res)
+{
+	struct srcu_struct *lock = res;
+
+	cleanup_srcu_struct(lock);
+}
+
+static int qaicm_srcu_init(struct drm_device *dev, struct srcu_struct *lock)
+{
+	int ret;
+
+	ret = init_srcu_struct(lock);
+	if (ret)
+		return ret;
+
+	return drmm_add_action_or_reset(dev, qaicm_srcu_release, lock);
+}
+
+static void qaicm_pci_release(struct drm_device *dev, void *res)
+{
+	struct qaic_device *qdev = to_qaic_device(dev);
+
+	pci_set_drvdata(qdev->pdev, NULL);
+}
+
 static void free_usr(struct kref *kref)
 {
 	struct qaic_user *usr = container_of(kref, struct qaic_user, ref_count);
@@ -299,74 +346,73 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
 		release_dbc(qdev, i);
 }
 
-static void cleanup_qdev(struct qaic_device *qdev)
-{
-	int i;
-
-	for (i = 0; i < qdev->num_dbc; ++i)
-		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
-	cleanup_srcu_struct(&qdev->dev_lock);
-	pci_set_drvdata(qdev->pdev, NULL);
-	destroy_workqueue(qdev->cntl_wq);
-	destroy_workqueue(qdev->qts_wq);
-}
-
 static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	struct device *dev = &pdev->dev;
 	struct qaic_drm_device *qddev;
 	struct qaic_device *qdev;
-	int i;
+	struct drm_device *drm;
+	int i, ret;
 
-	qdev = devm_kzalloc(&pdev->dev, sizeof(*qdev), GFP_KERNEL);
+	qdev = devm_kzalloc(dev, sizeof(*qdev), GFP_KERNEL);
 	if (!qdev)
 		return NULL;
 
 	qdev->dev_state = QAIC_OFFLINE;
 	if (id->device == PCI_DEV_AIC100) {
 		qdev->num_dbc = 16;
-		qdev->dbc = devm_kcalloc(&pdev->dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
+		qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
 		if (!qdev->dbc)
 			return NULL;
 	}
 
-	qdev->cntl_wq = alloc_workqueue("qaic_cntl", WQ_UNBOUND, 0);
-	if (!qdev->cntl_wq)
+	qddev = devm_drm_dev_alloc(&pdev->dev, &qaic_accel_driver, struct qaic_drm_device, drm);
+	if (IS_ERR(qddev))
+		return NULL;
+
+	drm = to_drm(qddev);
+	pci_set_drvdata(pdev, qdev);
+
+	ret = drmm_mutex_init(drm, &qddev->users_mutex);
+	if (ret)
+		return NULL;
+	ret = drmm_add_action_or_reset(drm, qaicm_pci_release, NULL);
+	if (ret)
+		return NULL;
+	ret = drmm_mutex_init(drm, &qdev->cntl_mutex);
+	if (ret)
 		return NULL;
 
-	qdev->qts_wq = alloc_workqueue("qaic_ts", WQ_UNBOUND, 0);
-	if (!qdev->qts_wq) {
-		destroy_workqueue(qdev->cntl_wq);
+	qdev->cntl_wq = qaicm_wq_init(drm, "qaic_cntl");
+	if (IS_ERR(qdev->cntl_wq))
+		return NULL;
+	qdev->qts_wq = qaicm_wq_init(drm, "qaic_ts");
+	if (IS_ERR(qdev->qts_wq))
 		return NULL;
-	}
 
-	pci_set_drvdata(pdev, qdev);
+	ret = qaicm_srcu_init(drm, &qdev->dev_lock);
+	if (ret)
+		return NULL;
+
+	qdev->qddev = qddev;
 	qdev->pdev = pdev;
+	qddev->qdev = qdev;
 
-	mutex_init(&qdev->cntl_mutex);
 	INIT_LIST_HEAD(&qdev->cntl_xfer_list);
-	init_srcu_struct(&qdev->dev_lock);
+	INIT_LIST_HEAD(&qddev->users);
 
 	for (i = 0; i < qdev->num_dbc; ++i) {
 		spin_lock_init(&qdev->dbc[i].xfer_lock);
 		qdev->dbc[i].qdev = qdev;
 		qdev->dbc[i].id = i;
 		INIT_LIST_HEAD(&qdev->dbc[i].xfer_list);
-		init_srcu_struct(&qdev->dbc[i].ch_lock);
+		ret = qaicm_srcu_init(drm, &qdev->dbc[i].ch_lock);
+		if (ret)
+			return NULL;
 		init_waitqueue_head(&qdev->dbc[i].dbc_release);
 		INIT_LIST_HEAD(&qdev->dbc[i].bo_lists);
 	}
 
-	qddev = devm_drm_dev_alloc(&pdev->dev, &qaic_accel_driver, struct qaic_drm_device, drm);
-	if (IS_ERR(qddev)) {
-		cleanup_qdev(qdev);
-		return NULL;
-	}
-
-	drmm_mutex_init(to_drm(qddev), &qddev->users_mutex);
-	INIT_LIST_HEAD(&qddev->users);
-	qddev->qdev = qdev;
-	qdev->qddev = qddev;
-
 	return qdev;
 }
 
@@ -472,35 +518,28 @@ static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	ret = init_pci(qdev, pdev);
 	if (ret)
-		goto cleanup_qdev;
+		return ret;
 
 	for (i = 0; i < qdev->num_dbc; ++i)
 		qdev->dbc[i].dbc_base = qdev->bar_2 + QAIC_DBC_OFF(i);
 
 	mhi_irq = init_msi(qdev, pdev);
-	if (mhi_irq < 0) {
-		ret = mhi_irq;
-		goto cleanup_qdev;
-	}
+	if (mhi_irq < 0)
+		return mhi_irq;
 
 	ret = qaic_create_drm_device(qdev, QAIC_NO_PARTITION);
 	if (ret)
-		goto cleanup_qdev;
+		return ret;
 
 	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_0, mhi_irq,
 						       qdev->single_msi);
 	if (IS_ERR(qdev->mhi_cntrl)) {
 		ret = PTR_ERR(qdev->mhi_cntrl);
-		goto cleanup_drm_dev;
+		qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
+		return ret;
 	}
 
 	return 0;
-
-cleanup_drm_dev:
-	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
-cleanup_qdev:
-	cleanup_qdev(qdev);
-	return ret;
 }
 
 static void qaic_pci_remove(struct pci_dev *pdev)
@@ -513,7 +552,6 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 	qaic_dev_reset_clean_local_state(qdev);
 	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
 	qaic_mhi_free_controller(qdev->mhi_cntrl, link_up);
-	cleanup_qdev(qdev);
 }
 
 static void qaic_pci_shutdown(struct pci_dev *pdev)
-- 
2.34.1

