Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD144EE510
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 02:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAA110E30E;
	Fri,  1 Apr 2022 00:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2EC10E30E;
 Fri,  1 Apr 2022 00:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648771959; x=1680307959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ApNTn0WxxnfIIcxx4QmPtP9zwTszdBLqToDvBj50Pv4=;
 b=IS6DumKo6Q7b6p83v1sh4cKDM+xuebrEeiHX/q+oY2mxU2d2fT9rwLMS
 GaCgT9kABFuRwgKIni82JFlbcuaGau76x7tjwBAEmWapc2MYDM3qKTcTh
 kjrdLEWMFY+Z4ySavLIFT7ohp6tE8TX9ZCgtYVRMCSxUQe7UpeVClnoFv k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 31 Mar 2022 17:12:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 17:12:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 31 Mar 2022 17:12:37 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 31 Mar 2022 17:12:36 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 1/4] drm: allow passing possible_crtcs to
 drm_writeback_connector_init()
Date: Thu, 31 Mar 2022 17:12:10 -0700
Message-ID: <1648771933-18512-2-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648771933-18512-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1648771933-18512-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, swboyd@chromium.org,
 melissa.srw@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clients of drm_writeback_connector_init() initialize the
possible_crtcs and then invoke the call to this API.

To simplify things, allow passing possible_crtcs as a parameter
to drm_writeback_connector_init() and make changes to the
other drm drivers to make them compatible with this change.

changes in v6:
     - None

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c | 3 +--
 drivers/gpu/drm/arm/malidp_mw.c                          | 4 ++--
 drivers/gpu/drm/drm_writeback.c                          | 6 +++++-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c              | 4 ++--
 drivers/gpu/drm/vc4/vc4_txp.c                            | 3 ++-
 drivers/gpu/drm/vkms/vkms_writeback.c                    | 4 ++--
 include/drm/drm_writeback.h                              | 2 +-
 7 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index e465cc4..40774e6 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -155,7 +155,6 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	kwb_conn->wb_layer = kcrtc->master->wb_layer;
 
 	wb_conn = &kwb_conn->base;
-	wb_conn->encoder.possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
 
 	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
 					       kwb_conn->wb_layer->layer_type,
@@ -164,7 +163,7 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	err = drm_writeback_connector_init(&kms->base, wb_conn,
 					   &komeda_wb_connector_funcs,
 					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats);
+					   formats, n_formats, BIT(drm_crtc_index(&kcrtc->base)));
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index f5847a7..e54921d 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -212,7 +212,6 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!malidp->dev->hw->enable_memwrite)
 		return 0;
 
-	malidp->mw_connector.encoder.possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
 	drm_connector_helper_add(&malidp->mw_connector.base,
 				 &malidp_mw_connector_helper_funcs);
 
@@ -223,7 +222,8 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
 					   &malidp_mw_connector_funcs,
 					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats);
+					   formats, n_formats,
+					  (1 << drm_crtc_index(&malidp->crtc)));
 	kfree(formats);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index dccf4504..dc2ef12 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -157,6 +157,7 @@ static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
  * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
  * @formats: Array of supported pixel formats for the writeback engine
  * @n_formats: Length of the formats array
+ * @possible_crtcs: possible crtcs for the internal writeback encoder
  *
  * This function creates the writeback-connector-specific properties if they
  * have not been already created, initializes the connector as
@@ -174,7 +175,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 struct drm_writeback_connector *wb_connector,
 				 const struct drm_connector_funcs *con_funcs,
 				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats)
+				 const u32 *formats, int n_formats, uint32_t possible_crtcs)
 {
 	struct drm_property_blob *blob;
 	struct drm_connector *connector = &wb_connector->base;
@@ -190,6 +191,9 @@ int drm_writeback_connector_init(struct drm_device *dev,
 		return PTR_ERR(blob);
 
 	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
+
+	wb_connector->encoder.possible_crtcs = possible_crtcs;
+
 	ret = drm_encoder_init(dev, &wb_connector->encoder,
 			       &drm_writeback_encoder_funcs,
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
index c79d125..fcfb0b3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
@@ -200,7 +200,6 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
 
-	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
@@ -208,7 +207,8 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 					    &rcar_du_wb_conn_funcs,
 					    &rcar_du_wb_enc_helper_funcs,
 					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats));
+					    ARRAY_SIZE(writeback_formats),
+					   (1 << drm_crtc_index(&rcrtc->crtc)));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 9809ca3..3447eb6 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -497,7 +497,8 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	ret = drm_writeback_connector_init(drm, &txp->connector,
 					   &vc4_txp_connector_funcs,
 					   &vc4_txp_encoder_helper_funcs,
-					   drm_fmts, ARRAY_SIZE(drm_fmts));
+					   drm_fmts, ARRAY_SIZE(drm_fmts),
+					   0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 8694227..6d01e55 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -140,12 +140,12 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 {
 	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
 
-	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
 	return drm_writeback_connector_init(&vkmsdev->drm, wb,
 					    &vkms_wb_connector_funcs,
 					    &vkms_wb_encoder_helper_funcs,
 					    vkms_wb_formats,
-					    ARRAY_SIZE(vkms_wb_formats));
+					    ARRAY_SIZE(vkms_wb_formats),
+					    1);
 }
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 9697d27..db6214f 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -150,7 +150,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 struct drm_writeback_connector *wb_connector,
 				 const struct drm_connector_funcs *con_funcs,
 				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats);
+				 const u32 *formats, int n_formats, uint32_t possible_crtcs);
 
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb);
-- 
2.7.4

