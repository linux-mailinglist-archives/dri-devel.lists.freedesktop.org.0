Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3764A6CAE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9399210F9AE;
	Wed,  2 Feb 2022 08:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA8610F9AE;
 Wed,  2 Feb 2022 08:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643789321; x=1675325321;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Y33YHlF84zV+nKeX2g0HyWy5RGc9siF8z8lkj8ixTpw=;
 b=TWvzv+qyMtU4BwYmg9xORIE8pvbE1lNA+ikQeNLuaIxX4NZMeSpITj5q
 hdHqmYMIOOYIUNjlw6DqHPZVJng0zg9uq0pX3AuHdOWxv1cr3oe2Jk7zb
 XOixBzaO5XOMgqLhZLD+TXUoVsyCZ4HKehcPRjZzNGpJL4JpMlQ2LQKb1
 3yUDHr7yFliDTA/KBxUhQLxeinvZnYPHogeJuMUBCXdk/Si0a5A1XNlFK
 gqMb4NmvfQWBiuCWkCuhlia0Xy3DD1b3qusas4EyG4WsJH1hq+hvU6XJw
 UtjCiUNaavaS70mrGl7g5xg63OgA2S5HJtbCiEmIJpzV7O1GOd6seMjA7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="247637948"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="247637948"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 00:08:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="771368027"
Received: from srr4-3-linux-116-skandpal.iind.intel.com ([10.190.238.57])
 by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2022 00:08:38 -0800
From: Kandpal Suraj <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Date: Wed,  2 Feb 2022 13:47:01 +0530
Message-Id: <20220202081702.22119-5-suraj.kandpal@intel.com>
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

Changing rcar_du driver to accomadate the change of
drm_writeback_connector.base and drm_writeback_connector.encoder
to a pointer the reason for which is explained in the
Patch(drm: add writeback pointers to drm_connector).

Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 66e8839db708..68f387a04502 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -72,6 +72,8 @@ struct rcar_du_crtc {
 	const char *const *sources;
 	unsigned int sources_count;
 
+	struct drm_connector connector;
+	struct drm_encoder encoder;
 	struct drm_writeback_connector writeback;
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
index c79d1259e49b..5b1e83380c47 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
@@ -200,8 +200,10 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
 
-	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
-	drm_connector_helper_add(&wb_conn->base,
+	wb_conn->base = &rcrtc->connector;
+	wb_conn->encoder = &rcrtc->encoder;
+	wb_conn->encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
+	drm_connector_helper_add(wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
 	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
@@ -220,7 +222,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
 	struct drm_framebuffer *fb;
 	unsigned int i;
 
-	state = rcrtc->writeback.base.state;
+	state = rcrtc->writeback.base->state;
 	if (!state || !state->writeback_job)
 		return;
 
-- 
2.17.1

