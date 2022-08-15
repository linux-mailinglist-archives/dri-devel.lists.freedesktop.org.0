Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4B5935CE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0E5D16BE;
	Mon, 15 Aug 2022 18:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA64D161E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:43:16 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FI55v3026647;
 Mon, 15 Aug 2022 18:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=3QYVAqVw8SxZs5e2sW8RYQ/entVpPqjtUdvzI4O67Sg=;
 b=JfnsY0FIVgyLpxrJnqZF3nsV8aDV6lQEu3S47AbL6EK71FZDaTsA0FPT/cLfqmN7+aAt
 /nxoUCyWysDd2/RGKbnwjyq0dvUQWfKT6zp43/FD/sXTgmiv9JO7KmsVuc2oCbkO414i
 uzpZVFmwHqBBZwTdCtVF1EdEPXOC4GHit+YRBcyxRihplLiKba++34RP8luIzU59FDad
 fHXu5lwKUdrb5MTEVx32GPe3/N3VMhSkOQ6pLJQLJZeeIHpe26d+5ayqoovYg47sTAvp
 c1ZwGjN5uh71eohtAnIh+45bzFQw+ahyh5je/J6nY6vu4kkRp/q9OzQlf2tLhFHrY+x2 Ig== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx420p408-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIh90c031946
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:09 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:43:08 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 04/14] drm/qaic: Add MHI controller
Date: Mon, 15 Aug 2022 12:42:26 -0600
Message-ID: <1660588956-24027-5-git-send-email-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: ARpUWzlXLSxCd8ZW-dQlpFW97L52h5ey
X-Proofpoint-ORIG-GUID: ARpUWzlXLSxCd8ZW-dQlpFW97L52h5ey
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

A QAIC device contains a MHI interface with a number of different channels
for controlling different aspects of the device.  The MHI controller works
with the MHI bus to enable and drive that interface.

Change-Id: I77363193b1a2dece7abab287a6acef3cac1b4e1b
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/gpu/drm/qaic/mhi_controller.c | 575 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/qaic/mhi_controller.h |  18 ++
 2 files changed, 593 insertions(+)
 create mode 100644 drivers/gpu/drm/qaic/mhi_controller.c
 create mode 100644 drivers/gpu/drm/qaic/mhi_controller.h

diff --git a/drivers/gpu/drm/qaic/mhi_controller.c b/drivers/gpu/drm/qaic/mhi_controller.c
new file mode 100644
index 0000000..e88e0fe
--- /dev/null
+++ b/drivers/gpu/drm/qaic/mhi_controller.c
@@ -0,0 +1,575 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved. */
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
+static unsigned int mhi_timeout = 2000; /* 2 sec default */
+module_param(mhi_timeout, uint, 0600);
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
+static int mhi_read_reg(struct mhi_controller *mhi_cntl, void __iomem *addr, u32 *out)
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
+static void mhi_write_reg(struct mhi_controller *mhi_cntl, void __iomem *addr,
+			  u32 val)
+{
+	writel_relaxed(val, addr);
+}
+
+static int mhi_runtime_get(struct mhi_controller *mhi_cntl)
+{
+	return 0;
+}
+
+static void mhi_runtime_put(struct mhi_controller *mhi_cntl)
+{
+}
+
+static void mhi_status_cb(struct mhi_controller *mhi_cntl, enum mhi_callback reason)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_cntl->cntrl_dev));
+
+	/* this event occurs in atomic context */
+	if (reason == MHI_CB_FATAL_ERROR)
+		pci_err(qdev->pdev, "Fatal error received from device.  Attempting to recover\n");
+	/* this event occurs in non-atomic context */
+	if (reason == MHI_CB_SYS_ERROR && !qdev->in_reset)
+		qaic_dev_reset_clean_local_state(qdev, true);
+}
+
+static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntl)
+{
+	char time_sec = 1;
+	int current_ee;
+	int ret;
+
+	/* Reset the device to bring the device in PBL EE */
+	mhi_soc_reset(mhi_cntl);
+
+	/*
+	 * Keep checking the execution environment(EE) after every 1 second
+	 * interval.
+	 */
+	do {
+		msleep(1000);
+		current_ee = mhi_get_exec_env(mhi_cntl);
+	} while (current_ee != MHI_EE_PBL && time_sec++ <= MAX_RESET_TIME_SEC);
+
+	/* If the device is in PBL EE retry power up */
+	if (current_ee == MHI_EE_PBL)
+		ret = mhi_async_power_up(mhi_cntl);
+	else
+		ret = -EIO;
+
+	return ret;
+}
+
+struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev,
+						    void __iomem *mhi_bar,
+						    int mhi_irq)
+{
+	struct mhi_controller *mhi_cntl;
+	int ret;
+
+	mhi_cntl = kzalloc(sizeof(*mhi_cntl), GFP_KERNEL);
+	if (!mhi_cntl)
+		return ERR_PTR(-ENOMEM);
+
+	mhi_cntl->cntrl_dev = &pci_dev->dev;
+
+	/*
+	 * Covers the entire possible physical ram region.  Remote side is
+	 * going to calculate a size of this range, so subtract 1 to prevent
+	 * rollover.
+	 */
+	mhi_cntl->iova_start = 0;
+	mhi_cntl->iova_stop = PHYS_ADDR_MAX - 1;
+
+	mhi_cntl->status_cb = mhi_status_cb;
+	mhi_cntl->runtime_get = mhi_runtime_get;
+	mhi_cntl->runtime_put = mhi_runtime_put;
+	mhi_cntl->read_reg = mhi_read_reg;
+	mhi_cntl->write_reg = mhi_write_reg;
+	mhi_cntl->regs = mhi_bar;
+	mhi_cntl->reg_len = SZ_4K;
+	mhi_cntl->nr_irqs = 1;
+	mhi_cntl->irq = kmalloc(sizeof(*mhi_cntl->irq), GFP_KERNEL);
+
+	if (!mhi_cntl->irq) {
+		kfree(mhi_cntl);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	mhi_cntl->irq[0] = mhi_irq;
+
+	mhi_cntl->fw_image = "qcom/aic100/sbl.bin";
+
+	/* use latest configured timeout */
+	aic100_config.timeout_ms = mhi_timeout;
+	ret = mhi_register_controller(mhi_cntl, &aic100_config);
+	if (ret) {
+		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
+		kfree(mhi_cntl->irq);
+		kfree(mhi_cntl);
+		return ERR_PTR(ret);
+	}
+
+	ret = mhi_prepare_for_power_up(mhi_cntl);
+	if (ret) {
+		pci_err(pci_dev, "mhi_prepare_for_power_up failed %d\n", ret);
+		mhi_unregister_controller(mhi_cntl);
+		kfree(mhi_cntl->irq);
+		kfree(mhi_cntl);
+		return ERR_PTR(ret);
+	}
+
+	ret = mhi_async_power_up(mhi_cntl);
+	/*
+	 * If EIO is returned it is possible that device is in SBL EE, which is
+	 * undesired. SOC reset the device and try to power up again.
+	 */
+	if (ret == -EIO && MHI_EE_SBL == mhi_get_exec_env(mhi_cntl)) {
+		pci_err(pci_dev, "Device is not expected to be SBL EE. SOC resetting the device to put it in PBL EE and again trying mhi async power up. Error %d\n",
+			ret);
+		ret = mhi_reset_and_async_power_up(mhi_cntl);
+	}
+
+	if (ret) {
+		pci_err(pci_dev, "mhi_async_power_up failed %d\n", ret);
+		mhi_unprepare_after_power_down(mhi_cntl);
+		mhi_unregister_controller(mhi_cntl);
+		kfree(mhi_cntl->irq);
+		kfree(mhi_cntl);
+		return ERR_PTR(ret);
+	}
+
+	return mhi_cntl;
+}
+
+void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up)
+{
+	mhi_power_down(mhi_cntl, link_up);
+	mhi_unprepare_after_power_down(mhi_cntl);
+	mhi_unregister_controller(mhi_cntl);
+	kfree(mhi_cntl->irq);
+	kfree(mhi_cntl);
+}
+
+void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl)
+{
+	mhi_power_down(mhi_cntl, true);
+}
+
+void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl)
+{
+	struct pci_dev *pci_dev = container_of(mhi_cntl->cntrl_dev,
+					       struct pci_dev, dev);
+	int ret;
+
+	ret = mhi_async_power_up(mhi_cntl);
+	if (ret)
+		pci_err(pci_dev, "mhi_async_power_up failed after reset %d\n", ret);
+}
diff --git a/drivers/gpu/drm/qaic/mhi_controller.h b/drivers/gpu/drm/qaic/mhi_controller.h
new file mode 100644
index 0000000..5a739bb
--- /dev/null
+++ b/drivers/gpu/drm/qaic/mhi_controller.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef MHICONTROLLERQAIC_H_
+#define MHICONTROLLERQAIC_H_
+
+struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev,
+						    void __iomem *mhi_bar,
+						    int mhi_irq);
+
+void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up);
+
+void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl);
+void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl);
+
+#endif /* MHICONTROLLERQAIC_H_ */
-- 
2.7.4

