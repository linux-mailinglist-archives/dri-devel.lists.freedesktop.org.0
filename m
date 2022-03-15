Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF404DA619
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 00:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC2710E40C;
	Tue, 15 Mar 2022 23:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3B610E40C;
 Tue, 15 Mar 2022 23:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647385943; x=1678921943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=XZMIRmRp0Q/pNEbS39RmdE5pwvIizJhD6OdC0HE6LE4=;
 b=o0KlUbfclleQZZbXyXqWRXkrEKD0wm2Hnq6WFqLZvrMMkfsk5cre8aMN
 aCrHGzN9I0h9t+GeRKuxTORgiwiBmAnl+kgtec/2qj6mUtjkBOvWK7vlr
 9ZAkKXblfUPW7AJ7q6ukNINmysu+tJg5/jMr/OeLcKTkCjt9dExeuuWII I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Mar 2022 16:12:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 16:12:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 16:12:19 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 16:12:18 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 4/6] drm/vc4: change vc4 driver to use
 drm_writeback_connector_init_with_encoder()
Date: Tue, 15 Mar 2022 16:12:00 -0700
Message-ID: <1647385922-31539-5-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
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

vc4 driver currently embeds the drm_encoder into struct vc4_txp
and later on uses container_of to retrieve the vc4_txp from
the drm_encoder.

Since drm_encoder has now been made a pointer inside
drm_writeback_connector, make vc4 driver use the new API
so that the embedded encoder model can be retained in the
driver and there is no change in functionality.

changes in v2:
   - make vc4 driver use drm_writeback_connector_init_with_encoder()

Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 9809ca3..b09440d 100644
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
@@ -368,6 +370,10 @@ static const struct drm_encoder_helper_funcs vc4_txp_encoder_helper_funcs = {
 	.disable = vc4_txp_encoder_disable,
 };
 
+static const struct drm_encoder_funcs vc4_txp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int vc4_txp_enable_vblank(struct drm_crtc *crtc)
 {
 	return 0;
@@ -467,6 +473,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_txp *txp;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
+	struct drm_writeback_connector *wb_conn;
 	int ret, irq;
 
 	irq = platform_get_irq(pdev, 0);
@@ -492,21 +499,32 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	txp->regset.regs = txp_regs;
 	txp->regset.nregs = ARRAY_SIZE(txp_regs);
 
-	drm_connector_helper_add(&txp->connector.base,
+	wb_conn = &txp->connector;
+	wb_conn->encoder = &txp->drm_enc;
+	drm_encoder_helper_add(wb_conn->encoder, &vc4_txp_encoder_helper_funcs);
+
+	ret = drm_encoder_init(drm, wb_conn->encoder,
+			       &vc4_txp_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(&wb_conn->base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init(drm, &txp->connector,
+	ret = drm_writeback_connector_init_with_encoder(drm, wb_conn,
 					   &vc4_txp_connector_funcs,
-					   &vc4_txp_encoder_helper_funcs,
 					   drm_fmts, ARRAY_SIZE(drm_fmts));
-	if (ret)
+	if (ret) {
+		drm_encoder_cleanup(wb_conn->encoder);
 		return ret;
+	}
 
 	ret = vc4_crtc_init(drm, vc4_crtc,
 			    &vc4_txp_crtc_funcs, &vc4_txp_crtc_helper_funcs);
 	if (ret)
 		return ret;
 
-	encoder = &txp->connector.encoder;
+	encoder = txp->connector.encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
-- 
2.7.4

