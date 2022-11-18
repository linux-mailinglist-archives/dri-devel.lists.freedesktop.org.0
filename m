Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5083F62F468
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 13:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC0010E713;
	Fri, 18 Nov 2022 12:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2A110E70D;
 Fri, 18 Nov 2022 12:17:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AIAedc4017791; Fri, 18 Nov 2022 12:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=zs+iIabo+a0n5S83frFjyaZWLUp9v9JSbLtqjNPV9Jg=;
 b=L8UT1bA3kBNDMVqQA+iAbVyWcegoXzVwf9hF8JAzik+y3isQayOYVp6SM/KY4w0+wBvC
 sRbYAnHex0W2G6++E/912ufZRaubiAecfSaQIvcfQ2dUAXdVMbHR11hnfJL/E3HlJ+sY
 k1fFlKDbVxIJ9ZoBbGUY9KYcXRLOveH1ev9ivD+TZfnlKodkNRoceN/R9cSuhl+vXxFV
 J8GcMcaM0P609AnLLk1SsLoVPYDhoPMUiCVZitXz1y4hNrBJkOynScXo8AhpJejRNtpW
 GhsG5f/51vAJO1B10swSyOZjtxXFtmOvLUQTm8vjR2Z7Bu8rwqjpA+YDKY/1K0aFQuQ7 Ig== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0s5hktg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 12:16:56 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AICGqRZ013720; 
 Fri, 18 Nov 2022 12:16:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3kt4jkkc6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Nov 2022 12:16:52 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AICGphF013703;
 Fri, 18 Nov 2022 12:16:52 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2AICGpQO013698;
 Fri, 18 Nov 2022 12:16:52 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 8B6D32F35; Fri, 18 Nov 2022 04:16:51 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] drm/msm/disp/dpu1: add color management support for
 the crtc
Date: Fri, 18 Nov 2022 04:16:47 -0800
Message-Id: <1668773807-19598-4-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668773807-19598-1-git-send-email-quic_kalyant@quicinc.com>
References: <1668773807-19598-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YjSIv20B4Ygfz9VaVgcf8W83ppuEq32u
X-Proofpoint-ORIG-GUID: YjSIv20B4Ygfz9VaVgcf8W83ppuEq32u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180073
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 dianders@chromium.org, quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add color management support for the crtc provided there are
enough dspps that can be allocated from the catalog.

Changes in v1:
- cache color enabled state in the dpu crtc obj (Dmitry)
- simplify dspp allocation while creating crtc (Dmitry)
- register for color when crtc is created (Dmitry)

Changes in v2:
- avoid primary encoders in the documentation (Dmitry)

Changes in v3:
- add ctm for builtin encoders (Dmitry)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 7 ++++++-
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4170fbe..6cacaaf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1571,7 +1571,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 
 /* initialize crtc */
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
-				struct drm_plane *cursor)
+				struct drm_plane *cursor, bool ctm)
 {
 	struct drm_crtc *crtc = NULL;
 	struct dpu_crtc *dpu_crtc = NULL;
@@ -1583,6 +1583,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	crtc = &dpu_crtc->base;
 	crtc->dev = dev;
+	dpu_crtc->color_enabled = ctm;
 
 	spin_lock_init(&dpu_crtc->spin_lock);
 	atomic_set(&dpu_crtc->frame_pending, 0);
@@ -1604,7 +1605,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+	drm_crtc_enable_color_mgmt(crtc, 0, dpu_crtc->color_enabled, 0);
 
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 539b68b..1ec9517 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -136,6 +136,7 @@ struct dpu_crtc_frame_event {
  * @enabled       : whether the DPU CRTC is currently enabled. updated in the
  *                  commit-thread, not state-swap time which is earlier, so
  *                  safe to make decisions on during VBLANK on/off work
+ * @color_enabled : whether crtc supports color management
  * @feature_list  : list of color processing features supported on a crtc
  * @active_list   : list of color processing features are active
  * @dirty_list    : list of color processing features are dirty
@@ -164,7 +165,7 @@ struct dpu_crtc {
 	u64 play_count;
 	ktime_t vblank_cb_time;
 	bool enabled;
-
+	bool color_enabled;
 	struct list_head feature_list;
 	struct list_head active_list;
 	struct list_head dirty_list;
@@ -269,10 +270,11 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc);
  * @dev: dpu device
  * @plane: base plane
  * @cursor: cursor plane
+ * @ctm: ctm flag
  * @Return: new crtc object or error
  */
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
-			       struct drm_plane *cursor);
+			       struct drm_plane *cursor, bool ctm);
 
 /**
  * dpu_crtc_register_custom_event - api for enabling/disabling crtc event
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 574f2b0..102612c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -572,6 +572,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
+			struct dpu_crtc *dpu_crtc,
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology = {0};
@@ -600,7 +601,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
+	if (dpu_crtc->color_enabled) {
 		if (dpu_kms->catalog->dspp &&
 			(dpu_kms->catalog->dspp_count >= topology.num_lm))
 			topology.num_dspp = topology.num_lm;
@@ -635,6 +636,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
+	struct dpu_crtc *dpu_crtc;
 	int i = 0;
 	int ret = 0;
 
@@ -645,6 +647,7 @@ static int dpu_encoder_virt_atomic_check(
 	}
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	dpu_crtc = to_dpu_crtc(crtc_state->crtc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
 	priv = drm_enc->dev->dev_private;
@@ -670,7 +673,7 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, dpu_crtc, adj_mode);
 
 	/* Reserve dynamic resources now. */
 	if (!ret) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 4784db8..b57e261 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -747,6 +747,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
 	int max_crtc_count;
+
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 	catalog = dpu_kms->catalog;
@@ -804,7 +805,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	/* Create one CRTC per encoder */
 	i = 0;
 	drm_for_each_encoder(encoder, dev) {
-		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
+		bool _ctm = false;
+		if (catalog->dspp_count && dpu_encoder_is_builtin(encoder) &&
+			encoder->encoder_type != DRM_MODE_ENCODER_VIRTUAL)
+			_ctm = true;
+		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i], _ctm);
 		if (IS_ERR(crtc)) {
 			ret = PTR_ERR(crtc);
 			return ret;
-- 
2.7.4

