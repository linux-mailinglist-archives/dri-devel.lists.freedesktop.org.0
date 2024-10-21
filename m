Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147F9A9239
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 23:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BFB10E07B;
	Mon, 21 Oct 2024 21:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OjB649pr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E3310E07B;
 Mon, 21 Oct 2024 21:46:45 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJo2vP003362;
 Mon, 21 Oct 2024 21:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=b6UEaIhFUTz3pILviabJli
 0g9/hx0mMgyZvZpox86UM=; b=OjB649prRQUuk1fSarkPhpg0zap7F9ToejXxkM
 2IO0Km6Z3d9ekaBTVtJY/zgM9ybqRoy2LPCFYQfEfRYHyndvWTdH6F4uapWHtKqf
 UIkQUWhW14teKW0iEkd97ir7ihJ23yLYIT//oB67rCagiRAnSA1xcsumcGWAjf2U
 S72Af2JLUZ+bopXFLujlxwS2gVNJHdLSt4GVJ0g3og7vboKOzVXVF7SDo3rVPIVU
 wwlOOMBWjdvUv3fGQ9MOO7n4LDfNuevP1lG9VJU+PF9L09AVSRKYWt1DWq047OOs
 FBbaJKgNjrzjfHiMYlttSPl7VWVQNGNK2xTpNp2ekBZ5G4Lw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tux4p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 21:46:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LLkbZB011890
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 21:46:37 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 14:46:31 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v2 0/4] DRM/MSM: Support for Adreno 663 GPU
Date: Tue, 22 Oct 2024 03:16:02 +0530
Message-ID: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJrLFmcC/2WNyw6CMBBFf4V0bU0ftAIr/8OwaIepzkLAFoiG8
 O9WjCt3c+7NnLuyhJEwsaZYWcSFEg19BnUoGNxcf0VOXWamhCpFLU/cWav5dZx5msdxiBP3sjw
 ZqFRlhWX5bYwY6LkrL23mG6VpiK99YZGf9Cer/mWL5IIrE9DpoDtbdufHTEA9HGG4s3b7+iPmN
 NH0HWHeJeS5v9PUFE4JV8vgpQ8OTCcMgvEQahdQQK2tDhaqfGTZ9gYHb4uo/gAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Puranam V G Tejaswi
 <quic_pvgtejas@quicinc.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729547190; l=2819;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=Q+cvWcUVWy73ICGhozfk1+GJaKl0toxokv/FzKVseGQ=;
 b=3j5NtmF7f6lB0oXWZr/+WLGh0MLIFzjMMot5BlXwYiptRFFm6LWydGyA+uApo0XTJg+CbLifL
 W9MYAclIlLDDaOnjuZaKqtJuNeh4UDK5mVM7giW8pWVYKj8TgWCp+ug
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Vbf1FCH9qbFX9ZCXJO8ZAAnYeJwEpbAn
X-Proofpoint-GUID: Vbf1FCH9qbFX9ZCXJO8ZAAnYeJwEpbAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 clxscore=1011 suspectscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210155
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

This series adds support for Adreno 663 gpu found in SA8775P chipsets.
The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
	1. gmu/zap firmwares
	2. Recommended to disable Level2 swizzling

Verified kmscube/weston/glmark2-es2 with the below Mesa change [1].
This series is rebased on top of msm-next.

Patch (1) & (2) for Rob Clark and Patch (3) & (4) for Bjorn

Devicetree changes have a runtime dependency on the Display DT change [2].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31211
[2] https://patchwork.freedesktop.org/patch/620500/?series=140216

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

-Akhil

---
Changes in v2:
- Fixed ubwc configuration (dimtry)
- Split out platform dt patch (dimtry)
- Fix formatting in the dt patch (dimtry)
- Updated Opp table to include all levels
- Updated bw IB votes to match downstream
- Rebased on top of msm-next tip
- Link to v1: https://lore.kernel.org/r/20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com

---
Puranam V G Tejaswi (4):
      drm/msm/a6xx: Add support for A663
      dt-bindings: display/msm/gmu: Add Adreno 663 GMU
      arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
      arm64: dts: qcom: sa8775p-ride: Enable Adreno 663 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  8 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 94 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 19 +++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 11 ++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 33 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
 7 files changed, 170 insertions(+), 1 deletion(-)
---
base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
change-id: 20240917-a663-gpu-support-b1475c828606

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>

