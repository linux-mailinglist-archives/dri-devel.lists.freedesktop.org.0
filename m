Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E90F9FE5B8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 12:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A43110E149;
	Mon, 30 Dec 2024 11:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Vjpbgo2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8E710E149
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 11:53:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU80sMr012100;
 Mon, 30 Dec 2024 11:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:message-id:mime-version:subject:to; s=
 qcppdkim1; bh=W4OgfFvqZE11Ow6At9Oyt3ivY161goXvFIpKuMP9l/k=; b=Vj
 pbgo2Uz5Sol5uSDdF55Wvc0HGoZ/8gPhuTx33Bh5JotOW2T6ikYvqPHtM58J4Zlp
 HRo5fbK5hypAtOjUkTp83AaTO6trVwqZaXKgNqeXjmLllTXqiGeP3xyd0x1D362G
 E9drnd3Jao/rrSMGYl6oFv0maIBrf+Tl0yb/d4LHJRrTAG50eLc3TWtU5D1UHbE1
 MXMry0YJv7BToY1pQ0xNDBPMrVKV7QdX+C+sQLIgpw9h6a7b1j9SYcpmaykkjR5q
 N14UBjgABCmW7HHrJDpf1sVRCw9IJOh4MhUgP4Ah8hcGziQx37iOGakzEZe9qzK2
 +6K22eMwkHXKtAnCXsbQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uqmqgf2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 11:52:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BUBqw3v021084
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 11:52:58 GMT
Received: from hu-anane-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Dec 2024 03:52:55 -0800
From: Anandu Krishnan E <quic_anane@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <quic_ekangupt@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>, <stable@kernel.org>
Subject: [PATCH v3] misc: fastrpc: Deregister device nodes properly in error
 scenarios
Date: Mon, 30 Dec 2024 17:22:41 +0530
Message-ID: <20241230115241.23202-1-quic_anane@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ks8Na3B7ZgIr_dYDxgOTyg70RG_woKzg
X-Proofpoint-ORIG-GUID: Ks8Na3B7ZgIr_dYDxgOTyg70RG_woKzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=890 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300101
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
Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
---
Changes in v3:
 - Resolved checkpatch warning.
 - moved out from patch series to stand-alone patch.
 - Link to v2: https://lore.kernel.org/all/20241223100101.29844-1-quic_anane@quicinc.com/

Changes in v2:
 - Added Fixes: tag and cc:stable.
 - Fixed author name.
 - Link to v1: https://lore.kernel.org/all/20241220061854.24428-1-quic_anane@quicinc.com/

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

