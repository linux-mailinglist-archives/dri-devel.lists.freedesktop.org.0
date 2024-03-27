Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9D688EBEC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 17:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF9410FE67;
	Wed, 27 Mar 2024 16:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SAXj97IX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9D010FE63;
 Wed, 27 Mar 2024 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rb47TC+5s1SseXZclT0xe/2fdBd19Pjj6gVCBAYVCco=; b=SAXj97IXWNvz6KCliGXXJbZFRW
 RMz6tXub5fDsNk6rltKdQ1VYiJMvoCvTIzB9WwCE6PL+2ZHVhpG9GQAZEw5j7bAiIiw3aE/nh/smo
 U1CroXb/okjjKwcRdnxqLVsxaC+qf3iVVihoVdsyKtpj/sLscpZgRTAYQwHXn7f8RHKpS7SN7IiHl
 Fxsw+U71/BX4eI9w4fNQBLrD9k6UrwkKH1AC4BGuwyeed7z5pQsDsvafcx/39/i9bPZ5SPla8EQCo
 6M02MHPRUZLAvwnkE5eetid3BSrFKJH9KHKX+nZKRwGrdhnEzNlwzNhmp09BjelCEZ6/KPiWu+o6T
 taEuuT6A==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rpWcI-00Fx4M-9p; Wed, 27 Mar 2024 17:59:10 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 6/6] drm/amd/display: remove redundant freesync parser
 for DP
Date: Wed, 27 Mar 2024 13:54:47 -0300
Message-ID: <20240327165828.288792-7-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327165828.288792-1-mwen@igalia.com>
References: <20240327165828.288792-1-mwen@igalia.com>
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

When updating connector under drm_edid infrastructure, many calculations
and validations are already done and become redundant inside AMD driver.
Remove those driver-specific code in favor of the DRM common code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 86 +------------------
 1 file changed, 4 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b3c396d626e9..7e0f93de27e6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10994,24 +10994,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	return ret;
 }
 
-static bool is_dp_capable_without_timing_msa(struct dc *dc,
-					     struct amdgpu_dm_connector *amdgpu_dm_connector)
-{
-	u8 dpcd_data;
-	bool capable = false;
-
-	if (amdgpu_dm_connector->dc_link &&
-		dm_helpers_dp_read_dpcd(
-				NULL,
-				amdgpu_dm_connector->dc_link,
-				DP_DOWN_STREAM_PORT_COUNT,
-				&dpcd_data,
-				sizeof(dpcd_data))) {
-		capable = (dpcd_data & DP_MSA_TIMING_PAR_IGNORED) ? true:false;
-	}
-
-	return capable;
-}
 
 static bool dm_edid_parser_send_cea(struct amdgpu_display_manager *dm,
 		unsigned int offset,
@@ -11225,9 +11207,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 				    const struct drm_edid *drm_edid)
 {
 	int i = 0;
-	const struct detailed_timing *timing;
-	const struct detailed_non_pixel *data;
-	const struct detailed_data_monitor_range *range;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
@@ -11254,8 +11233,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 		amdgpu_dm_connector->min_vfreq = 0;
 		amdgpu_dm_connector->max_vfreq = 0;
-		connector->display_info.monitor_range.min_vfreq = 0;
-		connector->display_info.monitor_range.max_vfreq = 0;
 		freesync_capable = false;
 
 		goto update;
@@ -11269,65 +11246,11 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
-		bool edid_check_required = false;
+		amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
+		amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
+		if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
+			freesync_capable = true;
 
-		if (is_dp_capable_without_timing_msa(adev->dm.dc,
-						     amdgpu_dm_connector)) {
-			if (edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ) {
-				freesync_capable = true;
-				amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
-				amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
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
 		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 
 		if (vsdb_info.replay_mode) {
@@ -11335,7 +11258,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
-
 	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported) {
-- 
2.43.0

