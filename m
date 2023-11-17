Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F253D7EF73D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 18:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F4C10E30A;
	Fri, 17 Nov 2023 17:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7888B10E304
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 17:44:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AHGlQCm008402; Fri, 17 Nov 2023 17:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=nKIyfCGMITqyYUApUQgBC7NZS9NjZRI3edXYQQ0akyo=;
 b=IN6fwXVoLtIZi0CtevdYlfiFrgvBjyA9vssN+OYQoq4rlbfLoyhj9rd1m9Mya6XJs+op
 wYOY3iLXuE9nglukoOnyqmMIZpHrWZXREFKvhTxTrkAtG9J0rnS4lGqOcjXyhRQD+xuX
 W3vV2jPKkl0OH1c1pliR8UBdagr/UZpM23sgaDFOf44jMxodmdxby/r4NvDjKDA9dw5c
 mellndzE9np9H4dHAQNzbsdbuZrKE9Zi/+1+q3GBbGyzNUvlxION8g2qtzBOA6PJRDwt
 BQHsfZJvLQFqbKyiui2nDD/VW9lhuzFLrGjb2YqvMpXW/KlJRPvt5K/wa1JBv/wVdXy0 6Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ue5peryd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 17:43:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHHhxZQ026042
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 17:43:59 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 17 Nov 2023 09:43:58 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
Subject: [PATCH 1/2] accel/qaic: Increase number of in_reset states
Date: Fri, 17 Nov 2023 10:43:36 -0700
Message-ID: <20231117174337.20174-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231117174337.20174-1-quic_jhugo@quicinc.com>
References: <20231117174337.20174-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QQ7k_G5ejnSj657X57xJWf8rbz_weARA
X-Proofpoint-ORIG-GUID: QQ7k_G5ejnSj657X57xJWf8rbz_weARA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_16,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311170133
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

From: Carl Vanderlip <quic_carlv@quicinc.com>

'in_reset' holds the state of the device. As part of bringup, the device
needs to be queried to check if it's in a valid state. Add a new state
that indicates that the device is coming up, but not ready for users
yet. Rename to 'reset_state' to better describe the variable.

Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic.h         | 13 +++++++++++--
 drivers/accel/qaic/qaic_control.c |  5 +++--
 drivers/accel/qaic/qaic_data.c    | 16 ++++++++--------
 drivers/accel/qaic/qaic_drv.c     | 12 ++++++------
 4 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index bc40d52dc010..bd0c884e6bf7 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -31,6 +31,15 @@
 #define to_drm(qddev) (&(qddev)->drm)
 #define to_accel_kdev(qddev) (to_drm(qddev)->accel->kdev) /* Return Linux device of accel node */
 
+enum __packed reset_states {
+	/* Device is offline or will be very soon */
+	QAIC_OFFLINE,
+	/* Device is booting, not clear if it's in a usable state */
+	QAIC_BOOT,
+	/* Device is fully operational */
+	QAIC_ONLINE,
+};
+
 extern bool datapath_polling;
 
 struct qaic_user {
@@ -121,8 +130,8 @@ struct qaic_device {
 	struct workqueue_struct	*cntl_wq;
 	/* Synchronizes all the users of device during cleanup */
 	struct srcu_struct	dev_lock;
-	/* true: Device under reset; false: Device not under reset */
-	bool			in_reset;
+	/* Track the state of the device during resets */
+	enum reset_states	reset_state;
 	/* true: single MSI is used to operate device */
 	bool			single_msi;
 	/*
diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 84915824be54..0701d2deee08 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -1022,7 +1022,8 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
 	int xfer_count = 0;
 	int retry_count;
 
-	if (qdev->in_reset) {
+	/* Allow QAIC_BOOT state since we need to check control protocol version */
+	if (qdev->reset_state == QAIC_OFFLINE) {
 		mutex_unlock(&qdev->cntl_mutex);
 		return ERR_PTR(-ENODEV);
 	}
@@ -1306,7 +1307,7 @@ int qaic_manage_ioctl(struct drm_device *dev, void *data, struct drm_file *file_
 	qdev = usr->qddev->qdev;
 
 	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
-	if (qdev->in_reset) {
+	if (qdev->reset_state != QAIC_ONLINE) {
 		srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
 		srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
 		return -ENODEV;
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 8da81768f2ab..28643a47c405 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -690,7 +690,7 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 
 	qdev = usr->qddev->qdev;
 	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
-	if (qdev->in_reset) {
+	if (qdev->reset_state != QAIC_ONLINE) {
 		ret = -ENODEV;
 		goto unlock_dev_srcu;
 	}
@@ -749,7 +749,7 @@ int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 
 	qdev = usr->qddev->qdev;
 	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
-	if (qdev->in_reset) {
+	if (qdev->reset_state != QAIC_ONLINE) {
 		ret = -ENODEV;
 		goto unlock_dev_srcu;
 	}
@@ -970,7 +970,7 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 
 	qdev = usr->qddev->qdev;
 	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
-	if (qdev->in_reset) {
+	if (qdev->reset_state != QAIC_ONLINE) {
 		ret = -ENODEV;
 		goto unlock_dev_srcu;
 	}
@@ -1341,7 +1341,7 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 
 	qdev = usr->qddev->qdev;
 	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
-	if (qdev->in_reset) {
+	if (qdev->reset_state != QAIC_ONLINE) {
 		ret = -ENODEV;
 		goto unlock_dev_srcu;
 	}
@@ -1497,7 +1497,7 @@ void irq_polling_work(struct work_struct *work)
 	rcu_id = srcu_read_lock(&dbc->ch_lock);
 
 	while (1) {
-		if (dbc->qdev->in_reset) {
+		if (dbc->qdev->reset_state != QAIC_ONLINE) {
 			srcu_read_unlock(&dbc->ch_lock, rcu_id);
 			return;
 		}
@@ -1687,7 +1687,7 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 
 	qdev = usr->qddev->qdev;
 	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
-	if (qdev->in_reset) {
+	if (qdev->reset_state != QAIC_ONLINE) {
 		ret = -ENODEV;
 		goto unlock_dev_srcu;
 	}
@@ -1756,7 +1756,7 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 
 	qdev = usr->qddev->qdev;
 	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
-	if (qdev->in_reset) {
+	if (qdev->reset_state != QAIC_ONLINE) {
 		ret = -ENODEV;
 		goto unlock_dev_srcu;
 	}
@@ -1847,7 +1847,7 @@ int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 
 	qdev = usr->qddev->qdev;
 	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
-	if (qdev->in_reset) {
+	if (qdev->reset_state != QAIC_ONLINE) {
 		ret = -ENODEV;
 		goto unlock_dev_srcu;
 	}
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index b12226385003..02fe23248da4 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -64,7 +64,7 @@ static int qaic_open(struct drm_device *dev, struct drm_file *file)
 	int ret;
 
 	rcu_id = srcu_read_lock(&qdev->dev_lock);
-	if (qdev->in_reset) {
+	if (qdev->reset_state != QAIC_ONLINE) {
 		ret = -ENODEV;
 		goto dev_unlock;
 	}
@@ -121,7 +121,7 @@ static void qaic_postclose(struct drm_device *dev, struct drm_file *file)
 	if (qddev) {
 		qdev = qddev->qdev;
 		qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
-		if (!qdev->in_reset) {
+		if (qdev->reset_state == QAIC_ONLINE) {
 			qaic_release_usr(qdev, usr);
 			for (i = 0; i < qdev->num_dbc; ++i)
 				if (qdev->dbc[i].usr && qdev->dbc[i].usr->handle == usr->handle)
@@ -254,7 +254,7 @@ static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 
 	qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
 
-	qdev->in_reset = false;
+	qdev->reset_state = QAIC_ONLINE;
 
 	dev_set_drvdata(&mhi_dev->dev, qdev);
 	qdev->cntl_ch = mhi_dev;
@@ -291,7 +291,7 @@ static void qaic_notify_reset(struct qaic_device *qdev)
 {
 	int i;
 
-	qdev->in_reset = true;
+	qdev->reset_state = QAIC_OFFLINE;
 	/* wake up any waiters to avoid waiting for timeouts at sync */
 	wake_all_cntl(qdev);
 	for (i = 0; i < qdev->num_dbc; ++i)
@@ -313,7 +313,7 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exit_reset)
 		release_dbc(qdev, i);
 
 	if (exit_reset)
-		qdev->in_reset = false;
+		qdev->reset_state = QAIC_ONLINE;
 }
 
 static void cleanup_qdev(struct qaic_device *qdev)
@@ -550,7 +550,7 @@ static void qaic_pci_reset_done(struct pci_dev *pdev)
 {
 	struct qaic_device *qdev = pci_get_drvdata(pdev);
 
-	qdev->in_reset = false;
+	qdev->reset_state = QAIC_ONLINE;
 	qaic_mhi_reset_done(qdev->mhi_cntrl);
 }
 
-- 
2.40.1

