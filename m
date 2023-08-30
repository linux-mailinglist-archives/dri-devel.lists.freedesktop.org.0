Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5678D78E2B8
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 00:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74A810E62C;
	Wed, 30 Aug 2023 22:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FF410E619;
 Wed, 30 Aug 2023 22:50:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37UMTdQq023338; Wed, 30 Aug 2023 22:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=gWIu91jXIGBdQS9kufBxZfwtzn6BhmHEvPRALCpx4uY=;
 b=nqUFfz7YoMzms5H7xcQ594uWmCDi0VojACnL3uMVxZeLbKJZBYSvSamvHNXQmshaZf4b
 GE1NI/Ydb+TCQ2ru1vvbRcjyPgORIMTzSLzYnsRWutXO9fXSAE28YvaFCz6JElHWO31B
 sC9a9b5scTQ+g63NgLgtIndmcDHB7y6lZJvBXYiXa5s6n9/EHgrWo4r5OLcJ/wIj/YWM
 0J09ywHmGAJowkUKUxU1vWiiY5GUatM97LUcwQFa2iD8HQrKLT/9Uqoy0UX8sq66y7P4
 FpHnUw3vAyxj82Yf5vzozjJU/xOjVE3z96gfWG8lKRkVCZ7Ds3bCX0nstrbkgVFTlCES cA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3st0tassvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:50:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37UMo8kZ025990
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:50:08 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 30 Aug 2023 15:50:07 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH 13/16] drm/msm/dpu: reserve cdm blocks for writeback in case
 of YUV output
Date: Wed, 30 Aug 2023 15:49:06 -0700
Message-ID: <20230830224910.8091-14-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qgr4uHKPWvLAU-fVmFjZO47rBcAqyrU5
X-Proofpoint-ORIG-GUID: qgr4uHKPWvLAU-fVmFjZO47rBcAqyrU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_18,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=625
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300207
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reserve CDM blocks for writeback if the format of the output fb
is YUV. At the moment, the reservation is done only for writeback
but can easily be extended by relaxing the checks once other
interfaces are ready to output YUV.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 35 ++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1b1e07292a9e..7a3d179bdfba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -16,6 +16,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_framebuffer.h>
 
 #include "msm_drv.h"
 #include "dpu_kms.h"
@@ -615,9 +616,11 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
+	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
 	int i = 0;
 	int ret = 0;
+	bool needs_cdm = false;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
 		DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
@@ -655,6 +658,22 @@ static int dpu_encoder_virt_atomic_check(
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
 
+	/*
+	 * Use CDM only for writeback at the moment as other interfaces cannot handle it.
+	 * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
+	 * earlier.
+	 */
+	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
+		fb = conn_state->writeback_job->fb;
+
+		if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
+			needs_cdm = true;
+		if (needs_cdm && !dpu_enc->cur_master->hw_cdm)
+			crtc_state->mode_changed = true;
+		else if (!needs_cdm && dpu_enc->cur_master->hw_cdm)
+			crtc_state->mode_changed = true;
+	}
+
 	/*
 	 * Release and Allocate resources on every modeset
 	 * Dont allocate when active is false.
@@ -664,7 +683,7 @@ static int dpu_encoder_virt_atomic_check(
 
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, topology, false);
+					drm_enc, crtc_state, topology, needs_cdm);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
@@ -1126,6 +1145,20 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	dpu_enc->dsc_mask = dsc_mask;
 
+	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
+		struct dpu_hw_blk *hw_cdm = NULL;
+		struct drm_framebuffer *fb;
+
+		fb = conn_state->writeback_job->fb;
+
+		if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb)))) {
+			dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+						      drm_enc->base.id, DPU_HW_BLK_CDM,
+						      &hw_cdm, 1);
+		}
+		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
+	}
+
 	cstate = to_dpu_crtc_state(crtc_state);
 
 	for (i = 0; i < num_lm; i++) {
-- 
2.40.1

