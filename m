Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E887762C0E5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 15:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B4810E4B8;
	Wed, 16 Nov 2022 14:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4AD10E4B1;
 Wed, 16 Nov 2022 14:30:55 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGC1BdP019060; Wed, 16 Nov 2022 14:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=CLX+bYN8Nd/R1txa/vMcR/jga5jLVp9esL904bGPJ1U=;
 b=GNVeSIYIh66IzitW/lG7ytZuQKGxrukJA5mVt9Ap3scPx1Pl4nWWq0jTxtx/7tqyVZeS
 xdQuBu77l9+CvOqTxjWIx72WJJXi0jRh8LUmH7UFy3Tfu/Ejayo+Th/cXOfgB+WVVe6c
 S7yrZfoV/w+GZZA6hDIu+sI0jDXXtAiBmWwvPKQO9bY8ZkjMikXP9Ca33oP4GCmXIH6m
 lP7rBqhWEI+3+d9io84E87fw0taUvS7RC09d6zsbuuJmfmQXroum8bnS5Dk2msx2e8WI
 YJBLWcQP/8bDJZS/z/cfrZk3iwYEDRqncLYOyWK3GTwT/sXkaFb8qUnn5RRVPDsQA3Nt KQ== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kvyg9gat5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 14:30:51 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AGETMLx005215; 
 Wed, 16 Nov 2022 14:30:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3kt4jkxbcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 16 Nov 2022 14:30:48 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGEUl70008082;
 Wed, 16 Nov 2022 14:30:47 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 2AGEUlK3008081;
 Wed, 16 Nov 2022 14:30:47 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 9976A48A0; Wed, 16 Nov 2022 06:30:46 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] drm/msm/disp/dpu1: add color management support for
 the crtc
Date: Wed, 16 Nov 2022 06:30:40 -0800
Message-Id: <1668609040-2549-4-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
References: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BKSbHIPyWNFRQ9hPBQbJtVHLLG1_1Q0-
X-Proofpoint-ORIG-GUID: BKSbHIPyWNFRQ9hPBQbJtVHLLG1_1Q0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211160100
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

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  5 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  6 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 58 ++++++++++++++++++++++++++++-
 4 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4170fbe..ca4c3b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1571,7 +1571,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 
 /* initialize crtc */
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
-				struct drm_plane *cursor)
+				struct drm_plane *cursor, unsigned long features)
 {
 	struct drm_crtc *crtc = NULL;
 	struct dpu_crtc *dpu_crtc = NULL;
@@ -1583,6 +1583,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	crtc = &dpu_crtc->base;
 	crtc->dev = dev;
+	dpu_crtc->color_enabled = features & BIT(DPU_DSPP_PCC);
 
 	spin_lock_init(&dpu_crtc->spin_lock);
 	atomic_set(&dpu_crtc->frame_pending, 0);
@@ -1604,7 +1605,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+	drm_crtc_enable_color_mgmt(crtc, 0, dpu_crtc->color_enabled, 0);
 
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 539b68b..342f9ae 100644
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
+ * @features: color features
  * @Return: new crtc object or error
  */
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
-			       struct drm_plane *cursor);
+			       struct drm_plane *cursor, unsigned long features);
 
 /**
  * dpu_crtc_register_custom_event - api for enabling/disabling crtc event
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index be93269..7f1cfc5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -561,6 +561,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
+			struct dpu_crtc *dpu_crtc,
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology = {0};
@@ -589,7 +590,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
+	if (dpu_crtc->color_enabled) {
 		if (dpu_kms->catalog->dspp &&
 			(dpu_kms->catalog->dspp_count >= topology.num_lm))
 			topology.num_dspp = topology.num_lm;
@@ -624,6 +625,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
+	struct dpu_crtc *dpu_crtc;
 	int i = 0;
 	int ret = 0;
 
@@ -634,6 +636,7 @@ static int dpu_encoder_virt_atomic_check(
 	}
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	dpu_crtc = to_dpu_crtc(crtc_state->crtc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
 	priv = drm_enc->dev->dev_private;
@@ -659,7 +662,7 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, dpu_crtc, adj_mode);
 
 	/* Reserve dynamic resources now. */
 	if (!ret) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 4784db8..84e948d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -732,7 +732,58 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 	return rc;
 }
 
+/**
+ * _dpu_kms_populate_dspp_features - Evaluate how many dspps pairs can be facilitated
+ *                                   to enable color features for encoder and assign
+ *                                   color features preferring primary
+ * @dpu_kms:    Pointer to dpu kms structure
+ * @features:   Pointer to feature array
+ *
+ * Baring single entry, if at least 2 dspps are available in the catalogue,
+ * then color can be enabled for that crtc
+ */
+static void _dpu_kms_populate_dspp_features(struct dpu_kms *dpu_kms,
+	unsigned long *features)
+{
+	struct drm_encoder *encoder;
+	u32 enc_mask = 0;
+	u32 num_dspps = dpu_kms->catalog->dspp_count;
+
+	if (!num_dspps)
+		return;
+	else if (num_dspps > 1)
+		num_dspps /= 2;
+
+	/* Ensure all builtin displays get first allocation of color */
+	drm_for_each_encoder(encoder, dpu_kms->dev) {
+		if (!dpu_encoder_is_pluggable(encoder) &&
+			encoder->encoder_type != DRM_MODE_ENCODER_VIRTUAL) {
+			if (num_dspps) {
+				features[encoder->index] =
+					dpu_kms->catalog->dspp->features;
+				num_dspps--;
+			}
+		} else if (dpu_encoder_is_pluggable(encoder)) {
+			enc_mask |= drm_encoder_mask(encoder);
+		}
+	}
+
+	/* if color resources are exhausted return */
+	if (!num_dspps)
+		return;
+
+	/* Add color for pluggable displays after builtin on availability */
+	drm_for_each_encoder_mask(encoder, dpu_kms->dev, enc_mask) {
+		if (num_dspps) {
+			features[encoder->index] =
+				dpu_kms->catalog->dspp->features;
+			num_dspps--;
+		}
+	}
+}
+
 #define MAX_PLANES 20
+#define MAX_ENCODERS 10
 static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 {
 	struct drm_device *dev;
@@ -747,6 +798,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
 	int max_crtc_count;
+	unsigned long features[MAX_ENCODERS] = {0};
+
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 	catalog = dpu_kms->catalog;
@@ -801,10 +854,13 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	 */
 	WARN_ON(num_encoders > primary_planes_idx);
 
+	_dpu_kms_populate_dspp_features(dpu_kms, features);
+
 	/* Create one CRTC per encoder */
 	i = 0;
 	drm_for_each_encoder(encoder, dev) {
-		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
+		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i],
+				    features[encoder->index]);
 		if (IS_ERR(crtc)) {
 			ret = PTR_ERR(crtc);
 			return ret;
-- 
2.7.4

