Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46588BC79F9
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 09:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D89510E926;
	Thu,  9 Oct 2025 07:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ms5D1jhv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BAC10E922;
 Thu,  9 Oct 2025 07:11:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996F2w1020896;
 Thu, 9 Oct 2025 07:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:in-reply-to:message-id:references:subject:to; s=
 qcppdkim1; bh=tn5voEmLyZgWkHWkT3AwrvgjofTqARmCSRFRwS/9VT4=; b=Ms
 5D1jhvMHT9VMqDvraygYxxH3mmKji/izTXkeDGE6ss9s4aY4NbQHdp3Y8xD9aVXW
 tURoYu2YEba3QY+FJbkjx3eKBMU4cWcVtxkwfQu1tsOhfBqh7bKGsCSdh+L+BYiZ
 2DsDa+dl5Qo07GbD7fyI18f/SiRMEVk7vkQk9hqr5hu5/kEUriC3WUdn2BBCxNAd
 fsmbH0heoMiU7PQ1T2GmPrOmG+UfX17Hra0K5s8jkwiyMA34pCur+X4KJzIggX2o
 cbiafgSxOfNMfb4AFmnanML3/vwLmCiL6RxsdGAsWkAL1El/dvE/eFm2aeSEMEvn
 TlgQlgkNUgBZBd6NL2xA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u1t1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 07:11:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5997BhwJ002156; 
 Thu, 9 Oct 2025 07:11:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49jvnmbgxy-1;
 Thu, 09 Oct 2025 07:11:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5997BgWE002133;
 Thu, 9 Oct 2025 07:11:42 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.147.241.247])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 5997BgIS002128;
 Thu, 09 Oct 2025 07:11:42 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
 id 98E2F5015B9; Thu,  9 Oct 2025 12:41:41 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, cros-qcom-dts-watchers@chromium.org
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: [PATCH 1/5] dt-bindings: phy: Add edp reference clock for qcom,
 edp-phy
Date: Thu,  9 Oct 2025 12:41:23 +0530
Message-Id: <20251009071127.26026-2-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251009071127.26026-1-quic_riteshk@quicinc.com>
References: <20251009071127.26026-1-quic_riteshk@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=BMW+bVQG c=1 sm=1 tr=0 ts=68e76033 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=LqggUF6c4S-tfiHryz4A:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: 4m9_CLaIW7p1JGbEn66JtnwHqVaqx4wF
X-Proofpoint-ORIG-GUID: 4m9_CLaIW7p1JGbEn66JtnwHqVaqx4wF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3V286EOkfMrI
 mbxBI6stMj9DuqMlXd7VBoEnWVaU4aBKgHoJERBQXglbDm8Cp8hl/qw9HyBR25iyYGEH97zSyeJ
 XOYAGtrLDw7Gsj0UI2cMryz740P1Ix0bUuj92+AVeULc8pA9N6zuJbHQCcpFs1c5rj8QDDuFVQn
 L8QqHSH6N0sodChRvEaDJYwlpYfUNJGdOvtjHKjC6VNmCOHuhTtuZTnVXJ0f1LGnISr1tfHDeoX
 rAxGmrfISjjFsmSlvBtMRR6YjaaRxmSdBf5z0KhI+sqyrpliS1SmfNjlwrw5ZTKNLi7WYXASE4I
 PHsDULVnCz/d1Pt/NH/2g2cmftFAG0nF6Xjz9J4Hr38TSk29X7ZvaX7yxM9QQDT7SqzrmTbcZQa
 5CHjKzXqrnak4hH9O+FezWCoJKM2KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

Add edp reference clock for qcom,edp-phy which is required
to be enabled before eDP PHY initialization.

Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index eb97181cbb95..95e9210f4163 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -37,12 +37,13 @@ properties:
       - description: PLL register block
 
   clocks:
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
     items:
       - const: aux
       - const: cfg_ahb
+      - const: edp_ref
 
   "#clock-cells":
     const: 1
@@ -75,8 +76,8 @@ examples:
             <0x0aec2600 0xa0>,
             <0x0aec2000 0x19c>;
 
-      clocks = <&dispcc 0>, <&dispcc 1>;
-      clock-names = "aux", "cfg_ahb";
+      clocks = <&dispcc 0>, <&dispcc 1>, <&dispcc 2>;
+      clock-names = "aux", "cfg_ahb", "edp_ref";
 
       #clock-cells = <1>;
       #phy-cells = <0>;
-- 
2.17.1

