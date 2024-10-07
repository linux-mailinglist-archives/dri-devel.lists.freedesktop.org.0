Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E55992768
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 10:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E6210E320;
	Mon,  7 Oct 2024 08:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kNfSyOgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A6E10E329
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 08:45:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974TD8h032511;
 Mon, 7 Oct 2024 08:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nBevgU321+ZkvO2ez5LU2yHZr2Ipcwcl+bm1EytCkY4=; b=kNfSyOgDES3S1VPO
 A4tHV5WNzMtz2aGI18AlXozElnAGF27VsOMXdNfgi+vIAyzRVSvebHtWT4mLCHCs
 soNdm600QXxzjpaIkIG0kiXCbsOKUluUDsUzx4v6tJX+zU78rNBkjuAdPKMMVrTV
 fC429j0bzUS0JgaVNs8k3gwI3ml49yYMKDFc4XmP1WGIjNa3zJFG4wSPXBEn7f+W
 uNsKmu8wPdOSOe9m97yicQ/6zd2VpLE8F+Pm4Zy0TGAFKY+VY50T2bG8454nFTtH
 pmJk91yeKYaWlDnzER7k0CruQ0FHod3FcAIcZUhovIrp7QQpywE+tOkRRIQyu+7z
 V4VIPw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv8bff8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 08:45:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4978jc4q030796
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Oct 2024 08:45:38 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 01:45:36 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 3/4] misc: fastrpc: Modify context id calculation for poll
 mode
Date: Mon, 7 Oct 2024 14:15:17 +0530
Message-ID: <20241007084518.3649876-4-quic_ekangupt@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ccl-2WawCM_VKXkgP_eX6u3SlLX3l-PU
X-Proofpoint-GUID: ccl-2WawCM_VKXkgP_eX6u3SlLX3l-PU
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

Poll mode is a feature to be introduced which improves the fastrpc
remote calls latency. For this feature, DSP expects the 4th to 7th
bit of context id to be zero. Prepare context id in such a way that
polling mode can be supported.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 54a562fc94fb..c008fcd95e15 100644
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
@@ -559,7 +559,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 16);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->perf);
@@ -706,7 +706,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = ret << 16;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2621,7 +2621,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 16);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1

