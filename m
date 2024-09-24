Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81237984E56
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC6A10E771;
	Tue, 24 Sep 2024 23:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="U4yvlCLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3736310E8EA;
 Tue, 24 Sep 2024 23:00:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHkiXp009424;
 Tue, 24 Sep 2024 23:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HO7Zn5vMKTE4YNPB1dauHrBcoK4oKQWdrE2ZRUmycuU=; b=U4yvlCLBcZzXBCfL
 BmEfVHfeWFfOByDi3iDjwxXxV0+XvlSZ6tTxxabys/p0HmU0hdzSjhjY0vmn9+6A
 zjFK0h9lVWqetHc1t9i5nIr9i6QGAdNnl5MPnzZN+sT12z/XodVSwh7EkNcXMyH9
 7NMUM+Qig4so9ue1P7XHqAf/7gLaDQstd7SSFL/+fwx45MgttCEfDjE4wmDUuhuC
 aF5BNC+Slk9q1W5sma5H15M+mFikpUSYL/WOAYoxoCDF4zadqHaPE/5XUDs5HHHg
 UfeABJL5sSGRgbpYfRw65pTCP/BmoQuynm5CWHdfXRhMvkV2Kfitz3O7fBYjgboA
 6aLPZA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snfh2d6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 23:00:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxwBX027335
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:58 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:34 -0700
Subject: [PATCH v2 18/22] drm/msm/dpu: Adjust writeback phys encoder setup
 for CWB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-18-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=2543;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=y1zCxAq478ukHOsLUPtao3xoSz3Hcz2csSmByXqfUYY=;
 b=WjOZV+aGNSwhq8n/KkVVkKWVjjoFUB/CstcaMR8txAsnrRCJO3J36j1RH1Bv1a8ZkgIyVHpfo
 TIYDyun0muzBKoiC4naB7TUY13TLxCfAPcsEC+RQDA33xkU1DwGxTV2
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qcm34TO40Ogyh6hmiG2yAhFvZGAoE5-U
X-Proofpoint-GUID: qcm34TO40Ogyh6hmiG2yAhFvZGAoE5-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160
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
index d0bf23d4da5f..2fe818d38118 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -68,7 +68,7 @@ static void dpu_encoder_phys_wb_set_ot_limit(
 	ot_params.num = hw_wb->idx - WB_0;
 	ot_params.width = phys_enc->cached_mode.hdisplay;
 	ot_params.height = phys_enc->cached_mode.vdisplay;
-	ot_params.is_wfd = true;
+	ot_params.is_wfd = !dpu_encoder_helper_get_cwb(phys_enc);
 	ot_params.frame_rate = drm_mode_vrefresh(&phys_enc->cached_mode);
 	ot_params.vbif_idx = hw_wb->caps->vbif_idx;
 	ot_params.rd = false;
@@ -111,7 +111,7 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 	qos_params.vbif_idx = hw_wb->caps->vbif_idx;
 	qos_params.xin_id = hw_wb->caps->xin_id;
 	qos_params.num = hw_wb->idx - WB_0;
-	qos_params.is_rt = false;
+	qos_params.is_rt = dpu_encoder_helper_get_cwb(phys_enc);
 
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
+	if (dpu_encoder_helper_get_cwb(phys_enc))
+		cdp_usage = DPU_PERF_CDP_USAGE_RT;
+	else
+		cdp_usage = DPU_PERF_CDP_USAGE_NRT;
 
 	wb_cfg->intf_mode = phys_enc->intf_mode;
 	wb_cfg->roi.x1 = 0;
@@ -199,7 +204,7 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 		const struct dpu_perf_cfg *perf = phys_enc->dpu_kms->catalog->perf;
 
 		hw_wb->ops.setup_cdp(hw_wb, wb_cfg->dest.format,
-				     perf->cdp_cfg[DPU_PERF_CDP_USAGE_NRT].wr_enable);
+				     perf->cdp_cfg[cdp_usage].wr_enable);
 	}
 
 	if (hw_wb->ops.setup_outaddress)

-- 
2.34.1

