Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C4CAB76D9
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C7110E72F;
	Wed, 14 May 2025 20:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="izr1RxDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC5310E729;
 Wed, 14 May 2025 20:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N11fi0Dqd4ujyPdpayBokALCivU6bPr2SUKcAIeLnoQ=; b=izr1RxDElq8jO+xWoE2TiAKqYj
 el2aoKJM5GOBEDCtmuFBxBRnMnP1kcWRZcX/nfCPJRFRBUJa2o37RDkyY3luSFiJbYdtUAlf/vPpJ
 rGWpxoNqDnwG2O6fxcFdze4uubzT5hZMg+5LQHfIXDv2v/IMZn7dckXRKDHCR/pHo36jnm7AmVkkP
 spWkaf/fDdjADdU9S+OUDppOLsFvzHwGJT511JnyxpYINjccxZzAvPFVQ2ArR1WphPICMVGTHVly3
 jOUIYBPP6AY9FXx3xdSGbkiKvfc+uCT3+5u7fqSd/fB/NVutYcqbs2A5twmObpsb6l3MCOQsK9rOD
 04AG0g2g==;
Received: from [189.6.16.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFIX0-008Klg-0Z; Wed, 14 May 2025 22:22:35 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v3 10/14] drm/amd/display: add a mid-layer file to handle EDID
 in DC
Date: Wed, 14 May 2025 17:19:17 -0300
Message-ID: <20250514202130.291324-11-mwen@igalia.com>
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

From: Rodrigo Siqueira <siqueira@igalia.com>

Since DC is a shared code, this commit introduces a new file to work as
a mid-layer in DC for the edid manipulation.

v3:
- rebase on top of asdn

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   | 19 +++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   | 11 +++++++++++
 .../drm/amd/display/dc/link/link_detection.c  | 17 +++--------------
 4 files changed, 34 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 7329b8cc2576..09cb94d8e0e4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -39,6 +39,7 @@ AMDGPUDM = \
 	amdgpu_dm_psr.o \
 	amdgpu_dm_replay.o \
 	amdgpu_dm_quirks.o \
+	dc_edid.o \
 	amdgpu_dm_wb.o
 
 ifdef CONFIG_DRM_AMD_DC_FP
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
new file mode 100644
index 000000000000..fab873b091f5
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: MIT
+#include "amdgpu_dm/dc_edid.h"
+#include "dc.h"
+
+bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
+			  struct dc_sink *current_sink)
+{
+	struct dc_edid *old_edid = &prev_sink->dc_edid;
+	struct dc_edid *new_edid = &current_sink->dc_edid;
+
+       if (old_edid->length != new_edid->length)
+               return false;
+
+       if (new_edid->length == 0)
+               return false;
+
+       return (memcmp(old_edid->raw_edid,
+                      new_edid->raw_edid, new_edid->length) == 0);
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
new file mode 100644
index 000000000000..7e3b1177bc8a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __DC_EDID_H__
+#define __DC_EDID_H__
+
+#include "dc.h"
+
+bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
+			  struct dc_sink *current_sink);
+
+#endif /* __DC_EDID_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 6d05ddb194c9..e748721f31e4 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -48,6 +48,8 @@
 #include "dm_helpers.h"
 #include "clk_mgr.h"
 
+#include "dc_edid.h"
+
  // Offset DPCD 050Eh == 0x5A
 #define MST_HUB_ID_0x5A  0x5A
 
@@ -616,18 +618,6 @@ static bool detect_dp(struct dc_link *link,
 	return true;
 }
 
-static bool is_same_edid(struct dc_edid *old_edid, struct dc_edid *new_edid)
-{
-	if (old_edid->length != new_edid->length)
-		return false;
-
-	if (new_edid->length == 0)
-		return false;
-
-	return (memcmp(old_edid->raw_edid,
-		       new_edid->raw_edid, new_edid->length) == 0);
-}
-
 static bool wait_for_entering_dp_alt_mode(struct dc_link *link)
 {
 
@@ -1114,8 +1104,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 		// Check if edid is the same
 		if ((prev_sink) &&
 		    (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
-			same_edid = is_same_edid(&prev_sink->dc_edid,
-						 &sink->dc_edid);
+			same_edid = dc_edid_is_same_edid(prev_sink, sink);
 
 		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
 			link->ctx->dc->debug.hdmi20_disable = true;
-- 
2.47.2

