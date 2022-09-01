Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219025AA381
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 01:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3BB10E36C;
	Thu,  1 Sep 2022 23:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C787C10E38F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 23:10:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281Ms4dt024987;
 Thu, 1 Sep 2022 23:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=B3vhoeexE5J1dKi/75XikuXGH+EMALzq6TF86O0dCZM=;
 b=Jsb2bNBPqTemCzawj1jOzWteh++3fA3Av1aGbPGduYHQh8MDXn+WZp8rS9wJqniQOAHN
 RrKOMwN/ESwqnJy2COCZ2H6w7uwQHLYNLkJi6f1M/jIzX2oqHLuOfpT3t57mgA8XAlsT
 6xKrTuyA+Rb15QywsnIdh73p2l37uY4HIeqhdrXYdaDAjEfISMYPrts5UaCG/3I06PJe
 MRKv6J+XkmM4N3XLKs6f8nolNYULTW8VlhXUqebeahNHmWaIGvORBr+Q4ac7gTOqOeQr
 ydvo5kdWtN6a0UcGkXXyDH+E+2u+LWWxvYSCBxSM9f1cyfRLrY/RlP73g9axylSPl0hv KA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jashfakvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 23:09:53 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 281N9qMA028710
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Sep 2022 23:09:52 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 1 Sep 2022 16:09:52 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RESEND PATCH libdrm v3 1/2] tests/modetest: Allocate
 drmModeAtomicReq before setting properties
Date: Thu, 1 Sep 2022 16:09:23 -0700
Message-ID: <20220901230924.145-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901230924.145-1-quic_jesszhan@quicinc.com>
References: <20220901230924.145-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ify9PHmzex1MCZ-4MhFFGx9F7N3h8KAR
X-Proofpoint-ORIG-GUID: Ify9PHmzex1MCZ-4MhFFGx9F7N3h8KAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 mlxlogscore=688 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010102
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
 hoegsberg@google.com, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rohith Iyer <quic_rohiiyer@quicinc.com>

Fix null pointer deference caused by drmModeAtomicReq being
allocated before set_property was called when modetest was run
with the atomic flag.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/modetest/modetest.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index 42e2d1f4..2c31c4fc 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -2186,11 +2186,13 @@ int main(int argc, char **argv)
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
2.31.0

