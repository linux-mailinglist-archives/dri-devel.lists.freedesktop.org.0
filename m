Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D51304FA0D6
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 02:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB6110F255;
	Sat,  9 Apr 2022 00:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E91310F29C;
 Sat,  9 Apr 2022 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649465655; x=1681001655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SCVTi3DRi4g6HEq3MBeFkZ40q6c3gKYzIEEoQHLVgyI=;
 b=XPgcXElfR1bXe8t0Ar9noyu0gwsIJU31IQmtjY33VU9RD6e7E9NuYL1G
 zmNjTzeQl6AnVOKTXvXoVIRD6ddF+mrerbMZ9xfxj4Dsb9a3R09JlWEYK
 Zi3wj2FS63zbmDYuqehXNlxltvRt7yDn1qCTZUpylxgLOTqWxbdxduOPX k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Apr 2022 17:54:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 17:54:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Apr 2022 17:54:14 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Apr 2022 17:54:13 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 3/4] drm: allow real encoder to be passed for
 drm_writeback_connector
Date: Fri, 8 Apr 2022 17:53:54 -0700
Message-ID: <1649465635-20542-4-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649465635-20542-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1649465635-20542-1-git-send-email-quic_abhinavk@quicinc.com>
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

For some vendor driver implementations, display hardware can
be shared between the encoder used for writeback and the physical
display.

In addition resources such as clocks and interrupts can
also be shared between writeback and the real encoder.

To accommodate such vendor drivers and hardware, allow
real encoder to be passed for drm_writeback_connector.

For existing clients, drm_writeback_connector_init() will use
an internal_encoder under the hood and hence no changes will
be needed.

changes in v7:
	- move this change before the vc4 change in the series
	  to minimize the changes to vendor drivers in drm core
	  changes

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/drm_writeback.c | 18 ++++++++++++------
 drivers/gpu/drm/vc4/vc4_txp.c   |  4 ++--
 include/drm/drm_writeback.h     | 22 ++++++++++++++++++++--
 3 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 92658ad..0538674 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -180,21 +180,21 @@ int drm_writeback_connector_init(struct drm_device *dev,
 {
 	int ret = 0;
 
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
+	drm_encoder_helper_add(&wb_connector->internal_encoder, enc_helper_funcs);
 
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
+	wb_connector->internal_encoder.possible_crtcs = possible_crtcs;
 
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
+	ret = drm_encoder_init(dev, &wb_connector->internal_encoder,
 			       &drm_writeback_encoder_funcs,
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret)
 		return ret;
 
-	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
-			con_funcs, formats, n_formats);
+	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector,
+			&wb_connector->internal_encoder, con_funcs, formats, n_formats);
 
 	if (ret)
-		drm_encoder_cleanup(&wb_connector->encoder);
+		drm_encoder_cleanup(&wb_connector->internal_encoder);
 
 	return ret;
 }
@@ -239,6 +239,12 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 	struct drm_mode_config *config = &dev->mode_config;
 	int ret = create_writeback_properties(dev);
 
+	/*
+	 * Assign the encoder passed to this API to the wb_connector's encoder.
+	 * For drm_writeback_connector_init(), this shall be the internal_encoder
+	 */
+	wb_connector->encoder = enc;
+
 	if (ret != 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 3447eb6..7e063a9 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -159,7 +159,7 @@ struct vc4_txp {
 
 static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
 {
-	return container_of(encoder, struct vc4_txp, connector.encoder);
+	return container_of(encoder, struct vc4_txp, connector.internal_encoder);
 }
 
 static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
@@ -507,7 +507,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	encoder = &txp->connector.encoder;
+	encoder = txp->connector.encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index bb306fa..3fbae9d 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -25,13 +25,31 @@ struct drm_writeback_connector {
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
+	 */
+	struct drm_encoder *encoder;
+
+	/**
+	 * @internal_encoder: internal encoder used by writeback when
+	 * drm_writeback_connector_init() is used.
+	 * @encoder will be assigned to this for those cases
+	 *
+	 * This will be unused when drm_writeback_connector_init_with_encoder()
+	 * is used.
 	 */
-	struct drm_encoder encoder;
+	struct drm_encoder internal_encoder;
 
 	/**
 	 * @pixel_formats_blob_ptr:
-- 
2.7.4

