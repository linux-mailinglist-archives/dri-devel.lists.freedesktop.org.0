Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6869AC3CA0F
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5B510E97C;
	Thu,  6 Nov 2025 16:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rdbsleQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4158B10E97C;
 Thu,  6 Nov 2025 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eRCB9cdYCnPvK225BE3No9HE8BZhyjVWyz8MUh6y0no=; b=rdbsleQmG47uAGdVRSFtB5wucU
 rhFmtkyWkVufeWWT3didbfXzKxovIn6a3QLKPNxc0lM7nyNWNZrOK8mnIsZX8GFWoR2znrCErFUbE
 PgsUy6rFS95wzNDbrJ/nIiWvQIl6KZxyrgcGq5Bg0qpaolO3YI7j4orPSfVJC85TzrxYJTAyfwTYD
 LZMsxE3vnckPqQ1mmlPkX7DHhD6ozEZySbLz/17PHHjGeqSmVFtZ2lksTnUFmHkvye4Lri2gw2Wua
 SFexSiKag85LdsJg8IwFRsQrsOlmhfOXWe7YN8AExA5MX/lHWZiV36unvOUYg+CKv09hmAOMklLlq
 Kw5I27jw==;
Received: from [186.208.74.26] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH3Hi-0035jh-UF; Thu, 06 Nov 2025 17:56:31 +0100
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
Subject: [PATCH v7 08/15] drm/amd/display: get SADB from drm_eld when parsing
 EDID caps
Date: Thu,  6 Nov 2025 13:49:11 -0300
Message-ID: <20251106165536.161662-9-mwen@igalia.com>
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
index 4333b02dc552..1a38b6505465 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -108,9 +108,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
 	const struct drm_edid *drm_edid;
 	struct drm_edid_product_id product_id;
-	int sad_count, sadb_count;
+	int sad_count;
 	int i = 0;
-	uint8_t *sadb = NULL;
 	enum dc_edid_status result = EDID_OK;
 
 
@@ -159,19 +158,11 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
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
2.51.0

