Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7718B98EE37
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA58910E814;
	Thu,  3 Oct 2024 11:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXIirvmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF9F10E821;
 Thu,  3 Oct 2024 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727955209; x=1759491209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NuHtJdJEXZoudh312q05jebSYfR677TsErJhjIjU/78=;
 b=NXIirvmzR67+Wk15VAyfAdw5DKn8vomSaLgbWM8KosINxXdha0oCMF/y
 kJQq8s7DVnxLwYo6veZcBB5mZ+f3I1aD/Tmm6MFSDNjv4po/TV25LPLGq
 jFxXhhwTx6hdrSJXDJ+nDvsCAAhkmzVmgHBL2WVQMb+Bw98lTwy/obZXM
 MlxAbiADO447Q8mPy928xYEV3VYZDjMY19HE9Hn/XsljRoisZhH/cqzPm
 gokwj1jdppJs4KwL4BMNokRgrhufkiCC3O3zsjmeuXz1C4hGHi2bTUmQ7
 sDqa0a42vlJhYiQxix7TFBIMVWfdSlOvzbcV/57omtTbQdcQr9U0tINcq A==;
X-CSE-ConnectionGUID: i1AFAQGdTK6LY20GfL1bbA==
X-CSE-MsgGUID: FszGU5blQCaMRI78NBDCJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38503015"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38503015"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:33:29 -0700
X-CSE-ConnectionGUID: iVSccN+ZTnmNx5tFCXSm9w==
X-CSE-MsgGUID: VqT8nmQATe69GevulRqtDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74426558"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:33:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:33:26 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/8] drm/client: Move variables to tighter scope
Date: Thu,  3 Oct 2024 14:33:03 +0300
Message-ID: <20241003113304.11700-8-ville.syrjala@linux.intel.com>
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

Bunch of variables are only needed inside loops and whatnot.
Move them to a tighter scope to make the code less confusing.

Also replace the 'unsigned int i' footguns with plain signed
ints.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 33 +++++++++++++++-------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index b82bb3119cb2..ccf5c9b5537b 100644
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
@@ -277,9 +278,8 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 				     struct drm_client_offset offsets[],
 				     bool enabled[], int width, int height)
 {
-	int count, i, j;
+	int count, i;
 	bool can_clone = false;
-	const struct drm_display_mode *mode;
 	struct drm_display_mode *dmt_mode;
 
 	/* only contemplate cloning in the single crtc case */
@@ -299,6 +299,8 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 	/* check the command line or if nothing common pick 1024x768 */
 	can_clone = true;
 	for (i = 0; i < connector_count; i++) {
+		int j;
+
 		if (!enabled[i])
 			continue;
 
@@ -332,6 +334,8 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 		goto fail;
 
 	for (i = 0; i < connector_count; i++) {
+		const struct drm_display_mode *mode;
+
 		if (!enabled[i])
 			continue;
 
@@ -365,12 +369,12 @@ static int drm_client_get_tile_offsets(struct drm_device *dev,
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
 
@@ -400,7 +404,6 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 					bool enabled[], int width, int height)
 {
 	const u64 mask = BIT_ULL(connector_count) - 1;
-	struct drm_connector *connector;
 	u64 conn_configured = 0;
 	int tile_pass = 0;
 	int num_tiled_conns = 0;
@@ -414,9 +417,9 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 
 retry:
 	for (i = 0; i < connector_count; i++) {
+		struct drm_connector *connector = connectors[i];
 		const char *mode_type;
 
-		connector = connectors[i];
 
 		if (conn_configured & BIT_ULL(i))
 			continue;
@@ -526,9 +529,8 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
 	struct drm_device *dev = client->dev;
 	struct drm_connector *connector;
 	int my_score, best_score, score;
-	struct drm_crtc **crtcs, *crtc;
+	struct drm_crtc **crtcs;
 	struct drm_mode_set *modeset;
-	int o;
 
 	if (n == connector_count)
 		return 0;
@@ -558,7 +560,8 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
 	 * remaining connectors
 	 */
 	drm_client_for_each_modeset(modeset, client) {
-		crtc = modeset->crtc;
+		struct drm_crtc *crtc = modeset->crtc;
+		int o;
 
 		if (!connector_has_possible_crtc(connector, crtc))
 			continue;
@@ -602,7 +605,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	const int count = min_t(unsigned int, connector_count, BITS_PER_LONG);
 	unsigned long conn_configured, conn_seq, mask;
 	struct drm_device *dev = client->dev;
-	int i, j;
+	int i;
 	bool *save_enabled;
 	bool fallback = true, ret = true;
 	int num_connectors_enabled = 0;
@@ -636,12 +639,11 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
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
@@ -1204,11 +1206,12 @@ static void drm_client_modeset_dpms_legacy(struct drm_client_dev *client, int dp
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
2.45.2

