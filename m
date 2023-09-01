Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E179790166
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 19:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D01D10E825;
	Fri,  1 Sep 2023 17:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204DB10E823
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 17:23:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381GwkJm027603; Fri, 1 Sep 2023 17:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=7TKQZ+mJVlBlM643DDPZT9pa/C442ZwtAl0VVSwS9rM=;
 b=Idxx5At0UwgSgC11/pkUYiMRftwvF7ZAxV3hsKwO6sQY9dfYc/V65ZsfeSz+TMZWz+La
 KAlki3CDfxh3Z9YkFXRcASqBC0E5dkpxtFwQwx26kaOAlszWJfbfKHZuIt25ahhPINn/
 7kQHU3gVTnReOgdIq75NQO6jWelZQrCYurrW/Ng+FZCwHxacHFyEZgGzpDAYASQGEEL4
 crf2TUmHZu+BE7WGx3Dl4tYUMEsNA6twp8FmMJR7dXpssLkZF6VNATZ6VSQ+azI2N0rC
 x+6Uce8IU6NzDMhSCXde/QSdDfMiaBrtzeblMXUnpEv6yEEw3rHHvuGgVvWGD9iJ7riL Gg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3suc9k1dej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 17:23:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381HNKiE025820
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 17:23:20 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 1 Sep 2023 10:23:19 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
Subject: [PATCH 7/7] accel/qaic: Add QAIC_DETACH_SLICE_BO IOCTL
Date: Fri, 1 Sep 2023 11:22:47 -0600
Message-ID: <20230901172247.11410-8-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230901172247.11410-1-quic_jhugo@quicinc.com>
References: <20230901172247.11410-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pHelFsYPB91grn0ArQJzFXnsefyHpi_i
X-Proofpoint-ORIG-GUID: pHelFsYPB91grn0ArQJzFXnsefyHpi_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_14,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309010163
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

Once a BO is attached with slicing configuration that BO can only be used
for that particular setting. With this new feature user can detach slicing
configuration off an already sliced BO and attach new slicing configuration
using QAIC_ATTACH_SLICE_BO.

This will support BO recycling.

detach_slice_bo() detaches slicing configuration from a BO. This new
helper function can also be used in release_dbc() as we are doing the
exact same thing.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
[jhugo: add documentation for new ioctl]
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 Documentation/accel/qaic/qaic.rst |  10 +++
 drivers/accel/qaic/qaic.h         |   4 +-
 drivers/accel/qaic/qaic_data.c    | 119 +++++++++++++++++++++++++++---
 drivers/accel/qaic/qaic_drv.c     |   1 +
 include/uapi/drm/qaic_accel.h     |  12 +++
 5 files changed, 135 insertions(+), 11 deletions(-)

diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index 72a70ab6e3a8..c88502383136 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -123,6 +123,16 @@ DRM_IOCTL_QAIC_PART_DEV
   AIC100 device and can be used for limiting a process to some subset of
   resources.
 
+DRM_IOCTL_QAIC_DETACH_SLICE_BO
+  This IOCTL allows userspace to remove the slicing information from a BO that
+  was originally provided by a call to DRM_IOCTL_QAIC_ATTACH_SLICE_BO. This
+  is the inverse of DRM_IOCTL_QAIC_ATTACH_SLICE_BO. The BO must be idle for
+  DRM_IOCTL_QAIC_DETACH_SLICE_BO to be called. After a successful detach slice
+  operation the BO may have new slicing information attached with a new call
+  to DRM_IOCTL_QAIC_ATTACH_SLICE_BO. After detach slice, the BO cannot be
+  executed until after a new attach slice operation. Combining attach slice
+  and detach slice calls allows userspace to use a BO with multiple workloads.
+
 Userspace Client Isolation
 ==========================
 
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 27cf66dbd5a5..28f1e81a1465 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -219,7 +219,8 @@ struct qaic_bo {
 		 */
 		u32		queue_level_before;
 	} perf_stats;
-
+	/* Synchronizes BO operations */
+	struct mutex		lock;
 };
 
 struct bo_slice {
@@ -275,6 +276,7 @@ int qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *f
 int qaic_partial_execute_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
 void irq_polling_work(struct work_struct *work);
 
 #endif /* _QAIC_H_ */
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 2acb9dbac88b..c90fa6a430f6 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -624,6 +624,7 @@ static void qaic_free_object(struct drm_gem_object *obj)
 		qaic_free_sgt(bo->sgt);
 	}
 
+	mutex_destroy(&bo->lock);
 	drm_gem_object_release(obj);
 	kfree(bo);
 }
@@ -641,6 +642,7 @@ static void qaic_init_bo(struct qaic_bo *bo, bool reinit)
 		bo->sliced = false;
 		reinit_completion(&bo->xfer_done);
 	} else {
+		mutex_init(&bo->lock);
 		init_completion(&bo->xfer_done);
 	}
 	complete_all(&bo->xfer_done);
@@ -1002,10 +1004,13 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	}
 
 	bo = to_qaic_bo(obj);
+	ret = mutex_lock_interruptible(&bo->lock);
+	if (ret)
+		goto put_bo;
 
 	if (bo->sliced) {
 		ret = -EINVAL;
-		goto put_bo;
+		goto unlock_bo;
 	}
 
 	dbc = &qdev->dbc[args->hdr.dbc_id];
@@ -1029,7 +1034,7 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	bo->sliced = true;
 	list_add_tail(&bo->bo_list, &bo->dbc->bo_lists);
 	srcu_read_unlock(&dbc->ch_lock, rcu_id);
-	drm_gem_object_put(obj);
+	mutex_unlock(&bo->lock);
 	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
 	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
 
@@ -1039,6 +1044,8 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	qaic_unprepare_bo(qdev, bo);
 unlock_ch_srcu:
 	srcu_read_unlock(&dbc->ch_lock, rcu_id);
+unlock_bo:
+	mutex_unlock(&bo->lock);
 put_bo:
 	drm_gem_object_put(obj);
 free_slice_ent:
@@ -1193,15 +1200,18 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 		}
 
 		bo = to_qaic_bo(obj);
+		ret = mutex_lock_interruptible(&bo->lock);
+		if (ret)
+			goto failed_to_send_bo;
 
 		if (!bo->sliced) {
 			ret = -EINVAL;
-			goto failed_to_send_bo;
+			goto unlock_bo;
 		}
 
 		if (is_partial && pexec[i].resize > bo->base.size) {
 			ret = -EINVAL;
-			goto failed_to_send_bo;
+			goto unlock_bo;
 		}
 
 		spin_lock_irqsave(&dbc->xfer_lock, flags);
@@ -1210,7 +1220,7 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 		if (queued) {
 			spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 			ret = -EINVAL;
-			goto failed_to_send_bo;
+			goto unlock_bo;
 		}
 
 		bo->req_id = dbc->next_req_id++;
@@ -1241,17 +1251,20 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 			if (ret) {
 				bo->queued = false;
 				spin_unlock_irqrestore(&dbc->xfer_lock, flags);
-				goto failed_to_send_bo;
+				goto unlock_bo;
 			}
 		}
 		reinit_completion(&bo->xfer_done);
 		list_add_tail(&bo->xfer_list, &dbc->xfer_list);
 		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 		dma_sync_sgtable_for_device(&qdev->pdev->dev, bo->sgt, bo->dir);
+		mutex_unlock(&bo->lock);
 	}
 
 	return 0;
 
+unlock_bo:
+	mutex_unlock(&bo->lock);
 failed_to_send_bo:
 	if (likely(obj))
 		drm_gem_object_put(obj);
@@ -1807,6 +1820,91 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 	return ret;
 }
 
+static void detach_slice_bo(struct qaic_device *qdev, struct qaic_bo *bo)
+{
+	qaic_free_slices_bo(bo);
+	qaic_unprepare_bo(qdev, bo);
+	qaic_init_bo(bo, true);
+	list_del(&bo->bo_list);
+	drm_gem_object_put(&bo->base);
+}
+
+int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct qaic_detach_slice *args = data;
+	int rcu_id, usr_rcu_id, qdev_rcu_id;
+	struct dma_bridge_chan *dbc;
+	struct drm_gem_object *obj;
+	struct qaic_device *qdev;
+	struct qaic_user *usr;
+	unsigned long flags;
+	struct qaic_bo *bo;
+	int ret;
+
+	if (args->pad != 0)
+		return -EINVAL;
+
+	usr = file_priv->driver_priv;
+	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
+	if (!usr->qddev) {
+		ret = -ENODEV;
+		goto unlock_usr_srcu;
+	}
+
+	qdev = usr->qddev->qdev;
+	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		ret = -ENODEV;
+		goto unlock_dev_srcu;
+	}
+
+	obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!obj) {
+		ret = -ENOENT;
+		goto unlock_dev_srcu;
+	}
+
+	bo = to_qaic_bo(obj);
+	ret = mutex_lock_interruptible(&bo->lock);
+	if (ret)
+		goto put_bo;
+
+	if (!bo->sliced) {
+		ret = -EINVAL;
+		goto unlock_bo;
+	}
+
+	dbc = bo->dbc;
+	rcu_id = srcu_read_lock(&dbc->ch_lock);
+	if (dbc->usr != usr) {
+		ret = -EINVAL;
+		goto unlock_ch_srcu;
+	}
+
+	/* Check if BO is committed to H/W for DMA */
+	spin_lock_irqsave(&dbc->xfer_lock, flags);
+	if (bo->queued) {
+		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+		ret = -EBUSY;
+		goto unlock_ch_srcu;
+	}
+	spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+
+	detach_slice_bo(qdev, bo);
+
+unlock_ch_srcu:
+	srcu_read_unlock(&dbc->ch_lock, rcu_id);
+unlock_bo:
+	mutex_unlock(&bo->lock);
+put_bo:
+	drm_gem_object_put(obj);
+unlock_dev_srcu:
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+unlock_usr_srcu:
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+	return ret;
+}
+
 static void empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *dbc)
 {
 	unsigned long flags;
@@ -1888,10 +1986,11 @@ void release_dbc(struct qaic_device *qdev, u32 dbc_id)
 	dbc->usr = NULL;
 
 	list_for_each_entry_safe(bo, bo_temp, &dbc->bo_lists, bo_list) {
-		qaic_free_slices_bo(bo);
-		qaic_unprepare_bo(qdev, bo);
-		qaic_init_bo(bo, true);
-		list_del(&bo->bo_list);
+		drm_gem_object_get(&bo->base);
+		mutex_lock(&bo->lock);
+		detach_slice_bo(qdev, bo);
+		mutex_unlock(&bo->lock);
+		drm_gem_object_put(&bo->base);
 	}
 
 	dbc->in_use = false;
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index b5de82e6eb4d..e2bfb4eaf852 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -150,6 +150,7 @@ static const struct drm_ioctl_desc qaic_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QAIC_PARTIAL_EXECUTE_BO, qaic_partial_execute_bo_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(QAIC_WAIT_BO, qaic_wait_bo_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(QAIC_PERF_STATS_BO, qaic_perf_stats_bo_ioctl, 0),
+	DRM_IOCTL_DEF_DRV(QAIC_DETACH_SLICE_BO, qaic_detach_slice_bo_ioctl, 0),
 };
 
 static const struct drm_driver qaic_accel_driver = {
diff --git a/include/uapi/drm/qaic_accel.h b/include/uapi/drm/qaic_accel.h
index f89880b7bfb6..43ac5d864512 100644
--- a/include/uapi/drm/qaic_accel.h
+++ b/include/uapi/drm/qaic_accel.h
@@ -372,6 +372,16 @@ struct qaic_perf_stats_entry {
 	__u32 pad;
 };
 
+/**
+ * struct qaic_detach_slice - Detaches slicing configuration from BO.
+ * @handle: In. GEM handle of the BO to detach slicing configuration.
+ * @pad: Structure padding. Must be 0.
+ */
+struct qaic_detach_slice {
+	__u32 handle;
+	__u32 pad;
+};
+
 #define DRM_QAIC_MANAGE				0x00
 #define DRM_QAIC_CREATE_BO			0x01
 #define DRM_QAIC_MMAP_BO			0x02
@@ -380,6 +390,7 @@ struct qaic_perf_stats_entry {
 #define DRM_QAIC_PARTIAL_EXECUTE_BO		0x05
 #define DRM_QAIC_WAIT_BO			0x06
 #define DRM_QAIC_PERF_STATS_BO			0x07
+#define DRM_QAIC_DETACH_SLICE_BO		0x08
 
 #define DRM_IOCTL_QAIC_MANAGE			DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_MANAGE, struct qaic_manage_msg)
 #define DRM_IOCTL_QAIC_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_CREATE_BO,	struct qaic_create_bo)
@@ -389,6 +400,7 @@ struct qaic_perf_stats_entry {
 #define DRM_IOCTL_QAIC_PARTIAL_EXECUTE_BO	DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_PARTIAL_EXECUTE_BO,	struct qaic_execute)
 #define DRM_IOCTL_QAIC_WAIT_BO			DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_WAIT_BO, struct qaic_wait)
 #define DRM_IOCTL_QAIC_PERF_STATS_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_PERF_STATS_BO, struct qaic_perf_stats)
+#define DRM_IOCTL_QAIC_DETACH_SLICE_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_DETACH_SLICE_BO, struct qaic_detach_slice)
 
 #if defined(__cplusplus)
 }
-- 
2.40.1

