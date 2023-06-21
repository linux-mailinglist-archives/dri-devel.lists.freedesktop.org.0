Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F4738ABD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708A710E23E;
	Wed, 21 Jun 2023 16:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EDE10E23E;
 Wed, 21 Jun 2023 16:18:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35L98COq001260; Wed, 21 Jun 2023 16:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=iqtkAwvDCbWBA5edxtCHmZqTGJT6c+wSzqnyC0bQvg0=;
 b=U2tII5OIOdZbPgmSS+ArhdDLHAZPR8cvumMqgFEhbTQk9RSxYGS9UJY3aanEo6wxFq/m
 PaYUx2Li0VOCkkifQwpSRlgxCrUvCiDo64zYqEc8fmVHRZ6mlA7LDxj3RVlhuH6OJV5p
 UY0JCrPo8n0Dl4UGJ4sT5VYTFex1uK4ogXpGyfc35Oi6v57JFESmFdA00sqWWcDpHD5P
 8WvFZNQnNBVOfYsfzJkIV511GklgOjahVwB7y6740sMUnxT7qKcggRIFiNwSyKtI8zBN
 W5HA4pKmZBijaTRPHt8+ZR9GySumFK5D+zet8tGS4hfrjtlxekyaGI5uJPzdr1dNh+lt Vg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rbwvm9325-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jun 2023 16:18:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35LGIZDS003093
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jun 2023 16:18:35 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 21 Jun 2023 09:18:34 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v4 1/2] drm/msm/dpu: retrieve DSI DSC struct through
 priv->dsi[0]
Date: Wed, 21 Jun 2023 09:18:17 -0700
Message-ID: <1687364298-29430-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1687364298-29430-1-git-send-email-quic_khsieh@quicinc.com>
References: <1687364298-29430-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OnCnWuacwiOzEYkEenrGVIel2maB-vGk
X-Proofpoint-GUID: OnCnWuacwiOzEYkEenrGVIel2maB-vGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_09,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=828 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306210137
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

Currently DSI DSC struct is populated at display setup during
system bootup. This mechanism works fine with embedded display
but not for pluggable displays as the DSC struct will become
stale once external display unplugged.

Move storing of DSI DSC struct to both atomic_mode_set() and
atomic_enable() so that same mechanism will work for both
embedded display and pluggable displays.

Changes in v4:
-- fix checkpatch.pl warning

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 30 +++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2e1873d..367d374 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -543,11 +543,24 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
 
+static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
+{
+	struct msm_drm_private *priv = drm_enc->dev->dev_private;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	int index = dpu_enc->disp_info.h_tile_instance[0];
+
+	if (dpu_enc->disp_info.intf_type == INTF_DSI)
+		return msm_dsi_get_dsc_config(priv->dsi[index]);
+
+	return NULL;
+}
+
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode,
-			struct drm_crtc_state *crtc_state)
+			struct drm_crtc_state *crtc_state,
+			struct drm_dsc_config *dsc)
 {
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
@@ -579,7 +592,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	topology.num_intf = intf_count;
 
-	if (dpu_enc->dsc) {
+	if (dsc) {
 		/*
 		 * In case of Display Stream Compression (DSC), we would use
 		 * 2 DSC encoders, 2 layer mixers and 1 interface
@@ -605,6 +618,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
+	struct drm_dsc_config *dsc;
 	int i = 0;
 	int ret = 0;
 
@@ -640,7 +654,9 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
+	dsc = dpu_encoder_get_dsc_config(drm_enc);
+
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
 
 	/*
 	 * Release and Allocate resources on every modeset
@@ -1056,6 +1072,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
+	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
+
 	/* Query resource that have been reserved in atomic check step. */
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
@@ -1187,6 +1205,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
+	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
+
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 
@@ -2109,8 +2129,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
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

