Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B9A9763AF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D9910EAEB;
	Thu, 12 Sep 2024 07:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="afj7bR+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFA110E729;
 Thu, 12 Sep 2024 07:15:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2KwAW006559;
 Thu, 12 Sep 2024 07:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Yu8LTufLzFe
 cYEmnIupFrsmFtIwp3HsoltLYKb5/Be0=; b=afj7bR+FcUD0JaAPnwfNjJqtdWQ
 iE/537Z9OcRsbZk6mCpRPMfyWi0A8h3h9QEdOtQAmZPPdJJV1H0I4xXfo7tloZZ7
 GGi0R+6cvGLF/0oGHvG25CNOYArDt934mZ3XiB/1Y0FuLl88PMx1Z6cwHGBJHNTn
 WgE96qZsOinLfdY+tqtWjrMZ1jY4939zDACSUPXR8EyxlfJgRcxamyfEM0qd5Ht/
 VoLqgNnk0qBNMyTY19umSRBvNjORZXshJFBas9dqI1Ak7nIvqREV3iBLVA5xlKn2
 QF20meC0vJjTGlq3MgpjP+Plz/5rqzpKHCCTLPdpk+3rhRaVR+TgODCnW2Q==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6pc6rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 07:15:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48C7EtNt000427; 
 Thu, 12 Sep 2024 07:14:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41h168ypm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 07:14:55 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48C7Et2C000395;
 Thu, 12 Sep 2024 07:14:55 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mahap-hyd.qualcomm.com
 [10.213.96.84])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 48C7EsHL000391
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 07:14:55 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365311)
 id 636D9AF9; Thu, 12 Sep 2024 12:44:53 +0530 (+0530)
From: Mahadevan <quic_mahap@quicinc.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, swboyd@chromium.org, konrad.dybcio@linaro.org,
 danila@jiaxyga.com, bigfoot@classfun.cn, neil.armstrong@linaro.org,
 mailingradian@gmail.com, quic_jesszhan@quicinc.com, andersson@kernel.org
Cc: Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com,
 quic_vpolimer@quicinc.com
Subject: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for SA8775P
Date: Thu, 12 Sep 2024 12:44:34 +0530
Message-Id: <20240912071437.1708969-3-quic_mahap@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912071437.1708969-1-quic_mahap@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VX_97YLFRKkIfPEpipHsQH7tyi5Cau0S
X-Proofpoint-GUID: VX_97YLFRKkIfPEpipHsQH7tyi5Cau0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120049
X-Mailman-Approved-At: Thu, 12 Sep 2024 07:56:55 +0000
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

Document the DPU for Qualcomm SA8775P platform.

Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 .../display/msm/qcom,sa8775p-dpu.yaml         | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
new file mode 100644
index 000000000000..4e1bf5ffa2ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SA8775P Display DPU
+
+maintainers:
+  - Mahadevan <quic_mahap@quicinc.com>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8775p-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display hf axi
+      - description: Display ahb
+      - description: Display lut
+      - description: Display core
+      - description: Display vsync
+
+  clock-names:
+    items:
+      - const: bus
+      - const: iface
+      - const: lut
+      - const: core
+      - const: vsync
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
+    #include <dt-bindings/clock/qcom,gcc-sa8775p.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sa8775p.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sa8775p-dpu";
+        reg = <0 0x0ae01000 0 0x8f000>,
+              <0 0x0aeb0000 0 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+        operating-points-v2 = <&mdss0_mdp_opp_table>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+        interrupt-parent = <&mdss0>;
+        interrupts = <0>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                dpu_intf0_out: endpoint {
+                    remote-endpoint = <&mdss0_dp0_in>;
+                };
+            };
+        };
+
+        mdss0_mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-375000000 {
+                opp-hz = /bits/ 64 <375000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-500000000 {
+                opp-hz = /bits/ 64 <500000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+
+            opp-575000000 {
+                opp-hz = /bits/ 64 <575000000>;
+                required-opps = <&rpmhpd_opp_turbo>;
+            };
+
+            opp-650000000 {
+                opp-hz = /bits/ 64 <650000000>;
+                required-opps = <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
+...
-- 
2.34.1

