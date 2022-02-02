Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39764A6CAB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E995210F9A9;
	Wed,  2 Feb 2022 08:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C3D10F9AE;
 Wed,  2 Feb 2022 08:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643789317; x=1675325317;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=iyg0QEJJWiTrsMY8my7AWxHGjokGJHa8MvIuMNnt/AI=;
 b=CoDn0wiHep3z0AsaM/SHXSSpVXKw29bH+vhU+udxUhc1GHgzjirz2rpU
 rPmxPA/yvZzQdB2v4Sey5L6DJW0LHz9saoob3J/SDhxgpBAvExXoShsVW
 ihneggSVEZQzkdBv9Z01aNTWkeWMilAf5TMOGJenmq1NrOpFSZS9htt1X
 MW58uRIrzHDAnUAPRKSPrDG/sBFt3y6fJokFVSydE+Kqs77FoAxAvitBP
 gkmX0/YIyis5Des1G3p2u6L9z4FmNryazLq6wwiOCYyaqvRrwPzHGGEZi
 XDibTNs4sm58RLKdLBVAaRGvUugTCJHnRjizKVmWt0gjt47rbG4tV260P Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="247637935"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="247637935"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 00:08:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="771368012"
Received: from srr4-3-linux-116-skandpal.iind.intel.com ([10.190.238.57])
 by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2022 00:08:34 -0800
From: Kandpal Suraj <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/vc4: vc4 driver changes to accommodate changes
 done in drm_writeback_connector structure
Date: Wed,  2 Feb 2022 13:47:00 +0530
Message-Id: <20220202081702.22119-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202081702.22119-1-suraj.kandpal@intel.com>
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
 <20220202081702.22119-1-suraj.kandpal@intel.com>
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>, carsten.haitzler@arm.com,
 jani.nikula@intel.com, quic_abhinavk@quicinc.com,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changing vc4 driver to accomadate the change of
drm_writeback_connector.base and drm_writeback_connector.encoder
to a pointer the reason for which is explained in the
Patch(drm: add writeback pointers to drm_connector).

Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 9809ca3e2945..9882569d147c 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -151,6 +151,10 @@ struct vc4_txp {
 
 	struct platform_device *pdev;
 
+	struct drm_connector drm_conn;
+
+	struct drm_encoder drm_enc;
+
 	struct drm_writeback_connector connector;
 
 	void __iomem *regs;
@@ -159,12 +163,12 @@ struct vc4_txp {
 
 static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
 {
-	return container_of(encoder, struct vc4_txp, connector.encoder);
+	return container_of(encoder, struct vc4_txp, drm_enc);
 }
 
 static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
 {
-	return container_of(conn, struct vc4_txp, connector.base);
+	return container_of(conn, struct vc4_txp, drm_conn);
 }
 
 static const struct debugfs_reg32 txp_regs[] = {
@@ -467,6 +471,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_txp *txp;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
+	struct drm_writeback_connector *wb_conn;
 	int ret, irq;
 
 	irq = platform_get_irq(pdev, 0);
@@ -491,10 +496,13 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	txp->regset.base = txp->regs;
 	txp->regset.regs = txp_regs;
 	txp->regset.nregs = ARRAY_SIZE(txp_regs);
+	wb_conn = &txp->connector;
+	wb_conn->base = &txp->drm_conn;
+	wb_conn->encoder = &txp->drm_enc;
 
-	drm_connector_helper_add(&txp->connector.base,
+	drm_connector_helper_add(wb_conn->base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init(drm, &txp->connector,
+	ret = drm_writeback_connector_init(drm, wb_conn,
 					   &vc4_txp_connector_funcs,
 					   &vc4_txp_encoder_helper_funcs,
 					   drm_fmts, ARRAY_SIZE(drm_fmts));
@@ -506,7 +514,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	encoder = &txp->connector.encoder;
+	encoder = txp->connector.encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
@@ -529,7 +537,7 @@ static void vc4_txp_unbind(struct device *dev, struct device *master,
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_txp *txp = dev_get_drvdata(dev);
 
-	vc4_txp_connector_destroy(&txp->connector.base);
+	vc4_txp_connector_destroy(txp->connector.base);
 
 	vc4->txp = NULL;
 }
-- 
2.17.1

