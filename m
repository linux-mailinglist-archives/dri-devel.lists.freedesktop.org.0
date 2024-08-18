Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96340955C35
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 12:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050B810E07F;
	Sun, 18 Aug 2024 10:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="XodzYGrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B7B10E01F;
 Sun, 18 Aug 2024 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723977821;
 bh=h+vDTnH3DDu+8RyHiUdxUe+8vxjeNNH3grJdJdANAxU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XodzYGrnfJ6G4YMDxiNJR0PMbJcdkOHLTzXFveCKNE5u2mv4jU3vM75SfpoZifUs4
 stXBzKXHa4qXo6bUuyVtmskmT/E9iSIlMibSnQst0lXqwwA5MvzKcqryOUvYiLdUwW
 ud+f7szSts/WT3QJB8gzrbulWDHMqudzcjisD4i0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Aug 2024 12:43:31 +0200
Subject: [PATCH 07/12] drm/amd/display: Use struct edid in
 dc_link_add_remote_sink()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240818-amdgpu-drm_edid-v1-7-aea66c1f7cf4@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723977820; l=6099;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=h+vDTnH3DDu+8RyHiUdxUe+8vxjeNNH3grJdJdANAxU=;
 b=4Jq37a97qqa9wcs/LsX4+tTQdI1A0iqDlZHvLdTK7j13xubeoG/TOAbw592BmnuJBFKggrJO0
 j+mBRIhS9CeBHntA7UNDDpdijV0YXpqRkjkevAUjKwcdt2gnXZpKP43
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
index 4e7f40481379..bd9a1a21720e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7103,8 +7103,7 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 
 	aconnector->dc_em_sink = dc_link_add_remote_sink(
 		aconnector->dc_link,
-		(uint8_t *)edid,
-		(edid->extensions + 1) * EDID_LENGTH,
+		edid,
 		&init_params);
 
 	if (aconnector->base.force == DRM_FORCE_ON) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 2e9f6da1acdc..25e98d248c21 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -325,7 +325,6 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 				dc_sink = dc_link_add_remote_sink(
 					aconnector->dc_link,
 					NULL,
-					0,
 					&init_params);
 
 				if (!dc_sink) {
@@ -362,8 +361,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
 		dc_sink = dc_link_add_remote_sink(
 			aconnector->dc_link,
-			(uint8_t *)aconnector->edid,
-			(aconnector->edid->extensions + 1) * EDID_LENGTH,
+			aconnector->edid,
 			&init_params);
 
 		if (!dc_sink) {
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
index dfdfe22d9e85..5fb7bf1d9034 100644
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
index 6b036417a73a..4b2abb25ca3c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1827,14 +1827,12 @@ struct dc_sink_init_data;
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
index 72a8479e1f2d..828b0bd71261 100644
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
index 391dbe81534d..6a190d084a94 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -48,6 +48,8 @@
 #include "dm_helpers.h"
 #include "clk_mgr.h"
 
+#include <drm/drm_edid.h>
+
 #define DC_LOGGER \
 	link->ctx->logger
 #define DC_LOGGER_INIT(logger)
@@ -1379,10 +1381,10 @@ static bool link_add_remote_sink_helper(struct dc_link *dc_link, struct dc_sink
 
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
index 7da05078721e..dec5001411be 100644
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
2.46.0

