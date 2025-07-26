Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD3B1281C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 02:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B69410EA2F;
	Sat, 26 Jul 2025 00:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DvzRfzA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FB610EA29;
 Sat, 26 Jul 2025 00:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qwE3LcbCeiO3BhAFVlMaRMUUVK/cXgxzYYKsUZt3TsU=; b=DvzRfzA3AQh8f5SysFAhz2r6pV
 s4DWIY0QBZuqERACgkjM3mBV2XR9yKNf0eCGLFUX6K3ErUreg+Ay+Y/O1SgzhNb5JSVhjttTTLvIU
 9iV+07GOvJPPe3XQAfF80TKo9+b5iYx21h/iyecut5pnv+Ijr9onRh7Q1d+mxkPzNhMbGw0gkEMqc
 9Lpe0GEhD0ybNA/AnHJycEFu994MjrtCjWpRr5GYgy3aRNfvqJgB4ffW0NpvFE8nuTdJBxZIolUtj
 gNgEVGfXZCdFO+K5y8TNjjUGvhZlUNyPjHJX/HZgYsGr/PFJGZcmuX4ESro2zd4vUJ2jESDfJdBrP
 wuQucYyA==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufSwC-003wod-0H; Sat, 26 Jul 2025 02:38:56 +0200
From: Melissa Wen <mwen@igalia.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v6 05/14] drm/amd/display: get panel id with drm_edid helper
Date: Fri, 25 Jul 2025 21:33:06 -0300
Message-ID: <20250726003816.435227-6-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250726003816.435227-1-mwen@igalia.com>
References: <20250726003816.435227-1-mwen@igalia.com>
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

Instead of using driver-specific code, use DRM helpers.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 9a22b0a057dc..ed2ba094d3ae 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -48,16 +48,11 @@
 #include "ddc_service_types.h"
 #include "clk_mgr.h"
 
-static u32 edid_extract_panel_id(struct edid *edid)
+static void apply_edid_quirks(struct drm_device *dev,
+			      const struct drm_edid *drm_edid,
+			      struct dc_edid_caps *edid_caps)
 {
-	return (u32)edid->mfg_id[0] << 24   |
-	       (u32)edid->mfg_id[1] << 16   |
-	       (u32)EDID_PRODUCT_ID(edid);
-}
-
-static void apply_edid_quirks(struct drm_device *dev, struct edid *edid, struct dc_edid_caps *edid_caps)
-{
-	uint32_t panel_id = edid_extract_panel_id(edid);
+	uint32_t panel_id = drm_edid_get_panel_id(drm_edid);
 
 	switch (panel_id) {
 	/* Workaround for monitors that need a delay after detecting the link */
@@ -140,7 +135,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
 
-	apply_edid_quirks(dev, edid_buf, edid_caps);
+	apply_edid_quirks(dev, drm_edid, edid_caps);
 
 	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
 	if (sad_count <= 0) {
-- 
2.47.2

