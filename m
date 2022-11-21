Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8DB631C76
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 10:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9947810E18A;
	Mon, 21 Nov 2022 09:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFA010E184;
 Mon, 21 Nov 2022 09:08:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AL8OpoL031133; Mon, 21 Nov 2022 09:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=1W1f8UH9EqIeBJHNQLHw8+dLhtc7tyzQLYpRIB2TrhE=;
 b=gtJqlXuWt6/bIyNlD9RDZINPErMmqOsY/mblppoPyzwPmjYTKTF9KlVij3dJl8XUz47E
 vlgBRYsIi/6FjPHQMjIWEM/zjYn2B6AOCXhNHR/zH7leshMVRlQ1H+gY5qPug62jV1E7
 /Vf6jcvHq4bH4BdZofFxkiUhzYliRXeqZ8ioTrdYQsOIu2nvBJ0Q9wwLyPxc+otKtHjo
 usjYZTOLm2gYE4Q9Y4wjSzCmZsfI7SQXvISEzJEuc141aecLOxk7abGXUrmWtWv2X1MC
 CyzMNmqeH/k1tvlmTaYCPLGEVu+HeyRmZapz2eeX+MQv73azJ1iuapptCGGtCiyG24Ch qw== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxrf0v07e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 09:08:27 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AL98LMm032757; 
 Mon, 21 Nov 2022 09:08:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3kxr7k3t86-1;
 Mon, 21 Nov 2022 09:08:24 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AL98OKZ000310;
 Mon, 21 Nov 2022 09:08:24 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2AL98Nmp000309;
 Mon, 21 Nov 2022 09:08:24 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id B1F28349C; Mon, 21 Nov 2022 01:08:22 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v4 3/3] drm/msm/disp/dpu1: add color management support for
 the crtc
Date: Mon, 21 Nov 2022 01:08:15 -0800
Message-Id: <1669021695-4397-4-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
References: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RpsPe8h3JH9O6sJxPTI8EVIBViL9TLt5
X-Proofpoint-ORIG-GUID: RpsPe8h3JH9O6sJxPTI8EVIBViL9TLt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210071
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

Changes in v4:
- few nits (Dmitry)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 6 +++++-
 4 files changed, 17 insertions(+), 6 deletions(-)

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
index 539b68b..792b4f0 100644
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
@@ -164,6 +165,7 @@ struct dpu_crtc {
 	u64 play_count;
 	ktime_t vblank_cb_time;
 	bool enabled;
+	bool color_enabled;
 
 	struct list_head feature_list;
 	struct list_head active_list;
@@ -269,10 +271,11 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc);
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
index 96db7fb..a585036 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -571,6 +571,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
+			struct dpu_crtc *dpu_crtc,
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology = {0};
@@ -599,7 +600,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
+	if (dpu_crtc->color_enabled) {
 		if (dpu_kms->catalog->dspp &&
 			(dpu_kms->catalog->dspp_count >= topology.num_lm))
 			topology.num_dspp = topology.num_lm;
@@ -634,6 +635,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
+	struct dpu_crtc *dpu_crtc;
 	int i = 0;
 	int ret = 0;
 
@@ -644,6 +646,7 @@ static int dpu_encoder_virt_atomic_check(
 	}
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	dpu_crtc = to_dpu_crtc(crtc_state->crtc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
 	priv = drm_enc->dev->dev_private;
@@ -669,7 +672,7 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, dpu_crtc, adj_mode);
 
 	/* Reserve dynamic resources now. */
 	if (!ret) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d967eef..53e0163 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -805,7 +805,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	/* Create one CRTC per encoder */
 	i = 0;
 	drm_for_each_encoder(encoder, dev) {
-		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
+		bool _ctm = false;
+
+		if (catalog->dspp_count && dpu_encoder_is_builtin(encoder))
+			_ctm = true;
+		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i], _ctm);
 		if (IS_ERR(crtc)) {
 			ret = PTR_ERR(crtc);
 			return ret;
-- 
2.7.4

