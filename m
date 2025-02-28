Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9865EA4A4CB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 22:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ABB10ED4B;
	Fri, 28 Feb 2025 21:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyfR+CbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C7210ED4C;
 Fri, 28 Feb 2025 21:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740777322; x=1772313322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nZhwkVdDFrW/cEmfLdhD2C5SpAJFryeQIbZrqy1Ms3Q=;
 b=cyfR+CbLrgPtPg2N0TOoZQPnbWBf3HFtkZVP7dKi58LJHg4R+UUsOiAP
 jLRqMFDi/ZH+60a5NTRhOxtrxIdVLHouTibAC0Aqag2vXIORkgX7DxMFT
 ErQ0+4rIXmRtShIlQSzC8o+iEF0lp7/0zITljnOOJtNmc99cultCTV5o1
 lINbtuJuXiUUdhxQ+LJl2kv8/oyoR48K8iNTtYfvLZAh43IWL9aokSNYE
 twKGQqyMGxbszWnj2HYxbgZ8owMmPZ1U2qph79M5RH/yp4IbUDOVXT7Ao
 +7YdPYm5I5cRydz7f/zkStpxRf9Q62KkJj6GU2vZMeCeZu+zICR82wBxB g==;
X-CSE-ConnectionGUID: /3FIKAb6TfG3P9sXB+79kw==
X-CSE-MsgGUID: vNmuQa/wRBK6YUUfPB6ysg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52352352"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="52352352"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 13:15:21 -0800
X-CSE-ConnectionGUID: CtuqCesEQn2C+qcGBEXBcA==
X-CSE-MsgGUID: u3WQcDLARASdClanGAxzPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122684929"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Feb 2025 13:15:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2025 23:15:18 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/client: Move variables to tighter scope
Date: Fri, 28 Feb 2025 23:14:53 +0200
Message-ID: <20250228211454.8138-8-ville.syrjala@linux.intel.com>
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

Bunch of variables are only needed inside loops and whatnot.
Move them to a tighter scope to make the code less confusing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 33 +++++++++++++++-------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index a0caa2b229dd..54cbcaa476e2 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -73,9 +73,10 @@ int drm_client_modeset_create(struct drm_client_dev *client)
 static void drm_client_modeset_release(struct drm_client_dev *client)
 {
 	struct drm_mode_set *modeset;
-	unsigned int i;
 
 	drm_client_for_each_modeset(modeset, client) {
+		unsigned int i;
+
 		drm_mode_destroy(client->dev, modeset->mode);
 		modeset->mode = NULL;
 		modeset->fb = NULL;
@@ -291,9 +292,8 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 				     struct drm_client_offset offsets[],
 				     bool enabled[], int width, int height)
 {
-	int count, i, j;
+	int count, i;
 	bool can_clone = false;
-	const struct drm_display_mode *mode;
 	struct drm_display_mode *dmt_mode;
 
 	/* only contemplate cloning in the single crtc case */
@@ -313,6 +313,8 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 	/* check the command line or if nothing common pick 1024x768 */
 	can_clone = true;
 	for (i = 0; i < connector_count; i++) {
+		int j;
+
 		if (!enabled[i])
 			continue;
 
@@ -347,6 +349,8 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 		goto fail;
 
 	for (i = 0; i < connector_count; i++) {
+		const struct drm_display_mode *mode;
+
 		if (!enabled[i])
 			continue;
 
@@ -380,12 +384,12 @@ static int drm_client_get_tile_offsets(struct drm_device *dev,
 				       int idx,
 				       int h_idx, int v_idx)
 {
-	struct drm_connector *connector;
 	int i;
 	int hoffset = 0, voffset = 0;
 
 	for (i = 0; i < connector_count; i++) {
-		connector = connectors[i];
+		struct drm_connector *connector = connectors[i];
+
 		if (!connector->has_tile)
 			continue;
 
@@ -415,7 +419,6 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 					bool enabled[], int width, int height)
 {
 	const u64 mask = BIT_ULL(connector_count) - 1;
-	struct drm_connector *connector;
 	u64 conn_configured = 0;
 	int tile_pass = 0;
 	int num_tiled_conns = 0;
@@ -429,9 +432,9 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 
 retry:
 	for (i = 0; i < connector_count; i++) {
+		struct drm_connector *connector = connectors[i];
 		const char *mode_type;
 
-		connector = connectors[i];
 
 		if (conn_configured & BIT_ULL(i))
 			continue;
@@ -546,9 +549,8 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
 	struct drm_device *dev = client->dev;
 	struct drm_connector *connector;
 	int my_score, best_score, score;
-	struct drm_crtc **crtcs, *crtc;
+	struct drm_crtc **crtcs;
 	struct drm_mode_set *modeset;
-	int o;
 
 	if (n == connector_count)
 		return 0;
@@ -578,7 +580,8 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
 	 * remaining connectors
 	 */
 	drm_client_for_each_modeset(modeset, client) {
-		crtc = modeset->crtc;
+		struct drm_crtc *crtc = modeset->crtc;
+		int o;
 
 		if (!connector_has_possible_crtc(connector, crtc))
 			continue;
@@ -622,7 +625,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	const int count = min_t(unsigned int, connector_count, BITS_PER_LONG);
 	unsigned long conn_configured, conn_seq, mask;
 	struct drm_device *dev = client->dev;
-	int i, j;
+	int i;
 	bool *save_enabled;
 	bool fallback = true, ret = true;
 	int num_connectors_enabled = 0;
@@ -656,12 +659,11 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 retry:
 	conn_seq = conn_configured;
 	for (i = 0; i < count; i++) {
-		struct drm_connector *connector;
+		struct drm_connector *connector = connectors[i];
 		struct drm_encoder *encoder;
 		struct drm_crtc *crtc;
 		const char *mode_type;
-
-		connector = connectors[i];
+		int j;
 
 		if (conn_configured & BIT(i))
 			continue;
@@ -1239,11 +1241,12 @@ static void drm_client_modeset_dpms_legacy(struct drm_client_dev *client, int dp
 	struct drm_connector *connector;
 	struct drm_mode_set *modeset;
 	struct drm_modeset_acquire_ctx ctx;
-	int j;
 	int ret;
 
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	drm_client_for_each_modeset(modeset, client) {
+		int j;
+
 		if (!modeset->crtc->enabled)
 			continue;
 
-- 
2.45.3

