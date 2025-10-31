Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12637C266C1
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D454010EBFE;
	Fri, 31 Oct 2025 17:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWFbfuVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9044B10EBFE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:42:22 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V9QhP01417342; Fri, 31 Oct 2025 17:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=h8BNI8+a+hm
 CZsoTpX/IRjKA7LvBNd0NqUqSLGFM/K0=; b=cWFbfuVKlJYr4LZkgvrSIiOlrfx
 HC4bczhIfuDqCDM0wO13L3/vS2+EB+HogwxM7pr5OSoPG3YaJmxUXSZMVrbdu2/C
 Td4X5q8j4n7xlQTMffuDtJY8E8ChizxrksPl+wzTOAZTo/THf0QFWQuqbs9yi7Zm
 VC14zhBV7OWiSc6GRcfxpQer9i5Bm5iND76h5pBIMpTtv3XFeXhF2Ip3ZGEdcdhE
 9xdW59AGqlKXp8BSAoyEyokuxW3mwMt3vFhhl1ZBJSoK9ASDL761Yme6QvkfiMCy
 GF4xPwZu3JRYkvdDKJEygqXbx8XX5eUk4Tmvi0vVYgt112907naBDhwi1aQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69jkhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 17:42:16 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59VHfLwd015068; 
 Fri, 31 Oct 2025 17:42:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4a4er42utj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 17:42:14 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59VHgElq016643;
 Fri, 31 Oct 2025 17:42:14 GMT
Received: from hu-devc-lv-u22-a.qualcomm.com (hu-zmckevit-lv.qualcomm.com
 [10.81.26.129])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 59VHgEup016642
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 17:42:14 +0000
Received: by hu-devc-lv-u22-a.qualcomm.com (Postfix, from userid 4696302)
 id BB6A75B6; Fri, 31 Oct 2025 10:42:14 -0700 (PDT)
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson@kernel.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Subject: [PATCH v3 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and
 uevents
Date: Fri, 31 Oct 2025 10:41:00 -0700
Message-Id: <20251031174059.2814445-2-zachary.mckevitt@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
References: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE1OCBTYWx0ZWRfX6wJG+74jzvw1
 WRPGI3IW345lKQZP3ITOkwBt5EQmmY6p1usWSG+WPtILfD+yzUOtnnf5RPeJ1x3NmWa37GrZznv
 ptNej8iin0HGpm3KL6FPolkgHc4BhyImb9fUjsnA7GuRD/lOXlYKMu4n5YVn2FXybIEsLjhnhXp
 S9SpVXWid1P+RuUE1KoqMW6S855vhjDbJFSFPZxWB+/x9/LjAMC+pNmRamykt3GH8W4tL0NPTLO
 suWmfJ/ooIJ9v25zVDLVxfLIPrkvRvWq3EUkHCJgnkoE7qYypcO3a0ZvfYHPgsh9iLarwRBAuEk
 NoSPxVCqnxa/43PKsq73RRX5ldAyi+zgo08aGcZhaohix+QyempkFA0w+tESBwniC2t94+HK/ju
 3B2mNBPisey9Pf0Je6y9PFkXw7BfJQ==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=6904f4f8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Daa-j-S88kUyKuYrnl4A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: IUIdiGP1jOvI3mouTZWrGM3Eu0eRkVPW
X-Proofpoint-ORIG-GUID: IUIdiGP1jOvI3mouTZWrGM3Eu0eRkVPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310158
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

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Expose sysfs files for each DBC representing the current state of that DBC.
For example, sysfs for DBC ID 0 and accel minor number 0 looks like this,

/sys/class/accel/accel0/dbc0_state

Following are the states and their corresponding values,
DBC_STATE_IDLE (0)
DBC_STATE_ASSIGNED (1)
DBC_STATE_BEFORE_SHUTDOWN (2)
DBC_STATE_AFTER_SHUTDOWN (3)
DBC_STATE_BEFORE_POWER_UP (4)
DBC_STATE_AFTER_POWER_UP (5)

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
---
 Documentation/ABI/stable/sysfs-driver-qaic |  16 +++
 drivers/accel/qaic/Makefile                |   1 +
 drivers/accel/qaic/qaic.h                  |  25 +++++
 drivers/accel/qaic/qaic_control.c          |   2 +
 drivers/accel/qaic/qaic_drv.c              |   8 ++
 drivers/accel/qaic/qaic_sysfs.c            | 109 +++++++++++++++++++++
 6 files changed, 161 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-qaic
 create mode 100644 drivers/accel/qaic/qaic_sysfs.c

diff --git a/Documentation/ABI/stable/sysfs-driver-qaic b/Documentation/ABI/stable/sysfs-driver-qaic
new file mode 100644
index 000000000000..e5876935e62b
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-driver-qaic
@@ -0,0 +1,16 @@
+What:		/sys/bus/pci/drivers/qaic/XXXX:XX:XX.X/accel/accel<minor_nr>/dbc<N>_state
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
+Description:	Represents the current state of DMA Bridge channel (DBC). Below are the possible
+		states,
+		IDLE (0) -		DBC is free and can be activated
+		ASSIGNED (1) -		DBC is activated and a workload is running on device
+		BEFORE_SHUTDOWN (2) -	Sub-system associated with this workload has crashed and
+					it will shutdown soon
+		AFTER_SHUTDOWN (3) -	Sub-system associated with this workload has crashed and
+					it has shutdown
+		BEFORE_POWER_UP (4) -	Sub-system associated with this workload is shutdown and
+					it will be powered up soon
+		AFTER_POWER_UP (5) -	Sub-system associated with this workload is now powered up
+Users:		Any userspace application or clients interested in DBC state.
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 1106b876f737..8f6746e5f03a 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -11,6 +11,7 @@ qaic-y := \
 	qaic_data.o \
 	qaic_drv.o \
 	qaic_ras.o \
+	qaic_sysfs.o \
 	qaic_timesync.o \
 	sahara.o
 
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 820d133236dd..4c2f25249e95 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -47,6 +47,22 @@ enum __packed dev_states {
 	QAIC_ONLINE,
 };
 
+enum dbc_states {
+	/* DBC is free and can be activated */
+	DBC_STATE_IDLE,
+	/* DBC is activated and a workload is running on device */
+	DBC_STATE_ASSIGNED,
+	/* Sub-system associated with this workload has crashed and it will shutdown soon */
+	DBC_STATE_BEFORE_SHUTDOWN,
+	/* Sub-system associated with this workload has crashed and it has shutdown */
+	DBC_STATE_AFTER_SHUTDOWN,
+	/* Sub-system associated with this workload is shutdown and it will be powered up soon */
+	DBC_STATE_BEFORE_POWER_UP,
+	/* Sub-system associated with this workload is now powered up */
+	DBC_STATE_AFTER_POWER_UP,
+	DBC_STATE_MAX,
+};
+
 extern bool datapath_polling;
 
 struct qaic_user {
@@ -114,6 +130,8 @@ struct dma_bridge_chan {
 	unsigned int		irq;
 	/* Polling work item to simulate interrupts */
 	struct work_struct	poll_work;
+	/* Represents various states of this DBC from enum dbc_states */
+	unsigned int		state;
 };
 
 struct qaic_device {
@@ -195,6 +213,8 @@ struct qaic_drm_device {
 	struct list_head	users;
 	/* Synchronizes access to users list */
 	struct mutex		users_mutex;
+	/* Pointer to array of DBC sysfs attributes */
+	void			*sysfs_attrs;
 };
 
 struct qaic_bo {
@@ -319,4 +339,9 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
 void irq_polling_work(struct work_struct *work);
 
+/* qaic_sysfs.c */
+int qaic_sysfs_init(struct qaic_drm_device *qddev);
+void qaic_sysfs_remove(struct qaic_drm_device *qddev);
+void set_dbc_state(struct qaic_device *qdev, u32 dbc_id, unsigned int state);
+
 #endif /* _QAIC_H_ */
diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 9af8333db513..7de767476d81 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -310,6 +310,7 @@ static void save_dbc_buf(struct qaic_device *qdev, struct ioctl_resources *resou
 		enable_dbc(qdev, dbc_id, usr);
 		qdev->dbc[dbc_id].in_use = true;
 		resources->buf = NULL;
+		set_dbc_state(qdev, dbc_id, DBC_STATE_ASSIGNED);
 	}
 }
 
@@ -923,6 +924,7 @@ static int decode_deactivate(struct qaic_device *qdev, void *trans, u32 *msg_len
 	}
 
 	release_dbc(qdev, dbc_id);
+	set_dbc_state(qdev, dbc_id, DBC_STATE_IDLE);
 	*msg_len += sizeof(*in_trans);
 
 	return 0;
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index e162f4b8a262..a8a16f20320f 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -270,6 +270,13 @@ static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id)
 		return ret;
 	}
 
+	ret = qaic_sysfs_init(qddev);
+	if (ret) {
+		drm_dev_unregister(drm);
+		pci_dbg(qdev->pdev, "qaic_sysfs_init failed %d\n", ret);
+		return ret;
+	}
+
 	qaic_debugfs_init(qddev);
 
 	return ret;
@@ -281,6 +288,7 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 	struct drm_device *drm = to_drm(qddev);
 	struct qaic_user *usr;
 
+	qaic_sysfs_remove(qddev);
 	drm_dev_unregister(drm);
 	qddev->partition_id = 0;
 	/*
diff --git a/drivers/accel/qaic/qaic_sysfs.c b/drivers/accel/qaic/qaic_sysfs.c
new file mode 100644
index 000000000000..e0afb0ffb589
--- /dev/null
+++ b/drivers/accel/qaic/qaic_sysfs.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2020-2025, The Linux Foundation. All rights reserved. */
+
+#include <drm/drm_file.h>
+#include <drm/drm_managed.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+
+#include "qaic.h"
+
+#define NAME_LEN		14
+
+struct dbc_attribute {
+	struct device_attribute dev_attr;
+	u32 dbc_id;
+	char name[NAME_LEN];
+};
+
+static ssize_t dbc_state_show(struct device *dev, struct device_attribute *a, char *buf)
+{
+	struct dbc_attribute *dbc_attr = container_of(a, struct dbc_attribute, dev_attr);
+	struct drm_minor *minor = dev_get_drvdata(dev);
+	struct qaic_device *qdev;
+
+	qdev = to_qaic_device(minor->dev);
+	return sysfs_emit(buf, "%d\n", qdev->dbc[dbc_attr->dbc_id].state);
+}
+
+void set_dbc_state(struct qaic_device *qdev, u32 dbc_id, unsigned int state)
+{
+	struct device *kdev = to_accel_kdev(qdev->qddev);
+	char *envp[3] = {};
+	char state_str[16];
+	char id_str[12];
+
+	envp[0] = id_str;
+	envp[1] = state_str;
+
+	if (state >= DBC_STATE_MAX)
+		return;
+	if (dbc_id >= qdev->num_dbc)
+		return;
+	if (state == qdev->dbc[dbc_id].state)
+		return;
+
+	scnprintf(id_str, ARRAY_SIZE(id_str), "DBC_ID=%d", dbc_id);
+	scnprintf(state_str, ARRAY_SIZE(state_str), "DBC_STATE=%d", state);
+
+	qdev->dbc[dbc_id].state = state;
+	kobject_uevent_env(&kdev->kobj, KOBJ_CHANGE, envp);
+}
+
+int qaic_sysfs_init(struct qaic_drm_device *qddev)
+{
+	struct device *kdev = to_accel_kdev(qddev);
+	struct drm_device *drm = to_drm(qddev);
+	u32 num_dbc = qddev->qdev->num_dbc;
+	struct dbc_attribute *dbc_attrs;
+	int i, ret;
+
+	dbc_attrs = drmm_kcalloc(drm, num_dbc, sizeof(*dbc_attrs), GFP_KERNEL);
+	if (!dbc_attrs)
+		return -ENOMEM;
+
+	for (i = 0; i < num_dbc; ++i) {
+		struct dbc_attribute *dbc_attr = &dbc_attrs[i];
+
+		sysfs_attr_init(&dbc_attr->dev_attr.attr);
+		dbc_attr->dbc_id = i;
+		scnprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
+		dbc_attr->dev_attr.attr.name = dbc_attr->name;
+		dbc_attr->dev_attr.attr.mode = 0444;
+		dbc_attr->dev_attr.show = dbc_state_show;
+		ret = sysfs_create_file(&kdev->kobj, &dbc_attr->dev_attr.attr);
+		if (ret) {
+			int j;
+
+			for (j = 0; j < i; ++j) {
+				dbc_attr = &dbc_attrs[j];
+				sysfs_remove_file(&kdev->kobj, &dbc_attr->dev_attr.attr);
+			}
+			drmm_kfree(drm, dbc_attrs);
+			return ret;
+		}
+	}
+
+	qddev->sysfs_attrs = dbc_attrs;
+	return 0;
+}
+
+void qaic_sysfs_remove(struct qaic_drm_device *qddev)
+{
+	struct dbc_attribute *dbc_attrs = qddev->sysfs_attrs;
+	struct device *kdev = to_accel_kdev(qddev);
+	u32 num_dbc = qddev->qdev->num_dbc;
+	int i;
+
+	if (!dbc_attrs)
+		return;
+
+	qddev->sysfs_attrs = NULL;
+	for (i = 0; i < num_dbc; ++i)
+		sysfs_remove_file(&kdev->kobj, &dbc_attrs[i].dev_attr.attr);
+	drmm_kfree(to_drm(qddev), dbc_attrs);
+}
-- 
2.34.1

