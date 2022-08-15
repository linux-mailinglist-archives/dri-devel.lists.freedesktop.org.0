Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74E5A0025
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44822B6BDB;
	Wed, 24 Aug 2022 17:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2F2D161E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:43:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FFMnKg029035;
 Mon, 15 Aug 2022 18:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=1ajGvzAc2NsoHpI1OqFVPSBqdyJX5P1r4804eNDBHjU=;
 b=I8nA1WpFJz2uafraeLoqKMB6r3LH/YRxepaOOEp9OzxLM+nAsM3K3RdZLq2jMX80gSoU
 KcI0EaZe67CACMzwpUI/aTLvkWSgWdmL66KUCYJ0bybhRvV2VxBZlYNO2WsvlLxh22Fk
 Z2tFhHnkC34I/wtQxL2MhLEL/x5hmZ8ijJSn2QA+j3lM46IZb39zrvK4zU9VAcQs322q
 2Dlug2IyKsFSGTsS6lcCq45PWP+qWtbupHywyYV0KvxONinvpGrK/XUofL5VYMFC+C88
 gpfICECHiDciHwa/gSO9D1M0u1tYSwmAqztUJckH3tRslg03dI0unUzgpiqHs9TWgL+T 8g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx420p40e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIhFUv031770
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:15 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:43:14 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 08/14] drm/qaic: Add RAS component
Date: Mon, 15 Aug 2022 12:42:30 -0600
Message-ID: <1660588956-24027-9-git-send-email-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: zOA23Wr2VNT3hBn1q8NisCwGi3fXOlT6
X-Proofpoint-ORIG-GUID: zOA23Wr2VNT3hBn1q8NisCwGi3fXOlT6
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

A QAIC device can report a number of different internal errors.  The RAS
component services these reports by logging them for the sysadmin, and
collecting statistics.

Change-Id: Ib2f0731daf9a4afe05724e550c72bf32313e79bc
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/gpu/drm/qaic/qaic_ras.c | 653 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/qaic/qaic_ras.h |  11 +
 2 files changed, 664 insertions(+)
 create mode 100644 drivers/gpu/drm/qaic/qaic_ras.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_ras.h

diff --git a/drivers/gpu/drm/qaic/qaic_ras.c b/drivers/gpu/drm/qaic/qaic_ras.c
new file mode 100644
index 0000000..ab51b2d
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_ras.c
@@ -0,0 +1,653 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <asm/byteorder.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mhi.h>
+
+#include "qaic.h"
+#include "qaic_ras.h"
+
+#define MAGIC		0x55AA
+#define VERSION		0x1
+#define HDR_SZ		12
+#define NUM_TEMP_LVL	3
+
+enum msg_type {
+	MSG_PUSH, /* async push from device */
+	MSG_REQ,  /* sync request to device */
+	MSG_RESP, /* sync response from device */
+};
+
+enum err_type {
+	CE,	/* correctable error */
+	UE,	/* uncorrectable error */
+	UE_NF,	/* uncorrectable error that is non-fatal, expect a disruption */
+	ERR_TYPE_MAX,
+};
+
+static const char * const err_type_str[] = {
+	[CE]    = "Correctable",
+	[UE]    = "Uncorrectable",
+	[UE_NF] = "Uncorrectable Non-Fatal",
+};
+
+static const char * const err_class_str[] = {
+	[CE]    = "Warning",
+	[UE]    = "Fatal",
+	[UE_NF] = "Warning",
+};
+
+enum err_source {
+	SOC_MEM,
+	PCIE,
+	DDR,
+	SYS_BUS1,
+	SYS_BUS2,
+	NSP_MEM,
+	TSENS,
+};
+
+static const char * const err_src_str[TSENS + 1] = {
+	[SOC_MEM]	= "SoC Memory",
+	[PCIE]		= "PCIE",
+	[DDR]		= "DDR",
+	[SYS_BUS1]	= "System Bus source 1",
+	[SYS_BUS2]	= "System Bus source 2",
+	[NSP_MEM]	= "NSP Memory",
+	[TSENS]		= "Temperature Sensors",
+};
+
+struct ras_data {
+	/* header start */
+	/* Magic number to validate the message */
+	u16 magic;
+	/* RAS version number */
+	u16 ver;
+	u32 seq_num;
+	/* RAS message type */
+	u8  type;
+	u8  id;
+	/* Size of RAS message without the header in byte */
+	u16 len;
+	/* header end */
+
+	u32 result;
+	/*
+	 * Error source
+	 * 0 : SoC Memory
+	 * 1 : PCIE
+	 * 2 : DDR
+	 * 3 : System Bus source 1
+	 * 4 : System Bus source 2
+	 * 5 : NSP Memory
+	 * 6 : Temperature Sensors
+	 */
+	u32 source;
+	/*
+	 * Stores the error type, there are three types of error in RAS
+	 * 0 : correctable error (CE)
+	 * 1 : uncorrectable error (UE)
+	 * 2 : uncorrectable error that is non-fatal (UE_NF)
+	 */
+	u32 err_type;
+	u32 err_threshold;
+	u32 ce_count;
+	u32 ue_count;
+	u32 intr_num;
+	/* Data specific to error source */
+	u8  syndrome[64];
+} __packed;
+
+struct soc_mem_syndrome {
+	u64 error_address[8];
+} __packed;
+
+struct nsp_mem_syndrome {
+	u32 error_address[8];
+	u8 nsp_id;
+} __packed;
+
+struct ddr_syndrome {
+	u16 instance;
+	u16 err_type;
+	u32 count;
+	u32 irq_status;
+	u32 data_31_0[2];
+	u32 data_63_32[2];
+	u32 data_95_64[2];
+	u32 data_127_96[2];
+	u16 parity_bits;
+	u16 addr_msb;
+	u32 addr_lsb;
+} __packed;
+
+struct tsens_syndrome {
+	u32 threshold_type;
+	u32 temp;
+} __packed;
+
+struct sysbus1_syndrome {
+	u8  instance;
+	u32 slave;
+	u32 err_type;
+	u16 addr[8];
+} __packed;
+
+struct sysbus2_syndrome {
+	u8  instance;
+	u8  valid;
+	u8  word_error;
+	u8  non_secure;
+	u8  opc;
+	u8  error_code;
+	u8  trans_type;
+	u8  addr_space;
+	u16 op_type;
+	u16 len;
+	u16 redirect;
+	u16 path;
+	u32 ext_id;
+	u32 lsb2;
+	u32 msb2;
+	u32 lsb3;
+	u32 msb3;
+} __packed;
+
+struct pcie_syndrome {
+	/* CE info */
+	u32 bad_tlp;
+	u32 bad_dllp;
+	u32 replay_rollover;
+	u32 replay_timeout;
+	u32 rx_err;
+	u32 internal_ce_count;
+	/* UE info */
+	u8  index;
+	u32 addr;
+	/* UE_NF info */
+	u32 fc_timeout;
+	u32 poison_tlp;
+	u32 ecrc_err;
+	u32 unsupported_req;
+	u32 completer_abort;
+	u32 completion_timeout;
+} __packed;
+
+static const char * const threshold_type_str[NUM_TEMP_LVL] = {
+	[0] = "lower",
+	[1] = "upper",
+	[2] = "critical",
+};
+
+static void ras_msg_to_cpu(struct ras_data *msg)
+{
+	struct sysbus1_syndrome *sysbus1_syndrome =
+				(struct sysbus1_syndrome *)&msg->syndrome[0];
+	struct sysbus2_syndrome *sysbus2_syndrome =
+				(struct sysbus2_syndrome *)&msg->syndrome[0];
+	struct soc_mem_syndrome *soc_syndrome =
+				(struct soc_mem_syndrome *)&msg->syndrome[0];
+	struct nsp_mem_syndrome *nsp_syndrome =
+				(struct nsp_mem_syndrome *)&msg->syndrome[0];
+	struct tsens_syndrome *tsens_syndrome =
+				(struct tsens_syndrome *)&msg->syndrome[0];
+	struct pcie_syndrome *pcie_syndrome =
+				(struct pcie_syndrome *)&msg->syndrome[0];
+	struct ddr_syndrome *ddr_syndrome =
+				(struct ddr_syndrome *)&msg->syndrome[0];
+	int i;
+
+	le16_to_cpus(&msg->magic);
+	le16_to_cpus(&msg->ver);
+	le32_to_cpus(&msg->seq_num);
+	le16_to_cpus(&msg->len);
+	le32_to_cpus(&msg->result);
+	le32_to_cpus(&msg->source);
+	le32_to_cpus(&msg->err_type);
+	le32_to_cpus(&msg->err_threshold);
+	le32_to_cpus(&msg->ce_count);
+	le32_to_cpus(&msg->ue_count);
+	le32_to_cpus(&msg->intr_num);
+
+	switch (msg->source) {
+	case SOC_MEM:
+		for (i = 0; i < 8; i++)
+			le64_to_cpus(&soc_syndrome->error_address[i]);
+		break;
+	case PCIE:
+		le32_to_cpus(&pcie_syndrome->bad_tlp);
+		le32_to_cpus(&pcie_syndrome->bad_dllp);
+		le32_to_cpus(&pcie_syndrome->replay_rollover);
+		le32_to_cpus(&pcie_syndrome->replay_timeout);
+		le32_to_cpus(&pcie_syndrome->rx_err);
+		le32_to_cpus(&pcie_syndrome->internal_ce_count);
+		le32_to_cpus(&pcie_syndrome->fc_timeout);
+		le32_to_cpus(&pcie_syndrome->poison_tlp);
+		le32_to_cpus(&pcie_syndrome->ecrc_err);
+		le32_to_cpus(&pcie_syndrome->unsupported_req);
+		le32_to_cpus(&pcie_syndrome->completer_abort);
+		le32_to_cpus(&pcie_syndrome->completion_timeout);
+		le32_to_cpus(&pcie_syndrome->addr);
+		break;
+	case DDR:
+		le16_to_cpus(&ddr_syndrome->instance);
+		le16_to_cpus(&ddr_syndrome->err_type);
+		le32_to_cpus(&ddr_syndrome->count);
+		le32_to_cpus(&ddr_syndrome->irq_status);
+		le32_to_cpus(&ddr_syndrome->data_31_0[0]);
+		le32_to_cpus(&ddr_syndrome->data_31_0[1]);
+		le32_to_cpus(&ddr_syndrome->data_63_32[0]);
+		le32_to_cpus(&ddr_syndrome->data_63_32[1]);
+		le32_to_cpus(&ddr_syndrome->data_95_64[0]);
+		le32_to_cpus(&ddr_syndrome->data_95_64[1]);
+		le32_to_cpus(&ddr_syndrome->data_127_96[0]);
+		le32_to_cpus(&ddr_syndrome->data_127_96[1]);
+		le16_to_cpus(&ddr_syndrome->parity_bits);
+		le16_to_cpus(&ddr_syndrome->addr_msb);
+		le32_to_cpus(&ddr_syndrome->addr_lsb);
+		break;
+	case SYS_BUS1:
+		le32_to_cpus(&sysbus1_syndrome->slave);
+		le32_to_cpus(&sysbus1_syndrome->err_type);
+		for (i = 0; i < 8; i++)
+			le16_to_cpus(&sysbus1_syndrome->addr[i]);
+		break;
+	case SYS_BUS2:
+		le16_to_cpus(&sysbus2_syndrome->op_type);
+		le16_to_cpus(&sysbus2_syndrome->len);
+		le16_to_cpus(&sysbus2_syndrome->redirect);
+		le16_to_cpus(&sysbus2_syndrome->path);
+		le32_to_cpus(&sysbus2_syndrome->ext_id);
+		le32_to_cpus(&sysbus2_syndrome->lsb2);
+		le32_to_cpus(&sysbus2_syndrome->msb2);
+		le32_to_cpus(&sysbus2_syndrome->lsb3);
+		le32_to_cpus(&sysbus2_syndrome->msb3);
+		break;
+	case NSP_MEM:
+		for (i = 0; i < 8; i++)
+			le32_to_cpus(&nsp_syndrome->error_address[i]);
+		break;
+	case TSENS:
+		le32_to_cpus(&tsens_syndrome->threshold_type);
+		le32_to_cpus(&tsens_syndrome->temp);
+		break;
+	}
+}
+
+static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
+{
+	struct sysbus1_syndrome *sysbus1_syndrome =
+				(struct sysbus1_syndrome *)&msg->syndrome[0];
+	struct sysbus2_syndrome *sysbus2_syndrome =
+				(struct sysbus2_syndrome *)&msg->syndrome[0];
+	struct soc_mem_syndrome *soc_syndrome =
+				(struct soc_mem_syndrome *)&msg->syndrome[0];
+	struct nsp_mem_syndrome *nsp_syndrome =
+				(struct nsp_mem_syndrome *)&msg->syndrome[0];
+	struct tsens_syndrome *tsens_syndrome =
+				(struct tsens_syndrome *)&msg->syndrome[0];
+	struct pcie_syndrome *pcie_syndrome =
+				(struct pcie_syndrome *)&msg->syndrome[0];
+	struct ddr_syndrome *ddr_syndrome =
+				(struct ddr_syndrome *)&msg->syndrome[0];
+	char *class;
+	char *level;
+
+	if (msg->magic != MAGIC) {
+		pci_warn(qdev->pdev, "Dropping RAS message with invalid magic %x\n", msg->magic);
+		return;
+	}
+
+	if (msg->ver != VERSION) {
+		pci_warn(qdev->pdev, "Dropping RAS message with invalid version %d\n", msg->ver);
+		return;
+	}
+
+	if (msg->type != MSG_PUSH) {
+		pci_warn(qdev->pdev, "Dropping non-PUSH RAS message\n");
+		return;
+	}
+
+	if (msg->len != sizeof(*msg) - HDR_SZ) {
+		pci_warn(qdev->pdev, "Dropping RAS message with invalid len %d\n", msg->len);
+		return;
+	}
+
+	if (msg->err_type >= ERR_TYPE_MAX) {
+		pci_warn(qdev->pdev, "Dropping RAS message with err type %d\n", msg->err_type);
+		return;
+	}
+
+	if (msg->err_type == UE)
+		level = KERN_ERR;
+	else
+		level = KERN_WARNING;
+
+	switch (msg->source) {
+	case SOC_MEM:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   soc_syndrome->error_address[0],
+			   soc_syndrome->error_address[1],
+			   soc_syndrome->error_address[2],
+			   soc_syndrome->error_address[3],
+			   soc_syndrome->error_address[4],
+			   soc_syndrome->error_address[5],
+			   soc_syndrome->error_address[6],
+			   soc_syndrome->error_address[7]);
+		break;
+	case PCIE:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source]);
+
+		switch (msg->err_type) {
+		case CE:
+			printk(KERN_WARNING pr_fmt("Syndrome:\n    Bad TLP count %d\n    Bad DLLP count %d\n    Replay Rollover count %d\n    Replay Timeout count %d\n    Recv Error count %d\n    Internal CE count %d\n"),
+			       pcie_syndrome->bad_tlp,
+			       pcie_syndrome->bad_dllp,
+			       pcie_syndrome->replay_rollover,
+			       pcie_syndrome->replay_timeout,
+			       pcie_syndrome->rx_err,
+			       pcie_syndrome->internal_ce_count);
+			break;
+		case UE:
+			printk(KERN_ERR pr_fmt("Syndrome:\n    Index %d\n    Address 0x%x\n"),
+			       pcie_syndrome->index, pcie_syndrome->addr);
+			break;
+		case UE_NF:
+			printk(KERN_WARNING pr_fmt("Syndrome:\n    FC timeout count %d\n    Poisoned TLP count %d\n    ECRC error count %d\n    Unsupported request count %d\n    Completer abort count %d\n    Completion timeout count %d\n"),
+			       pcie_syndrome->fc_timeout,
+			       pcie_syndrome->poison_tlp,
+			       pcie_syndrome->ecrc_err,
+			       pcie_syndrome->unsupported_req,
+			       pcie_syndrome->completer_abort,
+			       pcie_syndrome->completion_timeout);
+			break;
+		default:
+			break;
+		}
+		break;
+	case DDR:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndrome:\n    Instance %d\n    Count %d\n    Data 31_0 0x%x 0x%x\n    Data 63_32 0x%x 0x%x\n    Data 95_64 0x%x 0x%x\n    Data 127_96 0x%x 0x%x\n    Parity bits 0x%x\n    Address msb 0x%x\n    Address lsb 0x%x\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   ddr_syndrome->instance,
+			   ddr_syndrome->count,
+			   ddr_syndrome->data_31_0[1],
+			   ddr_syndrome->data_31_0[0],
+			   ddr_syndrome->data_63_32[1],
+			   ddr_syndrome->data_63_32[0],
+			   ddr_syndrome->data_95_64[1],
+			   ddr_syndrome->data_95_64[0],
+			   ddr_syndrome->data_127_96[1],
+			   ddr_syndrome->data_127_96[0],
+			   ddr_syndrome->parity_bits,
+			   ddr_syndrome->addr_msb,
+			   ddr_syndrome->addr_lsb);
+		break;
+	case SYS_BUS1:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndome:\n    instance %d\n    %s\n    err_type %d\n    address0 0x%x\n    address1 0x%x\n    address2 0x%x\n    address3 0x%x\n    address4 0x%x\n    address5 0x%x\n    address6 0x%x\n    address7 0x%x\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   sysbus1_syndrome->instance,
+			   sysbus1_syndrome->slave ? "Slave" : "Master",
+			   sysbus1_syndrome->err_type,
+			   sysbus1_syndrome->addr[0],
+			   sysbus1_syndrome->addr[1],
+			   sysbus1_syndrome->addr[2],
+			   sysbus1_syndrome->addr[3],
+			   sysbus1_syndrome->addr[4],
+			   sysbus1_syndrome->addr[5],
+			   sysbus1_syndrome->addr[6],
+			   sysbus1_syndrome->addr[7]);
+		break;
+	case SYS_BUS2:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndome:\n    instance %d\n    valid %d\n    word error %d\n    non-secure %d\n    opc %d\n    error code %d\n    transaction type %d\n    address space %d\n    operation type %d\n    len %d\n    redirect %d\n    path %d\n    ext_id %d\n    lsb2 %d\n    msb2 %d\n    lsb3 %d\n    msb3 %d\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   sysbus2_syndrome->instance,
+			   sysbus2_syndrome->valid,
+			   sysbus2_syndrome->word_error,
+			   sysbus2_syndrome->non_secure,
+			   sysbus2_syndrome->opc,
+			   sysbus2_syndrome->error_code,
+			   sysbus2_syndrome->trans_type,
+			   sysbus2_syndrome->addr_space,
+			   sysbus2_syndrome->op_type,
+			   sysbus2_syndrome->len,
+			   sysbus2_syndrome->redirect,
+			   sysbus2_syndrome->path,
+			   sysbus2_syndrome->ext_id,
+			   sysbus2_syndrome->lsb2,
+			   sysbus2_syndrome->msb2,
+			   sysbus2_syndrome->lsb3,
+			   sysbus2_syndrome->msb3);
+		break;
+	case NSP_MEM:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndrome:\n    NSP ID %d\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   nsp_syndrome->nsp_id,
+			   nsp_syndrome->error_address[0],
+			   nsp_syndrome->error_address[1],
+			   nsp_syndrome->error_address[2],
+			   nsp_syndrome->error_address[3],
+			   nsp_syndrome->error_address[4],
+			   nsp_syndrome->error_address[5],
+			   nsp_syndrome->error_address[6],
+			   nsp_syndrome->error_address[7]);
+		break;
+	case TSENS:
+		if (tsens_syndrome->threshold_type >= NUM_TEMP_LVL) {
+			pci_warn(qdev->pdev, "Dropping RAS message with invalid temp threshold %d\n",
+				 tsens_syndrome->threshold_type);
+			break;
+		}
+
+		if (msg->err_type)
+			class = "Fatal";
+		else if (tsens_syndrome->threshold_type)
+			class = "Critical";
+		else
+			class = "Warning";
+
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndrome:\n    %s threshold\n    %d deg C\n",
+			   class,
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   threshold_type_str[tsens_syndrome->threshold_type],
+			   tsens_syndrome->temp);
+		break;
+	}
+
+	/* Uncorrectable errors are fatal */
+	if (msg->err_type == UE)
+		mhi_soc_reset(qdev->mhi_cntl);
+
+	switch (msg->err_type) {
+	case CE:
+		if (qdev->ce_count != UINT_MAX)
+			qdev->ce_count++;
+		break;
+	case UE:
+		if (qdev->ce_count != UINT_MAX)
+			qdev->ue_count++;
+		break;
+	case UE_NF:
+		if (qdev->ce_count != UINT_MAX)
+			qdev->ue_nf_count++;
+		break;
+	default:
+		/* not possible */
+		break;
+	}
+}
+
+static ssize_t ce_count_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct pci_dev *pdev = container_of(dev, struct pci_dev, dev);
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ce_count);
+}
+
+static ssize_t ue_count_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct pci_dev *pdev = container_of(dev, struct pci_dev, dev);
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ue_count);
+}
+
+static ssize_t ue_nonfatal_count_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct pci_dev *pdev = container_of(dev, struct pci_dev, dev);
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ue_nf_count);
+}
+
+static DEVICE_ATTR_RO(ce_count);
+static DEVICE_ATTR_RO(ue_count);
+static DEVICE_ATTR_RO(ue_nonfatal_count);
+
+static struct attribute *ras_attrs[] = {
+	&dev_attr_ce_count.attr,
+	&dev_attr_ue_count.attr,
+	&dev_attr_ue_nonfatal_count.attr,
+	NULL,
+};
+
+static struct attribute_group ras_group = {
+	.attrs = ras_attrs,
+};
+
+static int qaic_ras_mhi_probe(struct mhi_device *mhi_dev,
+			      const struct mhi_device_id *id)
+{
+	struct qaic_device *qdev;
+	struct ras_data *resp;
+	int ret;
+
+	qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
+
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+	qdev->ras_ch = mhi_dev;
+	ret = mhi_prepare_for_transfer(qdev->ras_ch);
+
+	if (ret)
+		return ret;
+
+	resp = kmalloc(sizeof(*resp), GFP_KERNEL);
+	if (!resp) {
+		mhi_unprepare_from_transfer(qdev->ras_ch);
+		return -ENOMEM;
+	}
+
+	ret = mhi_queue_buf(qdev->ras_ch, DMA_FROM_DEVICE, resp, sizeof(*resp),
+			    MHI_EOT);
+	if (ret) {
+		mhi_unprepare_from_transfer(qdev->ras_ch);
+		return ret;
+	}
+
+	ret = device_add_group(&qdev->pdev->dev, &ras_group);
+	if (ret)
+		pci_dbg(qdev->pdev, "ras add sysfs failed %d\n", ret);
+
+	return 0;
+}
+
+static void qaic_ras_mhi_remove(struct mhi_device *mhi_dev)
+{
+	struct qaic_device *qdev;
+
+	qdev = dev_get_drvdata(&mhi_dev->dev);
+	mhi_unprepare_from_transfer(qdev->ras_ch);
+	qdev->ras_ch = NULL;
+	device_remove_group(&qdev->pdev->dev, &ras_group);
+}
+
+static void qaic_ras_mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+				    struct mhi_result *mhi_result)
+{
+}
+
+static void qaic_ras_mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+				    struct mhi_result *mhi_result)
+{
+	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
+	struct ras_data *msg = mhi_result->buf_addr;
+	int ret;
+
+	if (mhi_result->transaction_status) {
+		kfree(msg);
+		return;
+	}
+
+	ras_msg_to_cpu(msg);
+	decode_ras_msg(qdev, msg);
+
+	ret = mhi_queue_buf(qdev->ras_ch, DMA_FROM_DEVICE, msg, sizeof(*msg),
+			    MHI_EOT);
+	if (ret) {
+		pci_err(qdev->pdev, "Cannot requeue RAS recv buf %d\n", ret);
+		kfree(msg);
+	}
+}
+
+static const struct mhi_device_id qaic_ras_mhi_match_table[] = {
+	{ .chan = "QAIC_STATUS", },
+	{},
+};
+
+static struct mhi_driver qaic_ras_mhi_driver = {
+	.id_table = qaic_ras_mhi_match_table,
+	.remove = qaic_ras_mhi_remove,
+	.probe = qaic_ras_mhi_probe,
+	.ul_xfer_cb = qaic_ras_mhi_ul_xfer_cb,
+	.dl_xfer_cb = qaic_ras_mhi_dl_xfer_cb,
+	.driver = {
+		.name = "qaic_ras",
+		.owner = THIS_MODULE,
+	},
+};
+
+void qaic_ras_register(void)
+{
+	int ret;
+
+	ret = mhi_driver_register(&qaic_ras_mhi_driver);
+	if (ret)
+		pr_debug("qaic: ras register failed %d\n", ret);
+}
+
+void qaic_ras_unregister(void)
+{
+	mhi_driver_unregister(&qaic_ras_mhi_driver);
+}
diff --git a/drivers/gpu/drm/qaic/qaic_ras.h b/drivers/gpu/drm/qaic/qaic_ras.h
new file mode 100644
index 0000000..e431680
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_ras.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QAIC_RAS_H__
+#define __QAIC_RAS_H__
+
+void qaic_ras_register(void);
+void qaic_ras_unregister(void);
+#endif /* __QAIC_RAS_H__ */
-- 
2.7.4

