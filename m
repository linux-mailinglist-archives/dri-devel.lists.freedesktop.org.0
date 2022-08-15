Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA95935DC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B2DD1755;
	Mon, 15 Aug 2022 18:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09C9D15B2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:43:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FHOijg014365;
 Mon, 15 Aug 2022 18:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=D38fvzccgCaoHEuT7vgasOEDfrYy8tMpfCGphIDUodg=;
 b=bZjrVdToHYImTbEbybFcpMUf/xrQ01CWRnao1YiPF+XDtcuFv5N2liADrVpp5B654d5z
 BSrZZJhqM0/lhX/2FFbq37rtbGf4xfbRXgcMzC6XMqifVL4ZVNUXPAfB/rMN+Cxi8Iw3
 15N+KlYClcNNFdl5Qlnians5v5uk3Ujl692Wgb5WZX/obGvEVuyjbt0ro5JtVC/0omyI
 JCZtyMhy0KoaWWO/o1WlKtkFd0qgscpM3nQKmB3GRp6cy3ZSMJnHCGO8Nizer2CrFkDR
 1pw4u5HL2flAOramEwZvUj4lywOPNsw9EMuka1n/KfEjuc9+E7YK+zKukqw7sS/FPMrL cQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx58f5yxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIhGvN032572
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:16 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:43:15 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 09/14] drm/qaic: Add ssr component
Date: Mon, 15 Aug 2022 12:42:31 -0600
Message-ID: <1660588956-24027-10-git-send-email-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: l_8jhNeRgHKdZxC4DQHy7jYsgBfY0JGS
X-Proofpoint-GUID: l_8jhNeRgHKdZxC4DQHy7jYsgBfY0JGS
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

A QAIC device supports the concept of subsystem restart (ssr).  If a
processing unit for a workload crashes, it is possible to reset that unit
instead of crashing the device.  Since such an error is likely related to
the workload code that was running, it is possible to collect a crashdump
of the workload for offline analysis.

Change-Id: I77aa21ecbf0f730d8736a7465285ce5290ed3745
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/gpu/drm/qaic/qaic_ssr.c | 889 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/qaic/qaic_ssr.h |  13 +
 2 files changed, 902 insertions(+)
 create mode 100644 drivers/gpu/drm/qaic/qaic_ssr.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_ssr.h

diff --git a/drivers/gpu/drm/qaic/qaic_ssr.c b/drivers/gpu/drm/qaic/qaic_ssr.c
new file mode 100644
index 0000000..826361b
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_ssr.c
@@ -0,0 +1,889 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <asm/byteorder.h>
+#include <linux/devcoredump.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mhi.h>
+#include <linux/workqueue.h>
+
+#include "qaic.h"
+#include "qaic_ssr.h"
+#include "qaic_trace.h"
+
+#define MSG_BUF_SZ 32
+#define MAX_PAGE_DUMP_RESP 4 /* It should always be in powers of 2 */
+
+enum ssr_cmds {
+	DEBUG_TRANSFER_INFO =		BIT(0),
+	DEBUG_TRANSFER_INFO_RSP =	BIT(1),
+	MEMORY_READ =			BIT(2),
+	MEMORY_READ_RSP =		BIT(3),
+	DEBUG_TRANSFER_DONE =		BIT(4),
+	DEBUG_TRANSFER_DONE_RSP =	BIT(5),
+	SSR_EVENT =			BIT(8),
+	SSR_EVENT_RSP =			BIT(9),
+};
+
+enum ssr_events {
+	SSR_EVENT_NACK =	BIT(0),
+	BEFORE_SHUTDOWN =	BIT(1),
+	AFTER_SHUTDOWN =	BIT(2),
+	BEFORE_POWER_UP =	BIT(3),
+	AFTER_POWER_UP =	BIT(4),
+};
+
+struct debug_info_table {
+	/* Save preferences. Default is mandatory */
+	u64 save_perf;
+	/* Base address of the debug region */
+	u64 mem_base;
+	/* Size of debug region in bytes */
+	u64 len;
+	/* Description */
+	char desc[20];
+	/* Filename of debug region */
+	char filename[20];
+};
+
+struct _ssr_hdr {
+	__le32 cmd;
+	__le32 len;
+	__le32 dbc_id;
+};
+
+struct ssr_hdr {
+	u32 cmd;
+	u32 len;
+	u32 dbc_id;
+};
+
+struct ssr_debug_transfer_info {
+	struct ssr_hdr hdr;
+	u32 resv;
+	u64 tbl_addr;
+	u64 tbl_len;
+} __packed;
+
+struct ssr_debug_transfer_info_rsp {
+	struct _ssr_hdr hdr;
+	__le32 ret;
+} __packed;
+
+struct ssr_memory_read {
+	struct _ssr_hdr hdr;
+	__le32 resv;
+	__le64 addr;
+	__le64 len;
+} __packed;
+
+struct ssr_memory_read_rsp {
+	struct _ssr_hdr hdr;
+	__le32 resv;
+	u8 data[];
+} __packed;
+
+struct ssr_debug_transfer_done {
+	struct _ssr_hdr hdr;
+	__le32 resv;
+} __packed;
+
+struct ssr_debug_transfer_done_rsp {
+	struct _ssr_hdr hdr;
+	__le32 ret;
+} __packed;
+
+struct ssr_event {
+	struct ssr_hdr hdr;
+	u32 event;
+} __packed;
+
+struct ssr_event_rsp {
+	struct _ssr_hdr hdr;
+	__le32 event;
+} __packed;
+
+struct ssr_resp {
+	/* Work struct to schedule work coming on QAIC_SSR channel */
+	struct work_struct work;
+	/* Root struct of device, used to access device resources */
+	struct qaic_device *qdev;
+	/* Buffer used by MHI for transfer requests */
+	u8 data[] __aligned(8);
+};
+
+/* SSR crashdump book keeping structure */
+struct ssr_dump_info {
+	/* DBC associated with this SSR crashdump */
+	struct dma_bridge_chan *dbc;
+	/*
+	 * It will be used when we complete the crashdump download and switch
+	 * to waiting on SSR events
+	 */
+	struct ssr_resp *resp;
+	/* We use this buffer to queue Crashdump downloading requests */
+	struct ssr_resp *dump_resp;
+	/* TRUE: dump_resp is queued for MHI transaction. FALSE: Otherwise */
+	bool dump_resp_queued;
+	/* TRUE: mem_rd_buf is queued for MHI transaction. FALSE: Otherwise */
+	bool mem_rd_buf_queued;
+	/* MEMORY READ request MHI buffer.*/
+	struct ssr_memory_read *mem_rd_buf;
+	/* Address of table in host */
+	void *tbl_addr;
+	/* Ptr to the entire dump */
+	void *dump_addr;
+	/* Address of table in device/target */
+	u64 tbl_addr_dev;
+	/* Total size of table */
+	u64 tbl_len;
+	/* Entire crashdump size */
+	u64 dump_sz;
+	/* Size of the buffer queued in for MHI transfer */
+	u64 resp_buf_sz;
+	/*
+	 * Crashdump will be collected chunk by chunk and this is max size of
+	 * one chunk
+	 */
+	u64 chunk_sz;
+	/* Offset of table(tbl_addr) where the new chunk will be dumped */
+	u64 tbl_off;
+	/* Points to the table entry we are currently downloading */
+	struct debug_info_table *tbl_ent;
+	/* Number of bytes downloaded for current entry in table */
+	u64 tbl_ent_rd;
+	/* Offset of crashdump(dump_addr) where the new chunk will be dumped */
+	u64 dump_off;
+};
+
+struct dump_file_meta {
+	u64 size;		/* Total size of the entire dump */
+	u64 tbl_len;		/* Length of the table in byte */
+};
+
+/*
+ * Layout of crashdump
+ *              +------------------------------------------+
+ *              |         Crashdump Meta structure         |
+ *              | type: struct dump_file_meta              |
+ *              +------------------------------------------+
+ *              |             Crashdump Table              |
+ *              | type: array of struct debug_info_table   |
+ *              |                                          |
+ *              |                                          |
+ *              |                                          |
+ *              +------------------------------------------+
+ *              |                Crashdump                 |
+ *              |                                          |
+ *              |                                          |
+ *              |                                          |
+ *              |                                          |
+ *              |                                          |
+ *              +------------------------------------------+
+ */
+
+static void free_ssr_dump_buf(struct ssr_dump_info *dump_info)
+{
+	if (!dump_info)
+		return;
+	if (!dump_info->mem_rd_buf_queued)
+		kfree(dump_info->mem_rd_buf);
+	if (!dump_info->dump_resp_queued)
+		kfree(dump_info->dump_resp);
+	trace_qaic_ssr_dump(dump_info->dbc->qdev, "SSR releasing resources required during crashdump collection");
+	vfree(dump_info->tbl_addr);
+	vfree(dump_info->dump_addr);
+	dump_info->dbc->dump_info = NULL;
+	kfree(dump_info);
+}
+
+void clean_up_ssr(struct qaic_device *qdev, u32 dbc_id)
+{
+	dbc_exit_ssr(qdev, dbc_id);
+	free_ssr_dump_buf(qdev->dbc[dbc_id].dump_info);
+}
+
+static int alloc_dump(struct ssr_dump_info *dump_info)
+{
+	struct debug_info_table *tbl_ent = dump_info->tbl_addr;
+	struct dump_file_meta *dump_meta;
+	u64 tbl_sz_lp = 0;
+	u64 sz = 0;
+
+	while (tbl_sz_lp < dump_info->tbl_len) {
+		le64_to_cpus(&tbl_ent->save_perf);
+		le64_to_cpus(&tbl_ent->mem_base);
+		le64_to_cpus(&tbl_ent->len);
+
+		if (tbl_ent->len == 0) {
+			pci_warn(dump_info->dump_resp->qdev->pdev, "An entry in dump table points to 0 len segment. Entry index %llu desc %.20s filename %.20s.\n",
+				 tbl_sz_lp / sizeof(*tbl_ent), tbl_ent->desc,
+				 tbl_ent->filename);
+			return -EINVAL;
+		}
+
+		sz += tbl_ent->len;
+		tbl_ent++;
+		tbl_sz_lp += sizeof(*tbl_ent);
+	}
+
+	dump_info->dump_sz = sz + dump_info->tbl_len + sizeof(*dump_meta);
+	/* Actual crashdump will be offsetted by crashdump meta and table */
+	dump_info->dump_off = dump_info->tbl_len + sizeof(*dump_meta);
+
+	dump_info->dump_addr = vzalloc(dump_info->dump_sz);
+	if (!dump_info->dump_addr) {
+		pci_warn(dump_info->dump_resp->qdev->pdev, "Failed to allocate crashdump memory. Virtual memory requested %llu\n",
+			 dump_info->dump_sz);
+		return -ENOMEM;
+	}
+
+	trace_qaic_ssr_dump(dump_info->dbc->qdev, "SSR crashdump memory is allocated. Crashdump collection will be initiated");
+
+	/* Copy crashdump meta and table */
+	dump_meta = dump_info->dump_addr;
+	dump_meta->size = dump_info->dump_sz;
+	dump_meta->tbl_len = dump_info->tbl_len;
+	memcpy(dump_info->dump_addr + sizeof(*dump_meta), dump_info->tbl_addr,
+	       dump_info->tbl_len);
+
+	return 0;
+}
+
+static int send_xfer_done(struct qaic_device *qdev, void *resp, u32 dbc_id)
+{
+	struct ssr_debug_transfer_done *xfer_done;
+	int ret;
+
+	xfer_done = kmalloc(sizeof(*xfer_done), GFP_KERNEL);
+	if (!xfer_done) {
+		pci_warn(qdev->pdev, "Failed to allocate SSR transfer done request struct. DBC ID %u. Physical memory requested %lu\n",
+			 dbc_id, sizeof(*xfer_done));
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_FROM_DEVICE, resp,
+			    MSG_BUF_SZ, MHI_EOT);
+	if (ret) {
+		pci_warn(qdev->pdev, "Could not queue SSR transfer done response %d. DBC ID %u.\n",
+			 ret, dbc_id);
+		goto free_xfer_done;
+	}
+
+	xfer_done->hdr.cmd = cpu_to_le32(DEBUG_TRANSFER_DONE);
+	xfer_done->hdr.len = cpu_to_le32(sizeof(*xfer_done));
+	xfer_done->hdr.dbc_id = cpu_to_le32(dbc_id);
+
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE, xfer_done,
+			    sizeof(*xfer_done), MHI_EOT);
+	if (ret) {
+		pci_warn(qdev->pdev, "Could not send DEBUG TRANSFER DONE %d. DBC ID %u.\n",
+			 ret, dbc_id);
+		goto free_xfer_done;
+	}
+
+	return 0;
+
+free_xfer_done:
+	kfree(xfer_done);
+out:
+	return ret;
+}
+
+static int send_mem_rd(struct qaic_device *qdev, struct ssr_dump_info *dump_info,
+		       u64 dest_addr, u64 dest_len)
+{
+	u32 dbc_id = dump_info->dbc->id;
+	int ret;
+
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_FROM_DEVICE,
+			    dump_info->dump_resp->data,
+			    dump_info->resp_buf_sz, MHI_EOT);
+	if (ret) {
+		pci_warn(qdev->pdev, "Could not queue SSR dump buf %d. DBC ID %u.\n",
+			 ret, dbc_id);
+		goto out;
+	} else {
+		dump_info->dump_resp_queued = true;
+	}
+
+	dump_info->mem_rd_buf->hdr.cmd = cpu_to_le32(MEMORY_READ);
+	dump_info->mem_rd_buf->hdr.len =
+				cpu_to_le32(sizeof(*dump_info->mem_rd_buf));
+	dump_info->mem_rd_buf->hdr.dbc_id = cpu_to_le32(dbc_id);
+	dump_info->mem_rd_buf->addr = cpu_to_le64(dest_addr);
+	dump_info->mem_rd_buf->len = cpu_to_le64(dest_len);
+
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE,
+			    dump_info->mem_rd_buf,
+			    sizeof(*dump_info->mem_rd_buf), MHI_EOT);
+	if (ret)
+		pci_warn(qdev->pdev, "Could not send MEMORY READ %d. DBC ID %u.\n",
+			 ret, dbc_id);
+	else
+		dump_info->mem_rd_buf_queued = true;
+
+out:
+	return ret;
+}
+
+static int ssr_copy_table(struct ssr_dump_info *dump_info, void *data, u64 len)
+{
+	if (len > dump_info->tbl_len - dump_info->tbl_off) {
+		pci_warn(dump_info->dump_resp->qdev->pdev, "Invalid data length of table chunk. Length provided %llu & at most expected length %llu\n",
+			 len, dump_info->tbl_len - dump_info->tbl_off);
+		return -EINVAL;
+	}
+
+	memcpy(dump_info->tbl_addr + dump_info->tbl_off, data, len);
+
+	dump_info->tbl_off += len;
+
+	/* Entire table has been downloaded, alloc dump memory */
+	if (dump_info->tbl_off == dump_info->tbl_len) {
+		dump_info->tbl_ent = dump_info->tbl_addr;
+		trace_qaic_ssr_dump(dump_info->dbc->qdev, "SSR debug table download complete");
+		return alloc_dump(dump_info);
+	}
+
+	return 0;
+}
+
+static int ssr_copy_dump(struct ssr_dump_info *dump_info, void *data, u64 len)
+{
+	struct debug_info_table *tbl_ent;
+
+	tbl_ent = dump_info->tbl_ent;
+
+	if (len > tbl_ent->len - dump_info->tbl_ent_rd) {
+		pci_warn(dump_info->dump_resp->qdev->pdev, "Invalid data length of dump chunk. Length provided %llu & at most expected length %llu. Segment details base_addr: 0x%llx len: %llu desc: %.20s filename: %.20s.\n",
+			 len, tbl_ent->len - dump_info->tbl_ent_rd,
+			 tbl_ent->mem_base, tbl_ent->len, tbl_ent->desc,
+			 tbl_ent->filename);
+		return -EINVAL;
+	}
+
+	memcpy(dump_info->dump_addr + dump_info->dump_off, data, len);
+
+	dump_info->dump_off += len;
+	dump_info->tbl_ent_rd += len;
+
+	/* Current segment of the crashdump is complete, move to next one */
+	if (tbl_ent->len == dump_info->tbl_ent_rd) {
+		dump_info->tbl_ent++;
+		dump_info->tbl_ent_rd = 0;
+	}
+
+	return 0;
+}
+
+static void ssr_dump_worker(struct work_struct *work)
+{
+	struct ssr_resp *dump_resp =
+				container_of(work, struct ssr_resp, work);
+	struct qaic_device *qdev = dump_resp->qdev;
+	struct ssr_memory_read_rsp *mem_rd_resp;
+	struct debug_info_table *tbl_ent;
+	struct ssr_dump_info *dump_info;
+	u64 dest_addr, dest_len;
+	struct _ssr_hdr *_hdr;
+	struct ssr_hdr hdr;
+	u64 data_len;
+	int ret;
+
+	mem_rd_resp = (struct ssr_memory_read_rsp *)dump_resp->data;
+	_hdr = &mem_rd_resp->hdr;
+	hdr.cmd = le32_to_cpu(_hdr->cmd);
+	hdr.len = le32_to_cpu(_hdr->len);
+	hdr.dbc_id = le32_to_cpu(_hdr->dbc_id);
+
+	if (hdr.dbc_id >= qdev->num_dbc) {
+		pci_warn(qdev->pdev, "Dropping SSR message with invalid DBC ID %u. DBC ID should be less than %u.\n",
+			 hdr.dbc_id, qdev->num_dbc);
+		goto reset_device;
+	}
+	dump_info = qdev->dbc[hdr.dbc_id].dump_info;
+
+	if (!dump_info) {
+		pci_warn(qdev->pdev, "Dropping SSR message with invalid dbc id %u. Crashdump is not initiated for this DBC ID.\n",
+			 hdr.dbc_id);
+		goto reset_device;
+	}
+
+	dump_info->dump_resp_queued = false;
+
+	if (hdr.cmd != MEMORY_READ_RSP) {
+		pci_warn(qdev->pdev, "Dropping SSR message with invalid CMD %u. Expected command is %u.\n",
+			 hdr.cmd, MEMORY_READ_RSP);
+		goto free_dump_info;
+	}
+
+	if (hdr.len > dump_info->resp_buf_sz) {
+		pci_warn(qdev->pdev, "Dropping SSR message with invalid length %u. At most length expected is %llu.\n",
+			 hdr.len, dump_info->resp_buf_sz);
+		goto free_dump_info;
+	}
+
+	data_len = hdr.len - sizeof(*mem_rd_resp);
+
+	if (dump_info->tbl_off < dump_info->tbl_len)
+		/* Chunk belongs to table */
+		ret = ssr_copy_table(dump_info, mem_rd_resp->data, data_len);
+	else
+		/* Chunk belongs to crashdump */
+		ret = ssr_copy_dump(dump_info, mem_rd_resp->data, data_len);
+
+	if (ret)
+		goto free_dump_info;
+
+	if (dump_info->tbl_off < dump_info->tbl_len) {
+		/* Continue downloading table */
+		dest_addr = dump_info->tbl_addr_dev + dump_info->tbl_off;
+		dest_len = min(dump_info->chunk_sz,
+			       dump_info->tbl_len - dump_info->tbl_off);
+		ret = send_mem_rd(qdev, dump_info, dest_addr, dest_len);
+	} else if (dump_info->dump_off < dump_info->dump_sz) {
+		/* Continue downloading crashdump */
+		tbl_ent = dump_info->tbl_ent;
+		dest_addr = tbl_ent->mem_base + dump_info->tbl_ent_rd;
+		dest_len = min(dump_info->chunk_sz,
+			       tbl_ent->len - dump_info->tbl_ent_rd);
+		ret = send_mem_rd(qdev, dump_info, dest_addr, dest_len);
+	} else {
+		/* Crashdump download complete */
+		trace_qaic_ssr_dump(qdev, "SSR crashdump download complete");
+		ret = send_xfer_done(qdev, dump_info->resp->data, hdr.dbc_id);
+	}
+
+	if (ret)
+		/* Most likely a MHI xfer has failed */
+		goto free_dump_info;
+
+	return;
+
+free_dump_info:
+	/* Free the allocated memory */
+	free_ssr_dump_buf(dump_info);
+reset_device:
+	/*
+	 * After subsystem crashes in device crashdump collection begins but
+	 * something went wrong while collecting crashdump, now instead of
+	 * handling this error we just reset the device as the best effort has
+	 * been made
+	 */
+	mhi_soc_reset(qdev->mhi_cntl);
+}
+
+static struct ssr_dump_info *alloc_dump_info(struct qaic_device *qdev,
+					     struct ssr_debug_transfer_info *debug_info)
+{
+	struct ssr_dump_info *dump_info;
+	int nr_page;
+	int ret;
+
+	le64_to_cpus(&debug_info->tbl_len);
+	le64_to_cpus(&debug_info->tbl_addr);
+
+	if (debug_info->tbl_len == 0 ||
+	    debug_info->tbl_len % sizeof(struct debug_info_table) != 0) {
+		pci_warn(qdev->pdev, "Invalid table length %llu passed. Table length should be non-zero & multiple of %lu\n",
+			 debug_info->tbl_len, sizeof(struct debug_info_table));
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Allocate SSR crashdump book keeping structure */
+	dump_info = kzalloc(sizeof(*dump_info), GFP_KERNEL);
+	if (!dump_info) {
+		pci_warn(qdev->pdev, "Failed to allocate SSR dump book keeping buffer. Physical memory requested %lu\n",
+			 sizeof(*dump_info));
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* Allocate SSR crashdump request buffer, used for SSR MEMORY READ */
+	nr_page = MAX_PAGE_DUMP_RESP;
+	while (nr_page > 0) {
+		dump_info->dump_resp = kzalloc(nr_page * PAGE_SIZE,
+					       GFP_KERNEL | __GFP_NOWARN);
+		if (dump_info->dump_resp)
+			break;
+		nr_page >>= 1;
+	}
+
+	if (!dump_info->dump_resp) {
+		pci_warn(qdev->pdev, "Failed to allocate SSR dump response buffer. Physical memory requested %lu\n",
+			 PAGE_SIZE);
+		ret = -ENOMEM;
+		goto free_dump_info;
+	}
+
+	INIT_WORK(&dump_info->dump_resp->work, ssr_dump_worker);
+	dump_info->dump_resp->qdev = qdev;
+
+	dump_info->tbl_addr_dev = debug_info->tbl_addr;
+	dump_info->tbl_len = debug_info->tbl_len;
+	dump_info->resp_buf_sz = nr_page * PAGE_SIZE -
+				 sizeof(*dump_info->dump_resp);
+	dump_info->chunk_sz = dump_info->resp_buf_sz -
+			      sizeof(struct ssr_memory_read_rsp);
+
+	dump_info->tbl_addr = vzalloc(dump_info->tbl_len);
+	if (!dump_info->tbl_addr) {
+		pci_warn(qdev->pdev, "Failed to allocate SSR table struct. Virtual memory requested %llu\n",
+			 dump_info->tbl_len);
+		ret = -ENOMEM;
+		goto free_dump_resp;
+	}
+
+	dump_info->mem_rd_buf = kzalloc(sizeof(*dump_info->mem_rd_buf),
+					GFP_KERNEL);
+	if (!dump_info->mem_rd_buf) {
+		pci_warn(qdev->pdev, "Failed to allocate memory read request buffer for MHI transactions. Physical memory requested %lu\n",
+			 sizeof(*dump_info->mem_rd_buf));
+		ret = -ENOMEM;
+		goto free_dump_tbl;
+	}
+
+	return dump_info;
+
+free_dump_tbl:
+	vfree(dump_info->tbl_addr);
+free_dump_resp:
+	kfree(dump_info->dump_resp);
+free_dump_info:
+	kfree(dump_info);
+out:
+	return ERR_PTR(ret);
+}
+
+static void ssr_worker(struct work_struct *work)
+{
+	struct ssr_resp *resp = container_of(work, struct ssr_resp, work);
+	struct ssr_hdr *hdr = (struct ssr_hdr *)resp->data;
+	struct ssr_debug_transfer_info_rsp *debug_rsp;
+	struct ssr_debug_transfer_done_rsp *xfer_rsp;
+	struct ssr_debug_transfer_info *debug_info;
+	struct ssr_dump_info *dump_info = NULL;
+	struct qaic_device *qdev = resp->qdev;
+	struct ssr_event_rsp *event_rsp;
+	struct dma_bridge_chan *dbc;
+	struct ssr_event *event;
+	bool debug_nack = false;
+	u32 ssr_event_ack;
+	int ret;
+
+	le32_to_cpus(&hdr->cmd);
+	le32_to_cpus(&hdr->len);
+	le32_to_cpus(&hdr->dbc_id);
+
+	if (hdr->len > MSG_BUF_SZ) {
+		pci_warn(qdev->pdev, "Dropping SSR message with invalid len %d\n", hdr->len);
+		goto out;
+	}
+
+	if (hdr->dbc_id >= qdev->num_dbc) {
+		pci_warn(qdev->pdev, "Dropping SSR message with invalid dbc_id %d\n", hdr->dbc_id);
+		goto out;
+	}
+
+	dbc = &qdev->dbc[hdr->dbc_id];
+
+	switch (hdr->cmd) {
+	case DEBUG_TRANSFER_INFO:
+		trace_qaic_ssr_cmd(qdev, "SSR received DEBUG_TRANSFER_INFO command");
+		debug_info = (struct ssr_debug_transfer_info *)resp->data;
+
+		debug_rsp = kmalloc(sizeof(*debug_rsp), GFP_KERNEL);
+		if (!debug_rsp)
+			break;
+
+		if (dbc->state != DBC_STATE_BEFORE_POWER_UP) {
+			/* NACK */
+			pci_warn(qdev->pdev, "Invalid command received. DEBUG_TRANSFER_INFO is expected when DBC is in %d state and actual DBC state is %u. DBC ID %u.\n",
+				 DBC_STATE_BEFORE_POWER_UP, dbc->state,
+				 hdr->dbc_id);
+			debug_nack = true;
+		}
+
+		/* Skip buffer allocations for Crashdump downloading */
+		if (!debug_nack) {
+			/* Buffer for MEMORY READ request */
+			dump_info = alloc_dump_info(qdev, debug_info);
+			if (IS_ERR(dump_info)) {
+				/* NACK */
+				ret = PTR_ERR(dump_info);
+				pci_warn(qdev->pdev, "Failed to allocate dump resp memory %d. DBC ID %u.\n",
+					 ret, hdr->dbc_id);
+				debug_nack = true;
+			} else {
+				/* ACK */
+				debug_nack = false;
+			}
+		}
+
+		debug_rsp->hdr.cmd = cpu_to_le32(DEBUG_TRANSFER_INFO_RSP);
+		debug_rsp->hdr.len = cpu_to_le32(sizeof(*debug_rsp));
+		debug_rsp->hdr.dbc_id = cpu_to_le32(hdr->dbc_id);
+		/* 1 = NACK and 0 = ACK */
+		debug_rsp->ret = cpu_to_le32(debug_nack ? 1 : 0);
+
+		ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE,
+				    debug_rsp, sizeof(*debug_rsp), MHI_EOT);
+		if (ret) {
+			pci_warn(qdev->pdev, "Could not send DEBUG_TRANSFER_INFO_RSP %d\n", ret);
+			free_ssr_dump_buf(dump_info);
+			kfree(debug_rsp);
+			break;
+		}
+
+		/* Command has been NACKed skip crashdump. */
+		if (debug_nack)
+			break;
+
+		dbc->dump_info = dump_info;
+		dump_info->dbc = dbc;
+		dump_info->resp = resp;
+
+		trace_qaic_ssr_dump(qdev, "SSR debug table download initiated");
+		ret = send_mem_rd(qdev, dump_info, dump_info->tbl_addr_dev,
+				  min(dump_info->tbl_len, dump_info->chunk_sz));
+		if (ret) {
+			free_ssr_dump_buf(dump_info);
+			break;
+		}
+
+		/*
+		 * Till now everything went fine, which means that we will be
+		 * collecting crashdump chunk by chunk. Do not queue a response
+		 * buffer for SSR cmds till the crashdump is complete.
+		 */
+		return;
+	case SSR_EVENT:
+		trace_qaic_ssr_cmd(qdev, "SSR received SSR_EVENT command");
+		event = (struct ssr_event *)hdr;
+		le32_to_cpus(&event->event);
+		ssr_event_ack = event->event;
+
+		switch (event->event) {
+		case BEFORE_SHUTDOWN:
+			trace_qaic_ssr_event(qdev, "SSR received BEFORE_SHUTDOWN event");
+			set_dbc_state(qdev, hdr->dbc_id,
+				      DBC_STATE_BEFORE_SHUTDOWN);
+			dbc_enter_ssr(qdev, hdr->dbc_id);
+			break;
+		case AFTER_SHUTDOWN:
+			trace_qaic_ssr_event(qdev, "SSR received AFTER_SHUTDOWN event");
+			set_dbc_state(qdev, hdr->dbc_id,
+				      DBC_STATE_AFTER_SHUTDOWN);
+			break;
+		case BEFORE_POWER_UP:
+			trace_qaic_ssr_event(qdev, "SSR received BEFORE_POWER_UP event");
+			set_dbc_state(qdev, hdr->dbc_id,
+				      DBC_STATE_BEFORE_POWER_UP);
+			break;
+		case AFTER_POWER_UP:
+			trace_qaic_ssr_event(qdev, "SSR received AFTER_POWER_UP event");
+			/*
+			 * If dump info is a non NULL value it means that we
+			 * have received this SSR event while downloading a
+			 * crashdump for this DBC is still in progress. NACK
+			 * the SSR event
+			 */
+			if (dbc->dump_info) {
+				free_ssr_dump_buf(dbc->dump_info);
+				ssr_event_ack = SSR_EVENT_NACK;
+				break;
+			}
+
+			set_dbc_state(qdev, hdr->dbc_id,
+				      DBC_STATE_AFTER_POWER_UP);
+			break;
+		default:
+			pci_warn(qdev->pdev, "Unknown event %d\n", event->event);
+			break;
+		}
+
+		event_rsp = kmalloc(sizeof(*event_rsp), GFP_KERNEL);
+		if (!event_rsp)
+			break;
+
+		event_rsp->hdr.cmd = cpu_to_le32(SSR_EVENT_RSP);
+		event_rsp->hdr.len = cpu_to_le32(sizeof(*event_rsp));
+		event_rsp->hdr.dbc_id = cpu_to_le32(hdr->dbc_id);
+		event_rsp->event = cpu_to_le32(ssr_event_ack);
+
+		ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE,
+				    event_rsp, sizeof(*event_rsp), MHI_EOT);
+		if (ret) {
+			pci_warn(qdev->pdev, "Could not send SSR_EVENT_RSP %d\n", ret);
+			kfree(event_rsp);
+		}
+
+		if (event->event == AFTER_POWER_UP &&
+		    ssr_event_ack != SSR_EVENT_NACK) {
+			dbc_exit_ssr(qdev, hdr->dbc_id);
+			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_IDLE);
+		}
+
+		break;
+	case DEBUG_TRANSFER_DONE_RSP:
+		trace_qaic_ssr_cmd(qdev, "SSR received DEBUG_TRANSFER_DONE_RSP command");
+		xfer_rsp = (struct ssr_debug_transfer_done_rsp *)hdr;
+		dump_info = dbc->dump_info;
+
+		if (!dump_info) {
+			pci_warn(qdev->pdev, "Crashdump download is not in progress for this DBC ID %u\n",
+				 hdr->dbc_id);
+			break;
+		}
+
+		if (xfer_rsp->ret) {
+			pci_warn(qdev->pdev, "Device has NACKed SSR transfer done with %u\n",
+				 xfer_rsp->ret);
+			free_ssr_dump_buf(dump_info);
+			break;
+		}
+
+		dev_coredumpv(qdev->base_dev->ddev->dev, dump_info->dump_addr,
+			      dump_info->dump_sz, GFP_KERNEL);
+		/* dev_coredumpv will free dump_info->dump_addr */
+		dump_info->dump_addr = NULL;
+		free_ssr_dump_buf(dump_info);
+
+		break;
+	default:
+		pci_warn(qdev->pdev, "Dropping SSR message with invalid cmd %d\n", hdr->cmd);
+		break;
+	}
+
+out:
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_FROM_DEVICE, resp->data,
+			    MSG_BUF_SZ, MHI_EOT);
+	if (ret) {
+		pci_warn(qdev->pdev, "Could not requeue SSR recv buf %d\n", ret);
+		kfree(resp);
+	}
+}
+
+static int qaic_ssr_mhi_probe(struct mhi_device *mhi_dev,
+			      const struct mhi_device_id *id)
+{
+	struct qaic_device *qdev;
+	struct ssr_resp *resp;
+	int ret;
+
+	qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
+
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+	qdev->ssr_ch = mhi_dev;
+	ret = mhi_prepare_for_transfer(qdev->ssr_ch);
+
+	if (ret)
+		return ret;
+
+	resp = kmalloc(sizeof(*resp) + MSG_BUF_SZ, GFP_KERNEL);
+	if (!resp) {
+		mhi_unprepare_from_transfer(qdev->ssr_ch);
+		return -ENOMEM;
+	}
+
+	resp->qdev = qdev;
+	INIT_WORK(&resp->work, ssr_worker);
+
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_FROM_DEVICE, resp->data,
+			    MSG_BUF_SZ, MHI_EOT);
+	if (ret) {
+		mhi_unprepare_from_transfer(qdev->ssr_ch);
+		kfree(resp);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void qaic_ssr_mhi_remove(struct mhi_device *mhi_dev)
+{
+	struct qaic_device *qdev;
+
+	qdev = dev_get_drvdata(&mhi_dev->dev);
+	mhi_unprepare_from_transfer(qdev->ssr_ch);
+	qdev->ssr_ch = NULL;
+}
+
+static void qaic_ssr_mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+				    struct mhi_result *mhi_result)
+{
+	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
+	struct _ssr_hdr *hdr = mhi_result->buf_addr;
+	struct ssr_dump_info *dump_info;
+
+	if (mhi_result->transaction_status) {
+		kfree(mhi_result->buf_addr);
+		return;
+	}
+
+	/*
+	 * MEMORY READ is used to download crashdump. And crashdump is
+	 * downloaded chunk by chunk in a series of MEMORY READ SSR commands.
+	 * Hence to avoid too many kmalloc() and kfree() of the same MEMORY READ
+	 * request buffer, we allocate only one such buffer and free it only
+	 * once.
+	 */
+	dump_info = qdev->dbc[le32_to_cpu(hdr->dbc_id)].dump_info;
+	if (le32_to_cpu(hdr->cmd) == MEMORY_READ) {
+		dump_info->mem_rd_buf_queued = false;
+		return;
+	}
+
+	kfree(mhi_result->buf_addr);
+}
+
+static void qaic_ssr_mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+				    struct mhi_result *mhi_result)
+{
+	struct ssr_resp *resp = container_of(mhi_result->buf_addr,
+							struct ssr_resp, data);
+
+	if (mhi_result->transaction_status) {
+		kfree(resp);
+		return;
+	}
+
+	queue_work(resp->qdev->ssr_wq, &resp->work);
+}
+
+static const struct mhi_device_id qaic_ssr_mhi_match_table[] = {
+	{ .chan = "QAIC_SSR", },
+	{},
+};
+
+static struct mhi_driver qaic_ssr_mhi_driver = {
+	.id_table = qaic_ssr_mhi_match_table,
+	.remove = qaic_ssr_mhi_remove,
+	.probe = qaic_ssr_mhi_probe,
+	.ul_xfer_cb = qaic_ssr_mhi_ul_xfer_cb,
+	.dl_xfer_cb = qaic_ssr_mhi_dl_xfer_cb,
+	.driver = {
+		.name = "qaic_ssr",
+		.owner = THIS_MODULE,
+	},
+};
+
+void qaic_ssr_register(void)
+{
+	int ret;
+
+	ret = mhi_driver_register(&qaic_ssr_mhi_driver);
+	if (ret)
+		pr_debug("qaic: ssr register failed %d\n", ret);
+}
+
+void qaic_ssr_unregister(void)
+{
+	mhi_driver_unregister(&qaic_ssr_mhi_driver);
+}
diff --git a/drivers/gpu/drm/qaic/qaic_ssr.h b/drivers/gpu/drm/qaic/qaic_ssr.h
new file mode 100644
index 0000000..a3a02f7
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_ssr.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __QAIC_SSR_H__
+#define __QAIC_SSR_H__
+
+void qaic_ssr_register(void);
+void qaic_ssr_unregister(void);
+void clean_up_ssr(struct qaic_device *qdev, u32 dbc_id);
+#endif /* __QAIC_SSR_H__ */
-- 
2.7.4

