Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E1A4BAEE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A1810E3A5;
	Mon,  3 Mar 2025 09:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTKz1H9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C722D10E3A6;
 Mon,  3 Mar 2025 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740994732; x=1772530732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xZuiZTAfl+ePLGIbfwsBfEl9qSUTfxWm27qZ5m57lbA=;
 b=NTKz1H9AmV1qIViT1n1Aw7G8RL3M8/NU+y/z/SUbmyoZwr68u8lFXbZ6
 RunU2VphiPw7Zdzhox353LsMpT8sWUJ2V6L7OW4dKslBH0SwIT9xV+NRQ
 XgRU9MgZQ0kcIdEJjL2ebck/wnazlb+GlMgJjn22PA7RM5yP8ZOUJIl8Q
 wkuUC0ZCgpzLtsQln878HNtr/PSaAdWi+W68laHfCc3Bw4Q7BC/RH10qQ
 t2GFFF3NcSIyA2JFptDg+f7HY+iaRSKGaJjHBcZNY8DV33YPHYoC9g4Mz
 4U1oz9SaZM0yJEAJ+pnIQKXIPtIgMbb6ghaXniRyLGQmaDJORb2gVO0s5 w==;
X-CSE-ConnectionGUID: eRFrJalPQF+vvq3CIOkAdw==
X-CSE-MsgGUID: rqKTt8o0TfiFMKM5hMEiSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59405986"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="59405986"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:38:51 -0800
X-CSE-ConnectionGUID: G+HOwPihTkiDD4RICQrpaA==
X-CSE-MsgGUID: NmylGy58QUivgrsWBI8Ydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123171515"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 03 Mar 2025 01:38:48 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Mar 2025 11:38:47 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/8] drm/client: Constify modes
Date: Mon,  3 Mar 2025 11:38:47 +0200
Message-ID: <20250303093847.7698-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250228211454.8138-2-ville.syrjala@linux.intel.com>
References: <20250228211454.8138-2-ville.syrjala@linux.intel.com>
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

v2: Fix up the kunit test

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c          | 39 ++++++++++---------
 .../gpu/drm/tests/drm_client_modeset_test.c   |  3 +-
 2 files changed, 23 insertions(+), 19 deletions(-)

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
 
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 7516f6cb36e4..cd43d2a52a2d 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -88,7 +88,8 @@ static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
 	struct drm_device *drm = priv->drm;
 	struct drm_connector *connector = &priv->connector;
 	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
-	struct drm_display_mode *expected_mode, *mode;
+	struct drm_display_mode *expected_mode;
+	const struct drm_display_mode *mode;
 	const char *cmdline = "1920x1080@60";
 	int ret;
 
-- 
2.45.3

