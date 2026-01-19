Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA08D39BC5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58F010E310;
	Mon, 19 Jan 2026 01:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VQzp6NrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4033C10E309
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:12:04 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-64b7b08fc0eso265042a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785123; x=1769389923; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6HUGS6jvxmoIyvr+IqDq6ssoVfWMzXazHZIMF4nNX64=;
 b=VQzp6NrZYaIj/jPFy1O2356rAR4WJEHgRTLKKT4dZ8FZ4vqS3wCT0Lt4AGhJGPPNZM
 7tFs/Xu+lrT5o1Hg/vA+qCxJPMGBL/1X234d0PqQHdDF7ZH6Z4xBniPxBqAdhJCIgQPg
 Ay4J3juZqKXZibEgznj3w7T+IHCKRPZW1arrj2rvwNfvIAdoJSpJwD++Q/xBH9oyTy4M
 jPpCZPIKPA9wB7wP/zo4NsMNGfb2/n74lptLyeQqGBovdoZntPy+Awsj7YUR05yRYCGg
 kcK3YuVvIkcr4ueo4gKpuD6+kyGArvQD+PZWLjrUUGq/Rv1Xa8NhpJr42WGolC2Se9ks
 bLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785123; x=1769389923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6HUGS6jvxmoIyvr+IqDq6ssoVfWMzXazHZIMF4nNX64=;
 b=P3laNJZ6nTvNs5Vd0jB2uQzqvE1FcHASwIxgyejhpnt3VwcchHWgKHVOj2jxbvut/W
 T0xkwQg03oo6TEqT2OA3SEVdyRKv1eruUmnyFgiwTmwyAsN7b2c2hVOq6I2I14iTjxj5
 7dseqqRrf3ugH0JVpIQcQf2/yyqHCEW8wIOg/k9MIXLGiFAh7hlbc/en2nfF/Yp3YtVM
 7edFQj5r3SzZhBQBx+h+4HfLkQZ/EiV37FzFLQAOIBV9WIIZg4TZZmydHMnNdGaCSvzS
 QuAuxKibvrSUNdqTu1/p3rkL7XtxbvvVsbb7rXyFXFUrkqXLfZGADF5RIPeokexX5ilT
 jq2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPrxcDetga8Qz7V60XhxJRsD59d05JfASWdZKPV4M+9g032pVx9Gzc1am0LF9uW33nl8z6TCgv26Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ8VLaTbqqydbBQspsvgqM7ATDNUlccFiqL63EoecAVRjCTCN7
 YBaZMfrF0tMFNPtNQWIq+xn8dYVpEDRl620pT4LAVbCJHmkwLxPN9oyI
X-Gm-Gg: AY/fxX60WzrwWW73ZvAzWwvTaJX0gHLk+/sTSpp6m9c5hzaX5aPD+iSxynDrE2YS99+
 /M4WO4rfvx4NTr8qJk9vPP6Jmit5l3jLdbIV9YtTcXObIKJWchwIuzTOQisA2htJS/ZVUs/tuBN
 X3GPB2e3p1DB5uwKLfC+ii/P+Xp97GzfuOHvWIkN41DMOSj2Da2m0hqBq6qNEF5pG6P3XWfsz1T
 6CaN0hPGuPUzbRWXhv1B/UqLs39bD54DNme9EU1srnxX03pI6mlsalCe2PtpdsuEK5XjPABdtd8
 aO0lS2mIxd0+cpSk4+BTz5fedWBlajUSSri34WsgxObuFzfUKgrt+GG7olJD2IBOc6aIfd3IQvD
 KswHgOG+FoPPFCkeRD774E4js1MuRr3iKBD/N/UbFyLRJxBNnZLHl+25fIKArTfhqdmoEy4lFA8
 pRUkMtZb5KJ5t5ApxHy+UEHBctw9VOvCWmLgz01FAoJbWaiwVL6vjrU4+eEC+LTNuBAwCC/YWlG
 Ug=
X-Received: by 2002:a05:6402:3513:b0:64d:46f:331 with SMTP id
 4fb4d7f45d1cf-65452ddd6edmr4683637a12.8.1768785122665; 
 Sun, 18 Jan 2026 17:12:02 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:12:02 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 09/17] drm/amd/display: Rename PCON adaptive sync types
Date: Mon, 19 Jan 2026 02:11:38 +0100
Message-ID: <20260119011146.62302-10-tomasz.pakula.oficjalny@gmail.com>
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
PCONs support sending out HDMI VRR infopackets on their own and this
makes this types not specific to FreeSync

[How]
Make the name more generic for the upcoming HDMI VRR over PCON
implementation

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c      |  5 +++--
 .../gpu/drm/amd/display/modules/inc/mod_info_packet.h  | 10 +++++-----
 .../drm/amd/display/modules/info_packet/info_packet.c  |  4 ++--
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 859e34235769..b7deff137df4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9597,7 +9597,8 @@ static void update_freesync_state_on_stream(
 
 	aconn = (struct amdgpu_dm_connector *)new_stream->dm_stream_context;
 
-	if (aconn && (aconn->as_type == FREESYNC_TYPE_PCON_IN_WHITELIST || aconn->vsdb_info.replay_mode)) {
+	if (aconn && (aconn->as_type == ADAPTIVE_SYNC_TYPE_PCON_ALLOWED ||
+		      aconn->vsdb_info.replay_mode)) {
 		pack_sdp_v1_3 = aconn->pack_sdp_v1_3;
 
 		if (aconn->vsdb_info.amd_vsdb_version == 1)
@@ -13324,7 +13325,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 	/* DP -> HDMI PCON */
 	} else if (pcon_allowed && vsdb_freesync) {
-		amdgpu_dm_connector->as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
+		amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_PCON_ALLOWED;
 		amdgpu_dm_connector->pack_sdp_v1_3 = true;
 		amdgpu_dm_connector->vsdb_info = vsdb_info;
 
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index ddd64b7e4c04..5de8a6918e6a 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -48,11 +48,11 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 		struct dc_info_packet *info_packet);
 
 enum adaptive_sync_type {
-	ADAPTIVE_SYNC_TYPE_NONE                  = 0,
-	ADAPTIVE_SYNC_TYPE_DP                    = 1,
-	FREESYNC_TYPE_PCON_IN_WHITELIST          = 2,
-	FREESYNC_TYPE_PCON_NOT_IN_WHITELIST      = 3,
-	ADAPTIVE_SYNC_TYPE_EDP                   = 4,
+	ADAPTIVE_SYNC_TYPE_NONE             = 0,
+	ADAPTIVE_SYNC_TYPE_DP               = 1,
+	ADAPTIVE_SYNC_TYPE_PCON_ALLOWED     = 2,
+	ADAPTIVE_SYNC_TYPE_PCON_NOT_ALLOWED = 3,
+	ADAPTIVE_SYNC_TYPE_EDP              = 4,
 };
 
 enum adaptive_sync_sdp_version {
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 00473c6284d5..294f56d20062 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -590,7 +590,7 @@ void mod_build_adaptive_sync_infopacket(const struct dc_stream_state *stream,
 		if (stream != NULL)
 			mod_build_adaptive_sync_infopacket_v2(stream, param, info_packet);
 		break;
-	case FREESYNC_TYPE_PCON_IN_WHITELIST:
+	case ADAPTIVE_SYNC_TYPE_PCON_ALLOWED:
 	case ADAPTIVE_SYNC_TYPE_EDP:
 		if (stream && stream->link->replay_settings.config.replay_supported &&
 			stream->link->replay_settings.config.replay_version == DC_VESA_PANEL_REPLAY)
@@ -599,7 +599,7 @@ void mod_build_adaptive_sync_infopacket(const struct dc_stream_state *stream,
 			mod_build_adaptive_sync_infopacket_v1(info_packet);
 		break;
 	case ADAPTIVE_SYNC_TYPE_NONE:
-	case FREESYNC_TYPE_PCON_NOT_IN_WHITELIST:
+	case ADAPTIVE_SYNC_TYPE_PCON_NOT_ALLOWED:
 	default:
 		break;
 	}
-- 
2.52.0

