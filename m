Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D62E171F5A0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 00:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E0710E5E4;
	Thu,  1 Jun 2023 22:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB5810E5E4;
 Thu,  1 Jun 2023 22:09:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351Lp4TE006702; Thu, 1 Jun 2023 22:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=pwVImo4nMTy9r1Ctev9ZnJ0T+rJ/jSjcU5W9nfCMNYU=;
 b=n3fTkE2W4F8/avU9/iIxGSwZf4pTqZzvD0ToASiq+VcBlOGF3f3KE1V8IBQuMwfLPoma
 hr3u9f8YD6V7BCT8faqTugWO6mvGk0u4+rcGc03pADki446q1IivZYhGUse0EapN5crz
 9tJZ/QNkfOjQJK77OIWj+Y1J7lcYYLNX+4bN3d1ClyTTxnhzECWKZ3TKKlexpQMwqqih
 qz6zO3Tox1i3lh0tKY0ApGS29xyGtD5buGDMc5WHlNyAzCE44jQhxxm2kh0UobNAYo9U
 WX4mnlE0JdY/WvEhF44nv+KUkaHWpTunZsiROdQMjClsh8voFZnOtV8Soz22yXwgmL9l 0A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qy1bcg8e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 22:09:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351M92ET009662
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Jun 2023 22:09:02 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 1 Jun 2023 15:09:02 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v2 1/2] drm/msm/dpu: retrieve DSI DSC struct at atomic_check()
Date: Thu, 1 Jun 2023 15:08:50 -0700
Message-ID: <1685657331-23280-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1685657331-23280-1-git-send-email-quic_khsieh@quicinc.com>
References: <1685657331-23280-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: XmMWudV48sXaW_bs3FfAoypr1Rl9m1mm
X-Proofpoint-GUID: XmMWudV48sXaW_bs3FfAoypr1Rl9m1mm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306010191
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

At current implementation, DSI DSC struct is populated at display setup
during system bootup. This mechanism works fine with embedded display.
But will run into problem with plugin/unplug oriented external display,
such as DP, due to DSC struct will become stale once external display
unplugged. New DSC struct has to be re populated to reflect newer external
display which just plugged in. Move retrieving of DSI DSC struct to
atomic_check() so that same mechanism will work for both embedded display
and external plugin/unplug oriented display.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3b416e1..5c440a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -604,7 +604,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
-	int i = 0;
+	int index, i = 0;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -639,6 +639,10 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
+	index = dpu_enc->disp_info.h_tile_instance[0];
+        if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
+		dpu_enc->dsc = msm_dsi_get_dsc_config(priv->dsi[index]);
+
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
 
 	/*
@@ -1034,7 +1038,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	int num_lm, num_ctl, num_pp, num_dsc;
 	unsigned int dsc_mask = 0;
-	int i;
+	int index, i;
 
 	if (!drm_enc) {
 		DPU_ERROR("invalid encoder\n");
@@ -1055,6 +1059,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
+	index = dpu_enc->disp_info.h_tile_instance[0];
+        if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
+		dpu_enc->dsc = msm_dsi_get_dsc_config(priv->dsi[index]);
+
 	/* Query resource that have been reserved in atomic check step. */
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
@@ -2121,8 +2129,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 					phys_enc->hw_pp->merge_3d->idx);
 	}
 
-	if (dpu_enc->dsc)
+	if (dpu_enc->dsc) {
 		dpu_encoder_unprep_dsc(dpu_enc);
+		dpu_enc->dsc = NULL;
+	}
 
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
-- 
2.7.4

