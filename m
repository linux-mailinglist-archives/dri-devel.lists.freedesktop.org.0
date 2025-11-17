Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A94C64579
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 14:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C0B10E092;
	Mon, 17 Nov 2025 13:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="S8VZKR93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8A410E092;
 Mon, 17 Nov 2025 13:25:29 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AHC8PPS024585;
 Mon, 17 Nov 2025 13:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=fYUbOTIvdj8J/pO6wz8BXCy+HCk+/
 c3gY76CEtkAHfY=; b=S8VZKR93E3mn/A2TYPI/x3f5kbLtNyr422/0KT393gGKg
 2KVnBtTPkPT0xcI1NIEu5zU55wAhYYBqok8HFTGDWIv95zJB3D8BUeWqa4qGC/sP
 4n5z85sW5fQpxhAMctsN7qiPuIkNCUpjH7Rq2+p5qhV4W4oOl2EiLoyRIV0nyYai
 W7xcPO1eVQSpI+lSlMfCM8glEb/op5A1YGOejTLcw3veQVmD2So3T7LZyJz6EoQA
 kA+AZledv9J6DPvgPHKVN/UZyZLzl+ymnqortUgZRtDwK1+DuLUDckB0kD7oydOB
 SIxgJ+3hrhOhBQfu0mjvKiPuaTthX3AG4y9EO0Bug==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbbagm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Nov 2025 13:25:21 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5AHD4qU6009714; Mon, 17 Nov 2025 13:25:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4aefybq9qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Nov 2025 13:25:20 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AHDKxd1019094;
 Mon, 17 Nov 2025 13:25:20 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4aefybq9pj-1; Mon, 17 Nov 2025 13:25:19 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: jordan@cosmicpenguin.net, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 simona@ffwll.ch, airlied@gmail.com, marijn.suijten@somainline.org,
 robin.clark@oss.qualcomm.com, sean@poorly.run, konradybcio@kernel.org,
 lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] drm/msm/a6xx: check state before dereferencing in a6xx_show
Date: Mon, 17 Nov 2025 05:25:11 -0800
Message-ID: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511170114
X-Authority-Analysis: v=2.4 cv=BoqQAIX5 c=1 sm=1 tr=0 ts=691b2241 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=hCstY7e2S1fvUqSyfcgA:9 cc=ntf awl=host:13643
X-Proofpoint-ORIG-GUID: p8SV1iRViiIPk0xrw9uBdigvWSQ5l_F2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX8GfC2jL1dCAs
 yUc4qVt6dKQ1CjXWWPPiwb8jScJ38xkgo1TCq/cZMzN2Cbr32zfTaE7pMPiof8jdjaG0Mxrq5Em
 VEjP1hiJ2OA7VrwZZP/HLkrxxXCxDUxIeiLJHAylzqd+VkFYcoWStZCsNazn/I2idLOVKVGX+vE
 kuEYpmB6y8H1irjWfG6JTnqzdFg73c5qAFr8YsTOS5M2JOJQQn6VZr7yxTlJ67/xmaCNpLiIqGw
 wpylOiXFpGiWy7vc5l8BzOEliUep9AAHmLibRb1doZif4ZgBexyRcxTwNrEzaq9HEjO0XJg9cvR
 KPw4vTspil8j7WAlDNL9UySjL3EtVyedggKrZ7AVqSdmfhpwmXmp80UQY6lqQeB8jrm7GD0Gi5l
 dN7k6fPXoqydo+ua343MQSb/CEHlF8nL81rJIKFN67OFBRpPfrE=
X-Proofpoint-GUID: p8SV1iRViiIPk0xrw9uBdigvWSQ5l_F2
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

Currently, a6xx_show() dereferences state before checking whether it is
NULL or an error pointer.This can lead to invalid memory access if state
is invalid.

Move the IS_ERR_OR_NULL(state) check to the top of the function before
any use of state.

Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 4c7f3c642f6a..e408e1d84ade 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1976,14 +1976,14 @@ static void a6xx_show_debugbus(struct a6xx_gpu_state *a6xx_state,
 void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		struct drm_printer *p)
 {
+	if (IS_ERR_OR_NULL(state))
+		return;
+
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu_state *a6xx_state = container_of(state,
 			struct a6xx_gpu_state, base);
 	int i;
 
-	if (IS_ERR_OR_NULL(state))
-		return;
-
 	drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialized);
 
 	adreno_show(gpu, state, p);
-- 
2.50.1

