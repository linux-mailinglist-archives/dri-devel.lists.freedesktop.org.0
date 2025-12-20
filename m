Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3673CD3986
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 02:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36B210E27C;
	Sun, 21 Dec 2025 01:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PboE5cYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C28210E1F5
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 11:46:58 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-64b9cb95009so161971a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 03:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766231216; x=1766836016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5TVnYGVRm+Z+bM0lIMVs1bFQFPxij1W9a0LrjLJBefs=;
 b=PboE5cYiKzqQ7Nb08uNrG6oJimewP9lujrryegzQzAkYGttKqjW2dkf6g9x77k3NGZ
 YW/g7RYFbu7l0N4qgnOXJJ1V2xUP9cqeu/mm79/XHlnbIvnExQOERDf6Rc2rxsaeBwdP
 +G85xvOGTAF3kZvoeK5TcK1eli1wKgwmIA5IaRxM1Gy4xCjzAsRC9HGaHxORtJrVLRLS
 AgGcmv78+M4i8xM6sSfE2yGL1NsCZeNKXiVrxy9oVnX1M1ercefl46kSfZk4+ro7f83W
 iVJGzZL+Vg1o8aUlrZIkNUbXo+ryxxEm+cFQ/8BooE4pY6PVipcYYIJCT70rTZnKXRQR
 /MMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766231216; x=1766836016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5TVnYGVRm+Z+bM0lIMVs1bFQFPxij1W9a0LrjLJBefs=;
 b=S3gDHW5hX/o1uMvwu8xVrmb4OY+0FBXhYHXAWg+hZfgvKOjcOAazCWQGw3qUlDkp94
 e/62L09GbHUhmxlGYwydma+bm9TMHjfJL+kYS1sDvzB6Zb+4cTXg/QnbVOiVvayaH/H9
 Y7qMrodZ06SNyEiuTWdI5C975azA+25hI9/fsn7F+TpAsO8sbCgy1Ga5zk6pxAj61jhR
 OGanHraqQlwxDSE8ntmKSfxGUPfM94t9h3BcYMtF3XB6PNBpdOWWV0L9ocppz4rNxD7Z
 bXMx6Ri2NV25TVw9p6wOuIUvV4hBJdEA/2RgqXLkZNs2eFAMbUVAwc/W/T0JMFQ8lh45
 utSQ==
X-Gm-Message-State: AOJu0Yz4YQBT5UD+nB7YVgYTilVworsBqGInpSb/Xg0AoLWNfd6QRonI
 3Yr2A1Z6M8Yin+CYRhaPFQjBOq//hRRWbtoHC/P1u6itLLmj0QmYYg+G
X-Gm-Gg: AY/fxX5Yn5sUiUSWM8keDkxcjmVN8poQPxdaWhzfB63Ns/oM9lLYEyL4geeehjHCddN
 UOntyO9sEIN+wjfYB21jc6KAYHDzP07iDa5iAeohc/5Z6uhmdc4NPv4dcaXQ6Yo52nckhMnfHcO
 LgoFF5S07z1n4g6apSj9TmkMV89NbfZQCY1ZOm6ZtccMcGTGezIqe9GnQnE0o3NeYJDXPCs5g7S
 CwfmCiNJEu4gpsHwOSVlo7AT5aU3IHxMsYas/jO69725OLbuw1dJ1JoWpeDM96VIuvecPhZcRIF
 Bg0/qtBF8mNZHfxpXLb4ATYizHiNehnVjO3bn8d2sBl+OOsS9gJObSzZKcSO0d4f9dtyqOO69au
 b2MzR5ZIFhFC3TkLT4hVrkBtJuOFOUcTxoLIc2M9SJ0AkEoWUkLgNiDjwx5vT2PN8nAHX6DH/rR
 vnPqQmZLjhLMYPEHhN2CuLc2y/IBC2Mu2ilOUOk68nHMju9popJQy5MQVoMDXAiX52
X-Google-Smtp-Source: AGHT+IELNlsKxsU/N3AwaEHqZVa8d3VqY3sPOyWoKZDY18/xomgrXGuy0FNcPZ3/33pWm1bmLWxe4w==
X-Received: by 2002:a05:6402:1446:b0:64b:687f:d2a9 with SMTP id
 4fb4d7f45d1cf-64b8e830714mr3483821a12.1.1766231216468; 
 Sat, 20 Dec 2025 03:46:56 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a5bdb9sm495449066b.7.2025.12.20.03.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 03:46:56 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bernhard.berger@gmail.com
Subject: [PATCH 3/4] drm/amd/display: rename PCON adaptive sync types
Date: Sat, 20 Dec 2025 12:46:48 +0100
Message-ID: <20251220114649.169147-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251220114649.169147-1-tomasz.pakula.oficjalny@gmail.com>
References: <20251220114649.169147-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Dec 2025 01:26:28 +0000
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

Make the name more generic for the upcoming HDMI VRR over PCON
implementation

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c             | 4 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c     | 2 +-
 drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h     | 4 ++--
 drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7fe40bbba265..1318d88687ae 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9342,7 +9342,7 @@ static void update_freesync_state_on_stream(
 
 	aconn = (struct amdgpu_dm_connector *)new_stream->dm_stream_context;
 
-	if (aconn && (aconn->as_type == FREESYNC_TYPE_PCON_IN_WHITELIST || aconn->vsdb_info.replay_mode)) {
+	if (aconn && (aconn->as_type == ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST || aconn->vsdb_info.replay_mode)) {
 		pack_sdp_v1_3 = aconn->pack_sdp_v1_3;
 
 		if (aconn->vsdb_info.amd_vsdb_version == 1)
@@ -13003,7 +13003,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (amdgpu_dm_connector->dc_link)
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
-	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
+	if (as_type == ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST) {
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index d0f770dd0a95..63dc9382c48e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1393,7 +1393,7 @@ enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link)
 		if (dpcd_caps->adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT == true &&
 			dpcd_caps->allow_invalid_MSA_timing_param == true &&
 			dm_is_freesync_pcon_whitelist(dpcd_caps->branch_dev_id))
-			as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
+			as_type = ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST;
 		break;
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 66dc9a19aebe..91fe039c0c95 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -44,8 +44,8 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 enum adaptive_sync_type {
 	ADAPTIVE_SYNC_TYPE_NONE                  = 0,
 	ADAPTIVE_SYNC_TYPE_DP                    = 1,
-	FREESYNC_TYPE_PCON_IN_WHITELIST          = 2,
-	FREESYNC_TYPE_PCON_NOT_IN_WHITELIST      = 3,
+	ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST     = 2,
+	ADAPTIVE_SYNC_TYPE_PCON_NOT_IN_WHITELIST = 3,
 	ADAPTIVE_SYNC_TYPE_EDP                   = 4,
 };
 
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index b3d55cac3569..429bc0ab86d6 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -535,12 +535,12 @@ void mod_build_adaptive_sync_infopacket(const struct dc_stream_state *stream,
 		if (stream != NULL)
 			mod_build_adaptive_sync_infopacket_v2(stream, param, info_packet);
 		break;
-	case FREESYNC_TYPE_PCON_IN_WHITELIST:
+	case ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST:
 	case ADAPTIVE_SYNC_TYPE_EDP:
 		mod_build_adaptive_sync_infopacket_v1(info_packet);
 		break;
 	case ADAPTIVE_SYNC_TYPE_NONE:
-	case FREESYNC_TYPE_PCON_NOT_IN_WHITELIST:
+	case ADAPTIVE_SYNC_TYPE_PCON_NOT_IN_WHITELIST:
 	default:
 		break;
 	}
-- 
2.52.0

