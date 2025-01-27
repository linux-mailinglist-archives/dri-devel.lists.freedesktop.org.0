Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE78A1D061
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 05:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9FC10E490;
	Mon, 27 Jan 2025 04:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VX1ovJ+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B250010E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 04:43:03 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R2W54s016618;
 Mon, 27 Jan 2025 04:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xsUVvHETE1rTl6Sv1OA46rXgILMWKsuzQBKnbzij/KM=; b=VX1ovJ+CIbPTtEFq
 7EulEGf8PQyOP2WKlwrIQz+FNzWeIasl/e91nXFbizqGAn8o5/FBWkvSmui2n0C2
 ySUfB8P/z/s5y2kzxVBgMrGPMUyk/PX73W3GKDEh2ExAVAcUmV9c8CIGEe5Wb1LA
 xyeSuXx5IrT/RII3/Z7YmlzePStTy378luy8B2atkQPCT6ceVUmEF1rSyavm9Ru/
 azJ53ueGCDCOQmslIJpS0Bdt98cVtXapvgZ7H5l1POAbUimPeeZuoTBDwkkKXHH+
 kkwhH5wA5xCNm7Cz/FfwIc7yOxPFPiTQt1Fg1fTGhxqAMqBrruHPOdKRDLjpWJ3F
 mQ55lQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dgj1h7rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 04:42:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R4gxlx003009
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 04:42:59 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 26 Jan 2025 20:42:56 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v2 3/5] misc: fastrpc: Add CRC support using invokeV2 request
Date: Mon, 27 Jan 2025 10:12:37 +0530
Message-ID: <20250127044239.578540-4-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: RxBHmCAWq3vOLCCJa-GBxUFMjHk1csq1
X-Proofpoint-ORIG-GUID: RxBHmCAWq3vOLCCJa-GBxUFMjHk1csq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270035
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

InvokeV2 request is intended to support multiple enhanced invoke
requests like CRC check, performance counter enablement and polling
mode for RPC invocations. CRC check is getting enabled as part of
this patch. CRC check for input and output argument helps in ensuring
data consistency over a remote call. If user intends to enable CRC
check, first local user CRC is calculated at user end and a CRC buffer
is passed to DSP to capture remote CRC values. DSP is expected to
write to the remote CRC buffer which is then compared at user level
with the local CRC values.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c      | 78 ++++++++++++++++++++++++++++++-------
 include/uapi/misc/fastrpc.h |  7 ++++
 2 files changed, 70 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c29d5536195e..cfacee0dded5 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -237,7 +237,8 @@ struct fastrpc_invoke_ctx {
 	int client_id;
 	u32 sc;
 	u64 *fdlist;
-	u32 *crc;
+	u32 *crclist;
+	void __user *crc;
 	u64 ctxid;
 	u64 msg_sz;
 	struct kref refcount;
@@ -617,6 +618,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	/* Released in fastrpc_context_put() */
 	fastrpc_channel_ctx_get(cctx);
 
+	ctx->crc = cargs->crc;
 	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
@@ -972,6 +974,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
+	ctx->crclist = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1101,6 +1104,12 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 			fastrpc_map_put(mmap);
 	}
 
+	if (ctx->crc && ctx->crclist && rpra) {
+		if (copy_to_user(ctx->crc, ctx->crclist,
+		    FASTRPC_MAX_CRCLIST * sizeof(u32)))
+			return -EFAULT;
+	}
+
 	return 0;
 }
 
@@ -1703,39 +1712,75 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 	return err;
 }
 
-static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
+static int fastrpc_remote_invoke(struct fastrpc_user *fl, struct fastrpc_invoke *inv,
+				 struct fastrpc_ctx_args *cargs)
 {
-	struct fastrpc_invoke_args *args = NULL;
-	struct fastrpc_ctx_args *cargs;
-	struct fastrpc_invoke inv;
+	struct fastrpc_invoke_args *args;
 	u32 nscalars;
 	int err;
 
-	if (copy_from_user(&inv, argp, sizeof(inv)))
-		return -EFAULT;
-
 	/* nscalars is truncated here to max supported value */
-	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
+	nscalars = REMOTE_SCALARS_LENGTH(inv->sc);
 	if (nscalars) {
 		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
 		if (!args)
 			return -ENOMEM;
 
-		if (copy_from_user(args, (void __user *)(uintptr_t)inv.args,
+		if (copy_from_user(args, (void __user *)(uintptr_t)inv->args,
 				   nscalars * sizeof(*args))) {
 			kfree(args);
 			return -EFAULT;
 		}
 	}
+
+	cargs->args = args;
+	err = fastrpc_internal_invoke(fl, false, inv->handle, inv->sc, cargs);
+	kfree(args);
+
+	return err;
+}
+
+static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_ctx_args *cargs;
+	struct fastrpc_invoke inv;
+	int err;
+
+	if (copy_from_user(&inv, argp, sizeof(inv)))
+		return -EFAULT;
+
 	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
-	if (!cargs) {
-		kfree(args);
+	if (!cargs)
 		return -ENOMEM;
+
+	err = fastrpc_remote_invoke(fl, &inv, cargs);
+	kfree(cargs);
+
+	return err;
+}
+
+static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_ctx_args *cargs;
+	struct fastrpc_invoke_v2 inv2;
+	int i, err;
+
+	if (copy_from_user(&inv2, argp, sizeof(inv2)))
+		return -EFAULT;
+
+	/* Check if all reserved fields are zero */
+	for (i = 0; i < 16; i++) {
+		if (inv2.reserved[i] != 0)
+			return -EINVAL;
 	}
 
-	cargs->args = args;
-	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, cargs);
-	kfree(args);
+	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
+	if (!cargs)
+		return -ENOMEM;
+
+	cargs->crc = (void __user *)(uintptr_t)inv2.crc;
+
+	err = fastrpc_remote_invoke(fl, &inv2.inv, cargs);
 	kfree(cargs);
 
 	return err;
@@ -2188,6 +2233,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_INVOKE:
 		err = fastrpc_invoke(fl, argp);
 		break;
+	case FASTRPC_IOCTL_INVOKEV2:
+		err = fastrpc_invokev2(fl, argp);
+		break;
 	case FASTRPC_IOCTL_INIT_ATTACH:
 		err = fastrpc_init_attach(fl, ROOT_PD);
 		break;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index f33d914d8f46..406b80555d41 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -17,6 +17,7 @@
 #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
 #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
+#define FASTRPC_IOCTL_INVOKEV2		_IOWR('R', 14, struct fastrpc_invoke_v2)
 
 /**
  * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
@@ -80,6 +81,12 @@ struct fastrpc_invoke {
 	__u64 args;
 };
 
+struct fastrpc_invoke_v2 {
+	struct fastrpc_invoke inv;
+	__u64 crc;
+	__u32 reserved[16];
+};
+
 struct fastrpc_init_create {
 	__u32 filelen;	/* elf file length */
 	__s32 filefd;	/* fd for the file */
-- 
2.34.1

