Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1936940A5B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0C910E4DF;
	Tue, 30 Jul 2024 07:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GwKzE5PS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A6810E4AB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:10:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TNMFgK011935;
 Tue, 30 Jul 2024 07:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=1f6D8j20cHi5d/NqXz9m7T
 BZoHNULVKP779qPhvQ7Vk=; b=GwKzE5PSEZoF49Fehyc/+bzZefDmGW1dp/0GGX
 XU0uvt3BMkK4+43IrbXXji2E+BWggZfpmQIeBNhxZXWANbW41lBHRKN2wUhcEevU
 6cvwjv96+pvGj4YBO9pL8HlAmgh1FE8rb02BG/0fLz1TcgWS3EsVWL+BqXVioGYA
 RATAoenI1+S5SY/P5L7aPTMer0skrXm4VAnEtJUEg/1boJ1fjXxv/2FPeEiFx5SG
 eC5jPEAlFA77UqLJ006i4jYRGPhppR7t/hOMG39aFasM6v0upW4OGvZS04h4bnhu
 n3HMQkD0J91VTrwHtdPlgkNNRHicYqjQDWjWn39ajAGWAEYQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt68pc8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 07:10:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46U7ADAh002377
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 07:10:13 GMT
Received: from hu-abhishes-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 00:10:10 -0700
From: Abhishek Singh <quic_abhishes@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: Abhishek Singh <quic_abhishes@quicinc.com>, <gregkh@linuxfoundation.org>, 
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_ktadakam@quicinc.com>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1] misc: fastrpc: Trigger a panic using BUG_ON in device
 release
Date: Tue, 30 Jul 2024 12:39:45 +0530
Message-ID: <20240730070945.4174823-1-quic_abhishes@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: nEyyhOn6poZlE8gyoTP7qt0cSrT0Dp5b
X-Proofpoint-GUID: nEyyhOn6poZlE8gyoTP7qt0cSrT0Dp5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_07,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300052
X-Mailman-Approved-At: Tue, 30 Jul 2024 07:54:11 +0000
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

The user process on ARM closes the device node while closing the
session, triggers a remote call to terminate the PD running on the
DSP. If the DSP is in an unstable state and cannot process the remote
request from the HLOS, glink fails to deliver the kill request to the
DSP, resulting in a timeout error. Currently, this error is ignored,
and the session is closed, causing all the SMMU mappings associated
with that specific PD to be removed. However, since the PD is still
operational on the DSP, any attempt to access these SMMU mappings
results in an SMMU fault, leading to a panic.  As the SMMU mappings
have already been removed, there is no available information on the
DSP to determine the root cause of its unresponsiveness to remote
calls. As the DSP is unresponsive to all process remote calls, use
BUG_ON to prevent the removal of SMMU mappings and to properly
identify the root cause of the DSP’s unresponsiveness to the remote
calls.

Signed-off-by: Abhishek Singh <quic_abhishes@quicinc.com>
---
 drivers/misc/fastrpc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5204fda51da3..bac9c749564c 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -97,6 +97,7 @@
 #define FASTRPC_RMID_INIT_CREATE_STATIC	8
 #define FASTRPC_RMID_INIT_MEM_MAP      10
 #define FASTRPC_RMID_INIT_MEM_UNMAP    11
+#define PROCESS_KILL_SC 0x01010000
 
 /* Protection Domain(PD) ids */
 #define ROOT_PD		(0)
@@ -1128,6 +1129,9 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	fastrpc_context_get(ctx);
 
 	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
+	/* trigger panic if glink communication is broken and the message is for PD kill */
+	BUG_ON((ret == -ETIMEDOUT) && (handle == FASTRPC_INIT_HANDLE) &&
+			(ctx->sc == PROCESS_KILL_SC));
 
 	if (ret)
 		fastrpc_context_put(ctx);
-- 
2.25.1

