Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7CEA1D062
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 05:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713F610E39C;
	Mon, 27 Jan 2025 04:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bz4qALS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC71510E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 04:43:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R1hUVG008471;
 Mon, 27 Jan 2025 04:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PVBHZ51bNXLyMIA5posqUMWv/2n+p+py1aBTQ5EgWvY=; b=bz4qALS4RATZ85oF
 OKz7eQ8d8qWvLwTwluSeSLCCfdK91kobDJG2MLXQWPbV3hO7KtDPprHs6h+10Hx/
 OYKV5RDd1KSHWh7bJxWLNS2aq0vr33ssACnIjG+yLhHqIjI/NUYu0CjGq/1Z3W56
 5bG+Hp5gu8Be5elGXSL1TZF9gKv3jEM9ePvxVzKzPw//ANNLcKN9EL//+loq8Bzp
 ozqnCCXJZjvGpv0ZRw2fEunxEsnK6RX52Y64P7qdh7af1Z2S/14WS1C5/JrhUHFR
 n9CDbhd1xS1MHayT6Rt4xvidgnkH8E/66BfMAAmDWVrA+Jdaz4yuVi/9rgRdQIb6
 24adJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dhu9h4fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 04:43:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R4h5a6003164
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 04:43:05 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 26 Jan 2025 20:43:02 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v2 5/5] misc: fastrpc: Modify context id mask to support
 polling mode
Date: Mon, 27 Jan 2025 10:12:39 +0530
Message-ID: <20250127044239.578540-6-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: ymuqKnocGz3csGc394CVVg3fv5yH0Fms
X-Proofpoint-ORIG-GUID: ymuqKnocGz3csGc394CVVg3fv5yH0Fms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270036
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

DSP needs last 4 bits of context id to be 0 for polling mode to be
supported as setting of last 8 is intended for async mode(not yet
supported on upstream driver) and setting these bits restrics
writing to poll memory from DSP. Modify context id mask to ensure
polling mode is supported.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 257a741af115..ef56c793c564 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -40,7 +40,7 @@
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
 #define FASTRPC_MAX_STATIC_HANDLE (20)
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK (0xFF0000)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -524,7 +524,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 16);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -664,7 +664,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = ret << 16;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2675,7 +2675,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 16);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1

