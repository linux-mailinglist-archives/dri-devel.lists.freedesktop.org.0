Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E89F4A6CA8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0A210F9AB;
	Wed,  2 Feb 2022 08:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBEE10F9A6;
 Wed,  2 Feb 2022 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643789308; x=1675325308;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=WjprCVyvxgEpjhy2scvqaJ8WAB9X3KsSsSzJ80zkS+I=;
 b=IeVkaN1bkPuTP27Xd/IQxTcjk8biLGTGr3chaXo2+A1q/ZIbnazhinj1
 tgkZunc8NuAvjnKeKgmEAoZd3T0yHLgm8uGKzG6U+IfhB7VxxDqg+KOqc
 K33gU979tkjW0ppdcKfZPrbxmtrR0asyMrRocr0HCohs8Hs8WtzZ1sHWu
 DBDSiTiHZ/PctBMjFdovvHyyrLctVqs9ru+e4i9oAqjAoMeSxwC5O/UL2
 n+qdDBrggYwIoZrLrfjV8Y9dqoXlURVwMGpiJjRIYUlcOIeSmNItfRHy4
 suDxqMROhpslg/IcBrEsxy1rljuuQf6US5ky1Enba0JWgCZORCvfObVh9 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="247637924"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="247637924"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 00:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="771367984"
Received: from srr4-3-linux-116-skandpal.iind.intel.com ([10.190.238.57])
 by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2022 00:08:25 -0800
From: Kandpal Suraj <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/arm/komeda : change driver to use
 drm_writeback_connector.base pointer
Date: Wed,  2 Feb 2022 13:46:58 +0530
Message-Id: <20220202081702.22119-2-suraj.kandpal@intel.com>
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

Making changes to komeda driver because we had to change
drm_writeback_connector.base into a pointer the reason for which is
expained in the Patch (drm: add writeback pointers to drm_connector).

Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c      |  2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h       |  3 ++-
 .../gpu/drm/arm/display/komeda/komeda_wb_connector.c  | 11 ++++++-----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 59172acb9738..eb37f41c1790 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -265,7 +265,7 @@ komeda_crtc_do_flush(struct drm_crtc *crtc,
 	if (slave && has_bit(slave->id, kcrtc_st->affected_pipes))
 		komeda_pipeline_update(slave, old->state);
 
-	conn_st = wb_conn ? wb_conn->base.base.state : NULL;
+	conn_st = wb_conn ? wb_conn->base.base->state : NULL;
 	if (conn_st && conn_st->writeback_job)
 		drm_writeback_queue_job(&wb_conn->base, conn_st);
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
index 456f3c435719..8d83883a1d99 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
@@ -53,6 +53,7 @@ struct komeda_plane_state {
  * struct komeda_wb_connector
  */
 struct komeda_wb_connector {
+	struct drm_connector conn;
 	/** @base: &drm_writeback_connector */
 	struct drm_writeback_connector base;
 
@@ -136,7 +137,7 @@ struct komeda_kms_dev {
 static inline bool is_writeback_only(struct drm_crtc_state *st)
 {
 	struct komeda_wb_connector *wb_conn = to_kcrtc(st->crtc)->wb_conn;
-	struct drm_connector *conn = wb_conn ? &wb_conn->base.base : NULL;
+	struct drm_connector *conn = wb_conn ? wb_conn->base.base : NULL;
 
 	return conn && (st->connector_mask == BIT(drm_connector_index(conn)));
 }
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index e465cc4879c9..2c3dec59fd88 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -51,7 +51,7 @@ komeda_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	wb_layer = to_kconn(to_wb_conn(conn_st->connector))->wb_layer;
+	wb_layer = to_kconn(drm_connector_to_writeback(conn_st->connector))->wb_layer;
 
 	/*
 	 * No need for a full modested when the only connector changed is the
@@ -123,7 +123,7 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
 static void komeda_wb_connector_destroy(struct drm_connector *connector)
 {
 	drm_connector_cleanup(connector);
-	kfree(to_kconn(to_wb_conn(connector)));
+	kfree(to_kconn(drm_connector_to_writeback(connector)));
 }
 
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
@@ -155,7 +155,8 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	kwb_conn->wb_layer = kcrtc->master->wb_layer;
 
 	wb_conn = &kwb_conn->base;
-	wb_conn->encoder.possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
+	wb_conn->base = &kwb_conn->conn;
+	wb_conn->encoder->possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
 
 	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
 					       kwb_conn->wb_layer->layer_type,
@@ -171,9 +172,9 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return err;
 	}
 
-	drm_connector_helper_add(&wb_conn->base, &komeda_wb_conn_helper_funcs);
+	drm_connector_helper_add(wb_conn->base, &komeda_wb_conn_helper_funcs);
 
-	info = &kwb_conn->base.base.display_info;
+	info = &kwb_conn->base.base->display_info;
 	info->bpc = __fls(kcrtc->master->improc->supported_color_depths);
 	info->color_formats = kcrtc->master->improc->supported_color_formats;
 
-- 
2.17.1

