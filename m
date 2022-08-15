Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15205935D5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D71AD17A7;
	Mon, 15 Aug 2022 18:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F32D163E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:43:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FHRk8Z024549;
 Mon, 15 Aug 2022 18:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=DmWN72iI/qaQegMTzZ+4Tzbka+iv7YD8g0EibM+T+YE=;
 b=WKrxyPb5G+MsuAh3y4qlopRwwfyURQ/z9mZa9hukaAdixIkJqxgDGIf5xoXAc4dfjCin
 XXtMYwVhXWz10jx2RgIXkqUzbQ3NcqpTA1FpucA3Ty3BrIYhx+//hYVyjBHZfnR25Ya9
 ct/Iyuj4OT+rRj4+nEiuRn1EfjQYlHkSiahGmdpbty0jIqxCiDvJjgVMcoEZhYzddweh
 CApBlU35W4WFRvR2dxFhbpD+si8MIad0rVbNqGDMcr8Ycb/lt1vhw5J6PqfI+RFc0Vvo
 MAdwiGlIj2wBfEU7rhAEGoKHyI3bWe9nprh+4L7PIZoC/8VGZbv2NSEiAxCmhWksSzOQ vA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx58f5yxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIhEJM032562
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:14 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:43:13 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 07/14] drm/qaic: Add debugfs
Date: Mon, 15 Aug 2022 12:42:29 -0600
Message-ID: <1660588956-24027-8-git-send-email-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 0LnKbXp5VWd8sD0jLIul60bBS1m0AAyN
X-Proofpoint-GUID: 0LnKbXp5VWd8sD0jLIul60bBS1m0AAyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add debugfs entries that dump information about the dma_bridge fifo state
and also the SBL boot log.

Change-Id: Ib46b84c07c25afcf0ac2c73304cf6275689d002e
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/gpu/drm/qaic/qaic_debugfs.c | 335 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/qaic/qaic_debugfs.h |  33 ++++
 2 files changed, 368 insertions(+)
 create mode 100644 drivers/gpu/drm/qaic/qaic_debugfs.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_debugfs.h

diff --git a/drivers/gpu/drm/qaic/qaic_debugfs.c b/drivers/gpu/drm/qaic/qaic_debugfs.c
new file mode 100644
index 0000000..82478e3
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_debugfs.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/list.h>
+#include <linux/mhi.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/seq_file.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_file.h>
+
+#include "qaic.h"
+#include "qaic_debugfs.h"
+
+#define BOOTLOG_POOL_SIZE 16
+#define BOOTLOG_MSG_SIZE  512
+
+struct bootlog_msg {
+	/* Buffer for bootlog messages */
+	char str[BOOTLOG_MSG_SIZE];
+	/* Root struct of device, used to access device resources */
+	struct qaic_device *qdev;
+	/* Work struct to schedule work coming on QAIC_LOGGING channel */
+	struct work_struct work;
+};
+
+struct bootlog_page {
+	/* Node in list of bootlog pages maintained by root device struct */
+	struct list_head node;
+	/* Total size of the buffer that holds the bootlogs. It is PAGE_SIZE */
+	unsigned int size;
+	/* Offset for the next bootlog */
+	unsigned int offset;
+};
+
+static int bootlog_show(struct seq_file *s, void *data)
+{
+	struct qaic_device *qdev = s->private;
+	struct bootlog_page *page;
+	void *log;
+	void *page_end;
+
+	mutex_lock(&qdev->bootlog_mutex);
+	list_for_each_entry(page, &qdev->bootlog, node) {
+		log = page + 1;
+		page_end = (void *)page + page->offset;
+		while (log < page_end) {
+			seq_printf(s, "%s", (char *)log);
+			log += strlen(log) + 1;
+		}
+	}
+	mutex_unlock(&qdev->bootlog_mutex);
+
+	return 0;
+}
+
+static int bootlog_open(struct inode *inode, struct file *file)
+{
+	struct qaic_device *qdev = inode->i_private;
+
+	return single_open(file, bootlog_show, qdev);
+}
+
+static const struct file_operations bootlog_fops = {
+	.owner = THIS_MODULE,
+	.open = bootlog_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static int read_dbc_fifo_size(void *data, u64 *value)
+{
+	struct dma_bridge_chan *dbc = (struct dma_bridge_chan *)data;
+
+	*value = dbc->nelem;
+	return 0;
+}
+
+static int read_dbc_queued(void *data, u64 *value)
+{
+	struct dma_bridge_chan *dbc = (struct dma_bridge_chan *)data;
+	u32 tail, head;
+
+	qaic_data_get_fifo_info(dbc, &head, &tail);
+
+	if (head == U32_MAX || tail == U32_MAX)
+		*value = 0;
+	else if (head > tail)
+		*value = dbc->nelem - head + tail;
+	else
+		*value = tail - head;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(dbc_fifo_size_fops, read_dbc_fifo_size, NULL, "%llu\n");
+DEFINE_SIMPLE_ATTRIBUTE(dbc_queued_fops, read_dbc_queued, NULL, "%llu\n");
+
+static void qaic_debugfs_add_dbc_entry(struct qaic_device *qdev, uint16_t dbc_id,
+				       struct dentry *parent)
+{
+	struct dma_bridge_chan *dbc = &qdev->dbc[dbc_id];
+	char name[16];
+
+	snprintf(name, 16, "%s%03u", QAIC_DEBUGFS_DBC_PREFIX, dbc_id);
+
+	dbc->debugfs_root = debugfs_create_dir(name, parent);
+
+	debugfs_create_file(QAIC_DEBUGFS_DBC_FIFO_SIZE, 0444, dbc->debugfs_root,
+			    dbc, &dbc_fifo_size_fops);
+
+	debugfs_create_file(QAIC_DEBUGFS_DBC_QUEUED, 0444, dbc->debugfs_root,
+			    dbc, &dbc_queued_fops);
+}
+
+void qaic_debugfs_init(struct drm_minor *minor)
+{
+	struct qaic_drm_device *qddev = minor->dev->dev_private;
+	struct qaic_device *qdev = qddev->qdev;
+	int i;
+
+	for (i = 0; i < qdev->num_dbc; ++i)
+		qaic_debugfs_add_dbc_entry(qdev, i, minor->debugfs_root);
+
+	debugfs_create_file("bootlog", 0444, minor->debugfs_root, qdev,
+			    &bootlog_fops);
+}
+
+static struct bootlog_page *alloc_bootlog_page(struct qaic_device *qdev)
+{
+	struct bootlog_page *page;
+
+	page = (struct bootlog_page *)__get_free_page(GFP_KERNEL);
+	if (!page)
+		return page;
+
+	page->size = PAGE_SIZE;
+	page->offset = sizeof(*page);
+	list_add_tail(&page->node, &qdev->bootlog);
+
+	return page;
+}
+
+static int reset_bootlog(struct qaic_device *qdev)
+{
+	struct bootlog_page *page;
+	struct bootlog_page *i;
+
+	list_for_each_entry_safe(page, i, &qdev->bootlog, node) {
+		list_del(&page->node);
+		free_page((unsigned long)page);
+	}
+
+	page = alloc_bootlog_page(qdev);
+	if (!page)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void *bootlog_get_space(struct qaic_device *qdev, unsigned int size)
+{
+	struct bootlog_page *page;
+
+	page = list_last_entry(&qdev->bootlog, struct bootlog_page, node);
+
+	if (size > page->size - sizeof(*page))
+		return NULL;
+
+	if (page->offset + size >= page->size) {
+		page = alloc_bootlog_page(qdev);
+		if (!page)
+			return NULL;
+	}
+
+	return (void *)page + page->offset;
+}
+
+static void bootlog_commit(struct qaic_device *qdev, unsigned int size)
+{
+	struct bootlog_page *page;
+
+	page = list_last_entry(&qdev->bootlog, struct bootlog_page, node);
+
+	page->offset += size;
+}
+
+static void bootlog_log(struct work_struct *work)
+{
+	struct bootlog_msg *msg = container_of(work, struct bootlog_msg, work);
+	struct qaic_device *qdev = msg->qdev;
+	unsigned int len = strlen(msg->str) + 1;
+	void *log;
+
+	mutex_lock(&qdev->bootlog_mutex);
+	log = bootlog_get_space(qdev, len);
+	if (log) {
+		memcpy(log, msg, len);
+		bootlog_commit(qdev, len);
+	}
+	mutex_unlock(&qdev->bootlog_mutex);
+	mhi_queue_buf(qdev->bootlog_ch, DMA_FROM_DEVICE, msg, BOOTLOG_MSG_SIZE,
+		      MHI_EOT);
+}
+
+static int qaic_bootlog_mhi_probe(struct mhi_device *mhi_dev,
+				  const struct mhi_device_id *id)
+{
+	struct qaic_device *qdev;
+	struct bootlog_msg *msg;
+	int ret;
+	int i;
+
+	qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
+
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+	qdev->bootlog_ch = mhi_dev;
+
+	qdev->bootlog_wq = alloc_ordered_workqueue("qaic_bootlog", 0);
+	if (!qdev->bootlog_wq) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	mutex_lock(&qdev->bootlog_mutex);
+	ret = reset_bootlog(qdev);
+	mutex_unlock(&qdev->bootlog_mutex);
+	if (ret)
+		goto reset_fail;
+
+	ret = mhi_prepare_for_transfer(qdev->bootlog_ch);
+
+	if (ret)
+		goto prepare_fail;
+
+	for (i = 0; i < BOOTLOG_POOL_SIZE; i++) {
+		msg = kmalloc(sizeof(*msg), GFP_KERNEL);
+		if (!msg) {
+			ret = -ENOMEM;
+			goto alloc_fail;
+		}
+
+		msg->qdev = qdev;
+		INIT_WORK(&msg->work, bootlog_log);
+
+		ret = mhi_queue_buf(qdev->bootlog_ch, DMA_FROM_DEVICE,
+				    msg, BOOTLOG_MSG_SIZE, MHI_EOT);
+		if (ret)
+			goto queue_fail;
+	}
+
+	return 0;
+
+queue_fail:
+alloc_fail:
+	mhi_unprepare_from_transfer(qdev->bootlog_ch);
+prepare_fail:
+reset_fail:
+	flush_workqueue(qdev->bootlog_wq);
+	destroy_workqueue(qdev->bootlog_wq);
+fail:
+	return ret;
+}
+
+static void qaic_bootlog_mhi_remove(struct mhi_device *mhi_dev)
+{
+	struct qaic_device *qdev;
+
+	qdev = dev_get_drvdata(&mhi_dev->dev);
+
+	mhi_unprepare_from_transfer(qdev->bootlog_ch);
+	flush_workqueue(qdev->bootlog_wq);
+	destroy_workqueue(qdev->bootlog_wq);
+}
+
+static void qaic_bootlog_mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+					struct mhi_result *mhi_result)
+{
+}
+
+static void qaic_bootlog_mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+					struct mhi_result *mhi_result)
+{
+	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
+	struct bootlog_msg *msg = mhi_result->buf_addr;
+
+	if (mhi_result->transaction_status) {
+		kfree(msg);
+		return;
+	}
+
+	/* force a null at the end of the transferred string */
+	msg->str[mhi_result->bytes_xferd - 1] = 0;
+
+	queue_work(qdev->bootlog_wq, &msg->work);
+}
+
+static const struct mhi_device_id qaic_bootlog_mhi_match_table[] = {
+	{ .chan = "QAIC_LOGGING", },
+	{},
+};
+
+static struct mhi_driver qaic_bootlog_mhi_driver = {
+	.id_table = qaic_bootlog_mhi_match_table,
+	.remove = qaic_bootlog_mhi_remove,
+	.probe = qaic_bootlog_mhi_probe,
+	.ul_xfer_cb = qaic_bootlog_mhi_ul_xfer_cb,
+	.dl_xfer_cb = qaic_bootlog_mhi_dl_xfer_cb,
+	.driver = {
+		.name = "qaic_bootlog",
+		.owner = THIS_MODULE,
+	},
+};
+
+void qaic_logging_register(void)
+{
+	int ret;
+
+	ret = mhi_driver_register(&qaic_bootlog_mhi_driver);
+	if (ret)
+		DRM_DEBUG("qaic: logging register failed %d\n", ret);
+}
+
+void qaic_logging_unregister(void)
+{
+	mhi_driver_unregister(&qaic_bootlog_mhi_driver);
+}
diff --git a/drivers/gpu/drm/qaic/qaic_debugfs.h b/drivers/gpu/drm/qaic/qaic_debugfs.h
new file mode 100644
index 0000000..3d7878c
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_debugfs.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#ifndef __QAIC_DEBUGFS_H__
+#define __QAIC_DEBUGFS_H__
+
+#include <linux/debugfs.h>
+#include <linux/pci.h>
+#include <drm/drm_file.h>
+
+#define QAIC_DEBUGFS_ROOT		"qaic"
+#define QAIC_DEBUGFS_DBC_PREFIX		"dbc"
+#define QAIC_DEBUGFS_DBC_FIFO_SIZE	"fifo_size"
+#define QAIC_DEBUGFS_DBC_QUEUED		"queued"
+
+extern struct dentry *qaic_debugfs_dir;
+
+#ifdef CONFIG_DEBUG_FS
+
+void qaic_logging_register(void);
+void qaic_logging_unregister(void);
+void qaic_debugfs_init(struct drm_minor *minor);
+
+#else /* !CONFIG_DEBUG_FS */
+
+void qaic_logging_register(void) {}
+void qaic_logging_unregister(void) {}
+void qaic_debugfs_init(struct drm_minor *minor) {}
+
+#endif /* !CONFIG_DEBUG_FS */
+#endif /* __QAIC_DEBUGFS_H__ */
-- 
2.7.4

