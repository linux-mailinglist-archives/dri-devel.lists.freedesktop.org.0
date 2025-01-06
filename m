Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA58DA01F4A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 07:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5169010E58F;
	Mon,  6 Jan 2025 06:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PMNhdJME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C896B10E1C8;
 Mon,  6 Jan 2025 06:40:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5062vjl2029009;
 Mon, 6 Jan 2025 06:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=n/pG5IDsP2kclGvx+4D9gO
 hKpamdzlb0gWNtuhEd1qQ=; b=PMNhdJME1SlidsU2jSEgBqr55gHXMIgQTKrzL0
 jiaSKkpbr75Qhy+zhm5xbsIMOgrBL0JsswRoVlTxzzQeowdB/eJNIGdXa/7N/3YI
 DJC3t0IXbfufPGo+c1e7URaJ1mCFQb8JB355n6rku64zLw7B1uJZb6Nj19TeEv/e
 TX0NMsZLAlsF4djrD1nFBvxd4bZ89IcULlAh39RkTZiz83soCMYBHgNwgtKRCBig
 jOz6AqeAvmYJQ/ZLtKrxUrYDfShfgIcxTM9IJqwINCI/3vnqePG24kng+anMt45R
 5/OXeXGE1OnnodpRmm+nbOOHZZLJLxbm7cZL1QAbeYIc8SBA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4406ur0d7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 06:40:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5066eBDS003923
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Jan 2025 06:40:11 GMT
Received: from szioemm-lnxbld002.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 5 Jan 2025 22:40:07 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Mon, 6 Jan 2025 14:39:09 +0800
Subject: [PATCH] drm/msm/dpu: Add writeback support for SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAI16e2cC/03OQQ6CMBAF0Ks0XdukJaGoOw/gSneGxdCO0Ii0t
 kVMCHe3gDEks/k/kzcz0oDeYKBHMlKPbxOM7VIQO0JVA12NzOiUacaznAsuGWjNBm8iVqAeLPT
 OWR/Z3XoWnlLknFVQyLwQB4mwp4lxHu/ms5y4lWv2+OrTpbiW9KQ1+ZPkR5JEkst5Jmfl2phA0
 kDq29YOvSMOomqWtfST6eqNoSBCa+utUU7TF38KDs3tAAAA
X-Change-ID: 20250106-add-writeback-support-for-sm6150-ba7657196ea8
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Li Liu
 <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>, "Fange
 Zhang" <quic_fangez@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736145606; l=2114;
 i=quic_fangez@quicinc.com; s=20250106; h=from:subject:message-id;
 bh=jfL+3oBZpQi6xfpX7Vyf73sz0ueYJR/79b3ltOPkiIs=;
 b=E/jV/kYCVXz4hkmbu8/l4IKhvaPCEFrqRaT3Z+FEXUnIoukca1YlvZHsT/8C+uKFizEg/SY9U
 PZGcgEHy/l1CH/WaXCsjDkaSmR+F4+EK5J9kuJjC7Gne2WoPL+v5ePz
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=eVr/gwhy9iaqhzLeBg7K/L0fI2IbsMNzlJnwKdnGExc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fd7qHdiWw97EhH8ZtWy_pAE3w2AX6xXV
X-Proofpoint-ORIG-GUID: fd7qHdiWw97EhH8ZtWy_pAE3w2AX6xXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=809
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060057
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

On the SM6150 platform there is WB_2 block. Add it to the SM6150 catalog.

Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
A followup patch to add writeback configuration for the SM6150 catalog
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 621a2140f675fa28b3a7fcd8573e59b306cd6832..6d32deead77728264b6de6d5fd2843a81afdf355 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6150_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 	},
 };
 
@@ -164,6 +165,21 @@ static const struct dpu_pingpong_cfg sm6150_pp[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm6150_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x66000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats_rgb,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 2160,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm6150_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -244,6 +260,8 @@ const struct dpu_mdss_cfg dpu_sm6150_cfg = {
 	.dspp = sm6150_dspp,
 	.pingpong_count = ARRAY_SIZE(sm6150_pp),
 	.pingpong = sm6150_pp,
+	.wb_count = ARRAY_SIZE(sm6150_wb),
+	.wb = sm6150_wb,
 	.intf_count = ARRAY_SIZE(sm6150_intf),
 	.intf = sm6150_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250106-add-writeback-support-for-sm6150-ba7657196ea8

Best regards,
-- 
Fange Zhang <quic_fangez@quicinc.com>

