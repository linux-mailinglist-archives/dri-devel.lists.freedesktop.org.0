Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F530BD29DF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 12:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE87F10E0D2;
	Mon, 13 Oct 2025 10:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SZTfhnpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B2F10E0D2;
 Mon, 13 Oct 2025 10:48:23 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAG2kA021343;
 Mon, 13 Oct 2025 10:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:in-reply-to:message-id:references:subject:to; s=
 qcppdkim1; bh=XOr2tGOuNkrHANtey3T1QmgnJfhru2GcUTtG3g7UZKQ=; b=SZ
 TfhnpZ/H+UzklYR5ISfSH5hOZmuUqJ5h5pX5KTPdvWHNFohG6JneZjMWyHgQgfBS
 GHZRukzg/fqAC7Rdv8g/s9qD+vnGsub993uuD/BZkybu0nc2w6ITCUsKYzNhafQr
 GyxfAdYchIyz8Kq3FkfWuGoec1zd//piONisrtqGQVU5QlBWfo2N9k1QwbqA/Ie0
 +FSqEpL4dFwmuPjcgwhnosEH89NFknr8Pxpm2NgCD7rBcVDiur/k9+30OeVEw4HZ
 a/Zvz0V9gY6oyp/MHVtUkJHV0Q3xvg17LqfJ51FMQO/q7THFSAIIOxBKB50GOT6S
 kUhKLBHoPAp/juj8tb9w==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgh646jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Oct 2025 10:48:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAmAvI008955; 
 Mon, 13 Oct 2025 10:48:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49qgakrrqv-1;
 Mon, 13 Oct 2025 10:48:10 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59DAmAdY008933;
 Mon, 13 Oct 2025 10:48:10 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.147.241.247])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 59DAm9Jq008928;
 Mon, 13 Oct 2025 10:48:10 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
 id 00A7F5015A1; Mon, 13 Oct 2025 16:18:08 +0530 (+0530)
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
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for sa8775p
Date: Mon, 13 Oct 2025 16:18:04 +0530
Message-Id: <20251013104806.6599-2-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251013104806.6599-1-quic_riteshk@quicinc.com>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=H/zWAuYi c=1 sm=1 tr=0 ts=68ecd8ee cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=-1jsOscYHomb0jtPQ3oA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNiBTYWx0ZWRfXzosB/QXqv/p8
 UxoVzH5WPK8cLK85xvM7VFYizkNTXGDy0/7biZHJXkbyv81W3J3rgMndze8N2AiZp53T+NmOlwJ
 rvbeWM/9v0+5BSWZMP8sQSReO5uUsXOuQO83BYJ/L3sPZkM2sv7l7lFiW/0wCJeSBIHWA4SMS7c
 SZYYQxHvct7abznOAU/933YYEpyqK3nNiPZbC0JY5mcNxHupOJTHc7J3TS//bhHoCchFfZ+bX3g
 Jc/jkBOV5Z73dAG+/Chvd6gbVlx7Bz6BOe31Qsi7J7eg23dwkvy9uuFL6oP5qQA/QCf/qIggB0w
 98f4h730Z/nUmFgVMuxLhCVVwV7lQeb+c1aaq0EyvKlYoHTbQGo2mgttEiLlqGMpeKbRWjpvgJh
 CfkbI6Su6YeRQ9cC4RML+lYzNbZi9A==
X-Proofpoint-ORIG-GUID: tgmaQ1v-LJwvE6V5eh4VSK9UJSsZK8e0
X-Proofpoint-GUID: tgmaQ1v-LJwvE6V5eh4VSK9UJSsZK8e0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110026
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

Add edp reference clock for sa8775p edp phy.

Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index bfc4d75f50ff..b0e4015596de 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -73,6 +73,7 @@ allOf:
         compatible:
           enum:
             - qcom,x1e80100-dp-phy
+            - qcom,sa8775p-edp-phy
     then:
       properties:
         clocks:
-- 
2.17.1

