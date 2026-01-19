Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A368CD39BBB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F03010E301;
	Mon, 19 Jan 2026 01:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="byx7xqXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783A410E2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:11:52 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-64b6f896689so391917a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785111; x=1769389911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDkX9tiIpLGCY4WDxdoWW0wKCm3VG7e/EcS3/xb60P4=;
 b=byx7xqXqLfUCo1LN+QpJqc9Fegpk4oFQDJicdfkkZ7ghEY6OhCZJZ9SjkkNXYEKk7C
 vYZtFVmawAObzmF5rfpQ1teHT8SrCGBf32iYKA2HrJVtGYWt+gpGIClIFtzPFtycAoJQ
 eIz01J/FRkrHGd56bXGZ87h3+vtB92gHHrPUe7u57xFdtw5WE7SbazHETVqxVZYF82Gs
 ySS4MlnlbFL1/ND1iXuHjG0u/djcFiKrGUnaGpJDWJ8nm4KOZ4zQQcsfH/6gj4DsV4PW
 ummDSWvj9BlxwxJIjZdB2VPLLgkbUMRupJ32FikjhomQ9XzN6jz1lKbotjxDWKJt1lkh
 I+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785111; x=1769389911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DDkX9tiIpLGCY4WDxdoWW0wKCm3VG7e/EcS3/xb60P4=;
 b=M+VBI2+qrUdUMa6NMmtH09KW4ANYOfkIKVJVG/5j92sYdIZBOOhSUV/+kEbID9p1FU
 ngbv9XkVrmUgo7giXvdaKOORylrw17EqrCUyhpyDTRltZBKlyDG6vFmx83UH+G9Aqi51
 yMCYgvWryuqulGXan3dGvUfDcUUNvj1adcnkoaNT+Bz5UKx0BWMfAsgBWn/wZVeymZWN
 m6hs8PdsQ9njQEQEZwEw32MXHhF48AVN+4DPLr++kIqpWr2XJfUThAdMefXg36XlRnc9
 0CyFP0XzCxgOS3oLUw6oVrheaMAgXxzfzEj9+5ZWdLK9VSAG3wUKS1/1klSsEb24emz4
 tVdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV18Wh2wlFXXv7FZXHUGUSLWRaZnvnFGl+sG3LxwKBZ8VsjWsePmkrPxW+0d1ubC08Q7ueFRNZO7LY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8w0jMCDD03/ydrPv2R8ksrYADb9xiem/Z3nozW12bI/MaPj45
 jDvYILwZCenkAn+Pr13zlqeCfILPNmQs+GiZ4O3/KFsvh3jzTWLW2xe3
X-Gm-Gg: AY/fxX7xKYAqI6YR4iCZI0qe6GUaojPA769JWk5OsqbueryXXMP223dT+kY/LYYydpP
 0v+uIDJsSWTqKHoI5GrwEoyM72khbczALwZh2zoF+Rblrk94ZSa2YEyJPtTC4HenwnEKllQLcot
 TvduMIRAtVZDMOztiI4XIVbca3LcE3U5tMRg3fJM+w/2gwbz1dHT26wQnUx5DhnqfH1fKStfcCU
 b4IyuiykdfoFOIQNJRrXysGEhWeZUG/qYsxJQ7Yn/csxzn8kE9/SNNiHjml5iBxqvaZ5vNuEbvE
 QVr0c+4ohKCYXZaP8Ofyw+J66fw6Hxy1u2MO9eJbI18V+226x9NbCO/AfW9U7hEAGgHD+BE0FPb
 iV948KLk+BXo+/s8F4UcGEeMEBSfnKhWQInpBY/mIoXckufDUwBr671WyClsTUrhP1PNCdvWnVf
 +iWb2vmOVbgYCDfqFs88t/gCol72+H1ArMchwn3tZlUi6yTDX3hV7HzXNlCK8UCtNs
X-Received: by 2002:a05:6402:27cf:b0:64d:4623:8475 with SMTP id
 4fb4d7f45d1cf-654524cf67cmr4280700a12.2.1768785110864; 
 Sun, 18 Jan 2026 17:11:50 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:11:50 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 02/17] drm/amd/display: Refactor
 amdgpu_dm_update_freesync_caps()
Date: Mon, 19 Jan 2026 02:11:31 +0100
Message-ID: <20260119011146.62302-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
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

[Why]
This function started to get very messy and hard to follow.

[How]
Eject some functionality to separate functions and simplify greatly.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 119 +++++++++++-------
 1 file changed, 72 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a0d23853b8fc..d83c65dc93d7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13096,8 +13096,8 @@ static void parse_edid_displayid_vrr(struct drm_connector *connector,
 	}
 }
 
-static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+static int parse_amd_vsdb_did(struct amdgpu_dm_connector *aconnector,
+			      const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -13134,9 +13134,9 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 	return false;
 }
 
-static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-			       const struct edid *edid,
-			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
+static int parse_amd_vsdb_cea(struct amdgpu_dm_connector *aconnector,
+			      const struct edid *edid,
+			      struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -13166,6 +13166,44 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 	return valid_vsdb_found ? i : -ENODEV;
 }
 
+static bool is_monitor_range_invalid(struct drm_connector *conn)
+{
+	return conn->display_info.monitor_range.min_vfreq == 0 ||
+	       conn->display_info.monitor_range.max_vfreq == 0;
+}
+
+/**
+ * Returns true if (max_vfreq - min_vfreq) > 10
+ */
+static bool is_freesync_capable(struct drm_monitor_range_info *range)
+{
+	return (range->max_vfreq - range->min_vfreq) > 10;
+}
+
+static void monitor_range_from_vsdb(struct drm_connector *conn,
+				    struct amdgpu_hdmi_vsdb_info *vsdb)
+{
+	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
+
+	range->min_vfreq = vsdb->min_refresh_rate_hz;
+	range->max_vfreq = vsdb->max_refresh_rate_hz;
+}
+
+/**
+ * Returns true if connector is capable of freesync
+ * Optionally, can fetch the range from AMD vsdb
+ */
+static bool copy_range_to_amdgpu_connector(struct drm_connector *conn)
+{
+	struct amdgpu_dm_connector *aconn = to_amdgpu_dm_connector(conn);
+	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
+
+	aconn->min_vfreq = range->min_vfreq;
+	aconn->max_vfreq = range->max_vfreq;
+
+	return is_freesync_capable(range);
+}
+
 /**
  * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
  *
@@ -13180,15 +13218,18 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 				    const struct drm_edid *drm_edid)
 {
-	int i = 0;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
 	struct dc_sink *sink;
 	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
+	struct amdgpu_hdmi_vsdb_info vsdb_did = {0};
+	struct dpcd_caps dpcd_caps = {0};
 	const struct edid *edid;
 	bool freesync_capable = false;
+	bool valid_vsdb_cea = false;
+	bool vsdb_freesync = false;
 	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
 
 	if (!connector->state) {
@@ -13218,62 +13259,46 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		goto update;
 
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
+	valid_vsdb_cea = parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info) >= 0;
+	vsdb_freesync = valid_vsdb_cea && vsdb_info.freesync_supported;
+	if (amdgpu_dm_connector->dc_link)
+		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
 
 	/* Some eDP panels only have the refresh rate range info in DisplayID */
-	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
-	     connector->display_info.monitor_range.max_vfreq == 0))
+	if (is_monitor_range_invalid(connector))
 		parse_edid_displayid_vrr(connector, edid);
 
-	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
-		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
-		if (amdgpu_dm_connector->dc_link &&
-		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_param) {
-			amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
-			amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
-			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-				freesync_capable = true;
-		}
+	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
+	    sink->sink_signal == SIGNAL_TYPE_EDP) {
 
-		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
+		if (dpcd_caps.allow_invalid_MSA_timing_param)
+			freesync_capable = copy_range_to_amdgpu_connector(connector);
 
-		if (vsdb_info.replay_mode) {
-			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_info.replay_mode;
-			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
+		/* eDP */
+		if (edid)
+			parse_amd_vsdb_did(amdgpu_dm_connector, edid, &vsdb_did);
+
+		if (vsdb_did.replay_mode) {
+			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_did.replay_mode;
+			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_did.amd_vsdb_version;
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
 
-	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
-		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
-		if (i >= 0 && vsdb_info.freesync_supported) {
-			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
-			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
-			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-				freesync_capable = true;
-
-			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
-			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
-		}
+	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_freesync) {
+		monitor_range_from_vsdb(connector, &vsdb_info);
+		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
 	if (amdgpu_dm_connector->dc_link)
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
-	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
-		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
-		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
+	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && vsdb_freesync) {
+		amdgpu_dm_connector->pack_sdp_v1_3 = true;
+		amdgpu_dm_connector->as_type = as_type;
+		amdgpu_dm_connector->vsdb_info = vsdb_info;
 
-			amdgpu_dm_connector->pack_sdp_v1_3 = true;
-			amdgpu_dm_connector->as_type = as_type;
-			amdgpu_dm_connector->vsdb_info = vsdb_info;
-
-			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
-			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
-			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-				freesync_capable = true;
-
-			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
-			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
-		}
+		monitor_range_from_vsdb(connector, &vsdb_info);
+		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
 update:
-- 
2.52.0

