Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741679F3F3C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951BA10E829;
	Tue, 17 Dec 2024 00:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cqHNYVVi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D320B10E81B;
 Tue, 17 Dec 2024 00:43:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNrqei029617;
 Tue, 17 Dec 2024 00:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Mwv3ATiB/Jy6WvnIpFf/OU5sDXZLRv32K1XEBi2dprM=; b=cqHNYVVit11yYKMe
 Jz6/B7nX4sNYZ4kfDxpcyZteEkSnqmcgEabv2ISx1M8AZlRNyZa19CVM9vMXabWH
 1eIM/4hcMOuUIzOjx2GlNFDWx5XSKc8WnkIOnTyGW+uKzAZ296oFiETZJNqNyCWG
 c43jXXHsQmTMiGORnK2nKikhiZxOIG7lYylNS/oXqHBYt2K75YFG8v7UgrIwCITS
 2TI7zi3gIimVd2jGYf4VqvTXZiOnuQWInNh4Ong/DpQXmUZ8rEnUF1Rc63aSh3b+
 Sh2RasavPQ/NQjJYBBpQJhv1xyXlmKcSMf2S7Pd5xoG38R1h2HdNi9OGx/b/KdS3
 DetDLA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jx9dg2w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 00:43:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hVBe010642
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 00:43:31 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:31 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:32 -0800
Subject: [PATCH v4 21/25] drm/msm/dpu: Adjust writeback phys encoder setup
 for CWB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-21-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=2601;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=XFVKv5Hvr54hDGIs9NTm+MJP1fFS/Xb3CeQJDfRzUAU=;
 b=Oj9vxVyzstsx8BHnu5lMZVxzysJWdk+btxO1jiT0zRp6+WeQ2z5ovVxzrYWOaKsdno8G8Mp6J
 4sRKqOOes+fAhQBrBXIp8thHVBGt0F7LTjh+SZrmkCPoj+/6oXPFLER
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BhWujSgWFXGruNl7obHLhSfxMu9-k6CL
X-Proofpoint-ORIG-GUID: BhWujSgWFXGruNl7obHLhSfxMu9-k6CL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170004
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

Adjust QoS remapper, OT limit, and CDP parameters to account for
concurrent writeback

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 648e6b3aab84957ca0401cbbc25889f0bd64b71a..849fea580a4ca55fc4a742c6b6dee7dfcdd788e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -68,7 +68,7 @@ static void dpu_encoder_phys_wb_set_ot_limit(
 	ot_params.num = hw_wb->idx - WB_0;
 	ot_params.width = phys_enc->cached_mode.hdisplay;
 	ot_params.height = phys_enc->cached_mode.vdisplay;
-	ot_params.is_wfd = true;
+	ot_params.is_wfd = !dpu_encoder_helper_get_cwb_mask(phys_enc);
 	ot_params.frame_rate = drm_mode_vrefresh(&phys_enc->cached_mode);
 	ot_params.vbif_idx = hw_wb->caps->vbif_idx;
 	ot_params.rd = false;
@@ -111,7 +111,7 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 	qos_params.vbif_idx = hw_wb->caps->vbif_idx;
 	qos_params.xin_id = hw_wb->caps->xin_id;
 	qos_params.num = hw_wb->idx - WB_0;
-	qos_params.is_rt = false;
+	qos_params.is_rt = dpu_encoder_helper_get_cwb_mask(phys_enc);
 
 	DPU_DEBUG("[qos_remap] wb:%d vbif:%d xin:%d is_rt:%d\n",
 			qos_params.num,
@@ -174,6 +174,7 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_wb_cfg *wb_cfg;
+	u32 cdp_usage;
 
 	if (!phys_enc || !phys_enc->dpu_kms || !phys_enc->dpu_kms->catalog) {
 		DPU_ERROR("invalid encoder\n");
@@ -182,6 +183,10 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 
 	hw_wb = phys_enc->hw_wb;
 	wb_cfg = &wb_enc->wb_cfg;
+	if (dpu_encoder_helper_get_cwb_mask(phys_enc))
+		cdp_usage = DPU_PERF_CDP_USAGE_RT;
+	else
+		cdp_usage = DPU_PERF_CDP_USAGE_NRT;
 
 	wb_cfg->intf_mode = phys_enc->intf_mode;
 	wb_cfg->roi.x1 = 0;
@@ -199,7 +204,7 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 		const struct dpu_perf_cfg *perf = phys_enc->dpu_kms->catalog->perf;
 
 		hw_wb->ops.setup_cdp(hw_wb, format,
-				     perf->cdp_cfg[DPU_PERF_CDP_USAGE_NRT].wr_enable);
+				     perf->cdp_cfg[cdp_usage].wr_enable);
 	}
 
 	if (hw_wb->ops.setup_outaddress)

-- 
2.34.1

