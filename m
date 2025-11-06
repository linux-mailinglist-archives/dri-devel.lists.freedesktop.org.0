Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7229DC3C9D3
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DC110E96D;
	Thu,  6 Nov 2025 16:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lippEl+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96110E966;
 Thu,  6 Nov 2025 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2jNuZTLanyHSP+Fe+zXFDzCCBpwBxxYhNz2N/+igcUM=; b=lippEl+gkxLDSNDs6GnuSOq5KF
 eOHjrRw6N48y7Zg4o1Bvz49lLWE5HQ8i0fRjU/7k+PCclljylVMVWu3sNFCpiQKepPfllIkCOuu8M
 37igVi9PT4MIS4eDNV/YR4bfYl8w1KMxTqDkVWIZXpJIV0it2Wl9sy07flbNuFGvmD0LnqTz4hKcx
 0vhGWUwwY1jfUl95xhTQ0EAd8Rb/mL1Jzh/RhsXZMvs/50JTgRrc2zVcBQxQ2ZAp/qJSwxjSiEbmf
 Gh+QQCv4UN6R596ptpyzbJu/f7DG6kMlMGzELQc5Xnl3gI0lDYsJRRlMAVUW6Y0fS3DOPoDG1orHO
 9Ikt+k6w==;
Received: from [186.208.74.26] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH3HG-0035jh-3D; Thu, 06 Nov 2025 17:56:02 +0100
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
Subject: [PATCH v7 03/15] drm/amd/display: use drm_edid_product_id for parsing
 EDID product info
Date: Thu,  6 Nov 2025 13:49:06 -0300
Message-ID: <20251106165536.161662-4-mwen@igalia.com>
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

Use drm_edid_product_id [1] to get debug info from drm_edid instead of
directly parsing raw EDID.

[1] 3ddbd345539e ("drm/edid: add drm_edid_get_product_id()").

Signed-off-by: Melissa Wen <mwen@igalia.com>
--

v5:
- replace series url to commit hash (Mario)
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 70014bec7099..7d05cff08233 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -111,6 +111,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct drm_device *dev = connector->dev;
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
 	const struct drm_edid *drm_edid;
+	struct drm_edid_product_id product_id;
 	struct cea_sad *sads;
 	int sad_count = -1;
 	int sadb_count = -1;
@@ -127,13 +128,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	if (!drm_edid_valid(drm_edid))
 		result = EDID_BAD_CHECKSUM;
 
-	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
-					((uint16_t) edid_buf->mfg_id[1])<<8;
-	edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
-					((uint16_t) edid_buf->prod_code[1])<<8;
-	edid_caps->serial_number = edid_buf->serial;
-	edid_caps->manufacture_week = edid_buf->mfg_week;
-	edid_caps->manufacture_year = edid_buf->mfg_year;
+	drm_edid_get_product_id(drm_edid, &product_id);
+
+	edid_caps->manufacturer_id = product_id.manufacturer_name;
+	edid_caps->product_id = le16_to_cpu(product_id.product_code);
+	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
+	edid_caps->manufacture_week = product_id.week_of_manufacture;
+	edid_caps->manufacture_year = product_id.year_of_manufacture;
 	edid_caps->analog = !(edid_buf->input & DRM_EDID_INPUT_DIGITAL);
 
 	drm_edid_get_monitor_name(edid_buf,
-- 
2.51.0

