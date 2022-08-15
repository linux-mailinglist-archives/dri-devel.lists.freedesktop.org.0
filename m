Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708445A0026
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729EEA6DB4;
	Wed, 24 Aug 2022 17:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A23CD1672
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:43:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FHMfPw026417;
 Mon, 15 Aug 2022 18:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=UgeeQI3HIAd6cSXnb0yUBKbpBha8kEIfhIT8R5DTUGs=;
 b=k6hIlOXDQ1Qe9f3xCv/U9r4PshaD4bPz9FyxmVrfT+anPE9hWK8jy2efzrnXvXPiOpbr
 HlRI2Qf5Duf/1YZWbSuz5Ez4zhnSmx5wkoT9sMrnZeiwFl9/UK7+okdVyuzNc+Sijsww
 O8rjUMCsrCcycbTIDTGMov8vRvizl1cXp65KZ/uUCd6fS84g60/BLzxl3N1YVvZI6SDr
 ed9g7hYuZuObvnzEB7Yb6Qctrly/JdTLNdE5eTQAP+n+ihXZTfPTW73oJ+4MUw2gPvAM
 k1x4RosRPv8jIqXiHAJ4WeE+F/HwngULQdhEe1ZQlV70P/2pPz/IzZmSRNCloXwwMyBF ig== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx39re1r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIhDgF028348
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:13 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:43:11 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 06/14] drm/qaic: Add datapath
Date: Mon, 15 Aug 2022 12:42:28 -0600
Message-ID: <1660588956-24027-7-git-send-email-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: lc1pRkCvtv9vvV2I9p8M50uJA1UkBxOv
X-Proofpoint-GUID: lc1pRkCvtv9vvV2I9p8M50uJA1UkBxOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add the datapath component that manages BOs and submits them to running
workloads on the qaic device via the dma_bridge hardware.

Change-Id: I7a94cfb2741491f5fc044ae537f53d6cc0d97fee
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/gpu/drm/qaic/qaic_data.c | 2152 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 2152 insertions(+)
 create mode 100644 drivers/gpu/drm/qaic/qaic_data.c

diff --git a/drivers/gpu/drm/qaic/qaic_data.c b/drivers/gpu/drm/qaic/qaic_data.c
new file mode 100644
index 0000000..12d8b39
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic_data.c
@@ -0,0 +1,2152 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/moduleparam.h>
+#include <linux/scatterlist.h>
+#include <linux/spinlock.h>
+#include <linux/srcu.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <linux/wait.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_print.h>
+#include <uapi/drm/qaic_drm.h>
+
+#include "qaic.h"
+#include "qaic_trace.h"
+
+#define SEM_VAL_MASK	GENMASK_ULL(11, 0)
+#define SEM_INDEX_MASK	GENMASK_ULL(4, 0)
+#define BULK_XFER	BIT(3)
+#define GEN_COMPLETION	BIT(4)
+#define INBOUND_XFER	1
+#define OUTBOUND_XFER	2
+#define REQHP_OFF	0x0 /* we read this */
+#define REQTP_OFF	0x4 /* we write this */
+#define RSPHP_OFF	0x8 /* we write this */
+#define RSPTP_OFF	0xc /* we read this */
+
+#define ENCODE_SEM(val, index, sync, cmd, flags)			\
+			((val) |					\
+			(index) << 16 |					\
+			(sync) << 22 |					\
+			(cmd) << 24 |					\
+			((cmd) ? BIT(31) : 0) |				\
+			(((flags) & SEM_INSYNCFENCE) ? BIT(30) : 0) |	\
+			(((flags) & SEM_OUTSYNCFENCE) ? BIT(29) : 0))
+#define NUM_EVENTS	128
+#define NUM_DELAYS	10
+
+static unsigned int wait_exec_default_timeout = 5000; /* 5 sec default */
+module_param(wait_exec_default_timeout, uint, 0600);
+
+static unsigned int datapath_poll_interval_us = 100; /* 100 usec default */
+module_param(datapath_poll_interval_us, uint, 0600);
+
+struct dbc_req { /* everything must be little endian encoded */
+	/*
+	 * A request ID is assigned to each memory handle going in DMA queue.
+	 * As a single memory handle can enqueue multiple elements in DMA queue
+	 * all of them will have the same request ID.
+	 */
+	__le16	req_id;
+	/* Future use */
+	__u8	seq_id;
+	/*
+	 * Special encoded variable
+	 * 7	0 - Do not force to generate MSI after DMA is completed
+	 *	1 - Force to generate MSI after DMA is completed
+	 * 6:5	Reserved
+	 * 4	1 - Generate completion element in the response queue
+	 *	0 - No Completion Code
+	 * 3	0 - DMA request is a Link list transfer
+	 *	1 - DMA request is a Bulk transfer
+	 * 2	Reserved
+	 * 1:0	00 - No DMA transfer involved
+	 *	01 - DMA transfer is part of inbound transfer
+	 *	10 - DMA transfer has outbound transfer
+	 *	11 - NA
+	 */
+	__u8	cmd;
+	__le32	resv;
+	/* Source address for the transfer */
+	__le64	src_addr;
+	/* Destination address for the transfer */
+	__le64	dest_addr;
+	/* Length of transfer request */
+	__le32	len;
+	__le32	resv2;
+	/* Doorbell address */
+	__le64	db_addr;
+	/*
+	 * Special encoded variable
+	 * 7	1 - Doorbell(db) write
+	 *	0 - No doorbell write
+	 * 6:2	Reserved
+	 * 1:0	00 - 32 bit access, db address must be aligned to 32bit-boundary
+	 *	01 - 16 bit access, db address must be aligned to 16bit-boundary
+	 *	10 - 8 bit access, db address must be aligned to 8bit-boundary
+	 *	11 - Reserved
+	 */
+	__u8	db_len;
+	__u8	resv3;
+	__le16	resv4;
+	/* 32 bit data written to doorbeel address */
+	__le32	db_data;
+	/*
+	 * Special encoded variable
+	 * All the fields of sem_cmdX are passed from user and all are ORed
+	 * together to form sem_cmd.
+	 * 0:11		Semaphore value
+	 * 15:12	Reserved
+	 * 20:16	Semaphore index
+	 * 21		Reserved
+	 * 22		Semaphore Sync
+	 * 23		Reserved
+	 * 26:24	Semaphore command
+	 * 28:27	Reserved
+	 * 29		Semaphore DMA out bound sync fence
+	 * 30		Semaphore DMA in bound sync fence
+	 * 31		Enable semaphore command
+	 */
+	__le32	sem_cmd0;
+	__le32	sem_cmd1;
+	__le32	sem_cmd2;
+	__le32	sem_cmd3;
+} __packed;
+
+struct dbc_rsp { /* everything must be little endian encoded */
+	/* Request ID of the memory handle whose DMA transaction is completed */
+	__le16	req_id;
+	/* Status of the DMA transaction. 0 : Success otherwise failure */
+	__le16	status;
+} __packed;
+
+inline int get_dbc_req_elem_size(void)
+{
+	return sizeof(struct dbc_req);
+}
+
+inline int get_dbc_rsp_elem_size(void)
+{
+	return sizeof(struct dbc_rsp);
+}
+
+static int reserve_pages(unsigned long start_pfn, unsigned long nr_pages,
+			 bool reserve)
+{
+	unsigned long pfn;
+	unsigned long end_pfn = start_pfn + nr_pages;
+	struct page *page;
+
+	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+		if (!pfn_valid(pfn))
+			return -EINVAL;
+		page =  pfn_to_page(pfn);
+		if (reserve)
+			SetPageReserved(page);
+		else
+			ClearPageReserved(page);
+	}
+	return 0;
+}
+
+static void free_slice(struct kref *kref)
+{
+	struct bo_slice *slice = container_of(kref, struct bo_slice, ref_count);
+
+	list_del(&slice->slice);
+	drm_gem_object_put(&slice->bo->base);
+	sg_free_table(slice->sgt);
+	kfree(slice->sgt);
+	kfree(slice->reqs);
+	kfree(slice);
+}
+
+static int copy_sgt(struct qaic_device *qdev, struct sg_table **sgt_out,
+		    struct sg_table *sgt_in, u64 size, u64 offset)
+{
+	int total_len, len, nents, offf = 0, offl = 0;
+	struct scatterlist *sg, *sgn, *sgf, *sgl;
+	struct sg_table *sgt;
+	int ret, j;
+
+	/* find out number of relevant nents needed for this mem */
+	total_len = 0;
+	sgf = NULL;
+	sgl = NULL;
+	nents = 0;
+
+	size = size ? size : PAGE_SIZE;
+	for (sg = sgt_in->sgl; sg; sg = sg_next(sg)) {
+		len = sg_dma_len(sg);
+
+		if (!len)
+			continue;
+		if (offset >= total_len && offset < total_len + len) {
+			sgf = sg;
+			offf = offset - total_len;
+		}
+		if (sgf)
+			nents++;
+		if (offset + size >= total_len &&
+		    offset + size <= total_len + len) {
+			sgl = sg;
+			offl = offset + size - total_len;
+			break;
+		}
+		total_len += len;
+	}
+
+	if (!sgf || !sgl) {
+		trace_qaic_mem_err(qdev, "Failed to find SG first and/or SG last", ret);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt) {
+		trace_qaic_mem_err(qdev, "Failed to allocate SG table structure", ret);
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
+	if (ret) {
+		trace_qaic_mem_err_1(qdev, "Failed to allocate SG table",
+				     "SG table entries", ret, nents);
+		goto free_sgt;
+	}
+
+	/* copy relevant sg node and fix page and length */
+	sgn = sgf;
+	for_each_sgtable_sg(sgt, sg, j) {
+		memcpy(sg, sgn, sizeof(*sg));
+		if (sgn == sgf) {
+			sg_dma_address(sg) += offf;
+			sg_dma_len(sg) -= offf;
+			sg_set_page(sg, sg_page(sgn),
+				    sg_dma_len(sg), offf);
+		} else {
+			offf = 0;
+		}
+		if (sgn == sgl) {
+			sg_dma_len(sg) = offl - offf;
+			sg_set_page(sg, sg_page(sgn),
+				    offl - offf, offf);
+			sg_mark_end(sg);
+			break;
+		}
+		sgn = sg_next(sgn);
+	}
+
+	*sgt_out = sgt;
+	return ret;
+
+free_sgt:
+	kfree(sgt);
+out:
+	*sgt_out = NULL;
+	return ret;
+}
+
+static int encode_reqs(struct qaic_device *qdev, struct bo_slice *slice,
+		       struct qaic_attach_slice_entry *req)
+{
+	__u8 cmd = BULK_XFER;
+	__le64 db_addr = cpu_to_le64(req->db_addr);
+	__u8 db_len;
+	__le32 db_data = cpu_to_le32(req->db_data);
+	struct scatterlist *sg;
+	u64 dev_addr;
+	int presync_sem;
+	int i;
+
+	if (!slice->no_xfer)
+		cmd |= (slice->dir == DMA_TO_DEVICE ? INBOUND_XFER :
+								OUTBOUND_XFER);
+
+	if (req->db_len && !IS_ALIGNED(req->db_addr, req->db_len / 8)) {
+		trace_qaic_mem_err_2(qdev, "Invalid Doorbell values",
+				     "Doorbell length", "Doorbell address",
+				     -EINVAL, req->db_len, req->db_addr);
+		return -EINVAL;
+	}
+
+	presync_sem = req->sem0.presync + req->sem1.presync +
+		      req->sem2.presync + req->sem3.presync;
+	if (presync_sem > 1) {
+		trace_qaic_mem_err_2(qdev, "Invalid presync values",
+				     "sem0.presync", "sem1.presync",
+				     -EINVAL, req->sem0.presync,
+				     req->sem1.presync);
+		trace_qaic_mem_err_2(qdev, "", "sem2.presync", "sem3.presync",
+				     -EINVAL, req->sem2.presync,
+				     req->sem3.presync);
+		return -EINVAL;
+	}
+
+	presync_sem = req->sem0.presync << 0 | req->sem1.presync << 1 |
+		      req->sem2.presync << 2 | req->sem3.presync << 3;
+
+	switch (req->db_len) {
+	case 32:
+		db_len = BIT(7);
+		break;
+	case 16:
+		db_len = BIT(7) | 1;
+		break;
+	case 8:
+		db_len = BIT(7) | 2;
+		break;
+	case 0:
+		db_len = 0; /* doorbell is not active for this command */
+		break;
+	default:
+		trace_qaic_mem_err_1(qdev, "Invalid Doorbell length", "Doorbell length",
+				     -EINVAL, req->db_len);
+		return -EINVAL; /* should never hit this */
+	}
+
+	/*
+	 * When we end up splitting up a single request (ie a buf slice) into
+	 * multiple DMA requests, we have to manage the sync data carefully.
+	 * There can only be one presync sem.  That needs to be on every xfer
+	 * so that the DMA engine doesn't transfer data before the receiver is
+	 * ready.  We only do the doorbell and postsync sems after the xfer.
+	 * To guarantee previous xfers for the request are complete, we use a
+	 * fence.
+	 */
+	dev_addr = req->dev_addr;
+	for_each_sgtable_sg(slice->sgt, sg, i) {
+		slice->reqs[i].cmd = cmd;
+		slice->reqs[i].src_addr =
+			cpu_to_le64(slice->dir == DMA_TO_DEVICE ?
+					sg_dma_address(sg) : dev_addr);
+		slice->reqs[i].dest_addr =
+			cpu_to_le64(slice->dir == DMA_TO_DEVICE ?
+					dev_addr : sg_dma_address(sg));
+		/*
+		 * sg_dma_len(sg) returns size of a DMA segment, maximum DMA
+		 * segment size is set to UINT_MAX by qaic and hence return
+		 * values of sg_dma_len(sg) can never exceed u32 range. So,
+		 * by down sizing we are not corrupting the value.
+		 */
+		slice->reqs[i].len = cpu_to_le32((u32)sg_dma_len(sg));
+		switch (presync_sem) {
+		case BIT(0):
+			slice->reqs[i].sem_cmd0 = cpu_to_le32(ENCODE_SEM(req->sem0.val,
+									 req->sem0.index,
+									 req->sem0.presync,
+									 req->sem0.cmd,
+									 req->sem0.flags));
+			break;
+		case BIT(1):
+			slice->reqs[i].sem_cmd1 = cpu_to_le32(ENCODE_SEM(req->sem1.val,
+									 req->sem1.index,
+									 req->sem1.presync,
+									 req->sem1.cmd,
+									 req->sem1.flags));
+			break;
+		case BIT(2):
+			slice->reqs[i].sem_cmd2 = cpu_to_le32(ENCODE_SEM(req->sem2.val,
+									 req->sem2.index,
+									 req->sem2.presync,
+									 req->sem2.cmd,
+									 req->sem2.flags));
+			break;
+		case BIT(3):
+			slice->reqs[i].sem_cmd3 = cpu_to_le32(ENCODE_SEM(req->sem3.val,
+									 req->sem3.index,
+									 req->sem3.presync,
+									 req->sem3.cmd,
+									 req->sem3.flags));
+			break;
+		}
+		dev_addr += sg_dma_len(sg);
+	}
+	/* add post transfer stuff to last segment */
+	i--;
+	slice->reqs[i].cmd |= GEN_COMPLETION;
+	slice->reqs[i].db_addr = db_addr;
+	slice->reqs[i].db_len = db_len;
+	slice->reqs[i].db_data = db_data;
+	/*
+	 * Add a fence if we have more than one request going to the hardware
+	 * representing the entirety of the user request, and the user request
+	 * has no presync condition.
+	 * Fences are expensive, so we try to avoid them.  We rely on the
+	 * hardware behavior to avoid needing one when there is a presync
+	 * condition.  When a presync exists, all requests for that same
+	 * presync will be queued into a fifo.  Thus, since we queue the
+	 * post xfer activity only on the last request we queue, the hardware
+	 * will ensure that the last queued request is processed last, thus
+	 * making sure the post xfer activity happens at the right time without
+	 * a fence.
+	 */
+	if (i && !presync_sem)
+		req->sem0.flags |= (slice->dir == DMA_TO_DEVICE ?
+				    SEM_INSYNCFENCE : SEM_OUTSYNCFENCE);
+	slice->reqs[i].sem_cmd0 = cpu_to_le32(ENCODE_SEM(req->sem0.val,
+						       req->sem0.index,
+						       req->sem0.presync,
+						       req->sem0.cmd,
+						       req->sem0.flags));
+	slice->reqs[i].sem_cmd1 = cpu_to_le32(ENCODE_SEM(req->sem1.val,
+						       req->sem1.index,
+						       req->sem1.presync,
+						       req->sem1.cmd,
+						       req->sem1.flags));
+	slice->reqs[i].sem_cmd2 = cpu_to_le32(ENCODE_SEM(req->sem2.val,
+						       req->sem2.index,
+						       req->sem2.presync,
+						       req->sem2.cmd,
+						       req->sem2.flags));
+	slice->reqs[i].sem_cmd3 = cpu_to_le32(ENCODE_SEM(req->sem3.val,
+						       req->sem3.index,
+						       req->sem3.presync,
+						       req->sem3.cmd,
+						       req->sem3.flags));
+
+	return 0;
+}
+
+static int qaic_map_one_slice(struct qaic_device *qdev, struct qaic_bo *bo,
+			      struct qaic_attach_slice_entry *slice_ent)
+{
+	struct sg_table *sgt = NULL;
+	struct bo_slice *slice;
+	int ret;
+
+	ret = copy_sgt(qdev, &sgt, bo->sgt, slice_ent->size, slice_ent->offset);
+	if (ret) {
+		trace_qaic_mem_err(qdev, "Failed to copy sgt", ret);
+		goto out;
+	}
+
+	slice = kmalloc(sizeof(*slice), GFP_KERNEL);
+	if (!slice) {
+		ret = -ENOMEM;
+		trace_qaic_mem_err(qdev, "Failed to allocate memory for slice handle", ret);
+		goto free_sgt;
+	}
+
+	slice->reqs = kcalloc(sgt->nents, sizeof(*slice->reqs), GFP_KERNEL);
+	if (!slice->reqs) {
+		ret = -ENOMEM;
+		trace_qaic_mem_err(qdev, "Failed to allocate memory for requests", ret);
+		goto free_slice;
+	}
+
+	slice->no_xfer = !slice_ent->size;
+	slice->sgt = sgt;
+	slice->nents = sgt->nents;
+	slice->dir = bo->dir;
+	slice->bo = bo;
+	slice->size = slice_ent->size;
+	slice->offset = slice_ent->offset;
+
+	ret = encode_reqs(qdev, slice, slice_ent);
+	if (ret) {
+		trace_qaic_mem_err(qdev, "Failed to encode requests", ret);
+		goto free_req;
+	}
+
+	bo->total_slice_nents += sgt->nents;
+	kref_init(&slice->ref_count);
+	drm_gem_object_get(&bo->base);
+	list_add_tail(&slice->slice, &bo->slices);
+
+	return 0;
+
+free_req:
+	kfree(slice->reqs);
+free_slice:
+	kfree(slice);
+free_sgt:
+	sg_free_table(sgt);
+	kfree(sgt);
+out:
+	return ret;
+}
+
+static int create_sgt(struct qaic_device *qdev, struct sg_table **sgt_out,
+		      u64 size)
+{
+	struct scatterlist *sg;
+	struct sg_table *sgt;
+	struct page **pages;
+	int *pages_order;
+	int buf_extra;
+	int max_order;
+	int nr_pages;
+	int ret = 0;
+	int i, j, k;
+	int order;
+
+	if (size) {
+		nr_pages = DIV_ROUND_UP(size, PAGE_SIZE);
+		/*
+		 * calculate how much extra we are going to allocate, to remove
+		 * later
+		 */
+		buf_extra = (PAGE_SIZE - size % PAGE_SIZE) % PAGE_SIZE;
+		max_order = min(MAX_ORDER - 1, get_order(size));
+	} else {
+		/* allocate a single page for book keeping */
+		nr_pages = 1;
+		buf_extra = 0;
+		max_order = 0;
+	}
+
+	pages = kvmalloc_array(nr_pages, sizeof(*pages) + sizeof(*pages_order), GFP_KERNEL);
+	if (!pages) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	pages_order = (void *)pages + sizeof(*pages) * nr_pages;
+
+	/*
+	 * Allocate requested memory, using alloc_pages. It is possible to allocate
+	 * the requested memory in multiple chunks by calling alloc_pages
+	 * multiple times. Use SG table to handle multiple allocated pages.
+	 */
+	i = 0;
+	while (nr_pages > 0) {
+		order = min(get_order(nr_pages * PAGE_SIZE), max_order);
+		while (1) {
+			pages[i] = alloc_pages(GFP_KERNEL | GFP_HIGHUSER |
+					       __GFP_NOWARN | __GFP_ZERO |
+					       (order ? __GFP_NORETRY : __GFP_RETRY_MAYFAIL),
+					       order);
+			if (pages[i])
+				break;
+			if (!order--) {
+				ret = -ENOMEM;
+				trace_qaic_mem_err_1(qdev, "Kernel ran out of free pages",
+						     "Memory requested in byte",
+						     ret, nr_pages);
+				goto free_partial_alloc;
+			}
+		}
+
+		max_order = order;
+		pages_order[i] = order;
+
+		nr_pages -= 1 << order;
+		if (nr_pages <= 0)
+			/* account for over allocation */
+			buf_extra += abs(nr_pages) * PAGE_SIZE;
+		i++;
+	}
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt) {
+		ret = -ENOMEM;
+		goto free_partial_alloc;
+	}
+
+	if (sg_alloc_table(sgt, i, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto free_sgt;
+	}
+
+	/* Populate the SG table with the allocate memory pages */
+	sg = sgt->sgl;
+	for (k = 0; k < i; k++, sg = sg_next(sg)) {
+		/* Last entry requires special handling */
+		if (k < i - 1) {
+			sg_set_page(sg, pages[k], PAGE_SIZE << pages_order[k], 0);
+		} else {
+			sg_set_page(sg, pages[k],
+				    (PAGE_SIZE << pages_order[k]) - buf_extra, 0);
+			sg_mark_end(sg);
+		}
+
+		ret = reserve_pages(page_to_pfn(pages[k]), DIV_ROUND_UP(sg->length, PAGE_SIZE),
+				    true);
+		if (ret)
+			goto clear_pages;
+	}
+
+	kvfree(pages);
+	*sgt_out = sgt;
+	return ret;
+
+clear_pages:
+	for (j = 0; j < k; j++)
+		ret = reserve_pages(page_to_pfn(pages[j]), 1 << pages_order[j],
+				    false);
+	sg_free_table(sgt);
+free_sgt:
+	kfree(sgt);
+free_partial_alloc:
+	for (j = 0; j < i; j++)
+		__free_pages(pages[j], pages_order[j]);
+	kvfree(pages);
+out:
+	*sgt_out = NULL;
+	return ret;
+}
+
+static bool invalid_sem(struct qaic_sem *sem)
+{
+	if (sem->val & ~SEM_VAL_MASK || sem->index & ~SEM_INDEX_MASK ||
+	    !(sem->presync == 0 || sem->presync == 1) || sem->pad ||
+	    sem->flags & ~(SEM_INSYNCFENCE | SEM_OUTSYNCFENCE) ||
+	    sem->cmd > SEM_WAIT_GT_0)
+		return true;
+	return false;
+}
+
+static int qaic_validate_req(struct qaic_device *qdev,
+			     struct qaic_attach_slice_entry *slice_ent,
+			     u32 count, u64 total_size)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		if (!(slice_ent[i].db_len == 32 || slice_ent[i].db_len == 16 ||
+		      slice_ent[i].db_len == 8 || slice_ent[i].db_len == 0) ||
+		      invalid_sem(&slice_ent[i].sem0) ||
+		      invalid_sem(&slice_ent[i].sem1) ||
+		      invalid_sem(&slice_ent[i].sem2) ||
+		      invalid_sem(&slice_ent[i].sem3)) {
+			trace_qaic_mem_err(qdev, "Invalid semaphore or doorbell len", -EINVAL);
+			return -EINVAL;
+		}
+		if (slice_ent[i].offset + slice_ent[i].size > total_size) {
+			trace_qaic_mem_err_1(qdev, "Invalid size of buffer slice", "Slice size",
+					     -EINVAL, slice_ent[i].size);
+			trace_qaic_mem_err_2(qdev, "", "offset", "buffer slice size",
+					     -EINVAL, slice_ent[i].offset, total_size);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void qaic_free_sgt(struct sg_table *sgt)
+{
+	struct scatterlist *sg;
+
+	for (sg = sgt->sgl; sg; sg = sg_next(sg))
+		if (sg_page(sg)) {
+			reserve_pages(page_to_pfn(sg_page(sg)),
+				      DIV_ROUND_UP(sg->length, PAGE_SIZE), false);
+			__free_pages(sg_page(sg), get_order(sg->length));
+		}
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+static void qaic_gem_print_info(struct drm_printer *p, unsigned int indent,
+				const struct drm_gem_object *obj)
+{
+	struct qaic_bo *bo = to_qaic_bo(obj);
+
+	drm_printf_indent(p, indent, "user requested size=%llu\n", bo->size);
+}
+
+static const struct vm_operations_struct drm_vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct qaic_bo *bo = to_qaic_bo(obj);
+	unsigned long offset = 0;
+	struct scatterlist *sg;
+	int ret;
+
+	if (obj->import_attach) {
+		trace_qaic_mmap_err(bo->dbc->qdev, "mmap is not supported for import/PRIME buffers", ret);
+		return -EINVAL;
+	}
+
+	for (sg = bo->sgt->sgl; sg; sg = sg_next(sg)) {
+		if (sg_page(sg)) {
+			ret = remap_pfn_range(vma, vma->vm_start + offset,
+					      page_to_pfn(sg_page(sg)),
+					      sg->length, vma->vm_page_prot);
+			if (ret)
+				goto out;
+			offset += sg->length;
+		}
+	}
+
+out:
+	return ret;
+}
+
+static void qaic_free_object(struct drm_gem_object *obj)
+{
+	struct qaic_bo *bo = to_qaic_bo(obj);
+
+	if (obj->import_attach) {
+		/* DMABUF/PRIME Path */
+		dma_buf_detach(obj->import_attach->dmabuf, obj->import_attach);
+		dma_buf_put(obj->import_attach->dmabuf);
+	} else {
+		/* Private buffer allocation path */
+		qaic_free_sgt(bo->sgt);
+	}
+
+	drm_gem_object_release(obj);
+	kfree(bo);
+}
+
+static const struct drm_gem_object_funcs qaic_gem_funcs = {
+	.free = qaic_free_object,
+	.print_info = qaic_gem_print_info,
+	.mmap = qaic_gem_object_mmap,
+	.vm_ops = &drm_vm_ops,
+};
+
+static struct qaic_bo *qaic_alloc_init_bo(void)
+{
+	struct qaic_bo *bo;
+
+	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo) {
+		trace_qaic_mem_err(bo->dbc->qdev, "Failed to allocate qaic BO", -ENOMEM);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	INIT_LIST_HEAD(&bo->slices);
+	init_completion(&bo->xfer_done);
+	complete_all(&bo->xfer_done);
+
+	return bo;
+}
+
+int qaic_create_bo_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv)
+{
+	struct qaic_create_bo *args = data;
+	int usr_rcu_id, qdev_rcu_id;
+	struct drm_gem_object *obj;
+	struct qaic_device *qdev;
+	struct qaic_user *usr;
+	struct qaic_bo *bo;
+	size_t size;
+	int ret;
+
+	usr = file_priv->driver_priv;
+	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
+	if (!usr->qddev) {
+		ret = -ENODEV;
+		trace_qaic_mem_err(qdev, "Failed to acquire user RCU lock", ret);
+		goto unlock_usr_srcu;
+	}
+
+	qdev = usr->qddev->qdev;
+	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		ret = -ENODEV;
+		trace_qaic_mem_err(qdev, "Failed to acquire device RCU lock", ret);
+		goto unlock_dev_srcu;
+	}
+
+	size = PAGE_ALIGN(args->size);
+	if (size == 0) {
+		ret = -EINVAL;
+		trace_qaic_mem_err_1(qdev, "Failed to PAGE_ALIGN for given buffer size",
+				     "buffer size(B)", ret, args->size);
+		goto unlock_dev_srcu;
+	}
+
+	bo = qaic_alloc_init_bo();
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		trace_qaic_mem_err(qdev, "Failed to Allocate/Init BO", ret);
+		goto unlock_dev_srcu;
+	}
+	obj = &bo->base;
+
+	drm_gem_private_object_init(dev, obj, size);
+
+	obj->funcs = &qaic_gem_funcs;
+	ret = create_sgt(qdev, &bo->sgt, size);
+	if (ret) {
+		trace_qaic_mem_err(qdev, "Failed to Create SGT", ret);
+		goto free_bo;
+	}
+
+	bo->size = args->size;
+
+	ret = drm_gem_handle_create(file_priv, obj, &args->handle);
+	if (ret) {
+		trace_qaic_mem_err(qdev, "Failed to Create SGT", ret);
+		goto free_sgt;
+	}
+
+	bo->handle = args->handle;
+	drm_gem_object_put(obj);
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+
+	return 0;
+
+free_sgt:
+	qaic_free_sgt(bo->sgt);
+free_bo:
+	kfree(bo);
+unlock_dev_srcu:
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+unlock_usr_srcu:
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+	return ret;
+}
+
+int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv)
+{
+	struct qaic_mmap_bo *args = data;
+	int usr_rcu_id, qdev_rcu_id;
+	struct drm_gem_object *obj;
+	struct qaic_device *qdev;
+	struct qaic_user *usr;
+	int ret;
+
+	usr = file_priv->driver_priv;
+	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
+	if (!usr->qddev) {
+		ret = -ENODEV;
+		trace_qaic_mmap_err(qdev, "Failed to acquire user RCU lock", ret);
+		goto unlock_usr_srcu;
+	}
+
+	qdev = usr->qddev->qdev;
+	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		ret = -ENODEV;
+		trace_qaic_mmap_err(qdev, "Failed to acquire device RCU lock", ret);
+		goto unlock_dev_srcu;
+	}
+
+	obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!obj) {
+		ret = -ENOENT;
+		trace_qaic_mmap_err_1(qdev, "Invalid BO handle passed", "BO handle",
+				      ret, args->handle);
+		goto unlock_dev_srcu;
+	}
+
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret == 0)
+		args->offset = drm_vma_node_offset_addr(&obj->vma_node);
+
+	drm_gem_object_put(obj);
+
+unlock_dev_srcu:
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+unlock_usr_srcu:
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+	return ret;
+}
+
+struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev,
+					     struct dma_buf *dma_buf)
+{
+	struct dma_buf_attachment *attach;
+	struct drm_gem_object *obj;
+	struct qaic_bo *bo;
+	size_t size;
+	int ret;
+
+	bo = qaic_alloc_init_bo();
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		trace_qaic_mem_err(bo->dbc->qdev, "Failed to Allocate/Init BO", ret);
+		goto out;
+	}
+
+	obj = &bo->base;
+	get_dma_buf(dma_buf);
+
+	attach = dma_buf_attach(dma_buf, dev->dev);
+	if (IS_ERR(attach)) {
+		ret = PTR_ERR(attach);
+		trace_qaic_mem_err(bo->dbc->qdev, "Failed to attach dma_buf", ret);
+		goto attach_fail;
+	}
+
+	size = PAGE_ALIGN(attach->dmabuf->size);
+	if (size == 0) {
+		ret = -EINVAL;
+		trace_qaic_mem_err(bo->dbc->qdev, "Invalid dma_buf size 0", ret);
+		goto size_align_fail;
+	}
+
+	drm_gem_private_object_init(dev, obj, size);
+	/*
+	 * I have skipped dma_buf_map_attachment() as we do not know the direction just yet.
+	 * Once the direction is know in the subsequent IOCTL to attach slicing we can do it then.
+	 */
+
+	obj->funcs = &qaic_gem_funcs;
+	obj->import_attach = attach;
+	obj->resv = dma_buf->resv;
+
+	return obj;
+
+size_align_fail:
+	dma_buf_detach(dma_buf, attach);
+attach_fail:
+	dma_buf_put(dma_buf);
+	kfree(bo);
+out:
+	return ERR_PTR(ret);
+}
+
+static int qaic_prepare_import_bo(struct qaic_bo *bo,
+				  struct qaic_attach_slice_hdr *hdr)
+{
+	struct drm_gem_object *obj = &bo->base;
+	struct sg_table *sgt;
+	int ret;
+
+	if (obj->import_attach->dmabuf->size < hdr->size) {
+		trace_qaic_attach_err_2(bo->dbc->qdev, "Invalid import/PRIME buffer size",
+					"DMABUF size", "Requested buffer size",
+					ret, obj->import_attach->dmabuf->size,
+					hdr->size);
+		return -EINVAL;
+	}
+
+	sgt = dma_buf_map_attachment(obj->import_attach, hdr->dir);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		trace_qaic_attach_err(bo->dbc->qdev, "DMABUF map attachment failed", ret);
+		return ret;
+	}
+
+	bo->sgt = sgt;
+	bo->size = hdr->size;
+
+	return 0;
+}
+
+static int qaic_prepare_export_bo(struct qaic_device *qdev, struct qaic_bo *bo,
+				  struct qaic_attach_slice_hdr *hdr)
+{
+	int ret;
+
+	if (bo->size != hdr->size) {
+		trace_qaic_attach_err_2(qdev, "Invalid export buffer size",
+					"DMABUF size", "Requested buffer size",
+					-EINVAL, bo->size, hdr->size);
+		return -EINVAL;
+	}
+
+	ret = dma_map_sgtable(&qdev->pdev->dev, bo->sgt, hdr->dir, 0);
+	if (ret) {
+		trace_qaic_attach_err(qdev, "DMA map sgtable failed", ret);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int qaic_prepare_bo(struct qaic_device *qdev, struct qaic_bo *bo,
+			   struct qaic_attach_slice_hdr *hdr)
+{
+	int ret;
+
+	if (bo->base.import_attach)
+		ret = qaic_prepare_import_bo(bo, hdr);
+	else
+		ret = qaic_prepare_export_bo(qdev, bo, hdr);
+
+	if (ret == 0)
+		bo->dir = hdr->dir;
+
+	return ret;
+}
+
+static void qaic_unprepare_import_bo(struct qaic_bo *bo)
+{
+	dma_buf_unmap_attachment(bo->base.import_attach, bo->sgt, bo->dir);
+	bo->sgt = NULL;
+	bo->size = 0;
+}
+
+static void qaic_unprepare_export_bo(struct qaic_device *qdev, struct qaic_bo *bo)
+{
+	dma_unmap_sgtable(&qdev->pdev->dev, bo->sgt, bo->dir, 0);
+}
+
+static void qaic_unprepare_bo(struct qaic_device *qdev, struct qaic_bo *bo)
+{
+	if (bo->base.import_attach)
+		qaic_unprepare_import_bo(bo);
+	else
+		qaic_unprepare_export_bo(qdev, bo);
+
+	bo->dir = 0;
+}
+
+static void qaic_free_slices_bo(struct qaic_bo *bo)
+{
+	struct bo_slice *slice, *temp;
+
+	list_for_each_entry_safe(slice, temp, &bo->slices, slice) {
+		kref_put(&slice->ref_count, free_slice);
+	}
+}
+
+static int qaic_attach_slicing_bo(struct qaic_device *qdev,
+				  struct qaic_bo *bo,
+				  struct qaic_attach_slice_hdr *hdr,
+				  struct qaic_attach_slice_entry *slice_ent)
+{
+	int ret, i;
+
+	for (i = 0; i < hdr->count; i++) {
+		ret = qaic_map_one_slice(qdev, bo, &slice_ent[i]);
+		if (ret) {
+			qaic_free_slices_bo(bo);
+			return ret;
+		}
+	}
+
+	if (bo->total_slice_nents > qdev->dbc[hdr->dbc_id].nelem) {
+		trace_qaic_attach_err(qdev, "DMA map sg failed", ret);
+		qaic_free_slices_bo(bo);
+		return -ENOSPC;
+	}
+
+	bo->sliced = true;
+	bo->nr_slice = hdr->count;
+	list_add_tail(&bo->bo_list, &qdev->dbc[hdr->dbc_id].bo_lists);
+
+	return 0;
+}
+
+int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data,
+			       struct drm_file *file_priv)
+{
+	struct qaic_attach_slice_entry *slice_ent;
+	struct qaic_attach_slice *args = data;
+	struct dma_bridge_chan	*dbc;
+	int usr_rcu_id, qdev_rcu_id;
+	struct drm_gem_object *obj;
+	struct qaic_device *qdev;
+	unsigned long arg_size;
+	struct qaic_user *usr;
+	u8 __user *user_data;
+	struct qaic_bo *bo;
+	int ret;
+
+	usr = file_priv->driver_priv;
+	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
+	if (!usr->qddev) {
+		ret = -ENODEV;
+		trace_qaic_attach_err(qdev, "Failed to acquire user RCU lock", ret);
+		goto unlock_usr_srcu;
+	}
+
+	qdev = usr->qddev->qdev;
+	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		ret = -ENODEV;
+		trace_qaic_attach_err(qdev, "Failed to acquire device RCU lock", ret);
+		goto unlock_dev_srcu;
+	}
+
+	if (args->hdr.count == 0) {
+		ret = -EINVAL;
+		trace_qaic_attach_err(qdev, "Invalid slice count 0", ret);
+		goto unlock_dev_srcu;
+	}
+
+	arg_size = args->hdr.count * sizeof(*slice_ent);
+	if (arg_size / args->hdr.count != sizeof(*slice_ent)) {
+		ret = -EINVAL;
+		trace_qaic_attach_err_1(qdev, "Invalid slice count",
+					"Slice count", ret, args->hdr.count);
+		goto unlock_dev_srcu;
+	}
+
+	if (args->hdr.dbc_id >= qdev->num_dbc) {
+		ret = -EINVAL;
+		trace_qaic_attach_err_1(qdev, "Invalid DBC ID", "DBC ID", ret,
+					args->hdr.dbc_id);
+		goto unlock_dev_srcu;
+	}
+
+	if (args->hdr.size == 0) {
+		ret = -EINVAL;
+		trace_qaic_attach_err(qdev, "Invalid BO size 0", ret);
+		goto unlock_dev_srcu;
+	}
+
+	if (!(args->hdr.dir == DMA_TO_DEVICE  ||
+	      args->hdr.dir == DMA_FROM_DEVICE)) {
+		ret = -EINVAL;
+		trace_qaic_attach_err_1(qdev, "Invalid DMA direction",
+					"DMA directions", ret, args->hdr.dir);
+		goto unlock_dev_srcu;
+	}
+
+	dbc = &qdev->dbc[args->hdr.dbc_id];
+	if (dbc->usr != usr) {
+		ret = -EINVAL;
+		trace_qaic_attach_err_1(qdev, "User handle mismatch", "DBC ID",
+					ret, args->hdr.dbc_id);
+		goto unlock_dev_srcu;
+	}
+
+	if (args->data == 0) {
+		ret = -EINVAL;
+		trace_qaic_attach_err(qdev, "Invalid data pointer (NULL).", ret);
+		goto unlock_dev_srcu;
+	}
+
+	user_data = u64_to_user_ptr(args->data);
+
+	slice_ent = kzalloc(arg_size, GFP_KERNEL);
+	if (!slice_ent) {
+		ret = -EINVAL;
+		trace_qaic_attach_err_1(qdev, "Failed to allocate memory for slice entries",
+					"Number of slice", ret, args->hdr.count);
+		goto unlock_dev_srcu;
+	}
+
+	ret = copy_from_user(slice_ent, user_data, arg_size);
+	if (ret) {
+		ret = -EFAULT;
+		trace_qaic_attach_err(qdev, "Failed to copy data from user to kernel", ret);
+		goto free_slice_ent;
+	}
+
+	ret = qaic_validate_req(qdev, slice_ent, args->hdr.count, args->hdr.size);
+	if (ret)
+		goto free_slice_ent;
+
+	obj = drm_gem_object_lookup(file_priv, args->hdr.handle);
+	if (!obj) {
+		trace_qaic_attach_err_1(qdev, "Invalid BO handle", "BO handle",
+					ret, args->hdr.handle);
+		ret = -ENOENT;
+		goto free_slice_ent;
+	}
+
+	bo = to_qaic_bo(obj);
+
+	ret = qaic_prepare_bo(qdev, bo, &args->hdr);
+	if (ret)
+		goto put_bo;
+
+	ret = qaic_attach_slicing_bo(qdev, bo, &args->hdr, slice_ent);
+	if (ret)
+		goto unprepare_bo;
+
+	if (args->hdr.dir == DMA_TO_DEVICE)
+		dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, args->hdr.dir);
+
+	bo->dbc = dbc;
+	drm_gem_object_put(obj);
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+
+	return 0;
+
+unprepare_bo:
+	qaic_unprepare_bo(qdev, bo);
+put_bo:
+	drm_gem_object_put(obj);
+free_slice_ent:
+	kfree(slice_ent);
+unlock_dev_srcu:
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+unlock_usr_srcu:
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+	return ret;
+}
+
+static inline int copy_exec_reqs(struct qaic_device *qdev,
+				 struct bo_slice *slice, u32 dbc_id, u32 head,
+				 u32 *ptail)
+{
+	struct dma_bridge_chan *dbc = &qdev->dbc[dbc_id];
+	struct dbc_req *reqs = slice->reqs;
+	u32 tail = *ptail;
+	u32 avail;
+
+	avail = head - tail;
+	if (head <= tail)
+		avail += dbc->nelem;
+
+	--avail;
+
+	if (avail < slice->nents) {
+		trace_qaic_exec_err_2(qdev, "No enough resources to execute this BO slice",
+				      "resource available", "resource needed",
+				      -EAGAIN, avail, slice->nents);
+		return -EAGAIN;
+	}
+
+	if (tail + slice->nents > dbc->nelem) {
+		avail = dbc->nelem - tail;
+		avail = min_t(u32, avail, slice->nents);
+		memcpy(dbc->req_q_base + tail * get_dbc_req_elem_size(),
+		       reqs, sizeof(*reqs) * avail);
+		reqs += avail;
+		avail = slice->nents - avail;
+		if (avail)
+			memcpy(dbc->req_q_base, reqs, sizeof(*reqs) * avail);
+	} else {
+		memcpy(dbc->req_q_base + tail * get_dbc_req_elem_size(),
+		       reqs, sizeof(*reqs) * slice->nents);
+	}
+
+	*ptail = (tail + slice->nents) % dbc->nelem;
+
+	return 0;
+}
+
+/*
+ * Based on the value of resize we may only need to transmit first_n
+ * entries and the last entry, with last_bytes to send from the last entry.
+ * Note that first_n could be 0.
+ */
+static inline int copy_partial_exec_reqs(struct qaic_device *qdev,
+					 struct bo_slice *slice,
+					 u64 resize, u32 dbc_id,
+					 u32 head, u32 *ptail)
+{
+	struct dma_bridge_chan *dbc = &qdev->dbc[dbc_id];
+	struct dbc_req *reqs = slice->reqs;
+	struct dbc_req *last_req;
+	u32 tail = *ptail;
+	u64 total_bytes;
+	u64 last_bytes;
+	u32 first_n;
+	u32 avail;
+	int ret;
+	int i;
+
+	avail = head - tail;
+	if (head <= tail)
+		avail += dbc->nelem;
+
+	--avail;
+
+	total_bytes = 0;
+	for (i = 0; i < slice->nents; i++) {
+		total_bytes += le32_to_cpu(reqs[i].len);
+		if (total_bytes >= resize)
+			break;
+	}
+
+	if (total_bytes < resize) {
+		/* User space should have used the full buffer path. */
+		ret = -EINVAL;
+		trace_qaic_exec_err_2(qdev, "Resize too big for partial buffer",
+				      "partial/full size of BO slice",
+				      "slice resize", ret, total_bytes, resize);
+		return ret;
+	}
+
+	first_n = i;
+	last_bytes = i ? resize + le32_to_cpu(reqs[i].len) - total_bytes : resize;
+
+	if (avail < (first_n + 1)) {
+		trace_qaic_exec_err_2(qdev, "Not enough resources to execute this BO slice",
+				      "resource available", "resource needed",
+				      -EAGAIN, avail, first_n + 1);
+		return -EAGAIN;
+	}
+
+	if (first_n) {
+		if (tail + first_n > dbc->nelem) {
+			avail = dbc->nelem - tail;
+			avail = min_t(u32, avail, first_n);
+			memcpy(dbc->req_q_base + tail * get_dbc_req_elem_size(),
+			       reqs, sizeof(*reqs) * avail);
+			last_req = reqs + avail;
+			avail = first_n - avail;
+			if (avail)
+				memcpy(dbc->req_q_base, last_req,
+				       sizeof(*reqs) * avail);
+		} else {
+			memcpy(dbc->req_q_base + tail * get_dbc_req_elem_size(),
+			       reqs, sizeof(*reqs) * first_n);
+		}
+	}
+
+	/* Copy over the last entry. Here we need to adjust len to the left over
+	 * size, and set src and dst to the entry it is copied to.
+	 */
+	last_req =  dbc->req_q_base +
+		    (tail + first_n) % dbc->nelem * get_dbc_req_elem_size();
+	memcpy(last_req, reqs + slice->nents - 1, sizeof(*reqs));
+
+	/*
+	 * last_bytes holds size of a DMA segment, maximum DMA segment size is
+	 * set to UINT_MAX by qaic and hence last_bytes can never exceed u32
+	 * range. So, by down sizing we are not corrupting the value.
+	 */
+	last_req->len = cpu_to_le32((u32)last_bytes);
+	last_req->src_addr = reqs[first_n].src_addr;
+	last_req->dest_addr = reqs[first_n].dest_addr;
+
+	*ptail = (tail + first_n + 1) % dbc->nelem;
+
+	return 0;
+}
+
+static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data,
+				   struct drm_file *file_priv, bool is_partial)
+{
+	struct qaic_partial_execute_entry *pexec;
+	struct qaic_execute *args = data;
+	struct qaic_execute_entry *exec;
+	struct dma_bridge_chan *dbc;
+	int usr_rcu_id, qdev_rcu_id;
+	struct drm_gem_object *obj;
+	struct qaic_device *qdev;
+	struct bo_slice *slice;
+	struct qaic_user *usr;
+	u8 __user *user_data;
+	unsigned long flags;
+	u64 received_ts = 0;
+	u32 queue_level = 0;
+	struct qaic_bo *bo;
+	u64 submit_ts = 0;
+	unsigned long n;
+	bool queued;
+	int ret = 0;
+	int dbc_id;
+	int rcu_id;
+	u32 head;
+	u32 tail;
+	u64 size;
+	int i, j;
+
+	received_ts = ktime_get_ns();
+
+	usr = file_priv->driver_priv;
+	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
+	if (!usr->qddev) {
+		ret = -ENODEV;
+		trace_qaic_exec_err(qdev, "Failed to acquire user RCU lock", ret);
+		goto unlock_usr_srcu;
+	}
+
+	qdev = usr->qddev->qdev;
+	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		ret = -ENODEV;
+		trace_qaic_exec_err(qdev, "Failed to acquire device RCU lock", ret);
+		goto unlock_dev_srcu;
+	}
+
+	if (args->hdr.dbc_id >= qdev->num_dbc) {
+		ret = -EINVAL;
+		trace_qaic_exec_err_1(qdev, "Invalid DBC ID", "DBC ID", ret, args->hdr.dbc_id);
+		goto unlock_dev_srcu;
+	}
+
+	dbc_id = args->hdr.dbc_id;
+	dbc = &qdev->dbc[dbc_id];
+
+	size = is_partial ? sizeof(*pexec) : sizeof(*exec);
+
+	n = (unsigned long)size * args->hdr.count;
+	if (args->hdr.count == 0 || n / args->hdr.count != size) {
+		ret = -EINVAL;
+		trace_qaic_exec_err_1(qdev, "Invalid number of execute requests",
+				      "execute count", ret, args->hdr.count);
+		goto unlock_dev_srcu;
+	}
+
+	user_data = u64_to_user_ptr(args->data);
+
+	exec = kcalloc(args->hdr.count, size, GFP_KERNEL);
+	pexec = (struct qaic_partial_execute_entry *)exec;
+	if (!exec) {
+		ret = -ENOMEM;
+		trace_qaic_exec_err_1(qdev, "Failed to allocate execute entry structure",
+				      "execute count", ret, args->hdr.count);
+		goto unlock_dev_srcu;
+	}
+
+	if (copy_from_user(exec, user_data, n)) {
+		ret = -EFAULT;
+		trace_qaic_exec_err(qdev, "Failed to copy data from user to kernel", ret);
+		goto free_exec;
+	}
+
+	rcu_id = srcu_read_lock(&dbc->ch_lock);
+	if (!dbc->usr || dbc->usr->handle != usr->handle) {
+		ret = -EPERM;
+		trace_qaic_exec_err_1(qdev, "User handle mismatch", "DBC ID", ret, dbc_id);
+		goto release_ch_rcu;
+	}
+
+	if (dbc->in_ssr) {
+		ret = -EPIPE;
+		trace_qaic_exec_err(qdev, "In SSR", ret);
+		goto release_ch_rcu;
+	}
+
+	head = readl(dbc->dbc_base + REQHP_OFF);
+	tail = readl(dbc->dbc_base + REQTP_OFF);
+
+	if (head == U32_MAX || tail == U32_MAX) {
+		/* PCI link error */
+		ret = -ENODEV;
+		trace_qaic_exec_err(qdev, "Failed to read HW head pointer and tail pointer", ret);
+		goto release_ch_rcu;
+	}
+
+	queue_level = head <= tail ? tail - head : dbc->nelem - (head - tail);
+
+	for (i = 0; i < args->hdr.count; i++) {
+		/*
+		 * ref count will be decemented when the transfer of this
+		 * buffer is complete. It is inside dbc_irq_threaded_fn().
+		 */
+		obj = drm_gem_object_lookup(file_priv,
+					    is_partial ? pexec[i].handle : exec[i].handle);
+		if (!obj) {
+			ret = -ENOENT;
+			trace_qaic_exec_err_2(qdev, "Invalid BO handle provided",
+					      "BO handle", "execute index",
+					      ret, is_partial ? pexec[i].handle :
+					      exec[i].handle, i);
+			goto sync_to_cpu;
+		}
+
+		bo = to_qaic_bo(obj);
+
+		if (!bo->sliced) {
+			ret = -EINVAL;
+			trace_qaic_exec_err_1(qdev, "Slicing information is not attached to BO",
+					      "BO Handle", ret, bo->handle);
+			goto sync_to_cpu;
+		}
+
+		if (is_partial && pexec[i].resize > bo->size) {
+			ret = -EINVAL;
+			trace_qaic_exec_err_2(qdev, "Resize value too large for partial execute IOCTL",
+					      "BO size", "Resize",
+					      ret, bo->size, pexec[i].resize);
+			goto sync_to_cpu;
+		}
+
+		spin_lock_irqsave(&dbc->xfer_lock, flags);
+		queued = bo->queued;
+		bo->queued = true;
+		if (queued) {
+			spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+			ret = -EINVAL;
+			trace_qaic_exec_err_1(qdev, "BO is already queued",
+					      "BO handle", ret, bo->handle);
+			goto sync_to_cpu;
+		}
+
+		bo->req_id = dbc->next_req_id++;
+
+		list_for_each_entry(slice, &bo->slices, slice) {
+			/*
+			 * If this slice does not falls under the given
+			 * resize then skip this slice and continue the loop
+			 */
+			if (is_partial && pexec[i].resize &&
+			    pexec[i].resize <= slice->offset)
+				continue;
+
+			for (j = 0; j < slice->nents; j++)
+				slice->reqs[j].req_id = cpu_to_le16(bo->req_id);
+
+			/*
+			 * If it is a partial execute ioctl call then check if
+			 * resize has cut this slice short then do a partial copy
+			 * else do complete copy
+			 */
+			if (is_partial && pexec[i].resize &&
+			    pexec[i].resize < slice->offset + slice->size)
+				ret = copy_partial_exec_reqs(qdev, slice,
+							     pexec[i].resize - slice->offset,
+							     dbc_id, head, &tail);
+			else
+				ret = copy_exec_reqs(qdev, slice, dbc_id, head, &tail);
+			if (ret) {
+				bo->queued = false;
+				spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+				goto sync_to_cpu;
+			}
+		}
+		reinit_completion(&bo->xfer_done);
+		list_add_tail(&bo->xfer_list, &dbc->xfer_list);
+		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+		dma_sync_sgtable_for_device(&qdev->pdev->dev, bo->sgt, bo->dir);
+	}
+
+	submit_ts = ktime_get_ns();
+	writel(tail, dbc->dbc_base + REQTP_OFF);
+
+	/* Collect kernel Profiling data */
+	for (i = 0; i < args->hdr.count; i++) {
+		/*
+		 * Since we already committed the BO to hardware, the only way
+		 * this should fail is a pending signal.  We can't cancel the
+		 * submit to hardware, so we have to just skip the profiling
+		 * data.  In case the signal is not fatal to the process, we
+		 * return success so that the user doesn't try to resubmit.
+		 */
+		obj = drm_gem_object_lookup(file_priv,
+					    is_partial ? pexec[i].handle : exec[i].handle);
+		if (!obj) {
+			trace_qaic_exec_err_2(qdev, "Invalid BO handle provided",
+					      "BO handle", "execute index",
+					      ret, is_partial ? pexec[i].handle :
+					      exec[i].handle, i);
+			break;
+		}
+		bo = to_qaic_bo(obj);
+		bo->perf_stats.req_received_ts = received_ts;
+		bo->perf_stats.req_submit_ts = submit_ts;
+		bo->perf_stats.queue_level_before = queue_level;
+		queue_level += bo->total_slice_nents;
+		drm_gem_object_put(obj);
+	}
+
+	if (poll_datapath)
+		schedule_work(&dbc->poll_work);
+
+	goto release_ch_rcu;
+
+sync_to_cpu:
+	if (likely(obj))
+		drm_gem_object_put(obj);
+	for (j = 0; j < i; j++) {
+		spin_lock_irqsave(&dbc->xfer_lock, flags);
+		bo = list_last_entry(&dbc->xfer_list, struct qaic_bo,
+				     xfer_list);
+		obj = &bo->base;
+		bo->queued = false;
+		list_del(&bo->xfer_list);
+		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+		dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
+		/* Release ref to BO */
+		drm_gem_object_put(obj);
+	}
+release_ch_rcu:
+	srcu_read_unlock(&dbc->ch_lock, rcu_id);
+free_exec:
+	kfree(exec);
+unlock_dev_srcu:
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+unlock_usr_srcu:
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+	return ret;
+}
+
+int qaic_execute_bo_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv)
+{
+	return __qaic_execute_bo_ioctl(dev, data, file_priv, false);
+}
+
+int qaic_partial_execute_bo_ioctl(struct drm_device *dev, void *data,
+				  struct drm_file *file_priv)
+{
+	return __qaic_execute_bo_ioctl(dev, data, file_priv, true);
+}
+
+/*
+ * Our interrupt handling is a bit more complicated than a simple ideal, but
+ * sadly necessary.
+ *
+ * Each dbc has a completion queue.  Entries in the queue correspond to DMA
+ * requests which the device has processed.  The hardware already has a built
+ * in irq mitigation.  When the device puts an entry into the queue, it will
+ * only trigger an interrupt if the queue was empty.  Therefore, when adding
+ * the Nth event to a non-empty queue, the hardware doesn't trigger an
+ * interrupt.  This means the host doesn't get additional interrupts signaling
+ * the same thing - the queue has something to process.
+ * This behavior can be overridden in the DMA request.
+ * This means that when the host receives an interrupt, it is required to
+ * drain the queue.
+ *
+ * This behavior is what NAPI attempts to accomplish, although we can't use
+ * NAPI as we don't have a netdev.  We use threaded irqs instead.
+ *
+ * However, there is a situation where the host drains the queue fast enough
+ * that every event causes an interrupt.  Typically this is not a problem as
+ * the rate of events would be low.  However, that is not the case with
+ * lprnet for example.  On an Intel Xeon D-2191 where we run 8 instances of
+ * lprnet, the host receives roughly 80k interrupts per second from the device
+ * (per /proc/interrupts).  While NAPI documentation indicates the host should
+ * just chug along, sadly that behavior causes instability in some hosts.
+ *
+ * Therefore, we implement an interrupt disable scheme similar to NAPI.  The
+ * key difference is that we will delay after draining the queue for a small
+ * time to allow additional events to come in via polling.  Using the above
+ * lprnet workload, this reduces the number of interrupts processed from
+ * ~80k/sec to about 64 in 5 minutes and appears to solve the system
+ * instability.
+ */
+irqreturn_t dbc_irq_handler(int irq, void *data)
+{
+	struct dma_bridge_chan *dbc = data;
+	int rcu_id;
+	u32 head;
+	u32 tail;
+
+	rcu_id = srcu_read_lock(&dbc->ch_lock);
+
+	if (!dbc->usr) {
+		srcu_read_unlock(&dbc->ch_lock, rcu_id);
+		return IRQ_HANDLED;
+	}
+
+	head = readl(dbc->dbc_base + RSPHP_OFF);
+	if (head == U32_MAX) { /* PCI link error */
+		srcu_read_unlock(&dbc->ch_lock, rcu_id);
+		return IRQ_NONE;
+	}
+
+	tail = readl(dbc->dbc_base + RSPTP_OFF);
+	if (tail == U32_MAX) { /* PCI link error */
+		srcu_read_unlock(&dbc->ch_lock, rcu_id);
+		return IRQ_NONE;
+	}
+
+	if (head == tail) { /* queue empty */
+		srcu_read_unlock(&dbc->ch_lock, rcu_id);
+		return IRQ_NONE;
+	}
+
+	disable_irq_nosync(irq);
+	srcu_read_unlock(&dbc->ch_lock, rcu_id);
+	return IRQ_WAKE_THREAD;
+}
+
+void irq_polling_work(struct work_struct *work)
+{
+	struct dma_bridge_chan *dbc = container_of(work,
+						   struct dma_bridge_chan,
+						   poll_work);
+	unsigned long flags;
+	int rcu_id;
+	u32 head;
+	u32 tail;
+
+	rcu_id = srcu_read_lock(&dbc->ch_lock);
+
+	while (1) {
+		if (dbc->qdev->in_reset) {
+			srcu_read_unlock(&dbc->ch_lock, rcu_id);
+			return;
+		}
+		if (!dbc->usr) {
+			srcu_read_unlock(&dbc->ch_lock, rcu_id);
+			return;
+		}
+		spin_lock_irqsave(&dbc->xfer_lock, flags);
+		if (list_empty(&dbc->xfer_list)) {
+			spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+			srcu_read_unlock(&dbc->ch_lock, rcu_id);
+			return;
+		}
+		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+
+		head = readl(dbc->dbc_base + RSPHP_OFF);
+		if (head == U32_MAX) { /* PCI link error */
+			srcu_read_unlock(&dbc->ch_lock, rcu_id);
+			return;
+		}
+
+		tail = readl(dbc->dbc_base + RSPTP_OFF);
+		if (tail == U32_MAX) { /* PCI link error */
+			srcu_read_unlock(&dbc->ch_lock, rcu_id);
+			return;
+		}
+
+		if (head != tail) {
+			irq_wake_thread(dbc->irq, dbc);
+			srcu_read_unlock(&dbc->ch_lock, rcu_id);
+			return;
+		}
+
+		cond_resched();
+		usleep_range(datapath_poll_interval_us,
+			     2 * datapath_poll_interval_us);
+	}
+}
+
+irqreturn_t dbc_irq_threaded_fn(int irq, void *data)
+{
+	struct dma_bridge_chan *dbc = data;
+	int event_count = NUM_EVENTS;
+	int delay_count = NUM_DELAYS;
+	struct qaic_device *qdev;
+	struct qaic_bo *bo, *i;
+	struct dbc_rsp *rsp;
+	unsigned long flags;
+	int rcu_id;
+	u16 status;
+	u16 req_id;
+	u32 head;
+	u32 tail;
+
+	rcu_id = srcu_read_lock(&dbc->ch_lock);
+
+	head = readl(dbc->dbc_base + RSPHP_OFF);
+	if (head == U32_MAX) /* PCI link error */
+		goto error_out;
+
+	qdev = dbc->qdev;
+read_fifo:
+
+	if (!event_count) {
+		event_count = NUM_EVENTS;
+		cond_resched();
+	}
+
+	/*
+	 * if this channel isn't assigned or gets unassigned during processing
+	 * we have nothing further to do
+	 */
+	if (!dbc->usr)
+		goto error_out;
+
+	tail = readl(dbc->dbc_base + RSPTP_OFF);
+	if (tail == U32_MAX) /* PCI link error */
+		goto error_out;
+
+	if (head == tail) { /* queue empty */
+		if (delay_count) {
+			--delay_count;
+			usleep_range(100, 200);
+			goto read_fifo; /* check for a new event */
+		}
+		goto normal_out;
+	}
+
+	delay_count = NUM_DELAYS;
+	while (head != tail) {
+		if (!event_count)
+			break;
+		--event_count;
+		rsp = dbc->rsp_q_base + head * sizeof(*rsp);
+		req_id = le16_to_cpu(rsp->req_id);
+		status = le16_to_cpu(rsp->status);
+		if (status)
+			pci_dbg(qdev->pdev, "req_id %d failed with status %d\n",
+				req_id, status);
+		spin_lock_irqsave(&dbc->xfer_lock, flags);
+		/*
+		 * A BO can receive multiple interrupts, since a BO can be
+		 * divided into multiple slices and a buffer receives as many
+		 * interrupts as slices. So until it receives interrupts for
+		 * all the slices we cannot mark that buffer complete.
+		 */
+		list_for_each_entry_safe(bo, i, &dbc->xfer_list, xfer_list) {
+			if (bo->req_id == req_id)
+				bo->nr_slice_xfer_done++;
+			else
+				continue;
+
+			if (bo->nr_slice_xfer_done < bo->nr_slice)
+				break;
+
+			/*
+			 * At this point we have received all the interrupts for
+			 * BO, which means BO execution is complete.
+			 */
+			dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
+			bo->nr_slice_xfer_done = 0;
+			bo->queued = false;
+			list_del(&bo->xfer_list);
+			bo->perf_stats.req_processed_ts = ktime_get_ns();
+			complete_all(&bo->xfer_done);
+			drm_gem_object_put(&bo->base);
+			break;
+		}
+		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+		head = (head + 1) % dbc->nelem;
+	}
+
+	/*
+	 * Update the head pointer of response queue and let the device know
+	 * that we have consumed elements from the queue.
+	 */
+	writel(head, dbc->dbc_base + RSPHP_OFF);
+
+	/* elements might have been put in the queue while we were processing */
+	goto read_fifo;
+
+normal_out:
+	if (likely(!poll_datapath))
+		enable_irq(irq);
+	else
+		schedule_work(&dbc->poll_work);
+	/* checking the fifo and enabling irqs is a race, missed event check */
+	tail = readl(dbc->dbc_base + RSPTP_OFF);
+	if (tail != U32_MAX && head != tail) {
+		if (likely(!poll_datapath))
+			disable_irq_nosync(irq);
+		goto read_fifo;
+	}
+	srcu_read_unlock(&dbc->ch_lock, rcu_id);
+	return IRQ_HANDLED;
+
+error_out:
+	srcu_read_unlock(&dbc->ch_lock, rcu_id);
+	if (likely(!poll_datapath))
+		enable_irq(irq);
+	else
+		schedule_work(&dbc->poll_work);
+
+	return IRQ_HANDLED;
+}
+
+int qaic_wait_bo_ioctl(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv)
+{
+	struct qaic_wait *args = data;
+	int usr_rcu_id, qdev_rcu_id;
+	struct dma_bridge_chan *dbc;
+	struct drm_gem_object *obj;
+	struct qaic_device *qdev;
+	unsigned long timeout;
+	struct qaic_user *usr;
+	struct qaic_bo *bo;
+	int rcu_id;
+	int ret;
+
+	usr = file_priv->driver_priv;
+	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
+	if (!usr->qddev) {
+		ret = -ENODEV;
+		trace_qaic_wait_err(qdev, "Failed to acquire user RCU lock", ret);
+		goto unlock_usr_srcu;
+	}
+
+	qdev = usr->qddev->qdev;
+	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		ret = -ENODEV;
+		trace_qaic_wait_err(qdev, "Failed to acquire device RCU lock", ret);
+		goto unlock_dev_srcu;
+	}
+
+	if (args->pad != 0) {
+		ret = -EINVAL;
+		trace_qaic_wait_err(qdev, "Pad value is non-zero", ret);
+		goto unlock_dev_srcu;
+	}
+
+	if (args->dbc_id >= qdev->num_dbc) {
+		ret = -EINVAL;
+		trace_qaic_wait_err_1(qdev, "Invalid DBC ID", "DBC ID", ret, args->dbc_id);
+		goto unlock_dev_srcu;
+	}
+
+	dbc = &qdev->dbc[args->dbc_id];
+
+	rcu_id = srcu_read_lock(&dbc->ch_lock);
+	if (dbc->usr != usr) {
+		ret = -EPERM;
+		trace_qaic_wait_err_1(qdev, "Mismatch user handle", "DBC ID", ret, args->dbc_id);
+		goto unlock_ch_srcu;
+	}
+
+	if (dbc->in_ssr) {
+		ret = -EPIPE;
+		trace_qaic_wait_err(qdev, "In SSR", ret);
+		goto unlock_ch_srcu;
+	}
+
+	obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!obj) {
+		ret = -ENOENT;
+		trace_qaic_wait_err_1(qdev, "Invalid BO handle", "handle", ret, args->handle);
+		goto unlock_ch_srcu;
+	}
+
+	bo = to_qaic_bo(obj);
+	timeout = args->timeout ? args->timeout : wait_exec_default_timeout;
+	timeout = msecs_to_jiffies(timeout);
+	ret = wait_for_completion_interruptible_timeout(&bo->xfer_done, timeout);
+	if (!ret) {
+		ret = -ETIMEDOUT;
+		trace_qaic_wait_err_1(qdev, "Wait timeout", "timeout", ret,
+				      jiffies_to_msecs(timeout));
+		goto put_obj;
+	}
+	if (ret > 0)
+		ret = 0;
+
+	if (!dbc->usr) {
+		ret = -EPERM;
+		trace_qaic_wait_err(qdev, "User disappeared", ret);
+	} else if (dbc->in_ssr) {
+		/*
+		 * While waiting for this buffer transaction, it is possible
+		 * that SSR was triggered on this DBC.  Thus we flushed all
+		 * buffers on this DBC in transfer queue and marked them as
+		 * complete.  Therefore, return an error as this buffer
+		 * transaction failed.
+		 */
+		ret = -EPIPE;
+		trace_qaic_wait_err(qdev, "In SSR", ret);
+	}
+
+put_obj:
+	drm_gem_object_put(obj);
+unlock_ch_srcu:
+	srcu_read_unlock(&dbc->ch_lock, rcu_id);
+unlock_dev_srcu:
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+unlock_usr_srcu:
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+	return ret;
+}
+
+int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file_priv)
+{
+	struct qaic_perf_stats_entry *ent = NULL;
+	struct qaic_perf_stats *args = data;
+	int usr_rcu_id, qdev_rcu_id;
+	struct drm_gem_object *obj;
+	struct qaic_device *qdev;
+	struct qaic_user *usr;
+	struct qaic_bo *bo;
+	int ret, i;
+
+	usr = file_priv->driver_priv;
+	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
+	if (!usr->qddev) {
+		ret = -ENODEV;
+		trace_qaic_stats_err(qdev, "Failed to acquire user RCU lock", ret);
+		goto unlock_usr_srcu;
+	}
+
+	qdev = usr->qddev->qdev;
+	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		ret = -ENODEV;
+		trace_qaic_stats_err(qdev, "Failed to acquire device RCU lock", ret);
+		goto unlock_dev_srcu;
+	}
+
+	if (args->hdr.dbc_id >= qdev->num_dbc) {
+		ret = -EINVAL;
+		trace_qaic_stats_err_1(qdev, "Invalid DBC ID", "DBC ID", ret, args->hdr.dbc_id);
+		goto unlock_dev_srcu;
+	}
+
+	ent = kcalloc(args->hdr.count, sizeof(*ent), GFP_KERNEL);
+	if (!ent) {
+		ret = -EINVAL;
+		trace_qaic_stats_err_1(qdev, "Failed to allocate memory for perf stats structure",
+				       "query count", ret, args->hdr.count);
+		goto unlock_dev_srcu;
+	}
+
+	ret = copy_from_user(ent, u64_to_user_ptr(args->data),
+			     args->hdr.count * sizeof(*ent));
+	if (ret) {
+		ret = -EFAULT;
+		trace_qaic_stats_err(qdev, "Failed to copy data from user to kernel", ret);
+		goto free_ent;
+	}
+
+	for (i = 0; i < args->hdr.count; i++) {
+		obj = drm_gem_object_lookup(file_priv, ent[i].handle);
+		if (!obj) {
+			ret = -ENOENT;
+			trace_qaic_stats_err_1(qdev, "Invalid BO handle",
+					       "BO handle", ret, ent[i].handle);
+			goto free_ent;
+		}
+		bo = to_qaic_bo(obj);
+		/*
+		 * perf stats ioctl is called before wait ioctl is complete then
+		 * the latency information is invalid.
+		 */
+		if (bo->perf_stats.req_processed_ts < bo->perf_stats.req_submit_ts) {
+			ent[i].device_latency_us = 0;
+		} else {
+			ent[i].device_latency_us = (bo->perf_stats.req_processed_ts -
+						    bo->perf_stats.req_submit_ts) / 1000;
+		}
+		ent[i].submit_latency_us = (bo->perf_stats.req_submit_ts -
+					   bo->perf_stats.req_received_ts) / 1000;
+		ent[i].queue_level_before = bo->perf_stats.queue_level_before;
+		ent[i].num_queue_element = bo->total_slice_nents;
+		drm_gem_object_put(obj);
+	}
+
+	if (copy_to_user(u64_to_user_ptr(args->data), ent,
+			 args->hdr.count * sizeof(*ent))) {
+		ret = -EFAULT;
+		trace_qaic_stats_err(qdev, "Failed to copy data to user from kernel", ret);
+	}
+
+free_ent:
+	kfree(ent);
+unlock_dev_srcu:
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+unlock_usr_srcu:
+	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
+	return ret;
+}
+
+static void empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *dbc)
+{
+	unsigned long flags;
+	struct qaic_bo *bo;
+
+	spin_lock_irqsave(&dbc->xfer_lock, flags);
+	while (!list_empty(&dbc->xfer_list)) {
+		bo = list_first_entry(&dbc->xfer_list, typeof(*bo), xfer_list);
+		bo->queued = false;
+		list_del(&bo->xfer_list);
+		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+		dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
+		complete_all(&bo->xfer_done);
+		drm_gem_object_put(&bo->base);
+		spin_lock_irqsave(&dbc->xfer_lock, flags);
+	}
+	spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+}
+
+int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr)
+{
+	if (!qdev->dbc[dbc_id].usr ||
+	    qdev->dbc[dbc_id].usr->handle != usr->handle)
+		return -EPERM;
+
+	qdev->dbc[dbc_id].usr = NULL;
+	synchronize_srcu(&qdev->dbc[dbc_id].ch_lock);
+	return 0;
+}
+
+/**
+ * enable_dbc - Enable the DBC. DBCs are disabled by removing the context of
+ * user. Add user context back to DBC to enable it. This fucntions trusts the
+ * DBC ID passed and expects the DBC to be disabled.
+ * @qdev: Qranium device handle
+ * @dbc_id: ID of the DBC
+ * @usr: User context
+ */
+void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr)
+{
+	qdev->dbc[dbc_id].usr = usr;
+}
+
+void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id)
+{
+	struct dma_bridge_chan *dbc = &qdev->dbc[dbc_id];
+
+	dbc->usr = NULL;
+	empty_xfer_list(qdev, dbc);
+	synchronize_srcu(&dbc->ch_lock);
+}
+
+void release_dbc(struct qaic_device *qdev, u32 dbc_id, bool set_state)
+{
+	struct bo_slice *slice, *slice_temp;
+	struct qaic_bo *bo, *bo_temp;
+	struct dma_bridge_chan *dbc;
+
+	dbc = &qdev->dbc[dbc_id];
+	if (!dbc->in_use)
+		return;
+
+	wakeup_dbc(qdev, dbc_id);
+
+	dma_free_coherent(&qdev->pdev->dev, dbc->total_size, dbc->req_q_base,
+			  dbc->dma_addr);
+	dbc->total_size = 0;
+	dbc->req_q_base = NULL;
+	dbc->dma_addr = 0;
+	dbc->nelem = 0;
+	dbc->usr = NULL;
+	if (set_state)
+		set_dbc_state(qdev, dbc_id, DBC_STATE_IDLE);
+
+	list_for_each_entry_safe(bo, bo_temp, &dbc->bo_lists, bo_list) {
+		list_for_each_entry_safe(slice, slice_temp, &bo->slices, slice)
+			kref_put(&slice->ref_count, free_slice);
+		bo->sliced = false;
+		INIT_LIST_HEAD(&bo->slices);
+		bo->total_slice_nents = 0;
+		bo->dir = 0;
+		bo->dbc = NULL;
+		bo->nr_slice = 0;
+		bo->nr_slice_xfer_done = 0;
+		bo->queued = false;
+		bo->req_id = 0;
+		init_completion(&bo->xfer_done);
+		complete_all(&bo->xfer_done);
+		list_del(&bo->bo_list);
+		bo->perf_stats.req_received_ts = 0;
+		bo->perf_stats.req_submit_ts = 0;
+		bo->perf_stats.req_processed_ts = 0;
+		bo->perf_stats.queue_level_before = 0;
+	}
+
+	dbc->in_use = false;
+	wake_up(&dbc->dbc_release);
+}
+
+void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail)
+{
+	if (!dbc || !head || !tail)
+		return;
+
+	*head = readl(dbc->dbc_base + REQHP_OFF);
+	*tail = readl(dbc->dbc_base + REQTP_OFF);
+}
+
+/**
+ * dbc_enter_ssr - Prepare to enter in sub system reset(SSR) for given DBC ID
+ * During SSR we cannot support execute ioctl and wait ioctl for the given DBC.
+ * We control this behaviour using in_ssr flag in DBC.
+ * @qdev: Qranium device handle
+ * @dbc_id: ID of the DBC which will enter SSR
+ */
+void dbc_enter_ssr(struct qaic_device *qdev, u32 dbc_id)
+{
+	struct dma_bridge_chan *dbc = &qdev->dbc[dbc_id];
+
+	dbc->in_ssr = true;
+	empty_xfer_list(qdev, dbc);
+	synchronize_srcu(&dbc->ch_lock);
+}
+
+/**
+ * dbc_exit_ssr - Prepare to exit from sub system reset(SSR) for given DBC ID
+ * After SSR we exit SSR we can resume our supporting execute ioctl and
+ * wait ioctl. We control this behaviour using in_ssr flag in DBC.
+ * @qdev: Qranium device handle
+ * @dbc_id: ID of the DBC which will exit SSR
+ */
+void dbc_exit_ssr(struct qaic_device *qdev, u32 dbc_id)
+{
+	qdev->dbc[dbc_id].in_ssr = false;
+}
-- 
2.7.4

