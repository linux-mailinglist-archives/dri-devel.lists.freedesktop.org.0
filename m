Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0018294B168
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A57B10E5DB;
	Wed,  7 Aug 2024 20:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WhBGuXFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AE610E5DB;
 Wed,  7 Aug 2024 20:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2oznv3Ez+S8FpnVYWMc/B3ah3gE7uNGOgSh2JyBPm+c=; b=WhBGuXFw4wxrZyX8La+Rf13il3
 nx7ttM8ZMmewLEzHCrZny9DTa5PmhCIRzBO/o1M3p/8FF2IidqDqyjxuAN25dk3om+WVccYdfgNof
 RRcVTybhUveRvXKKOu6V4/lIRCTA1+oxcnVN2SStc8zAGaG33B5Q+LkDCi21KYT1IZZNP+BhOxAqS
 SmlHOVtx4WdsSb/tCf4wxOlNr3iSD78pnoB/FDFTNy8VYRKanvMbP/WLfx4W+NYyus94IEXcvwqOW
 VsnoSPU3i/cgB0Ve+iAXVlQVrm17cIz94vfWp3cnAZtWrCnb/qO+8rbZKSkfcjTWpdussbOU81Zq0
 tHapD/5Q==;
Received: from [189.6.17.125] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sbnM3-0098Re-R8; Wed, 07 Aug 2024 22:33:56 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, kernel-dev@igalia.com,
 Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 6/9] drm/amd/display: parse display name from drm_eld
Date: Wed,  7 Aug 2024 19:25:08 -0100
Message-ID: <20240807203207.2830-7-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807203207.2830-1-mwen@igalia.com>
References: <20240807203207.2830-1-mwen@igalia.com>
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

We don't need to parse dc_edid to get the display name since it's
already set in drm_eld which in turn had it values updated when updating
connector with the opaque drm_edid.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 1e454cfcaef2..89ffd36dafd3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -32,7 +32,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fixed.h>
-
+#include <drm/drm_eld.h>
 #include "dm_services.h"
 #include "amdgpu.h"
 #include "dc.h"
@@ -77,6 +77,7 @@ static void apply_edid_quirks(struct drm_edid_product_id *product_id, struct dc_
 	}
 }
 
+#define AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS 13
 /**
  * dm_helpers_parse_edid_caps() - Parse edid caps
  *
@@ -118,9 +119,10 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	edid_caps->manufacture_week = product_id.week_of_manufacture;
 	edid_caps->manufacture_year = product_id.year_of_manufacture;
 
-	drm_edid_get_monitor_name(edid_buf,
-				  edid_caps->display_name,
-				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
+	memset(edid_caps->display_name, 0, AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
+	memcpy(edid_caps->display_name,
+	       &connector->eld[DRM_ELD_MONITOR_NAME_STRING],
+	       AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS);
 
 	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
 
-- 
2.43.0

