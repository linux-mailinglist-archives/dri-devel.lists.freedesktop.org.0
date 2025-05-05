Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C6AA9FFA
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821C910E4A2;
	Mon,  5 May 2025 22:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QG61DDGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73DE10E4A1;
 Mon,  5 May 2025 22:30:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 470B1629C2;
 Mon,  5 May 2025 22:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E27C4CEEE;
 Mon,  5 May 2025 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484200;
 bh=HDw5Dov/vu4G4Ec6Kgc7wxmHMRik64vUAjo8+lEw0oc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QG61DDGjX709zHVNZQxKYEPwvjQiVQC1JOflwzl2NOPxpkvk9lVsLiE3FlhJ3HW64
 32kRZCQcsd8nvRL4LWljC0DYxUXw9f2dh7qyNwUsqpa/jRP+WRvsJR4kcptgTkMwNX
 Yqy3I+GZnu68VvIqq0JHb/D4aS1APyibUN/4vMBY0WsipOBbk72vJHMdfmpES2eDn7
 FWMP3CJERCHRHHSZ5N3TttYXOhwQZ0myhk1NUvIbTXoP1rzjfsIwBKY1HNwd7r1OKj
 k0bMaVP3pDeRMIGi1F8FfvGBVwxPIzaQdU4Fr0ZmHVWHO9SRw2pZHWzJr+mjheg6zW
 aHYbx5nE2bcPw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Roman Li <roman.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, mario.limonciello@amd.com, chiahsuan.chung@amd.com,
 sunil.khatri@amd.com, aurabindo.pillai@amd.com, Yilin.Chen@amd.com,
 mwen@igalia.com, Wayne.Lin@amd.com, Roman.Li@amd.com,
 hamzamahfooz@linux.microsoft.com, lumag@kernel.org, Jerry.Zuo@amd.com,
 siqueira@igalia.com, agustin.gutierrez@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 389/642] drm/amd/display: Don't treat wb
 connector as physical in create_validate_stream_for_sink
Date: Mon,  5 May 2025 18:10:05 -0400
Message-Id: <20250505221419.2672473-389-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Harry Wentland <harry.wentland@amd.com>

[ Upstream commit cbf4890c6f28fb1ad733e14613fbd33c2004bced ]

Don't try to operate on a drm_wb_connector as an amdgpu_dm_connector.
While dereferencing aconnector->base will "work" it's wrong and
might lead to unknown bad things. Just... don't.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 ++++++++++++-------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  6 ++---
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 79c01541a0190..d51dbac3235ca 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7505,12 +7505,12 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
 }
 
 struct dc_stream_state *
-create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
+create_validate_stream_for_sink(struct drm_connector *connector,
 				const struct drm_display_mode *drm_mode,
 				const struct dm_connector_state *dm_state,
 				const struct dc_stream_state *old_stream)
 {
-	struct drm_connector *connector = &aconnector->base;
+	struct amdgpu_dm_connector *aconnector = NULL;
 	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct dc_stream_state *stream;
 	const struct drm_connector_state *drm_state = dm_state ? &dm_state->base : NULL;
@@ -7521,8 +7521,12 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 	if (!dm_state)
 		return NULL;
 
-	if (aconnector->dc_link->connector_signal == SIGNAL_TYPE_HDMI_TYPE_A ||
-	    aconnector->dc_link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER)
+	if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
+		aconnector = to_amdgpu_dm_connector(connector);
+
+	if (aconnector &&
+	    (aconnector->dc_link->connector_signal == SIGNAL_TYPE_HDMI_TYPE_A ||
+	     aconnector->dc_link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER))
 		bpc_limit = 8;
 
 	do {
@@ -7534,10 +7538,11 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 			break;
 		}
 
-		if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
+		dc_result = dc_validate_stream(adev->dm.dc, stream);
+
+		if (!aconnector) /* writeback connector */
 			return stream;
 
-		dc_result = dc_validate_stream(adev->dm.dc, stream);
 		if (dc_result == DC_OK && stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
 			dc_result = dm_dp_mst_is_port_support_mode(aconnector, stream);
 
@@ -7567,7 +7572,7 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 				     __func__, __LINE__);
 
 		aconnector->force_yuv420_output = true;
-		stream = create_validate_stream_for_sink(aconnector, drm_mode,
+		stream = create_validate_stream_for_sink(connector, drm_mode,
 						dm_state, old_stream);
 		aconnector->force_yuv420_output = false;
 	}
@@ -7582,6 +7587,9 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 	struct dc_sink *dc_sink;
 	/* TODO: Unhardcode stream count */
 	struct dc_stream_state *stream;
+	/* we always have an amdgpu_dm_connector here since we got
+	 * here via the amdgpu_dm_connector_helper_funcs
+	 */
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 
 	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) ||
@@ -7606,7 +7614,7 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 
 	drm_mode_set_crtcinfo(mode, 0);
 
-	stream = create_validate_stream_for_sink(aconnector, mode,
+	stream = create_validate_stream_for_sink(connector, mode,
 						 to_dm_connector_state(connector->state),
 						 NULL);
 	if (stream) {
@@ -10658,7 +10666,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
 			goto skip_modeset;
 
-		new_stream = create_validate_stream_for_sink(aconnector,
+		new_stream = create_validate_stream_for_sink(connector,
 							     &new_crtc_state->mode,
 							     dm_new_conn_state,
 							     dm_old_crtc_state->stream);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index d2703ca7dff31..195fec9048df7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -989,7 +989,7 @@ int amdgpu_dm_process_dmub_set_config_sync(struct dc_context *ctx, unsigned int
 					struct set_config_cmd_payload *payload, enum set_config_status *operation_result);
 
 struct dc_stream_state *
-	create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
+	create_validate_stream_for_sink(struct drm_connector *connector,
 					const struct drm_display_mode *drm_mode,
 					const struct dm_connector_state *dm_state,
 					const struct dc_stream_state *old_stream);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 07e744da7bf41..056b171989565 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1625,7 +1625,6 @@ int pre_validate_dsc(struct drm_atomic_state *state,
 
 		if (ind >= 0) {
 			struct drm_connector *connector;
-			struct amdgpu_dm_connector *aconnector;
 			struct drm_connector_state *drm_new_conn_state;
 			struct dm_connector_state *dm_new_conn_state;
 			struct dm_crtc_state *dm_old_crtc_state;
@@ -1633,15 +1632,14 @@ int pre_validate_dsc(struct drm_atomic_state *state,
 			connector =
 				amdgpu_dm_find_first_crtc_matching_connector(state,
 									     state->crtcs[ind].ptr);
-			aconnector = to_amdgpu_dm_connector(connector);
 			drm_new_conn_state =
 				drm_atomic_get_new_connector_state(state,
-								   &aconnector->base);
+								   connector);
 			dm_new_conn_state = to_dm_connector_state(drm_new_conn_state);
 			dm_old_crtc_state = to_dm_crtc_state(state->crtcs[ind].old_state);
 
 			local_dc_state->streams[i] =
-				create_validate_stream_for_sink(aconnector,
+				create_validate_stream_for_sink(connector,
 								&state->crtcs[ind].new_state->mode,
 								dm_new_conn_state,
 								dm_old_crtc_state->stream);
-- 
2.39.5

