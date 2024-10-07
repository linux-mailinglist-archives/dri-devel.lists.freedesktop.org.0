Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A26992766
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 10:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0415810E321;
	Mon,  7 Oct 2024 08:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WnIWLH/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB8410E320
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 08:45:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974Sr8g032224;
 Mon, 7 Oct 2024 08:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d/xYOlAfHq811yxJ/AL8jc7fZL4S8qi38cwZvN2sd8c=; b=WnIWLH/BsLAF0/gm
 FJWLPObfKoXjPVuPwBqLK35CmESDlIhc95B4p4EiVlneNzcEIm41eOBAndWBVqlL
 mIVivOwxfbWuw+Qy4T00FfMg3nYg55CqKuf7Tm5nZGlBWP29LfepvkIzgY92ZHQx
 8grAY7sq9Lc69TrKTgwcr++Z9XMemahsgRZXBN1s8LyUsEWf1Xkvqg4A9Y682LPh
 SXhc13F+/Tgb35VRX7zJr/0Fk1vaN8bTJnWOKnmS3rCTg/yoi4PGZ9ItzlDUOFoP
 ZIZQueXxz2RdMWzGEoXBwfqFyg5I15K3O98y9gzx0wzVwMCMQ4CNZRzVUj1CMusl
 rUJm2Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv8bff5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 08:45:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4978jZwd024819
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Oct 2024 08:45:35 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 01:45:33 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 2/4] misc: fastrpc: Capture kernel and DSP performance
 counters
Date: Mon, 7 Oct 2024 14:15:16 +0530
Message-ID: <20241007084518.3649876-3-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Jf1M4Vl6VdJJcwp8A4AG2xfEFZWbs8jX
X-Proofpoint-GUID: Jf1M4Vl6VdJJcwp8A4AG2xfEFZWbs8jX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410070061
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

Add support to capture kernel performance counters for different
kernel level operations. These counters collects the information
for remote call and copies the information to a buffer shared
by user.

Collection of DSP performance counters is also added as part of
this change. DSP updates the performance information in the
metadata which is then copied to a buffer passed by the users.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c      | 143 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |   4 +-
 2 files changed, 139 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 8e817a763d1d..54a562fc94fb 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -19,6 +19,7 @@
 #include <linux/rpmsg.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
@@ -38,6 +39,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
+#define FASTRPC_MAX_STATIC_HANDLE (20)
 #define FASTRPC_CTXID_MASK (0xFF0)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
@@ -106,6 +108,9 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+#define FASTRPC_KERNEL_PERF_LIST (PERF_KEY_MAX)
+#define FASTRPC_DSP_PERF_LIST 12
+
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
 						"sdsp", "cdsp", "cdsp1" };
 struct fastrpc_phy_page {
@@ -229,6 +234,18 @@ struct fastrpc_map {
 	struct kref refcount;
 };
 
+struct fastrpc_perf {
+	u64 count;
+	u64 flush;
+	u64 map;
+	u64 copy;
+	u64 link;
+	u64 getargs;
+	u64 putargs;
+	u64 invargs;
+	u64 invoke;
+};
+
 struct fastrpc_invoke_ctx {
 	int nscalars;
 	int nbufs;
@@ -237,6 +254,8 @@ struct fastrpc_invoke_ctx {
 	int tgid;
 	u32 sc;
 	u32 *crc;
+	u64 *perf_kernel;
+	u64 *perf_dsp;
 	u64 ctxid;
 	u64 msg_sz;
 	struct kref refcount;
@@ -251,6 +270,7 @@ struct fastrpc_invoke_ctx {
 	struct fastrpc_invoke_args *args;
 	struct fastrpc_buf_overlap *olaps;
 	struct fastrpc_channel_ctx *cctx;
+	struct fastrpc_perf *perf;
 };
 
 struct fastrpc_session_ctx {
@@ -308,6 +328,51 @@ struct fastrpc_user {
 	struct mutex mutex;
 };
 
+enum fastrpc_perfkeys {
+	PERF_COUNT = 0,
+	PERF_FLUSH = 1,
+	PERF_MAP = 2,
+	PERF_COPY = 3,
+	PERF_LINK = 4,
+	PERF_GETARGS = 5,
+	PERF_PUTARGS = 6,
+	PERF_INVARGS = 7,
+	PERF_INVOKE = 8,
+	PERF_KEY_MAX = 9,
+};
+
+#define PERF_END ((void)0)
+
+#define PERF(enb, cnt, ff) \
+	{\
+		struct timespec64 startT = {0};\
+		u64 *counter = cnt;\
+		if (enb && counter) {\
+			ktime_get_boottime_ts64(&startT);\
+		} \
+		ff ;\
+		if (enb && counter) {\
+			*counter += getnstimediff(&startT);\
+		} \
+	}
+
+#define GET_COUNTER(perf_ptr, offset)  \
+	(perf_ptr != NULL ?\
+		(((offset >= 0) && (offset < PERF_KEY_MAX)) ?\
+			(u64 *)(perf_ptr + offset)\
+				: (u64 *)NULL) : (u64 *)NULL)
+
+static inline s64 getnstimediff(struct timespec64 *start)
+{
+	s64 ns;
+	struct timespec64 ts, b;
+
+	ktime_get_boottime_ts64(&ts);
+	b = timespec64_sub(ts, *start);
+	ns = timespec64_to_ns(&b);
+	return ns;
+}
+
 static void fastrpc_free_map(struct kref *ref)
 {
 	struct fastrpc_map *map;
@@ -497,6 +562,7 @@ static void fastrpc_context_free(struct kref *ref)
 	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
+	kfree(ctx->perf);
 	kfree(ctx->maps);
 	kfree(ctx->olaps);
 	kfree(ctx);
@@ -614,6 +680,13 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	fastrpc_channel_ctx_get(cctx);
 
 	ctx->crc = (u32 *)(uintptr_t)inv2->crc;
+	ctx->perf_dsp = (u64 *)(uintptr_t)inv2->perf_dsp;
+	ctx->perf_kernel = (u64 *)(uintptr_t)inv2->perf_kernel;
+	if (ctx->perf_kernel) {
+		ctx->perf = kzalloc(sizeof(*(ctx->perf)), GFP_KERNEL);
+		if (!ctx->perf)
+			return ERR_PTR(-ENOMEM);
+	}
 	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
@@ -877,7 +950,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32) + sizeof(u64) * FASTRPC_DSP_PERF_LIST;
 
 	return size;
 }
@@ -951,7 +1025,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	metalen = fastrpc_get_meta_size(ctx);
 	pkt_size = fastrpc_get_payload_size(ctx, metalen);
 
+	PERF(ctx->perf_kernel, GET_COUNTER((u64 *)ctx->perf, PERF_MAP),
 	err = fastrpc_create_maps(ctx);
+	PERF_END);
 	if (err)
 		return err;
 
@@ -987,6 +1063,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			continue;
 
 		if (ctx->maps[i]) {
+			PERF(ctx->perf_kernel, GET_COUNTER((u64 *)ctx->perf, PERF_MAP),
 			struct vm_area_struct *vma = NULL;
 
 			rpra[i].buf.pv = (u64) ctx->args[i].ptr;
@@ -1003,9 +1080,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			pg_end = ((ctx->args[i].ptr + len - 1) & PAGE_MASK) >>
 				  PAGE_SHIFT;
 			pages[i].size = (pg_end - pg_start + 1) * PAGE_SIZE;
-
+			PERF_END);
 		} else {
-
+			PERF(ctx->perf_kernel, GET_COUNTER((u64 *)ctx->perf, PERF_COPY),
 			if (ctx->olaps[oix].offset == 0) {
 				rlen -= ALIGN(args, FASTRPC_ALIGN) - args;
 				args = ALIGN(args, FASTRPC_ALIGN);
@@ -1027,12 +1104,14 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			pages[i].size = (pg_end - pg_start + 1) * PAGE_SIZE;
 			args = args + mlen;
 			rlen -= mlen;
+			PERF_END);
 		}
 
 		if (i < inbufs && !ctx->maps[i]) {
 			void *dst = (void *)(uintptr_t)rpra[i].buf.pv;
 			void *src = (void *)(uintptr_t)ctx->args[i].ptr;
 
+			PERF(ctx->perf_kernel, GET_COUNTER((u64 *)ctx->perf, PERF_COPY),
 			if (!kernel) {
 				if (copy_from_user(dst, (void __user *)src,
 						   len)) {
@@ -1042,6 +1121,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			} else {
 				memcpy(dst, src, len);
 			}
+			PERF_END);
 		}
 	}
 
@@ -1072,9 +1152,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	struct fastrpc_map *mmap = NULL;
 	struct fastrpc_invoke_buf *list;
 	struct fastrpc_phy_page *pages;
-	u64 *fdlist;
-	u32 *crclist;
-	int i, inbufs, outbufs, handles;
+	u64 *fdlist, *perf_dsp_list;
+	u32 *crclist, *poll;
+	int i, inbufs, outbufs, handles, perferr;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
 	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
@@ -1083,6 +1163,8 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
 	crclist = (u32 *)(fdlist + FASTRPC_MAX_FDLIST);
+	poll = (u32 *)(crclist + FASTRPC_MAX_CRCLIST);
+	perf_dsp_list = (u64 *)(poll + 1);
 
 	for (i = inbufs; i < ctx->nbufs; ++i) {
 		if (!ctx->maps[i]) {
@@ -1113,6 +1195,14 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 			return -EFAULT;
 	}
 
+	if (ctx->perf_dsp && perf_dsp_list) {
+		perferr = copy_to_user((void __user *)ctx->perf_dsp,
+				      perf_dsp_list,
+				      FASTRPC_DSP_PERF_LIST * sizeof(u64));
+		if (perferr)
+			dev_dbg(fl->sctx->dev, "Warning: failed to copy perf data %d\n", perferr);
+	}
+
 	return 0;
 }
 
@@ -1148,13 +1238,35 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 }
 
+static void fastrpc_update_invoke_count(u32 handle, u64 *perf_counter,
+					struct timespec64 *invoket)
+{
+	/* update invoke count for dynamic handles */
+	u64 *invcount, *count;
+
+	if (handle <= FASTRPC_MAX_STATIC_HANDLE)
+		return;
+
+	invcount = GET_COUNTER(perf_counter, PERF_INVOKE);
+	if (invcount)
+		*invcount += getnstimediff(invoket);
+
+	count = GET_COUNTER(perf_counter, PERF_COUNT);
+	if (count)
+		*count++;
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct fastrpc_invoke_v2 *inv2)
 {
 	struct fastrpc_invoke_ctx *ctx = NULL;
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_invoke inv;
 	u32 handle, sc;
-	int err = 0;
+	int err = 0, perferr = 0;
+	struct timespec64 invoket = {0};
+
+	if (inv2->perf_kernel)
+		ktime_get_boottime_ts64(&invoket);
 
 	if (!fl->sctx)
 		return -EINVAL;
@@ -1174,14 +1286,18 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 
+	PERF(ctx->perf_kernel, GET_COUNTER((u64 *)ctx->perf, PERF_GETARGS),
 	err = fastrpc_get_args(kernel, ctx);
+	PERF_END);
 	if (err)
 		goto bail;
 
 	/* make sure that all CPU memory writes are seen by DSP */
 	dma_wmb();
+	PERF(ctx->perf_kernel, GET_COUNTER((u64 *)ctx->perf, PERF_LINK),
 	/* Send invoke buffer to remote dsp */
 	err = fastrpc_invoke_send(fl->sctx, ctx, kernel, handle);
+	PERF_END);
 	if (err)
 		goto bail;
 
@@ -1197,8 +1313,10 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct
 
 	/* make sure that all memory writes by DSP are seen by CPU */
 	dma_rmb();
+	PERF(ctx->perf_kernel, GET_COUNTER((u64 *)ctx->perf, PERF_PUTARGS),
 	/* populate all the output buffers with results */
 	err = fastrpc_put_args(ctx, kernel);
+	PERF_END);
 	if (err)
 		goto bail;
 
@@ -1209,6 +1327,17 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct
 
 bail:
 	if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
+		if (ctx) {
+			if (ctx->perf_kernel && !err)
+				fastrpc_update_invoke_count(handle, (u64 *)ctx->perf, &invoket);
+			if (ctx->perf_kernel && ctx->perf && ctx->perf_kernel) {
+				perferr = copy_to_user((void __user *)ctx->perf_kernel,
+							ctx->perf,
+							FASTRPC_KERNEL_PERF_LIST * sizeof(u64));
+				if (perferr)
+					dev_dbg(fl->sctx->dev, "Warning: failed to copy perf data %d\n", perferr);
+			}
+		}
 		/* We are done with this compute context */
 		spin_lock(&fl->lock);
 		list_del(&ctx->node);
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index 406b80555d41..1edc7c04b171 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -84,7 +84,9 @@ struct fastrpc_invoke {
 struct fastrpc_invoke_v2 {
 	struct fastrpc_invoke inv;
 	__u64 crc;
-	__u32 reserved[16];
+	__u64 perf_kernel;
+	__u64 perf_dsp;
+	__u32 reserved[12];
 };
 
 struct fastrpc_init_create {
-- 
2.34.1

