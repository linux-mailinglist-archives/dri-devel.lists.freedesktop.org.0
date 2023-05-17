Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F009C7074FF
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 00:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5026810E4B0;
	Wed, 17 May 2023 22:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9F010E4AE;
 Wed, 17 May 2023 22:02:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HLkHfx017085; Wed, 17 May 2023 22:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=6JKZOuiCVwR/BH7FdAp+Zu8qYrtKplisD/5HOGKBU/g=;
 b=FNJ1LrIxm8iQMH8qE6hvg8WqfqofdD/iTw1DLfFxI+U32SQHWPOentbaS8zQBph6FdkV
 IWqdCUl6d10WDiYLNKglhbiWeL4hWWk9Yco51zq8R097Rh0zB8g4ERLo02xku7HRet5V
 2CAuv/zd9BAAsnL6SdqEKeaI9wB+fpG0P84SgHK/PysIaQYX+rlMaJgaPYe3Tzyx8WC1
 1qxSdWaHTbOAB1BSfK8jyFIURjZazDgz+l81q6pwLvOsE888PFIb5V+qbfbf2/CIxeZo
 4SjROoX4LqCvlyDtutlgeUmO3JPTLWVcJaLtp/Yj2wyd+9Aln52HvQfvaXKdm84CY48V SA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn73ur0w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 22:02:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HM2Kij026903
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 22:02:20 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 15:02:19 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v10 8/8] drm/msm/dpu: tear down DSC data path when DSC disabled
Date: Wed, 17 May 2023 15:01:59 -0700
Message-ID: <1684360919-28458-9-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: p2_p7c4EJxisX1BTd_WX95nOtCYgAslW
X-Proofpoint-GUID: p2_p7c4EJxisX1BTd_WX95nOtCYgAslW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=962 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170181
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

Changes in V10:
-- pass ctl directly instead of dpu_enc to dsc_pipe_cfg()
-- move both dpu_encoder_unprep_dsc() and dpu_encoder_dsc_pipe_clr() to above phys_cleanup()

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 39 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  7 ++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1957545..ec2a55a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2036,6 +2036,41 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	}
 }
 
+static void dpu_encoder_dsc_pipe_clr(struct dpu_hw_ctl *ctl,
+				     struct dpu_hw_dsc *hw_dsc,
+				     struct dpu_hw_pingpong *hw_pp)
+{
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
+	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
+	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
+	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	int i;
+
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		hw_pp[i] = dpu_enc->hw_pp[i];
+		hw_dsc[i] = dpu_enc->hw_dsc[i];
+
+		if (hw_pp[i] && hw_dsc[i])
+			dpu_encoder_dsc_pipe_clr(ctl, hw_dsc[i], hw_pp[i]);
+	}
+}
+
 void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
@@ -2086,8 +2121,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 					phys_enc->hw_pp->merge_3d->idx);
 	}
 
+	if (dpu_enc->dsc)
+		dpu_encoder_unprep_dsc(dpu_enc);
+
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
+	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
 
 	if (phys_enc->hw_intf)
 		intf_cfg.intf = phys_enc->hw_intf->idx;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 4e132d9..2663626 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -578,6 +578,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 intf_active = 0;
 	u32 wb_active = 0;
 	u32 merge3d_active = 0;
+	u32 dsc_active;
 
 	/*
 	 * This API resets each portion of the CTL path namely,
@@ -607,6 +608,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
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
2.7.4

