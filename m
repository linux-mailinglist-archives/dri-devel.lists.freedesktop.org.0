Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D265935CF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC5ED1793;
	Mon, 15 Aug 2022 18:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F064D165C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:43:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FFhbJt016564;
 Mon, 15 Aug 2022 18:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=dSxYdoGf7RATwi7Rdud2UbXC/UO+ky4t/d1jRSOYJhE=;
 b=ENUaj9aKgpWeVXhTiL7NfFsTBno6+TWJFr/DYtLwzQwMCY9kXmrxEHdX7NQFkewYebMZ
 6iVfbLtXUKJ6w/w0RJTv5eQBPzSjeKAyvswHDo1Y2RL/UZ+rU8PN3VBXbZSk1y9Mhel8
 dyixFb7b1ymdoZbtPux69agCFMxIldbhm09OSgs/yP7FuT6oKvPrtkEDUDco60vgWS3c
 gd2hLNwqRTGYUOHPvPKjF0Y/JqNp9WMdYozSqTAyKs8gFZbmGg8MjZkBGXch5feevZDc
 DBCjw8w5hoLQN3YhoP5m3ozqeWwugtIU21pvSyJSdhQkJ5Gh0Erz2IDfIKTZzYUeVFNe Ag== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx54sx0tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIh7tL030113
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:07 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:43:05 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 02/14] drm/qaic: Add uapi and core driver file
Date: Mon, 15 Aug 2022 12:42:24 -0600
Message-ID: <1660588956-24027-3-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
References: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sYAr3IvQI_bLePPFicSu4JkVdStSDpVk
X-Proofpoint-ORIG-GUID: sYAr3IvQI_bLePPFicSu4JkVdStSDpVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208150070
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the QAIC driver uapi file and core driver file that binds to the PCIe
device.  The core driver file also creates the drm device and manages all
the interconnections between the different parts of the driver.

Change-Id: I28854e8a5dacda217439be2f65a4ab67d4dccd1e
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/gpu/drm/qaic/qaic_drv.c | 825 ++++++++++++++++++++++++++++++++++++++++
 include/uapi/drm/qaic_drm.h     | 283 ++++++++++++++
 2 files changed, 1108 insertions(+)
 create mode 100644 drivers/gpu/drm/qaic/qaic_drv.c
 create mode 100644 include/uapi/drm/qaic_drm.h

diff --git a/drivers/gpu/drm/qaic/qaic_drv.c b/drivers/gpu/drm/qaic/qaic_drv.c
new file mode 100644
index 0000000..0e139e6
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_drv.c
@@ -0,0 +1,825 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/kref.h>
+#include <linux/mhi.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/sched.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+#include <linux/wait.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <uapi/drm/qaic_drm.h>
+
+#include "mhi_controller.h"
+#include "qaic.h"
+#include "qaic_debugfs.h"
+#include "qaic_ras.h"
+#include "qaic_ssr.h"
+#include "qaic_telemetry.h"
+#define CREATE_TRACE_POINTS
+#include "qaic_trace.h"
+
+MODULE_IMPORT_NS(DMA_BUF);
+
+#define PCI_DEV_AIC100			0xa100
+#define QAIC_NAME			"qaic"
+#define STR2(s)				#s
+#define STR(s)				STR2(s)
+#define MAJOR_VER			1
+#define MINOR_VER			0
+#define PATCH_VER			0
+#define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
+
+static unsigned int datapath_polling;
+module_param(datapath_polling, uint, 0400);
+bool poll_datapath;
+
+static u16 cntl_major = 5;
+static u16 cntl_minor;/* 0 */
+static bool link_up;
+
+static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id,
+				  struct qaic_user *owner);
+static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id,
+				    struct qaic_user *owner);
+
+static void free_usr(struct kref *kref)
+{
+	struct qaic_user *usr = container_of(kref, struct qaic_user, ref_count);
+
+	cleanup_srcu_struct(&usr->qddev_lock);
+	kfree(usr);
+}
+
+static int qaic_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct qaic_drm_device *qddev = dev->dev_private;
+	struct qaic_device *qdev = qddev->qdev;
+	struct qaic_user *usr;
+	int rcu_id;
+	int ret;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENODEV;
+	}
+
+	usr = kmalloc(sizeof(*usr), GFP_KERNEL);
+	if (!usr) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENOMEM;
+	}
+
+	usr->handle = current->pid;
+	usr->qddev = qddev;
+	atomic_set(&usr->chunk_id, 0);
+	init_srcu_struct(&usr->qddev_lock);
+	kref_init(&usr->ref_count);
+
+	ret = mutex_lock_interruptible(&qddev->users_mutex);
+	if (ret) {
+		cleanup_srcu_struct(&usr->qddev_lock);
+		kfree(usr);
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return ret;
+	}
+
+	list_add(&usr->node, &qddev->users);
+	mutex_unlock(&qddev->users_mutex);
+
+	file->driver_priv = usr;
+
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return 0;
+}
+
+static void qaic_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct qaic_user *usr = file->driver_priv;
+	struct qaic_drm_device *qddev;
+	struct qaic_device *qdev;
+	int qdev_rcu_id;
+	int usr_rcu_id;
+	int i;
+
+	qddev = usr->qddev;
+	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
+	if (qddev) {
+		qdev = qddev->qdev;
+		qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+		if (!qdev->in_reset) {
+			qaic_release_usr(qdev, usr);
+			for (i = 0; i < qdev->num_dbc; ++i)
+				if (qdev->dbc[i].usr &&
+				    qdev->dbc[i].usr->handle == usr->handle)
+					release_dbc(qdev, i, true);
+
+			/* Remove child devices */
+			if (qddev->partition_id == QAIC_NO_PARTITION)
+				qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION, usr);
+		}
+		srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+
+		mutex_lock(&qddev->users_mutex);
+		if (!list_empty(&usr->node))
+			list_del_init(&usr->node);
+		mutex_unlock(&qddev->users_mutex);
+	}
+
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+	kref_put(&usr->ref_count, free_usr);
+
+	file->driver_priv = NULL;
+}
+
+static int qaic_part_dev_ioctl(struct drm_device *dev, void *data,
+			       struct drm_file *file_priv)
+{
+	struct qaic_device *qdev;
+	struct qaic_user *usr;
+	u32 partition_id;
+	int qdev_rcu_id;
+	int usr_rcu_id;
+	int ret = 0;
+	u16 remove;
+
+	usr = file_priv->driver_priv;
+	if (!usr)
+		return -EINVAL;
+
+	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
+	if (!usr->qddev) {
+		srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+		return -ENODEV;
+	}
+
+	qdev = usr->qddev->qdev;
+	if (!qdev) {
+		srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+		return -ENODEV;
+	}
+
+	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	/* This IOCTL is only supported for base devices. */
+	if (usr->qddev->partition_id != QAIC_NO_PARTITION) {
+		ret = -ENOTTY;
+		goto out;
+	}
+
+	ret = qaic_data_get_reservation(qdev, usr, data, &partition_id,
+					&remove);
+	if (ret)
+		goto out;
+
+	if (remove == 1)
+		qaic_destroy_drm_device(qdev, partition_id, usr);
+	else
+		ret = qaic_create_drm_device(qdev, partition_id, usr);
+
+out:
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+
+	return ret;
+}
+
+DEFINE_DRM_GEM_FOPS(qaic_drm_fops);
+
+static const struct drm_ioctl_desc qaic_drm_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(QAIC_MANAGE, qaic_manage_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(QAIC_CREATE_BO, qaic_create_bo_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(QAIC_MMAP_BO, qaic_mmap_bo_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(QAIC_ATTACH_SLICE_BO, qaic_attach_slice_bo_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(QAIC_EXECUTE_BO, qaic_execute_bo_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(QAIC_PARTIAL_EXECUTE_BO, qaic_partial_execute_bo_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(QAIC_WAIT_BO, qaic_wait_bo_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(QAIC_PERF_STATS_BO, qaic_perf_stats_bo_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(QAIC_PART_DEV, qaic_part_dev_ioctl, DRM_RENDER_ALLOW),
+};
+
+static const struct drm_driver qaic_drm_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_RENDER,
+
+	.name			= QAIC_NAME,
+	.desc			= QAIC_DESC,
+	.date			= "20190618",
+	.major			= MAJOR_VER,
+	.minor			= MINOR_VER,
+	.patchlevel		= PATCH_VER,
+
+	.fops			= &qaic_drm_fops,
+	.open			= qaic_open,
+	.postclose		= qaic_postclose,
+
+#if defined(CONFIG_DEBUG_FS)
+	.debugfs_init		= qaic_debugfs_init,
+#endif
+
+	.ioctls			= qaic_drm_ioctls,
+	.num_ioctls		= ARRAY_SIZE(qaic_drm_ioctls),
+	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
+	.gem_prime_import	= qaic_gem_prime_import,
+};
+
+static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id,
+				  struct qaic_user *owner)
+{
+	struct qaic_drm_device *qddev;
+	struct drm_device *ddev;
+	struct device *pdev;
+	int ret;
+
+	/*
+	 * Partition id QAIC_NO_PARTITION indicates that the device was created
+	 * on mhi_probe and id > QAIC_NO_PARTITION indicates a partition
+	 * created using IOCTL. So, pdev for primary device is the pci dev and
+	 * the parent for partition dev is the primary device.
+	 */
+	if (partition_id == QAIC_NO_PARTITION)
+		pdev = &qdev->pdev->dev;
+	else
+		pdev = qdev->base_dev->ddev->dev;
+
+	qddev = kzalloc(sizeof(*qddev), GFP_KERNEL);
+	if (!qddev) {
+		ret = -ENOMEM;
+		goto qddev_fail;
+	}
+
+	ddev = drm_dev_alloc(&qaic_drm_driver, pdev);
+	if (IS_ERR(ddev)) {
+		ret = PTR_ERR(ddev);
+		goto ddev_fail;
+	}
+
+	ddev->dev_private = qddev;
+	qddev->ddev = ddev;
+
+	if (partition_id == QAIC_NO_PARTITION)
+		qdev->base_dev = qddev;
+	qddev->qdev = qdev;
+	qddev->partition_id = partition_id;
+	qddev->owner = owner;
+	INIT_LIST_HEAD(&qddev->users);
+	mutex_init(&qddev->users_mutex);
+
+	mutex_lock(&qdev->qaic_drm_devices_mutex);
+	list_add(&qddev->node, &qdev->qaic_drm_devices);
+	mutex_unlock(&qdev->qaic_drm_devices_mutex);
+
+	ret = qaic_sysfs_init(qddev);
+	if (ret) {
+		pci_dbg(qdev->pdev, "%s: sysfs_init failed %d\n", __func__, ret);
+		goto sysfs_init_fail;
+	}
+
+	ret = drm_dev_register(ddev, 0);
+	if (ret) {
+		pci_dbg(qdev->pdev, "%s: drm_dev_register failed %d\n", __func__, ret);
+		goto drm_reg_fail;
+	}
+
+	return 0;
+
+drm_reg_fail:
+	qaic_sysfs_remove(qddev);
+sysfs_init_fail:
+	mutex_destroy(&qddev->users_mutex);
+	mutex_lock(&qdev->qaic_drm_devices_mutex);
+	list_del(&qddev->node);
+	mutex_unlock(&qdev->qaic_drm_devices_mutex);
+	if (partition_id == QAIC_NO_PARTITION)
+		qdev->base_dev = NULL;
+	drm_dev_put(ddev);
+ddev_fail:
+	kfree(qddev);
+qddev_fail:
+	return ret;
+}
+
+static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id,
+				    struct qaic_user *owner)
+{
+	struct qaic_drm_device *qddev;
+	struct qaic_drm_device *q;
+	struct qaic_user *usr;
+
+	list_for_each_entry_safe(qddev, q, &qdev->qaic_drm_devices, node) {
+		/*
+		 * Skip devices in case we just want to remove devices
+		 * specific to a owner or reservation id.
+		 *
+		 * owner	partition_id	notes
+		 * ----------------------------------
+		 * NULL		NO_PARTITION	delete base + all derived (qdev
+		 *				reset)
+		 * !NULL	NO_PARTITION	delete derived devs created by
+		 *				owner.
+		 * !NULL	>NO_PARTITION	delete derived dev identified by
+		 *				the partition id and created by
+		 *				owner
+		 * NULL		>NO_PARTITION	invalid (no-op)
+		 *
+		 * if partition_id is any value < QAIC_NO_PARTITION this will be
+		 * a no-op.
+		 */
+		if (owner && owner != qddev->owner)
+			continue;
+
+		if (partition_id != QAIC_NO_PARTITION &&
+		    partition_id != qddev->partition_id && !owner)
+			continue;
+
+		/*
+		 * Existing users get unresolvable errors till they close FDs.
+		 * Need to sync carefully with users calling close().  The
+		 * list of users can be modified elsewhere when the lock isn't
+		 * held here, but the sync'ing the srcu with the mutex held
+		 * could deadlock.  Grab the mutex so that the list will be
+		 * unmodified.  The user we get will exist as long as the
+		 * lock is held.  Signal that the qcdev is going away, and
+		 * grab a reference to the user so they don't go away for
+		 * synchronize_srcu().  Then release the mutex to avoid
+		 * deadlock and make sure the user has observed the signal.
+		 * With the lock released, we cannot maintain any state of the
+		 * user list.
+		 */
+		mutex_lock(&qddev->users_mutex);
+		while (!list_empty(&qddev->users)) {
+			usr = list_first_entry(&qddev->users, struct qaic_user,
+					       node);
+			list_del_init(&usr->node);
+			kref_get(&usr->ref_count);
+			usr->qddev = NULL;
+			mutex_unlock(&qddev->users_mutex);
+			synchronize_srcu(&usr->qddev_lock);
+			kref_put(&usr->ref_count, free_usr);
+			mutex_lock(&qddev->users_mutex);
+		}
+		mutex_unlock(&qddev->users_mutex);
+
+		if (qddev->ddev) {
+			qaic_sysfs_remove(qddev);
+			drm_dev_unregister(qddev->ddev);
+			drm_dev_put(qddev->ddev);
+		}
+
+		list_del(&qddev->node);
+		kfree(qddev);
+	}
+}
+
+static int qaic_mhi_probe(struct mhi_device *mhi_dev,
+			  const struct mhi_device_id *id)
+{
+	struct qaic_device *qdev;
+	u16 major, minor;
+	int ret;
+
+	/*
+	 * Invoking this function indicates that the control channel to the
+	 * device is available.  We use that as a signal to indicate that
+	 * the device side firmware has booted.  The device side firmware
+	 * manages the device resources, so we need to communicate with it
+	 * via the control channel in order to utilize the device.  Therefore
+	 * we wait until this signal to create the drm dev that userspace will
+	 * use to control the device, because without the device side firmware,
+	 * userspace can't do anything useful.
+	 */
+
+	qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
+
+	qdev->in_reset = false;
+
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+	qdev->cntl_ch = mhi_dev;
+
+	ret = qaic_control_open(qdev);
+	if (ret) {
+		pci_dbg(qdev->pdev, "%s: control_open failed %d\n", __func__, ret);
+		goto err;
+	}
+
+	ret = get_cntl_version(qdev, NULL, &major, &minor);
+	if (ret || major != cntl_major || minor > cntl_minor) {
+		pci_err(qdev->pdev, "%s: Control protocol version (%d.%d) not supported.  Supported version is (%d.%d). Ret: %d\n",
+			__func__, major, minor, cntl_major, cntl_minor, ret);
+		ret = -EINVAL;
+		goto close_control;
+	}
+
+	ret = qaic_create_drm_device(qdev, QAIC_NO_PARTITION, NULL);
+
+	return ret;
+
+close_control:
+	qaic_control_close(qdev);
+err:
+	return ret;
+}
+
+static void qaic_mhi_remove(struct mhi_device *mhi_dev)
+{
+}
+
+static void qaic_notify_reset(struct qaic_device *qdev)
+{
+	int i;
+
+	qdev->in_reset = true;
+	/* wake up any waiters to avoid waiting for timeouts at sync */
+	wake_all_cntl(qdev);
+	wake_all_telemetry(qdev);
+	for (i = 0; i < qdev->num_dbc; ++i)
+		wakeup_dbc(qdev, i);
+	synchronize_srcu(&qdev->dev_lock);
+}
+
+void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exit_reset)
+{
+	int i;
+
+	qaic_notify_reset(qdev);
+
+	/* remove drmdevs to prevent new users from coming in */
+	if (qdev->base_dev)
+		qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION, NULL);
+
+	/* start tearing things down */
+	for (i = 0; i < qdev->num_dbc; ++i) {
+		release_dbc(qdev, i, false);
+		clean_up_ssr(qdev, i);
+	}
+
+	if (exit_reset)
+		qdev->in_reset = false;
+}
+
+static int qaic_pci_probe(struct pci_dev *pdev,
+			  const struct pci_device_id *id)
+{
+	int ret;
+	int i;
+	int mhi_irq;
+	struct qaic_device *qdev;
+
+	qdev = kzalloc(sizeof(*qdev), GFP_KERNEL);
+	if (!qdev) {
+		ret = -ENOMEM;
+		goto qdev_fail;
+	}
+
+	if (id->device == PCI_DEV_AIC100) {
+		qdev->num_dbc = 16;
+		qdev->dbc = kcalloc(qdev->num_dbc, sizeof(*qdev->dbc),
+				    GFP_KERNEL);
+		if (!qdev->dbc) {
+			ret = -ENOMEM;
+			goto device_id_fail;
+		}
+	} else {
+		pci_dbg(pdev, "%s: No matching device found for device id %d\n",
+			__func__, id->device);
+		ret = -EINVAL;
+		goto device_id_fail;
+	}
+
+	qdev->cntl_wq = alloc_workqueue("qaic_cntl", WQ_UNBOUND, 0);
+	if (!qdev->cntl_wq) {
+		ret = -ENOMEM;
+		goto wq_fail;
+	}
+	qdev->tele_wq = alloc_workqueue("qaic_tele", WQ_UNBOUND, 0);
+	if (!qdev->tele_wq) {
+		ret = -ENOMEM;
+		goto tele_wq_fail;
+	}
+	qdev->ssr_wq = alloc_workqueue("qaic_ssr", WQ_UNBOUND, 0);
+	if (!qdev->ssr_wq) {
+		ret = -ENOMEM;
+		goto ssr_wq_fail;
+	}
+	pci_set_drvdata(pdev, qdev);
+	qdev->pdev = pdev;
+	mutex_init(&qdev->cntl_mutex);
+	INIT_LIST_HEAD(&qdev->cntl_xfer_list);
+	init_srcu_struct(&qdev->dev_lock);
+	mutex_init(&qdev->tele_mutex);
+	INIT_LIST_HEAD(&qdev->tele_xfer_list);
+	INIT_LIST_HEAD(&qdev->bootlog);
+	mutex_init(&qdev->bootlog_mutex);
+	INIT_LIST_HEAD(&qdev->qaic_drm_devices);
+	mutex_init(&qdev->qaic_drm_devices_mutex);
+	for (i = 0; i < qdev->num_dbc; ++i) {
+		mutex_init(&qdev->dbc[i].handle_lock);
+		spin_lock_init(&qdev->dbc[i].xfer_lock);
+		idr_init(&qdev->dbc[i].buf_handles);
+		qdev->dbc[i].qdev = qdev;
+		qdev->dbc[i].id = i;
+		INIT_LIST_HEAD(&qdev->dbc[i].xfer_list);
+		init_srcu_struct(&qdev->dbc[i].ch_lock);
+		init_waitqueue_head(&qdev->dbc[i].dbc_release);
+		INIT_LIST_HEAD(&qdev->dbc[i].bo_lists);
+	}
+
+	qdev->bars = pci_select_bars(pdev, IORESOURCE_MEM);
+
+	/* make sure the device has the expected BARs */
+	if (qdev->bars != (BIT(0) | BIT(2) | BIT(4))) {
+		pci_dbg(pdev, "%s: expected BARs 0, 2, and 4 not found in device.  Found 0x%x\n",
+			__func__, qdev->bars);
+		ret = -EINVAL;
+		goto bar_fail;
+	}
+
+	ret = pci_enable_device(pdev);
+	if (ret)
+		goto enable_fail;
+
+	ret = pci_request_selected_regions(pdev, qdev->bars, "aic100");
+	if (ret)
+		goto request_regions_fail;
+
+	pci_set_master(pdev);
+
+	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret)
+		goto dma_mask_fail;
+	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret)
+		goto dma_mask_fail;
+	ret = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+	if (ret)
+		goto dma_mask_fail;
+
+	qdev->bar_0 = pci_ioremap_bar(pdev, 0);
+	if (!qdev->bar_0) {
+		ret = -ENOMEM;
+		goto ioremap_0_fail;
+	}
+
+	qdev->bar_2 = pci_ioremap_bar(pdev, 2);
+	if (!qdev->bar_2) {
+		ret = -ENOMEM;
+		goto ioremap_2_fail;
+	}
+
+	for (i = 0; i < qdev->num_dbc; ++i)
+		qdev->dbc[i].dbc_base = qdev->bar_2 + QAIC_DBC_OFF(i);
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
+	if (ret < 0)
+		goto alloc_irq_fail;
+
+	if (ret < 32) {
+		pci_err(pdev, "%s: Requested 32 MSIs.  Obtained %d MSIs which is less than the 32 required.\n",
+			__func__, ret);
+		ret = -ENODEV;
+		goto invalid_msi_config;
+	}
+
+	mhi_irq = pci_irq_vector(pdev, 0);
+	if (mhi_irq < 0) {
+		ret = mhi_irq;
+		goto get_mhi_irq_fail;
+	}
+
+	for (i = 0; i < qdev->num_dbc; ++i) {
+		ret = devm_request_threaded_irq(&pdev->dev,
+						pci_irq_vector(pdev, i + 1),
+						dbc_irq_handler,
+						dbc_irq_threaded_fn,
+						IRQF_SHARED,
+						"qaic_dbc",
+						&qdev->dbc[i]);
+		if (ret)
+			goto get_dbc_irq_failed;
+
+		if (poll_datapath) {
+			qdev->dbc[i].irq = pci_irq_vector(pdev, i + 1);
+			disable_irq_nosync(qdev->dbc[i].irq);
+			INIT_WORK(&qdev->dbc[i].poll_work, irq_polling_work);
+		}
+	}
+
+	qdev->mhi_cntl = qaic_mhi_register_controller(pdev, qdev->bar_0, mhi_irq);
+	if (IS_ERR(qdev->mhi_cntl)) {
+		ret = PTR_ERR(qdev->mhi_cntl);
+		goto mhi_register_fail;
+	}
+
+	return 0;
+
+mhi_register_fail:
+get_dbc_irq_failed:
+	for (i = 0; i < qdev->num_dbc; ++i)
+		devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
+			      &qdev->dbc[i]);
+get_mhi_irq_fail:
+invalid_msi_config:
+	pci_free_irq_vectors(pdev);
+alloc_irq_fail:
+	iounmap(qdev->bar_2);
+ioremap_2_fail:
+	iounmap(qdev->bar_0);
+ioremap_0_fail:
+dma_mask_fail:
+	pci_clear_master(pdev);
+	pci_release_selected_regions(pdev, qdev->bars);
+request_regions_fail:
+	pci_disable_device(pdev);
+enable_fail:
+	pci_set_drvdata(pdev, NULL);
+bar_fail:
+	for (i = 0; i < qdev->num_dbc; ++i) {
+		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
+		idr_destroy(&qdev->dbc[i].buf_handles);
+	}
+	cleanup_srcu_struct(&qdev->dev_lock);
+	destroy_workqueue(qdev->ssr_wq);
+ssr_wq_fail:
+	destroy_workqueue(qdev->tele_wq);
+tele_wq_fail:
+	destroy_workqueue(qdev->cntl_wq);
+wq_fail:
+	kfree(qdev->dbc);
+device_id_fail:
+	kfree(qdev);
+qdev_fail:
+	return ret;
+}
+
+static void qaic_pci_remove(struct pci_dev *pdev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+	int i;
+
+	if (!qdev)
+		return;
+
+	qaic_dev_reset_clean_local_state(qdev, false);
+	qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
+	for (i = 0; i < qdev->num_dbc; ++i) {
+		devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
+			      &qdev->dbc[i]);
+		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
+		idr_destroy(&qdev->dbc[i].buf_handles);
+	}
+	destroy_workqueue(qdev->cntl_wq);
+	destroy_workqueue(qdev->tele_wq);
+	destroy_workqueue(qdev->ssr_wq);
+	pci_free_irq_vectors(pdev);
+	iounmap(qdev->bar_0);
+	pci_clear_master(pdev);
+	pci_release_selected_regions(pdev, qdev->bars);
+	pci_disable_device(pdev);
+	pci_set_drvdata(pdev, NULL);
+	kfree(qdev->dbc);
+	kfree(qdev);
+}
+
+static void qaic_pci_shutdown(struct pci_dev *pdev)
+{
+	link_up = true;
+	qaic_pci_remove(pdev);
+}
+
+static pci_ers_result_t qaic_pci_error_detected(struct pci_dev *pdev,
+						pci_channel_state_t error)
+{
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
+static void qaic_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+
+	qaic_notify_reset(qdev);
+	qaic_mhi_start_reset(qdev->mhi_cntl);
+	qaic_dev_reset_clean_local_state(qdev, false);
+}
+
+static void qaic_pci_reset_done(struct pci_dev *pdev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+
+	qdev->in_reset = false;
+	qaic_mhi_reset_done(qdev->mhi_cntl);
+}
+
+static const struct mhi_device_id qaic_mhi_match_table[] = {
+	{ .chan = "QAIC_CONTROL", },
+	{},
+};
+
+static struct mhi_driver qaic_mhi_driver = {
+	.id_table = qaic_mhi_match_table,
+	.remove = qaic_mhi_remove,
+	.probe = qaic_mhi_probe,
+	.ul_xfer_cb = qaic_mhi_ul_xfer_cb,
+	.dl_xfer_cb = qaic_mhi_dl_xfer_cb,
+	.driver = {
+		.name = "qaic_mhi",
+		.owner = THIS_MODULE,
+	},
+};
+
+static const struct pci_device_id ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, ids);
+
+static const struct pci_error_handlers qaic_pci_err_handler = {
+	.error_detected = qaic_pci_error_detected,
+	.reset_prepare = qaic_pci_reset_prepare,
+	.reset_done = qaic_pci_reset_done,
+};
+
+static struct pci_driver qaic_pci_driver = {
+	.name = QAIC_NAME,
+	.id_table = ids,
+	.probe = qaic_pci_probe,
+	.remove = qaic_pci_remove,
+	.shutdown = qaic_pci_shutdown,
+	.err_handler = &qaic_pci_err_handler,
+};
+
+static int __init qaic_init(void)
+{
+	int ret;
+
+	if (datapath_polling) {
+		poll_datapath = true;
+		pr_info("qaic: driver initializing in datapath polling mode\n");
+	}
+
+	qaic_logging_register();
+
+	ret = mhi_driver_register(&qaic_mhi_driver);
+	if (ret) {
+		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
+		goto free_class;
+	}
+
+	ret = pci_register_driver(&qaic_pci_driver);
+
+	if (ret) {
+		pr_debug("qaic: pci_register_driver failed %d\n", ret);
+		goto free_mhi;
+	}
+
+	qaic_telemetry_register();
+	qaic_ras_register();
+	qaic_ssr_register();
+	goto out;
+
+free_mhi:
+	mhi_driver_unregister(&qaic_mhi_driver);
+free_class:
+out:
+	if (ret)
+		qaic_logging_unregister();
+
+	return ret;
+}
+
+static void __exit qaic_exit(void)
+{
+	pr_debug("qaic: exit\n");
+	link_up = true;
+	pci_unregister_driver(&qaic_pci_driver);
+	mhi_driver_unregister(&qaic_mhi_driver);
+	qaic_telemetry_unregister();
+	qaic_ras_unregister();
+	qaic_ssr_unregister();
+	qaic_logging_unregister();
+}
+
+module_init(qaic_init);
+module_exit(qaic_exit);
+
+MODULE_AUTHOR(QAIC_DESC " Kernel Driver Team");
+MODULE_DESCRIPTION(QAIC_DESC " DRM driver");
+MODULE_LICENSE("GPL v2");
+MODULE_VERSION(STR(MAJOR_VER) "." STR(MINOR_VER) "." STR(PATCH_VER));
diff --git a/include/uapi/drm/qaic_drm.h b/include/uapi/drm/qaic_drm.h
new file mode 100644
index 0000000..5fb3981
--- /dev/null
+++ b/include/uapi/drm/qaic_drm.h
@@ -0,0 +1,283 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+ *
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QAIC_DRM_H_
+#define QAIC_DRM_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+#include "drm.h"
+
+#if defined(__CPLUSPLUS)
+extern "C" {
+#endif
+
+#define QAIC_MANAGE_MAX_MSG_LENGTH 0x1000	/**<
+						  * The length(4K) includes len and
+						  * count fields of qaic_manage_msg
+						  */
+
+enum qaic_sem_flags {
+	SEM_INSYNCFENCE =	0x1,
+	SEM_OUTSYNCFENCE =	0x2,
+};
+
+enum qaic_sem_cmd {
+	SEM_NOP =		0,
+	SEM_INIT =		1,
+	SEM_INC =		2,
+	SEM_DEC =		3,
+	SEM_WAIT_EQUAL =	4,
+	SEM_WAIT_GT_EQ =	5, /**< Greater than or equal */
+	SEM_WAIT_GT_0 =		6, /**< Greater than 0 */
+};
+
+enum qaic_manage_transaction_type {
+	TRANS_UNDEFINED =			0,
+	TRANS_PASSTHROUGH_FROM_USR =		1,
+	TRANS_PASSTHROUGH_TO_USR =		2,
+	TRANS_PASSTHROUGH_FROM_DEV =		3,
+	TRANS_PASSTHROUGH_TO_DEV =		4,
+	TRANS_DMA_XFER_FROM_USR =		5,
+	TRANS_DMA_XFER_TO_DEV =			6,
+	TRANS_ACTIVATE_FROM_USR =		7,
+	TRANS_ACTIVATE_FROM_DEV =		8,
+	TRANS_ACTIVATE_TO_DEV =			9,
+	TRANS_DEACTIVATE_FROM_USR =		10,
+	TRANS_DEACTIVATE_FROM_DEV =		11,
+	TRANS_STATUS_FROM_USR =			12,
+	TRANS_STATUS_TO_USR =			13,
+	TRANS_STATUS_FROM_DEV =			14,
+	TRANS_STATUS_TO_DEV =			15,
+	TRANS_TERMINATE_FROM_DEV =		16,
+	TRANS_TERMINATE_TO_DEV =		17,
+	TRANS_DMA_XFER_CONT =			18,
+	TRANS_VALIDATE_PARTITION_FROM_DEV =	19,
+	TRANS_VALIDATE_PARTITION_TO_DEV =	20,
+	TRANS_MAX =				21
+};
+
+struct qaic_manage_trans_hdr {
+	__u32 type;	/**< in, value from enum manage_transaction_type */
+	__u32 len;	/**< in, length of this transaction, including the header */
+};
+
+struct qaic_manage_trans_passthrough {
+	struct qaic_manage_trans_hdr hdr;
+	__u8 data[];	/**< in, userspace must encode in little endian */
+};
+
+struct qaic_manage_trans_dma_xfer {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 tag;	/**< in, device specific */
+	__u32 count;	/**< in */
+	__u64 addr;	/**< in, address of the data to transferred via DMA */
+	__u64 size;	/**< in, length of the data to transferred via DMA */
+};
+
+struct qaic_manage_trans_activate_to_dev {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 queue_size;	/**<
+				  * in, number of elements in DBC request
+				  * and respose queue
+				  */
+	__u32 eventfd;		/**< in */
+	__u32 options;		/**< in, device specific */
+	__u32 pad;		/**< pad must be 0 */
+};
+
+struct qaic_manage_trans_activate_from_dev {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 status;	/**< out, status of activate transaction */
+	__u32 dbc_id;	/**< out, Identifier of assigned DMA Bridge channel */
+	__u64 options;	/**< out */
+};
+
+struct qaic_manage_trans_deactivate {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 dbc_id;	/**< in, Identifier of assigned DMA Bridge channel */
+	__u32 pad;	/**< pad must be 0 */
+};
+
+struct qaic_manage_trans_status_to_dev {
+	struct qaic_manage_trans_hdr hdr;
+};
+
+struct qaic_manage_trans_status_from_dev {
+	struct qaic_manage_trans_hdr hdr;
+	__u16 major;	/**< out, major vesrion of NNC protocol used by device */
+	__u16 minor;	/**< out, minor vesrion of NNC protocol used by device */
+	__u32 status;	/**< out, status of query transaction  */
+	__u64 status_flags;	/**<
+				  * out
+				  * 0    : If set then device has CRC check enabled
+				  * 1:63 : Unused
+				  */
+};
+
+struct qaic_manage_msg {
+	__u32 len;	/**< in, Length of valid data - ie sum of all transactions */
+	__u32 count;	/**< in, Number of transactions in message */
+	__u64 data;	/**< in, Pointer to array of transactions */
+};
+
+struct qaic_create_bo {
+	__u64 size;	/**< in, Size of BO in byte */
+	__u32 handle;	/**< out, Returned GEM handle for the BO */
+	__u32 pad;	/**< pad must be 0 */
+};
+
+struct qaic_mmap_bo {
+	__u32 handle;	/**< in, Handle for the BO being mapped. */
+	__u32 pad;	/**< pad must be 0 */
+	__u64 offset;	/**<
+			  * out, offset into the drm node to use for
+			  * subsequent mmap call
+			  */
+};
+
+/**
+ * @brief semaphore command
+ */
+struct qaic_sem {
+	__u16 val;	/**< in, Only lower 12 bits are valid */
+	__u8  index;	/**< in, Only lower 5 bits are valid */
+	__u8  presync;	/**< in, 1 if presync operation, 0 if postsync */
+	__u8  cmd;	/**< in, See enum sem_cmd */
+	__u8  flags;	/**< in, See sem_flags for valid bits.  All others must be 0 */
+	__u16 pad;	/**< pad must be 0 */
+};
+
+struct qaic_attach_slice_entry {
+	__u64 size;		/**< in, Size memory to allocate for this BO slice */
+	struct qaic_sem	sem0;	/**< in, Must be zero if not valid */
+	struct qaic_sem	sem1;	/**< in, Must be zero if not valid */
+	struct qaic_sem	sem2;	/**< in, Must be zero if not valid */
+	struct qaic_sem	sem3;	/**< in, Must be zero if not valid */
+	__u64 dev_addr;		/**< in, Address in device to/from which data is copied */
+	__u64 db_addr;		/**< in, Doorbell address */
+	__u32 db_data;		/**< in, Data to write to doorbell */
+	__u32 db_len;		/**<
+				  * in, Doorbell length - 32, 16, or 8 bits.
+				  * 0 means doorbell is inactive
+				  */
+	__u64 offset;		/**< in, Offset from start of buffer */
+};
+
+struct qaic_attach_slice_hdr {
+	__u32 count;	/**< in, Number of slices for this BO */
+	__u32 dbc_id;	/**< in, Associate this BO with this DMA Bridge channel */
+	__u32 handle;	/**< in, Handle of BO to which slicing information is to be attached */
+	__u32 dir;	/**< in, Direction of data: 1 = DMA_TO_DEVICE, 2 = DMA_FROM_DEVICE */
+	__u64 size;	/**<
+			  * in, Total length of BO
+			  * If BO is imported (DMABUF/PRIME) then this size
+			  * should not exceed the size of DMABUF provided.
+			  * If BO is allocated using DRM_IOCTL_QAIC_CREATE_BO
+			  * then this size should be exactly same as the size
+			  * provided during DRM_IOCTL_QAIC_CREATE_BO.
+			  */
+};
+
+struct qaic_attach_slice {
+	struct qaic_attach_slice_hdr hdr;
+	__u64 data;	/**<
+			  * in, Pointer to a buffer which is container of
+			  * struct qaic_attach_slice_entry[]
+			  */
+};
+
+struct qaic_execute_entry {
+	__u32 handle;	/**< in, buffer handle */
+	__u32 dir;	/**< in, 1 = to device, 2 = from device */
+};
+
+struct qaic_partial_execute_entry {
+	__u32 handle;	/**< in, buffer handle */
+	__u32 dir;	/**< in, 1 = to device, 2 = from device */
+	__u64 resize;	/**< in, 0 = no resize */
+};
+
+struct qaic_execute_hdr {
+	__u32 count;	/**< in, number of executes following this header */
+	__u32 dbc_id;	/**< in, Identifier of assigned DMA Bridge channel */
+};
+
+struct qaic_execute {
+	struct qaic_execute_hdr hdr;
+	__u64 data;	/**< in, qaic_execute_entry or qaic_partial_execute_entry container */
+};
+
+struct qaic_wait {
+	__u32 handle;	/**< in, handle to wait on until execute is complete */
+	__u32 timeout;	/**< in, timeout for wait(in ms) */
+	__u32 dbc_id;	/**< in, Identifier of assigned DMA Bridge channel */
+	__u32 pad;	/**< pad must be 0 */
+};
+
+struct qaic_perf_stats_hdr {
+	__u16 count;	/**< in, Total number BOs requested */
+	__u16 pad;	/**< pad must be 0 */
+	__u32 dbc_id;	/**< in, Identifier of assigned DMA Bridge channel */
+};
+
+struct qaic_perf_stats {
+	struct qaic_perf_stats_hdr hdr;
+	__u64 data;	/**< in, qaic_perf_stats_entry container */
+};
+
+struct qaic_perf_stats_entry {
+	__u32 handle;			/**< in, Handle of the memory request */
+	__u32 queue_level_before;	/**<
+					  * out, Number of elements in queue
+					  * before submission given memory request
+					  */
+	__u32 num_queue_element;	/**<
+					  * out, Number of elements to add in the
+					  * queue for given memory request
+					  */
+	__u32 submit_latency_us;	/**<
+					  * out, Time taken by kernel to submit
+					  * the request to device
+					  */
+	__u32 device_latency_us;	/**<
+					  * out, Time taken by device to execute the
+					  * request. 0 if request is not completed
+					  */
+	__u32 pad;			/**< pad must be 0 */
+};
+
+struct qaic_part_dev {
+	__u32 partition_id;	/**< in, reservation id */
+	__u16 remove;		/**< in, 1 - Remove device 0 - Create device */
+	__u16 pad;		/**< pad must be 0 */
+};
+
+#define DRM_QAIC_MANAGE				0x00
+#define DRM_QAIC_CREATE_BO			0x01
+#define DRM_QAIC_MMAP_BO			0x02
+#define DRM_QAIC_ATTACH_SLICE_BO		0x03
+#define DRM_QAIC_EXECUTE_BO			0x04
+#define DRM_QAIC_PARTIAL_EXECUTE_BO		0x05
+#define DRM_QAIC_WAIT_BO			0x06
+#define DRM_QAIC_PERF_STATS_BO			0x07
+#define DRM_QAIC_PART_DEV			0x08
+
+#define DRM_IOCTL_QAIC_MANAGE			DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_MANAGE, struct qaic_manage_msg)
+#define DRM_IOCTL_QAIC_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_CREATE_BO,	struct qaic_create_bo)
+#define DRM_IOCTL_QAIC_MMAP_BO			DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_MMAP_BO, struct qaic_mmap_bo)
+#define DRM_IOCTL_QAIC_ATTACH_SLICE_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_ATTACH_SLICE_BO, struct qaic_attach_slice)
+#define DRM_IOCTL_QAIC_EXECUTE_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_EXECUTE_BO,	struct qaic_execute)
+#define DRM_IOCTL_QAIC_PARTIAL_EXECUTE_BO	DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_PARTIAL_EXECUTE_BO,	struct qaic_execute)
+#define DRM_IOCTL_QAIC_WAIT_BO			DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_WAIT_BO, struct qaic_wait)
+#define DRM_IOCTL_QAIC_PERF_STATS_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_PERF_STATS_BO, struct qaic_perf_stats)
+#define DRM_IOCTL_QAIC_PART_DEV			DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_PART_DEV, struct qaic_part_dev)
+
+#if defined(__CPLUSPLUS)
+}
+#endif
+
+#endif /* QAIC_DRM_H_ */
-- 
2.7.4

