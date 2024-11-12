Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274FC9C607B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 19:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDD810E61D;
	Tue, 12 Nov 2024 18:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="UxhbOJvi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864E110E626;
 Tue, 12 Nov 2024 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1731436454;
 bh=D8AJIQ5upY8eIDK7kgKoJ9mXt4n5iLxc9GyefKFO1as=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UxhbOJvinHsBreT0MEYShJ55mYn+jd99g2DRDSjfb6fxmT8DfkrFhLpH73JdvrCMA
 AbaoNK9KVj499S4vpkSsqXYqTVlRnK+mFsbTRqHSULd/lvD7sKYI5d6yGciPAzybB/
 pKvTf7X3/5i666nKw8/lT/KDdpLT6N3Xcu7Gypmo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 12 Nov 2024 19:34:12 +0100
Subject: [PATCH v2 3/7] drm/amd/display: Use struct edid in
 dc_link_add_remote_sink()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241112-amdgpu-drm_edid-v2-3-1399dc0f0469@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731436454; l=6543;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=D8AJIQ5upY8eIDK7kgKoJ9mXt4n5iLxc9GyefKFO1as=;
 b=p/EST7Fq9ZNgbLgF5pH1TNbVBowHlwlxeYHEDfTxcPgmBxwqUgl0Na1cQWg9vWVvm48ykZBgN
 /OKKLuJm1IDC4osAHQs6VcDWZZsn0sV+nsMS2COUquCMA+8BURaUx6U
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

The callers of dc_link_add_remote_sink() are using 'struct edid' which
they all need to cast to uint8_t *.
Allow the direct passing of 'struct edid' to avoid these cast and also
move the length calculation so it does not need to be duplicated
everywhere.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 3 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 +---
 drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c       | 5 ++---
 drivers/gpu/drm/amd/display/dc/dc.h                         | 6 ++----
 drivers/gpu/drm/amd/display/dc/inc/link.h                   | 3 +--
 drivers/gpu/drm/amd/display/dc/link/link_detection.c        | 6 ++++--
 drivers/gpu/drm/amd/display/dc/link/link_detection.h        | 3 +--
 7 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f0a6816709ca7dad6415d16f9806f18065026cf7..4a093aff4499add545f7beb654ace477036b46fb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7242,8 +7242,7 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	aconnector->dc_em_sink = dc_link_add_remote_sink(
 		aconnector->dc_link,
-		(uint8_t *)edid,
-		(edid->extensions + 1) * EDID_LENGTH,
+		edid,
 		&init_params);
 
 	if (aconnector->base.force == DRM_FORCE_ON) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 6e43594906130c1cbea3e510e87d2013903b1bb5..554cc7a7216858ff10e138bf71ab826aa635afe8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -327,7 +327,6 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 				dc_sink = dc_link_add_remote_sink(
 					aconnector->dc_link,
 					NULL,
-					0,
 					&init_params);
 
 				if (!dc_sink) {
@@ -367,8 +366,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		edid = drm_edid_raw(aconnector->drm_edid); // FIXME: Get rid of drm_edid_raw()
 		dc_sink = dc_link_add_remote_sink(
 			aconnector->dc_link,
-			(uint8_t *)edid,
-			(edid->extensions + 1) * EDID_LENGTH,
+			edid,
 			&init_params);
 
 		if (!dc_sink) {
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
index 457d60eeb486c228fde050b206fbe1c9043cdd33..be55165a16df65c623092906582ba7e81a141464 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
@@ -266,11 +266,10 @@ unsigned int dc_dp_trace_get_link_loss_count(struct dc_link *link)
 
 struct dc_sink *dc_link_add_remote_sink(
 		struct dc_link *link,
-		const uint8_t *edid,
-		int len,
+		const struct edid *edid,
 		struct dc_sink_init_data *init_data)
 {
-	return link->dc->link_srv->add_remote_sink(link, edid, len, init_data);
+	return link->dc->link_srv->add_remote_sink(link, edid, init_data);
 }
 
 void dc_link_remove_remote_sink(struct dc_link *link, struct dc_sink *sink)
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index e143fab00a861c4f578167702c648d2b4b043945..7d5c790cab50987f361e1b4228562483a0f908f9 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1846,14 +1846,12 @@ struct dc_sink_init_data;
  * called.
  *
  * @dc_link - link the remote sink will be added to.
- * @edid - byte array of EDID raw data.
- * @len - size of the edid in byte
+ * @edid - EDID data.
  * @init_data -
  */
 struct dc_sink *dc_link_add_remote_sink(
 		struct dc_link *dc_link,
-		const uint8_t *edid,
-		int len,
+		const struct edid *edid,
 		struct dc_sink_init_data *init_data);
 
 /* Remove remote sink from a link with dc_connection_mst_branch connection type.
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index f04292086c08a081fce8e780c584a0ce66668f12..76bac2e773b0f5036b82942ed90b9c43c6558d4c 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -109,8 +109,7 @@ struct link_service {
 			enum dc_connection_type *type);
 	struct dc_sink *(*add_remote_sink)(
 			struct dc_link *link,
-			const uint8_t *edid,
-			int len,
+			const struct edid *edid,
 			struct dc_sink_init_data *init_data);
 	void (*remove_remote_sink)(struct dc_link *link, struct dc_sink *sink);
 	bool (*get_hpd_state)(struct dc_link *link);
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index e026c728042a5f47decbc3e7c80583c0d31fa700..05adaf8248b1b11675aa9e86a24fa24a2a811e01 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -48,6 +48,8 @@
 #include "dm_helpers.h"
 #include "clk_mgr.h"
 
+#include <drm/drm_edid.h>
+
  // Offset DPCD 050Eh == 0x5A
 #define MST_HUB_ID_0x5A  0x5A
 
@@ -1390,10 +1392,10 @@ static bool link_add_remote_sink_helper(struct dc_link *dc_link, struct dc_sink
 
 struct dc_sink *link_add_remote_sink(
 		struct dc_link *link,
-		const uint8_t *edid,
-		int len,
+		const struct edid *edid,
 		struct dc_sink_init_data *init_data)
 {
+	int len = edid ? (edid->extensions + 1) * EDID_LENGTH : 0;
 	struct dc_sink *dc_sink;
 	enum dc_edid_status edid_status;
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.h b/drivers/gpu/drm/amd/display/dc/link/link_detection.h
index 7da05078721ef4d9a2e10c52da4eb30510d9c160..dec5001411be2c008c8684f474b020bf78278442 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.h
@@ -31,8 +31,7 @@ bool link_detect_connection_type(struct dc_link *link,
 		enum dc_connection_type *type);
 struct dc_sink *link_add_remote_sink(
 		struct dc_link *link,
-		const uint8_t *edid,
-		int len,
+		const struct edid *edid,
 		struct dc_sink_init_data *init_data);
 void link_remove_remote_sink(struct dc_link *link, struct dc_sink *sink);
 bool link_reset_cur_dp_mst_topology(struct dc_link *link);

-- 
2.47.0

