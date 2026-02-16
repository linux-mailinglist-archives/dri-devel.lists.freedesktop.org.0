Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBt7F7ZJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB4146556
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B00410E3C9;
	Mon, 16 Feb 2026 16:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f4uw/QRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DAD10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:32 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b8f7fd33bd2so48123066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260331; x=1771865131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qpQ8hMace7VylP1UXnY5VctYMrzTpDvAnEUQfsbXrTg=;
 b=f4uw/QRrMHwZitEaxratw2eu5cQr0pvcJyeNfkYE/zzFoqHLlGU/fXRBIt6tnSqHGE
 re0szvzlj5IsNiBPakKl9lN/nRUVAB+KiN0rSTm75B2q92jMlayUxaiulvO1aHSk2xZ6
 Qsk4X89k6GZByasHSHRvr/HHqpAVx+RFCn9NjjsdDM/qRkuHfpKYAD2lPWfeZZuF2GnE
 JjoknB6G21i4Q8zuXZCcOC/UVjUj8S7l4crIUIDbdZnEz9Wvpmm3uDtz81pMoNhT/g8m
 v1mGkUp1vqMQiqusRfUAkkCrA8Fm1QsCxjOZR7czmYP0y03zgrkKb9WY0cNSFCWMS4Ip
 nyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260331; x=1771865131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qpQ8hMace7VylP1UXnY5VctYMrzTpDvAnEUQfsbXrTg=;
 b=Z1TE8cSFp9GQnEK+44+M8hhebm9VCuGqNyqt2a8hZPJxrs5OoZQ9pUOqxgIBX9bg8L
 G/60pjdC6B1mpVxhvMgTuEfJt4J547YR3i3kmeIoRhjX/nC1CchbmNUdWNELMQpy+zzO
 bTl9TZWmhyrDn3CcOwM+4RMdmmKgX72dDj+vjH19MrRjQ+WwjZxGIEK6VmgTPB4/+uQl
 37aPS6abavqVgCSaRsU1e7J5HZGczMqm0KbSjW7n6lxe5fWpJpCS08YMwk5BXPExOzV9
 4tL8gk4lnoDRZDAzU9PiVYxFvIauRKNWhVKNGgtG/bLC1mriucl+/KXL8qKDixVb/ROP
 WZbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfR43ltVI4kIVAzGyD7656dM6ci6Pm0NcIZPo4VW+HUUdNmHsqGJJgJk1rGVDFD3YKtNcVnAV6KTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTT4YNdiX2SxCGNwHlQwichVOe8zLFuAsZkIuoFpqhcnr5XYdc
 nGDPkNMr5KzpiVm0tgtT0Qmwn+KQ3FGXSOiTGgfikMoYjNOx4lUfwdPX
X-Gm-Gg: AZuq6aKja+4On9KC4BzsEJ61ndXwGagDr9zhGKVd3C6AWIs5xhBmkxyJnvpyKc2XbXy
 LBYjThYKTpNAUifQtTDhvj9Er6iPv1eIhiBpY5zL7P+Vbs2zmzAbLaKHgloF0AFCklAIhuxA53U
 H2M5JkXXyX3tvWcSUiGbUs/cXsjt4lFO8HtL/7/13Z4jzmzrUBRkEZaqdlPXw3+uVXQz/slJPC0
 QW0BJykHx8JxGtHpZdk0dEHFyi2TD/jZY4ld3TrDsdiRv8Jh8vuRh+ST6yPaCLXV4P4PLB5LQTI
 Mn2b9cIVuMY40OiN/Lx6ZSff8e5VnIIH76Y/W8PSt74KE6bAtUaCyB/s8CHIx+cz2bMTKJDPtOn
 IYk6fJiy53Un3HRNf1BYU3pu6vxOLhlT26XSY7+OjJ3FQBrW1mSK5Jf1yjJ/YoAujqHgTTMaKbn
 03hHTNzB6akFPDQv4SaYU7mY+rOjSIqqeSYRc2hY3eW3GWDiSQYFBxW02TFr8thwrzHQSwWvoDB
 AtZ
X-Received: by 2002:a17:907:3e88:b0:b73:59b0:34c6 with SMTP id
 a640c23a62f3a-b8face510e0mr348070666b.4.1771260331308; 
 Mon, 16 Feb 2026 08:45:31 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:31 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 09/27] drm/amd/display: Refactor PCON VRR compatibility
 check
Date: Mon, 16 Feb 2026 17:44:58 +0100
Message-ID: <20260216164516.36803-10-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 0FFB4146556
X-Rspamd-Action: no action

[Why]
DP->HDMI PCONs prevously entered the DP path

[How]
Restructure amdgpu_dm_update_freesync_caps() and move
dm_get_adaptive_sync_support_type() to dm_helpers_is_vrr_pcon_allowed()
to better reflect what this function does. It never actually gave us any
other info.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 ++----
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 39 ++++++-------------
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  2 +-
 3 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2f31fe7265d9..2603da69d772 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13321,8 +13321,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct dpcd_caps dpcd_caps = {0};
 	const struct edid *edid;
 	bool freesync_capable = false;
+	bool pcon_allowed = false;
 	bool is_pcon = false;
-	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
 
 	if (!connector->state) {
 		drm_err(adev_to_drm(adev), "%s - Connector has no state", __func__);
@@ -13357,6 +13357,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (amdgpu_dm_connector->dc_link) {
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
 		is_pcon = dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER;
+		pcon_allowed = dm_helpers_is_vrr_pcon_allowed(amdgpu_dm_connector->dc_link);
 	}
 
 	/* DP & eDP excluding PCONs */
@@ -13390,15 +13391,11 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_info.freesync_supported) {
 		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
-	}
-
-	if (amdgpu_dm_connector->dc_link && is_pcon)
-		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
 	/* DP -> HDMI PCON */
-	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && vsdb_info.freesync_supported) {
+	} else if (pcon_allowed && vsdb_info.freesync_supported) {
+		amdgpu_dm_connector->as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
 		amdgpu_dm_connector->pack_sdp_v1_3 = true;
-		amdgpu_dm_connector->as_type = as_type;
 		amdgpu_dm_connector->vsdb_info = vsdb_info;
 
 		parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 1f41d6540b83..45a91df619d9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1381,40 +1381,25 @@ void dm_helpers_dp_mst_update_branch_bandwidth(
 	// TODO
 }
 
-static bool dm_is_freesync_pcon_whitelist(const uint32_t branch_dev_id)
+bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link)
 {
-	bool ret_val = false;
+	if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_DP_HDMI_CONVERTER)
+		return false;
 
-	switch (branch_dev_id) {
+	if (!link->dpcd_caps.allow_invalid_MSA_timing_param)
+		return false;
+
+	if (!link->dpcd_caps.adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT)
+		return false;
+
+	switch (link->dpcd_caps.branch_dev_id) {
 	case DP_BRANCH_DEVICE_ID_0060AD:
 	case DP_BRANCH_DEVICE_ID_00E04C:
 	case DP_BRANCH_DEVICE_ID_90CC24:
-		ret_val = true;
-		break;
-	default:
-		break;
+		return true;
 	}
 
-	return ret_val;
-}
-
-enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link)
-{
-	struct dpcd_caps *dpcd_caps = &link->dpcd_caps;
-	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
-
-	switch (dpcd_caps->dongle_type) {
-	case DISPLAY_DONGLE_DP_HDMI_CONVERTER:
-		if (dpcd_caps->adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT == true &&
-			dpcd_caps->allow_invalid_MSA_timing_param == true &&
-			dm_is_freesync_pcon_whitelist(dpcd_caps->branch_dev_id))
-			as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
-		break;
-	default:
-		break;
-	}
-
-	return as_type;
+	return false;
 }
 
 bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream)
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 7014b8c2c956..e51f1e489129 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -220,10 +220,10 @@ int dm_helpers_dmub_set_config_sync(struct dc_context *ctx,
 		const struct dc_link *link,
 		struct set_config_cmd_payload *payload,
 		enum set_config_status *operation_result);
-enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link);
 
 enum dc_edid_status dm_helpers_get_sbios_edid(struct dc_link *link, struct dc_edid *edid);
 
+bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link);
 bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream);
 bool dm_helpers_is_hdr_on(struct dc_context *ctx, struct dc_stream_state *stream);
 
-- 
2.53.0

