Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64EB898FA6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6321134E4;
	Thu,  4 Apr 2024 20:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYkUcnSz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD731134E7;
 Thu,  4 Apr 2024 20:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262838; x=1743798838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7pIUyEFFl3gq+ayHS2T8HUPlYUfblUFYwYzVwFjtB4=;
 b=GYkUcnSzG0yolRBbQctkBBFx4OwoN83p3rKe8KWAXC1R5uIWALGATNNn
 gehhAQUECncbMCzulgR4ML+wUDkCCqMpuHBDEIFmplNSYO6f6Dnok0Rny
 2qSP2TnHu8QPvCGyHyt3slTKzwvIx8xr2YjJxmfoUBH9aoo39wBmLgeiD
 wGjmqRflL53dqL6kq86MFzux0wOvhy49Nj4uboYu0PRuQv2YZ6SLBjUb4
 sY7Kg1MTfIRXcQq1eGon1xA+xeyl9d86xme1dNsU9foGwKAr7ggSe11Ip
 KugghawwGbJJiVM9ExTfo5vmBHTFwDModWGTbYoBh9HjzJI4WnxpykI2f w==;
X-CSE-ConnectionGUID: zUZD8qltSJmj/8N03Th+vA==
X-CSE-MsgGUID: 1DeAKIS7TACcs3B9Rah7Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019740"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019740"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790583"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790583"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:33:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:33:55 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/12] drm/client: Constify modes
Date: Thu,  4 Apr 2024 23:33:30 +0300
Message-ID: <20240404203336.10454-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The modes used by the client code live on the connectors' mode
lists, which are not owned by the client code, and thus it has
no business modifying the modes. Mark the modes const to make
that fact abundantly clear.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 36 +++++++++++++++-------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index cf1de06f99aa..384a9f8227a0 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -117,10 +117,10 @@ drm_client_find_modeset(struct drm_client_dev *client, struct drm_crtc *crtc)
 	return NULL;
 }
 
-static struct drm_display_mode *
+static const struct drm_display_mode *
 drm_connector_get_tiled_mode(struct drm_connector *connector)
 {
-	struct drm_display_mode *mode;
+	const struct drm_display_mode *mode;
 
 	list_for_each_entry(mode, &connector->modes, head) {
 		if (mode->hdisplay == connector->tile_h_size &&
@@ -130,10 +130,10 @@ drm_connector_get_tiled_mode(struct drm_connector *connector)
 	return NULL;
 }
 
-static struct drm_display_mode *
+static const struct drm_display_mode *
 drm_connector_fallback_non_tiled_mode(struct drm_connector *connector)
 {
-	struct drm_display_mode *mode;
+	const struct drm_display_mode *mode;
 
 	list_for_each_entry(mode, &connector->modes, head) {
 		if (mode->hdisplay == connector->tile_h_size &&
@@ -144,10 +144,10 @@ drm_connector_fallback_non_tiled_mode(struct drm_connector *connector)
 	return NULL;
 }
 
-static struct drm_display_mode *
+static const struct drm_display_mode *
 drm_connector_preferred_mode(struct drm_connector *connector, int width, int height)
 {
-	struct drm_display_mode *mode;
+	const struct drm_display_mode *mode;
 
 	list_for_each_entry(mode, &connector->modes, head) {
 		if (mode->hdisplay > width ||
@@ -159,10 +159,11 @@ drm_connector_preferred_mode(struct drm_connector *connector, int width, int hei
 	return NULL;
 }
 
-static struct drm_display_mode *drm_connector_pick_cmdline_mode(struct drm_connector *connector)
+static const struct drm_display_mode *
+drm_connector_pick_cmdline_mode(struct drm_connector *connector)
 {
-	struct drm_cmdline_mode *cmdline_mode;
-	struct drm_display_mode *mode;
+	const struct drm_cmdline_mode *cmdline_mode;
+	const struct drm_display_mode *mode;
 	bool prefer_non_interlace;
 
 	/*
@@ -258,13 +259,14 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
 static bool drm_client_target_cloned(struct drm_device *dev,
 				     struct drm_connector **connectors,
 				     unsigned int connector_count,
-				     struct drm_display_mode **modes,
+				     const struct drm_display_mode **modes,
 				     struct drm_client_offset *offsets,
 				     bool *enabled, int width, int height)
 {
 	int count, i, j;
 	bool can_clone = false;
-	struct drm_display_mode *dmt_mode, *mode;
+	const struct drm_display_mode *mode;
+	struct drm_display_mode *dmt_mode;
 
 	/* only contemplate cloning in the single crtc case */
 	if (dev->mode_config.num_crtc > 1)
@@ -342,7 +344,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 
 static int drm_client_get_tile_offsets(struct drm_connector **connectors,
 				       unsigned int connector_count,
-				       struct drm_display_mode **modes,
+				       const struct drm_display_mode **modes,
 				       struct drm_client_offset *offsets,
 				       int idx,
 				       int h_idx, int v_idx)
@@ -375,7 +377,7 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
 
 static bool drm_client_target_preferred(struct drm_connector **connectors,
 					unsigned int connector_count,
-					struct drm_display_mode **modes,
+					const struct drm_display_mode **modes,
 					struct drm_client_offset *offsets,
 					bool *enabled, int width, int height)
 {
@@ -492,7 +494,7 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
 				 struct drm_connector **connectors,
 				 unsigned int connector_count,
 				 struct drm_crtc **best_crtcs,
-				 struct drm_display_mode **modes,
+				 const struct drm_display_mode **modes,
 				 int n, int width, int height)
 {
 	struct drm_device *dev = client->dev;
@@ -567,7 +569,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 				       struct drm_connector **connectors,
 				       unsigned int connector_count,
 				       struct drm_crtc **crtcs,
-				       struct drm_display_mode **modes,
+				       const struct drm_display_mode **modes,
 				       struct drm_client_offset *offsets,
 				       bool *enabled, int width, int height)
 {
@@ -772,7 +774,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	struct drm_client_offset *offsets;
 	unsigned int connector_count = 0;
 	/* points to modes protected by mode_config.mutex */
-	struct drm_display_mode **modes;
+	const struct drm_display_mode **modes;
 	struct drm_crtc **crtcs;
 	int i, ret = 0;
 	bool *enabled;
@@ -844,7 +846,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	drm_client_modeset_release(client);
 
 	for (i = 0; i < connector_count; i++) {
-		struct drm_display_mode *mode = modes[i];
+		const struct drm_display_mode *mode = modes[i];
 		struct drm_crtc *crtc = crtcs[i];
 		struct drm_client_offset *offset = &offsets[i];
 
-- 
2.43.2

