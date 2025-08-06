Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8CB1C56C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 13:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE6610E753;
	Wed,  6 Aug 2025 11:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aWPRIjpe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB7F10E752
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 11:51:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576AMimr017319;
 Wed, 6 Aug 2025 11:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MXe93JXceflh8PvWfKGGoZ9LbYnD7R/AGqPp/QvmJmY=; b=aWPRIjpeq+7X6mcg
 w+i8B2ILkkd+5JyF0NUU6eTeYwC7YR7CZM4Fod6yTfZ//1al5AsrsSQPtb6H/nZT
 C29dSsM5OHYJ4Wdkux8O+izwLzKtkCoub4/NF1XwDqecVnxWIDQax/C3ue1dEGmv
 zDZrvqH2SXe2CGAiwO0zvEILHghGKLdYjtpy/67nA4nX7RzBZEokO0XNAlxrrpoI
 U2JNbXoqmhRcDuV7JL5hutvBOPTEMey/Z/bdMEipvkZrSStskmGxmsUrTzNy2Daz
 Pvl4yR0E+kPkef4X2Wwi2Nn8/Tsh7hQ3CQi7cSY6D2wsjyG3jsthmGqNdCbEREQP
 8O3rSA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c58686am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Aug 2025 11:51:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 576BplCP015579
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Aug 2025 11:51:47 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 6 Aug 2025 04:51:43 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <thierry.escande@linaro.org>,
 <quic_vgattupa@quicinc.com>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>,
 <stable@kernel.org>
Subject: [PATCH v2 3/4] misc: fastrpc: fix possible map leak in
 fastrpc_put_args
Date: Wed, 6 Aug 2025 17:21:13 +0530
Message-ID: <20250806115114.688814-4-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806115114.688814-1-quic_lxu5@quicinc.com>
References: <20250806115114.688814-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SolUse1ji72QTzeNQbsQkPXURZZw28uZ
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=689341d4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Op9FgWJ_R3wbKKMAuNAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SolUse1ji72QTzeNQbsQkPXURZZw28uZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfXxDJVPS5RcvTd
 dI71NDKW8mTdJyo/iv6eeeHFuATnAtBAxbv/pjAPlADc8JyUax9wD/da4C+3aA6QQlN5CsgAKw0
 dPNAbRFP/Kfj10jLXUHA2wbUzp1hDkbMPlv3J02bjdqdOUWARoy1NnM1iTKqVIALD2rPoVFysXO
 CniLCfMv3s7ib1kRDEDy9G9ZGcTTKs3OFkgVhhLCXVmYCSqFeWuNHFuUAz1fcH4SzLrYVqhzUze
 ZUyl27j4NwH6GZ0JVjOY3Hw48EjSiya4X6iAprDHheKic2+aSLjRl7MXTngCatfz8JX6Ya7oz/d
 BDoFld3guGCyixyo4QunlsmMru8qQgxP9goXIlJSBq4aCac1x5vOFFvcU5p2eaifGKYyhXzDHab
 5zVHEgmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064
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

copy_to_user() failure would cause an early return without cleaning up
the fdlist, which has been updated by the DSP. This could lead to map
leak. Fix this by redirecting to a cleanup path on failure, ensuring
that all mapped buffers are properly released before returning.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1815b1e0c607..d950a179bff8 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1085,6 +1085,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	struct fastrpc_phy_page *pages;
 	u64 *fdlist;
 	int i, inbufs, outbufs, handles;
+	int ret = 0;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
 	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
@@ -1100,14 +1101,17 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 			u64 len = rpra[i].buf.len;
 
 			if (!kernel) {
-				if (copy_to_user((void __user *)dst, src, len))
-					return -EFAULT;
+				if (copy_to_user((void __user *)dst, src, len)) {
+					ret = -EFAULT;
+					goto cleanup_fdlist;
+				}
 			} else {
 				memcpy(dst, src, len);
 			}
 		}
 	}
 
+cleanup_fdlist:
 	/* Clean up fdlist which is updated by DSP */
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
 		if (!fdlist[i])
@@ -1116,7 +1120,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 			fastrpc_map_put(mmap);
 	}
 
-	return 0;
+	return ret;
 }
 
 static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
-- 
2.34.1

