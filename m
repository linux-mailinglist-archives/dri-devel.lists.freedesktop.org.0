Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D9860D9CE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 05:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A030C10E336;
	Wed, 26 Oct 2022 03:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4282B10E311;
 Wed, 26 Oct 2022 03:26:38 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q3JY1B026825;
 Wed, 26 Oct 2022 03:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=bWEWAH0sB2fQPU5zUpYsf4J0X01yhwE63KSa57l8S8k=;
 b=ZUZTgmK4DTQ4i70Ekrv4YaeG0Otg3JRMta8NKjfv6v+HHpWaE+KUt7rSQDtVAwH95Ui7
 C1XYmTVF+KBt9wL+qkflwPm3G5avbf5Xe8ZtqIAHfzAu8Tn9VjrGkfElawpXBpakJLsu
 ujLpmPYntVPtpPSvFbh0N1/Dg7ZNUhWnXpcU30uyiSJJLQ2Q7F3yTc2cpU5G2GkSA7V7
 y7TwalN00HrnmZFEjTFWONuFu0RxasmpCVpLG0VKR1GrQTyqdfnmyYbeZttVPfA5Ho+P
 rJPTWCHXS/l2kx131hyDdMxbY5LIkVCqqLGcSXkoMULCVX6A9xkORCPfA/CWxw97s3pQ 9w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kebr9t1ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 03:26:32 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29Q3QVlx010992
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 03:26:31 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 25 Oct 2022 20:26:30 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 00/12] drm/msm: Add SC8280XP support
Date: Tue, 25 Oct 2022 20:26:12 -0700
Message-ID: <20221026032624.30871-1-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uk3rTNuHFY8gANdHkA3D-aZJXoZR13uU
X-Proofpoint-ORIG-GUID: uk3rTNuHFY8gANdHkA3D-aZJXoZR13uU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_15,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210260016
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Kuogee
 Hsieh <quic_khsieh@quicinc.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This introduces support for the SC8280XP platform in the MDSS, DPU and
DP driver. It reworks the HDP handling in the DP driver to support
external HPD sources - such as the dp-connector, or USB Type-C altmode.

It then introduces the display clock controllers, mdss, dpu and
displayport controllers and link everything together, for both the MDSS
instances on the platform, and lastly enables EDP on the compute
reference device and 6 of the MiniDP outputs on the automotive
development platform.


The patches was previously sent separately, but submitting them together
here as they (except dts addition) goes in the same tree.

Bjorn Andersson (12):
  dt-bindings: display/msm: Add binding for SC8280XP MDSS
  drm/msm/dpu: Introduce SC8280XP
  dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
  drm/msm/dp: Stop using DP id as index in desc
  drm/msm/dp: Add DP and EDP compatibles for SC8280XP
  drm/msm/dp: Add SDM845 DisplayPort instance
  drm/msm/dp: Implement hpd_notify()
  drm/msm/dp: Don't enable HPD interrupts for edp
  drm/msm/dp: HPD handling relates to next_bridge
  arm64: dts: qcom: sc8280xp: Define some of the display blocks
  arm64: dts: qcom: sc8280xp-crd: Enable EDP
  arm64: dts: qcom: sa8295-adp: Enable DP instances

 .../bindings/display/msm/dp-controller.yaml   |   3 +
 .../bindings/display/msm/dpu-sc8280xp.yaml    | 287 ++++++
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts      | 244 ++++-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  49 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 838 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 217 +++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  18 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c           | 135 +--
 drivers/gpu/drm/msm/dp/dp_drm.c               |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.h               |   2 +
 drivers/gpu/drm/msm/msm_drv.h                 |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   2 +
 16 files changed, 1747 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml

-- 
2.37.3

