Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E23699276A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 10:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3005C10E323;
	Mon,  7 Oct 2024 08:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Arln9c0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0E010E323
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 08:45:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974TfF0021858;
 Mon, 7 Oct 2024 08:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iiGu/T4YMqs9vu7zT6kk9SjYjwUUm6sCok1Z5LDxw9s=; b=Arln9c0RSPiHsmI5
 SDAhItocFrrTWqOM1++5O50zknnBN0sWleYW4HCYLmkk26997xxmwDOc8T9WmkQL
 +XoB1XcAKCX4flOH3LyabaDf4E2O8SC+lQqwsXNvrYEMs22OmsAhpQ26cacZSEDG
 4XnZwBVLi/Owszui56G/TxCmBEY5/pyrYoyREYxZXSEhuwnUFfjbGbOEXER2AbKx
 Fk/WLKwnxUHpKSjIgQjBUOiRRIPPUbHzEzMcRE4ihOeWa4mNcJF7MIyzTHQ0tkGz
 RmZJpbyETJQJOBsgQvMYxw72mhXsJ+f1bmoeaBtuZBnSBeLjHqNxj0WJiphnBfdH
 nqHCaA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xr5kgjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 08:45:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4978jfCQ010040
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Oct 2024 08:45:41 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 01:45:39 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 4/4] misc: fastrpc: Add polling mode support for fastRPC
 driver
Date: Mon, 7 Oct 2024 14:15:18 +0530
Message-ID: <20241007084518.3649876-5-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: 6JLd1kRHvyREZ8gnek10FIlMq_Qsjmsf
X-Proofpoint-ORIG-GUID: 6JLd1kRHvyREZ8gnek10FIlMq_Qsjmsf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070061
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

For any remote call to DSP, after sending an invocation message,
fastRPC driver waits for glink response and during this time the
CPU can go into low power modes. Adding a polling mode support
with which fastRPC driver will poll continuously on a memory
after sending a message to remote subsystem which will eliminate
CPU wakeup and scheduling latencies and reduce fastRPC overhead.
With this change, DSP always sends a glink response which will
get ignored if polling mode didn't time out.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c      | 127 +++++++++++++++++++++++++++++++++---
 include/uapi/misc/fastrpc.h |   3 +-
 2 files changed, 121 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c008fcd95e15..a25673c22db8 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -111,6 +111,19 @@
 #define FASTRPC_KERNEL_PERF_LIST (PERF_KEY_MAX)
 #define FASTRPC_DSP_PERF_LIST 12
 
+/* Poll response number from remote processor for call completion */
+#define FASTRPC_POLL_RESPONSE (0xdecaf)
+/* timeout in us for polling until memory barrier */
+#define FASTRPC_POLL_TIME_MEM_UPDATE (500)
+
+/* Response types supported for RPC calls */
+enum fastrpc_response_flags {
+	/* normal job completion glink response */
+	NORMAL_RESPONSE = 0,
+	/* process updates poll memory instead of glink response */
+	POLL_MODE = 1,
+};
+
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
 						"sdsp", "cdsp", "cdsp1" };
 struct fastrpc_phy_page {
@@ -258,6 +271,12 @@ struct fastrpc_invoke_ctx {
 	u64 *perf_dsp;
 	u64 ctxid;
 	u64 msg_sz;
+	/* Threads poll for specified timeout and fall back to glink wait */
+	u64 poll_timeout;
+	/* work done status flag */
+	bool is_work_done;
+	/* response flags from remote processor */
+	enum fastrpc_response_flags rsp_flags;
 	struct kref refcount;
 	struct list_head node; /* list of ctxs */
 	struct completion work;
@@ -682,6 +701,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	ctx->crc = (u32 *)(uintptr_t)inv2->crc;
 	ctx->perf_dsp = (u64 *)(uintptr_t)inv2->perf_dsp;
 	ctx->perf_kernel = (u64 *)(uintptr_t)inv2->perf_kernel;
+	ctx->poll_timeout = (u64)inv2->poll_timeout;
 	if (ctx->perf_kernel) {
 		ctx->perf = kzalloc(sizeof(*(ctx->perf)), GFP_KERNEL);
 		if (!ctx->perf)
@@ -692,6 +712,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	ctx->pid = current->pid;
 	ctx->tgid = user->tgid;
 	ctx->cctx = cctx;
+	ctx->rsp_flags = NORMAL_RESPONSE;
+	ctx->is_work_done = false;
 	init_completion(&ctx->work);
 	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
 
@@ -1256,6 +1278,87 @@ static void fastrpc_update_invoke_count(u32 handle, u64 *perf_counter,
 		*count++;
 }
 
+static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx, u64 timeout)
+{
+	int err = -EIO, i, j;
+	u32 sc = ctx->sc;
+	struct fastrpc_invoke_buf *list;
+	struct fastrpc_phy_page *pages;
+	u64 *fdlist = NULL;
+	u32 *crclist = NULL, *poll = NULL;
+	unsigned int inbufs, outbufs, handles;
+
+	/* calculate poll memory location */
+	inbufs = REMOTE_SCALARS_INBUFS(sc);
+	outbufs = REMOTE_SCALARS_OUTBUFS(sc);
+	handles = REMOTE_SCALARS_INHANDLES(sc) + REMOTE_SCALARS_OUTHANDLES(sc);
+	list = fastrpc_invoke_buf_start(ctx->rpra, ctx->nscalars);
+	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	fdlist = (u64 *)(pages + inbufs + outbufs + handles);
+	crclist = (u32 *)(fdlist + FASTRPC_MAX_FDLIST);
+	poll = (u32 *)(crclist + FASTRPC_MAX_CRCLIST);
+
+	/* poll on memory for DSP response. Return failure on timeout */
+	for (i = 0, j = 0; i < timeout; i++, j++) {
+		if (*poll == FASTRPC_POLL_RESPONSE) {
+			err = 0;
+			ctx->is_work_done = true;
+			ctx->retval = 0;
+			break;
+		}
+		if (j == FASTRPC_POLL_TIME_MEM_UPDATE) {
+			/* make sure that all poll memory writes by DSP are seen by CPU */
+			dma_rmb();
+			j = 0;
+		}
+		udelay(1);
+	}
+	return err;
+}
+
+static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
+						u32 kernel)
+{
+	int err = 0;
+
+	if (kernel) {
+		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
+			err = -ETIMEDOUT;
+	} else {
+		err = wait_for_completion_interruptible(&ctx->work);
+	}
+
+	return err;
+}
+
+static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
+					u32 kernel)
+{
+	int err;
+
+	do {
+		switch (ctx->rsp_flags) {
+		case NORMAL_RESPONSE:
+			err = fastrpc_wait_for_response(ctx, kernel);
+			if (err || ctx->is_work_done)
+				return err;
+			break;
+		case POLL_MODE:
+			err = poll_for_remote_response(ctx, ctx->poll_timeout);
+			/* If polling timed out, move to normal response mode */
+			if (err)
+				ctx->rsp_flags = NORMAL_RESPONSE;
+			break;
+		default:
+			err = -EBADR;
+			dev_dbg(ctx->fl->sctx->dev, "unsupported response type:0x%x\n", ctx->rsp_flags);
+			break;
+		}
+	} while (!ctx->is_work_done);
+
+	return err;
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct fastrpc_invoke_v2 *inv2)
 {
 	struct fastrpc_invoke_ctx *ctx = NULL;
@@ -1301,16 +1404,22 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct
 	if (err)
 		goto bail;
 
-	if (kernel) {
-		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
-			err = -ETIMEDOUT;
-	} else {
-		err = wait_for_completion_interruptible(&ctx->work);
-	}
+	if (ctx->poll_timeout != 0 && handle > FASTRPC_MAX_STATIC_HANDLE &&
+		fl->cctx->domain_id == CDSP_DOMAIN_ID &&
+		fl->pd == USER_PD)
+		ctx->rsp_flags = POLL_MODE;
 
+	err = fastrpc_wait_for_completion(ctx, kernel);
 	if (err)
 		goto bail;
 
+	if (!ctx->is_work_done) {
+		err = -ETIMEDOUT;
+		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
+			handle, sc);
+		goto bail;
+	}
+
 	/* make sure that all memory writes by DSP are seen by CPU */
 	dma_rmb();
 	PERF(ctx->perf_kernel, GET_COUNTER((u64 *)ctx->perf, PERF_PUTARGS),
@@ -2627,12 +2736,14 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
+	/* Ignore this failure as context returned will be NULL for polling mode */
 	if (!ctx) {
-		dev_err(&rpdev->dev, "No context ID matches response\n");
-		return -ENOENT;
+		dev_dbg(&rpdev->dev, "No context ID matches response\n");
+		return 0;
 	}
 
 	ctx->retval = rsp->retval;
+	ctx->is_work_done = true;
 	complete(&ctx->work);
 
 	/*
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index 1edc7c04b171..dde684554011 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -86,7 +86,8 @@ struct fastrpc_invoke_v2 {
 	__u64 crc;
 	__u64 perf_kernel;
 	__u64 perf_dsp;
-	__u32 reserved[12];
+	__u64 poll_timeout;
+	__u32 reserved[10];
 };
 
 struct fastrpc_init_create {
-- 
2.34.1

