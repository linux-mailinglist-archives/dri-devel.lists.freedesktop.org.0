Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41E5B20368
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F77310E3C2;
	Mon, 11 Aug 2025 09:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmVzPBnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2695710E3BF;
 Mon, 11 Aug 2025 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754904486; x=1786440486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+I09g7mEbT3RCiVSU9B/ew3Su1p++k/MeQyf+c1pCkA=;
 b=KmVzPBnX8tJXll23tHg1xKMmms7anr3OeICgwUYIRp9g4NOaOcUD62Jm
 +JMX5npN+cnY4tC+4vjSazNyPOW9+1ClxdCvfLNtPU97CJGVonPwxdAl8
 vrxzJtGpBkzaHHUGC0zpg4XyDyOq88CvhfwMJN1w9U1JSLALihuqsD9fv
 8C5TKr8LxQi0IsUfzfhzUMiFd95fQ9sC4HHdofHUrNkNscB6aW19dn38p
 9WCMwaP7w0SJdx1+O5u43hNzih9ourXVn8Gq8zPgRBOflEMe9Zq3nUHw2
 2NABnJtW54wbxJPpUcOzajt2HnbZ9GYW8eT5ZC9Rc7LQJCcniJEgOhEEX A==;
X-CSE-ConnectionGUID: JsJiMZ7UTVymvzd25d8pYA==
X-CSE-MsgGUID: iBwtUnSsSISX+of8x4foTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57217985"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57217985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 02:28:06 -0700
X-CSE-ConnectionGUID: 2Etn9NvEQNiMYjv425kg7g==
X-CSE-MsgGUID: Z/dDFyvCRMStFDeFBN+ucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165860361"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:27:57 -0700
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
Subject: [RFC PATCH 3/8] drm/arm/komeda: Adapt komeda writeback to new
 drm_writeback_connector
Date: Mon, 11 Aug 2025 14:57:02 +0530
Message-Id: <20250811092707.3986802-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811092707.3986802-1-suraj.kandpal@intel.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
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

Now that drm_writeback_connector is embedded with the drm_connector
adapt the komeda writeback functionality to this changes. This includes
changing the drm_writeback_connector to be changed to drm_connector
within the komeda_wb_connector.
Some other changes are done which are a result of the all the above
changes mentioned.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c         | 6 +++---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h          | 6 +++---
 drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

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
 
-- 
2.34.1

