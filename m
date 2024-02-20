Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F14085BCE7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 14:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4478E10E3E0;
	Tue, 20 Feb 2024 13:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JKlB6tsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C4710E30A;
 Tue, 20 Feb 2024 13:12:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA2CC60F95;
 Tue, 20 Feb 2024 13:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85C9C433F1;
 Tue, 20 Feb 2024 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708434776;
 bh=s1SpucEIIAcjPLhuLgsZlH5odgNDyxOWFs/Guv6vDE8=;
 h=From:To:Cc:Subject:Date:From;
 b=JKlB6tsFtc3p+hfuS+59jdaMbzo4j/x2RfjoDPlW1YnjM64jmcHz+s/LdFBpovJph
 b1L1nAdZ+T0U9QhOukvqjcUsRjwE3n5Ka5UDVGtgWT0X4iLRLAlRB9yRTDtI2YkbQ0
 +cdmv6PAa+gd/la7Ou3fBVekn45udD9jz8vlfYKGcVvuDYTBju6JfkxER0b9nkm3xe
 havVPPviT15aaqpp3Rv6+Z4bUOnbt6Jw+D5zWQVkyvZFSwGmPxTzjGl9DhSOWYY9Ao
 x59pJNB3Vc/P5HxtNfCcihRhKXPQ5QVqZ1s4gWiBODmkxeEzcfVjU7oHeAPAww5kJz
 JYO6/MPUC/RnQ==
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915/tv: Fix TV mode
Date: Tue, 20 Feb 2024 14:12:51 +0100
Message-ID: <20240220131251.453060-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
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

Commit 1fd4a5a36f9f ("drm/connector: Rename legacy TV property") failed
to update all the users of the struct drm_tv_connector_state mode field,
which resulted in a build failure in i915.

However, a subsequent commit in the same series reintroduced a mode
field in that structure, with a different semantic but the same type,
with the assumption that all previous users were updated.

Since that didn't happen, the i915 driver now compiles, but mixes
accesses to the legacy_mode field and the newer mode field, but with the
previous semantics.

This obviously doesn't work very well, so we need to update the accesses
that weren't in the legacy renaming commit.

Fixes: 1fd4a5a36f9f ("drm/connector: Rename legacy TV property")
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/i915/display/intel_sdvo.c | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_tv.c   | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 825638702ac1..5f9e748adc89 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1220,7 +1220,7 @@ static bool intel_sdvo_set_tv_format(struct intel_sdvo *intel_sdvo,
 	struct intel_sdvo_tv_format format;
 	u32 format_map;
 
-	format_map = 1 << conn_state->tv.mode;
+	format_map = 1 << conn_state->tv.legacy_mode;
 	memset(&format, 0, sizeof(format));
 	memcpy(&format, &format_map, min(sizeof(format), sizeof(format_map)));
 
@@ -2323,7 +2323,7 @@ static int intel_sdvo_get_tv_modes(struct drm_connector *connector)
 	 * Read the list of supported input resolutions for the selected TV
 	 * format.
 	 */
-	format_map = 1 << conn_state->tv.mode;
+	format_map = 1 << conn_state->tv.legacy_mode;
 	memcpy(&tv_res, &format_map,
 	       min(sizeof(format_map), sizeof(struct intel_sdvo_sdtv_resolution_request)));
 
@@ -2388,7 +2388,7 @@ intel_sdvo_connector_atomic_get_property(struct drm_connector *connector,
 		int i;
 
 		for (i = 0; i < intel_sdvo_connector->format_supported_num; i++)
-			if (state->tv.mode == intel_sdvo_connector->tv_format_supported[i]) {
+			if (state->tv.legacy_mode == intel_sdvo_connector->tv_format_supported[i]) {
 				*val = i;
 
 				return 0;
@@ -2444,7 +2444,7 @@ intel_sdvo_connector_atomic_set_property(struct drm_connector *connector,
 	struct intel_sdvo_connector_state *sdvo_state = to_intel_sdvo_connector_state(state);
 
 	if (property == intel_sdvo_connector->tv_format) {
-		state->tv.mode = intel_sdvo_connector->tv_format_supported[val];
+		state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[val];
 
 		if (state->crtc) {
 			struct drm_crtc_state *crtc_state =
@@ -3108,7 +3108,7 @@ static bool intel_sdvo_tv_create_property(struct intel_sdvo *intel_sdvo,
 		drm_property_add_enum(intel_sdvo_connector->tv_format, i,
 				      tv_format_names[intel_sdvo_connector->tv_format_supported[i]]);
 
-	intel_sdvo_connector->base.base.state->tv.mode = intel_sdvo_connector->tv_format_supported[0];
+	intel_sdvo_connector->base.base.state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[0];
 	drm_object_attach_property(&intel_sdvo_connector->base.base.base,
 				   intel_sdvo_connector->tv_format, 0);
 	return true;
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index a96bcfcf90a3..2b77d399f1a1 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -950,7 +950,7 @@ intel_disable_tv(struct intel_atomic_state *state,
 
 static const struct tv_mode *intel_tv_mode_find(const struct drm_connector_state *conn_state)
 {
-	int format = conn_state->tv.mode;
+	int format = conn_state->tv.legacy_mode;
 
 	return &tv_modes[format];
 }
@@ -1705,7 +1705,7 @@ static void intel_tv_find_better_format(struct drm_connector *connector)
 			break;
 	}
 
-	connector->state->tv.mode = i;
+	connector->state->tv.legacy_mode = i;
 }
 
 static int
@@ -1863,7 +1863,7 @@ static int intel_tv_atomic_check(struct drm_connector *connector,
 	old_state = drm_atomic_get_old_connector_state(state, connector);
 	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 
-	if (old_state->tv.mode != new_state->tv.mode ||
+	if (old_state->tv.legacy_mode != new_state->tv.legacy_mode ||
 	    old_state->tv.margins.left != new_state->tv.margins.left ||
 	    old_state->tv.margins.right != new_state->tv.margins.right ||
 	    old_state->tv.margins.top != new_state->tv.margins.top ||
@@ -1900,7 +1900,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
 	conn_state->tv.margins.right = 46;
 	conn_state->tv.margins.bottom = 37;
 
-	conn_state->tv.mode = 0;
+	conn_state->tv.legacy_mode = 0;
 
 	/* Create TV properties then attach current values */
 	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
@@ -1914,7 +1914,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
 
 	drm_object_attach_property(&connector->base,
 				   i915->drm.mode_config.legacy_tv_mode_property,
-				   conn_state->tv.mode);
+				   conn_state->tv.legacy_mode);
 	drm_object_attach_property(&connector->base,
 				   i915->drm.mode_config.tv_left_margin_property,
 				   conn_state->tv.margins.left);
-- 
2.43.2

