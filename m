Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADBA1D05C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 05:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6132810E2EC;
	Mon, 27 Jan 2025 04:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AGdtN0n0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBDF10E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 04:42:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R0xoQO031640;
 Mon, 27 Jan 2025 04:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3OFm/qjrJDZTukJBcvS7s/C4ec+K6ntJXkwtdBSQAiA=; b=AGdtN0n0AYMEj59R
 lZS5AUBcAMAKgxJvQxOQdQs/Wd49ZfkfoGdCVzC2z/G8qjjdWeaET1gmmGGLzLFY
 pDw5XlX/ajJS6lRfCkwY6K5jQ9cy6Df12ZsIggiiiVpwKaQVYqSilKYcDsaTCA99
 Qx66UrtsVT4DhSAOAha4t84U3Ywg9imO+Y1H5LKVvAJ1+kPkhy5bb1nmeCjkeccR
 zkKwjXXtS885OqmdyyF+gDg5dNlFl450m+MabCFp6F9TvDV+jpjHdqBnBAJ4Yu29
 wVxscd7N3HGsOIgTlwjbVoV+mWmBtyNx46zvNuHah852n9onrPzG6zmXxHIzWCNe
 4/XJCQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dhu9h4f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 04:42:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R4grWl015812
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 04:42:53 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 26 Jan 2025 20:42:50 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v2 1/5] misc: fastrpc: Move fdlist to invoke context structure
Date: Mon, 27 Jan 2025 10:12:35 +0530
Message-ID: <20250127044239.578540-2-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: vD5wIzdKAvKD4XD-XzbIFbjTZ5Gfd2TD
X-Proofpoint-ORIG-GUID: vD5wIzdKAvKD4XD-XzbIFbjTZ5Gfd2TD
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

FD list is part of meta buffer which is calulated during put args.
Move fdlist to invoke context structure for better maintenance and
to avoid code duplicacy for calculation of critcal meta buffer
contents that are used by fastrpc driver.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 42b4d60c224c..1a936d462519 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -236,6 +236,7 @@ struct fastrpc_invoke_ctx {
 	int pid;
 	int client_id;
 	u32 sc;
+	u64 *fdlist;
 	u32 *crc;
 	u64 ctxid;
 	u64 msg_sz;
@@ -965,6 +966,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1067,17 +1069,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	union fastrpc_remote_arg *rpra = ctx->rpra;
 	struct fastrpc_user *fl = ctx->fl;
 	struct fastrpc_map *mmap = NULL;
-	struct fastrpc_invoke_buf *list;
-	struct fastrpc_phy_page *pages;
-	u64 *fdlist;
-	int i, inbufs, outbufs, handles;
+	int i, inbufs;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
-	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
-	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
-	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
-	pages = fastrpc_phy_page_start(list, ctx->nscalars);
-	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
 
 	for (i = inbufs; i < ctx->nbufs; ++i) {
 		if (!ctx->maps[i]) {
@@ -1096,9 +1090,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 
 	/* Clean up fdlist which is updated by DSP */
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
-		if (!fdlist[i])
+		if (!ctx->fdlist[i])
 			break;
-		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
+		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap, false))
 			fastrpc_map_put(mmap);
 	}
 
-- 
2.34.1

