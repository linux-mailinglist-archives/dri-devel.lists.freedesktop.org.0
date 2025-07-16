Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CEAB076FA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 15:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DC410E7B7;
	Wed, 16 Jul 2025 13:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FjYsWdFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40F510E7B5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 13:29:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD3Blo022730;
 Wed, 16 Jul 2025 13:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GPIGQmV+hqdlsR9ccAm6wBh1uGhtNO9pveoOBdEfVX0=; b=FjYsWdFNftyWnLI/
 NIlvph/5mFD1oM9vzGbY21YZLRDsPuhx4X5UUQkhj+TvSi+NPb7WbyDMRMS2aRQH
 0J6BmhOCJAaLKaiEWfaS7KM3g2TN/4UJ3RK/ZvrXeQ3CtoLpBTu5gNxQIZDYTIfx
 uXLkwSib5RJkgF2tgj2OYNpU/rIH1oCC/EaQuKJGRy3dYdluv8yk89TYIVf0s2ec
 ESm/j9WJ+IeLMz0o5wdlO17SYbn1fXBYKDxVUtNpREcFbxXookKiN+ucJ8VnpxDF
 HJ6MuSdwRxjClFDRpc+1hlik7Lzwz0jHHoaXRW+qrychdq4h8kq8RVUcHIKThEWX
 71vRFQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrumsgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jul 2025 13:29:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56GDTe8M025616
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jul 2025 13:29:40 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 06:29:35 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v9 5/5] misc: fastrpc: add support for gdsp remoteproc
Date: Wed, 16 Jul 2025 18:58:36 +0530
Message-ID: <20250716132836.1008119-6-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dQ2NwE69ZyMhDYoM30JNggZGXtjiIEjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEyMSBTYWx0ZWRfX808VgscqiziV
 EGrkfBpCXPBnNkFRhVSMBQLLsmxz3+FTMsx10Te2c3C9L7M8osjyj8YifwE1HOAHuPo3jeU+uKe
 fBMdbshPnlLKLxOMZu2JkWoGKLrTm0ZlRuLQuig3LNzNw0gCLACC/qP5UEvH613XvIXmlMR7a6z
 7QeHITwpaxa2r6iEhmHSwmzv2d+6a1kcmVqFd6pjib/8lD1b8s2Kggi4iYsgjo4NwNNylpFdvGZ
 WYVIRajxs34u90DO7WacFB2w7S4SHqTotzPMmQxpJFBVK8icf0c1Kg5qdglzJ/3zYj7gYktLfgM
 WZZL5pfdM63dQ06muHiqyl+Us4y+QBOs/1vabfMy+dPTGIhlPPlc5Y5IZlskKYedpbCNczuNisB
 mbRzv72uLdLk+J4WiWAtTsiRnEr8FMgPrjMixqhFUd5jbZVqPQ4fg1hTbcDM/3xIb4gx4sOr
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=6877a944 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VHSkhjcgKWVwXbDC_XQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dQ2NwE69ZyMhDYoM30JNggZGXtjiIEjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160121
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

Some platforms (like sa8775p) feature one or more GPDSPs (General
Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide
a FastRPC implementation, allowing code execution in both signed and
unsigned protection domains. Extend the checks to allow domain names
starting with "gdsp" (possibly followed by an index).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 85b6eb16b616..d05969de406e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -27,6 +27,7 @@
 #define MDSP_DOMAIN_ID (1)
 #define SDSP_DOMAIN_ID (2)
 #define CDSP_DOMAIN_ID (3)
+#define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
@@ -2249,6 +2250,8 @@ static int fastrpc_get_domain_id(const char *domain)
 		return MDSP_DOMAIN_ID;
 	else if (!strncmp(domain, "sdsp", 4))
 		return SDSP_DOMAIN_ID;
+	else if (!strncmp(domain, "gdsp", 4))
+		return GDSP_DOMAIN_ID;
 
 	return -EINVAL;
 }
@@ -2323,13 +2326,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
-		/* Unsigned PD offloading is only supported on CDSP */
+		/* Unsigned PD offloading is only supported on CDSP and GDSP */
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
 			goto err_free_data;
 		break;
 	case CDSP_DOMAIN_ID:
+	case GDSP_DOMAIN_ID:
 		data->unsigned_support = true;
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domain);
-- 
2.34.1

