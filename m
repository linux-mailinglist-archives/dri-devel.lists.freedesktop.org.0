Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3479D0B13
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E24710E447;
	Mon, 18 Nov 2024 08:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Zb1tv4x7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49A410E457
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 08:41:13 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5Rlxc029827;
 Mon, 18 Nov 2024 08:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xy5PIP3I7fbqbc+XP6ixF3R71g+nuJKoFcx8cA/dNAE=; b=Zb1tv4x7nC6E630U
 LfHn3SvX/3tVFpcOeMrOS54xoMpZSMTwMAzV98S17gp5/pekQrINTKD3cgxU4vdG
 9fuMAIfpL3Jv4/p2liWoJILQnzRQhPMtfPbJ8OQv8b/fryBqLhLnx1dTq7q3SkCP
 EYmd0wt5rqFgGI3G81RSZRBykjHJjSpO8DLAfG55rNgAPBUB0Ysyqzgg/tQbTHgf
 gOGFASsLE/p+SiYO/9rY3WW9cHzst9a4SzYnNF6O+tSYwF2p4angkmfDnT2QFlN7
 50YPgtNbB/UF7sxkME+Ep6AbC5SB+oPW4NI8V2N6rbM90N1c72hN9QoBO4nm9Nqp
 oe63Kg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkv3bvg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 08:41:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI8f9ki015416
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 08:41:09 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 00:41:06 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Date: Mon, 18 Nov 2024 14:10:46 +0530
Message-ID: <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: G5kKoCpMDsdr67yZAxIdkZ0su9jWNC0E
X-Proofpoint-GUID: G5kKoCpMDsdr67yZAxIdkZ0su9jWNC0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
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

Add changes to support debugfs. The fastrpc directory will be
created which will carry debugfs files for all fastrpc processes.
The information of fastrpc user and channel contexts are getting
captured as part of this change.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc/Makefile        |   3 +-
 drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
 drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
 drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
 4 files changed, 205 insertions(+), 3 deletions(-)
 create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
 create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h

diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
index 020d30789a80..4ff6b64166ae 100644
--- a/drivers/misc/fastrpc/Makefile
+++ b/drivers/misc/fastrpc/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
-fastrpc-objs	:= fastrpc_main.o
\ No newline at end of file
+fastrpc-objs	:= fastrpc_main.o \
+		fastrpc_debug.o
diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
new file mode 100644
index 000000000000..cdb4fc6845a8
--- /dev/null
+++ b/drivers/misc/fastrpc/fastrpc_debug.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2024 Qualcomm Innovation Center.
+
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include "fastrpc_shared.h"
+#include "fastrpc_debug.h"
+
+#ifdef CONFIG_DEBUG_FS
+
+static void print_buf_info(struct seq_file *s_file, struct fastrpc_buf *buf)
+{
+	seq_printf(s_file, "\n %s %2s 0x%p", "virt", ":", buf->virt);
+	seq_printf(s_file, "\n %s %2s 0x%llx", "phys", ":", buf->phys);
+	seq_printf(s_file, "\n %s %2s 0x%lx", "raddr", ":", buf->raddr);
+	seq_printf(s_file, "\n %s %2s 0x%llx", "size", ":", buf->size);
+}
+
+static void print_ctx_info(struct seq_file *s_file, struct fastrpc_invoke_ctx *ctx)
+{
+	seq_printf(s_file, "\n %s %7s %d", "nscalars", ":", ctx->nscalars);
+	seq_printf(s_file, "\n %s %10s %d", "nbufs", ":", ctx->nbufs);
+	seq_printf(s_file, "\n %s %10s %d", "retval", ":", ctx->retval);
+	seq_printf(s_file, "\n %s %12s %p", "crc", ":", ctx->crc);
+	seq_printf(s_file, "\n %s %12s %d", "pid", ":", ctx->pid);
+	seq_printf(s_file, "\n %s %11s %d", "tgid", ":", ctx->tgid);
+	seq_printf(s_file, "\n %s %13s 0x%x", "sc", ":", ctx->sc);
+	seq_printf(s_file, "\n %s %10s %llu", "ctxid", ":", ctx->ctxid);
+	seq_printf(s_file, "\n %s %9s %llu", "msg_sz", ":", ctx->msg_sz);
+}
+
+static void print_sctx_info(struct seq_file *s_file, struct fastrpc_session_ctx *sctx)
+{
+	seq_printf(s_file, "%s %13s %d\n", "sid", ":", sctx->sid);
+	seq_printf(s_file, "%s %12s %d\n", "used", ":", sctx->used);
+	seq_printf(s_file, "%s %11s %d\n", "valid", ":", sctx->valid);
+}
+
+static void print_cctx_info(struct seq_file *s_file, struct fastrpc_channel_ctx *cctx)
+{
+	seq_printf(s_file, "%s %8s %d\n", "domain_id", ":", cctx->domain_id);
+	seq_printf(s_file, "%s %8s %d\n", "sesscount", ":", cctx->sesscount);
+	seq_printf(s_file, "%s %10s %d\n", "vmcount", ":", cctx->vmcount);
+	seq_printf(s_file, "%s %s %d\n", "valid_attributes", ":", cctx->valid_attributes);
+	seq_printf(s_file, "%s %11s %d\n", "secure", ":", cctx->secure);
+	seq_printf(s_file, "%s %s %d\n", "unsigned_support", ":", cctx->unsigned_support);
+}
+
+static void print_map_info(struct seq_file *s_file, struct fastrpc_map *map)
+{
+	seq_printf(s_file, "%s %4s %d\n", "fd", ":", map->fd);
+	seq_printf(s_file, "%s %s 0x%llx\n", "phys", ":", map->phys);
+	seq_printf(s_file, "%s %s 0x%llx\n", "size", ":", map->size);
+	seq_printf(s_file, "%s %4s 0x%p\n", "va", ":", map->va);
+	seq_printf(s_file, "%s %3s 0x%llx\n", "len", ":", map->len);
+	seq_printf(s_file, "%s %2s 0x%llx\n", "raddr", ":", map->raddr);
+	seq_printf(s_file, "%s %2s 0x%x\n", "attr", ":", map->attr);
+}
+
+static int fastrpc_debugfs_show(struct seq_file *s_file, void *data)
+{
+	struct fastrpc_user *fl = s_file->private;
+	struct fastrpc_map *map;
+	struct fastrpc_channel_ctx *cctx;
+	struct fastrpc_session_ctx *sctx = NULL;
+	struct fastrpc_invoke_ctx *ctx, *m;
+	struct fastrpc_buf *buf;
+
+	if (fl != NULL) {
+		seq_printf(s_file, "%s %12s %d\n", "tgid", ":", fl->tgid);
+		seq_printf(s_file, "%s %3s %d\n", "is_secure_dev", ":", fl->is_secure_dev);
+		seq_printf(s_file, "%s %9s %d\n", "pd_type", ":", fl->pd);
+
+		if (fl->cctx) {
+			seq_puts(s_file, "\n=============== Channel Context ===============\n");
+			cctx = fl->cctx;
+			print_cctx_info(s_file, cctx);
+		}
+		if (fl->sctx) {
+			seq_puts(s_file, "\n=============== Session Context ===============\n");
+			sctx = fl->sctx;
+			print_sctx_info(s_file, sctx);
+		}
+		spin_lock(&fl->lock);
+		if (fl->init_mem) {
+			seq_puts(s_file, "\n=============== Init Mem ===============\n");
+			buf = fl->init_mem;
+			print_buf_info(s_file, buf);
+		}
+		spin_unlock(&fl->lock);
+		seq_puts(s_file, "\n=============== User space maps ===============\n");
+		spin_lock(&fl->lock);
+		list_for_each_entry(map, &fl->maps, node) {
+			if (map)
+				print_map_info(s_file, map);
+		}
+		seq_puts(s_file, "\n=============== Kernel allocated buffers ===============\n");
+		list_for_each_entry(map, &fl->mmaps, node) {
+			if (map)
+				print_map_info(s_file, map);
+		}
+		seq_puts(s_file, "\n=============== Pending contexts ===============\n");
+		list_for_each_entry_safe(ctx, m, &fl->pending, node) {
+			if (ctx)
+				print_ctx_info(s_file, ctx);
+		}
+		spin_unlock(&fl->lock);
+	}
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(fastrpc_debugfs);
+
+void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
+{
+	char cur_comm[TASK_COMM_LEN];
+	int domain_id, size;
+	char *debugfs_buf;
+	struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
+
+	memcpy(cur_comm, current->comm, TASK_COMM_LEN);
+	cur_comm[TASK_COMM_LEN-1] = '\0';
+	if (debugfs_dir != NULL) {
+		domain_id = fl->cctx->domain_id;
+		size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
+				current->pid, fl->tgid, domain_id) + 1;
+		debugfs_buf = kzalloc(size, GFP_KERNEL);
+		if (debugfs_buf == NULL)
+			return;
+		/*
+		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
+		 * domain_id in debugfs filename to create unique file name
+		 */
+		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
+			cur_comm, current->pid, fl->tgid, domain_id);
+		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
+				debugfs_dir, fl, &fastrpc_debugfs_fops);
+		kfree(debugfs_buf);
+	}
+}
+
+void fastrpc_remove_user_debugfs(struct fastrpc_user *fl)
+{
+	debugfs_remove(fl->debugfs_file);
+}
+
+struct dentry *fastrpc_create_debugfs_dir(const char *name)
+{
+	return debugfs_create_dir(name, NULL);
+}
+
+void fastrpc_remove_debugfs_dir(struct dentry *cctx_debugfs)
+{
+	debugfs_remove_recursive(cctx_debugfs);
+}
+#endif
diff --git a/drivers/misc/fastrpc/fastrpc_debug.h b/drivers/misc/fastrpc/fastrpc_debug.h
new file mode 100644
index 000000000000..916a5c668308
--- /dev/null
+++ b/drivers/misc/fastrpc/fastrpc_debug.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2024 Qualcomm Innovation Center.
+#ifndef FASTRPC_DEBUG_H
+#define FASTRPC_DEBUG_H
+
+#include <linux/debugfs.h>
+#include "fastrpc_shared.h"
+#include "fastrpc_debug.h"
+
+#define DEBUGFS_DIRLEN	16
+#ifdef CONFIG_DEBUG_FS
+void fastrpc_create_user_debugfs(struct fastrpc_user *fl);
+void fastrpc_remove_user_debugfs(struct fastrpc_user *fl);
+struct dentry *fastrpc_create_debugfs_dir(const char *name);
+void fastrpc_remove_debugfs_dir(struct dentry *cctx_debugfs);
+#else
+static inline void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
+{
+}
+static inline void fastrpc_remove_user_debugfs(struct fastrpc_user *fl)
+{
+}
+static inline struct dentry *fastrpc_create_debugfs_dir(const char *name)
+{
+	return NULL;
+}
+static inline void fastrpc_remove_debugfs_dir(struct dentry *cctx_debugfs)
+{
+}
+#endif	/* CONFIG_DEBUG_FS */
+#endif	/* FASTRPC_DEBUG_H */
diff --git a/drivers/misc/fastrpc/fastrpc_main.c b/drivers/misc/fastrpc/fastrpc_main.c
index 3163b4159de7..f758af1d2f8e 100644
--- a/drivers/misc/fastrpc/fastrpc_main.c
+++ b/drivers/misc/fastrpc/fastrpc_main.c
@@ -23,6 +23,7 @@
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
 #include "fastrpc_shared.h"
+#include "fastrpc_debug.h"
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -1185,6 +1186,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 				      sc, args);
 	if (err)
 		goto err_invoke;
+	fastrpc_create_user_debugfs(fl);
 
 	kfree(args);
 	kfree(name);
@@ -1318,6 +1320,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 				      sc, args);
 	if (err)
 		goto err_invoke;
+	fastrpc_create_user_debugfs(fl);
 
 	kfree(args);
 
@@ -1412,6 +1415,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	}
 
 	fastrpc_session_free(cctx, fl->sctx);
+	fastrpc_remove_user_debugfs(fl);
 	fastrpc_channel_ctx_put(cctx);
 
 	mutex_destroy(&fl->mutex);
@@ -1513,7 +1517,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 {
 	struct fastrpc_invoke_args args[1];
-	int tgid = fl->tgid;
+	int err, tgid = fl->tgid;
 	u32 sc;
 
 	args[0].ptr = (u64)(uintptr_t) &tgid;
@@ -1522,8 +1526,13 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
 	fl->pd = pd;
 
-	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
 				       sc, &args[0]);
+	if (err)
+		return err;
+	fastrpc_create_user_debugfs(fl);
+
+	return 0;
 }
 
 static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
@@ -2125,6 +2134,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	struct fastrpc_channel_ctx *data;
 	int i, err, domain_id = -1, vmcount;
 	const char *domain;
+	char dir_name[DEBUGFS_DIRLEN];
 	bool secure_dsp;
 	struct device_node *rmem_node;
 	struct reserved_mem *rmem;
@@ -2228,6 +2238,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	idr_init(&data->ctx_idr);
 	data->domain_id = domain_id;
 	data->rpdev = rpdev;
+	snprintf(dir_name, sizeof(dir_name), "%s_%s", "fastrpc", domain);
+	data->debugfs_dir = fastrpc_create_debugfs_dir(dir_name);
 
 	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
 	if (err)
@@ -2284,6 +2296,8 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->remote_heap)
 		fastrpc_buf_free(cctx->remote_heap);
 
+	fastrpc_remove_debugfs_dir(cctx->debugfs_dir);
+
 	of_platform_depopulate(&rpdev->dev);
 
 	fastrpc_channel_ctx_put(cctx);
-- 
2.34.1

