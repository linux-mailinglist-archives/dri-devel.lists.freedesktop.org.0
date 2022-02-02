Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E18D4A6CB0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8866210F9BB;
	Wed,  2 Feb 2022 08:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21AB10F9B7;
 Wed,  2 Feb 2022 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643789325; x=1675325325;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=SfRemAym7QZpOzjfvQoZ2VzDjXns70gzkqH86CgpSqY=;
 b=kCUIsykIAF8nA35peLiVgaRRu44gNdY1eOTX4qkO4O8kMsNhMOM6oHI5
 VTcs2e8vltZu7hgj6o2Gv0H3d3FfxsfHR7ArVmOHoPOYrSK0eJ9CpYye5
 1sQY2aPFofPX6kuNoeIwIh+l43ezgtZfgBGHCnrMqT3HTlU1uWQJDYpif
 I945jr20Z4uMqNZ4pXys5QD5e0gJvMNO2DhxrLkjNzqsMu8iB1JWxTJjd
 SQ2J2vrRJidmmPMZPPlRoRw9jsTvWzx3jAEj/wOID8wxzGU7560nl2hxN
 NCOZ6rSjspqxihnH5+0v2O8TEvdjj3COIw/Op1nF/IKTpujLKQrJUPcSA Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="247637958"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="247637958"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 00:08:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="771368046"
Received: from srr4-3-linux-116-skandpal.iind.intel.com ([10.190.238.57])
 by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2022 00:08:42 -0800
From: Kandpal Suraj <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/arm: changes to malidp driver resulting from
 drm_writeback_connector structure changes
Date: Wed,  2 Feb 2022 13:47:02 +0530
Message-Id: <20220202081702.22119-6-suraj.kandpal@intel.com>
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

Changing malidp driver to accomadate the change of
drm_writeback_connector.base and drm_writeback_connector.encoder
to a pointer the reason for which is explained in the
Patch(drm: add writeback pointers to drm_connector).

Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/arm/malidp_crtc.c |  2 +-
 drivers/gpu/drm/arm/malidp_drv.h  |  2 ++
 drivers/gpu/drm/arm/malidp_mw.c   | 12 ++++++++----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index 494075ddbef6..294aacd4beef 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -424,7 +424,7 @@ static int malidp_crtc_atomic_check(struct drm_crtc *crtc,
 		u32 new_mask = crtc_state->connector_mask;
 
 		if ((old_mask ^ new_mask) ==
-		    (1 << drm_connector_index(&malidp->mw_connector.base)))
+		    (1 << drm_connector_index(malidp->mw_connector.base)))
 			crtc_state->connectors_changed = false;
 	}
 
diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/malidp_drv.h
index cdfddfabf2d1..971810a685f1 100644
--- a/drivers/gpu/drm/arm/malidp_drv.h
+++ b/drivers/gpu/drm/arm/malidp_drv.h
@@ -31,6 +31,8 @@ struct malidp_error_stats {
 struct malidp_drm {
 	struct malidp_hw_device *dev;
 	struct drm_crtc crtc;
+	struct drm_connector connector;
+	struct drm_encoder encoder;
 	struct drm_writeback_connector mw_connector;
 	wait_queue_head_t wq;
 	struct drm_pending_vblank_event *event;
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index f5847a79dd7e..9bd2e400cd3d 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -206,21 +206,25 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 int malidp_mw_connector_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm->dev_private;
+	struct drm_writeback_connector *wb_conn;
 	u32 *formats;
 	int ret, n_formats;
 
 	if (!malidp->dev->hw->enable_memwrite)
 		return 0;
 
-	malidp->mw_connector.encoder.possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
-	drm_connector_helper_add(&malidp->mw_connector.base,
+	wb_conn = &malidp->mw_connector;
+	wb_conn->base = &malidp->connector;
+	wb_conn->encoder = &malidp->encoder;
+	malidp->mw_connector.encoder->possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
+	drm_connector_helper_add(wb_conn->base,
 				 &malidp_mw_connector_helper_funcs);
 
 	formats = get_writeback_formats(malidp, &n_formats);
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
+	ret = drm_writeback_connector_init(drm, wb_conn,
 					   &malidp_mw_connector_funcs,
 					   &malidp_mw_encoder_helper_funcs,
 					   formats, n_formats);
@@ -236,7 +240,7 @@ void malidp_mw_atomic_commit(struct drm_device *drm,
 {
 	struct malidp_drm *malidp = drm->dev_private;
 	struct drm_writeback_connector *mw_conn = &malidp->mw_connector;
-	struct drm_connector_state *conn_state = mw_conn->base.state;
+	struct drm_connector_state *conn_state = mw_conn->base->state;
 	struct malidp_hw_device *hwdev = malidp->dev;
 	struct malidp_mw_connector_state *mw_state;
 
-- 
2.17.1

