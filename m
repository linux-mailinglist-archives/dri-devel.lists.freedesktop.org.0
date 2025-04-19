Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C189A943D6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 16:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2E810E313;
	Sat, 19 Apr 2025 14:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nmee7I5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3017110E313;
 Sat, 19 Apr 2025 14:52:20 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53JBZKdk028081;
 Sat, 19 Apr 2025 14:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=EBAtOvxEszATcgKGwUFiV7
 zNfKnTeON4bMCD0Bkz2Fc=; b=nmee7I5XJoONvfp/fAroS+NYvJ+GzsK5S6qM6B
 FubZ0RlxPP7AflFbDNKTcrqIZm2TUAIbF75tVKphIUI/wT7Um4EFq/099Q9n54Lr
 ebzrtiWWsqnHC1vSII0/J1qWfJxwSYQm69OgwgjAsxn7sEuqLbua4P5kzYsMzv77
 jWOtMUIhWSHWvCK86vaRl9KdfJVveJ1nvEz7/ixHgOQ2ca0vo217Bkku6d9zyE+G
 dGL6GFmDN0Aa1rYJdbCbolfr/QwQO0p7+0Y9+SUdBdI3rkt3DK5LcJiNDJsIwNR+
 GlUOh8v2pgK/cebYQZ9HWP2GPoyzE53qikCqisfG1hfDv+ow==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4644kj8khm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Apr 2025 14:52:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53JEq6DS031828
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Apr 2025 14:52:06 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 19 Apr
 2025 07:51:59 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v5 0/7] Support for GPU ACD feature on Adreno X1-85
Date: Sat, 19 Apr 2025 20:21:29 +0530
Message-ID: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHK4A2gC/2XQS47CMAwG4KtUWU9Q7Dzaspp7jFi4bgpZ0EJSK
 kaIu08Kgk7F0o/vt+SbSD4Gn8S2uInop5DC0OfCfhWCD9TvvQxtrgUqNKpEI/eniyRupWNo2bb
 cWXAib5+i78L1kfSzy/UhpHGIv4/gCebuK8O9MyaQSpaGNJWdMdpV3+dL4NDzhofjHDoLUIBrA
 d76Gohq27iVmO9O+L4FCmGRmGXNaMlhpXTDn1IvEvU/qbPUDZXaOeVrpk9pXtIqUPUiTZaqIus
 76gyhXsv7823R524K4/N3oqHkZZ4fw7gtJrcBKyNj3r7/ATqMMlqtAQAA
X-Change-ID: 20240724-gpu-acd-6c1dc5dcf516
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen
 <quic_akhilpo@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, "Maya
 Matuszczyk" <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>, Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745074319; l=3663;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=sg9pbgra1EDp2sUOFgoyDWXA25pWAWN+gigIsNZMGRk=;
 b=x/63+zXe+rOwWw2/cpgK/0WKhG59uICpoQbArXyLjYoXHvWLIQ55V0oPpKpJF2L5LqP6pjdAe
 ATvYCPQoZPADHZNNlLdNytjNOPqxchmaoI0ky8j5L8aw+cbL8nX9EBW
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OsaDcJoAH5USvgtERhwSB9oY3ilzt9Ap
X-Authority-Analysis: v=2.4 cv=f5pIBPyM c=1 sm=1 tr=0 ts=6803b897 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=yEjwPOX5KEVw9lt7q3oA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OsaDcJoAH5USvgtERhwSB9oY3ilzt9Ap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-19_06,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504190122
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
Changes in v5:
- Rebased on top of 6.15-rc2
- Move 'acd data fix' mentioned in the prev revision to the correct patch
- Make module-param sysfs node read-only (Konrad)
- Apply opp-v2-qcom-adreno schema only on adreno opp table
- Link to v4: https://lore.kernel.org/r/20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com

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

 .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 27 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 96 +++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 38 ++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              | 21 +++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  4 +
 8 files changed, 269 insertions(+), 15 deletions(-)
---
base-commit: 8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd
change-id: 20240724-gpu-acd-6c1dc5dcf516

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

