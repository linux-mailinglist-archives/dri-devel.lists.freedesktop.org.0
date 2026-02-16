Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMwsKtVJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:46:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C81465ED
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9156610E3D7;
	Mon, 16 Feb 2026 16:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HhZU/Y2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C199310E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:48 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b8fa033d805so46898666b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260347; x=1771865147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61QqaYqAJ4tBG5OXB271IehCG1TZaMd4977PuSXDslQ=;
 b=HhZU/Y2RaAFYxgumqRTaIbehPgO8Y45251ow7V9TmvcxwbpKQxJr/R8HvlKo3QwCDj
 qd89euCVsAbE2AsoNFQQCBUjdWU/id4DnPJQHB/DOSf5WUhkoeEKWisvpUfN/rIUcANq
 cIydtzCyYrS3o+HlK4hqeJwdRvW7V9Zn5d6DnbAFEqSkDbOFdD0MN20puuIkS3xrr/4Q
 VCWHYfAdEmLCLClPgLlTpPTwxMNq4duZCZx7XVE5ApCIjQeM5rC3oJCaP6/zqy4EKeFr
 A3ff8ve8hTIeepz50nuHV3IsHZYy26Kki//gONLlaY4nSSH5BVHtQk6cSXtq1AFxPTUp
 sKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260347; x=1771865147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=61QqaYqAJ4tBG5OXB271IehCG1TZaMd4977PuSXDslQ=;
 b=Z+y9QTJP2ajmO3QwoQsHWEcZabwTjRmqURLT57ej0PLoSRCnhgh0KDUzEdWuL9q0k+
 HIVjChVsIRUvUYt2f7SVVZzoYdoxPfYMq6HtkP4Nb4gHYrZqMo+O4G6T/C8CepN/VYYa
 zWaGjEhe1Yc2pE4bPPwWUoCQI7yuWL6wkclBT1Ha5ieNx05TVmij2urjVBxCQ198/vip
 IPZyELi4bKMX5Jn8Q08yK+4cShFxIXRVDRh0qpxLbd1DeYNjfAQGTKpiW4eY9WL963YH
 Z9wt2vPGfLb8tTfXKFiy85PT6vqBFBXSplzw9oZcmYJUScqjGDcctwZVaU0wq/HmZdzr
 LvrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXedegx8w6nUqXGUtdfHwxRVgMOzhs9ePtwEhUkMrqxspqxHVjWRYG1qbyNVZJWKcvcZyejyFOurcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnKETCM2wp3LFB2QtJWZlfWbbbJRNhKPOl42RwUi5EvFdcIJMl
 bo6Gt39TThhwP+0KuG/Rx/4H8mrImMovT2QxOjFIoz/xnhPk67VDrQXK
X-Gm-Gg: AZuq6aJ5HzNRIFCNyxJ+TSBNHIr6KgIDOqYD10e5SCLhGFTVStiYPShZJSRkaHr/izO
 unF54VeQ2UDkDey8HtlgYDWsg8nBtrLFcAeIzEBGUqT1KDQg4GijXTofTHZzaFXqZoEXy4co8CO
 sN3c7T7W+H9igoseZ9QwaRJqulsYNtsIsYTbODFK9jVlPiWLdlqQQFQzVDo1py1/oHhL70BC48N
 fmOk3BZVm0Dv+sh2dfGlsVVYmBqR97qL/Dg3DxNUpYFaqkrQG6onpcYPlN/eLGsQBMmw8sbxJYA
 tfzYWTDIJq65WkS3VDdN8Iav03KvFaknJYK2rEO8s5qO0/Qoij74yinRfkMXmHa84f67UQfLgTA
 79H9hby8rdygM40J5hOHbofrnq1F5DsR9u9NxN8VdKeFmqmgdxLtDmPcSONvOwzKBMlSKdUBq/D
 /P6Qy9ByH1RbJmPboV0xU9jAuRctkwAtV5CmztW3rLFp1V3rCyfMXI0K2vNgfdjLxOWWZ2yk5rv
 b2K
X-Received: by 2002:a17:907:3e88:b0:b73:59b0:34c6 with SMTP id
 a640c23a62f3a-b8face510e0mr348090166b.4.1771260347159; 
 Mon, 16 Feb 2026 08:45:47 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:46 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 21/27] drm/amd/display: Enable HDMI VRR
Date: Mon, 16 Feb 2026 17:45:10 +0100
Message-ID: <20260216164516.36803-22-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 5D8C81465ED
X-Rspamd-Action: no action

[Why]
We'd like to expose VRR functionality to end user if HDMI sink is
advertising it's support.

[How]
VTEM info frame is used to signal HDMI sink that VRR is active.
Use VTEM info packet as vrr_infopacket

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 ++++++++++++---
 .../drm/amd/display/modules/freesync/freesync.c   |  4 ++++
 .../drm/amd/display/modules/inc/mod_info_packet.h |  1 +
 .../amd/display/modules/info_packet/info_packet.c |  1 +
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 288437ada2a5..6a2806cc800a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9629,7 +9629,10 @@ static void update_freesync_state_on_stream(
 
 	aconn = (struct amdgpu_dm_connector *)new_stream->dm_stream_context;
 
-	if (aconn && (aconn->as_type == ADAPTIVE_SYNC_TYPE_PCON_ALLOWED ||
+	if (aconn && aconn->as_type == ADAPTIVE_SYNC_TYPE_HDMI)
+		packet_type = PACKET_TYPE_VTEM;
+
+	else if (aconn && (aconn->as_type == ADAPTIVE_SYNC_TYPE_PCON_ALLOWED ||
 		      aconn->vsdb_info.replay_mode)) {
 		pack_sdp_v1_3 = aconn->pack_sdp_v1_3;
 
@@ -13419,8 +13422,14 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		}
 
 	/* HDMI */
-	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_info.freesync_supported) {
-		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
+		/* Prefer HDMI VRR */
+		if (hdmi_vrr.supported) {
+			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_HDMI;
+			monitor_range_from_hdmi(&connector->display_info, &vsdb_info);
+		} else if (vsdb_info.freesync_supported)
+			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
 
 	/* DP -> HDMI PCON */
diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index 1aae46d703ba..db197cf048e1 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -27,6 +27,7 @@
 #include "dc.h"
 #include "mod_freesync.h"
 #include "core_types.h"
+#include "mod_info_packet.h"
 
 #define MOD_FREESYNC_MAX_CONCURRENT_STREAMS  32
 
@@ -955,6 +956,9 @@ void mod_freesync_build_vrr_infopacket(struct mod_freesync *mod_freesync,
 		return;
 
 	switch (packet_type) {
+	case PACKET_TYPE_VTEM:
+		mod_build_vtem_infopacket(stream, vrr, infopacket);
+		break;
 	case PACKET_TYPE_FS_V3:
 		build_vrr_infopacket_v3(stream->signal, vrr, app_tf, infopacket, stream->freesync_on_desktop);
 		break;
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 027113ec147d..03d37b6f1cd0 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -59,6 +59,7 @@ enum adaptive_sync_type {
 	ADAPTIVE_SYNC_TYPE_PCON_ALLOWED     = 2,
 	ADAPTIVE_SYNC_TYPE_PCON_NOT_ALLOWED = 3,
 	ADAPTIVE_SYNC_TYPE_EDP              = 4,
+	ADAPTIVE_SYNC_TYPE_HDMI             = 5,
 };
 
 enum adaptive_sync_sdp_version {
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 96c84f70ed44..7106b409ae54 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -699,6 +699,7 @@ void mod_build_adaptive_sync_infopacket(const struct dc_stream_state *stream,
 		break;
 	case ADAPTIVE_SYNC_TYPE_NONE:
 	case ADAPTIVE_SYNC_TYPE_PCON_NOT_ALLOWED:
+	case ADAPTIVE_SYNC_TYPE_HDMI:
 	default:
 		break;
 	}
-- 
2.53.0

