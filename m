Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A898EE2A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FD410E80E;
	Thu,  3 Oct 2024 11:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVYvjx+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D163410E80E;
 Thu,  3 Oct 2024 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727955191; x=1759491191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rm5LSkURhard/N2DpG0TI0MuslvYk0AZcCxYaokZlOA=;
 b=FVYvjx+sahosBytJASfSk2xF8+xhf35pTQOWqwtTWRd4PrYcv/REoAPh
 3m5wYJKm4YDhd8QduVJq32rrPUXqmOPvQlKWDACAstFJYBrbR5CFLOlmG
 7x7i7yct8pF8No/4acEMn+4BkIWxaavSUVGwPm8/83TjSnDs6aEu896ca
 qq2gFxIN3nSA6QJ78CUTow/WhGdpbfgkTGQSdsOUW/fUp6IjHiTRJEoos
 EhNTsz4RjLWLJ2MlxXKQewPSPbNUn59rHxVCN8gFXsF7FpYmMYeZFF9hO
 pFfxs9QsaGKiJDqNFCs5Sy0QITGcMrwwosne482O5hnf9fMTW8tdEM3XO A==;
X-CSE-ConnectionGUID: NYcr2+iBSXq+nkj2OLVQwg==
X-CSE-MsgGUID: RzDUQB0lRaekMIG0o7OdaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38502977"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38502977"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:33:11 -0700
X-CSE-ConnectionGUID: xliktpP5Td6mI5q74EbI5Q==
X-CSE-MsgGUID: kDfVsZTzRMeOGb4RrQBemQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74426493"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:33:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:33:07 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/8] drm/client: Constify modes
Date: Thu,  3 Oct 2024 14:32:57 +0300
Message-ID: <20241003113304.11700-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
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
index 251f94313717..20882dffcf5e 100644
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
@@ -791,7 +794,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	struct drm_client_offset *offsets;
 	unsigned int connector_count = 0;
 	/* points to modes protected by mode_config.mutex */
-	struct drm_display_mode **modes;
+	const struct drm_display_mode **modes;
 	struct drm_crtc **crtcs;
 	int i, ret = 0;
 	bool *enabled;
@@ -862,7 +865,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	drm_client_modeset_release(client);
 
 	for (i = 0; i < connector_count; i++) {
-		struct drm_display_mode *mode = modes[i];
+		const struct drm_display_mode *mode = modes[i];
 		struct drm_crtc *crtc = crtcs[i];
 		struct drm_client_offset *offset = &offsets[i];
 
-- 
2.45.2

