Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070ABADF126
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE74510E893;
	Wed, 18 Jun 2025 15:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="p0VQI7Tb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991BB10E889;
 Wed, 18 Jun 2025 15:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IbuYjP40DzstkxlxseSqEOMX3K/zhfcmf78fcNtqo68=; b=p0VQI7TbFrN7Z6s+7wtXyLSIlj
 S+hBKXBffejITAknxQs1goFwhQZKf7zX3Jk9Noj5C7B12nAQhiaKkwGfRn+crAhRzuoje14yBKDmx
 vVavAT98tUkkypB15xCdzXCVGqTgTm+vwOcxpbI8B5pu0TqhdD+QijRBSDyFluKdPnvYcElJvM3uW
 03suV2UGoMv4iln2tnIhrnGdtr8T1rzszSzoMGhS+aneHkwOJJZ4oKgy9RB1YFlSFOS9gFm1SBzu1
 XLtdDMdXEt7JJ1ozkzeC9GuFkWDMrigCFxW5uIk3xPRAm6SOb1CHvBx0oWvZbCHTF0F3gt44sExBb
 p+JKOKPQ==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRucY-0057e5-Hp; Wed, 18 Jun 2025 17:22:39 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v5 02/14] drm/amd/display: start using drm_edid helpers to
 parse EDID caps
Date: Wed, 18 Jun 2025 12:19:41 -0300
Message-ID: <20250618152216.948406-3-mwen@igalia.com>
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

Groundwork that allocates a temporary drm_edid from raw edid to take
advantage of DRM common-code helpers instead of driver-specific code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c    | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index d4395b92fb85..5543780f1024 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -108,18 +108,21 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct drm_connector *connector = &aconnector->base;
 	struct drm_device *dev = connector->dev;
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
+	const struct drm_edid *drm_edid;
 	struct cea_sad *sads;
 	int sad_count = -1;
 	int sadb_count = -1;
 	int i = 0;
 	uint8_t *sadb = NULL;
-
 	enum dc_edid_status result = EDID_OK;
 
+
 	if (!edid_caps || !edid)
 		return EDID_BAD_INPUT;
 
-	if (!drm_edid_is_valid(edid_buf))
+	drm_edid = drm_edid_alloc(edid_buf, EDID_LENGTH * (edid_buf->extensions + 1));
+
+	if (!drm_edid_valid(drm_edid))
 		result = EDID_BAD_CHECKSUM;
 
 	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
@@ -139,8 +142,10 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	apply_edid_quirks(dev, edid_buf, edid_caps);
 
 	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
-	if (sad_count <= 0)
+	if (sad_count <= 0) {
+		drm_edid_free(drm_edid);
 		return result;
+	}
 
 	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
 	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
@@ -166,6 +171,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	kfree(sads);
 	kfree(sadb);
+	drm_edid_free(drm_edid);
 
 	return result;
 }
-- 
2.47.2

