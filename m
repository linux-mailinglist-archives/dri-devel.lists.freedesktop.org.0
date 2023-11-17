Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892567EF739
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 18:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6444810E304;
	Fri, 17 Nov 2023 17:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5F710E304
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 17:44:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AHDJmsS013373; Fri, 17 Nov 2023 17:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=3Cc9Nvt7xGHl8gijHv9xk4gQ4ypw/PrNNVLESGzR4BU=;
 b=N4cntGZW0z0ePHd9VRKRLfSSCr1520S7EcJEW6NCZHFQzQuyjEJX4CcaECxf7K3OGQBU
 mhtxhIHEF+TuojzmRgbCdm4tLT45uRrtqp62cojsMDMqk4QeGXNqLdd6/ikSu9fgHMbz
 CvtCeetamCu/ByRXHA7tSadWk1s86cjTVjpTfdPzttDvnl85SrDZOKKc65MR4WeG5UcN
 wOhwAGvLXhmxKLQQQx33o4febQa9EOAcPgUDsHeMZj5d8bW0rxypLQzquHI9q0TXMgge
 K03XFdpbz8Ox0Zv+mm+zH0KnGSLQNL+88rax1PMmII6to6QySCs+zSZgEK5fEhmX7igW fQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udt8btbad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 17:44:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHHi03K021474
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 17:44:00 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 17 Nov 2023 09:44:00 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
Subject: [PATCH 2/2] accel/qaic: Expand DRM device lifecycle
Date: Fri, 17 Nov 2023 10:43:37 -0700
Message-ID: <20231117174337.20174-3-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: PS1XyWpoemu5YUnuncnmJWC2y26JS0hT
X-Proofpoint-GUID: PS1XyWpoemu5YUnuncnmJWC2y26JS0hT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_16,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=951 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
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

Currently the QAIC DRM device registers itself when the MHI QAIC_CONTROL
channel becomes available. This is when the device is able to process
workloads. However, the DRM driver also provides the debugfs interface
bootlog for the device. If the device fails to boot to the QSM (which
brings up the MHI QAIC_CONTROL channel), the bootlog won't be available for
debugging why it failed to boot.

Change when the DRM device registers itself from when QAIC_CONTROL is
available to when the card is first probed on the PCI bus. Additionally,
make the DRM driver persist through reset/error cases so the driver
doesn't have to be reloaded to access the card again. Send
KOBJ_ONLINE/OFFLINE uevents so userspace can know when DRM device is
ready to handle requests.

Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 Documentation/accel/qaic/qaic.rst   |  9 +++++-
 drivers/accel/qaic/mhi_controller.c |  2 +-
 drivers/accel/qaic/qaic.h           |  2 +-
 drivers/accel/qaic/qaic_drv.c       | 44 +++++++++++------------------
 4 files changed, 27 insertions(+), 30 deletions(-)

diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index f81020736ebf..efb7771273bb 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -93,8 +93,15 @@ commands (does not impact QAIC).
 uAPI
 ====
 
+QAIC creates an accel device per phsyical PCIe device. This accel device exists
+for as long as the PCIe device is known to Linux.
+
+The PCIe device may not be in the state to accept requests from userspace at
+all times. QAIC will trigger KOBJ_ONLINE/OFFLINE uevents to advertise when the
+device can accept requests (ONLINE) and when the device is no longer accepting
+requests (OFFLINE) because of a reset or other state transition.
+
 QAIC defines a number of driver specific IOCTLs as part of the userspace API.
-This section describes those APIs.
 
 DRM_IOCTL_QAIC_MANAGE
   This IOCTL allows userspace to send a NNC request to the QSM. The call will
diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 5d3cc30009cc..832464f2833a 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -469,7 +469,7 @@ static void mhi_status_cb(struct mhi_controller *mhi_cntrl, enum mhi_callback re
 		pci_err(qdev->pdev, "Fatal error received from device. Attempting to recover\n");
 	/* this event occurs in non-atomic context */
 	if (reason == MHI_CB_SYS_ERROR)
-		qaic_dev_reset_clean_local_state(qdev, true);
+		qaic_dev_reset_clean_local_state(qdev);
 }
 
 static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntrl)
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index bd0c884e6bf7..66f4abf6c4c4 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -283,7 +283,7 @@ void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
 void release_dbc(struct qaic_device *qdev, u32 dbc_id);
 
 void wake_all_cntl(struct qaic_device *qdev);
-void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exit_reset);
+void qaic_dev_reset_clean_local_state(struct qaic_device *qdev);
 
 struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
 
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 02fe23248da4..c19bc83b249c 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -8,6 +8,7 @@
 #include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/list.h>
+#include <linux/kobject.h>
 #include <linux/kref.h>
 #include <linux/mhi.h>
 #include <linux/module.h>
@@ -43,9 +44,6 @@ MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
 static bool link_up;
 static DEFINE_IDA(qaic_usrs);
 
-static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id);
-static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id);
-
 static void free_usr(struct kref *kref)
 {
 	struct qaic_user *usr = container_of(kref, struct qaic_user, ref_count);
@@ -183,13 +181,6 @@ static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id)
 
 	qddev->partition_id = partition_id;
 
-	/*
-	 * drm_dev_unregister() sets the driver data to NULL and
-	 * drm_dev_register() does not update the driver data. During a SOC
-	 * reset drm dev is unregistered and registered again leaving the
-	 * driver data to NULL.
-	 */
-	dev_set_drvdata(to_accel_kdev(qddev), drm->accel);
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		pci_dbg(qdev->pdev, "drm_dev_register failed %d\n", ret);
@@ -203,7 +194,6 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 	struct drm_device *drm = to_drm(qddev);
 	struct qaic_user *usr;
 
-	drm_dev_get(drm);
 	drm_dev_unregister(drm);
 	qddev->partition_id = 0;
 	/*
@@ -232,7 +222,6 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 		mutex_lock(&qddev->users_mutex);
 	}
 	mutex_unlock(&qddev->users_mutex);
-	drm_dev_put(drm);
 }
 
 static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
@@ -254,8 +243,6 @@ static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 
 	qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
 
-	qdev->reset_state = QAIC_ONLINE;
-
 	dev_set_drvdata(&mhi_dev->dev, qdev);
 	qdev->cntl_ch = mhi_dev;
 
@@ -265,6 +252,7 @@ static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 		return ret;
 	}
 
+	qdev->reset_state = QAIC_BOOT;
 	ret = get_cntl_version(qdev, NULL, &major, &minor);
 	if (ret || major != CNTL_MAJOR || minor > CNTL_MINOR) {
 		pci_err(qdev->pdev, "%s: Control protocol version (%d.%d) not supported. Supported version is (%d.%d). Ret: %d\n",
@@ -272,8 +260,8 @@ static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 		ret = -EINVAL;
 		goto close_control;
 	}
-
-	ret = qaic_create_drm_device(qdev, QAIC_NO_PARTITION);
+	qdev->reset_state = QAIC_ONLINE;
+	kobject_uevent(&(to_accel_kdev(qdev->qddev))->kobj, KOBJ_ONLINE);
 
 	return ret;
 
@@ -291,6 +279,7 @@ static void qaic_notify_reset(struct qaic_device *qdev)
 {
 	int i;
 
+	kobject_uevent(&(to_accel_kdev(qdev->qddev))->kobj, KOBJ_OFFLINE);
 	qdev->reset_state = QAIC_OFFLINE;
 	/* wake up any waiters to avoid waiting for timeouts at sync */
 	wake_all_cntl(qdev);
@@ -299,21 +288,15 @@ static void qaic_notify_reset(struct qaic_device *qdev)
 	synchronize_srcu(&qdev->dev_lock);
 }
 
-void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exit_reset)
+void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
 {
 	int i;
 
 	qaic_notify_reset(qdev);
 
-	/* remove drmdevs to prevent new users from coming in */
-	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
-
 	/* start tearing things down */
 	for (i = 0; i < qdev->num_dbc; ++i)
 		release_dbc(qdev, i);
-
-	if (exit_reset)
-		qdev->reset_state = QAIC_ONLINE;
 }
 
 static void cleanup_qdev(struct qaic_device *qdev)
@@ -338,6 +321,7 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
 	if (!qdev)
 		return NULL;
 
+	qdev->reset_state = QAIC_OFFLINE;
 	if (id->device == PCI_DEV_AIC100) {
 		qdev->num_dbc = 16;
 		qdev->dbc = devm_kcalloc(&pdev->dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
@@ -499,15 +483,21 @@ static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto cleanup_qdev;
 	}
 
+	ret = qaic_create_drm_device(qdev, QAIC_NO_PARTITION);
+	if (ret)
+		goto cleanup_qdev;
+
 	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_0, mhi_irq,
 						       qdev->single_msi);
 	if (IS_ERR(qdev->mhi_cntrl)) {
 		ret = PTR_ERR(qdev->mhi_cntrl);
-		goto cleanup_qdev;
+		goto cleanup_drm_dev;
 	}
 
 	return 0;
 
+cleanup_drm_dev:
+	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
 cleanup_qdev:
 	cleanup_qdev(qdev);
 	return ret;
@@ -520,7 +510,8 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 	if (!qdev)
 		return;
 
-	qaic_dev_reset_clean_local_state(qdev, false);
+	qaic_dev_reset_clean_local_state(qdev);
+	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
 	qaic_mhi_free_controller(qdev->mhi_cntrl, link_up);
 	cleanup_qdev(qdev);
 }
@@ -543,14 +534,13 @@ static void qaic_pci_reset_prepare(struct pci_dev *pdev)
 
 	qaic_notify_reset(qdev);
 	qaic_mhi_start_reset(qdev->mhi_cntrl);
-	qaic_dev_reset_clean_local_state(qdev, false);
+	qaic_dev_reset_clean_local_state(qdev);
 }
 
 static void qaic_pci_reset_done(struct pci_dev *pdev)
 {
 	struct qaic_device *qdev = pci_get_drvdata(pdev);
 
-	qdev->reset_state = QAIC_ONLINE;
 	qaic_mhi_reset_done(qdev->mhi_cntrl);
 }
 
-- 
2.40.1

