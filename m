Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HKrMM6dJk2kT3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749271464FF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ADE10E0EA;
	Mon, 16 Feb 2026 16:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jSs7Jroa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D708C10E3B9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:23 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b8f8fa9067fso37154866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260322; x=1771865122; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnYsqKjwkdi7cukTOBwMkwqlRWnCwHpOCDkCCBv/1xY=;
 b=jSs7JroaqUBRRLP//N5/jXaTO+xM0khHoMP5ovm43NctaJYmR/TRC1vDlzyxnKstBp
 En0asybKh5iKsSxRxykKp7nXvUK9Fe0acVPfleVMLTXrcgZYlahk8aejgxDp5y41XiDw
 KkfxZUy0WxAp13h/COw4Kc0b+Ddyeug/DTcYy2nQ4GHMdcK4oqc/AYNQRtuwL23BhzNt
 lbByGD8NIidQZ9dgK/GKcOETC6F9+7aaJZj9M5c3i0vyglpIMR89YyIOVXUzXl1n5PE7
 wJCdmKgcdYidPK7GLwi4Ge0XaCBlsFFmNgaFEZmhfZCz9j8QrPUyXlHYNCQI8f9aXaT+
 k/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260322; x=1771865122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZnYsqKjwkdi7cukTOBwMkwqlRWnCwHpOCDkCCBv/1xY=;
 b=sr3gUHKAdIkd2x5q4pd3NmrqnGZAYMAqtUyx5msVCGCMeoTD1bKguiMk7C35c++fNC
 IrPOaIVewgwN9Ux8rtAkB2fiWzVj5bK6iafkG5AoCWs179dlIcPkwxoJNe2rSPJQ7MSk
 znR41OlG9meJQ9rxwIks+Zfh9LSFlTv1zIhBxxUvIQZ4iE3apEO5BMXR1Y6KfyKGLowJ
 r4gSyM2TTcWe0Hwy+px+T8pPo/LsAsuW+yj4jauJmbnM3Kyb1hbhATl0uHifPUq/BZlo
 E25i8qj0rLWhQS9AFNE7ejrRZJgykYeB6I+6tyNlPS5XfU28d/ffDBh96dkFbZbvF7R4
 alBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuBvZuOOUvZ9qkYCyYD0QBKRoKlA3M5Vg1LfTVa62l8UDgbL9aYy2BBJTOk9hPF0PFesyZEjKTO6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzM2Ml5/bAat7VJbiiZGdI2JX44USe+x7OWZWTOe3/Atp6agQ3a
 KlALRa1sLNWD2U5nGVVM/IQfcCsMUtFBMYSNdPkoiBVUk56Va7i2eQe7
X-Gm-Gg: AZuq6aJlFb2iATwALHAOguIpzWie0IcQex/EoSnywWXwDYQ3Q/2f2oD2dyoR6T16H4v
 Exa2u7mUCrVjI95PI0gJ4ietqnaLxJocHQ/kijR1L5GoO8f3p848pXK8gM7mGYqcgB2axf21hsO
 EFJYe8C+x9uD8gQyndGBVq92wQYrz4ZasQMP5Otp7NV7ga/JOGdNHwjac6g60UdYJm1y+XqZeZ9
 pUA0aTeCWpp/8KAjUGC4EHkM1Dijm1E6iYtYVf+GedzJmLULTx9hkFqH80ULVmRrbhrqLNPbG1m
 8Tl7JUVdxUKkX2GjqdN7xRKPbyg9m27FHnVJu5gC3jXM6f1q/AfR2pFx75yj5Ln1v+Z+CSTFJwx
 FtBDQjsbrJ8ttMfbaRinaol9QZgmHNHO4vHhJGMQKocJBYwpSmkFhEBgMVqYWeqSqzKNYTNA4wz
 JSFBEkfQfw2jR8ou7qUjKL2/rhO6E0OijsUYPasXjd8UsY5A51vxn8CxJZE1iGW2WkfitKpzDZ/
 E3s
X-Received: by 2002:a17:907:3e88:b0:b73:59b0:34c6 with SMTP id
 a640c23a62f3a-b8face510e0mr348057966b.4.1771260321971; 
 Mon, 16 Feb 2026 08:45:21 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:21 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 02/27] drm/amd/display: Refactor
 amdgpu_dm_update_freesync_caps()
Date: Mon, 16 Feb 2026 17:44:51 +0100
Message-ID: <20260216164516.36803-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 749271464FF
X-Rspamd-Action: no action

[Why]
This function started to get very messy and hard to follow.

[How]
Eject some functionality to separate functions and simplify greatly.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 110 +++++++++++-------
 1 file changed, 69 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2d770ed98871..6218ad911fde 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13144,8 +13144,8 @@ static void parse_edid_displayid_vrr(struct drm_connector *connector,
 	}
 }
 
-static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+static int parse_amd_vsdb_did(struct amdgpu_dm_connector *aconnector,
+			      const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -13199,13 +13199,13 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 	return false;
 }
 
-static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
+static bool parse_amd_vsdb_cea(struct amdgpu_dm_connector *aconnector,
 			       const struct edid *edid,
 			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
+	struct amdgpu_hdmi_vsdb_info vsdb_local = {0};
 	u8 *edid_ext = NULL;
 	int i;
-	bool valid_vsdb_found = false;
 
 	/*----- drm_find_cea_extension() -----*/
 	/* No EDID or EDID extensions */
@@ -13226,9 +13226,47 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 	if (edid_ext[0] != CEA_EXT)
 		return -ENODEV;
 
-	valid_vsdb_found = parse_edid_cea(aconnector, edid_ext, EDID_LENGTH, vsdb_info);
+	if (!parse_edid_cea(aconnector, edid_ext, EDID_LENGTH, &vsdb_local))
+		return -ENODEV;
 
-	return valid_vsdb_found ? i : -ENODEV;
+	*vsdb_info = vsdb_local;
+	return false;
+}
+
+static bool is_monitor_range_invalid(const struct drm_connector *conn)
+{
+	return conn->display_info.monitor_range.min_vfreq == 0 ||
+	       conn->display_info.monitor_range.max_vfreq == 0;
+}
+
+/*
+ * Returns true if (max_vfreq - min_vfreq) > 10
+ */
+static bool is_freesync_capable(const struct drm_monitor_range_info *range)
+{
+	return (range->max_vfreq - range->min_vfreq) > 10;
+}
+
+static void monitor_range_from_vsdb(struct drm_display_info *display,
+				    const struct amdgpu_hdmi_vsdb_info *vsdb)
+{
+	display->monitor_range.min_vfreq = vsdb->min_refresh_rate_hz;
+	display->monitor_range.max_vfreq = vsdb->max_refresh_rate_hz;
+}
+
+/*
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
 }
 
 /**
@@ -13245,13 +13283,14 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
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
 	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
@@ -13284,60 +13323,49 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 
+	if (amdgpu_dm_connector->dc_link)
+		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
+
 	/* Some eDP panels only have the refresh rate range info in DisplayID */
-	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
-	     connector->display_info.monitor_range.max_vfreq == 0))
+	if (is_monitor_range_invalid(connector))
 		parse_edid_displayid_vrr(connector, edid);
 
 	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
-		if (amdgpu_dm_connector->dc_link &&
-		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_param) {
-			amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
-			amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
-			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-				freesync_capable = true;
-		}
 
-		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
+		if (dpcd_caps.allow_invalid_MSA_timing_param)
+			freesync_capable = copy_range_to_amdgpu_connector(connector);
 
-		if (vsdb_info.replay_mode) {
-			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_info.replay_mode;
-			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
+		/* eDP */
+		parse_amd_vsdb_did(amdgpu_dm_connector, edid, &vsdb_did);
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
+	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A &&
+		   drm_edid) {
+		parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
+		if (vsdb_info.freesync_supported) {
+			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+			freesync_capable = copy_range_to_amdgpu_connector(connector);
 		}
 	}
 
 	if (amdgpu_dm_connector->dc_link)
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
-	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
-		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
-		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
-
+	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && drm_edid) {
+		parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
+		if (vsdb_info.freesync_supported) {
 			amdgpu_dm_connector->pack_sdp_v1_3 = true;
 			amdgpu_dm_connector->as_type = as_type;
 			amdgpu_dm_connector->vsdb_info = vsdb_info;
 
-			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
-			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
-			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-				freesync_capable = true;
-
-			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
-			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
+			parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
+			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+			freesync_capable = copy_range_to_amdgpu_connector(connector);
 		}
 	}
 
-- 
2.53.0

