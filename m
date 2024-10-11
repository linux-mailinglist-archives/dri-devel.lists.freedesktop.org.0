Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B7499AD7C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 22:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C90F10E19C;
	Fri, 11 Oct 2024 20:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MgnWxUS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69E510E19C;
 Fri, 11 Oct 2024 20:30:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BBkVX0032598;
 Fri, 11 Oct 2024 20:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DsHGbttRTuxU/2VzAo+IhTKWXSK6V2xwBTuD/xvjaVc=; b=MgnWxUS5jMjIDY4C
 oz8Ki1PvRxMlyOf4Xu7KYy1mD8DFmynrxfviDgPc7nf84nwqxAH3OrQZBVypC6hF
 9KCDZqcjMu934MUGf2y2yAX2bIY9nV/0F/8P0L3vizCxIGrWLx6fsY8+Ct++0JfF
 RtFPbE4rXe4Ge309zRwyvq875Nxu8IPDCj7isFmf2AWaZqP26Sk29TMwAZGOp1kO
 Ni9g8J8+0I+bY+wC5pxxURv5AK4yOlqSTwGwbZ65ZGbPjdmfLrQc+9Q4ntafaUH2
 h8l3D3EGmsuEOJsVMSRXedC4wiraas4ghciQ/sVgq59FfFDdQYSXzCTAWlbtxqxo
 Gs4r+Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy7qj2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 20:30:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BKUIZ1024400
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 20:30:18 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 13:30:12 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Sat, 12 Oct 2024 01:59:28 +0530
Subject: [PATCH RFC 1/3] drm/msm/adreno: Add support for ACD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241012-gpu-acd-v1-1-1e5e91aa95b6@quicinc.com>
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
In-Reply-To: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728678606; l=7012;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=nUaM3nydXm+xXawjJg2+uJIKNRDcRbVCNFUNy4eJ4Ec=;
 b=D5pTZbbEzqBSh3cgwDScN1Xhdd9WyEObG3o7V38rwX3In/pGZMxU/dPLDcgImDMS/TG1HI8Od
 /3iBqrrWlGVC0pkzYbmqzEr4Hkd9dfuLHfIgSO2l1pepdo74jKcZtik
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Jm0gRz93GiKqdhw_gI20B6PU-6ogkYIS
X-Proofpoint-GUID: Jm0gRz93GiKqdhw_gI20B6PU-6ogkYIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110143
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
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 81 ++++++++++++++++++++++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 36 ++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 21 +++++++++
 4 files changed, 124 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 37927bdd6fbe..09fb3f397dbb 100644
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
 
@@ -1476,6 +1468,64 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
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
+	/* We are done here if ACD is not required for any of the OPPs */
+	if (!cmd->enable_by_level)
+		return 0;
+
+	/* Initialize qmp node to talk to AOSS */
+	gmu->qmp = qmp_get(gmu->dev);
+	if (IS_ERR(gmu->qmp)) {
+		cmd->enable_by_level = 0;
+		return dev_err_probe(gmu->dev, PTR_ERR(gmu->qmp), "Failed to initialize qmp\n");
+	}
+
+	/* Notify AOSS about the ACD state */
+	ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}", 1);
+	if (ret)
+		DRM_DEV_ERROR(gmu->dev, "failed to send GPU ACD state\n");
+
+	return 0;
+}
+
 static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
 {
 	int ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
@@ -1792,12 +1842,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto detach_cxpd;
 	}
 
-	gmu->qmp = qmp_get(gmu->dev);
-	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu)) {
-		ret = PTR_ERR(gmu->qmp);
-		goto remove_device_link;
-	}
-
 	init_completion(&gmu->pd_gate);
 	complete_all(&gmu->pd_gate);
 	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
@@ -1811,6 +1855,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Get the power levels for the GMU and GPU */
 	a6xx_gmu_pwrlevels_probe(gmu);
 
+	ret = a6xx_gmu_acd_probe(gmu);
+	if (ret)
+		goto detach_gxpd;
+
 	/* Set up the HFI queues */
 	a6xx_hfi_init(gmu);
 
@@ -1821,7 +1869,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	return 0;
 
-remove_device_link:
+detach_gxpd:
+	if (!IS_ERR_OR_NULL(gmu->gxpd))
+		dev_pm_domain_detach(gmu->gxpd, false);
+
 	device_link_del(link);
 
 detach_cxpd:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 94b6c5cab6f4..2690511149ed 100644
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
index cdb3f6e74d3e..af94e339188b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -659,6 +659,38 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
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
@@ -756,6 +788,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
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

