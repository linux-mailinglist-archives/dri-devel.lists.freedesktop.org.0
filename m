Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7121B5A0102
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C3A12BBCA;
	Wed, 24 Aug 2022 18:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FDD10E282
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:22:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27H1FsG4031043;
 Wed, 17 Aug 2022 01:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=0IncJsra6xUgW/jI5R+gybLlbnWy1YcHUS4hBdU6Z4Q=;
 b=Hp6/Eoyuc30/nzvd+5t7U98feL1IL7SrIhtWL6hZpC6A3S3AmYbZ4WzpjkAIMjmRH+Km
 12rAV7C+VmIgThBWgGShoguUu+zRXC6iwsKifhyN/C1FsQ4TkFLqm09XPGRQIGAl+B4s
 qtiPl+Gmk2+UqeyGbio4030fmofdk1Nu4028C/X36GBCJ4imhZC6lLDGfHVXPbL4ROX1
 +rxiFeytesst4llWzR1QwxDLaAZf6Ho07U7mdtIpDFTUpiSsIKfyMPXhPtkzr2wBYqVo
 QVnHv5gEDNTrRnW1gsn3LBVhKZCCp2METuxazUewQgi7nOIFT4CTH2tosVZzCnKDzeGi iw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j06b9kke9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 01:22:15 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27H1MEk5024660
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 01:22:14 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 18:22:14 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm v3 1/2] tests/modetest: Allocate drmModeAtomicReq
 before setting properties
Date: Tue, 16 Aug 2022 18:22:00 -0700
Message-ID: <20220817012201.162-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817012201.162-1-quic_jesszhan@quicinc.com>
References: <20220817012201.162-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OayIcHw1B1ZK_HrwnAmj7VdRYqFc2SrJ
X-Proofpoint-ORIG-GUID: OayIcHw1B1ZK_HrwnAmj7VdRYqFc2SrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=694 phishscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170004
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
Cc: Rohith Iyer <quic_rohiiyer@quicinc.com>, quic_abhinavk@quicinc.com,
 qdmitry.baryshkov@linaro.org, hoegsberg@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rohith Iyer <quic_rohiiyer@quicinc.com>

Fix null pointer deference caused by drmModeAtomicReq being
allocated before set_property was called when modetest was run
with the atomic flag.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
---
 tests/modetest/modetest.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index 8ff6c80d..f33f303c 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -2188,11 +2188,13 @@ int main(int argc, char **argv)
 	dump_resource(&dev, planes);
 	dump_resource(&dev, framebuffers);
 
+	if (dev.use_atomic)
+		dev.req = drmModeAtomicAlloc();
+
 	for (i = 0; i < prop_count; ++i)
 		set_property(&dev, &prop_args[i]);
 
 	if (dev.use_atomic) {
-		dev.req = drmModeAtomicAlloc();
 
 		if (set_preferred || (count && plane_count)) {
 			uint64_t cap = 0;
-- 
2.35.1

