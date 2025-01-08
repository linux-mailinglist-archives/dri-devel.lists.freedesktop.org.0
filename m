Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E3BA0688A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9315810E95D;
	Wed,  8 Jan 2025 22:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="p8eI7odL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA5610E05C;
 Wed,  8 Jan 2025 22:43:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508GcghN002476;
 Wed, 8 Jan 2025 22:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=wyxLU4HGcoqrZXhlW57BYh
 i0S8Wy5db6c1Gu3PhzACI=; b=p8eI7odLoFXMjE4rbj6QEhTU2fIztMT6OzzPpS
 HEAJUUAJsDiocpMLFP0o9wLk7Q4AUo1Gb9268nNMAYFSpB9geWtynqvo9KjZdKRk
 ZCxa0zdKSuL2wLSiD+up78HrCDG9PrAXFrHbnTgduSp6T1VGvS1M2IyA/YXV8a8P
 2FVxqV0ud+544sK2PYtcVbt9zbCXEgid2QrwYRcsVy8Cu6t71Z17rKs7YrhjTxge
 dlPSP5EOYk2DHzC3fe1b22Psvh7RIPnGlyPkXK57E/lgSUoxciKP9bG82BtNJZWC
 VbdjBhvkWWvw8pC5mPql0awQXgnRk+cJWbmm3ldEAIhA0QVQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441w2j8sxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 22:43:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Mh0N0025205
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2025 22:43:00 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 14:42:54 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH RFC 0/4] Support for Adreno X1-85 Speedbin along with new
 OPP levels
Date: Thu, 9 Jan 2025 04:12:37 +0530
Message-ID: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF7/fmcC/23NTW7CMBAF4KtEXnei8Q+QZIVUqQdgi1hM7ElqC
 TvBBgsJcfca2mWX743eNw+ROXnOYmgeInHx2S+xBvnRCPtNcWbwrmahUBnscAd3yZBXZjf6CKM
 BQqvROKn7Tou6WhNP/v4Wj+Lw9SlOv2Xiy63q179L4JzprQ9NtTcosYd5vQFZB8UAAna04YkmQ
 0rv69b6aFu7hNeTf9YGMiUlNa4QS+AARVeEesM47hyrifZnHykt7ZLmlzFSZqhe8NehKdtWakh
 2K07P5w9L5rxdFQEAAA==
X-Change-ID: 20240807-x1e-speedbin-b4-a0c304d13983
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736376174; l=2562;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=r3LZagmstRy+0cAJl6J9Ympm911HbBDnPjEypiOum2o=;
 b=d96A1Q2Wxl04VIgIbFQciEsDUKBWZY5zkMDCRjF8P0Ggnf+6sRwXh5MYKgjOYNBOygnZI0ZIr
 UqWfSXoE3jOCU2vGcicVGiZMMzv2RBjXVv20LT450R/Y+XwoK18ekD4
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: S_2fqAHAsd_YVTA5HKsq_keyWzuyLNib
X-Proofpoint-ORIG-GUID: S_2fqAHAsd_YVTA5HKsq_keyWzuyLNib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=684
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080186
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

This series adds gpu speedbin support for Adreno X1-85 GPU along with
additional OPP levels. Because the higher OPPs require GPU ACD feature,
this series has dependency on the GPU ACD support series [1]. Also,
there is dependency on dimtry's series which fixes dword alignment in
nvmem driver [2]. We need a small fix up on top of that and that is
being discussed there. Hence, the RFC tag.

An interesting bit here is the non-contigous "hi" bit for speedbin fuse.
Otherwise, it is business as usual.

The device tree change has a dependency on the driver changes. So the
driver changes should be picked up first.

[1] https://lore.kernel.org/lkml/20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com/
[2] https://lore.kernel.org/linux-arm-msm/20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org/

-Akhil

---
Akhil P Oommen (4):
      drm/msm/adreno: Add speedbin support for X1-85
      dt-bindings: power: qcom,rpmpd: add Turbo L5 corner
      dt-bindings: nvmem: qfprom: Add X1E80100 compatible
      arm64: dts: qcom: x1e80100: Update GPU OPP table

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 47 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  5 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 15 ++++++-
 include/dt-bindings/power/qcom-rpmpd.h             |  1 +
 5 files changed, 68 insertions(+), 1 deletion(-)
---
base-commit: 5fcdd8fcd55d1da6fdf8deb78355a5c23ce94d39
change-id: 20240807-x1e-speedbin-b4-a0c304d13983
prerequisite-message-id: 20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com
prerequisite-patch-id: 2ac56343518c3c16229262051f52e448564f2286
prerequisite-patch-id: 1c363fb7cd864279bd97ed50a02f05f72ca00a5d
prerequisite-patch-id: 059608aac5a0a1fa11ea93a8871820f054771301
prerequisite-patch-id: de12f1b879070aca3f42973b75ed04d4d835b244
prerequisite-patch-id: 421ea499b3e901030f66f697dc0a0b718d9db20e
prerequisite-patch-id: ca6d3a3c65bd17bbcd7785e4584941a438aafcb9
prerequisite-patch-id: 017b7ba9e9bfd70719b77bf741bf0afa7f20cee0
prerequisite-message-id: 20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org
prerequisite-patch-id: c1310808de89982d41261bab69c77be2e83a6339
prerequisite-patch-id: 34a5a771be148f71d66acd4417493cc752e6d3a6
prerequisite-patch-id: 30ac1f33b3dc8979f28fdfd6303595fcfce56b84
prerequisite-patch-id: 2238546441608d9f5755b4ebc1d5ea6090c6c3bb
prerequisite-patch-id: 7a260ae7850d966e8fecd3ebc5114ac157d23c87

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

