Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99378975C88
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 23:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52A510EAB8;
	Wed, 11 Sep 2024 21:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KrWUuA1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A95010EAB4;
 Wed, 11 Sep 2024 21:36:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4AFE85C076F;
 Wed, 11 Sep 2024 21:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C53C4CEC6;
 Wed, 11 Sep 2024 21:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726090559;
 bh=FjRNeQDZZiwkhk2/jrLegD2MpmolnCu9JNkjbMBh35c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KrWUuA1ABMoYx+dvhjtBdqeipJveYRDLsgGwgneTJffMtypRcaoc1cfPISYTHkgTw
 O5JF87rQJfRHb97uvk9IFmQNkrARWl1h/eow3NDwmFG3jf2asmF2hPsE4zpsYtADOK
 Lnb44G4oiuwOFo9GylvJ/hFEqxbHAy3XNRE/Z6A8qR2MhzqZUHvdBqA4Yy7SZEgBIq
 dNKr9qy8wQlVozvKsf0+2fVY3Aq02Mt4kNvu2QZj8es5YpISQt9OV+HvlmrbxxvJGT
 UEhIaj8kodxARmRckTdNIGY+zLyFafJ4Ffm8EBCbeSJCpdS02ScmHCR4kbk1tr85Z6
 Myn2yrymJ0S1A==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v6 06/10] drm/amd/display: parse display name from drm_eld
Date: Wed, 11 Sep 2024 16:35:32 -0500
Message-ID: <20240911213537.2338164-7-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240911213537.2338164-1-superm1@kernel.org>
References: <20240911213537.2338164-1-superm1@kernel.org>
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

From: Melissa Wen <mwen@igalia.com>

We don't need to parse dc_edid to get the display name since it's
already set in drm_eld which in turn had it values updated when updating
connector with the opaque drm_edid.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 3f280bc36e87..b42821a02c9a 100644
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
@@ -78,6 +78,7 @@ static void apply_edid_quirks(struct drm_edid_product_id *product_id,
 	}
 }
 
+#define AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS 13
 /**
  * dm_helpers_parse_edid_caps() - Parse edid caps
  *
@@ -119,9 +120,10 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
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

