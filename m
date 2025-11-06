Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2CC3CA03
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BC110E977;
	Thu,  6 Nov 2025 16:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SDqHMkcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1512310E975;
 Thu,  6 Nov 2025 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wYgcaOMR52hfbrtX/qnHwonJAx+wgLaLtExRA0omJqM=; b=SDqHMkcFcJHHyZ8hAXQQnxubNX
 MiScOi/tiBlQJk0lhdiOAteCB3yMnVrKQG36IoKXy5nstacHRYq4xeUuDuDodTn21VmmCRLaKa95s
 FDnKawANbAqoklXmVqR4TNIbo4V/ItV3fbBAmZczrSUCO7s5HurvQpVLHQvPsnOBW3hU9WG3PdDmU
 iVn+dDElmtrY1XnALvtfIRQGeTnitiAsxvKjM+IlsdE+A/jtYedvF+iV5Tdfm/f07flK3ROrofTsk
 VMFvs4zBR546xUsI/ratTN/Dk6DdBisqwmSk/se+AJ/qqOm6KQye8PcJY/9skfE7jJPzPaZbX/JoX
 +zkPhTEg==;
Received: from [186.208.74.26] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH3Hd-0035jh-9t; Thu, 06 Nov 2025 17:56:25 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mwen@igalia.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, simona@ffwll.ch, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v7 07/15] drm/amd/display: get SAD from drm_eld when parsing
 EDID caps
Date: Thu,  6 Nov 2025 13:49:10 -0300
Message-ID: <20251106165536.161662-8-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106165536.161662-1-mwen@igalia.com>
References: <20251106165536.161662-1-mwen@igalia.com>
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

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index c055841c3a8f..4333b02dc552 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -34,6 +34,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
 #include <drm/drm_fixed.h>
 
 #include "dm_services.h"
@@ -107,9 +108,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
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
@@ -123,6 +122,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	if (!drm_edid_valid(drm_edid))
 		result = EDID_BAD_CHECKSUM;
 
+	drm_edid_connector_update(connector, drm_edid);
 	drm_edid_get_product_id(drm_edid, &product_id);
 
 	edid_caps->manufacturer_id = product_id.manufacturer_name;
@@ -140,7 +140,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	apply_edid_quirks(dev, drm_edid, edid_caps);
 
-	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
+	sad_count = drm_eld_sad_count(connector->eld);
 	if (sad_count <= 0) {
 		drm_edid_free(drm_edid);
 		return result;
@@ -148,12 +148,15 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
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
@@ -168,7 +171,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	else
 		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
 
-	kfree(sads);
 	kfree(sadb);
 	drm_edid_free(drm_edid);
 
-- 
2.51.0

