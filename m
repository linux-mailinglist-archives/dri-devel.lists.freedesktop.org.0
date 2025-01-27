Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA6A1D05F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 05:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E92210E369;
	Mon, 27 Jan 2025 04:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZS5PFa/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1866410E369
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 04:43:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R1ccp9008632;
 Mon, 27 Jan 2025 04:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M01EAUmc0GjQN+utSYliCT+8oEL5CJS4CvJ8Ro1ooiI=; b=ZS5PFa/kpFEn1b5E
 1LvjDRpG8tRvFEP5L5IdCH2fkKiNIqubSSHM3oMiAkr1zZn3GICSrU52xYVfzmMN
 je9EoSzTrv7/52jhT5c08PdNu4YXSV14ZOACdNPIC2zounKA3V2ow556Wmq1EOPm
 WN7AqM9w5wF5UNSaQ61c5kbfpCyPLkTFMqWLc6VuhvBPcqoth5QAmANC2FeaL6ye
 0Hqp+QRYrCGwrs4mHwgn31nYEPkEi3z662D1kEzC7+kMsNM5t5nuqT7WOGXIibwY
 hSArkiSZTJogejfNKBmLAey9FcABNGR+t3yEziRpcOiVN0xblqH3Vugo/uoEYD8S
 XIaFQA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dwg0rcun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 04:43:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R4h2EU003085
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 04:43:02 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 26 Jan 2025 20:42:59 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for fastRPC
 driver
Date: Mon, 27 Jan 2025 10:12:38 +0530
Message-ID: <20250127044239.578540-5-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OifRupQm49DrCmBHe1Hn-I6aOOAycuMm
X-Proofpoint-ORIG-GUID: OifRupQm49DrCmBHe1Hn-I6aOOAycuMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270036
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
 drivers/misc/fastrpc.c      | 122 +++++++++++++++++++++++++++++++++---
 include/uapi/misc/fastrpc.h |   3 +-
 2 files changed, 114 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index cfacee0dded5..257a741af115 100644
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
@@ -106,6 +108,19 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
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
@@ -238,9 +253,16 @@ struct fastrpc_invoke_ctx {
 	u32 sc;
 	u64 *fdlist;
 	u32 *crclist;
+	u32 *poll;
 	void __user *crc;
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
@@ -258,6 +280,7 @@ struct fastrpc_invoke_ctx {
 struct fastrpc_ctx_args {
 	struct fastrpc_invoke_args *args;
 	void __user *crc;
+	u64 poll_timeout;
 };
 
 struct fastrpc_session_ctx {
@@ -619,11 +642,14 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	fastrpc_channel_ctx_get(cctx);
 
 	ctx->crc = cargs->crc;
+	ctx->poll_timeout = cargs->poll_timeout;
 	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
 	ctx->client_id = user->client_id;
 	ctx->cctx = cctx;
+	ctx->rsp_flags = NORMAL_RESPONSE;
+	ctx->is_work_done = false;
 	init_completion(&ctx->work);
 	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
 
@@ -882,7 +908,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32);
 
 	return size;
 }
@@ -975,6 +1002,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	ctx->crclist = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST);
+	ctx->poll = (u32 *)(ctx->crclist + FASTRPC_MAX_CRCLIST);
+
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1145,6 +1174,72 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 }
 
+static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx, u64 timeout)
+{
+	int err = -EIO, i, j;
+
+	/* poll on memory for DSP response. Return failure on timeout */
+	for (i = 0, j = 0; i < timeout; i++, j++) {
+		if (*ctx->poll == FASTRPC_POLL_RESPONSE) {
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
+			dev_dbg(ctx->fl->sctx->dev,
+				"unsupported response type:0x%x\n", ctx->rsp_flags);
+			break;
+		}
+	} while (!ctx->is_work_done);
+
+	return err;
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   u32 handle, u32 sc,
 				   struct fastrpc_ctx_args *cargs)
@@ -1180,16 +1275,20 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
-	if (kernel) {
-		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
-			err = -ETIMEDOUT;
-	} else {
-		err = wait_for_completion_interruptible(&ctx->work);
-	}
+	if (ctx->poll_timeout != 0 && handle > FASTRPC_MAX_STATIC_HANDLE
+	    && fl->pd == USER_PD)
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
 	/* make sure that all memory writes by DSP are seen by CPU */
 	dma_rmb();
 	/* populate all the output buffers with results */
@@ -1769,7 +1868,7 @@ static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
 		return -EFAULT;
 
 	/* Check if all reserved fields are zero */
-	for (i = 0; i < 16; i++) {
+	for (i = 0; i < 14; i++) {
 		if (inv2.reserved[i] != 0)
 			return -EINVAL;
 	}
@@ -1779,6 +1878,7 @@ static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
 		return -ENOMEM;
 
 	cargs->crc = (void __user *)(uintptr_t)inv2.crc;
+	cargs->poll_timeout = inv2.poll_timeout;
 
 	err = fastrpc_remote_invoke(fl, &inv2.inv, cargs);
 	kfree(cargs);
@@ -2581,12 +2681,14 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
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
index 406b80555d41..1920c537bbbf 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -84,7 +84,8 @@ struct fastrpc_invoke {
 struct fastrpc_invoke_v2 {
 	struct fastrpc_invoke inv;
 	__u64 crc;
-	__u32 reserved[16];
+	__u64 poll_timeout;
+	__u32 reserved[14];
 };
 
 struct fastrpc_init_create {
-- 
2.34.1

