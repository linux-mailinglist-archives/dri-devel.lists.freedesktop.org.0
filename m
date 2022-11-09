Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C997D622B59
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 13:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13C210E5BE;
	Wed,  9 Nov 2022 12:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DD310E5B6;
 Wed,  9 Nov 2022 12:17:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9BAWvl030615; Wed, 9 Nov 2022 12:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=B7j8GdSbRe5nhKt59DsbHmAwDLpL1UFr5MzKrR0Nb5E=;
 b=UlnhgFRJUmhW6ZZYOejXnfPIYC/YU0FeBxsOCMnpxE9TgN0E1FudJ/HaWaKAPu72XNSa
 nj3XPx6tBEk+P4Hg2JyztgbhP5SFft5LwjP+dv38ZDqa0+ozjPKo+ocFkVhpC/WmeV8b
 6UT4RmLm2J3iwGnrYYMCxwE4U56KvFLO+hbcdYoAJVT7B68THRTW4PKkzThzK+dxB5ot
 5eUA14s2hsMi24rn6jiXjwI9pFemXkzma0oOD2TGPkYtHbCgljooHhW3aFX9pcUhZ2/e
 UZNGh+sdBXvA8APMGzhSUrwdRn9khKKRS/FFJA68lEFBWuFcuUYlFZvRxNK8atMxhXD2 8w== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kr68m10hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 12:17:06 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A9CGxg8008059; 
 Wed, 9 Nov 2022 12:17:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3kngwkn0xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 09 Nov 2022 12:17:03 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A9CH2HK008537;
 Wed, 9 Nov 2022 12:17:02 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 2A9CH2bP008458;
 Wed, 09 Nov 2022 12:17:02 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 3421348B5; Wed,  9 Nov 2022 04:17:01 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 4/4] drm/msm/disp/dpu1: add color management support for the
 crtc
Date: Wed,  9 Nov 2022 04:16:46 -0800
Message-Id: <1667996206-4153-4-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
References: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5K9bfaRKuKhIqAqDfr8IRXCIMFwFgale
X-Proofpoint-ORIG-GUID: 5K9bfaRKuKhIqAqDfr8IRXCIMFwFgale
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_05,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 mlxlogscore=818 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090094
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
enough dspps that can be allocated from the catalogue

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 ++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  6 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 53 +++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4170fbe..6bd3a64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -18,9 +18,11 @@
 #include <drm/drm_flip_work.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_mode_object.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
+#include "../../../drm_crtc_internal.h"
 
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
@@ -553,6 +555,17 @@ static void _dpu_crtc_complete_flip(struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
+bool dpu_crtc_has_color_enabled(struct drm_crtc *crtc)
+{
+	u32 ctm_id = crtc->dev->mode_config.ctm_property->base.id;
+	u32 gamma_id = crtc->dev->mode_config.gamma_lut_property->base.id;
+	u32 degamma_id = crtc->dev->mode_config.degamma_lut_property->base.id;
+
+	return !!(drm_mode_obj_find_prop_id(&crtc->base, ctm_id) ||
+		   drm_mode_obj_find_prop_id(&crtc->base, gamma_id) ||
+		   drm_mode_obj_find_prop_id(&crtc->base, degamma_id));
+}
+
 enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
@@ -1604,8 +1617,6 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
-
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 539b68b..8bac395 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -300,4 +300,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 	return crtc && crtc->state ? RT_CLIENT : NRT_CLIENT;
 }
 
+/**
+ * dpu_crtc_has_color_enabled - check if the crtc has color management enabled
+ * @crtc: Pointer to drm crtc object
+ */
+bool dpu_crtc_has_color_enabled(struct drm_crtc *crtc);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4c56a16..ebc3f25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
-			struct drm_display_mode *mode)
+			struct drm_display_mode *mode,
+			struct drm_crtc *crtc)
 {
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
@@ -573,11 +574,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
-		if (dpu_kms->catalog->dspp &&
-			(dpu_kms->catalog->dspp_count >= topology.num_lm))
+	if (dpu_crtc_has_color_enabled(crtc) &&
+		(dpu_kms->catalog->dspp_count >= topology.num_lm))
 			topology.num_dspp = topology.num_lm;
-	}
 
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
@@ -643,7 +642,7 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state->crtc);
 
 	/* Reserve dynamic resources now. */
 	if (!ret) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 552a89c..47a73fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -13,6 +13,7 @@
 #include <linux/dma-buf.h>
 #include <linux/of_irq.h>
 #include <linux/pm_opp.h>
+#include <linux/bitops.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
@@ -537,6 +538,44 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 		dpu_kms_wait_for_commit_done(kms, crtc);
 }
 
+/**
+ * _dpu_kms_possible_dspps - Evaluate how many dspps pairs can be facilitated
+                             to enable color features for crtcs.
+ * @dpu_kms:    Pointer to dpu kms structure
+ * Returns:     count of dspp pairs
+ *
+ * Baring single entry, if atleast 2 dspps are available in the catalogue,
+ * then color can be enabled for that crtc
+ */
+static inline u32 _dpu_kms_possible_dspps(struct dpu_kms *dpu_kms)
+{
+
+	u32 num_dspps = dpu_kms->catalog->dspp_count;
+
+	if (num_dspps > 1)
+		num_dspps =
+			!(num_dspps % 2) ? num_dspps / 2 : (num_dspps - 1) / 2;
+
+	return num_dspps;
+}
+
+static u32 _dpu_kms_attach_color(struct drm_device *dev, u32 enc_mask,
+						u32 num_dspps)
+{
+	struct drm_encoder *encoder;
+	struct drm_crtc *crtc;
+
+	drm_for_each_encoder_mask(encoder, dev, enc_mask) {
+		crtc = drm_crtc_from_index(dev, ffs(encoder->possible_crtcs) - 1);
+		if (num_dspps && crtc) {
+			drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+			num_dspps--;
+		}
+	}
+
+	return num_dspps;
+}
+
 static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
@@ -747,6 +786,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
 	int max_crtc_count;
+	u32 num_dspps, primary_enc_mask = 0, external_enc_mask = 0;
+
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 	catalog = dpu_kms->catalog;
@@ -796,6 +837,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	}
 
 	max_crtc_count = min(max_crtc_count, primary_planes_idx);
+	num_dspps = _dpu_kms_possible_dspps(dpu_kms);
 
 	/* Create one CRTC per encoder */
 	encoder = list_first_entry(&(dev)->mode_config.encoder_list,
@@ -808,9 +850,20 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		}
 		priv->crtcs[priv->num_crtcs++] = crtc;
 		encoder->possible_crtcs = 1 << drm_crtc_index(crtc);
+
+		if (!dpu_encoder_is_external(encoder) &&
+			!dpu_encoder_is_virtual(encoder))
+			primary_enc_mask |= drm_encoder_mask(encoder);
+		else if (dpu_encoder_is_external(encoder))
+			external_enc_mask |= drm_encoder_mask(encoder);
+
 		encoder = list_next_entry(encoder, head);
 	}
 
+	/* Prefer Primary encoders in registering for color support */
+	num_dspps = _dpu_kms_attach_color(dev, primary_enc_mask, num_dspps);
+	num_dspps = _dpu_kms_attach_color(dev, external_enc_mask, num_dspps);
+
 	return 0;
 }
 
-- 
2.7.4

