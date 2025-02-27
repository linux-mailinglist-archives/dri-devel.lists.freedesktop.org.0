Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8D7A4896C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 21:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAFD10EB7B;
	Thu, 27 Feb 2025 20:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Cxr+/bnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8AC10EB78;
 Thu, 27 Feb 2025 20:08:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RHuE4A000855;
 Thu, 27 Feb 2025 20:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 es0AMuQifIyCs5kDoUmXFy/ZX+HPnP3zyD64iZ1eLIY=; b=Cxr+/bnVy/Ihbupv
 kKlLDXUVU8gGDC44Jo4tnnPGnkIKivKF0fklTEttYCdhYbLGZYKyserBNbD5pTd7
 KdagQMQzBo4k5moE8Xibx03B536jj8nl7VVMRD/oyWX9WNm/fwJA1ZP3lklc9V/1
 QIuSC4QJV12pA68zB9iTy2aluP4+J0clclm3LXG+zo3WMYuT0AlQvJM4B3kWnvkx
 4qR54A0tcY0jNvEuWZR6OygwYObiEncBiZFFBy12hg29qxji+Y1mfdP6RRNIKapZ
 pBTaNt7Ji+povYNS83V/6c8imOfBy9zg4sxRZyMTJxTXemHkaPjnQgTiDST7b9Ri
 N5wEsg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu9f1bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2025 20:08:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RK8ZUa002281
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2025 20:08:35 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 12:08:29 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 28 Feb 2025 01:37:49 +0530
Subject: [PATCH v2 1/6] drm/msm/a6xx: Split out gpucc register block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250228-a623-gpu-support-v2-1-aea654ecc1d3@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
In-Reply-To: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>, "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740686902; l=2964;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=4JeT0vDAnjhyDHa1X+lPDOlUxx46XTyU2bus38G+wnA=;
 b=Fmc7IlPBgUB65aUTUtVWCo5SdbuG+BYnRLdozxT+X3JPZOWNOlEUyA6dkgJwEfiNw/bEgW2Aj
 yDeaPbnVQnTCR88aBOCt/BwRKRD9XyqqEdQ5BcTmDBR7s/zG2Sig2Vi
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9ZEzIpo5mo8b29QYoVT6eviyE3VMLKny
X-Proofpoint-ORIG-GUID: 9ZEzIpo5mo8b29QYoVT6eviyE3VMLKny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270149
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

From: Jie Zhang <quic_jiezh@quicinc.com>

Some GPUs have different memory map for GPUCC block. So split out the
gpucc range from a6xx_gmu_cx_registers to a separate block to
accommodate those GPUs.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 8 +++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 5 +++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 0fcae53c0b140b42d9af313695ad6121c9fc5618..81763876e4029713994b47729a2cec7e1dd3fbb9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1214,18 +1214,20 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	a6xx_state->gmu_registers = state_kcalloc(a6xx_state,
-		3, sizeof(*a6xx_state->gmu_registers));
+		4, sizeof(*a6xx_state->gmu_registers));
 
 	if (!a6xx_state->gmu_registers)
 		return;
 
-	a6xx_state->nr_gmu_registers = 3;
+	a6xx_state->nr_gmu_registers = 4;
 
 	/* Get the CX GMU registers from AHB */
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[0],
 		&a6xx_state->gmu_registers[0], false);
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
 		&a6xx_state->gmu_registers[1], true);
+	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
+		&a6xx_state->gmu_registers[2], false);
 
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return;
@@ -1234,7 +1236,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 	gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
 
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
-		&a6xx_state->gmu_registers[2], false);
+		&a6xx_state->gmu_registers[3], false);
 }
 
 static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index dd4c28a8d9233d8079abaf0065317c1d613dba32..31c7462ab6d7b877c55abc04b98c0a80dac87759 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -363,6 +363,9 @@ static const u32 a6xx_gmu_cx_registers[] = {
 	0x51e0, 0x51e2, 0x51f0, 0x51f0, 0x5200, 0x5201,
 	/* GMU AO */
 	0x9300, 0x9316, 0x9400, 0x9400,
+};
+
+static const u32 a6xx_gmu_gpucc_registers[] = {
 	/* GPU CC */
 	0x9800, 0x9812, 0x9840, 0x9852, 0x9c00, 0x9c04, 0x9c07, 0x9c0b,
 	0x9c15, 0x9c1c, 0x9c1e, 0x9c2d, 0x9c3c, 0x9c3d, 0x9c3f, 0x9c40,
@@ -386,6 +389,8 @@ static const struct a6xx_registers a6xx_gmu_reglist[] = {
 	REGS(a6xx_gmu_gx_registers, 0, 0),
 };
 
+static const struct a6xx_registers a6xx_gpucc_reg = REGS(a6xx_gmu_gpucc_registers, 0, 0);
+
 static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu);
 static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu);
 

-- 
2.48.1

