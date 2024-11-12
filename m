Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA39C607F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 19:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9873510E61B;
	Tue, 12 Nov 2024 18:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="trWuKTH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3963310E62E;
 Tue, 12 Nov 2024 18:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1731436455;
 bh=GQbAFEDWc3+fqXey0UCnib602pu/hNtipXn2veTOQnE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=trWuKTH6f5Cm+jMlyBaJwqdnRcGUxNEXY17GJ5McYfCxpCUrl7YaM54ykLW2nIDX4
 88mFmPzX8Ggw46/R98XaMq4Y7tJrTNAgxwmfk4NL9sSszRBZith+B09bpTDJeFCWS+
 ZrLaODco5BWN790kX2SflQCvlCQ333t6+i0Ganqs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 12 Nov 2024 19:34:15 +0100
Subject: [PATCH v2 6/7] drm/amd/display: Drop opencoded edid panel id
 extraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241112-amdgpu-drm_edid-v2-6-1399dc0f0469@weissschuh.net>
References: <20241112-amdgpu-drm_edid-v2-0-1399dc0f0469@weissschuh.net>
In-Reply-To: <20241112-amdgpu-drm_edid-v2-0-1399dc0f0469@weissschuh.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 jinzh <jinzh@github.amd.com>, Aric Cyr <Aric.Cyr@amd.com>, 
 Alan Liu <HaoPing.Liu@amd.com>, Tony Cheng <Tony.Cheng@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731436454; l=1611;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=GQbAFEDWc3+fqXey0UCnib602pu/hNtipXn2veTOQnE=;
 b=BV0quP0krDQKRm6g1QR1UItqHJe3GadXKHvPM5oEacRP9OTIyVhR+ESaBNNakuCVBBg9ZIVQI
 N224eyv7XrvC5BhtHt+rG9GsUcBq1ZjK689gN/i8Sh2PjB5hxkG8+bM
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

Now that a struct drm_edid is available make use of the standard
drm_edid_get_panel_id().

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 57b4a58eb9c8bfcb7b76622cf303ba01450e30ba..6f51395bf02cd6fd647de5c1a63822853deb23c9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -48,16 +48,9 @@
 #include "ddc_service_types.h"
 #include "clk_mgr.h"
 
-static u32 edid_extract_panel_id(const struct edid *edid)
+static void apply_edid_quirks(const struct drm_edid *edid, struct dc_edid_caps *edid_caps)
 {
-	return (u32)edid->mfg_id[0] << 24   |
-	       (u32)edid->mfg_id[1] << 16   |
-	       (u32)EDID_PRODUCT_ID(edid);
-}
-
-static void apply_edid_quirks(const struct edid *edid, struct dc_edid_caps *edid_caps)
-{
-	uint32_t panel_id = edid_extract_panel_id(edid);
+	u32 panel_id = drm_edid_get_panel_id(edid);
 
 	switch (panel_id) {
 	/* Workaround for some monitors which does not work well with FAMS */
@@ -130,7 +123,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
 
-	apply_edid_quirks(edid_buf, edid_caps);
+	apply_edid_quirks(drm_edid, edid_caps);
 
 	sad_count = drm_edid_to_sad(edid_buf, &sads);
 	if (sad_count <= 0)

-- 
2.47.0

