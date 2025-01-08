Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29281A06648
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 21:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B184C10E326;
	Wed,  8 Jan 2025 20:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ketGsGW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C597010E326;
 Wed,  8 Jan 2025 20:40:33 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508GceHs002463;
 Wed, 8 Jan 2025 20:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=MmmVej/51Kjt6A9bkZeUhE
 Uoj/xUWewiMnEyfTP8uHU=; b=ketGsGW/7g7BNx+C9fQF9thQ6l8uQn0HeyLyhH
 DaJDWazvpsnYJ/B5Vh7GcXMc+BJDy9XnB46iko7KDlM7cH9xlaPOWG0nmxG9p6Ry
 pH6iISd7minOH560ohjDS+arH8nFsIGsca9wUh3qJH5+7QLUMGStZAjNowi1WkF8
 WOrN9EZLszbb28WGGrPTUZ6dWJ+aUfCiuYFXGSzJLlNNnR5PfaE9vQ3acRkHD962
 09S6IV08ClSBn1VheJF1GF+t4Qhd4FRzOM9mEB+XEHmLxSXcZwrg/OULMM1le0jm
 XKG+X5qkEXMeg/A2ap6QSsS1j8O4jzBfT568Lq+G0V/RXw5A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441w2j8jde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 20:40:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508KeRPd020787
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2025 20:40:27 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 12:40:21 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v4 0/7] Support for GPU ACD feature on Adreno X1-85
Date: Thu, 9 Jan 2025 02:09:56 +0530
Message-ID: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJzifmcC/2WQwW7CMAyGX6XKeUGxk6aU095j2sF1XciBFpISb
 UK8+1LQYNWOv+3vs+yrShKDJLWrripKDilMYwnurVJ8oHEvOvQlKzToTINO708XTdxrz9Bz3fN
 Qg1dl+hRlCF9308dnyYeQ5il+38UZluqvwz8dGbTRjSNLzeCc9dv38yVwGHnD03GRLgQYwDUBU
 ksLRG3d+RWx7M343AUG4UViIVvGmjxuje34P2lfJNo/pC2k7aix3htpmdbk7XF8lFJNYX58QHW
 URJf+Mcy7KvsNWB3ZlenbDxphfpxzAQAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Maya Matuszczyk <maccraft123mc@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736368821; l=3340;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=mP3e4YZddAGvahjk2HZAAOT5Oq0VSXTNEvcaAQbl2gU=;
 b=z2iX7nYDuxdiuqdLRXdB70QhHyJvtPGOgchmS96OVXtTZRSrOVQ45cUgZU78qZUu/ir+jh67w
 HjPx8ibGw7qCs/l0tEWDXDdIsiVILnxDc1Ls43h09+maI+Nw+kHJfKX
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Qm6GXnLTgCEs5lfsie021mzlXrIK4uBf
X-Proofpoint-ORIG-GUID: Qm6GXnLTgCEs5lfsie021mzlXrIK4uBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080168
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

This series adds support for ACD feature for Adreno GPU which helps to
lower the power consumption on GX rail and also sometimes is a requirement
to enable higher GPU frequencies. At high level, following are the
sequences required for ACD feature:
	1. Identify the ACD level data for each regulator corner
	2. Send a message to AOSS to switch voltage plan
	3. Send a table with ACD level information to GMU during every
	gpu wake up

For (1), it is better to keep ACD level data in devicetree because this
value depends on the process node, voltage margins etc which are
chipset specific. For instance, same GPU HW IP on a different chipset
would have a different set of values. So, a new schema which extends
opp-v2 is created to add a new property called "qcom,opp-acd-level".

ACD support is dynamically detected based on the presence of
"qcom,opp-acd-level" property in GPU's opp table. Also, qmp node should be
present under GMU node in devicetree for communication with AOSS.

The devicetree patch in this series adds the acd-level data for X1-85
GPU present in Snapdragon X1 Elite chipset.

The last two devicetree patches are for Bjorn and all the rest for
Rob Clark.

---
Changes in v4:
- Send correct acd data via hfi (Neil)
- Fix dt-bindings error
- Fix IB vote for the 1.1Ghz OPP
- New patch#2 to fix the HFI timeout error seen when ACD is enabled
- Link to v3: https://lore.kernel.org/r/20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com

Changes in v3:
- Rebased on top of v6.13-rc4 since X1E doesn't boot properly with msm-next
- Update patternProperties regex (Krzysztof)
- Update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml
- Update the new dt properties' description
- Do not move qmp_get() to acd probe (Konrad)
- New patches: patch#2, #3 and #6
- Link to v2: https://lore.kernel.org/r/20241021-gpu-acd-v2-0-9c25a62803bc@quicinc.com

Changes in v2:
- Removed RFC tag for the series
- Improve documentation for the new dt bindings (Krzysztof)
- Add fallback compatible string for opp-table (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com

---
Akhil P Oommen (7):
      drm/msm/adreno: Add support for ACD
      drm/msm/a6xx: Increase HFI response timeout
      drm/msm: a6x: Rework qmp_get() error handling
      drm/msm/adreno: Add module param to disable ACD
      dt-bindings: opp: Add v2-qcom-adreno vendor bindings
      arm64: dts: qcom: x1e80100: Add ACD levels for GPU
      arm64: dts: qcom: x1e80100: Add OPPs up to Turbo L3 for GPU

 .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 27 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 96 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 38 ++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              | 21 +++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  4 +
 8 files changed, 270 insertions(+), 15 deletions(-)
---
base-commit: dbfac60febfa806abb2d384cb6441e77335d2799
change-id: 20240724-gpu-acd-6c1dc5dcf516

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

