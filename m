Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8059FACEB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 11:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F54710E235;
	Mon, 23 Dec 2024 10:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="n6Hd1Tlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A8610E235
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 10:01:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN5rXmB018305;
 Mon, 23 Dec 2024 10:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TGKfJb2f2/jBNM/SKWtHpEfH
 2Qmi4nxCSndKf4d/ZW0=; b=n6Hd1TlgPOc3HVbHksOe3hnMQqpcDJYNQ0+QweHz
 5JC45zN3HPd+18wxIlCtDFpyFVr47lXbFBOPiOVrQRs3x1+C6DsfIGEnB87iZDWw
 wShIy/br+lFy1mkMGlJWI1izAc43xFmBR0HV9Mysm1n0oD+AGQ8DxgiiXTFpSfTc
 ciKc5vGCvGwe92S1dHpUEk/iSE1A7YNEU/tD+N3lghkCOYVyzXxdSnkwMRtSf5LO
 VK6CcK3tdlTq2GGRVP39cprEbu9mP6aFEdBSPurTk9y/wdTAgjV9KvZMP/SKBwQQ
 pt8R3AdIW1w8EFvgmI6OS4K918B3+6wPFf+zpyHrjUZhNQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q2458x0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2024 10:01:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNA1NLb023046
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2024 10:01:23 GMT
Received: from hu-anane-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 02:01:20 -0800
From: Anandu Krishnan E <quic_anane@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>, stable
 <stable@kernel.org>
Subject: [PATCH v2 1/2] misc: fastrpc: Deregister device nodes properly in
 error scenarios
Date: Mon, 23 Dec 2024 15:31:00 +0530
Message-ID: <20241223100101.29844-2-quic_anane@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241223100101.29844-1-quic_anane@quicinc.com>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: K4caK7fNs836E5u8shM5FKbo0ChpZf2v
X-Proofpoint-GUID: K4caK7fNs836E5u8shM5FKbo0ChpZf2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=878 priorityscore=1501 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230090
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

During fastrpc_rpmsg_probe, if secure device node registration
succeeds but non-secure device node registration fails, the secure
device node deregister is not called during error cleanup. Add proper
exit paths to ensure proper cleanup in case of error.

Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
Cc: stable <stable@kernel.org>
Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 48d08eeb2d20..ff144f0aa337 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2344,7 +2344,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 
 		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
 		if (err)
-			goto fdev_error;
+			goto populate_error;
 		break;
 	default:
 		err = -EINVAL;
-- 
2.17.1

