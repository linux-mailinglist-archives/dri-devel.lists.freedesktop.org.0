Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE024A31FB7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 08:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B431310E25C;
	Wed, 12 Feb 2025 07:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cMGiXXqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2022F10E256;
 Wed, 12 Feb 2025 07:15:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C0Nsd1000355;
 Wed, 12 Feb 2025 07:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=48VtbAEtHa9FVv7oX7/yR3
 rNttch9ec7jgrW2MLFWqA=; b=cMGiXXqBFPyBDBTioXAtpLpsQd+XeS5e25NKqD
 smy+qLh4QuW+Xr7HtqgQZy+culWRVLBih1MzNlqU9RwnvB+huXSNQL+nQlabvm4R
 3ZV/e+P4mm1EdSBzLhqbhH/IB4XnfKTq4PQh0NXblssjKwIiqDPXoP3FT6hZAX1J
 lC/mcgVp7wh0w5JeQWeNB/eKlP9U3a41WtpyxG9YShE9555UGfS4K/BFY6qPXUVH
 flu3w8B8cOfYOJxmZ8AjGIWW87I+EueW1S4BeOe47m51BfKtU0R8XNsVzkiTOrtr
 moJC7Ti7v/ATCjaJDb/fHiQQUzC1RGmb9f2/5Lof+/m8kMVA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk6822-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2025 07:15:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C7FfhG005106
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2025 07:15:41 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 23:15:35 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH 0/4] Add MST support for qcs8300 platform
Date: Wed, 12 Feb 2025 15:12:23 +0800
Message-ID: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOBJrGcC/22OwW6DMAyGXwX5vFQ2JTHpae8xVVMwZs0BaBOGN
 lW8e1N67fGz5O//7pA1Rc1wqu6QdI05zlMB+qhALmH6URP7wlBjbbEmMmNevm+S2yOiaYTaYIk
 9OQvl45p0iH+77ev84qS33yJdXkfoQlYj8zjG5VRxF3wnYtGjtU4QufeBqe2Z2Cl6HtQ2A3l4u
 i4xL3P630NX2mVvm1YyaLwLR2WuG2e7zxIgcZJDmYXztm0PnA0Y6PQAAAA=
X-Change-ID: 20250211-mst_qcs8300-4c18a5179165
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739344529; l=1827;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=Jl/RExNC7L/CWPHfobcu6zP+lqJZmKi8R5mVEGE90Ws=;
 b=TPyxPGWrK3pvuk+wl8LmqunqRUy4OuHYZoitd6OuRqhbktqFyRZtmAwZWCMqLtWqccEs7y6Rf
 igITqw2rVRHDuuLqcq9swzQYIR71KkjtKk0MzHsP3vippE15DLjEsMy
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DzL6IFt04_o_IEetidlIpHe8dYBEAvBx
X-Proofpoint-ORIG-GUID: DzL6IFt04_o_IEetidlIpHe8dYBEAvBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=793 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120055
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

This series of patches introduces how to enable MST functionality on
the qcs8300 platform. The qcs8300 platform uses dpu_8_4 hardware, which
is the same as the sa8775p, but it only has one DPU. So it only has one
DP0 controller, supporting 4-stream MST. This patch only enables 
2-stream MST, using intf0 and intf3. The first and second patches are
modifications to the correspond dt-bindings, third patch is the dp 
controller driver after not reuse sm8650, fourth patch is the qcs8300
dts modification which add the clk support for stream 1.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
This patch depends on following series:
https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com/
https://lore.kernel.org/all/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com/
https://lore.kernel.org/all/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/

---
Yongxing Mou (4):
      dt-bindings: display/msm: Redocument the dp-controller for QCS8300
      dt-bindings: display/msm: Add stream 1 pixel clock for QCS8300
      drm/msm/dp: Populate the max_streams for qcs8300 mst controller
      arm64: dts: qcom: qcs8300: Add support for stream 1 clk for DP MST

 .../devicetree/bindings/display/msm/dp-controller.yaml     |  5 +----
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml | 14 ++++++++------
 arch/arm64/boot/dts/qcom/qcs8300.dtsi                      | 12 ++++++++----
 drivers/gpu/drm/msm/dp/dp_display.c                        |  8 ++++++++
 4 files changed, 25 insertions(+), 14 deletions(-)
---
base-commit: 7ba9bcc5090556c007d9a718d7176e097fe54f19
change-id: 20250211-mst_qcs8300-4c18a5179165

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>

