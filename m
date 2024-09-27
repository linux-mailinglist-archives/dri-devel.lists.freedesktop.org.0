Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C96F988CD8
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 01:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB9E10ED3E;
	Fri, 27 Sep 2024 23:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jTZMf7nS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB2B10ED3B;
 Fri, 27 Sep 2024 23:06:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0C1A5C12AC;
 Fri, 27 Sep 2024 23:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7011FC4CEC4;
 Fri, 27 Sep 2024 23:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727478377;
 bh=QTwti6pToeNo8BGAv+zEGeSaGFs183d3Q6TpfpUBLKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jTZMf7nShakXdYL+RYcLD6j+d0BK9aUnbrS+0xBgq3GfGYYEw1LZ1jfKmBDC904Pv
 Udy7jNOjmTgO1P13hfEhTgrt9jbe/QMXTng+trdYV0260Tf96Fem1nOAiDkBe2oY8/
 7x8jvcLWPUQlbYAPSzt202YajL5p6xH1jHFLVEGZDHx/l1FrlNicuRpOMP/ThNmjeo
 QJvikBuxyXf1+6B5L8NDOxTuWtqthwK26t1D581/DzvAvNtTTg7MKD0CMeXziIOEzm
 59r4q4XnRQJ8vVA7Aq+TrZAzUByjugbQejAaPIOIzrcaWNva28Jdpe22h+lkv9LBDk
 QyHP/Jjbk+NSA==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v8 4/5] drm/amd/display: remove redundant freesync parser for
 DP
Date: Fri, 27 Sep 2024 18:05:59 -0500
Message-ID: <20240927230600.2619844-5-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240927230600.2619844-1-superm1@kernel.org>
References: <20240927230600.2619844-1-superm1@kernel.org>
MIME-Version: 1.0
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

From: Melissa Wen <mwen@igalia.com>

When updating connector under drm_edid infrastructure, many calculations
and validations are already done and become redundant inside AMD driver.
Remove those driver-specific code in favor of the DRM common code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 74 +------------------
 1 file changed, 4 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index efc1609ff26f..bd8fb9968c7c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -12064,9 +12064,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 				    const struct drm_edid *drm_edid)
 {
 	int i = 0;
-	const struct detailed_timing *timing;
-	const struct detailed_non_pixel *data;
-	const struct detailed_data_monitor_range *range;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
@@ -12093,8 +12090,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 		amdgpu_dm_connector->min_vfreq = 0;
 		amdgpu_dm_connector->max_vfreq = 0;
-		connector->display_info.monitor_range.min_vfreq = 0;
-		connector->display_info.monitor_range.max_vfreq = 0;
 		freesync_capable = false;
 
 		goto update;
@@ -12114,67 +12109,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
-		bool edid_check_required = false;
-
-		if (amdgpu_dm_connector->dc_link &&
-		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_param) {
-			if (edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ) {
-				amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
-				amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
-				if (amdgpu_dm_connector->max_vfreq -
-				    amdgpu_dm_connector->min_vfreq > 10)
-					freesync_capable = true;
-			} else {
-				edid_check_required = edid->version > 1 ||
-						      (edid->version == 1 &&
-						       edid->revision > 1);
-			}
-		}
-
-		if (edid_check_required) {
-			for (i = 0; i < 4; i++) {
-
-				timing	= &edid->detailed_timings[i];
-				data	= &timing->data.other_data;
-				range	= &data->data.range;
-				/*
-				 * Check if monitor has continuous frequency mode
-				 */
-				if (data->type != EDID_DETAIL_MONITOR_RANGE)
-					continue;
-				/*
-				 * Check for flag range limits only. If flag == 1 then
-				 * no additional timing information provided.
-				 * Default GTF, GTF Secondary curve and CVT are not
-				 * supported
-				 */
-				if (range->flags != 1)
-					continue;
-
-				connector->display_info.monitor_range.min_vfreq = range->min_vfreq;
-				connector->display_info.monitor_range.max_vfreq = range->max_vfreq;
-
-				if (edid->revision >= 4) {
-					if (data->pad2 & DRM_EDID_RANGE_OFFSET_MIN_VFREQ)
-						connector->display_info.monitor_range.min_vfreq += 255;
-					if (data->pad2 & DRM_EDID_RANGE_OFFSET_MAX_VFREQ)
-						connector->display_info.monitor_range.max_vfreq += 255;
-				}
-
-				amdgpu_dm_connector->min_vfreq =
-					connector->display_info.monitor_range.min_vfreq;
-				amdgpu_dm_connector->max_vfreq =
-					connector->display_info.monitor_range.max_vfreq;
-
-				break;
-			}
-
-			if (amdgpu_dm_connector->max_vfreq -
-			    amdgpu_dm_connector->min_vfreq > 10) {
-
-				freesync_capable = true;
-			}
-		}
+		amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
+		amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
+		if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
+			freesync_capable = true;
 		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 
 		if (vsdb_info.replay_mode) {
@@ -12182,13 +12120,9 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
-
 	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported) {
-			timing  = &edid->detailed_timings[i];
-			data    = &timing->data.other_data;
-
 			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
 			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
 			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-- 
2.43.0

