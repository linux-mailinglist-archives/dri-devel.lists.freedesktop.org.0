Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18DAD39BCC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D800710E314;
	Mon, 19 Jan 2026 01:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="acb914OD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFBF10E315
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:12:15 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-64c72418c6eso691692a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785134; x=1769389934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmS0ptEIRfbi9CAZ3uGo3bYbHVKnzDLVy6mHiQZnvAs=;
 b=acb914ODKQ2bRLQYhuoBJKgxSaxOT7Can/xTcYtD419Lp3vTN2jKM05QI38lZ77v1H
 nTLrOVO2WXOceo+j2kn42KwAIgACoSIJEbH9AAsWtqUPEu/nGeODiu9felmj5iMXYdoF
 UZavfQii+se6PTReSn7piqpfzKrxIYbI9pj+I+o/uGg3nMGoKQEzyi21lcf87R/o3jv+
 CI/lbcSDauzKp/D46Q/LQ07MSwGnGK5n4beh33HRrRXoWhmFTQ27P/ZfU6swT1v+62y3
 8hh0JmLRo9lrFFZgBSBOETh/SzRBl8uwCR28rAR8wKx5hk5heIrhjSZTNeoGRgAKq/ld
 OuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785134; x=1769389934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LmS0ptEIRfbi9CAZ3uGo3bYbHVKnzDLVy6mHiQZnvAs=;
 b=NYX0rn7lvw372DbbIKsRv8w9c2Tcmou5WdSrVgEcNcdc2UiRUhvI7g2f+0rwycD9t9
 qy94JmOCYn0CZQWICjBcLwr08ZN81w6x51jZjIDZUDE8eY03/6ZdmwMlvhYQqtlvvzXy
 qNw4Bq9lWLXuZJ80PbMG0VEaOR5L2Jg+KRy/eQmY08ffcmK4/Jvs40tUVcRZ6dIbXlJZ
 MxhJ8pJTu1kPyXQOV3OPNoiL9jI87Fdwa2B2M83WyWBW0x0yMt769iuHXwunkMrPqIKM
 JhGpBcha1DvlRCppri1F2nM6eTXG/u1KB+wBl73y3yGWOrrZzGDs+MZmxb78Kz0MOH2B
 o5DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZhW4cvMBtxzhtptcQepbf9vQflV8EDA9PDpFM/U7y5we3DndI1PSeXBnrIWs7+It7RcL4+FFuxg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO5PJ3/DNp1QGBE02tKotggNH9g7T4CfGC/oQINLisY5N8JKQa
 mpiWAAHV5NMxDfD9ZHpYRss0gpv3E0Dp8LUdPbcj/mtc2dVn43M6Y+Sr
X-Gm-Gg: AY/fxX5hhzk3Z0/9+3Xx73171r8gFi49HnTqwmq/hkltSnIdwAQwITmWm7nkEqEhnHX
 nHsFI0faexR0RnmmV+Yn2tMkFnMWf3JTEhMMU4N2ySK2zx1bDpXGwv5b0fjv4ZcbIRlfQ1F9FUr
 NmYduHbFmuWvkROLgDW4YVjIgpJckxMfLfJq1La7amt886B6mW3G24qJC4ijbPxLKtRa8CjveLa
 K0AulBFYoKyw7LMwwQkX8b/GOZ7E12wgHuGVvgbTLMUqAVlgJLL5Z5SB8cMCA3Ntf1d9d0w9xIu
 k9roRkA46ZVb7MtzFKRfnglQ/4Q1i5oykXlVJ6vXpVoEB7CQq+9CpwDpFGX3pUfPoNJlm1AZOsO
 tLD0/yNShKW7I5VycXG/dtZ5DzeeAYUx1zdVbCqbN4PKXecmwyVVj7sSe1EQ/garVj9tOLDc2wo
 ZHFVtaYZDMPBhRW3kcgXq2Hm/UmT8sryr8EhhQdDiZdngqsGpeqarimTH9oyFlyleA
X-Received: by 2002:a05:6402:348d:b0:64c:9e19:982d with SMTP id
 4fb4d7f45d1cf-654523cc85bmr4269887a12.1.1768785133994; 
 Sun, 18 Jan 2026 17:12:13 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:12:13 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 17/17] drm/amd/display: Enable HDMI VRR
Date: Mon, 19 Jan 2026 02:11:46 +0100
Message-ID: <20260119011146.62302-18-tomasz.pakula.oficjalny@gmail.com>
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
We'd like to expose VRR functionality to end user if HDMI sink is
advertising it's support.

[How]
VTEM info frame is used to signal HDMI sink that VRR is active.
Use VTEM info packet as vrr_infopacket

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 13 +++++++++++--
 .../gpu/drm/amd/display/modules/freesync/freesync.c |  4 ++++
 .../drm/amd/display/modules/inc/mod_info_packet.h   |  1 +
 .../amd/display/modules/info_packet/info_packet.c   |  1 +
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ef7e02ebda41..75c3c8ad07e5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9612,6 +9612,9 @@ static void update_freesync_state_on_stream(
 					&new_stream->adaptive_sync_infopacket);
 	}
 
+	if (aconn && aconn->as_type == ADAPTIVE_SYNC_TYPE_HDMI)
+		packet_type = PACKET_TYPE_VTEM;
+
 	mod_freesync_build_vrr_infopacket(
 		dm->freesync_module,
 		new_stream,
@@ -13347,8 +13350,14 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		}
 
 	/* HDMI */
-	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_freesync) {
-		monitor_range_from_vsdb(connector, &vsdb_info);
+	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
+		/* Prefer HDMI VRR */
+		if (hdmi_vrr->supported) {
+			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_HDMI;
+			monitor_range_from_hdmi(connector, valid_vsdb_cea ? &vsdb_info : NULL);
+		} else if (vsdb_freesync)
+			monitor_range_from_vsdb(connector, &vsdb_info);
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
index 7bca0541443c..3fef1890a3fa 100644
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
index 42a736a5509a..e6d3398046d5 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -686,6 +686,7 @@ void mod_build_adaptive_sync_infopacket(const struct dc_stream_state *stream,
 		break;
 	case ADAPTIVE_SYNC_TYPE_NONE:
 	case ADAPTIVE_SYNC_TYPE_PCON_NOT_ALLOWED:
+	case ADAPTIVE_SYNC_TYPE_HDMI:
 	default:
 		break;
 	}
-- 
2.52.0

