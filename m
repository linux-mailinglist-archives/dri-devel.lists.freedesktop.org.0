Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOniBbdJk2kT3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9A014655D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FCB10E3C7;
	Mon, 16 Feb 2026 16:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CGiZ7jEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D24D10E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:38 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id
 a640c23a62f3a-b8dd0168b90so55577866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260337; x=1771865137; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kS7PzC/JbAdPihFpg3ya83BJ8JEcjwBMKcTZhCYl4bU=;
 b=CGiZ7jErrAk8jaDShm0zg/1TuiOrGZio1ZUr26Qd+mO5QmTCZDY4H32R9PCLZgsl/T
 qe2TPFB+3PJOkiMmK2SEjxEDJcqeQIyabQKYH9JtEA+BV0+ToQ1hZ7zdxF5UVVmY7T0p
 oeak17Q5+yDySg4a8OU7CAK9Cmz2z6Dbiicd9GZ8nMwm4Xbff854ZZ5sAwJsi4d4fb+v
 jt0G32rQgnGUrkvAQb8CBejcXvH7RVghJJZ5QcH+sr6ZG3zab8CfrvWHnMPpcj5gI11d
 lLd6D7d9Gw23dE06BRNJezir9HMXyluN5X1R0CIMYgyqqNRcBxfGAl0ExEg+zNzR5zF8
 BVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260337; x=1771865137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kS7PzC/JbAdPihFpg3ya83BJ8JEcjwBMKcTZhCYl4bU=;
 b=o7iqWRXNfcBTvacSC39LhFSABfyvFln1iBRSMxvpe7EegRhdQHdsqL7zuBUEekKpCr
 zI6dM0cUE0u4JjnHXas7UtKGUkGGbzro24Lsr3ZyQHEBfs7H0yMFypIFy5EnCXquV4eW
 T3DCTNOnMXRdFJ3ksNA3FAJ4tZjaRpwjjyO7kSyl9OGo4fGLrmuPCgpRjgYnF4ZDPd0v
 9srV7Tb7Nu+58JdzF/TsBwU2mxYGH5eFmeBP6XbtO8+8lFjOXk1bLyIOG7vLJqga0f1M
 eQS8Gyh3LjH/dKqiJRpW5sqYW7NsjcdjexuK11Sja1ZyOelZGuhBAS/LbrhRLNzMmChX
 GW/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDU+pbYqjN9LxPfbXBufi90WBvovlEuEsCIGzlg7zd6I9eWeiswpvNxUAgTWgzIqFb4gTueBXrXJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYLW7QXNMtOpbb1n8gMMl0GUOhUYNL0YT4B1WBW8cP6wMz/CZm
 SPPYvG154MkfSwjF56+HZxvxyp7zdb/g/KjhX9mZVNHY3k0G2F/v+3wo
X-Gm-Gg: AZuq6aIuh3Xtp610z6sFICrXkuafHk6HQKCMwAAUC9DQoLIDjKtxLyK8AIWtTnBTB75
 z5pH0vnU+tAHM9sTrxzQBSBWpww6YTHFDWfk7b2cp9byeoBqvJK9aMeAEpYBSbPrMzh/QHIElxb
 atVKrto186RkZiY6//b7T7eO4xPSUI52mUHrEEBgHHeXjpjFBMn6cewZhquUETHB2ltS0DTsGr8
 Cj04wBj6O3JLgeTLVRangCxm9u4vO+aEO9ETqkdy2BcbJN0faHlk52OeLXZX3DlQZqL7Lcq/qwg
 NuA/1yvM8umLoy2j2Mb6j2XflP9zVQxu8l+uqb1L143eP0gx6MBErdFUKdPnLQ5WpqYhHk+nLg5
 paj+1hirukx5jywtp+M3eSYeuTuE3ybGyF9MLnqwkTV92PeEFjecrb43+nW9BhnZWS7s92W2sk2
 Sq5BZZFVxEjFrR1qfJ6pbsnMORgOcWKdT911BBsjl++XPIGU9SRGFJfftsM4RQPjr+HwF3NH/75
 +1c
X-Received: by 2002:a17:907:2686:b0:b8e:fd74:f6b7 with SMTP id
 a640c23a62f3a-b8facdf05a6mr322183666b.5.1771260336510; 
 Mon, 16 Feb 2026 08:45:36 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:36 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 13/27] drm/amd/display: Rename PCON adaptive sync types
Date: Mon, 16 Feb 2026 17:45:02 +0100
Message-ID: <20260216164516.36803-14-tomasz.pakula.oficjalny@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BC9A014655D
X-Rspamd-Action: no action

[Why]
PCONs support sending out HDMI VRR infopackets on their own and this
makes this types not specific to FreeSync

[How]
Make the name more generic for the upcoming HDMI VRR over PCON
implementation

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c      |  5 +++--
 .../gpu/drm/amd/display/modules/inc/mod_info_packet.h  | 10 +++++-----
 .../drm/amd/display/modules/info_packet/info_packet.c  |  4 ++--
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b6079a1ce2ac..e511eb5a1f7f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9629,7 +9629,8 @@ static void update_freesync_state_on_stream(
 
 	aconn = (struct amdgpu_dm_connector *)new_stream->dm_stream_context;
 
-	if (aconn && (aconn->as_type == FREESYNC_TYPE_PCON_IN_WHITELIST || aconn->vsdb_info.replay_mode)) {
+	if (aconn && (aconn->as_type == ADAPTIVE_SYNC_TYPE_PCON_ALLOWED ||
+		      aconn->vsdb_info.replay_mode)) {
 		pack_sdp_v1_3 = aconn->pack_sdp_v1_3;
 
 		if (aconn->vsdb_info.amd_vsdb_version == 1)
@@ -13398,7 +13399,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 	/* DP -> HDMI PCON */
 	} else if (pcon_allowed && vsdb_info.freesync_supported) {
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
2.53.0

