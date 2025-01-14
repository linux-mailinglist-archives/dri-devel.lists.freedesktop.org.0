Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46E5A10274
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B686610E88C;
	Tue, 14 Jan 2025 08:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HQ0LC2uO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D67D10E88C;
 Tue, 14 Jan 2025 08:56:40 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E8Cftg028752;
 Tue, 14 Jan 2025 08:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=teIRJ17yWtqpF23vzj2ZO+
 pTMPI8o829wxrSPF4J0D4=; b=HQ0LC2uO/CraAoLYsLFSloqpzlqckFPozTKdmT
 qNMKiGn4CjS8wSL1MMKbj4jKVyNoJGIDTjVFgZjnX9vDIJblos5HrQViIAllYTVU
 iskUmSkm++eTntmIeypK6t8v7cslPdsqGdpyUjZ+au3b371iyAjIImqZbCXUuMCr
 8wvZTvr9osxsG1M2fnSlZPqeyoIWEodzjDJAzK5glODU8dqKYrNR2RcBy2ZTvvSF
 pUbgLZTF9upVByAb4OvY7PFiEQ8bk1lClsQQYxbwtyLch6cZpHapRjEsWppqZBlX
 xyhbUnTmx4gvcWXN65na8F9B5OeIC9gQvT2+bXdGvDWy4xPQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445m7b034r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 08:56:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E8ubcw021105
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 08:56:37 GMT
Received: from szioemm-lnxbld002.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 Jan 2025 00:56:32 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Tue, 14 Jan 2025 16:55:24 +0800
Subject: [PATCH v2] drm/msm/dpu: Add writeback support for SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250114-add-writeback-support-for-sm6150-v2-1-d707b31aad5c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHwmhmcC/42PsW7DMAxEf0XQXBWWUStNp+QDOrVbkYGWaJuIY
 6mS7CQI/O+lnaLIWJDLHYh3vJtMGAmTfBM3GXGiRH5gUT4JaTsYWlTkWMuyKKtCF0aBc+ocKWM
 N9qjSGIKPWTU+qnQyuipUDRtTbfTWILxKxoSIDV3WiK/DXUf8Hjkp3025d078IcUvUjBSfLwvy
 IXy2VESvMB+3/vzGESAbLv1jH+ioX1gWMjQ+/aRsUQzI/t4XctOes3+f69JKx5XOrNt7EsNuOM
 Slgb7bP1JHuZ5/gFWNzlDTQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736844992; l=2527;
 i=quic_fangez@quicinc.com; s=20250106; h=from:subject:message-id;
 bh=u3HNhLt63zkv/PJhmytMgy5VSVAb/fxhCMn0nl5XVBw=;
 b=tiuj5Og+ps3R2u44Etm7bbG+KmX6ZTgnQlfs5qEnGIzTOz0GeoP1fPwWobERGH0/coOhxkLFw
 YpgAXAwYfzWA2HWIJMmHU0xFfTvDWHkL1vGRxm7kXpwTMdpeZKhdfxV
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=eVr/gwhy9iaqhzLeBg7K/L0fI2IbsMNzlJnwKdnGExc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: w3nHKtugrM20uNem8H2Z6JZa2sGwui9i
X-Proofpoint-GUID: w3nHKtugrM20uNem8H2Z6JZa2sGwui9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140074
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
A followup patch to add writeback configuration for the SM6150 catalog

test passed using kms_writeback
---
Changes in v2:
- Change reg_off from 0x3b8 to 0x2bc for sm6150_mdp [Abhinav]
- Change bit_off from 24 to 16 for sm6150_mdp [Abninav]
- Change base from 0x66000 to 0x65000 for sm6150_wb [Abninav]
- Link to v1: https://lore.kernel.org/r/20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 621a2140f675fa28b3a7fcd8573e59b306cd6832..ae4cff2201bdc235a93693b3aff9dcc38c3129c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6150_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
@@ -164,6 +165,21 @@ static const struct dpu_pingpong_cfg sm6150_pp[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm6150_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
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
base-commit: f0a810be07f92801d5e489941cc0902532eeb656
change-id: 20250106-add-writeback-support-for-sm6150-ba7657196ea8

Best regards,
-- 
Fange Zhang <quic_fangez@quicinc.com>

