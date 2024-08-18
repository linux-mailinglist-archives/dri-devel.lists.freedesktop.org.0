Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C12955C2E
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 12:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1A010E039;
	Sun, 18 Aug 2024 10:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="szTFfoMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316CC10E047;
 Sun, 18 Aug 2024 10:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723977822;
 bh=o8j1TRsZVRx80CEDrMrwODXpPj/rWeZUErsBRynhHbQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=szTFfoMoSlvBOcNGYuNyHycYfG+w8V/PfS5+qtObTmgM1rOshjoHco4h3vJ31T44z
 9Z/4PFNOFQTdb2UzjfDdO0glzWtIFgBcLI4ITY3yyOAZdo3oTVYgqfoGtmQw7zvSRV
 5FfulRPWWRDO1xEPuXUJO4t3PAflALIeiUbzknDc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Aug 2024 12:43:36 +0200
Subject: [PATCH 12/12] drm/amd/display: Switch dc_link_add_remote_sink() to
 struct drm_edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240818-amdgpu-drm_edid-v1-12-aea66c1f7cf4@weissschuh.net>
References: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
In-Reply-To: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, jinzh <jinzh@github.amd.com>, 
 Aric Cyr <Aric.Cyr@amd.com>, Alan Liu <HaoPing.Liu@amd.com>, 
 Tony Cheng <Tony.Cheng@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723977820; l=5589;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=o8j1TRsZVRx80CEDrMrwODXpPj/rWeZUErsBRynhHbQ=;
 b=CJWBu27eXE/DLU6HnLXv3rTp0kb97BiJxvrnvwqoetXMNcfZy7rwsiBDodLngC5UeYDbkL4lh
 z95tHQIpD4TBPieVXG2/hHKiiN9f2JZRDfZ9FEBSNk/DoW9QfNhv/3b
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

"struct drm_edid" is the safe and recommended alternative to "struct edid".
Now that all callers of dc_link_add_remote_sink() have access to a
validate struct drm_edid, pass it around directly.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c       | 4 ++--
 drivers/gpu/drm/amd/display/dc/dc.h                         | 2 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h                   | 2 +-
 drivers/gpu/drm/amd/display/dc/link/link_detection.c        | 5 ++---
 drivers/gpu/drm/amd/display/dc/link/link_detection.h        | 2 +-
 7 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e5ac1e6eca80..23582fa4fd2b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7102,7 +7102,7 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 
 	aconnector->dc_em_sink = dc_link_add_remote_sink(
 		aconnector->dc_link,
-		drm_edid_raw(drm_edid),
+		drm_edid,
 		&init_params);
 
 	if (aconnector->base.force == DRM_FORCE_ON) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index cd03108db28b..f49af060c0e7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -362,7 +362,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
 		dc_sink = dc_link_add_remote_sink(
 			aconnector->dc_link,
-			drm_edid_raw(aconnector->drm_edid),
+			aconnector->drm_edid,
 			&init_params);
 
 		if (!dc_sink) {
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
index 5fb7bf1d9034..e35e6763dcbb 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
@@ -266,10 +266,10 @@ unsigned int dc_dp_trace_get_link_loss_count(struct dc_link *link)
 
 struct dc_sink *dc_link_add_remote_sink(
 		struct dc_link *link,
-		const struct edid *edid,
+		const struct drm_edid *drm_edid,
 		struct dc_sink_init_data *init_data)
 {
-	return link->dc->link_srv->add_remote_sink(link, edid, init_data);
+	return link->dc->link_srv->add_remote_sink(link, drm_edid, init_data);
 }
 
 void dc_link_remove_remote_sink(struct dc_link *link, struct dc_sink *sink)
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index eb151a637f1a..ce1cde89c621 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1832,7 +1832,7 @@ struct dc_sink_init_data;
  */
 struct dc_sink *dc_link_add_remote_sink(
 		struct dc_link *dc_link,
-		const struct edid *edid,
+		const struct drm_edid *drm_edid,
 		struct dc_sink_init_data *init_data);
 
 /* Remove remote sink from a link with dc_connection_mst_branch connection type.
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index 828b0bd71261..062109823f32 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -109,7 +109,7 @@ struct link_service {
 			enum dc_connection_type *type);
 	struct dc_sink *(*add_remote_sink)(
 			struct dc_link *link,
-			const struct edid *edid,
+			const struct drm_edid *drm_edid,
 			struct dc_sink_init_data *init_data);
 	void (*remove_remote_sink)(struct dc_link *link, struct dc_sink *sink);
 	bool (*get_hpd_state)(struct dc_link *link);
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index cdbf6bcc8f68..64d30ba476dd 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1371,10 +1371,9 @@ static bool link_add_remote_sink_helper(struct dc_link *dc_link, struct dc_sink
 
 struct dc_sink *link_add_remote_sink(
 		struct dc_link *link,
-		const struct edid *edid,
+		const struct drm_edid *drm_edid,
 		struct dc_sink_init_data *init_data)
 {
-	int len = edid ? (edid->extensions + 1) * EDID_LENGTH : 0;
 	struct dc_sink *dc_sink;
 	enum dc_edid_status edid_status;
 
@@ -1393,7 +1392,7 @@ struct dc_sink *link_add_remote_sink(
 	if (!dc_sink)
 		return NULL;
 
-	dc_sink->drm_edid = drm_edid_alloc(edid, len);
+	dc_sink->drm_edid = drm_edid_dup(drm_edid);
 
 	if (!link_add_remote_sink_helper(
 			link,
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.h b/drivers/gpu/drm/amd/display/dc/link/link_detection.h
index dec5001411be..c35b4f5304c6 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.h
@@ -31,7 +31,7 @@ bool link_detect_connection_type(struct dc_link *link,
 		enum dc_connection_type *type);
 struct dc_sink *link_add_remote_sink(
 		struct dc_link *link,
-		const struct edid *edid,
+		const struct drm_edid *drm_edid,
 		struct dc_sink_init_data *init_data);
 void link_remove_remote_sink(struct dc_link *link, struct dc_sink *sink);
 bool link_reset_cur_dp_mst_topology(struct dc_link *link);

-- 
2.46.0

