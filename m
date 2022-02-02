Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBE4A6D30
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B7C10FACD;
	Wed,  2 Feb 2022 08:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B8410FACA;
 Wed,  2 Feb 2022 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643791590; x=1675327590;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Y33YHlF84zV+nKeX2g0HyWy5RGc9siF8z8lkj8ixTpw=;
 b=XtckCoZPZ83hDGMY3Dqv6jfvu4bYqjmdfuvihQo8IsioSo70sor5t4fV
 PC5q2sh230oN44ca3OKnQB2KTSkmKOt4Al/8Ce6LIiy6z8rmDtHWTVGln
 KeSI05rtisadiXpAPrLMzf4MyCxG8V0zWPVoXlePC59ies3QNLjeKqZLu
 Y5JhmSj5Rbq/OdxO1pY3LAEo0+a7SQ/0VM2pluO8X/vblJOLaha7QNOau
 RyC0/Dw2/RHBdqmI1FU95YI2IVumCP21CuIWnnvU3WET9BAuBfek8dfZZ
 HEfwwBlix2zKSVS8eRc2L0CkKxEzIgDVRFF5tSy2jn9rQ7VTDuRf3Huzp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="245469295"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="245469295"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 00:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="497675044"
Received: from srr4-3-linux-116-skandpal.iind.intel.com ([10.190.238.57])
 by orsmga002.jf.intel.com with ESMTP; 02 Feb 2022 00:46:26 -0800
From: Kandpal Suraj <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Date: Wed,  2 Feb 2022 14:24:28 +0530
Message-Id: <20220202085429.22261-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202085429.22261-1-suraj.kandpal@intel.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
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

