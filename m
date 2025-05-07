Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3286AAD21F
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 02:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C9010E723;
	Wed,  7 May 2025 00:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lQ9UGkZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D53010E724;
 Wed,  7 May 2025 00:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x5O/GjWRNhapgAEP9gAN8riK58EliX8DSwR+sXK8Gy0=; b=lQ9UGkZW1qLWjlJWlynMLhqaLS
 PIIRHesk4jYmdBPUCMUagS5h+lCDH2e5WApQnL8ZSkn5aGPoYv0p2eWFC4exq/w69vsXiuJrz5fY6
 5YLLANWWy3/WQXY1yZrU+lkAaSzcO0cQb059KgKh24xxk+3EisgqLojVR5aJ3aKJdgBha8yZ9Gh7V
 B//PDMGqB6jcVAWYSW9/4SsFSsSnIl09SCBWxxO5mCaqYbE/yWDwhq0W/qsHhm2zBHeygN5ZJDasz
 fLM/zZRL78vdr/jOsVsTjaedLD9pl8jjU6fMK6LHl3/bWKexwbxpRVM70Od8lkLuiXDu2N0R7GRsT
 LblMSwiQ==;
Received: from [189.6.16.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uCSQK-004SNM-WF; Wed, 07 May 2025 02:17:54 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v2 06/14] drm/amd/display: get SAD from drm_eld when parsing
 EDID caps
Date: Tue,  6 May 2025 21:04:00 -0300
Message-ID: <20250507001712.120215-7-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507001712.120215-1-mwen@igalia.com>
References: <20250507001712.120215-1-mwen@igalia.com>
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

drm_edid_connector_update() updates display info, filling ELD with audio
info from Short-Audio Descriptors in the last step of
update_dislay_info(). Our goal is stopping using raw edid, so we can
extract SAD from drm_eld instead of access raw edid to get audio caps.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 760da13612b9..10af9db47c39 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -33,6 +33,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 #include <drm/drm_fixed.h>
 
 #include "dm_services.h"
@@ -105,9 +106,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
 	const struct drm_edid *drm_edid;
 	struct drm_edid_product_id product_id;
-	struct cea_sad *sads;
-	int sad_count = -1;
-	int sadb_count = -1;
+	int sad_count, sadb_count;
 	int i = 0;
 	uint8_t *sadb = NULL;
 	enum dc_edid_status result = EDID_OK;
@@ -121,6 +120,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	if (!drm_edid_valid(drm_edid))
 		result = EDID_BAD_CHECKSUM;
 
+	drm_edid_connector_update(connector, drm_edid);
 	drm_edid_get_product_id(drm_edid, &product_id);
 
 	edid_caps->manufacturer_id = product_id.manufacturer_name;
@@ -137,7 +137,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	apply_edid_quirks(dev, drm_edid, edid_caps);
 
-	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
+	sad_count = drm_eld_sad_count(connector->eld);
 	if (sad_count <= 0) {
 		drm_edid_free(drm_edid);
 		return result;
@@ -145,12 +145,15 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
 	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
-		struct cea_sad *sad = &sads[i];
+		struct cea_sad sad;
 
-		edid_caps->audio_modes[i].format_code = sad->format;
-		edid_caps->audio_modes[i].channel_count = sad->channels + 1;
-		edid_caps->audio_modes[i].sample_rate = sad->freq;
-		edid_caps->audio_modes[i].sample_size = sad->byte2;
+		if (drm_eld_sad_get(connector->eld, i, &sad) < 0)
+			continue;
+
+		edid_caps->audio_modes[i].format_code = sad.format;
+		edid_caps->audio_modes[i].channel_count = sad.channels + 1;
+		edid_caps->audio_modes[i].sample_rate = sad.freq;
+		edid_caps->audio_modes[i].sample_size = sad.byte2;
 	}
 
 	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
@@ -165,7 +168,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	else
 		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
 
-	kfree(sads);
 	kfree(sadb);
 	drm_edid_free(drm_edid);
 
-- 
2.47.2

