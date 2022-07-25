Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC335804E1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 21:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C27930A8;
	Mon, 25 Jul 2022 19:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B41D930A8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 19:54:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PJDkkF019517;
 Mon, 25 Jul 2022 19:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=94zNAF0ALmTuk0il0kMhgmH9a6/Bo2m7L7TLI8R+ZJQ=;
 b=b0BVQtiohjmH2pIk6apfvkkhsfHEi5IkiMaCAP33v2yk7KX7mJ+5T4y+nbSqr8qEFf4R
 muHKZArfA3yDdlUheHbvHfJh+lCD2cZ0AJ6vhY2XUWXxKlEIfPLT5yr83QR/YzUIw0/3
 MqIKmXOBS2AULOpiTGT/7GE3IqULiL4qQbNOaMxGZ1fo13EsMmIBrWr26XEepJJzV8Vs
 Xlw0B/ckYQZPxNwHK3ZUglUbeZSs8pCVPGEJkA5VxkGtn2qRdLfENqVnoVx6JMVKRaRk
 JlOc+xtHbbrZY9ntPNmsU32AuYM3HYKWG5b8PyqpUhOm7GqvcHTXrlWtLUvuLt1snx7a Hg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hg8arwgyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 19:27:31 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 26PJRUkE011809
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 19:27:30 GMT
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Jul 2022 12:26:56 -0700
Received: from hu-rohiiyer-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Jul 2022 12:26:55 -0700
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm v1 1/2] tests/modetest: Allocate drmModeAtomicReq
 before setting properties
Date: Mon, 25 Jul 2022 12:26:38 -0700
Message-ID: <20220725192639.5437-2-quic_rohiiyer@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220725192639.5437-1-quic_rohiiyer@quicinc.com>
References: <20220725192639.5437-1-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FMMwQnYYbeze5VIsOAvVyPfGOw3ewvQn
X-Proofpoint-GUID: FMMwQnYYbeze5VIsOAvVyPfGOw3ewvQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_12,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=518 mlxscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250079
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
2.31.0

