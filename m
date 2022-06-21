Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EE4552DE6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 11:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23F51127D5;
	Tue, 21 Jun 2022 09:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9C11127C5;
 Tue, 21 Jun 2022 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655802409; x=1687338409;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=vJPkzk6EQlamjTWr4zwrEkoumU44Ke4DpZgp6nabWaI=;
 b=u06d4Rhv+TX8JC7JKs0hFJSWG/w6ke83gTamWqodev/Sqc3vWNyYH+mS
 GIlshTp+Q4zUodNTY4jDzaN8fj4cilRJdZbbtyeaOVmqDTK3+AbXSSINe
 iYoZAydvi0giZXtwRdqMPXlvOmDoGpBt+5tj6IzSbXqE84+kYY5cGACWF E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 21 Jun 2022 02:06:48 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Jun 2022 02:06:47 -0700
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg02-blr.qualcomm.com with ESMTP; 21 Jun 2022 14:36:31 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 25A1241C5; Tue, 21 Jun 2022 02:06:31 -0700 (PDT)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: y@qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [v1 2/2] drm/msm/disp/dpu1: enable crtc color management based on
 encoder topology
Date: Tue, 21 Jun 2022 02:06:27 -0700
Message-Id: <1655802387-15275-2-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655802387-15275-1-git-send-email-quic_kalyant@quicinc.com>
References: <y>
 <1655802387-15275-1-git-send-email-quic_kalyant@quicinc.com>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, dianders@chromium.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Crtc color management needs to be registered only for the crtc which has the
capability to handle it. Since topology decides which encoder will get the
dspp hw block, tie up the crtc and the encoder together (encoder->possible_crtcs)

Change-Id: If5a0f33547b6f527ca4b8fbb78424b141dbbd711
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  8 ++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  5 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 22 ++++++++++++++++++----
 5 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7763558..2913acb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1511,7 +1511,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 
 /* initialize crtc */
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
-				struct drm_plane *cursor)
+				struct drm_plane *cursor, unsigned int enc_mask)
 {
 	struct drm_crtc *crtc = NULL;
 	struct dpu_crtc *dpu_crtc = NULL;
@@ -1544,7 +1544,11 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+	/* Register crtc color management if the encoder has dspp, use the
+	 * crtc to mark it as possible_crtcs for that encoder.
+	 */
+	if(BIT(crtc->index) & enc_mask)
+		drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
 
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b8785c3..0a6458e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -269,7 +269,7 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc);
  * @Return: new crtc object or error
  */
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
-			       struct drm_plane *cursor);
+			       struct drm_plane *cursor, unsigned int enc_mask);
 
 /**
  * dpu_crtc_register_custom_event - api for enabling/disabling crtc event
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f2cb497..893ce68 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -13,6 +13,8 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 
 #include "msm_drv.h"
 #include "dpu_kms.h"
@@ -511,13 +513,18 @@ void dpu_encoder_helper_split_config(
 	}
 }
 
-static struct msm_display_topology dpu_encoder_get_topology(
-			struct dpu_encoder_virt *dpu_enc,
+struct msm_display_topology dpu_encoder_get_topology(
+			struct drm_encoder *drm_enc,
 			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology = {0};
+	struct dpu_encoder_virt *dpu_enc;
+	struct drm_bridge *bridge;
 	int i, intf_count = 0;
+	bool primary_display = false;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
@@ -542,7 +549,12 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
+	drm_for_each_bridge_in_chain(drm_enc, bridge) {
+		if (bridge->type != DRM_MODE_CONNECTOR_DisplayPort)
+			primary_display = true;
+	}
+
+	if (primary_display) {
 		if (dpu_kms->catalog->dspp &&
 			(dpu_kms->catalog->dspp_count >= topology.num_lm))
 			topology.num_dspp = topology.num_lm;
@@ -601,7 +613,7 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
+	topology = dpu_encoder_get_topology(drm_enc, dpu_kms, adj_mode);
 
 	/* Reserve dynamic resources now. */
 	if (!ret) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 1f39327..c4daf7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -172,4 +172,9 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
 
+struct msm_display_topology dpu_encoder_get_topology(
+			struct drm_encoder *drm_enc,
+			struct dpu_kms *dpu_kms,
+			struct drm_display_mode *mode);
+
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3a4da0d..486ff9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -687,9 +687,12 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	unsigned cursor_idx = 0;
 	unsigned primary_idx = 0;
 	bool pin_overlays;
+	unsigned int max_dspp_count = 0;
+	unsigned int enc_mask = 0;
 
 	struct msm_drm_private *priv;
 	struct dpu_mdss_cfg *catalog;
+	struct msm_display_topology topology = {0};
 
 	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
 	int max_crtc_count;
@@ -754,10 +757,19 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	}
 
 	max_crtc_count = min(max_crtc_count, primary_planes_idx);
+	max_dspp_count = catalog->dspp_count;
+
+	drm_for_each_encoder(encoder, dev) {
+		topology = dpu_encoder_get_topology(encoder, dpu_kms, NULL);
+		if (topology.num_dspp > 0 && (topology.num_dspp <= max_dspp_count)) {
+			enc_mask |= BIT(encoder->index);
+			max_dspp_count -= topology.num_dspp;
+		}
+	}
 
 	/* Create one CRTC per encoder */
 	for (i = 0; i < max_crtc_count; i++) {
-		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
+		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i], enc_mask);
 		if (IS_ERR(crtc)) {
 			ret = PTR_ERR(crtc);
 			return ret;
@@ -765,9 +777,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		priv->crtcs[priv->num_crtcs++] = crtc;
 	}
 
-	/* All CRTCs are compatible with all encoders */
-	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+	/* Attach CRTC's to compatiable encoders */
+	drm_for_each_encoder(encoder, dev) {
+		encoder->possible_crtcs = (enc_mask & BIT(encoder->index)) ?
+				BIT(encoder->index) : (((1 << priv->num_crtcs) - 1) & ~enc_mask);
+	}
 
 	return 0;
 }
-- 
2.7.4

