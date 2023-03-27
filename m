Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB86CA998
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 17:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FAD10E359;
	Mon, 27 Mar 2023 15:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80010E359
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 15:55:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RAJC4f024627; Mon, 27 Mar 2023 15:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Xzx96BRdop8NTOHg9MvNcIXHGDIHZdcBsLLlYOb840s=;
 b=Uyiwj8Pe3+LM8QFAeIbQkhXwRmqfdP/OP2wJ6QOOQLse4sTnJU1OYVrgqFXG3RsWlCnx
 HqqsSc/pySjjEyyP9i/eGW2eNPXitiq6Nxyxx4UcfML/n3jW3Y48OToG1ynVxb8OKmra
 WMVXBAbekdyYlKgWDC2mmDfS7sASEkHFHSDqoKoQzgqxeZexlEs97tufn2RtNa5IkoJs
 LuSfEQzFhE0eM/lIG4r2nFMD7XwoAnmH/pQEcHFflK3AO+tlWO/FFMNZo9dkU+rLmQz+
 SNOUghkD2NFaYobhaKFPqGPpiulKBqjEPD1k3PcbuAqyc7sWVJIKbDSYsr0t1mURGOmc KA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pk5771fsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 15:55:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32RFtJYv028498
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 15:55:19 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Mar 2023 08:55:18 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v5 3/8] accel/qaic: Add MHI controller
Date: Mon, 27 Mar 2023 09:54:52 -0600
Message-ID: <1679932497-30277-4-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
References: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XFu7xSK4n8T_G1yHe6vIHGyS_tghCzKy
X-Proofpoint-ORIG-GUID: XFu7xSK4n8T_G1yHe6vIHGyS_tghCzKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270128
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mani@kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com,
 quic_carlv@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 bagasdotme@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An AIC100 device contains a MHI interface with a number of different
channels for controlling different aspects of the device. The MHI
controller works with the MHI bus to enable and drive that interface.

AIC100 uses the BHI protocol in PBL to load SBL. The MHI controller
expects the SBL to be located at /lib/firmware/qcom/aic100/sbl.bin and
expects the MHI bus to manage the process of loading and sending SBL to
the device.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/qaic/mhi_controller.c | 563 ++++++++++++++++++++++++++++++++++++
 drivers/accel/qaic/mhi_controller.h |  16 +
 2 files changed, 579 insertions(+)
 create mode 100644 drivers/accel/qaic/mhi_controller.c
 create mode 100644 drivers/accel/qaic/mhi_controller.h

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
new file mode 100644
index 0000000..5036e58
--- /dev/null
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -0,0 +1,563 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/memblock.h>
+#include <linux/mhi.h>
+#include <linux/moduleparam.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+
+#include "mhi_controller.h"
+#include "qaic.h"
+
+#define MAX_RESET_TIME_SEC 25
+
+static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
+module_param(mhi_timeout_ms, uint, 0600);
+MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
+
+static struct mhi_channel_config aic100_channels[] = {
+	{
+		.name = "QAIC_LOOPBACK",
+		.num = 0,
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
+		.name = "QAIC_LOOPBACK",
+		.num = 1,
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
+	{
+		.name = "QAIC_SAHARA",
+		.num = 2,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SAHARA",
+		.num = 3,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_DIAG",
+		.num = 4,
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
+		.name = "QAIC_DIAG",
+		.num = 5,
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
+	{
+		.name = "QAIC_SSR",
+		.num = 6,
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
+		.name = "QAIC_SSR",
+		.num = 7,
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
+	{
+		.name = "QAIC_QDSS",
+		.num = 8,
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
+		.name = "QAIC_QDSS",
+		.num = 9,
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
+	{
+		.name = "QAIC_CONTROL",
+		.num = 10,
+		.num_elements = 128,
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
+		.name = "QAIC_CONTROL",
+		.num = 11,
+		.num_elements = 128,
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
+	{
+		.name = "QAIC_LOGGING",
+		.num = 12,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOGGING",
+		.num = 13,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_STATUS",
+		.num = 14,
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
+		.name = "QAIC_STATUS",
+		.num = 15,
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
+	{
+		.name = "QAIC_TELEMETRY",
+		.num = 16,
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
+		.name = "QAIC_TELEMETRY",
+		.num = 17,
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
+	{
+		.name = "QAIC_DEBUG",
+		.num = 18,
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
+		.name = "QAIC_DEBUG",
+		.num = 19,
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
+	{
+		.name = "QAIC_TIMESYNC",
+		.num = 20,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL | MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.num = 21,
+		.name = "QAIC_TIMESYNC",
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_SBL | MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+};
+
+static struct mhi_event_config aic100_events[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 0,
+		.channel = U32_MAX,
+		.priority = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_CTRL,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+static struct mhi_controller_config aic100_config = {
+	.max_channels = 128,
+	.timeout_ms = 0, /* controlled by mhi_timeout */
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(aic100_channels),
+	.ch_cfg = aic100_channels,
+	.num_events = ARRAY_SIZE(aic100_events),
+	.event_cfg = aic100_events,
+	.use_bounce_buf = false,
+	.m2_no_db = false,
+};
+
+static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
+{
+	u32 tmp = readl_relaxed(addr);
+
+	if (tmp == U32_MAX)
+		return -EIO;
+
+	*out = tmp;
+
+	return 0;
+}
+
+static void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 val)
+{
+	writel_relaxed(val, addr);
+}
+
+static int mhi_runtime_get(struct mhi_controller *mhi_cntrl)
+{
+	return 0;
+}
+
+static void mhi_runtime_put(struct mhi_controller *mhi_cntrl)
+{
+}
+
+static void mhi_status_cb(struct mhi_controller *mhi_cntrl, enum mhi_callback reason)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_cntrl->cntrl_dev));
+
+	/* this event occurs in atomic context */
+	if (reason == MHI_CB_FATAL_ERROR)
+		pci_err(qdev->pdev, "Fatal error received from device. Attempting to recover\n");
+	/* this event occurs in non-atomic context */
+	if (reason == MHI_CB_SYS_ERROR)
+		qaic_dev_reset_clean_local_state(qdev, true);
+}
+
+static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntrl)
+{
+	u8 time_sec = 1;
+	int current_ee;
+	int ret;
+
+	/* Reset the device to bring the device in PBL EE */
+	mhi_soc_reset(mhi_cntrl);
+
+	/*
+	 * Keep checking the execution environment(EE) after every 1 second
+	 * interval.
+	 */
+	do {
+		msleep(1000);
+		current_ee = mhi_get_exec_env(mhi_cntrl);
+	} while (current_ee != MHI_EE_PBL && time_sec++ <= MAX_RESET_TIME_SEC);
+
+	/* If the device is in PBL EE retry power up */
+	if (current_ee == MHI_EE_PBL)
+		ret = mhi_async_power_up(mhi_cntrl);
+	else
+		ret = -EIO;
+
+	return ret;
+}
+
+struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
+						    int mhi_irq)
+{
+	struct mhi_controller *mhi_cntrl;
+	int ret;
+
+	mhi_cntrl = devm_kzalloc(&pci_dev->dev, sizeof(*mhi_cntrl), GFP_KERNEL);
+	if (!mhi_cntrl)
+		return ERR_PTR(-ENOMEM);
+
+	mhi_cntrl->cntrl_dev = &pci_dev->dev;
+
+	/*
+	 * Covers the entire possible physical ram region. Remote side is
+	 * going to calculate a size of this range, so subtract 1 to prevent
+	 * rollover.
+	 */
+	mhi_cntrl->iova_start = 0;
+	mhi_cntrl->iova_stop = PHYS_ADDR_MAX - 1;
+	mhi_cntrl->status_cb = mhi_status_cb;
+	mhi_cntrl->runtime_get = mhi_runtime_get;
+	mhi_cntrl->runtime_put = mhi_runtime_put;
+	mhi_cntrl->read_reg = mhi_read_reg;
+	mhi_cntrl->write_reg = mhi_write_reg;
+	mhi_cntrl->regs = mhi_bar;
+	mhi_cntrl->reg_len = SZ_4K;
+	mhi_cntrl->nr_irqs = 1;
+	mhi_cntrl->irq = devm_kmalloc(&pci_dev->dev, sizeof(*mhi_cntrl->irq), GFP_KERNEL);
+
+	if (!mhi_cntrl->irq)
+		return ERR_PTR(-ENOMEM);
+
+	mhi_cntrl->irq[0] = mhi_irq;
+	mhi_cntrl->fw_image = "qcom/aic100/sbl.bin";
+
+	/* use latest configured timeout */
+	aic100_config.timeout_ms = mhi_timeout_ms;
+	ret = mhi_register_controller(mhi_cntrl, &aic100_config);
+	if (ret) {
+		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = mhi_prepare_for_power_up(mhi_cntrl);
+	if (ret) {
+		pci_err(pci_dev, "mhi_prepare_for_power_up failed %d\n", ret);
+		goto prepare_power_up_fail;
+	}
+
+	ret = mhi_async_power_up(mhi_cntrl);
+	/*
+	 * If EIO is returned it is possible that device is in SBL EE, which is
+	 * undesired. SOC reset the device and try to power up again.
+	 */
+	if (ret == -EIO && MHI_EE_SBL == mhi_get_exec_env(mhi_cntrl)) {
+		pci_err(pci_dev, "Found device in SBL at MHI init. Attempting a reset.\n");
+		ret = mhi_reset_and_async_power_up(mhi_cntrl);
+	}
+
+	if (ret) {
+		pci_err(pci_dev, "mhi_async_power_up failed %d\n", ret);
+		goto power_up_fail;
+	}
+
+	return mhi_cntrl;
+
+power_up_fail:
+	mhi_unprepare_after_power_down(mhi_cntrl);
+prepare_power_up_fail:
+	mhi_unregister_controller(mhi_cntrl);
+	return ERR_PTR(ret);
+}
+
+void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up)
+{
+	mhi_power_down(mhi_cntrl, link_up);
+	mhi_unprepare_after_power_down(mhi_cntrl);
+	mhi_unregister_controller(mhi_cntrl);
+}
+
+void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl)
+{
+	mhi_power_down(mhi_cntrl, true);
+}
+
+void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl)
+{
+	struct pci_dev *pci_dev = container_of(mhi_cntrl->cntrl_dev, struct pci_dev, dev);
+	int ret;
+
+	ret = mhi_async_power_up(mhi_cntrl);
+	if (ret)
+		pci_err(pci_dev, "mhi_async_power_up failed after reset %d\n", ret);
+}
diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
new file mode 100644
index 0000000..2ae45d7
--- /dev/null
+++ b/drivers/accel/qaic/mhi_controller.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef MHICONTROLLERQAIC_H_
+#define MHICONTROLLERQAIC_H_
+
+struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
+						    int mhi_irq);
+void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up);
+void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
+void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
+
+#endif /* MHICONTROLLERQAIC_H_ */
-- 
2.7.4

