Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8327EAA7ED6
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E65F10E31E;
	Sat,  3 May 2025 07:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gMIGN1JU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C41810E1E3;
 Sat,  3 May 2025 07:04:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436oNZM023870;
 Sat, 3 May 2025 07:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=wNXTy56l30Q8a3lgMmgGtL
 t0yYSOMGRLHcHn/pWd5bc=; b=gMIGN1JUbVCRnnEm7e2w0n0QAvTeGhBESdP91E
 EL9wjBvkeaz9jX6KORq5IppYrcmlgrWBuCS+rmwDueqcRgnm4kDu2DiZGem0Ypd2
 F3XTIWMqO+YxNbdK44nux9EUWaMAfBiSw5EjUYu2IL2R8hAoHseLgNif2sRV//SP
 nqZ7Wi527ozimzCXHlxXy52ojmlcW2BZGavGiIlk/UO0Qb38C+trg2pc+Z1Ded30
 CNDcFl/Hb4TokqQO4w/2fsfzpx+if1QP8LAmCKyuEUlqvGPBAxCCW9y+XF8QQfUi
 JJ+TEaFDuwh3zEeD3/vcDxEQ+zngx3xF40AAk25wetURmVkg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep0br3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 May 2025 07:04:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 543742fJ007255
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 3 May 2025 07:04:02 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 00:03:55 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v6 0/7] Support for GPU ACD feature on Adreno X1-85
Date: Sat, 3 May 2025 12:33:31 +0530
Message-ID: <20250503-gpu-acd-v6-0-ab1b52866c64@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMO/FWgC/2XQS27CMBAG4KtEXtfIM34kZtV7VF2MHQe8IKF2i
 Foh7l4HBCHKch7fP9JcWQ4phsz21ZWlMMUch74U5qNi/kj9IfDYlpqhQCVqVPxwvnDyLTceWq9
 b32kwrGyfU+ji7z3p67vUx5jHIf3dgyeYu88M88qYgAteK5JUd0pJ03z+XKKPvd/54TSHzgIE4
 FpA0MECkdXOrMR8d8LXLRAIi8QirUdNBhshnd9KuUiUb1IWKR3V0hgRrKetVE+pBQi7SFWkaEi
 HjjpFKLdSL1LBm9RFNq0jh1IbG8Ra3h4PT6F0cxwfX2eOcuBlforjvprMDjRPHsv27R8RJ8Rw5
 wEAAA==
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
 <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746255835; l=3802;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=1CmbjAttTHpAEV8eD+XeaRivlbab8bzAmUn4l1KbZYw=;
 b=Rula9ZT/PtVhpXWW6BIRUYaUiuUvEBbX4In4xAGyXKhWLAWB7SW20Yx3jQ8avqh2l+FI078LF
 bPNM4/MVV7PDKGN55nndu23IJfBxL+k0BKR3v3zIMkBFpwWZMs6EM73
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6815bfe3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=yEjwPOX5KEVw9lt7q3oA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CofCZqhSe4DVHxFSlF4NmSyIftxas04f
X-Proofpoint-GUID: CofCZqhSe4DVHxFSlF4NmSyIftxas04f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA1OSBTYWx0ZWRfX5CY+yFCpBfP+
 tiUXYj+lxYtC3nWJWedXGh2tBGRIrDvr9YALXxkRv8cXQUZkI9GUfwVq3NY67WGd/BGAMWXFV/L
 MdkMEqre0nGp1y4+Q2irP0bIakj1LtrW88B5vMuteGV9ltzFGjg/2d+IQ1SoPHaonCrrDnz8Tyl
 TCmM4ipET1VP+g5bamfnij+okbczfHkjuueTQirCt/4h4xt4Ntz9qd9dkCWX0BGISC08H904foZ
 ozch9DmQ1HO593s6YRMFqCrhJnAWfnV6R1ejjKUw48aI8Ag6+pX4eGBnAjlRC2d8VzrB+mSgxIL
 3Rk5VuZmZNIOHNJ/LcDlEnabtGTrTOiSUReujkEzpWHycnZSRP06tPDYiQNyAr8+p9kb4Pntc9w
 I+cZBZfIC2DtUXVGWoPxGDtNkRxXYTT+KYAx9svRTgf37rgSpm7kFQ6yFQDaDiZ29LY3ESgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030059
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
Changes in v6:
- Captured code-review trailers
- Link to v5: https://lore.kernel.org/r/20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com

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

