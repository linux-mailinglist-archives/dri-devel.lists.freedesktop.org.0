Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9AA4D5794
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 02:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8152E10E673;
	Fri, 11 Mar 2022 01:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E319210E11E;
 Fri, 11 Mar 2022 01:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646963432; x=1678499432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=4LzeWDTTjwTx15Uly6p3Oa3+3y8gTh/yZDbkjwwdyGY=;
 b=lDpVDMdyTuzQRi6N9+tXfGKr2uFxUHGf/UFbp3DDL3fzF3f8P7EPPqRk
 ayAyg/VNr1Gf9grhn2L0SbyMXE9Ca7iXKEoXEeCakxDr6P+JyClpB60zc
 rG92STyDhKswUK0nY+ElzIq9aEspWXWXNyYA6w/TqKxGArBALL8nUVqtA 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Mar 2022 17:50:31 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 17:50:31 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 10 Mar 2022 17:50:31 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 10 Mar 2022 17:50:30 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/vc4: use drm_encoder pointer for
 drm_writeback_connector
Date: Thu, 10 Mar 2022 17:49:58 -0800
Message-ID: <1646963400-25606-5-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
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

Make changes to vc4 driver to start using drm_encoder pointer
for drm_writeback_connector.

Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 9809ca3..7b76968 100644
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
@@ -467,6 +469,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_txp *txp;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
+	struct drm_writeback_connector *wb_conn;
 	int ret, irq;
 
 	irq = platform_get_irq(pdev, 0);
@@ -492,9 +495,12 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	txp->regset.regs = txp_regs;
 	txp->regset.nregs = ARRAY_SIZE(txp_regs);
 
-	drm_connector_helper_add(&txp->connector.base,
+	wb_conn = &txp->connector;
+	wb_conn->encoder = &txp->drm_enc;
+
+	drm_connector_helper_add(&wb_conn->base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init(drm, &txp->connector,
+	ret = drm_writeback_connector_init(drm, wb_conn,
 					   &vc4_txp_connector_funcs,
 					   &vc4_txp_encoder_helper_funcs,
 					   drm_fmts, ARRAY_SIZE(drm_fmts));
@@ -506,7 +512,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	encoder = &txp->connector.encoder;
+	encoder = txp->connector.encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
-- 
2.7.4

