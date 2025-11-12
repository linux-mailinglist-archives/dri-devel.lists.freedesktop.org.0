Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB9C52F35
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 16:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8124010E752;
	Wed, 12 Nov 2025 15:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E0910E751
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 15:18:46 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42b3d4d9ca6so841584f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762960725; x=1763565525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CoNxldqQ9XC46fWcQpE6fTzrSoqa7Z4c9uT8rkaqQDA=;
 b=Ga1AODPA6BuzdVZJKTDjV3Z4IwGCvnrBGDC3VejH4/OqH3MNfsthc71X0knQOS8I+h
 SulTHj5fpVKxlkelWY3lJ3B3lpwIskni4uGgBM2WZhe1K8td+GX4SNfbkZ9Vl7uuBpEe
 yeqLpyXADz7pvZWo4JfaOSeu1AlixhaI83vuJH0lvkPFV5CqzLEYSpOq1JqpcA8hW3FQ
 7c2VdNaoY57jGq9gEtGRkDgDJqQjVlWcCOe+B8HP7ks4N4LiuXeKGO0Afg5M9HYp3QDH
 51JHzxXxlZhvXgXsXvzGIXUSRK5NvPTp2d3WsDNnPv9Xqm+FcaRxoyhaZSIVd8hSBd/c
 8Xqw==
X-Gm-Message-State: AOJu0Yw6DYQWPT99UoDFTs/m8r6Vj9Pj4fH4QhKxVQ038cWZPIN/KkCI
 6EqjB9fk8ATOceVZMgIYsTSOsCuaESMhKP7Yx9qMYe+aqVPNHTW5zRO3A4uQpw==
X-Gm-Gg: ASbGncu1PLu3K2bdBaVv/pLYenRfmL2fmXzM2xoSt5VmllWBZzB2SxT+7sNCHfKSOWm
 cu/ltmUYnYqAHBSP54WadF2TYuUuyho9mWqrvFc0YQWAf70FJZ9yfKNhZqyAK/hndcDHMXSv3ce
 J9ujrBMQzrwJ7tXvc6gpVL0B66R+PTlMIVUbSyBH9wqfngQwKJbQqgXWq+U8CBY0XJe173AyO8i
 N4vRHmXRFhXDSOJ5ZO1opuRWGzchw4kXznSUi8pk/+fYNJwJSFyM5z97IYUr/zg3CpaEcUr/xBS
 GTor6xe+b+PYJ/gagXXJkg4id59gpKq3zWaIWcPyHwwcZHJLkJ3V6rvnRXhj9MaL/iod3Jdy1zm
 Jgu5iF18QAXD3MezYpcq6WKkWbrESCsQc4pTGGwG28WBIZ+X1EwSx7NUENwvihmk/MmWIywcFfC
 sgR/Uu7EUjAr+yFmZ2khNHXDdgQZFWnA==
X-Google-Smtp-Source: AGHT+IGF7nGz/ug3qY7kPQEMpiNaYPXy+qWXoxY1uIwMuOXL0cO51Om5p4heD/ImJII5Z0tzw/FHWw==
X-Received: by 2002:a5d:5d10:0:b0:405:3028:1be2 with SMTP id
 ffacd0b85a97d-42b4bb87689mr3349619f8f.11.1762960725208; 
 Wed, 12 Nov 2025 07:18:45 -0800 (PST)
Received: from xavers-framework.fritz.box ([193.124.138.23])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b32c1ad2bsm23255211f8f.6.2025.11.12.07.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 07:18:44 -0800 (PST)
From: Xaver Hugl <xaver.hugl@kde.org>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, Xaver Hugl <xaver.hugl@kde.org>
Subject: [PATCH 2/3] amdgpu_dm: also look for the AMD VSDB in CEA extensions
Date: Wed, 12 Nov 2025 16:18:31 +0100
Message-ID: <20251112151832.77867-2-xaver.hugl@kde.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112151832.77867-1-xaver.hugl@kde.org>
References: <20251112151832.77867-1-xaver.hugl@kde.org>
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

This makes FreeSync 2 work on some DisplayPort monitors that are lacking the
vsdb in DisplayID extensions.

Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1660169ae5aa..6597fe07e984 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -12557,9 +12557,9 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 	return false;
 }
 
-static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-			       const struct edid *edid,
-			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
+static int parse_cea_amd_vsdb(struct amdgpu_dm_connector *aconnector,
+			      const struct edid *edid,
+			      struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -12657,16 +12657,22 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 				freesync_capable = true;
 		}
 
-		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
-
-		if (vsdb_info.replay_mode) {
+		i = parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
+		if (i <= 0) {
+			/* Some DP monitors have the AMD VSDB in the CEA-861 block instead */
+			i = parse_cea_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
+		}
+		if (i >= 0) {
 			amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_info.replay_mode;
 			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
-			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
+			if (sink->sink_signal == SIGNAL_TYPE_EDP)
+			    amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
+			else
+			    amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_DP;
 		}
 
 	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
-		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
+		i = parse_cea_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported) {
 			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
 			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
@@ -12682,7 +12688,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
 	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
-		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
+		i = parse_cea_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
 
 			amdgpu_dm_connector->pack_sdp_v1_3 = true;
-- 
2.51.1

