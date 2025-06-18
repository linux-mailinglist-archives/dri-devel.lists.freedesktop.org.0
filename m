Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B46ADF136
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A8110E2C0;
	Wed, 18 Jun 2025 15:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="q/nbc807";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AFB10E2C0;
 Wed, 18 Jun 2025 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6j/rjlgI8RVIRAvBBWO3UMww4myFRy9sztlLbnIGYuw=; b=q/nbc807U46in6qjsfcyrQhpkI
 8g2mv3PbMzD6c/bW/GKNbxzbfFdEH52/0mWBM1SxKoh1pv2GZaCNK1lKwqCxImFhNUxdwXWjSLotH
 SZ/iBeNdGcw+pH+581ldOxD8WyuLOPjKocLZwYMqR9orti1Yx8ZnklwDK9pONlKKmnzKaFZje7XVp
 bhCcjL1EIIS9Ehd1BHftYeWM+xCSBaI9oKHmgNigvcCpMoOtvRj+cru6WmxD6Q34wbA2Awy5B7gep
 n+OnKF/5GZWfqaquiYVMgWA1a2U0vhXQ8Z2/0Nv3sNdcNxrcaZrB08MuU4Ys4SLm/UofMj2s69prB
 XIdgWicw==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRud0-0057e5-Ur; Wed, 18 Jun 2025 17:23:07 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v5 07/14] drm/amd/display: get SADB from drm_eld when parsing
 EDID caps
Date: Wed, 18 Jun 2025 12:19:46 -0300
Message-ID: <20250618152216.948406-8-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250618152216.948406-1-mwen@igalia.com>
References: <20250618152216.948406-1-mwen@igalia.com>
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

drm_edid_connector_update() updates display info, filling ELD with
speaker allocation data in the last step of update_dislay_info(). Our
goal is stopping using raw edid, so we can extract SADB from drm_eld
instead of access raw edid to get audio caps.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 10af9db47c39..e7cfbee6c67f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -106,9 +106,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
 	const struct drm_edid *drm_edid;
 	struct drm_edid_product_id product_id;
-	int sad_count, sadb_count;
+	int sad_count;
 	int i = 0;
-	uint8_t *sadb = NULL;
 	enum dc_edid_status result = EDID_OK;
 
 
@@ -156,19 +155,11 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 		edid_caps->audio_modes[i].sample_size = sad.byte2;
 	}
 
-	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
-
-	if (sadb_count < 0) {
-		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sadb_count);
-		sadb_count = 0;
-	}
-
-	if (sadb_count)
-		edid_caps->speaker_flags = sadb[0];
+	if (connector->eld[DRM_ELD_SPEAKER])
+		edid_caps->speaker_flags = connector->eld[DRM_ELD_SPEAKER];
 	else
 		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
 
-	kfree(sadb);
 	drm_edid_free(drm_edid);
 
 	return result;
-- 
2.47.2

