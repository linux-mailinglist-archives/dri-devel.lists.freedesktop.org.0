Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1EC955C31
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 12:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF50610E065;
	Sun, 18 Aug 2024 10:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="fUOT8yLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2690510E021;
 Sun, 18 Aug 2024 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723977821;
 bh=+g9tdiVlfWP8HZuj22GaUD3ReR3pbnKtUcNnPSBesLo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fUOT8yLpqufsCiExNm+0QfGrpjBvp/z18Qcg68bBU6sto3RGWBXeQueKap3ZOykey
 d9sD4Wwic0Bp8qD8WZl/koQ6gu+L07fmTQZEQTy3mgi9/S+ttiCUzhsDLDQGPjBT2L
 UHL2hOps5p06Sq3QSk/H3jofx6Xj2kRu7NCEpYEM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Aug 2024 12:43:30 +0200
Subject: [PATCH 06/12] drm/amd/display: Constify 'struct edid' in parsing
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240818-amdgpu-drm_edid-v1-6-aea66c1f7cf4@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723977820; l=2869;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=+g9tdiVlfWP8HZuj22GaUD3ReR3pbnKtUcNnPSBesLo=;
 b=WVMzyhAnRYEnW/0NlScNahsAycBKkMDyvQ/ts3npHme/RJLOKcvCJ8Q1ee7DYBhK193QHS/e4
 q6iULo4Aa8VDu4BHdeRoDip5Z7pdE3NNk/LiUs+Rd67YA9dDi4aosCU
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

The parsing functions do not modify their edid argument.
Mark the const to reflect this to the caller.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++-------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7d999e352df3..4e7f40481379 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -11834,7 +11834,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
 }
 
 static void parse_edid_displayid_vrr(struct drm_connector *connector,
-		struct edid *edid)
+		const struct edid *edid)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -11877,7 +11877,7 @@ static void parse_edid_displayid_vrr(struct drm_connector *connector,
 }
 
 static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-			  struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -11912,7 +11912,7 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 }
 
 static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-		struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+		const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -11954,12 +11954,12 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
  * FreeSync parameters.
  */
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
-				    struct edid *edid)
+				    const struct edid *edid)
 {
 	int i = 0;
-	struct detailed_timing *timing;
-	struct detailed_non_pixel *data;
-	struct detailed_data_monitor_range *range;
+	const struct detailed_timing *timing;
+	const struct detailed_non_pixel *data;
+	const struct detailed_data_monitor_range *range;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 2d7755e2b6c3..27c0017707dd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -951,7 +951,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
 				    struct drm_connector *connector);
 
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
-					struct edid *edid);
+					const struct edid *edid);
 
 void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 

-- 
2.46.0

