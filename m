Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF3D7BBCC2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 18:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3991410E536;
	Fri,  6 Oct 2023 16:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E02A10E535
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 16:32:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 396FUDj2026328; Fri, 6 Oct 2023 16:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=0kH6ZDY/xI9u//wLvbiWUaXZg8LCtz7Vcr27C2sYvZ0=;
 b=aUKND2kmhi1Tvi1jbV/+ZOzF6L2M8eMGdj+l0fjHQgD/82uOd2020aMZ9yPPiB2yHo8g
 fmekn2fvRy7zOevyLOj+tGHv2VcGiHP7pjfGCfwEQN5Fg7aWPpB/a2YoFj/imG16lPmZ
 hJpBpFguJmGC3T/7SzEIy/CtYOeZPgEWj8yeXQTqbmxPSVo4c41T5d/6Jqpii0kxLXZm
 4pCPNRotipWyAn1mwh6VW2Ve2shn0JCRFwY29DoJq+RlhaAKCcJnxLPfUC8tP9BFaqp5
 HU5g9DJkRQUGHywKiJjkBZX2BhT37n/61oud0nYUfnZSvniQX4nLUsQAxC6yX/O4jfXn SQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tj38na9cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Oct 2023 16:32:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 396GWWdx016575
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Oct 2023 16:32:32 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 6 Oct 2023 09:32:31 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_ajitpals@quicinc.com>, <quic_carlv@quicinc.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <ogabbay@kernel.org>
Subject: [PATCH 1/2] accel/qaic: Add support for periodic timesync
Date: Fri, 6 Oct 2023 10:32:09 -0600
Message-ID: <20231006163210.21319-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006163210.21319-1-quic_jhugo@quicinc.com>
References: <20231006163210.21319-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HOUkdS-ELARc6iuXfBX62Wzbc5jHmXYr
X-Proofpoint-GUID: HOUkdS-ELARc6iuXfBX62Wzbc5jHmXYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_12,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060124
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

From: Ajit Pal Singh <quic_ajitpals@quicinc.com>

Device and Host have a time synchronization mechanism that happens once
during boot when device is in SBL mode. After that, in mission-mode there
is no timesync. In an experiment after continuous operation, device time
drifted w.r.t. host by approximately 3 seconds per day. This drift leads
to mismatch in timestamp of device and Host logs. To correct this
implement periodic timesync in driver. This timesync is carried out via
QAIC_TIMESYNC_PERIODIC MHI channel.

Signed-off-by: Ajit Pal Singh <quic_ajitpals@quicinc.com>
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 Documentation/accel/qaic/aic100.rst |   4 +
 Documentation/accel/qaic/qaic.rst   |   5 +
 drivers/accel/qaic/Makefile         |   3 +-
 drivers/accel/qaic/mhi_controller.c |  32 ++++
 drivers/accel/qaic/qaic_drv.c       |  10 ++
 drivers/accel/qaic/qaic_timesync.c  | 229 ++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_timesync.h  |  11 ++
 7 files changed, 293 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/qaic/qaic_timesync.c
 create mode 100644 drivers/accel/qaic/qaic_timesync.h

diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
index c80d0f1307db..982b00d91d02 100644
--- a/Documentation/accel/qaic/aic100.rst
+++ b/Documentation/accel/qaic/aic100.rst
@@ -224,6 +224,10 @@ of the defined channels, and their uses.
 |                |         |          | device side logs with the host time    |
 |                |         |          | source.                                |
 +----------------+---------+----------+----------------------------------------+
+| QAIC_TIMESYNC_ | 22 & 23 | AMSS     | Used to periodically synchronize       |
+| PERIODIC       |         |          | timestamps in the device side logs with|
+|                |         |          | the host time source.                  |
++----------------+---------+----------+----------------------------------------+
 
 DMA Bridge
 ==========
diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index c88502383136..b3788dbc3ed2 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -178,3 +178,8 @@ overrides this for that call. Default is 5000 (5 seconds).
 
 Sets the polling interval in microseconds (us) when datapath polling is active.
 Takes effect at the next polling interval. Default is 100 (100 us).
+
+**timesync_delay_ms (unsigned int)**
+
+Sets the time interval in milliseconds (ms) between two consecutive timesync
+operations. Default is 1000 (1000 ms).
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 2418418f7a50..3f7f6dfde7f2 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -9,4 +9,5 @@ qaic-y := \
 	mhi_controller.o \
 	qaic_control.o \
 	qaic_data.o \
-	qaic_drv.o
+	qaic_drv.o \
+	qaic_timesync.o
diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 5036e58e7235..bea428e6d2e9 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -373,6 +373,38 @@ static struct mhi_channel_config aic100_channels[] = {
 		.auto_queue = false,
 		.wake_capable = false,
 	},
+	{
+		.name = "QAIC_TIMESYNC_PERIODIC",
+		.num = 22,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.num = 23,
+		.name = "QAIC_TIMESYNC_PERIODIC",
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
 };
 
 static struct mhi_event_config aic100_events[] = {
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 6f58095767df..4f449ea7eb2f 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -27,6 +27,7 @@
 
 #include "mhi_controller.h"
 #include "qaic.h"
+#include "qaic_timesync.h"
 
 MODULE_IMPORT_NS(DMA_BUF);
 
@@ -586,8 +587,16 @@ static int __init qaic_init(void)
 		goto free_pci;
 	}
 
+	ret = qaic_timesync_init();
+	if (ret) {
+		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
+		goto free_mhi;
+	}
+
 	return 0;
 
+free_mhi:
+	mhi_driver_unregister(&qaic_mhi_driver);
 free_pci:
 	pci_unregister_driver(&qaic_pci_driver);
 	return ret;
@@ -611,6 +620,7 @@ static void __exit qaic_exit(void)
 	 * reinitializing the link_up state after the cleanup is done.
 	 */
 	link_up = true;
+	qaic_timesync_deinit();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
new file mode 100644
index 000000000000..dfbd654ae79d
--- /dev/null
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/time64.h>
+#include <linux/timer.h>
+
+#include "qaic.h"
+#include "qaic_timesync.h"
+
+#define QTIMER_REG_OFFSET			0xa28
+#define QAIC_TIMESYNC_SIGNATURE			0x55aa
+#define QAIC_CONV_QTIMER_TO_US(qtimer)		(mul_u64_u32_div(qtimer, 10, 192))
+
+static unsigned int timesync_delay_ms = 1000; /* 1 sec default */
+module_param(timesync_delay_ms, uint, 0600);
+MODULE_PARM_DESC(timesync_delay_ms, "Delay in ms between two consecutive timesync operations");
+
+enum qts_msg_type {
+	QAIC_TS_SYNC_REQ = 1,
+	QAIC_TS_ACK_TO_HOST,
+	QAIC_TS_MSG_TYPE_MAX
+};
+
+/**
+ * struct qts_hdr - Timesync message header structure.
+ * @signature: Unique signature to identify the timesync message.
+ * @reserved_1: Reserved for future use.
+ * @reserved_2: Reserved for future use.
+ * @msg_type: sub-type of the timesync message.
+ * @reserved_3: Reserved for future use.
+ */
+struct qts_hdr {
+	__le16	signature;
+	__le16	reserved_1;
+	u8	reserved_2;
+	u8	msg_type;
+	__le16	reserved_3;
+} __packed;
+
+/**
+ * struct qts_timeval - Structure to carry time information.
+ * @tv_sec: Seconds part of the time.
+ * @tv_usec: uS (microseconds) part of the time.
+ */
+struct qts_timeval {
+	__le64	tv_sec;
+	__le64	tv_usec;
+} __packed;
+
+/**
+ * struct qts_host_time_sync_msg_data - Structure to denote the timesync message.
+ * @header: Header of the timesync message.
+ * @data: Time information.
+ */
+struct qts_host_time_sync_msg_data {
+	struct	qts_hdr header;
+	struct	qts_timeval data;
+} __packed;
+
+/**
+ * struct mqts_dev - MHI QAIC Timesync Control device.
+ * @qdev: Pointer to the root device struct driven by QAIC driver.
+ * @mhi_dev: Pointer to associated MHI device.
+ * @timer: Timer handle used for timesync.
+ * @qtimer_addr: Device QTimer register pointer.
+ * @buff_in_use: atomic variable to track if the sync_msg buffer is in use.
+ * @dev: Device pointer to qdev->pdev->dev stored for easy access.
+ * @sync_msg: Buffer used to send timesync message over MHI.
+ */
+struct mqts_dev {
+	struct qaic_device *qdev;
+	struct mhi_device *mhi_dev;
+	struct timer_list timer;
+	void __iomem *qtimer_addr;
+	atomic_t buff_in_use;
+	struct device *dev;
+	struct qts_host_time_sync_msg_data *sync_msg;
+};
+
+static void qaic_timesync_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
+{
+	struct mqts_dev *mqtsdev = dev_get_drvdata(&mhi_dev->dev);
+
+	dev_dbg(mqtsdev->dev, "%s status: %d xfer_len: %zu\n", __func__,
+		mhi_result->transaction_status, mhi_result->bytes_xferd);
+
+	atomic_set(&mqtsdev->buff_in_use, 0);
+}
+
+static void qaic_timesync_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
+{
+	struct mqts_dev *mqtsdev = dev_get_drvdata(&mhi_dev->dev);
+
+	dev_err(mqtsdev->dev, "%s no data expected on dl channel\n", __func__);
+}
+
+static void qaic_timesync_timer(struct timer_list *t)
+{
+	struct mqts_dev *mqtsdev = from_timer(mqtsdev, t, timer);
+	struct qts_host_time_sync_msg_data *sync_msg;
+	u64 device_qtimer_us;
+	u64 device_qtimer;
+	u64 host_time_us;
+	u64 offset_us;
+	u64 host_sec;
+	int ret;
+
+	if (atomic_read(&mqtsdev->buff_in_use)) {
+		dev_dbg(mqtsdev->dev, "%s buffer not free, schedule next cycle\n", __func__);
+		goto mod_timer;
+	}
+	atomic_set(&mqtsdev->buff_in_use, 1);
+
+	sync_msg = mqtsdev->sync_msg;
+	sync_msg->header.signature = cpu_to_le16(QAIC_TIMESYNC_SIGNATURE);
+	sync_msg->header.msg_type = QAIC_TS_SYNC_REQ;
+	/* Read host UTC time and convert to uS*/
+	host_time_us = div_u64(ktime_get_real_ns(), NSEC_PER_USEC);
+	device_qtimer = readq(mqtsdev->qtimer_addr);
+	device_qtimer_us = QAIC_CONV_QTIMER_TO_US(device_qtimer);
+	/* Offset between host UTC and device time */
+	offset_us = host_time_us - device_qtimer_us;
+
+	host_sec = div_u64(offset_us, USEC_PER_SEC);
+	sync_msg->data.tv_usec = cpu_to_le64(offset_us - host_sec * USEC_PER_SEC);
+	sync_msg->data.tv_sec = cpu_to_le64(host_sec);
+	ret = mhi_queue_buf(mqtsdev->mhi_dev, DMA_TO_DEVICE, sync_msg, sizeof(*sync_msg), MHI_EOT);
+	if (ret && (ret != -EAGAIN)) {
+		dev_err(mqtsdev->dev, "%s unable to queue to mhi:%d\n", __func__, ret);
+		return;
+	} else if (ret == -EAGAIN) {
+		atomic_set(&mqtsdev->buff_in_use, 0);
+	}
+
+mod_timer:
+	ret = mod_timer(t, jiffies + msecs_to_jiffies(timesync_delay_ms));
+	if (ret)
+		dev_err(mqtsdev->dev, "%s mod_timer error:%d\n", __func__, ret);
+}
+
+static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
+	struct mqts_dev *mqtsdev;
+	struct timer_list *timer;
+	int ret;
+
+	mqtsdev = kzalloc(sizeof(*mqtsdev), GFP_KERNEL);
+	if (!mqtsdev) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	timer = &mqtsdev->timer;
+	mqtsdev->mhi_dev = mhi_dev;
+	mqtsdev->qdev = qdev;
+	mqtsdev->dev = &qdev->pdev->dev;
+
+	mqtsdev->sync_msg = kzalloc(sizeof(*mqtsdev->sync_msg), GFP_KERNEL);
+	if (!mqtsdev->sync_msg) {
+		ret = -ENOMEM;
+		goto free_mqts_dev;
+	}
+	atomic_set(&mqtsdev->buff_in_use, 0);
+
+	ret = mhi_prepare_for_transfer(mhi_dev);
+	if (ret)
+		goto free_sync_msg;
+
+	/* Qtimer register pointer */
+	mqtsdev->qtimer_addr = qdev->bar_0 + QTIMER_REG_OFFSET;
+	timer_setup(timer, qaic_timesync_timer, 0);
+	timer->expires = jiffies + msecs_to_jiffies(timesync_delay_ms);
+	add_timer(timer);
+	dev_set_drvdata(&mhi_dev->dev, mqtsdev);
+
+	return 0;
+
+free_sync_msg:
+	kfree(mqtsdev->sync_msg);
+free_mqts_dev:
+	kfree(mqtsdev);
+out:
+	return ret;
+};
+
+static void qaic_timesync_remove(struct mhi_device *mhi_dev)
+{
+	struct mqts_dev *mqtsdev = dev_get_drvdata(&mhi_dev->dev);
+
+	del_timer_sync(&mqtsdev->timer);
+	mhi_unprepare_from_transfer(mqtsdev->mhi_dev);
+	kfree(mqtsdev->sync_msg);
+	kfree(mqtsdev);
+}
+
+static const struct mhi_device_id qaic_timesync_match_table[] = {
+	{ .chan = "QAIC_TIMESYNC_PERIODIC"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(mhi, qaic_timesync_match_table);
+
+static struct mhi_driver qaic_timesync_driver = {
+	.id_table = qaic_timesync_match_table,
+	.remove = qaic_timesync_remove,
+	.probe = qaic_timesync_probe,
+	.ul_xfer_cb = qaic_timesync_ul_xfer_cb,
+	.dl_xfer_cb = qaic_timesync_dl_xfer_cb,
+	.driver = {
+		.name = "qaic_timesync_periodic",
+	},
+};
+
+int qaic_timesync_init(void)
+{
+	return mhi_driver_register(&qaic_timesync_driver);
+}
+
+void qaic_timesync_deinit(void)
+{
+	mhi_driver_unregister(&qaic_timesync_driver);
+}
diff --git a/drivers/accel/qaic/qaic_timesync.h b/drivers/accel/qaic/qaic_timesync.h
new file mode 100644
index 000000000000..851b7acd43bb
--- /dev/null
+++ b/drivers/accel/qaic/qaic_timesync.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __QAIC_TIMESYNC_H__
+#define __QAIC_TIMESYNC_H__
+
+int qaic_timesync_init(void);
+void qaic_timesync_deinit(void);
+#endif /* __QAIC_TIMESYNC_H__ */
-- 
2.40.1

