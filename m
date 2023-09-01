Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBF979008D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 18:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D1C10E742;
	Fri,  1 Sep 2023 16:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7711C10E742
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 16:12:58 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381ClMuj031158; Fri, 1 Sep 2023 16:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=rSablmFYevFlvzpVyJ4uUuZAwehyARgc+1appNX+3Lg=;
 b=arCYTERAuV7BNrwWFHw8H5vT6W+jBUV9PTbETEZSFW8pp968gvRrP48A2sv3fS+4bpDm
 ItgStJIq2IiIhDzj/i1kxO857h4Q2CnEdTFGhGDHkti6OTN1/ZF3JG4vssXgKWzkKCl9
 VrTmZWTioI6eG3zuPVHB2CbvW9GBm6S4dp6iQ8Vtih8VIIUMsMVuarx+hpPPlgofNIal
 zooG9l0/ZaCz4lI+qfqeLdE2d4eioYy8PBsD55ggLxlCR7jS+K3p1IHh802MKeaOY9IO
 TddduPX+GQm0lcLXXmY6+eGpvBR3U+rw2var26qOO5VEJXrJ812HjXDJdL+1SEg+T+jl kg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3suc22h8xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 16:12:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381GCpTZ027860
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 16:12:51 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 1 Sep 2023 09:12:50 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>
Subject: [PATCH] accel/qaic: Use devm_drm_dev_alloc() instead of
 drm_dev_alloc()
Date: Fri, 1 Sep 2023 10:12:36 -0600
Message-ID: <20230901161236.8371-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lp0McTj8Rr0nG5rd2NvQdZyq2fM4-2Hq
X-Proofpoint-ORIG-GUID: lp0McTj8Rr0nG5rd2NvQdZyq2fM4-2Hq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_13,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309010151
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

Since drm_dev_alloc() is deprecated it is recommended to use
devm_drm_dev_alloc() instead. Update the driver to start using
devm_drm_dev_alloc().

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic.h     |   7 ++-
 drivers/accel/qaic/qaic_drv.c | 102 ++++++++++++++--------------------
 2 files changed, 47 insertions(+), 62 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index f2bd637a0d4e..9d98a10af1cb 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -27,6 +27,9 @@
 #define QAIC_DBC_OFF(i)		((i) * QAIC_DBC_SIZE + QAIC_DBC_BASE)
 
 #define to_qaic_bo(obj) container_of(obj, struct qaic_bo, base)
+#define to_qaic_drm_device(dev) container_of(dev, struct qaic_drm_device, drm)
+#define to_drm(qddev) (&(qddev)->drm)
+#define to_accel_kdev(qddev) (to_drm(qddev)->accel->kdev) /* Return Linux device of accel node */
 
 extern bool datapath_polling;
 
@@ -137,6 +140,8 @@ struct qaic_device {
 };
 
 struct qaic_drm_device {
+	/* The drm device struct of this drm device */
+	struct drm_device	drm;
 	/* Pointer to the root device struct driven by this driver */
 	struct qaic_device	*qdev;
 	/*
@@ -146,8 +151,6 @@ struct qaic_drm_device {
 	 * device is the actual physical device
 	 */
 	s32			partition_id;
-	/* Pointer to the drm device struct of this drm device */
-	struct drm_device	*ddev;
 	/* Head in list of users who have opened this drm device */
 	struct list_head	users;
 	/* Synchronizes access to users list */
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 49b5039f4cad..d9e1ba64d7cf 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -22,6 +22,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
 #include <uapi/drm/qaic_accel.h>
 
 #include "mhi_controller.h"
@@ -55,7 +56,7 @@ static void free_usr(struct kref *kref)
 
 static int qaic_open(struct drm_device *dev, struct drm_file *file)
 {
-	struct qaic_drm_device *qddev = dev->dev_private;
+	struct qaic_drm_device *qddev = to_qaic_drm_device(dev);
 	struct qaic_device *qdev = qddev->qdev;
 	struct qaic_user *usr;
 	int rcu_id;
@@ -170,64 +171,39 @@ static const struct drm_driver qaic_accel_driver = {
 
 static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id)
 {
-	struct qaic_drm_device *qddev;
-	struct drm_device *ddev;
-	struct device *pdev;
+	struct qaic_drm_device *qddev = qdev->qddev;
+	struct drm_device *drm = to_drm(qddev);
 	int ret;
 
 	/* Hold off implementing partitions until the uapi is determined */
 	if (partition_id != QAIC_NO_PARTITION)
 		return -EINVAL;
 
-	pdev = &qdev->pdev->dev;
-
-	qddev = kzalloc(sizeof(*qddev), GFP_KERNEL);
-	if (!qddev)
-		return -ENOMEM;
-
-	ddev = drm_dev_alloc(&qaic_accel_driver, pdev);
-	if (IS_ERR(ddev)) {
-		ret = PTR_ERR(ddev);
-		goto ddev_fail;
-	}
-
-	ddev->dev_private = qddev;
-	qddev->ddev = ddev;
-
-	qddev->qdev = qdev;
 	qddev->partition_id = partition_id;
-	INIT_LIST_HEAD(&qddev->users);
-	mutex_init(&qddev->users_mutex);
-
-	qdev->qddev = qddev;
-
-	ret = drm_dev_register(ddev, 0);
-	if (ret) {
-		pci_dbg(qdev->pdev, "%s: drm_dev_register failed %d\n", __func__, ret);
-		goto drm_reg_fail;
-	}
 
-	return 0;
+	/*
+	 * drm_dev_unregister() sets the driver data to NULL and
+	 * drm_dev_register() does not update the driver data. During a SOC
+	 * reset drm dev is unregistered and registered again leaving the
+	 * driver data to NULL.
+	 */
+	dev_set_drvdata(to_accel_kdev(qddev), drm->accel);
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		pci_dbg(qdev->pdev, "drm_dev_register failed %d\n", ret);
 
-drm_reg_fail:
-	mutex_destroy(&qddev->users_mutex);
-	qdev->qddev = NULL;
-	drm_dev_put(ddev);
-ddev_fail:
-	kfree(qddev);
 	return ret;
 }
 
 static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 {
-	struct qaic_drm_device *qddev;
+	struct qaic_drm_device *qddev = qdev->qddev;
+	struct drm_device *drm = to_drm(qddev);
 	struct qaic_user *usr;
 
-	qddev = qdev->qddev;
-	qdev->qddev = NULL;
-	if (!qddev)
-		return;
-
+	drm_dev_get(drm);
+	drm_dev_unregister(drm);
+	qddev->partition_id = 0;
 	/*
 	 * Existing users get unresolvable errors till they close FDs.
 	 * Need to sync carefully with users calling close(). The
@@ -254,13 +230,7 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 		mutex_lock(&qddev->users_mutex);
 	}
 	mutex_unlock(&qddev->users_mutex);
-
-	if (qddev->ddev) {
-		drm_dev_unregister(qddev->ddev);
-		drm_dev_put(qddev->ddev);
-	}
-
-	kfree(qddev);
+	drm_dev_put(drm);
 }
 
 static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
@@ -344,8 +314,20 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exit_reset)
 		qdev->in_reset = false;
 }
 
+static void cleanup_qdev(struct qaic_device *qdev)
+{
+	int i;
+
+	for (i = 0; i < qdev->num_dbc; ++i)
+		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
+	cleanup_srcu_struct(&qdev->dev_lock);
+	pci_set_drvdata(qdev->pdev, NULL);
+	destroy_workqueue(qdev->cntl_wq);
+}
+
 static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	struct qaic_drm_device *qddev;
 	struct qaic_device *qdev;
 	int i;
 
@@ -381,18 +363,18 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
 		INIT_LIST_HEAD(&qdev->dbc[i].bo_lists);
 	}
 
-	return qdev;
-}
+	qddev = devm_drm_dev_alloc(&pdev->dev, &qaic_accel_driver, struct qaic_drm_device, drm);
+	if (IS_ERR(qddev)) {
+		cleanup_qdev(qdev);
+		return NULL;
+	}
 
-static void cleanup_qdev(struct qaic_device *qdev)
-{
-	int i;
+	drmm_mutex_init(to_drm(qddev), &qddev->users_mutex);
+	INIT_LIST_HEAD(&qddev->users);
+	qddev->qdev = qdev;
+	qdev->qddev = qddev;
 
-	for (i = 0; i < qdev->num_dbc; ++i)
-		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
-	cleanup_srcu_struct(&qdev->dev_lock);
-	pci_set_drvdata(qdev->pdev, NULL);
-	destroy_workqueue(qdev->cntl_wq);
+	return qdev;
 }
 
 static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
-- 
2.40.1

