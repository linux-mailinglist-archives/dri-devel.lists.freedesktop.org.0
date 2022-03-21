Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106584E3506
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 00:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE62810E4DC;
	Mon, 21 Mar 2022 23:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEC010E4DC;
 Mon, 21 Mar 2022 23:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647907091; x=1679443091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=IM7PZkdf7K77ilUD6lLWvQZFu10mB4b6V/k94WWBkJk=;
 b=sgK2PoPdbUvOplc3Md2pd9eRtTbgCuogdtpn//Rg33B/W5DMbuTEAgi4
 8uBRTfOLJqF309+QAjDVHbFj+tuYXnnWWSqUuhqkpWTsw+KDUlOOtyWMi
 Rzr7vRlE3JNWfT5MnrHFpy1oUHl4MNvH7HWPiydQFkZmcI+osPl0StTQz E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 21 Mar 2022 16:58:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 16:58:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 16:57:09 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 16:57:08 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 3/4] drm/vc4: change vc4 driver to use
 drm_writeback_connector_init_with_encoder()
Date: Mon, 21 Mar 2022 16:56:44 -0700
Message-ID: <1647907005-27004-4-git-send-email-quic_abhinavk@quicinc.com>
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

vc4 driver currently embeds the drm_encoder into struct vc4_txp
and later on uses container_of to retrieve the vc4_txp from
the drm_encoder.

Make vc4 driver use the new API so that the embedded encoder model
can be retained in the driver and there is no change in
functionality.

changes in v5:
	- reorder this change to come before in the series
      to avoid incorrect sequence in subsequent changes
	- continue using struct drm_encoder instead of
	  struct drm_encoder * and switch it in next change

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 3447eb6..5490162 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -368,6 +368,10 @@ static const struct drm_encoder_helper_funcs vc4_txp_encoder_helper_funcs = {
 	.disable = vc4_txp_encoder_disable,
 };
 
+static const struct drm_encoder_funcs vc4_txp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int vc4_txp_enable_vblank(struct drm_crtc *crtc)
 {
 	return 0;
@@ -467,6 +471,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_txp *txp;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
+	struct drm_writeback_connector *wb_conn;
 	int ret, irq;
 
 	irq = platform_get_irq(pdev, 0);
@@ -492,16 +497,27 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	txp->regset.regs = txp_regs;
 	txp->regset.nregs = ARRAY_SIZE(txp_regs);
 
-	drm_connector_helper_add(&txp->connector.base,
-				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init(drm, &txp->connector,
-					   &vc4_txp_connector_funcs,
-					   &vc4_txp_encoder_helper_funcs,
-					   drm_fmts, ARRAY_SIZE(drm_fmts),
-					   0);
+	wb_conn = &txp->connector;
+
+	drm_encoder_helper_add(&wb_conn->encoder, &vc4_txp_encoder_helper_funcs);
+
+	ret = drm_encoder_init(drm, &wb_conn->encoder,
+			&vc4_txp_encoder_funcs,
+			DRM_MODE_ENCODER_VIRTUAL, NULL);
+
 	if (ret)
 		return ret;
 
+	drm_connector_helper_add(&wb_conn->base,
+				 &vc4_txp_connector_helper_funcs);
+
+	ret = drm_writeback_connector_init_with_encoder(drm, wb_conn,
+			&vc4_txp_connector_funcs, drm_fmts, ARRAY_SIZE(drm_fmts));
+	if (ret) {
+		drm_encoder_cleanup(&wb_conn->encoder);
+		return ret;
+	}
+
 	ret = vc4_crtc_init(drm, vc4_crtc,
 			    &vc4_txp_crtc_funcs, &vc4_txp_crtc_helper_funcs);
 	if (ret)
-- 
2.7.4

