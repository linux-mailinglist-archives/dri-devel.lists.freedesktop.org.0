Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3526FE6EF
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 00:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CBC10E56B;
	Wed, 10 May 2023 22:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B79B10E565;
 Wed, 10 May 2023 22:08:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34ALs5kM025508; Wed, 10 May 2023 22:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=XkMrtmyUEKRdFexfmsGEwKOjh/CODN9Tj0aZrMVXXRk=;
 b=cujQg5FGFHiRiVpKopHP3OraGyk/4RX0h9Yhbxta7TfiNRAKInvhCa36Eljvss0zvTRu
 uOBbKhairtq3DaHkm/4IOex0F4DLxULVGxrOSl1sHp10WACVtFMxYhcAxvbBgJebMwMU
 e9SnCKY8GEhmPHRb3BxZXG5m30vT8V27zDc3/jEB3G++LGSxPl9iSfRCvacE6cZD7zqG
 buFroRCbDzEIspu1Izvsw2WrT7oFChxkckyS1OeogUiIoVwQ8mIZZhNp++2nBhnS4pPd
 rCv6NxxuuGDh8OVeyPPTd2ccINypPXQd7lCNmfbK/RNSeskmFfWAMf1p9HbM67wOLA+D Pg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qged2gnsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 22:08:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AM80fR032050
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 22:08:00 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 10 May 2023 15:07:59 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v6 8/8] drm/msm/dpu: tear down DSC data path when DSC disabled
Date: Wed, 10 May 2023 15:07:33 -0700
Message-ID: <1683756453-22050-9-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: C5HiiyzIGQFEkeL3WSUAWXlF6HMTbxbJ
X-Proofpoint-GUID: C5HiiyzIGQFEkeL3WSUAWXlF6HMTbxbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=884 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100182
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unset DSC_ACTIVE bit at dpu_hw_ctl_reset_intf_cfg_v1(),
dpu_encoder_unprep_dsc() and dpu_encoder_dsc_pipe_clr() functions
to tear down DSC data path if DSC data path was setup previous.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  7 +++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 94b805b..6500589 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1214,6 +1214,45 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
+static void dpu_encoder_dsc_pipe_clr(struct dpu_encoder_virt *dpu_enc,
+                                     struct dpu_hw_dsc *hw_dsc,
+                                     struct dpu_hw_pingpong *hw_pp)
+{
+	struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
+	struct dpu_hw_ctl *ctl;
+
+	ctl = cur_master->hw_ctl;
+
+	if (hw_dsc->ops.dsc_disable)
+		hw_dsc->ops.dsc_disable(hw_dsc);
+
+	if (hw_pp->ops.disable_dsc)
+		hw_pp->ops.disable_dsc(hw_pp);
+
+	if (hw_dsc->ops.dsc_bind_pingpong_blk)
+		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, PINGPONG_NONE);
+
+	if (ctl->ops.update_pending_flush_dsc)
+		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
+}
+
+static void dpu_encoder_unprep_dsc(struct dpu_encoder_virt *dpu_enc)
+{
+	/* coding only for 2LM, 2enc, 1 dsc config */
+	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	int i;
+
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		hw_pp[i] = dpu_enc->hw_pp[i];
+		hw_dsc[i] = dpu_enc->hw_dsc[i];
+
+		if (hw_pp[i] && hw_dsc[i])
+			dpu_encoder_dsc_pipe_clr(dpu_enc, hw_dsc[i], hw_pp[i]);
+	}
+
+}
+
 static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 					struct drm_atomic_state *state)
 {
@@ -2090,6 +2129,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 					phys_enc->hw_pp->merge_3d->idx);
 	}
 
+	if (dpu_enc->dsc)
+		dpu_encoder_unprep_dsc(dpu_enc);
+
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
 
@@ -2101,6 +2143,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	if (phys_enc->hw_pp->merge_3d)
 		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
 
+	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
+
 	if (ctl->ops.reset_intf_cfg)
 		ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 832a6a7..b34dac5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -577,6 +577,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 intf_active = 0;
 	u32 wb_active = 0;
 	u32 merge3d_active = 0;
+	u32 dsc_active;
 
 	/*
 	 * This API resets each portion of the CTL path namely,
@@ -606,6 +607,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 		wb_active &= ~BIT(cfg->wb - WB_0);
 		DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
 	}
+
+	if (cfg->dsc) {
+		dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
+		dsc_active &= ~cfg->dsc;
+		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
+	}
 }
 
 static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

