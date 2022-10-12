Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159715FC4D4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527DD10E448;
	Wed, 12 Oct 2022 12:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D39110E433;
 Wed, 12 Oct 2022 12:02:54 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29C7xxea018443;
 Wed, 12 Oct 2022 12:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=9bAsNMvE58Ud3Jw55DfgXbMhusS0i584FKg1J2888B0=;
 b=GAJHWx/Sk5U0b1JOqZ8Ju8CQwbwHpTtyFkcEcz1tyR2MdcSQb/D3NPT5Hq8ZlcW521o6
 dpIEE+3jyoJy/2gerCvBNXVd/gmmM1uoFyAoyhm0P27cGsDqI2/AJDcr3F+RN1M/W/VT
 SzXUEaPDYfnhKykmjAY8+l1ju3zNy905rAOUpRfNSAiWKPf6ssGT0r6hYY2FdQxmMrUO
 f4TULAOsc6uuJw6kOtaYTt1c1hqZ0u8zhdhf0nfbv0NsW/AuGB8gU7cxrppzJPQp4jy8
 a/xBxG/msmLFRk+AreBiQCLhzxUuiL9W253iyrdCXc5dJbKwgyostohf17wzrM7P9lyF mA== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k5e7fjbsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 12:02:51 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 29CC2luN026864; 
 Wed, 12 Oct 2022 12:02:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3k3jpu0t1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Oct 2022 12:02:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29CC2lFx026836;
 Wed, 12 Oct 2022 12:02:47 GMT
Received: from vpolimer-linux.qualcomm.com (vpolimer-linux.qualcomm.com
 [10.204.67.235])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 29CC2lIL026831;
 Wed, 12 Oct 2022 12:02:47 +0000
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 7669B394C; Wed, 12 Oct 2022 17:32:46 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v8 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get crtc
 from connector state instead of dpu_enc
Date: Wed, 12 Oct 2022 17:32:25 +0530
Message-Id: <1665576159-3749-2-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1665576159-3749-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1665576159-3749-1-git-send-email-quic_vpolimer@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: M2TW5CBzFzjd2QtAUi9x8JBgSOq6lAd-
X-Proofpoint-GUID: M2TW5CBzFzjd2QtAUi9x8JBgSOq6lAd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_06,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=748 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120079
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update crtc retrieval from dpu_enc to dpu_enc connector state,
since new links get set as part of the dpu enc virt mode set.
The dpu_enc->crtc cache is no more needed, hence cleaning it as
part of this change.

Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 +++++++++--------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 ------
 3 files changed, 13 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 13ce321..8ec9a13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1029,7 +1029,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 		 */
 		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
 			release_bandwidth = true;
-		dpu_encoder_assign_crtc(encoder, NULL);
 	}
 
 	/* wait for frame_event_done completion */
@@ -1099,9 +1098,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
 	dpu_crtc->enabled = true;
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
-		dpu_encoder_assign_crtc(encoder, crtc);
-
 	/* Enable/restore vblank irq handling */
 	drm_crtc_vblank_on(crtc);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b..d05b353 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -132,11 +132,6 @@ enum dpu_enc_rc_states {
  * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
  *			for partial update right-only cases, such as pingpong
  *			split where virtual pingpong does not generate IRQs
- * @crtc:		Pointer to the currently assigned crtc. Normally you
- *			would use crtc->state->encoder_mask to determine the
- *			link between encoder/crtc. However in this case we need
- *			to track crtc in the disable() hook which is called
- *			_after_ encoder_mask is cleared.
  * @connector:		If a mode is set, cached pointer to the active connector
  * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
  *				all CTL paths
@@ -181,7 +176,6 @@ struct dpu_encoder_virt {
 
 	bool intfs_swapped;
 
-	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
 	struct dentry *debugfs_root;
@@ -1288,7 +1282,7 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phy_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
-	unsigned long lock_flags;
+	struct drm_crtc *crtc;
 
 	if (!drm_enc || !phy_enc)
 		return;
@@ -1296,12 +1290,13 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 	DPU_ATRACE_BEGIN("encoder_vblank_callback");
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
-	atomic_inc(&phy_enc->vsync_cnt);
+	if (!dpu_enc->connector || !dpu_enc->connector->state ||
+	    !dpu_enc->connector->state->crtc)
+		return;
 
-	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
-	if (dpu_enc->crtc)
-		dpu_crtc_vblank_callback(dpu_enc->crtc);
-	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
+	atomic_inc(&phy_enc->vsync_cnt);
+	crtc = dpu_enc->connector->state->crtc;
+	dpu_crtc_vblank_callback(crtc);
 
 	DPU_ATRACE_END("encoder_vblank_callback");
 }
@@ -1324,33 +1319,22 @@ static void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
 	DPU_ATRACE_END("encoder_underrun_callback");
 }
 
-void dpu_encoder_assign_crtc(struct drm_encoder *drm_enc, struct drm_crtc *crtc)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	unsigned long lock_flags;
-
-	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
-	/* crtc should always be cleared before re-assigning */
-	WARN_ON(crtc && dpu_enc->crtc);
-	dpu_enc->crtc = crtc;
-	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
-}
-
 void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
 					struct drm_crtc *crtc, bool enable)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	unsigned long lock_flags;
+	struct drm_crtc *new_crtc;
 	int i;
 
 	trace_dpu_enc_vblank_cb(DRMID(drm_enc), enable);
 
-	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
-	if (dpu_enc->crtc != crtc) {
-		spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
+	if (!dpu_enc->connector || !dpu_enc->connector->state)
+		return;
+
+	new_crtc = dpu_enc->connector->state->crtc;
+	if (!new_crtc || new_crtc != crtc) {
 		return;
 	}
-	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236e..eda5cd8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -40,14 +40,6 @@ struct msm_display_info {
 };
 
 /**
- * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
- * @encoder:	encoder pointer
- * @crtc:	crtc pointer
- */
-void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
-			     struct drm_crtc *crtc);
-
-/**
  * dpu_encoder_toggle_vblank_for_crtc - Toggles vblank interrupts on or off if
  *	the encoder is assigned to the given crtc
  * @encoder:	encoder pointer
-- 
2.7.4

