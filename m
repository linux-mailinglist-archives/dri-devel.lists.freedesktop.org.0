Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78100A4A4BE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 22:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C8310ED45;
	Fri, 28 Feb 2025 21:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeGlIM8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86D410ED42;
 Fri, 28 Feb 2025 21:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740777302; x=1772313302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awWZi+Om+LbgWvG/mpX6NzaEi/Shq4lbxv+GyeJFyec=;
 b=QeGlIM8nYdoA77Rr4gfh28GMGqfdMpFiSIz1w6r2e8e9hqQu0lHTsBas
 A5tDiGc/JaoXFPvox+nY9UZmuedAXjomTD2YEV6b07fDDJTA0TM1JEJkD
 nK7IJmb61LHIruLNx4rw0OVJLsfaTDeatomxbYpM3KzY0zy0iqTtPhFnQ
 4OTmCFy67LI6/XL0dTvqTsFlrv4IZAdcL3GhmL5/WSMdscljPRissCwv9
 aah0SW/qD5iy8Yex8nyyz6TldTbZo5rtLy+acYumCmOEsCerb1NHBIi2J
 HotGbq5/Glyka79cSkJu+rVMh3IIzaRbzVQ6uJpSAEqF4BV6UdE3kqO7d g==;
X-CSE-ConnectionGUID: gyNfz4ltQluugycfYMtLlg==
X-CSE-MsgGUID: CohS4/dESZev55ZLwSyohA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52352291"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="52352291"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 13:15:01 -0800
X-CSE-ConnectionGUID: QGCfdCleRyCIFkp/SLcBzQ==
X-CSE-MsgGUID: uzchl3J0RNml1JQr1dNhwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122684762"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Feb 2025 13:14:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2025 23:14:58 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/8] drm/client: Constify modes
Date: Fri, 28 Feb 2025 23:14:47 +0200
Message-ID: <20250228211454.8138-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
References: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 39 +++++++++++++++-------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index aca442c25209..b114d1b8793b 100644
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
@@ -159,16 +159,18 @@ drm_connector_preferred_mode(struct drm_connector *connector, int width, int hei
 	return NULL;
 }
 
-static struct drm_display_mode *drm_connector_first_mode(struct drm_connector *connector)
+static const struct drm_display_mode *
+drm_connector_first_mode(struct drm_connector *connector)
 {
 	return list_first_entry_or_null(&connector->modes,
 					struct drm_display_mode, head);
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
@@ -266,13 +268,14 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
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
@@ -351,7 +354,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 static int drm_client_get_tile_offsets(struct drm_device *dev,
 				       struct drm_connector **connectors,
 				       unsigned int connector_count,
-				       struct drm_display_mode **modes,
+				       const struct drm_display_mode **modes,
 				       struct drm_client_offset *offsets,
 				       int idx,
 				       int h_idx, int v_idx)
@@ -386,7 +389,7 @@ static int drm_client_get_tile_offsets(struct drm_device *dev,
 static bool drm_client_target_preferred(struct drm_device *dev,
 					struct drm_connector **connectors,
 					unsigned int connector_count,
-					struct drm_display_mode **modes,
+					const struct drm_display_mode **modes,
 					struct drm_client_offset *offsets,
 					bool *enabled, int width, int height)
 {
@@ -505,7 +508,7 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
 				 struct drm_connector **connectors,
 				 unsigned int connector_count,
 				 struct drm_crtc **best_crtcs,
-				 struct drm_display_mode **modes,
+				 const struct drm_display_mode **modes,
 				 int n, int width, int height)
 {
 	struct drm_device *dev = client->dev;
@@ -580,7 +583,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 				       struct drm_connector **connectors,
 				       unsigned int connector_count,
 				       struct drm_crtc **crtcs,
-				       struct drm_display_mode **modes,
+				       const struct drm_display_mode **modes,
 				       struct drm_client_offset *offsets,
 				       bool *enabled, int width, int height)
 {
@@ -800,7 +803,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	struct drm_client_offset *offsets;
 	unsigned int connector_count = 0;
 	/* points to modes protected by mode_config.mutex */
-	struct drm_display_mode **modes;
+	const struct drm_display_mode **modes;
 	struct drm_crtc **crtcs;
 	int i, ret = 0;
 	bool *enabled;
@@ -871,7 +874,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	drm_client_modeset_release(client);
 
 	for (i = 0; i < connector_count; i++) {
-		struct drm_display_mode *mode = modes[i];
+		const struct drm_display_mode *mode = modes[i];
 		struct drm_crtc *crtc = crtcs[i];
 		struct drm_client_offset *offset = &offsets[i];
 
-- 
2.45.3

