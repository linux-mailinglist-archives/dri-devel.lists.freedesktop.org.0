Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E05935CD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB85D1733;
	Mon, 15 Aug 2022 18:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126B2D164A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:43:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FIeG4o026049;
 Mon, 15 Aug 2022 18:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=jXwzBWngs45zRQ3sv9ZqWxPExpn7oQHe60w/RgQSYqA=;
 b=YEbhUEtNPySfs8fITGJgVjCB/QVh8KWHhB//LdLxY7Xiii4B6/P4hePBriH2mU5bCcn/
 RNvwnnPBcLtRLd1vdoxH+4aMnlzy/nk3i7csogzduxTadCGPBdvOe6cdZPr6LXAzB+67
 oWj342UXAzCvA8nGzWSCd1C8RvF/yzCIXseW8mW3pkPO06WZS8vgtJZvUYM2FXyPmY3A
 SrLH8G64q8ZQUacnn7kNM36pZB+1Oc2p5ltgC1DxfOwoWh55Zy6y8HL5wG6xq0J5iuFE
 g/hs14AfgivFjk6uGnbWTn9v2NOXqMpN7oyIfp0T9XXf05miDy4fkUP7CLnnehX3dz0/ TA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx420p415-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIhI5R018200
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:18 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:43:17 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 10/14] drm/qaic: Add sysfs
Date: Mon, 15 Aug 2022 12:42:32 -0600
Message-ID: <1660588956-24027-11-git-send-email-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: QF8DvXlWh8Wy0lXv4VivionsS1eJ3fTe
X-Proofpoint-ORIG-GUID: QF8DvXlWh8Wy0lXv4VivionsS1eJ3fTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The QAIC driver can advertise the state of individual dma_bridge channels
to userspace.  Userspace can use this information to manage userspace
state when a channel crashes.

Change-Id: Ifc7435c53cec6aa326bdcd9bfcb77ea7f2a63bab
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/gpu/drm/qaic/qaic_sysfs.c | 113 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 drivers/gpu/drm/qaic/qaic_sysfs.c

diff --git a/drivers/gpu/drm/qaic/qaic_sysfs.c b/drivers/gpu/drm/qaic/qaic_sysfs.c
new file mode 100644
index 0000000..5ee1696
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_sysfs.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/sysfs.h>
+
+#include "qaic.h"
+
+#define NAME_LEN 14
+
+struct dbc_attribute {
+	struct device_attribute dev_attr;
+	u32 dbc_id;
+	char name[NAME_LEN];
+};
+
+static ssize_t dbc_state_show(struct device *dev,
+			      struct device_attribute *a, char *buf)
+{
+	struct dbc_attribute *attr = container_of(a, struct dbc_attribute, dev_attr);
+	struct qaic_device *qdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", qdev->dbc[attr->dbc_id].state);
+}
+
+void set_dbc_state(struct qaic_device *qdev, u32 dbc_id, unsigned int state)
+{
+	char id_str[12];
+	char state_str[16];
+	char *envp[] = { id_str, state_str, NULL };
+	struct qaic_drm_device *qddev;
+
+	if (state >= DBC_STATE_MAX) {
+		pci_dbg(qdev->pdev, "%s invalid state %d\n", __func__, state);
+		return;
+	}
+	if (dbc_id >= qdev->num_dbc) {
+		pci_dbg(qdev->pdev, "%s invalid dbc_id %d\n", __func__, dbc_id);
+		return;
+	}
+	if (state == qdev->dbc[dbc_id].state) {
+		pci_dbg(qdev->pdev, "%s already at state %d\n", __func__, state);
+		return;
+	}
+
+	snprintf(id_str, ARRAY_SIZE(id_str), "DBC_ID=%d", dbc_id);
+	snprintf(state_str, ARRAY_SIZE(state_str), "DBC_STATE=%d", state);
+
+	qdev->dbc[dbc_id].state = state;
+	mutex_lock(&qdev->qaic_drm_devices_mutex);
+	list_for_each_entry(qddev, &qdev->qaic_drm_devices, node)
+		kobject_uevent_env(&qddev->ddev->dev->kobj, KOBJ_CHANGE, envp);
+	mutex_unlock(&qdev->qaic_drm_devices_mutex);
+}
+
+int qaic_sysfs_init(struct qaic_drm_device *qddev)
+{
+	u32 num_dbc = qddev->qdev->num_dbc;
+	struct dbc_attribute *dbc_attrs;
+	int i, ret;
+
+	dbc_attrs = kcalloc(num_dbc, sizeof(*dbc_attrs), GFP_KERNEL);
+	if (!dbc_attrs)
+		return -ENOMEM;
+
+	qddev->sysfs_attrs = dbc_attrs;
+
+	for (i = 0; i < num_dbc; ++i) {
+		struct dbc_attribute *dbc = &dbc_attrs[i];
+
+		sysfs_attr_init(&dbc->dev_attr.attr);
+		dbc->dbc_id = i;
+		snprintf(dbc->name, NAME_LEN, "dbc%d_state", i);
+		dbc->dev_attr.attr.name = dbc->name;
+		dbc->dev_attr.attr.mode = 0444;
+		dbc->dev_attr.show = dbc_state_show;
+		ret = sysfs_create_file(&qddev->ddev->dev->kobj,
+					&dbc->dev_attr.attr);
+		if (ret) {
+			int j;
+
+			for (j = 0; j < i; ++j) {
+				dbc = &dbc_attrs[j];
+				sysfs_remove_file(&qddev->ddev->dev->kobj,
+						  &dbc->dev_attr.attr);
+			}
+			break;
+		}
+	}
+
+	if (ret)
+		kfree(dbc_attrs);
+
+	return ret;
+}
+
+void qaic_sysfs_remove(struct qaic_drm_device *qddev)
+{
+	struct dbc_attribute *dbc_attrs = qddev->sysfs_attrs;
+	u32 num_dbc = qddev->qdev->num_dbc;
+	int i;
+
+	for (i = 0; i < num_dbc; ++i)
+		sysfs_remove_file(&qddev->ddev->dev->kobj,
+				  &dbc_attrs[i].dev_attr.attr);
+
+	kfree(dbc_attrs);
+}
-- 
2.7.4

