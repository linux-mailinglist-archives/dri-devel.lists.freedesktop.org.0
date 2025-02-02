Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57081A25028
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 22:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E725A10E2D1;
	Sun,  2 Feb 2025 21:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="f+/Rqj4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A2D10E07F;
 Sun,  2 Feb 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=fZViyxQ2wE7WK3COVQkZe+TNohyCw618HJIZEcpMk1g=; b=f+/Rqj4Mx0ik03l5
 TaOLEUhKcvbAGBNoKTuWyd4DwtCrqxztDrO1PrfD27qoPWRBzgTMjnBiwSLl/i632/Qr7xNFcEod4
 0sVRvOr7rh5RNogi8UjNTt/ZXIR8vhws5gLuWwESZK5Bf89x3jtcy/OSA/1HiIPEeZLDqPKovGhMM
 K6X4jWCZWam+Ul5HA2S5h5ZG1Otm1zui79y8O8zQMgiD7ibPzYnA4exeud4Gyz2U385mq9IVadr2G
 bytKbGw7/JpGro2NsYSXwmlsYGbPSqG8aokRDbLzWqE9zBlKX2ptK9qWbFfdUa8LWvkj/AYL4t2iE
 gKIc7zS2JiLRdJIEoQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tehzW-00D9GV-2p;
 Sun, 02 Feb 2025 21:58:58 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/7] drm/amd/display: Remove unused freesync functions
Date: Sun,  2 Feb 2025 21:58:51 +0000
Message-ID: <20250202215856.252439-3-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250202215856.252439-1-linux@treblig.org>
References: <20250202215856.252439-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mod_freesync_get_vmin_vmax() and mod_freesync_get_v_position() were
added in 2017 by
commit 72ada5f76939 ("drm/amd/display: FreeSync Auto Sweep Support")

mod_freesync_is_valid_range() was added in 2018 by
commit e80e94460841 ("drm/amd/display: add method to check for supported
range")

mod_freesync_get_settings() was added in 2018 by
commit a3e1737ed61c ("drm/amd/display: Implement stats logging")

and
mod_freesync_calc_field_rate_from_timing() was added in 2020 by
commit 49c70ece54b0 ("drm/amd/display: Change input parameter for
set_drr")

None of these have been used.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../amd/display/modules/freesync/freesync.c   | 137 ------------------
 .../amd/display/modules/inc/mod_freesync.h    |  26 ----
 2 files changed, 163 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index 2b3964529539..3ba9b62ba70b 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -552,43 +552,6 @@ static bool vrr_settings_require_update(struct core_freesync *core_freesync,
 	return false;
 }
 
-bool mod_freesync_get_vmin_vmax(struct mod_freesync *mod_freesync,
-		const struct dc_stream_state *stream,
-		unsigned int *vmin,
-		unsigned int *vmax)
-{
-	*vmin = stream->adjust.v_total_min;
-	*vmax = stream->adjust.v_total_max;
-
-	return true;
-}
-
-bool mod_freesync_get_v_position(struct mod_freesync *mod_freesync,
-		struct dc_stream_state *stream,
-		unsigned int *nom_v_pos,
-		unsigned int *v_pos)
-{
-	struct core_freesync *core_freesync = NULL;
-	struct crtc_position position;
-
-	if (mod_freesync == NULL)
-		return false;
-
-	core_freesync = MOD_FREESYNC_TO_CORE(mod_freesync);
-
-	if (dc_stream_get_crtc_position(core_freesync->dc, &stream, 1,
-					&position.vertical_count,
-					&position.nominal_vcount)) {
-
-		*nom_v_pos = position.nominal_vcount;
-		*v_pos = position.vertical_count;
-
-		return true;
-	}
-
-	return false;
-}
-
 static void build_vrr_infopacket_data_v1(const struct mod_vrr_params *vrr,
 		struct dc_info_packet *infopacket,
 		bool freesync_on_desktop)
@@ -1291,28 +1254,6 @@ void mod_freesync_handle_v_update(struct mod_freesync *mod_freesync,
 	}
 }
 
-void mod_freesync_get_settings(struct mod_freesync *mod_freesync,
-		const struct mod_vrr_params *vrr,
-		unsigned int *v_total_min, unsigned int *v_total_max,
-		unsigned int *event_triggers,
-		unsigned int *window_min, unsigned int *window_max,
-		unsigned int *lfc_mid_point_in_us,
-		unsigned int *inserted_frames,
-		unsigned int *inserted_duration_in_us)
-{
-	if (mod_freesync == NULL)
-		return;
-
-	if (vrr->supported) {
-		*v_total_min = vrr->adjust.v_total_min;
-		*v_total_max = vrr->adjust.v_total_max;
-		*event_triggers = 0;
-		*lfc_mid_point_in_us = vrr->btr.mid_point_in_us;
-		*inserted_frames = vrr->btr.frames_to_insert;
-		*inserted_duration_in_us = vrr->btr.inserted_duration_in_us;
-	}
-}
-
 unsigned long long mod_freesync_calc_nominal_field_rate(
 			const struct dc_stream_state *stream)
 {
@@ -1328,85 +1269,7 @@ unsigned long long mod_freesync_calc_nominal_field_rate(
 	return nominal_field_rate_in_uhz;
 }
 
-unsigned long long mod_freesync_calc_field_rate_from_timing(
-		unsigned int vtotal, unsigned int htotal, unsigned int pix_clk)
-{
-	unsigned long long field_rate_in_uhz = 0;
-	unsigned int total = htotal * vtotal;
-
-	/* Calculate nominal field rate for stream, rounded up to nearest integer */
-	field_rate_in_uhz = pix_clk;
-	field_rate_in_uhz *= 1000000ULL;
-
-	field_rate_in_uhz =	div_u64(field_rate_in_uhz, total);
-
-	return field_rate_in_uhz;
-}
-
 bool mod_freesync_get_freesync_enabled(struct mod_vrr_params *pVrr)
 {
 	return (pVrr->state != VRR_STATE_UNSUPPORTED) && (pVrr->state != VRR_STATE_DISABLED);
 }
-
-bool mod_freesync_is_valid_range(uint32_t min_refresh_cap_in_uhz,
-		uint32_t max_refresh_cap_in_uhz,
-		uint32_t nominal_field_rate_in_uhz)
-{
-
-	/* Typically nominal refresh calculated can have some fractional part.
-	 * Allow for some rounding error of actual video timing by taking floor
-	 * of caps and request. Round the nominal refresh rate.
-	 *
-	 * Dividing will convert everything to units in Hz although input
-	 * variable name is in uHz!
-	 *
-	 * Also note, this takes care of rounding error on the nominal refresh
-	 * so by rounding error we only expect it to be off by a small amount,
-	 * such as < 0.1 Hz. i.e. 143.9xxx or 144.1xxx.
-	 *
-	 * Example 1. Caps    Min = 40 Hz, Max = 144 Hz
-	 *            Request Min = 40 Hz, Max = 144 Hz
-	 *                    Nominal = 143.5x Hz rounded to 144 Hz
-	 *            This function should allow this as valid request
-	 *
-	 * Example 2. Caps    Min = 40 Hz, Max = 144 Hz
-	 *            Request Min = 40 Hz, Max = 144 Hz
-	 *                    Nominal = 144.4x Hz rounded to 144 Hz
-	 *            This function should allow this as valid request
-	 *
-	 * Example 3. Caps    Min = 40 Hz, Max = 144 Hz
-	 *            Request Min = 40 Hz, Max = 144 Hz
-	 *                    Nominal = 120.xx Hz rounded to 120 Hz
-	 *            This function should return NOT valid since the requested
-	 *            max is greater than current timing's nominal
-	 *
-	 * Example 4. Caps    Min = 40 Hz, Max = 120 Hz
-	 *            Request Min = 40 Hz, Max = 120 Hz
-	 *                    Nominal = 144.xx Hz rounded to 144 Hz
-	 *            This function should return NOT valid since the nominal
-	 *            is greater than the capability's max refresh
-	 */
-	nominal_field_rate_in_uhz =
-			div_u64(nominal_field_rate_in_uhz + 500000, 1000000);
-	min_refresh_cap_in_uhz /= 1000000;
-	max_refresh_cap_in_uhz /= 1000000;
-
-	/* Check nominal is within range */
-	if (nominal_field_rate_in_uhz > max_refresh_cap_in_uhz ||
-		nominal_field_rate_in_uhz < min_refresh_cap_in_uhz)
-		return false;
-
-	/* If nominal is less than max, limit the max allowed refresh rate */
-	if (nominal_field_rate_in_uhz < max_refresh_cap_in_uhz)
-		max_refresh_cap_in_uhz = nominal_field_rate_in_uhz;
-
-	/* Check min is within range */
-	if (min_refresh_cap_in_uhz > max_refresh_cap_in_uhz)
-		return false;
-
-	/* For variable range, check for at least 10 Hz range */
-	if (nominal_field_rate_in_uhz - min_refresh_cap_in_uhz < 10)
-		return false;
-
-	return true;
-}
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_freesync.h b/drivers/gpu/drm/amd/display/modules/inc/mod_freesync.h
index cc3dc9b589f6..57916ed98c86 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_freesync.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_freesync.h
@@ -110,25 +110,6 @@ struct mod_vrr_params {
 struct mod_freesync *mod_freesync_create(struct dc *dc);
 void mod_freesync_destroy(struct mod_freesync *mod_freesync);
 
-bool mod_freesync_get_vmin_vmax(struct mod_freesync *mod_freesync,
-		const struct dc_stream_state *stream,
-		unsigned int *vmin,
-		unsigned int *vmax);
-
-bool mod_freesync_get_v_position(struct mod_freesync *mod_freesync,
-		struct dc_stream_state *stream,
-		unsigned int *nom_v_pos,
-		unsigned int *v_pos);
-
-void mod_freesync_get_settings(struct mod_freesync *mod_freesync,
-		const struct mod_vrr_params *vrr,
-		unsigned int *v_total_min, unsigned int *v_total_max,
-		unsigned int *event_triggers,
-		unsigned int *window_min, unsigned int *window_max,
-		unsigned int *lfc_mid_point_in_us,
-		unsigned int *inserted_frames,
-		unsigned int *inserted_duration_in_us);
-
 void mod_freesync_build_vrr_infopacket(struct mod_freesync *mod_freesync,
 		const struct dc_stream_state *stream,
 		const struct mod_vrr_params *vrr,
@@ -155,13 +136,6 @@ void mod_freesync_handle_v_update(struct mod_freesync *mod_freesync,
 unsigned long long mod_freesync_calc_nominal_field_rate(
 			const struct dc_stream_state *stream);
 
-unsigned long long mod_freesync_calc_field_rate_from_timing(
-		unsigned int vtotal, unsigned int htotal, unsigned int pix_clk);
-
-bool mod_freesync_is_valid_range(uint32_t min_refresh_cap_in_uhz,
-		uint32_t max_refresh_cap_in_uhz,
-		uint32_t nominal_field_rate_in_uhz);
-
 unsigned int mod_freesync_calc_v_total_from_refresh(
 		const struct dc_stream_state *stream,
 		unsigned int refresh_in_uhz);
-- 
2.48.1

