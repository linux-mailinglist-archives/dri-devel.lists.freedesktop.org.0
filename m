Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C488280F8AE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 21:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899A310E6C2;
	Tue, 12 Dec 2023 20:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2875E10E6BF;
 Tue, 12 Dec 2023 20:54:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCJfPbc004542; Tue, 12 Dec 2023 20:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=GOvoq0RepeLVdDx+x3t76zEZBfZJ5rBOL2A468nShnU=; b=Md
 lMze6my9h/UBPPLwYArZOGgso9qmQhhgNEbeKVg4/lnADnmGA3Dl3dqFhcaAKJTt
 vB+XkQG/P0bfIf6d5kWs//ZHAZM55WORugzXh1E0grjTxUSHi6uDaeMNCiM0EJOC
 1m+dApMZXH5hccb9w4daHPhlr2vAeGjh9FGLF/tdkOVwH/xeXEOlwqgrHzADYrHl
 dvCbvI8M9mqbX6apN4V3USwQZZjAq2hO1YhVdpS3JMeJOYprBnt2SydFIm36Rqzf
 SJ6SiubfQtYMCPTGOxZIaGREZN4XStMWr/B6qjNSDNx9F04/qdQqg5iTWNMzKnzg
 Ogn2146qZkSToSERPXpw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxkx59swp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 20:53:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCKrTQu011929
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 20:53:29 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 12:53:28 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v4 13/15] drm/msm/dpu: reserve cdm blocks for writeback in
 case of YUV output
Date: Tue, 12 Dec 2023 12:52:51 -0800
Message-ID: <20231212205254.12422-14-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QMTvFepzcbNc7q14b9VHmaOrgWDBMQaU
X-Proofpoint-ORIG-GUID: QMTvFepzcbNc7q14b9VHmaOrgWDBMQaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxlogscore=700
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120161
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
Cc: quic_jesszhan@quicinc.com, seanpaul@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reserve CDM blocks for writeback if the format of the output fb
is YUV. At the moment, the reservation is done only for writeback
but can easily be extended by relaxing the checks once other
interfaces are ready to output YUV.

changes in v3:
	- squash CDM disable during encoder cleanup into this change

changes in v2:
	- use needs_cdm from topology struct
	- drop fb related checks from atomic_mode_set()

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 889e9bb42715..989ee8c0e5b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -16,6 +16,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_framebuffer.h>
 
 #include "msm_drv.h"
 #include "dpu_kms.h"
@@ -26,6 +27,7 @@
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_dsc.h"
 #include "dpu_hw_merge3d.h"
+#include "dpu_hw_cdm.h"
 #include "dpu_formats.h"
 #include "dpu_encoder_phys.h"
 #include "dpu_crtc.h"
@@ -582,6 +584,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
+	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
 	int i = 0;
 	int ret = 0;
@@ -622,6 +625,22 @@ static int dpu_encoder_virt_atomic_check(
 
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
+			topology.needs_cdm = true;
+		if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
+			crtc_state->mode_changed = true;
+		else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
+			crtc_state->mode_changed = true;
+	}
+
 	/*
 	 * Release and Allocate resources on every modeset
 	 * Dont allocate when active is false.
@@ -1062,6 +1081,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	dpu_enc->dsc_mask = dsc_mask;
 
+	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
+		struct dpu_hw_blk *hw_cdm = NULL;
+
+		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+					      drm_enc->base.id, DPU_HW_BLK_CDM,
+					      &hw_cdm, 1);
+		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
+	}
+
 	cstate = to_dpu_crtc_state(crtc_state);
 
 	for (i = 0; i < num_lm; i++) {
@@ -2050,6 +2078,15 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 					phys_enc->hw_pp->merge_3d->idx);
 	}
 
+	if (phys_enc->hw_cdm) {
+		if (phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp)
+			phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
+								PINGPONG_NONE);
+		if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
+			phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl,
+								       phys_enc->hw_cdm->idx);
+	}
+
 	if (dpu_enc->dsc) {
 		dpu_encoder_unprep_dsc(dpu_enc);
 		dpu_enc->dsc = NULL;
-- 
2.40.1

