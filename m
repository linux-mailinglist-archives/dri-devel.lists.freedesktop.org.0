Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673399FEAD6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 22:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0060810E58F;
	Mon, 30 Dec 2024 21:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="etpZdrY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E5710E58E;
 Mon, 30 Dec 2024 21:11:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUF1nHv032409;
 Mon, 30 Dec 2024 21:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9OqVZGXrsL1f2mE0NUCTf/mPTVLb8uxi3ie9EV4K1gM=; b=etpZdrY39BERtVtW
 z5r6QfG9zWGeacxNHRYl9lu+z/Qy8X+WwhWsM0W54Tr+OdjuCU5NOlzyXr230c+8
 /Yy8iGTIW2DjyW0NppkP/rW643qkwgIRW33oKeyLHWEi6LFwCq2IN5DtewYgnuUk
 4u06nSTrlyKCFhVeaYoChV2GgU8KTGR17O1DXSzYS+yNhRuB/hL03OtDiKXHh36w
 vW9w+QdZrIRDWcAkRWxbV9HXTxw5YxIY2+DwSOS+C/EpX13oYvZ1Ez2PSR6A4r2e
 +IjKSrKm278k9rmXEkhD368SbQ0pMXDmqgTNBeeLpwU7HiUkrb8UIcI0F/H8BEX8
 +RS94w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uwt08r3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 21:11:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BULBS3o019137
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 21:11:28 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Dec
 2024 13:11:22 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Tue, 31 Dec 2024 02:41:02 +0530
Subject: [PATCH v3 1/6] drm/msm/adreno: Add support for ACD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241231-gpu-acd-v3-1-3ba73660e9ca@quicinc.com>
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
In-Reply-To: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
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
 <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735593076; l=7177;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=/5CyAkQIa3MhFWTUoU2MXrXA4FNIzzx3QMR9d8SAMQ0=;
 b=UeIbpWd7ouBbnoh1uGOe9xOd90BVh2meCYRIBhVPLwgQgtKa7ukyPw/5jfie/qpQ9ek9kF0gH
 J+qbBJ3raDBDpafNKS5MhH5Dp/ODFvzOQ/fzwgNiga3Qj8nW8u92TIh
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: O1NgTKlJ6e33TFwkYWNmbqdES635yCVc
X-Proofpoint-GUID: O1NgTKlJ6e33TFwkYWNmbqdES635yCVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300182
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

ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
the power consumption. In some chipsets, it is also a requirement to
support higher GPU frequencies. This patch adds support for GPU ACD by
sending necessary data to GMU and AOSS. The feature support for the
chipset is detected based on devicetree data.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 84 ++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 36 +++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 21 +++++++++
 4 files changed, 132 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 14db7376c712..2689e79aefa5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1021,14 +1021,6 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 
 	gmu->hung = false;
 
-	/* Notify AOSS about the ACD state (unimplemented for now => disable it) */
-	if (!IS_ERR(gmu->qmp)) {
-		ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}",
-			       0 /* Hardcode ACD to be disabled for now */);
-		if (ret)
-			dev_err(gmu->dev, "failed to send GPU ACD state\n");
-	}
-
 	/* Turn on the resources */
 	pm_runtime_get_sync(gmu->dev);
 
@@ -1476,6 +1468,68 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 	return a6xx_gmu_rpmh_votes_init(gmu);
 }
 
+static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	int ret, i, cmd_idx = 0;
+
+	cmd->version = 1;
+	cmd->stride = 1;
+	cmd->enable_by_level = 0;
+
+	/* Skip freq = 0 and parse acd-level for rest of the OPPs */
+	for (i = 1; i < gmu->nr_gpu_freqs; i++) {
+		struct dev_pm_opp *opp;
+		struct device_node *np;
+		unsigned long freq;
+		u32 val;
+
+		freq = gmu->gpu_freqs[i];
+		opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
+		np = dev_pm_opp_get_of_node(opp);
+
+		ret = of_property_read_u32(np, "qcom,opp-acd-level", &val);
+		of_node_put(np);
+		dev_pm_opp_put(opp);
+		if (ret == -EINVAL)
+			continue;
+		else if (ret) {
+			DRM_DEV_ERROR(gmu->dev, "Unable to read acd level for freq %lu\n", freq);
+			return ret;
+		}
+
+		cmd->enable_by_level |= BIT(i);
+		cmd->data[cmd_idx++] = val;
+	}
+
+	cmd->num_levels = cmd_idx;
+
+	/* It is a problem if qmp node is unavailable when ACD is required */
+	if (cmd->enable_by_level && IS_ERR_OR_NULL(gmu->qmp)) {
+		DRM_DEV_ERROR(gmu->dev, "Unable to send ACD state to AOSS\n");
+		return -EINVAL;
+	}
+
+	/* Otherwise, nothing to do if qmp is unavailable */
+	if (IS_ERR_OR_NULL(gmu->qmp))
+		return 0;
+
+	/*
+	 * Notify AOSS about the ACD state. AOSS is supposed to assume that ACD is disabled on
+	 * system reset. So it is harmless if we couldn't notify 'OFF' state
+	 */
+	ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}", !!cmd->enable_by_level);
+	if (ret && cmd->enable_by_level) {
+		DRM_DEV_ERROR(gmu->dev, "Failed to send ACD state to AOSS\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
 {
 	int ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
@@ -1793,7 +1847,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->qmp = qmp_get(gmu->dev);
 	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu)) {
 		ret = PTR_ERR(gmu->qmp);
-		goto remove_device_link;
+		goto detach_gxpd;
 	}
 
 	init_completion(&gmu->pd_gate);
@@ -1809,6 +1863,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Get the power levels for the GMU and GPU */
 	a6xx_gmu_pwrlevels_probe(gmu);
 
+	ret = a6xx_gmu_acd_probe(gmu);
+	if (ret)
+		goto detach_gxpd;
+
 	/* Set up the HFI queues */
 	a6xx_hfi_init(gmu);
 
@@ -1819,7 +1877,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	return 0;
 
-remove_device_link:
+detach_gxpd:
+	if (!IS_ERR_OR_NULL(gmu->gxpd))
+		dev_pm_domain_detach(gmu->gxpd, false);
+
+	if (!IS_ERR_OR_NULL(gmu->qmp))
+		qmp_put(gmu->qmp);
+
 	device_link_del(link);
 
 detach_cxpd:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index b4a79f88ccf4..87d225b08e9b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -81,6 +81,7 @@ struct a6xx_gmu {
 	int nr_gpu_freqs;
 	unsigned long gpu_freqs[16];
 	u32 gx_arc_votes[16];
+	struct a6xx_hfi_acd_table acd_table;
 
 	int nr_gmu_freqs;
 	unsigned long gmu_freqs[4];
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index cb8844ed46b2..3c183c1c6266 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -702,6 +702,38 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+#define HFI_FEATURE_ACD 12
+
+static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
+{
+	struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
+	struct a6xx_hfi_msg_feature_ctrl msg = {
+		.feature = HFI_FEATURE_ACD,
+		.enable = 1,
+		.data = 0,
+	};
+	int ret;
+
+	if (!acd_table->enable_by_level)
+		return 0;
+
+	/* Enable ACD feature at GMU */
+	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
+	if (ret) {
+		DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
+		return ret;
+	}
+
+	/* Send ACD table to GMU */
+	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &msg, sizeof(msg), NULL, 0);
+	if (ret) {
+		DRM_DEV_ERROR(gmu->dev, "Unable to ACD table (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_test msg = { 0 };
@@ -799,6 +831,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
 	if (ret)
 		return ret;
 
+	ret = a6xx_hfi_enable_acd(gmu);
+	if (ret)
+		return ret;
+
 	ret = a6xx_hfi_send_core_fw_start(gmu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 528110169398..51864c8ad0e6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -151,12 +151,33 @@ struct a6xx_hfi_msg_test {
 	u32 header;
 };
 
+#define HFI_H2F_MSG_ACD 7
+#define MAX_ACD_STRIDE 2
+
+struct a6xx_hfi_acd_table {
+	u32 header;
+	u32 version;
+	u32 enable_by_level;
+	u32 stride;
+	u32 num_levels;
+	u32 data[16 * MAX_ACD_STRIDE];
+};
+
 #define HFI_H2F_MSG_START 10
 
 struct a6xx_hfi_msg_start {
 	u32 header;
 };
 
+#define HFI_H2F_FEATURE_CTRL 11
+
+struct a6xx_hfi_msg_feature_ctrl {
+	u32 header;
+	u32 feature;
+	u32 enable;
+	u32 data;
+};
+
 #define HFI_H2F_MSG_CORE_FW_START 14
 
 struct a6xx_hfi_msg_core_fw_start {

-- 
2.45.2

