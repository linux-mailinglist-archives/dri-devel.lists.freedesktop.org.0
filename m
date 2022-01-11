Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7465248AB0C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 11:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1AD10E8A0;
	Tue, 11 Jan 2022 10:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A133910E8A0;
 Tue, 11 Jan 2022 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641895794; x=1673431794;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=hNanYDvEujPhHa3DRNWCLQva2fSMfaX3lt33sEeZZJg=;
 b=nyF5hVf2Qe9jlStk7iinYCrNWxYS7cEuXBAzWf+ZJTD0KI8EMw0oQldI
 uFApZT0TsATPVmCN16o5RuRU3bip4DV+WoqidiGrcKpMbT3adhh2H9qo3
 z2k0+PlGqUIaQpElrXnNr0nWY1fZAq6OQnFM+MdCtf4zRHggzEzti7MVt
 d9p7MZclEV6HjZ3fVi5WRy4e27zwu9E774K54cS0c7Lf4aasoupMjBtuK
 AhvToNYNKeeOkOphm+kkKklGJ9bncz3MyYZSVDurBK3xrOaJfPhvkzFwx
 9P8CQNrijmKRZGHU7ZawmW58CPbDxmyJsxHFTkq0fu57QIFysdmgXkISp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="230792385"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="230792385"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 02:09:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="762482691"
Received: from srr4-3-linux-116-skandpal.iind.intel.com ([10.190.238.57])
 by fmsmga006.fm.intel.com with ESMTP; 11 Jan 2022 02:09:44 -0800
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/arm/komeda : change driver to use
 drm_writeback_connector.base pointer
Date: Tue, 11 Jan 2022 15:48:00 +0530
Message-Id: <20220111101801.28310-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111101801.28310-1-suraj.kandpal@intel.com>
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
	arun.r.murthy@intel.com, Kandpal@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Making changes to komeda driver because we had to change
drm_writeback_connector.base into a pointer the reason for which is
expained in the Patch (drm: add writeback pointers to drm_connector).

Signed-off-by: Kandpal, Suraj <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c         | 2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h          | 3 ++-
 drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c | 9 +++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

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
index e465cc4879c9..0caaf483276d 100644
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
@@ -155,6 +155,7 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	kwb_conn->wb_layer = kcrtc->master->wb_layer;
 
 	wb_conn = &kwb_conn->base;
+	wb_conn->base = &kwb_conn->conn;
 	wb_conn->encoder.possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
 
 	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
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

