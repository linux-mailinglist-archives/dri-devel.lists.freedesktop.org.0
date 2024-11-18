Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C6A9D0B11
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B9510E449;
	Mon, 18 Nov 2024 08:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="B38gGp0y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E257610E449
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 08:41:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5Rvo9009987;
 Mon, 18 Nov 2024 08:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0m0swi7dMzuPkzfVzknuzLvpMu3d39mlj69ZvYRt3o8=; b=B38gGp0yjl0JWeNu
 rNwgj1iPDZdgyazOIx90j8s8PKQN2yTR4B6vwxqMVUlagYVS7KJ406+15rsH9zaa
 Yp6VfRZANdYyO2lChn65l4qoKU1ikAS0dOUX3g7xw0NyVB4+vkBHyPRvvwlR04/1
 Nxh5R5Gh6hR5rkBB32eLiQeiCV5YZ0fc/fXVWXk5Gi2YduNvxC+qDRR13EqLKkB3
 rRWAJQRbf3cZHOnAir+1/aDxBoSKHIjs5IX6n38DPNjoBSdOyXl/KkoWNtcwGgH5
 gtdgKn31julLRbS0botZsHpuvzIIvvUQY6UWm9py++2zelVrFBmVCtipwSRap/0+
 UUaJvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkrm3vvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 08:41:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI8f6Re008054
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 08:41:06 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 00:41:03 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 3/4] misc: fastrpc: Introduce fastrpc_shared.h header
Date: Mon, 18 Nov 2024 14:10:45 +0530
Message-ID: <20241118084046.3201290-4-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: R12A47gJJ4yPqdq5m7fPXXjqFyvyuBih
X-Proofpoint-ORIG-GUID: R12A47gJJ4yPqdq5m7fPXXjqFyvyuBih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411180071
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

Move fastrpc structures and MACRO definitions to a new header file.
These definitions are consumed by other upcoming features like
debugfs, PDR support etc.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc/fastrpc_main.c   | 136 +---------------------
 drivers/misc/fastrpc/fastrpc_shared.h | 155 ++++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 135 deletions(-)
 create mode 100644 drivers/misc/fastrpc/fastrpc_shared.h

diff --git a/drivers/misc/fastrpc/fastrpc_main.c b/drivers/misc/fastrpc/fastrpc_main.c
index 74181b8c386b..3163b4159de7 100644
--- a/drivers/misc/fastrpc/fastrpc_main.c
+++ b/drivers/misc/fastrpc/fastrpc_main.c
@@ -22,6 +22,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
+#include "fastrpc_shared.h"
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -29,8 +30,6 @@
 #define CDSP_DOMAIN_ID (3)
 #define CDSP1_DOMAIN_ID (4)
 #define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
-#define FASTRPC_MAX_SESSIONS	14
-#define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
 #define FASTRPC_MAX_CRCLIST	64
@@ -55,9 +54,6 @@
 #define ADSP_MMAP_ADD_PAGES_LLC 0x3000,
 
 #define DSP_UNSUPPORTED_API (0x80000414)
-/* MAX NUMBER of DSP ATTRIBUTES SUPPORTED */
-#define FASTRPC_MAX_DSP_ATTRIBUTES (256)
-#define FASTRPC_MAX_DSP_ATTRIBUTES_LEN (sizeof(u32) * FASTRPC_MAX_DSP_ATTRIBUTES)
 
 /* Retrives number of input buffers from the scalars parameter */
 #define REMOTE_SCALARS_INBUFS(sc)	(((sc) >> 16) & 0x0ff)
@@ -118,22 +114,6 @@ struct fastrpc_invoke_buf {
 	u32 pgidx;		/* index to start of contiguous region */
 };
 
-struct fastrpc_remote_dmahandle {
-	s32 fd;		/* dma handle fd */
-	u32 offset;	/* dma handle offset */
-	u32 len;	/* dma handle length */
-};
-
-struct fastrpc_remote_buf {
-	u64 pv;		/* buffer pointer */
-	u64 len;	/* length of buffer */
-};
-
-union fastrpc_remote_arg {
-	struct fastrpc_remote_buf buf;
-	struct fastrpc_remote_dmahandle dma;
-};
-
 struct fastrpc_mmap_rsp_msg {
 	u64 vaddr;
 };
@@ -168,16 +148,6 @@ struct fastrpc_mem_unmap_req_msg {
 	u64 len;
 };
 
-struct fastrpc_msg {
-	int pid;		/* process group id */
-	int tid;		/* thread id */
-	u64 ctx;		/* invoke caller context */
-	u32 handle;	/* handle to invoke */
-	u32 sc;		/* scalars structure describing the data */
-	u64 addr;		/* physical address */
-	u64 size;		/* size of contiguous region */
-};
-
 struct fastrpc_invoke_rsp {
 	u64 ctx;		/* invoke caller context */
 	int retval;		/* invoke return value */
@@ -192,122 +162,18 @@ struct fastrpc_buf_overlap {
 	u64 offset;
 };
 
-struct fastrpc_buf {
-	struct fastrpc_user *fl;
-	struct dma_buf *dmabuf;
-	struct device *dev;
-	void *virt;
-	u64 phys;
-	u64 size;
-	/* Lock for dma buf attachments */
-	struct mutex lock;
-	struct list_head attachments;
-	/* mmap support */
-	struct list_head node; /* list of user requested mmaps */
-	uintptr_t raddr;
-};
-
 struct fastrpc_dma_buf_attachment {
 	struct device *dev;
 	struct sg_table sgt;
 	struct list_head node;
 };
 
-struct fastrpc_map {
-	struct list_head node;
-	struct fastrpc_user *fl;
-	int fd;
-	struct dma_buf *buf;
-	struct sg_table *table;
-	struct dma_buf_attachment *attach;
-	u64 phys;
-	u64 size;
-	void *va;
-	u64 len;
-	u64 raddr;
-	u32 attr;
-	struct kref refcount;
-};
-
-struct fastrpc_invoke_ctx {
-	int nscalars;
-	int nbufs;
-	int retval;
-	int pid;
-	int tgid;
-	u32 sc;
-	u32 *crc;
-	u64 ctxid;
-	u64 msg_sz;
-	struct kref refcount;
-	struct list_head node; /* list of ctxs */
-	struct completion work;
-	struct work_struct put_work;
-	struct fastrpc_msg msg;
-	struct fastrpc_user *fl;
-	union fastrpc_remote_arg *rpra;
-	struct fastrpc_map **maps;
-	struct fastrpc_buf *buf;
-	struct fastrpc_invoke_args *args;
-	struct fastrpc_buf_overlap *olaps;
-	struct fastrpc_channel_ctx *cctx;
-};
-
-struct fastrpc_session_ctx {
-	struct device *dev;
-	int sid;
-	bool used;
-	bool valid;
-};
-
-struct fastrpc_channel_ctx {
-	int domain_id;
-	int sesscount;
-	int vmcount;
-	struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
-	struct rpmsg_device *rpdev;
-	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
-	spinlock_t lock;
-	struct idr ctx_idr;
-	struct list_head users;
-	struct kref refcount;
-	/* Flag if dsp attributes are cached */
-	bool valid_attributes;
-	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
-	struct fastrpc_device *secure_fdevice;
-	struct fastrpc_device *fdevice;
-	struct fastrpc_buf *remote_heap;
-	struct list_head invoke_interrupted_mmaps;
-	bool secure;
-	bool unsigned_support;
-	u64 dma_mask;
-};
-
 struct fastrpc_device {
 	struct fastrpc_channel_ctx *cctx;
 	struct miscdevice miscdev;
 	bool secure;
 };
 
-struct fastrpc_user {
-	struct list_head user;
-	struct list_head maps;
-	struct list_head pending;
-	struct list_head mmaps;
-
-	struct fastrpc_channel_ctx *cctx;
-	struct fastrpc_session_ctx *sctx;
-	struct fastrpc_buf *init_mem;
-
-	int tgid;
-	int pd;
-	bool is_secure_dev;
-	/* Lock for lists */
-	spinlock_t lock;
-	/* lock for allocations */
-	struct mutex mutex;
-};
-
 static void fastrpc_free_map(struct kref *ref)
 {
 	struct fastrpc_map *map;
diff --git a/drivers/misc/fastrpc/fastrpc_shared.h b/drivers/misc/fastrpc/fastrpc_shared.h
new file mode 100644
index 000000000000..8f1f1320a4c2
--- /dev/null
+++ b/drivers/misc/fastrpc/fastrpc_shared.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2024 Qualcomm Innovation Center.
+#ifndef FASTRPC_SHARED_H
+#define FASTRPC_SHARED_H
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/idr.h>
+#include <linux/list.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+
+#define FASTRPC_MAX_SESSIONS	14
+#define FASTRPC_MAX_VMIDS	16
+/* MAX NUMBER of DSP ATTRIBUTES SUPPORTED */
+#define FASTRPC_MAX_DSP_ATTRIBUTES (256)
+#define FASTRPC_MAX_DSP_ATTRIBUTES_LEN (sizeof(u32) * FASTRPC_MAX_DSP_ATTRIBUTES)
+
+struct fastrpc_remote_dmahandle {
+	s32 fd;		/* dma handle fd */
+	u32 offset;	/* dma handle offset */
+	u32 len;	/* dma handle length */
+};
+
+struct fastrpc_remote_buf {
+	u64 pv;		/* buffer pointer */
+	u64 len;	/* length of buffer */
+};
+
+union fastrpc_remote_arg {
+	struct fastrpc_remote_buf buf;
+	struct fastrpc_remote_dmahandle dma;
+};
+
+struct fastrpc_buf {
+	struct fastrpc_user *fl;
+	struct dma_buf *dmabuf;
+	struct device *dev;
+	void *virt;
+	u64 phys;
+	u64 size;
+	/* Lock for dma buf attachments */
+	struct mutex lock;
+	struct list_head attachments;
+	/* mmap support */
+	struct list_head node; /* list of user requested mmaps */
+	uintptr_t raddr;
+};
+
+struct fastrpc_map {
+	struct list_head node;
+	struct fastrpc_user *fl;
+	int fd;
+	struct dma_buf *buf;
+	struct sg_table *table;
+	struct dma_buf_attachment *attach;
+	u64 phys;
+	u64 size;
+	void *va;
+	u64 len;
+	u64 raddr;
+	u32 attr;
+	struct kref refcount;
+};
+
+struct fastrpc_msg {
+	int pid;		/* process group id */
+	int tid;		/* thread id */
+	u64 ctx;		/* invoke caller context */
+	u32 handle;	/* handle to invoke */
+	u32 sc;		/* scalars structure describing the data */
+	u64 addr;		/* physical address */
+	u64 size;		/* size of contiguous region */
+};
+
+struct fastrpc_invoke_ctx {
+	int nscalars;
+	int nbufs;
+	int retval;
+	int pid;
+	int tgid;
+	u32 sc;
+	u32 *crc;
+	u64 ctxid;
+	u64 msg_sz;
+	struct kref refcount;
+	struct list_head node; /* list of ctxs */
+	struct completion work;
+	struct work_struct put_work;
+	struct fastrpc_msg msg;
+	struct fastrpc_user *fl;
+	union fastrpc_remote_arg *rpra;
+	struct fastrpc_map **maps;
+	struct fastrpc_buf *buf;
+	struct fastrpc_invoke_args *args;
+	struct fastrpc_buf_overlap *olaps;
+	struct fastrpc_channel_ctx *cctx;
+};
+
+struct fastrpc_session_ctx {
+	struct device *dev;
+	int sid;
+	bool used;
+	bool valid;
+};
+
+struct fastrpc_channel_ctx {
+	int domain_id;
+	int sesscount;
+	int vmcount;
+	struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
+	struct rpmsg_device *rpdev;
+	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
+	spinlock_t lock;
+	struct idr ctx_idr;
+	struct list_head users;
+	struct kref refcount;
+	/* Flag if dsp attributes are cached */
+	bool valid_attributes;
+	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
+	struct fastrpc_device *secure_fdevice;
+	struct fastrpc_device *fdevice;
+	struct fastrpc_buf *remote_heap;
+	struct list_head invoke_interrupted_mmaps;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs_dir;
+#endif
+	bool secure;
+	bool unsigned_support;
+	u64 dma_mask;
+};
+
+struct fastrpc_user {
+	struct list_head user;
+	struct list_head maps;
+	struct list_head pending;
+	struct list_head mmaps;
+
+	struct fastrpc_channel_ctx *cctx;
+	struct fastrpc_session_ctx *sctx;
+	struct fastrpc_buf *init_mem;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs_file;
+#endif
+
+	int tgid;
+	int pd;
+	bool is_secure_dev;
+	/* Lock for lists */
+	spinlock_t lock;
+	/* lock for allocations */
+	struct mutex mutex;
+};
+
+#endif /* FASTRPC_SHARED_H */
-- 
2.34.1

