Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05408AB76CD
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482B210E71F;
	Wed, 14 May 2025 20:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EAXKaP3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A83C10E71E;
 Wed, 14 May 2025 20:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SojgDHVxZCXBZOWcm1rBx6W7Y/i9aD7qOfVbCVM+qPI=; b=EAXKaP3IkhqkwAdj3WrqiiSRdW
 EkB7mgSIxNuiC1YO9WKgWC+D9LhJvkvVePWDXgzzARpNb/ICernosEsIpv2Vh6+OW1BeLq3tnBMMZ
 3NRS9bYkiY2mMCabPzlV0lUZa4CkeuhGHL30m99v+RrCLr2dOXV6u0ePlEMnHdXKGCUS6JCVuGm8o
 GnQS4j9SkflXv272sRohjFmsXhfXZaghgovwDVU2ev+IcPCQHH5Ygg1gYsO/OS3cpN9n7TldmCj10
 wW8SOg+PgoffJZ7mCczCjQBKFExzbCNEzOdkPChTQuB81LRFkiFrNFzHyUbfYtjXQSUfcAL+ammld
 deXFORrQ==;
Received: from [189.6.16.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFIWZ-008Klg-Sr; Wed, 14 May 2025 22:22:09 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v3 05/14] drm/amd/display: get panel id with drm_edid helper
Date: Wed, 14 May 2025 17:19:12 -0300
Message-ID: <20250514202130.291324-6-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514202130.291324-1-mwen@igalia.com>
References: <20250514202130.291324-1-mwen@igalia.com>
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

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 514da4d5d300..760da13612b9 100644
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

