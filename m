Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10291A4896D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 21:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C7710E0A5;
	Thu, 27 Feb 2025 20:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mM2F3NCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D76E10E0A5;
 Thu, 27 Feb 2025 20:08:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RJRlsX005768;
 Thu, 27 Feb 2025 20:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZpI9rrBfOQS6UCxuOktsHGSqzVVpwZkqHv91xPL+uDs=; b=mM2F3NCw9RTLRElW
 gjySOu10osAWf8XnWWu0FRGer6PqVoe4+vbxbVsjy1Rf2kPXVg0XNgdtZogzIArY
 80Sz48iRfhAuYencZPBW4gvJz7s/mUw3UP9u1PhZ5bGteWxjTKZJSinrkoyLCRJ8
 jcxhWs1CaJk3hyvrRlZKun0hNEK7RLD4mfjih+u9FiQFYejy4V3mAbizCiUwjj9g
 iOPmpJOCJqlCHQIfcN4YrR6mVrKxbz/8fyklsphIbwZpHnYy2eJNABpKkRnBL6qj
 rBwxiNrzD+9njBo2uyVdpoIDQwbt35/fNPcHMrE9R2nKrzJibAaGfhMXhx1eKIbC
 s+/QiA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452be6kh0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2025 20:08:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RK8fME002521
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2025 20:08:41 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 12:08:35 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 28 Feb 2025 01:37:50 +0530
Subject: [PATCH v2 2/6] drm/msm/a6xx: Fix gpucc register block for A621
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250228-a623-gpu-support-v2-2-aea654ecc1d3@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740686902; l=2829;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=70KMrkhJRIJup3HaWYI2iranpFlA4gjazCTPcLhltEc=;
 b=rWK/R5AnN0UanbNvQsnaI46+Xk3coIdHbOGgEv+CmGYiPrzgfkMA4xx2AP/k9n4OOHpRWhaQu
 c7CnMOXf49jAaCyrfv8Bkx4/C5oBqfHbLAxr5s9B7O56Et7se1Xn+Rj
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qAtrHh657dS8EQ2qzjwL2Qm05ctlL6xv
X-Proofpoint-ORIG-GUID: qAtrHh657dS8EQ2qzjwL2Qm05ctlL6xv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=939 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270149
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

Adreno 621 has a different memory map for GPUCC block. So update
a6xx_gpu_state code to dump the correct set of gpucc registers.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  9 +++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 12 ++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 81763876e4029713994b47729a2cec7e1dd3fbb9..2c10474ccc95cf2515c6583007a9b5cc478f836c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1226,8 +1226,13 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		&a6xx_state->gmu_registers[0], false);
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
 		&a6xx_state->gmu_registers[1], true);
-	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
-		&a6xx_state->gmu_registers[2], false);
+
+	if (adreno_is_a621(adreno_gpu))
+		_a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
+			&a6xx_state->gmu_registers[2], false);
+	else
+		_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
+			&a6xx_state->gmu_registers[2], false);
 
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 31c7462ab6d7b877c55abc04b98c0a80dac87759..e545106c70be713b07904187a9e246e08499f228 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -376,6 +376,17 @@ static const u32 a6xx_gmu_gpucc_registers[] = {
 	0xbc00, 0xbc16, 0xbc20, 0xbc27,
 };
 
+static const u32 a621_gmu_gpucc_registers[] = {
+	/* GPU CC */
+	0x9800, 0x980e, 0x9c00, 0x9c0e, 0xb000, 0xb004, 0xb400, 0xb404,
+	0xb800, 0xb804, 0xbc00, 0xbc05, 0xbc14, 0xbc1d, 0xbc2a, 0xbc30,
+	0xbc32, 0xbc32, 0xbc41, 0xbc55, 0xbc66, 0xbc68, 0xbc78, 0xbc7a,
+	0xbc89, 0xbc8a, 0xbc9c, 0xbc9e, 0xbca0, 0xbca3, 0xbcb3, 0xbcb5,
+	0xbcc5, 0xbcc7, 0xbcd6, 0xbcd8, 0xbce8, 0xbce9, 0xbcf9, 0xbcfc,
+	0xbd0b, 0xbd0c, 0xbd1c, 0xbd1e, 0xbd40, 0xbd70, 0xbe00, 0xbe16,
+	0xbe20, 0xbe2d,
+};
+
 static const u32 a6xx_gmu_cx_rscc_registers[] = {
 	/* GPU RSCC */
 	0x008c, 0x008c, 0x0101, 0x0102, 0x0340, 0x0342, 0x0344, 0x0347,
@@ -390,6 +401,7 @@ static const struct a6xx_registers a6xx_gmu_reglist[] = {
 };
 
 static const struct a6xx_registers a6xx_gpucc_reg = REGS(a6xx_gmu_gpucc_registers, 0, 0);
+static const struct a6xx_registers a621_gpucc_reg = REGS(a621_gmu_gpucc_registers, 0, 0);
 
 static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu);
 static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu);

-- 
2.48.1

