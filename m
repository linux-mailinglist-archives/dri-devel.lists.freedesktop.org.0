Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C4D7EE7C3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE02110E69A;
	Thu, 16 Nov 2023 19:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574E810E697;
 Thu, 16 Nov 2023 19:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PU/RohkQdiuMXLcg1jeuCkhkWT3KWq21ziH0SYnQbs0=; b=nrFDW2Y8QQ/9zrhmo1kCsb4Xh5
 kMuxX+V07AXYab9des6XKruwGSfyY0FXpBpjWyXd+DA9vPlmXfQFhFOh0e3z5CQBbYI0yGIBbDBtk
 Wxq2+XP6iOdLaL1LqiyIwhpZvi1g4KEtB84gRZO5ILF4bFIg+Em6lS9ZAclgsogcMs1zI7XxLPc/F
 FY5as+6VozoP87jgFrpXCBc1qbY2m9N0xXNP7NkpMPXsFnVya7qD9+9hC8xuqQBl5+d7fbbrBKOaG
 sMaS4Ky1yuXvumhoovPX+KILT4khm+UV4UE8IXwb0OGk4jOaM36lDO6H6/xu4ltEPzP+n2Nla0N5n
 wzy1mTOw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iVI-0048Yy-Q6; Thu, 16 Nov 2023 20:58:20 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 liviu.dudau@arm.com, brian.starkey@arm.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH v5 02/32] drm/drm_property: make replace_property_blob_from_id
 a DRM helper
Date: Thu, 16 Nov 2023 18:57:42 -0100
Message-Id: <20231116195812.906115-3-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
References: <20231116195812.906115-1-mwen@igalia.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Place it in drm_property where drm_property_replace_blob and
drm_property_lookup_blob live. Then we can use the DRM helper for
driver-specific KMS properties too.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/arm/malidp_crtc.c |  2 +-
 drivers/gpu/drm/drm_atomic_uapi.c | 43 ++++-----------------------
 drivers/gpu/drm/drm_property.c    | 49 +++++++++++++++++++++++++++++++
 include/drm/drm_property.h        |  6 ++++
 4 files changed, 61 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index dc01c43f6193..d72c22dcf685 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -221,7 +221,7 @@ static int malidp_crtc_atomic_check_ctm(struct drm_crtc *crtc,
 
 	/*
 	 * The size of the ctm is checked in
-	 * drm_atomic_replace_property_blob_from_id.
+	 * drm_property_replace_blob_from_id.
 	 */
 	ctm = (struct drm_color_ctm *)state->ctm->data;
 	for (i = 0; i < ARRAY_SIZE(ctm->matrix); ++i) {
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d867e7f9f2cd..a6a9ee5086dd 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -362,39 +362,6 @@ static s32 __user *get_out_fence_for_connector(struct drm_atomic_state *state,
 	return fence_ptr;
 }
 
-static int
-drm_atomic_replace_property_blob_from_id(struct drm_device *dev,
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
 static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		struct drm_crtc_state *state, struct drm_property *property,
 		uint64_t val)
@@ -415,7 +382,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (property == config->prop_vrr_enabled) {
 		state->vrr_enabled = val;
 	} else if (property == config->degamma_lut_property) {
-		ret = drm_atomic_replace_property_blob_from_id(dev,
+		ret = drm_property_replace_blob_from_id(dev,
 					&state->degamma_lut,
 					val,
 					-1, sizeof(struct drm_color_lut),
@@ -423,7 +390,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		state->color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == config->ctm_property) {
-		ret = drm_atomic_replace_property_blob_from_id(dev,
+		ret = drm_property_replace_blob_from_id(dev,
 					&state->ctm,
 					val,
 					sizeof(struct drm_color_ctm), -1,
@@ -431,7 +398,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		state->color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == config->gamma_lut_property) {
-		ret = drm_atomic_replace_property_blob_from_id(dev,
+		ret = drm_property_replace_blob_from_id(dev,
 					&state->gamma_lut,
 					val,
 					-1, sizeof(struct drm_color_lut),
@@ -563,7 +530,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 	} else if (property == plane->color_range_property) {
 		state->color_range = val;
 	} else if (property == config->prop_fb_damage_clips) {
-		ret = drm_atomic_replace_property_blob_from_id(dev,
+		ret = drm_property_replace_blob_from_id(dev,
 					&state->fb_damage_clips,
 					val,
 					-1,
@@ -729,7 +696,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		if (state->link_status != DRM_LINK_STATUS_GOOD)
 			state->link_status = val;
 	} else if (property == config->hdr_output_metadata_property) {
-		ret = drm_atomic_replace_property_blob_from_id(dev,
+		ret = drm_property_replace_blob_from_id(dev,
 				&state->hdr_output_metadata,
 				val,
 				sizeof(struct hdr_output_metadata), -1,
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index dfec479830e4..f72ef6493340 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -751,6 +751,55 @@ bool drm_property_replace_blob(struct drm_property_blob **blob,
 }
 EXPORT_SYMBOL(drm_property_replace_blob);
 
+/**
+ * drm_property_replace_blob_from_id - replace a blob property taking a reference
+ * @dev: DRM device
+ * @blob: a pointer to the member blob to be replaced
+ * @blob_id: the id of the new blob to replace with
+ * @expected_size: expected size of the blob property
+ * @expected_elem_size: expected size of an element in the blob property
+ * @replaced: if the blob was in fact replaced
+ *
+ * Look up the new blob from id, take its reference, check expected sizes of
+ * the blob and its element and replace the old blob by the new one. Advertise
+ * if the replacement operation was successful.
+ *
+ * Return: true if the blob was in fact replaced. -EINVAL if the new blob was
+ * not found or sizes don't match.
+ */
+int drm_property_replace_blob_from_id(struct drm_device *dev,
+					 struct drm_property_blob **blob,
+					 uint64_t blob_id,
+					 ssize_t expected_size,
+					 ssize_t expected_elem_size,
+					 bool *replaced)
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
+EXPORT_SYMBOL(drm_property_replace_blob_from_id);
+
 int drm_mode_getblob_ioctl(struct drm_device *dev,
 			   void *data, struct drm_file *file_priv)
 {
diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 65bc9710a470..082f29156b3e 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -279,6 +279,12 @@ struct drm_property_blob *drm_property_create_blob(struct drm_device *dev,
 						   const void *data);
 struct drm_property_blob *drm_property_lookup_blob(struct drm_device *dev,
 						   uint32_t id);
+int drm_property_replace_blob_from_id(struct drm_device *dev,
+				      struct drm_property_blob **blob,
+				      uint64_t blob_id,
+				      ssize_t expected_size,
+				      ssize_t expected_elem_size,
+				      bool *replaced);
 int drm_property_replace_global_blob(struct drm_device *dev,
 				     struct drm_property_blob **replace,
 				     size_t length,
-- 
2.40.1

