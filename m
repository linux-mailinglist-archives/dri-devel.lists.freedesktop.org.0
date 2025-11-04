Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229C4C30CC7
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B6110E107;
	Tue,  4 Nov 2025 11:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ty6OyVW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF80810E107;
 Tue,  4 Nov 2025 11:43:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A49VYGa1653876; Tue, 4 Nov 2025 11:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:date:from:in-reply-to:message-id:references:subject:to; s=
 qcppdkim1; bh=JH/Pws9CKVqlY74TXei7B8qAn6AlsMcsqN/HNTICLIg=; b=Ty
 6OyVW7J5a9N7itmVt18EQsAiBSMFdhvUeSUh7I1u+u1auU1gAAx+LFxxgVRI+VL+
 F8ybs9mGN1DD0f0ibY5QsVvcTFXRGS4Q3vSvsvjXrl9BavcGzbMLWdoPgUacwqU1
 JVqm2/yiuwkjMwc78Eol2A1Wrhuu0vVtk23JIeMBkPBOHRbWcSZTaxKdEIRvDqWo
 QGlMxmOk7MvYGjxRYW2eoTZ8WA86C2qcq7c3YIx8OnTD5J3KyBrch4H66EB8Fr7s
 Ztfa6GYbLea/CHAk65ZtaAPZHsf/bn75eRf87UssFWZo6EB/eWkM6GrbF9MCXgIM
 APSJbQBkJBcUQfvSNyig==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ex7rb05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Nov 2025 11:43:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4BhW9v013469; 
 Tue, 4 Nov 2025 11:43:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a5b9mg9yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 04 Nov 2025 11:43:32 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A4BhWbG013454;
 Tue, 4 Nov 2025 11:43:32 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.147.241.247])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 5A4BhVus013452;
 Tue, 04 Nov 2025 11:43:32 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
 id F1ADC5015B8; Tue,  4 Nov 2025 17:13:30 +0530 (+0530)
From: Ritesh Kumar <riteshk@qti.qualcomm.com>
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
Subject: [PATCH v3 1/2] dt-bindings: phy: qcom-edp: Add eDP ref clk for sa8775p
Date: Tue,  4 Nov 2025 17:13:26 +0530
Message-Id: <20251104114327.27842-2-riteshk@qti.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251104114327.27842-1-riteshk@qti.qualcomm.com>
References: <20251104114327.27842-1-riteshk@qti.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA5NiBTYWx0ZWRfX7kQLDp8c0LxJ
 nvSzuZefu7wIg+xjm6d97IKEm19Gn94eWbHpkTRAF6O7SDuvDQNEWEllgCBkOTzpKvg/kOTyEjb
 YrV4GUJ9k6qpjSZ5qmNTUO7jiYi4l5Xxqy9lXlvycFURd2C7wUf+Gbtn1BE0BXJT3vzemGPo+83
 1opycOxkeumQjnWhPXf+davccs7PLRIul1VM6XMjWIDhJA6Ed+gJ4crLU+ry553OhWn4jssXnxE
 vaPG5Y1c0SXA1D66T6PcwKqfX6pGFbEi/YUmyVthBlQROOiwYaufsbPbXdzkPx3KsIRFNAl/LTL
 YAIGJU16ewRNXXEuwQ9oJqEYOLx88eqvQYhpF+oDdCqlACjPLEjsaAsRs8VBjjaK05+h7R7EiOx
 UvQIX47Ci0m8Aj9VvrfcrYxpiDG1VA==
X-Proofpoint-ORIG-GUID: 5cMx7Oo2mMLiqlSi83gPd13b0clyCjUl
X-Proofpoint-GUID: 5cMx7Oo2mMLiqlSi83gPd13b0clyCjUl
X-Authority-Analysis: v=2.4 cv=auy/yCZV c=1 sm=1 tr=0 ts=6909e6e8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=RNLAftb8N5po9rnca2YA:9 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040096
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

From: Ritesh Kumar <quic_riteshk@quicinc.com>

When the initial contribution of eDP PHY for sa8775p was done,
eDP reference clock voting was missed. It worked fine at that
time because the clock was already enabled by the UFS PHY driver.

After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor
phy_power_on/off calls"), eDP reference clock started getting
turned off, leading to the following PHY power-on failure:

phy phy-aec2a00.phy.10: phy poweron failed --> -110

To fix this, explicit voting for the eDP reference clock is
required. This patch adds the eDP reference clock for sa8775p
eDP PHY and updates the corresponding example node.

Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
---
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index e2730a2f25cf..6c827cf9692b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -200,9 +200,11 @@ examples:
                   <0x0aec2000 0x1c8>;
 
             clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
-                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_EDP_REF_CLKREF_EN>;
             clock-names = "aux",
-                          "cfg_ahb";
+                          "cfg_ahb",
+                          "ref";
 
             #clock-cells = <1>;
             #phy-cells = <0>;
diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index bfc4d75f50ff..ba757b08b9b1 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -72,6 +72,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sa8775p-edp-phy
             - qcom,x1e80100-dp-phy
     then:
       properties:
-- 
2.17.1

