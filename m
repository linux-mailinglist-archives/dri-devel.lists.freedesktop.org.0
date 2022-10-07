Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B855F7824
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 14:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372F310E0B4;
	Fri,  7 Oct 2022 12:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C663410E0B4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 12:43:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4DAEA1F8A6;
 Fri,  7 Oct 2022 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665146625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTnS/AiKGYqaiXbuERuXBrlf5dCB4KmFLHbeRVtUrLA=;
 b=cCMrontMBTpRMuxl9IRvQEioznXKE1O2hhdtqmVCeuLgYCNExBhXZ3Q/HQKwtWy7GT3XVE
 X7N7Bpof43R3T2FBCDxOiVRft5/r0dvueWWjh8arAz9kt71ApzBhUIcPQoHuUquhWYIBfY
 wTMMgSLmmWNAkGeO4/2yvHCMEzgIzjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665146625;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTnS/AiKGYqaiXbuERuXBrlf5dCB4KmFLHbeRVtUrLA=;
 b=iYwOP5afPJToSocBfzJ5ThI92by7cucm5gFY/UGq26O42nQfj6uc/ACvNTIGTCPUrTlRoX
 5ycr89CMmEn1QMDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED4A213A9A;
 Fri,  7 Oct 2022 12:43:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MIP1OAAfQGPdZAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Oct 2022 12:43:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, daniel@ffwll.ch, airlied@gmail.com,
 ville.syrjala@linux.intel.com, daniel@fooishbar.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v5 2/2] drm/atomic-helper: Replace
 drm_atomic_helper_check_crtc_state()
Date: Fri,  7 Oct 2022 14:43:38 +0200
Message-Id: <20221007124338.24152-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124338.24152-1-tzimmermann@suse.de>
References: <20221007124338.24152-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the atomic helper function drm_atomic_helper_check_crtc_state()
to drm_atomic_helper_check_crtc_primary_plane() and only check for an
attached primary plane. Adapt callers.

Instead of having one big function to check for various CRTC state
conditions, we rather want smaller functions that drivers can pick
individually.

v5:
	* rebase on top of udl changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c          |  8 ++--
 drivers/gpu/drm/drm_atomic_helper.c     | 52 +++++++++----------------
 drivers/gpu/drm/drm_simple_kms_helper.c |  6 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c  |  8 ++--
 drivers/gpu/drm/solomon/ssd130x.c       |  6 ++-
 drivers/gpu/drm/tiny/simpledrm.c        |  6 ++-
 drivers/gpu/drm/udl/udl_modeset.c       |  5 ++-
 include/drm/drm_atomic_helper.h         |  3 +-
 8 files changed, 46 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 8ff998da71ef..d5ee3ad538a8 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1161,13 +1161,13 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	bool succ;
 	int ret;
 
-	ret = drm_atomic_helper_check_crtc_state(crtc_state, false);
-	if (ret)
-		return ret;
-
 	if (!crtc_state->enable)
 		goto out;
 
+	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+	if (ret)
+		return ret;
+
 	ast_state = to_ast_crtc_state(crtc_state);
 
 	format = ast_state->format;
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 02b4a7dc92f5..1a586b3c454b 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -924,51 +924,35 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
 
 /**
- * drm_atomic_helper_check_crtc_state() - Check CRTC state for validity
+ * drm_atomic_helper_check_crtc_primary_plane() - Check CRTC state for primary plane
  * @crtc_state: CRTC state to check
- * @can_disable_primary_planes: can the CRTC be enabled without a primary plane?
  *
- * Checks that a desired CRTC update is valid. Drivers that provide
- * their own CRTC handling rather than helper-provided implementations may
- * still wish to call this function to avoid duplication of error checking
- * code.
- *
- * Note that @can_disable_primary_planes only tests if the CRTC can be
- * enabled without a primary plane. To test if a primary plane can be updated
- * without a CRTC, use drm_atomic_helper_check_plane_state() in the plane's
- * atomic check.
+ * Checks that a CRTC has at least one primary plane attached to it, which is
+ * a requirement on some hardware. Note that this only involves the CRTC side
+ * of the test. To test if the primary plane is visible or if it can be updated
+ * without the CRTC being enabled, use drm_atomic_helper_check_plane_state() in
+ * the plane's atomic check.
  *
  * RETURNS:
- * Zero if update appears valid, error code on failure
+ * 0 if a primary plane is attached to the CRTC, or an error code otherwise
  */
-int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
-				       bool can_disable_primary_planes)
+int drm_atomic_helper_check_crtc_primary_plane(struct drm_crtc_state *crtc_state)
 {
-	struct drm_device *dev = crtc_state->crtc->dev;
-
-	if (!crtc_state->enable)
-		return 0;
+	struct drm_crtc *crtc = crtc_state->crtc;
+	struct drm_device *dev = crtc->dev;
+	struct drm_plane *plane;
 
 	/* needs at least one primary plane to be enabled */
-	if (!can_disable_primary_planes) {
-		bool has_primary_plane = false;
-		struct drm_plane *plane;
-
-		drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
-			if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
-				has_primary_plane = true;
-				break;
-			}
-		}
-		if (!has_primary_plane) {
-			drm_dbg_kms(dev, "Cannot enable CRTC without a primary plane.\n");
-			return -EINVAL;
-		}
+	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
+		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+			return 0;
 	}
 
-	return 0;
+	drm_dbg_atomic(dev, "[CRTC:%d:%s] primary plane missing\n", crtc->base.id, crtc->name);
+
+	return -EINVAL;
 }
-EXPORT_SYMBOL(drm_atomic_helper_check_crtc_state);
+EXPORT_SYMBOL(drm_atomic_helper_check_crtc_primary_plane);
 
 /**
  * drm_atomic_helper_check_planes - validate state object for planes changes
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index e9f782119d3d..31233c6ae3c4 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -102,10 +102,14 @@ static int drm_simple_kms_crtc_check(struct drm_crtc *crtc,
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	int ret;
 
-	ret = drm_atomic_helper_check_crtc_state(crtc_state, false);
+	if (!crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
 	if (ret)
 		return ret;
 
+out:
 	return drm_atomic_add_affected_planes(state, crtc);
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index bbab2549243a..5f7eb642f0c6 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -579,13 +579,13 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
 	struct drm_property_blob *new_gamma_lut = new_crtc_state->gamma_lut;
 	int ret;
 
-	ret = drm_atomic_helper_check_crtc_state(new_crtc_state, false);
-	if (ret)
-		return ret;
-
 	if (!new_crtc_state->enable)
 		return 0;
 
+	ret = drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
+	if (ret)
+		return ret;
+
 	if (new_crtc_state->mode_changed) {
 		if (funcs->pixpllc_atomic_check) {
 			ret = funcs->pixpllc_atomic_check(crtc, new_state);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index bc41a5ae810a..473db3dc0d55 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -648,10 +648,14 @@ static int ssd130x_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
 	int ret;
 
-	ret = drm_atomic_helper_check_crtc_state(new_crtc_state, false);
+	if (!new_crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
 	if (ret)
 		return ret;
 
+out:
 	return drm_atomic_add_affected_planes(new_state, crtc);
 }
 
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 18489779fb8a..ecd49a8f3334 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -551,10 +551,14 @@ static int simpledrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
 	int ret;
 
-	ret = drm_atomic_helper_check_crtc_state(new_crtc_state, false);
+	if (!new_crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
 	if (ret)
 		return ret;
 
+out:
 	return drm_atomic_add_affected_planes(new_state, crtc);
 }
 
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 3a25f3fc2b22..4b79d44752c9 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -315,7 +315,10 @@ static int udl_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic
 {
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	return drm_atomic_helper_check_crtc_state(new_crtc_state, false);
+	if (!new_crtc_state->enable)
+		return 0;
+
+	return drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
 }
 
 static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 06d8902a8097..33f982cd1a27 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -58,10 +58,9 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					int max_scale,
 					bool can_position,
 					bool can_update_disabled);
-int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
-				       bool can_disable_primary_plane);
 int drm_atomic_helper_check_planes(struct drm_device *dev,
 			       struct drm_atomic_state *state);
+int drm_atomic_helper_check_crtc_primary_plane(struct drm_crtc_state *crtc_state);
 int drm_atomic_helper_check(struct drm_device *dev,
 			    struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *state);
-- 
2.37.3

