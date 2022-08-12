Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9803591799
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 01:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4713998772;
	Fri, 12 Aug 2022 23:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F159786B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 23:18:19 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CMtCiD024432;
 Fri, 12 Aug 2022 23:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=TYS+x9JAOkVRDD2clrTzgM6NAKDH8h5s9UzijPQtqJo=;
 b=ZB75JLv0t4YwyC9CLf09BKg6MRVIrkfVvImzTOlMN9FnpP+wxdCyN8DWfSLVb8g8GVAb
 hQiPGcIU/ER1Unk3UrI3u8sD/NLXgoi+995AQe0GXErgLKRrLPuBgNRgGk/wnMu5BovE
 oLmSeR5nAILmvZXxgH+Wmh9KqHCP31tS5woQ0d/k09+Ei6gztjTh7+Z64MUn9iDKX56u
 I+QYKJm4cjfjDWLptNnFBxDhSPkt2Dzqwo50T0mv7qcpCqem9YX1tuhhl3NSObC3/p6A
 5DheG04z+u7Er15IIHcoq5cqVGBnFDqpIjp5Ua0+1+NVWtjQcmJ61uuMK2ENa7HxFMfB vw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hwu7egrdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 23:18:12 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27CNIBpd019673
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 23:18:11 GMT
Received: from hu-rohiiyer-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 12 Aug 2022 16:18:10 -0700
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm v2 1/2] tests/modetest: Allocate drmModeAtomicReq
 before setting properties
Date: Fri, 12 Aug 2022 16:17:56 -0700
Message-ID: <20220812231757.1454-2-quic_rohiiyer@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220812231757.1454-1-quic_rohiiyer@quicinc.com>
References: <20220812231757.1454-1-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KKC1Pp2kUPOcUhgEPwZrUTbrO4bzepSv
X-Proofpoint-ORIG-GUID: KKC1Pp2kUPOcUhgEPwZrUTbrO4bzepSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 mlxlogscore=676 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120063
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
 hoegsberg@google.com, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
2.17.1

