Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA58B4A95F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 12:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F4510E689;
	Tue,  9 Sep 2025 10:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zr4T85WQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D749C10E688;
 Tue,  9 Sep 2025 10:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757412444; x=1788948444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=op7tQCPrgW4k6asf3GwUpvEXtqYpcdzVvnUkrP59B1E=;
 b=Zr4T85WQRfy3J9X1JSSPigW0D7rN49cxcg0OHJWMKJQ+Nr/H/wFEguXj
 sZOCh7zLiQfQ4tnTUlMOHE1sQYQZF7xqXw+BMPYc4dahLDkrLvkpklTIE
 102vHNoKBJpjaZP5KRkfi55WCzL4KJSwKHI9L1Gg9d8eDjr76mpX2D0JQ
 a9qNpBobYGdUGTlX0TRO3thHAY77wlEGhSOkjqRnXulhZ0E7YiFgtX72Z
 eTBfMngAN5Lc73FJY3mnN71kGuKOK1LYux2zcQ1otVf/0y7HPUO9w3GXH
 7whWyCFrhkaqJoJ/zsOjXJWu9hpVUMrADfdfzbxuukoq7BzqV4YRNpbiR A==;
X-CSE-ConnectionGUID: 8IJlRZG8T2WDEsAQLmJwCw==
X-CSE-MsgGUID: P6Dw1Yv5SkaKKuMJp6prFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58730120"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="58730120"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 03:07:23 -0700
X-CSE-ConnectionGUID: V5MYaawoSq+zHqik+K7qYg==
X-CSE-MsgGUID: G8zu8Co9R1mliOP2Uyw2Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172915389"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa007.jf.intel.com with ESMTP; 09 Sep 2025 03:07:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 jani.nikula@intel.com, dmitry.baryshkov@oss.qualcomm.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 robin.clark@oss.qualcomm.com, abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, laurent.pinchart+renesas@ideasonboard.com,
 mcanal@igalia.com, dave.stevenson@raspberrypi.com,
 tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/7] drm: writeback: Refactor drm_writeback_connector structure
Date: Tue,  9 Sep 2025 15:36:43 +0530
Message-Id: <20250909100649.1509696-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909100649.1509696-1-suraj.kandpal@intel.com>
References: <20250909100649.1509696-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers cannot work with the current design where the connector
is embedded within the drm_writeback_connector such as Intel and
some drivers that can get it working end up adding a lot of checks
all around the code to check if it's a writeback conenctor or not,
this is due to the limitation of inheritance in C.
To solve this we move the drm_writeback_connector within the
drm_connector and remove the drm_connector base which was in
drm_writeback_connector. We also make this drm_writeback_connector
a union with hdmi connector to save memory and since a connector can
never be both writeback and hdmi it should serve us well.
We do all other requireda modifications that come with these changes
along with addition of new function which returns the drm_connector
when drm_writeback_connector is present.
We also modify drivers using the drm_writeback_connector to
allow them to use this connector without breaking them.
The drivers modified here are amd, komeda, mali, vc4, vkms,
rcar_du, msm

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
 .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
 drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
 drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
 drivers/gpu/drm/arm/malidp_hw.c               |  6 +-
 drivers/gpu/drm/arm/malidp_mw.c               |  8 +--
 drivers/gpu/drm/drm_writeback.c               | 33 ++++++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 16 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  4 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 +-
 .../drm/renesas/rcar-du/rcar_du_writeback.c   | 19 ++---
 drivers/gpu/drm/vc4/vc4_txp.c                 | 14 ++--
 drivers/gpu/drm/vkms/vkms_composer.c          |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         | 13 ++--
 include/drm/drm_connector.h                   | 70 +++++++++++++++++--
 include/drm/drm_writeback.h                   | 68 ++----------------
 22 files changed, 163 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5e260b275082..d4628dadf55a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6915,11 +6915,9 @@ create_stream_for_sink(struct drm_connector *connector,
 		aconnector = to_amdgpu_dm_connector(connector);
 		link = aconnector->dc_link;
 	} else {
-		struct drm_writeback_connector *wbcon = NULL;
 		struct amdgpu_dm_wb_connector *dm_wbcon = NULL;
 
-		wbcon = drm_connector_to_writeback(connector);
-		dm_wbcon = to_amdgpu_dm_wb_connector(wbcon);
+		dm_wbcon = to_amdgpu_dm_wb_connector(connector);
 		link = dm_wbcon->link;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index b937da0a4e4a..dbcdc8595e76 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -809,7 +809,7 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
 #define to_amdgpu_dm_connector(x) container_of(x, struct amdgpu_dm_connector, base)
 
 struct amdgpu_dm_wb_connector {
-	struct drm_writeback_connector base;
+	struct drm_connector base;
 	struct dc_link *link;
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index 80c37487ca77..8fea29720989 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -202,9 +202,9 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 
 	wbcon->link = link;
 
-	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
+	drm_connector_helper_add(&wbcon->base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base.writeback,
 					    &amdgpu_dm_wb_connector_funcs,
 					    encoder,
 					    amdgpu_dm_wb_formats,
@@ -216,8 +216,8 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 	 * Some of the properties below require access to state, like bpc.
 	 * Allocate some default initial connector state with our reset helper.
 	 */
-	if (wbcon->base.base.funcs->reset)
-		wbcon->base.base.funcs->reset(&wbcon->base.base);
+	if (wbcon->base.funcs->reset)
+		wbcon->base.funcs->reset(&wbcon->base);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 2ad33559a33a..1c2ba6eeb0e5 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -210,7 +210,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 		struct komeda_wb_connector *wb_conn = kcrtc->wb_conn;
 
 		if (wb_conn)
-			drm_writeback_signal_completion(&wb_conn->base, 0);
+			drm_writeback_signal_completion(&wb_conn->base.writeback, 0);
 		else
 			DRM_WARN("CRTC[%d]: EOW happen but no wb_connector.\n",
 				 drm_crtc_index(&kcrtc->base));
@@ -266,9 +266,9 @@ komeda_crtc_do_flush(struct drm_crtc *crtc,
 	if (slave && has_bit(slave->id, kcrtc_st->affected_pipes))
 		komeda_pipeline_update(slave, old->state);
 
-	conn_st = wb_conn ? wb_conn->base.base.state : NULL;
+	conn_st = wb_conn ? wb_conn->base.state : NULL;
 	if (conn_st && conn_st->writeback_job)
-		drm_writeback_queue_job(&wb_conn->base, conn_st);
+		drm_writeback_queue_job(&wb_conn->base.writeback, conn_st);
 
 	/* step 2: notify the HW to kickoff the update */
 	mdev->funcs->flush(mdev, master->id, kcrtc_st->active_pipes);
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
index 83e61c4080c2..9c34302782c0 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
@@ -53,8 +53,8 @@ struct komeda_plane_state {
  * struct komeda_wb_connector
  */
 struct komeda_wb_connector {
-	/** @base: &drm_writeback_connector */
-	struct drm_writeback_connector base;
+	/** @base: &drm_connector */
+	struct drm_connector base;
 
 	/** @wb_layer: represents associated writeback pipeline of komeda */
 	struct komeda_layer *wb_layer;
@@ -139,7 +139,7 @@ struct komeda_kms_dev {
 static inline bool is_writeback_only(struct drm_crtc_state *st)
 {
 	struct komeda_wb_connector *wb_conn = to_kcrtc(st->crtc)->wb_conn;
-	struct drm_connector *conn = wb_conn ? &wb_conn->base.base : NULL;
+	struct drm_connector *conn = wb_conn ? &wb_conn->base : NULL;
 
 	return conn && (st->connector_mask == BIT(drm_connector_index(conn)));
 }
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 210841b4453a..69822b9be574 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -53,7 +53,7 @@ komeda_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	wb_layer = to_kconn(to_wb_conn(conn_st->connector))->wb_layer;
+	wb_layer = to_kconn(conn_st->connector)->wb_layer;
 
 	/*
 	 * No need for a full modested when the only connector changed is the
@@ -151,7 +151,7 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 
 	kwb_conn->wb_layer = kcrtc->master->wb_layer;
 
-	wb_conn = &kwb_conn->base;
+	wb_conn = &kwb_conn->base.writeback;
 
 	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
 					       kwb_conn->wb_layer->layer_type,
@@ -180,9 +180,9 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return err;
 	}
 
-	drm_connector_helper_add(&wb_conn->base, &komeda_wb_conn_helper_funcs);
+	drm_connector_helper_add(&kwb_conn->base, &komeda_wb_conn_helper_funcs);
 
-	info = &kwb_conn->base.base.display_info;
+	info = &kwb_conn->base.display_info;
 	info->bpc = __fls(kcrtc->master->improc->supported_color_depths);
 	info->color_formats = kcrtc->master->improc->supported_color_formats;
 
diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index d72c22dcf685..10e818439637 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -425,7 +425,7 @@ static int malidp_crtc_atomic_check(struct drm_crtc *crtc,
 		u32 new_mask = crtc_state->connector_mask;
 
 		if ((old_mask ^ new_mask) ==
-		    (1 << drm_connector_index(&malidp->mw_connector.base)))
+		    (1 << drm_connector_index(&malidp->mw_connector)))
 			crtc_state->connectors_changed = false;
 	}
 
diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/malidp_drv.h
index bc0387876dea..aa5599467d27 100644
--- a/drivers/gpu/drm/arm/malidp_drv.h
+++ b/drivers/gpu/drm/arm/malidp_drv.h
@@ -32,7 +32,7 @@ struct malidp_drm {
 	struct drm_device base;
 	struct malidp_hw_device *dev;
 	struct drm_crtc crtc;
-	struct drm_writeback_connector mw_connector;
+	struct drm_connector mw_connector;
 	wait_queue_head_t wq;
 	struct drm_pending_vblank_event *event;
 	atomic_t config_valid;
diff --git a/drivers/gpu/drm/arm/malidp_hw.c b/drivers/gpu/drm/arm/malidp_hw.c
index 9b845d3f34e1..5a7bd27d3718 100644
--- a/drivers/gpu/drm/arm/malidp_hw.c
+++ b/drivers/gpu/drm/arm/malidp_hw.c
@@ -1315,15 +1315,15 @@ static irqreturn_t malidp_se_irq(int irq, void *arg)
 	if (status & se->vsync_irq) {
 		switch (hwdev->mw_state) {
 		case MW_ONESHOT:
-			drm_writeback_signal_completion(&malidp->mw_connector, 0);
+			drm_writeback_signal_completion(&malidp->mw_connector.writeback, 0);
 			break;
 		case MW_STOP:
-			drm_writeback_signal_completion(&malidp->mw_connector, 0);
+			drm_writeback_signal_completion(&malidp->mw_connector.writeback, 0);
 			/* disable writeback after stop */
 			hwdev->mw_state = MW_NOT_ENABLED;
 			break;
 		case MW_RESTART:
-			drm_writeback_signal_completion(&malidp->mw_connector, 0);
+			drm_writeback_signal_completion(&malidp->mw_connector.writeback, 0);
 			fallthrough;	/* to a new start */
 		case MW_START:
 			/* writeback started, need to emulate one-shot mode */
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 182275c0c29c..ea03cb98bfb4 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -212,7 +212,7 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!malidp->dev->hw->enable_memwrite)
 		return 0;
 
-	drm_connector_helper_add(&malidp->mw_connector.base,
+	drm_connector_helper_add(&malidp->mw_connector,
 				 &malidp_mw_connector_helper_funcs);
 
 	formats = get_writeback_formats(malidp, &n_formats);
@@ -228,7 +228,7 @@ int malidp_mw_connector_init(struct drm_device *drm)
 
 	encoder->possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
 
-	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector.writeback,
 					    &malidp_mw_connector_funcs,
 					    encoder,
 					    formats, n_formats);
@@ -243,8 +243,8 @@ void malidp_mw_atomic_commit(struct drm_device *drm,
 			     struct drm_atomic_state *old_state)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
-	struct drm_writeback_connector *mw_conn = &malidp->mw_connector;
-	struct drm_connector_state *conn_state = mw_conn->base.state;
+	struct drm_writeback_connector *mw_conn = &malidp->mw_connector.writeback;
+	struct drm_connector_state *conn_state = malidp->mw_connector.state;
 	struct malidp_hw_device *hwdev = malidp->dev;
 	struct malidp_mw_connector_state *mw_state;
 
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index ec2575c4c21b..7d6410b5b48d 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -89,8 +89,10 @@ static const char *drm_writeback_fence_get_driver_name(struct dma_fence *fence)
 {
 	struct drm_writeback_connector *wb_connector =
 		fence_to_wb_connector(fence);
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 
-	return wb_connector->base.dev->driver->name;
+	return connector->dev->driver->name;
 }
 
 static const char *
@@ -187,7 +189,8 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 					  struct drm_encoder *enc, const u32 *formats,
 					  int n_formats)
 {
-	struct drm_connector *connector = &wb_connector->base;
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property_blob *blob;
 	int ret = create_writeback_properties(dev);
@@ -269,7 +272,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 struct drm_encoder *enc,
 				 const u32 *formats, int n_formats)
 {
-	struct drm_connector *connector = &wb_connector->base;
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 	int ret;
 
 	ret = drm_connector_init(dev, connector, con_funcs,
@@ -339,7 +343,8 @@ int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_encoder *enc,
 				  const u32 *formats, int n_formats)
 {
-	struct drm_connector *connector = &wb_connector->base;
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 	int ret;
 
 	ret = drmm_connector_init(dev, connector, con_funcs,
@@ -382,13 +387,15 @@ int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 
 int drm_writeback_prepare_job(struct drm_writeback_job *job)
 {
-	struct drm_writeback_connector *connector = job->connector;
+	struct drm_writeback_connector *wb_connector = job->connector;
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 	const struct drm_connector_helper_funcs *funcs =
-		connector->base.helper_private;
+		connector->helper_private;
 	int ret;
 
 	if (funcs->prepare_writeback_job) {
-		ret = funcs->prepare_writeback_job(connector, job);
+		ret = funcs->prepare_writeback_job(wb_connector, job);
 		if (ret < 0)
 			return ret;
 	}
@@ -434,12 +441,14 @@ EXPORT_SYMBOL(drm_writeback_queue_job);
 
 void drm_writeback_cleanup_job(struct drm_writeback_job *job)
 {
-	struct drm_writeback_connector *connector = job->connector;
+	struct drm_writeback_connector *wb_connector = job->connector;
+	struct drm_connector *connector	=
+		drm_writeback_to_connector(wb_connector);
 	const struct drm_connector_helper_funcs *funcs =
-		connector->base.helper_private;
+		connector->helper_private;
 
 	if (job->prepared && funcs->cleanup_writeback_job)
-		funcs->cleanup_writeback_job(connector, job);
+		funcs->cleanup_writeback_job(wb_connector, job);
 
 	if (job->fb)
 		drm_framebuffer_put(job->fb);
@@ -521,8 +530,10 @@ struct dma_fence *
 drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
 {
 	struct dma_fence *fence;
+	struct drm_connector *connector =
+		drm_writeback_to_connector(wb_connector);
 
-	if (WARN_ON(wb_connector->base.connector_type !=
+	if (WARN_ON(connector->connector_type !=
 		    DRM_MODE_CONNECTOR_WRITEBACK))
 		return NULL;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 56a5b596554d..0e60c1ac07c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -484,7 +484,8 @@ static void dpu_encoder_phys_wb_prepare_for_kickoff(
 		return;
 	}
 
-	drm_conn = &wb_enc->wb_conn->base;
+	drm_conn =
+		container_of(wb_enc->wb_conn, struct drm_connector, writeback);
 	state = drm_conn->state;
 
 	if (wb_enc->wb_conn && wb_enc->wb_job)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index cd73468e369a..49412d2ed9aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -28,8 +28,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 				    struct drm_atomic_state *state)
 {
-	struct drm_writeback_connector *wb_conn = drm_connector_to_writeback(connector);
-	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(wb_conn);
+	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_crtc *crtc;
@@ -84,10 +83,11 @@ static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *connector,
+static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *wb_conn,
 		struct drm_writeback_job *job)
 {
-
+	struct drm_connector *connector =
+		container_of(wb_conn, struct drm_connector, writeback);
 	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
 
 	if (!job->fb)
@@ -98,9 +98,11 @@ static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *connector,
 	return 0;
 }
 
-static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
+static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *wb_connector,
 		struct drm_writeback_job *job)
 {
+	struct drm_connector *connector =
+		container_of(wb_connector, struct drm_connector, writeback);
 	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
 
 	if (!job->fb)
@@ -128,9 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 
 	dpu_wb_conn->maxlinewidth = maxlinewidth;
 
-	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
+	drm_connector_helper_add(&dpu_wb_conn->base, &dpu_wb_conn_helper_funcs);
 
-	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
+	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base.writeback,
 					   &dpu_wb_conn_funcs, enc,
 					   format_list, num_formats);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
index 4b11cca8014c..9ebf15392b20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
@@ -16,12 +16,12 @@
 #include "dpu_encoder_phys.h"
 
 struct dpu_wb_connector {
-	struct drm_writeback_connector base;
+	struct drm_connector base;
 	struct drm_encoder *wb_enc;
 	u32 maxlinewidth;
 };
 
-static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_connector *conn)
+static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_connector *conn)
 {
 	return container_of(conn, struct dpu_wb_connector, base);
 }
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
index d0f38a8b3561..11937e70e308 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
@@ -42,7 +42,7 @@ struct rcar_du_vsp;
  * @cmm: CMM associated with this CRTC
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
- * @writeback: the writeback connector
+ * @writeback: the drm connector which contains the writeback connector
  */
 struct rcar_du_crtc {
 	struct drm_crtc crtc;
@@ -72,7 +72,7 @@ struct rcar_du_crtc {
 	const char *const *sources;
 	unsigned int sources_count;
 
-	struct drm_writeback_connector writeback;
+	struct drm_connector writeback;
 };
 
 #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 9986a10e8114..186efe019891 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -50,7 +50,9 @@ static int rcar_du_wb_conn_get_modes(struct drm_connector *connector)
 static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
 				  struct drm_writeback_job *job)
 {
-	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
+	struct drm_connector *conn =
+		drm_writeback_to_connector(connector);
+	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(conn);
 	struct rcar_du_wb_job *rjob;
 	int ret;
 
@@ -75,7 +77,9 @@ static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
 static void rcar_du_wb_cleanup_job(struct drm_writeback_connector *connector,
 				   struct drm_writeback_job *job)
 {
-	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
+	struct drm_connector *conn =
+		drm_writeback_to_connector(connector);
+	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(conn);
 	struct rcar_du_wb_job *rjob = job->priv;
 
 	if (!job->fb)
@@ -199,8 +203,7 @@ static const u32 writeback_formats[] = {
 int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
-	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
-
+	struct drm_writeback_connector *wb_conn = &rcrtc->writeback.writeback;
 	struct drm_encoder *encoder;
 
 	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
@@ -212,7 +215,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 
 	encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
 
-	drm_connector_helper_add(&wb_conn->base,
+	drm_connector_helper_add(&rcrtc->writeback,
 				 &rcar_du_wb_conn_helper_funcs);
 
 	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
@@ -231,7 +234,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
 	struct drm_framebuffer *fb;
 	unsigned int i;
 
-	state = rcrtc->writeback.base.state;
+	state = rcrtc->writeback.state;
 	if (!state || !state->writeback_job)
 		return;
 
@@ -246,10 +249,10 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
 		cfg->mem[i] = sg_dma_address(rjob->sg_tables[i].sgl)
 			    + fb->offsets[i];
 
-	drm_writeback_queue_job(&rcrtc->writeback, state);
+	drm_writeback_queue_job(&rcrtc->writeback.writeback, state);
 }
 
 void rcar_du_writeback_complete(struct rcar_du_crtc *rcrtc)
 {
-	drm_writeback_signal_completion(&rcrtc->writeback, 0);
+	drm_writeback_signal_completion(&rcrtc->writeback.writeback, 0);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index fef4e4ee47cf..2428807e9714 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -167,7 +167,7 @@ struct vc4_txp {
 	struct platform_device *pdev;
 
 	struct vc4_encoder encoder;
-	struct drm_writeback_connector connector;
+	struct drm_connector connector;
 
 	void __iomem *regs;
 };
@@ -176,7 +176,7 @@ struct vc4_txp {
 	container_of_const(_encoder, struct vc4_txp, encoder.base)
 
 #define connector_to_vc4_txp(_connector)				\
-	container_of_const(_connector, struct vc4_txp, connector.base)
+	container_of_const(_connector, struct vc4_txp, connector)
 
 static const struct debugfs_reg32 txp_regs[] = {
 	VC4_REG32(TXP_DST_PTR),
@@ -356,7 +356,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 
 	TXP_WRITE(TXP_DST_CTRL, ctrl);
 
-	drm_writeback_queue_job(&txp->connector, conn_state);
+	drm_writeback_queue_job(&txp->connector.writeback, conn_state);
 
 	drm_dev_exit(idx);
 }
@@ -504,7 +504,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	 */
 	TXP_WRITE(TXP_DST_CTRL, TXP_READ(TXP_DST_CTRL) & ~TXP_EI);
 	vc4_crtc_handle_vblank(vc4_crtc);
-	drm_writeback_signal_completion(&txp->connector, 0);
+	drm_writeback_signal_completion(&txp->connector.writeback, 0);
 
 	return IRQ_HANDLED;
 }
@@ -598,9 +598,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_connector_helper_add(&txp->connector.base,
+	drm_connector_helper_add(&txp->connector,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drmm_writeback_connector_init(drm, &txp->connector,
+	ret = drmm_writeback_connector_init(drm, &txp->connector.writeback,
 					    &vc4_txp_connector_funcs,
 					    encoder,
 					    drm_fmts, ARRAY_SIZE(drm_fmts));
@@ -622,7 +622,7 @@ static void vc4_txp_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_txp *txp = dev_get_drvdata(dev);
 
-	drm_connector_cleanup(&txp->connector.base);
+	drm_connector_cleanup(&txp->connector);
 }
 
 static const struct component_ops vc4_txp_ops = {
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index fa269d279e25..4d0bafdebcd1 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -543,7 +543,7 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 
 	if (wb_pending) {
-		drm_writeback_signal_completion(&out->wb_connector, 0);
+		drm_writeback_signal_completion(&out->wb_connector.writeback, 0);
 		spin_lock_irq(&out->composer_lock);
 		crtc_state->wb_pending = false;
 		spin_unlock_irq(&out->composer_lock);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8013c31efe3b..cb5b96e8cc49 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -213,7 +213,7 @@ struct vkms_crtc_state {
  */
 struct vkms_output {
 	struct drm_crtc crtc;
-	struct drm_writeback_connector wb_connector;
+	struct drm_connector wb_connector;
 	struct drm_encoder wb_encoder;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 45d69a3b85f6..6b4d1c4a1830 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -102,10 +102,13 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 	return ret;
 }
 
-static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
+static void vkms_wb_cleanup_job(struct drm_writeback_connector *wb_conn,
 				struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob = job->priv;
+	struct drm_connector *connector = container_of(wb_conn,
+						       struct drm_connector,
+						       writeback);
 	struct vkms_output *vkms_output = container_of(connector,
 						       struct vkms_output,
 						       wb_connector);
@@ -127,8 +130,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
 	struct vkms_output *output = drm_crtc_to_vkms_output(connector_state->crtc);
-	struct drm_writeback_connector *wb_conn = &output->wb_connector;
-	struct drm_connector_state *conn_state = wb_conn->base.state;
+	struct drm_writeback_connector *wb_conn = &output->wb_connector.writeback;
+	struct drm_connector_state *conn_state = output->wb_connector.state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
 	u16 crtc_height = crtc_state->base.mode.vdisplay;
@@ -166,7 +169,7 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 				    struct vkms_output *vkms_output)
 {
-	struct drm_writeback_connector *wb = &vkms_output->wb_connector;
+	struct drm_writeback_connector *wb = &vkms_output->wb_connector.writeback;
 	int ret;
 
 	ret = drmm_encoder_init(&vkmsdev->drm, &vkms_output->wb_encoder,
@@ -177,7 +180,7 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 	vkms_output->wb_encoder.possible_clones |=
 		drm_encoder_mask(&vkms_output->wb_encoder);
 
-	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
+	drm_connector_helper_add(&vkms_output->wb_connector, &vkms_wb_conn_helper_funcs);
 
 	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
 					     &vkms_wb_connector_funcs,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..b46bb4c48ef5 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1882,6 +1882,61 @@ struct drm_connector_cec {
 	void *data;
 };
 
+/**
+ * struct drm_writeback_connector - DRM writeback connector
+ */
+struct drm_writeback_connector {
+	/**
+	 * @pixel_formats_blob_ptr:
+	 *
+	 * DRM blob property data for the pixel formats list on writeback
+	 * connectors
+	 * See also drm_writeback_connector_init()
+	 */
+	struct drm_property_blob *pixel_formats_blob_ptr;
+
+	/** @job_lock: Protects job_queue */
+	spinlock_t job_lock;
+
+	/**
+	 * @job_queue:
+	 *
+	 * Holds a list of a connector's writeback jobs; the last item is the
+	 * most recent. The first item may be either waiting for the hardware
+	 * to begin writing, or currently being written.
+	 *
+	 * See also: drm_writeback_queue_job() and
+	 * drm_writeback_signal_completion()
+	 */
+	struct list_head job_queue;
+
+	/**
+	 * @fence_context:
+	 *
+	 * timeline context used for fence operations.
+	 */
+	unsigned int fence_context;
+	/**
+	 * @fence_lock:
+	 *
+	 * spinlock to protect the fences in the fence_context.
+	 */
+	spinlock_t fence_lock;
+	/**
+	 * @fence_seqno:
+	 *
+	 * Seqno variable used as monotonic counter for the fences
+	 * created on the connector's timeline.
+	 */
+	unsigned long fence_seqno;
+	/**
+	 * @timeline_name:
+	 *
+	 * The name of the connector's fence timeline.
+	 */
+	char timeline_name[32];
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -2291,10 +2346,16 @@ struct drm_connector {
 	 */
 	struct llist_node free_node;
 
-	/**
-	 * @hdmi: HDMI-related variable and properties.
-	 */
-	struct drm_connector_hdmi hdmi;
+	union {
+		/**
+		 * @hdmi: HDMI-related variable and properties.
+		 */
+		struct drm_connector_hdmi hdmi;
+		/**
+		 * @writeback: Writeback related valriables.
+		 */
+		struct drm_writeback_connector writeback;
+	};
 
 	/**
 	 * @hdmi_audio: HDMI codec properties and non-DRM state.
@@ -2305,6 +2366,7 @@ struct drm_connector {
 	 * @cec: CEC-related data.
 	 */
 	struct drm_connector_cec cec;
+
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 958466a05e60..2a52b6761797 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -15,66 +15,6 @@
 #include <drm/drm_encoder.h>
 #include <linux/workqueue.h>
 
-/**
- * struct drm_writeback_connector - DRM writeback connector
- */
-struct drm_writeback_connector {
-	/**
-	 * @base: base drm_connector object
-	 */
-	struct drm_connector base;
-
-	/**
-	 * @pixel_formats_blob_ptr:
-	 *
-	 * DRM blob property data for the pixel formats list on writeback
-	 * connectors
-	 * See also drm_writeback_connector_init()
-	 */
-	struct drm_property_blob *pixel_formats_blob_ptr;
-
-	/** @job_lock: Protects job_queue */
-	spinlock_t job_lock;
-
-	/**
-	 * @job_queue:
-	 *
-	 * Holds a list of a connector's writeback jobs; the last item is the
-	 * most recent. The first item may be either waiting for the hardware
-	 * to begin writing, or currently being written.
-	 *
-	 * See also: drm_writeback_queue_job() and
-	 * drm_writeback_signal_completion()
-	 */
-	struct list_head job_queue;
-
-	/**
-	 * @fence_context:
-	 *
-	 * timeline context used for fence operations.
-	 */
-	unsigned int fence_context;
-	/**
-	 * @fence_lock:
-	 *
-	 * spinlock to protect the fences in the fence_context.
-	 */
-	spinlock_t fence_lock;
-	/**
-	 * @fence_seqno:
-	 *
-	 * Seqno variable used as monotonic counter for the fences
-	 * created on the connector's timeline.
-	 */
-	unsigned long fence_seqno;
-	/**
-	 * @timeline_name:
-	 *
-	 * The name of the connector's fence timeline.
-	 */
-	char timeline_name[32];
-};
-
 /**
  * struct drm_writeback_job - DRM writeback job
  */
@@ -131,10 +71,16 @@ struct drm_writeback_job {
 	void *priv;
 };
 
+static inline struct drm_connector *
+drm_writeback_to_connector(struct drm_writeback_connector *wb_connector)
+{
+	return container_of(wb_connector, struct drm_connector, writeback);
+}
+
 static inline struct drm_writeback_connector *
 drm_connector_to_writeback(struct drm_connector *connector)
 {
-	return container_of(connector, struct drm_writeback_connector, base);
+	return &connector->writeback;
 }
 
 int drm_writeback_connector_init(struct drm_device *dev,
-- 
2.34.1

