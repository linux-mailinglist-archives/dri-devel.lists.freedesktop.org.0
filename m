Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49C26EBFF6
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AF710E3D1;
	Sun, 23 Apr 2023 14:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA6F10E34A;
 Sun, 23 Apr 2023 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bS6ARIRzUtaQuNYcssnwhazUAE6VKWzVlbrPhB85lac=; b=LvGgwT2aOKaiVCropiT6vlCv5G
 t6mr873f067uJixAtakqOAr0rinkoh4+slU7QUIS4RwxRmgC5QgXf5xUOPza0V78koaCEyGleHuH1
 j8D6vxWXxhZhAVCiMX51iACPk6n2eTWw6ANiZvbi1DDueil+9x/z/Goh7xnEwcRI7KtyyU5JAl3I1
 5gz6BGH8GY/9Ug2PK0EVINTW2oB6emz+Nm5M4Mkw2RGwja6gG6BYryutmeZ3UdVCLLznAYxclZ1Ql
 CzY26Gi6ulrom1gDv1BwTeBWhRjqNZkTCd7hkRrFlPmey/Fkf/7p52nRfMNSFSvqA9NQEi8lX8m9W
 +5OwixHA==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaS0-00ANVs-Mu; Sun, 23 Apr 2023 16:12:24 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 09/40] drm/amd/display: move replace blob func to dm plane
Date: Sun, 23 Apr 2023 13:10:21 -0100
Message-Id: <20230423141051.702990-10-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From amdgpu_dm_plane we can get it for both CRTC and plane color
properties. We are adding new plane properties for AMD driver-private
color mgmt.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 37 +------------------
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 35 ++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |  7 ++++
 3 files changed, 44 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 79324fbab1f1..27d7a8b18013 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -344,39 +344,6 @@ dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
 					   DRM_TRANSFER_FUNCTION_DEFAULT);
 }
 
-static int
-atomic_replace_property_blob_from_id(struct drm_device *dev,
-					 struct drm_property_blob **blob,
-					 uint64_t blob_id,
-					 ssize_t expected_size,
-					 ssize_t expected_elem_size,
-					 bool *replaced)
-{
-	struct drm_property_blob *new_blob = NULL;
-
-	if (blob_id != 0) {
-		new_blob = drm_property_lookup_blob(dev, blob_id);
-		if (new_blob == NULL)
-			return -EINVAL;
-
-		if (expected_size > 0 &&
-		    new_blob->length != expected_size) {
-			drm_property_blob_put(new_blob);
-			return -EINVAL;
-		}
-		if (expected_elem_size > 0 &&
-		    new_blob->length % expected_elem_size != 0) {
-			drm_property_blob_put(new_blob);
-			return -EINVAL;
-		}
-	}
-
-	*replaced |= drm_property_replace_blob(blob, new_blob);
-	drm_property_blob_put(new_blob);
-
-	return 0;
-}
-
 static int
 amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
 				   struct drm_crtc_state *state,
@@ -389,7 +356,7 @@ amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	int ret;
 
 	if (property == adev->mode_info.shaper_lut_property) {
-		ret = atomic_replace_property_blob_from_id(crtc->dev,
+		ret = amdgpu_dm_replace_property_blob_from_id(crtc->dev,
 					&acrtc_state->shaper_lut,
 					val,
 					-1, sizeof(struct drm_color_lut),
@@ -397,7 +364,7 @@ amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		acrtc_state->base.color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == adev->mode_info.lut3d_property) {
-		ret = atomic_replace_property_blob_from_id(crtc->dev,
+		ret = amdgpu_dm_replace_property_blob_from_id(crtc->dev,
 					&acrtc_state->lut3d,
 					val,
 					-1, sizeof(struct drm_color_lut),
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 322668973747..4e5498153be2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1411,6 +1411,41 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 	drm_atomic_helper_plane_destroy_state(plane, state);
 }
 
+#ifdef CONFIG_STEAM_DECK
+int
+amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
+					       struct drm_property_blob **blob,
+					       uint64_t blob_id,
+					       ssize_t expected_size,
+					       ssize_t expected_elem_size,
+					       bool *replaced)
+{
+	struct drm_property_blob *new_blob = NULL;
+
+	if (blob_id != 0) {
+		new_blob = drm_property_lookup_blob(dev, blob_id);
+		if (new_blob == NULL)
+			return -EINVAL;
+
+		if (expected_size > 0 &&
+		    new_blob->length != expected_size) {
+			drm_property_blob_put(new_blob);
+			return -EINVAL;
+		}
+		if (expected_elem_size > 0 &&
+		    new_blob->length % expected_elem_size != 0) {
+			drm_property_blob_put(new_blob);
+			return -EINVAL;
+		}
+	}
+
+	*replaced |= drm_property_replace_blob(blob, new_blob);
+	drm_property_blob_put(new_blob);
+
+	return 0;
+}
+#endif
+
 static const struct drm_plane_funcs dm_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
index 930f1572f898..1b05ac4c15f6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
@@ -51,6 +51,13 @@ int amdgpu_dm_plane_fill_plane_buffer_attributes(struct amdgpu_device *adev,
 				 bool tmz_surface,
 				 bool force_disable_dcc);
 
+int amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
+					    struct drm_property_blob **blob,
+					    uint64_t blob_id,
+					    ssize_t expected_size,
+					    ssize_t expected_elem_size,
+					    bool *replaced);
+
 int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 			 struct drm_plane *plane,
 			 unsigned long possible_crtcs,
-- 
2.39.2

