Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF684E3504
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 00:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E62510E4E0;
	Mon, 21 Mar 2022 23:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8B810E4DF;
 Mon, 21 Mar 2022 23:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647907062; x=1679443062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=3WfhpSh5q2P6EqreVSDtA4L8MjR5r2HCJWPyhM3rNz0=;
 b=RaqRJyD3Gat71e1f9T66Kr+4NUfTrQxUvb4lOtP+L/Xl2soUJX3j1hqR
 8QndeOgkQdbEn4QqZpfnq5P4Yigf08RbMXAg+8lIuqAcDLbPMTAU99iF4
 dv6ULMLuiBIrWQ7chbhpgT9SdPM4MulsxtHLIexygMrI98m+S8Nsqkv7C k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Mar 2022 16:57:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 16:57:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 16:57:10 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 16:57:09 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 4/4] drm: allow real encoder to be passed for
 drm_writeback_connector
Date: Mon, 21 Mar 2022 16:56:45 -0700
Message-ID: <1647907005-27004-5-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647907005-27004-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1647907005-27004-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

For some vendor driver implementations, display hardware can
be shared between the encoder used for writeback and the physical
display.

In addition resources such as clocks and interrupts can
also be shared between writeback and the real encoder.

To accommodate such vendor drivers and hardware, allow
real encoder to be passed for drm_writeback_connector.

changes in v5:
	- re-order the change to come last in the series
	- rework necessary changes as part of the re-order

Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/drm_writeback.c | 12 +++++++-----
 drivers/gpu/drm/vc4/vc4_txp.c   | 13 ++++++++-----
 include/drm/drm_writeback.h     | 18 ++++++++++++++++--
 3 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index abe78b9..d0672f5 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -178,7 +178,7 @@ static int drm_writeback_connector_setup(struct drm_device *dev,
 		goto connector_fail;
 
 	ret = drm_connector_attach_encoder(connector,
-						&wb_connector->encoder);
+						wb_connector->encoder);
 	if (ret)
 		goto attach_fail;
 
@@ -241,11 +241,13 @@ int drm_writeback_connector_init(struct drm_device *dev,
 {
 	int ret = 0;
 
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
+	wb_connector->encoder = &wb_connector->internal_encoder;
 
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
+	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
 
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
+	wb_connector->encoder->possible_crtcs = possible_crtcs;
+
+	ret = drm_encoder_init(dev, wb_connector->encoder,
 			       &drm_writeback_encoder_funcs,
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret)
@@ -255,7 +257,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 			n_formats);
 
 	if (ret)
-		drm_encoder_cleanup(&wb_connector->encoder);
+		drm_encoder_cleanup(wb_connector->encoder);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 5490162..3d24ef5 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -151,6 +151,8 @@ struct vc4_txp {
 
 	struct platform_device *pdev;
 
+	struct drm_encoder drm_enc;
+
 	struct drm_writeback_connector connector;
 
 	void __iomem *regs;
@@ -159,7 +161,7 @@ struct vc4_txp {
 
 static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
 {
-	return container_of(encoder, struct vc4_txp, connector.encoder);
+	return container_of(encoder, struct vc4_txp, drm_enc);
 }
 
 static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
@@ -498,10 +500,11 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	txp->regset.nregs = ARRAY_SIZE(txp_regs);
 
 	wb_conn = &txp->connector;
+	wb_conn->encoder = &txp->drm_enc;
 
-	drm_encoder_helper_add(&wb_conn->encoder, &vc4_txp_encoder_helper_funcs);
+	drm_encoder_helper_add(wb_conn->encoder, &vc4_txp_encoder_helper_funcs);
 
-	ret = drm_encoder_init(drm, &wb_conn->encoder,
+	ret = drm_encoder_init(drm, wb_conn->encoder,
 			&vc4_txp_encoder_funcs,
 			DRM_MODE_ENCODER_VIRTUAL, NULL);
 
@@ -514,7 +517,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	ret = drm_writeback_connector_init_with_encoder(drm, wb_conn,
 			&vc4_txp_connector_funcs, drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret) {
-		drm_encoder_cleanup(&wb_conn->encoder);
+		drm_encoder_cleanup(wb_conn->encoder);
 		return ret;
 	}
 
@@ -523,7 +526,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	encoder = &txp->connector.encoder;
+	encoder = txp->connector.encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 0093bab..ed35c3d 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -25,15 +25,29 @@ struct drm_writeback_connector {
 	struct drm_connector base;
 
 	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
+	 * @encoder: handle to drm_encoder used by the connector to fulfill
 	 * the DRM framework requirements. The users of the
 	 * @drm_writeback_connector control the behaviour of the @encoder
 	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
 	 * function.
+	 *
+	 * For some vendor drivers, the hardware resources are shared between
+	 * writeback encoder and rest of the display pipeline.
+	 * To accommodate such cases, encoder is a handle to the real encoder
+	 * hardware.
+	 *
+	 * For current existing writeback users, this shall continue to be the
+	 * embedded encoder for the writeback connector.
 	 */
-	struct drm_encoder encoder;
+	struct drm_encoder *encoder;
 
 	/**
+	 * @internal_encoder: internal encoder used by writeback when
+	 * a real encoder is not provided by the vendor drm drivers.
+	 * @encoder will be assigned to this for those cases.
+	 */
+	struct drm_encoder internal_encoder;
+	/**
 	 * @pixel_formats_blob_ptr:
 	 *
 	 * DRM blob property data for the pixel formats list on writeback
-- 
2.7.4

