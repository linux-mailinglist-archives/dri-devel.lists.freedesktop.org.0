Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A6C5B35E2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6106010EC84;
	Fri,  9 Sep 2022 11:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1FD10EC68;
 Fri,  9 Sep 2022 10:59:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C13851F8F2;
 Fri,  9 Sep 2022 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662721190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNeyBI8YGF0KggwLolcCdgeW5jSblOvOyZdnroiw2Ig=;
 b=rV+n1IFOWyPiebvswC9Nxg988TTp/viaUpTGCMBEvIuxHk/B6um4h0/JDJ2l8ZABN5L4Wv
 rOjLHw6bm7GMEBozJXn2/nsUUNNVmrgK+yeXMEA0885Ou2FOnjlL8gjtRaWZG81DsIUwi1
 ABgYhudEhXFbhqqUQgd9D4dbTycN7Qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662721190;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNeyBI8YGF0KggwLolcCdgeW5jSblOvOyZdnroiw2Ig=;
 b=HjA8HPttYL0wQSOjjBRmSuPpyDQhpVcUaTnSxrlU41lW52/f8NelZqmUdhRTCuO2LNUYBR
 e0JpC/VKVaB9+rBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BE7E139D5;
 Fri,  9 Sep 2022 10:59:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SJNwHaYcG2M0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Sep 2022 10:59:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
Subject: [PATCH 2/4] drm/plane: Allocate planes with
 drm_universal_plane_alloc()
Date: Fri,  9 Sep 2022 12:59:45 +0200
Message-Id: <20220909105947.6487-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909105947.6487-1-tzimmermann@suse.de>
References: <20220909105947.6487-1-tzimmermann@suse.de>
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide drm_univeral_plane_alloc(), which allocated an initializes a
plane. Code for non-atomic drivers uses this pattern. Convert it to
the new function. The modeset helpers contain a quirk for handling their
color formats differently. Set the flag outside plane allocation.

The new function is already deprecated to some extend. Drivers should
rather use drmm_univeral_plane_alloc() or drm_universal_plane_init().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_modeset_helper.c    | 61 +++++++++++--------------
 drivers/gpu/drm/drm_plane.c             | 38 +++++++++++++++
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 41 ++++++-----------
 include/drm/drm_plane.h                 | 44 ++++++++++++++++++
 4 files changed, 121 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index 611dd01fb604..38040eebfa16 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -113,38 +113,6 @@ static const struct drm_plane_funcs primary_plane_funcs = {
 	.destroy = drm_plane_helper_destroy,
 };
 
-static struct drm_plane *create_primary_plane(struct drm_device *dev)
-{
-	struct drm_plane *primary;
-	int ret;
-
-	primary = kzalloc(sizeof(*primary), GFP_KERNEL);
-	if (primary == NULL) {
-		DRM_DEBUG_KMS("Failed to allocate primary plane\n");
-		return NULL;
-	}
-
-	/*
-	 * Remove the format_default field from drm_plane when dropping
-	 * this helper.
-	 */
-	primary->format_default = true;
-
-	/* possible_crtc's will be filled in later by crtc_init */
-	ret = drm_universal_plane_init(dev, primary, 0,
-				       &primary_plane_funcs,
-				       safe_modeset_formats,
-				       ARRAY_SIZE(safe_modeset_formats),
-				       NULL,
-				       DRM_PLANE_TYPE_PRIMARY, NULL);
-	if (ret) {
-		kfree(primary);
-		primary = NULL;
-	}
-
-	return primary;
-}
-
 /**
  * drm_crtc_init - Legacy CRTC initialization function
  * @dev: DRM device
@@ -176,10 +144,33 @@ int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		  const struct drm_crtc_funcs *funcs)
 {
 	struct drm_plane *primary;
+	int ret;
+
+	/* possible_crtc's will be filled in later by crtc_init */
+	primary = __drm_universal_plane_alloc(dev, sizeof(*primary), 0, 0,
+					      &primary_plane_funcs,
+					      safe_modeset_formats,
+					      ARRAY_SIZE(safe_modeset_formats),
+					      NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(primary))
+		return PTR_ERR(primary);
 
-	primary = create_primary_plane(dev);
-	return drm_crtc_init_with_planes(dev, crtc, primary, NULL, funcs,
-					 NULL);
+	/*
+	 * Remove the format_default field from drm_plane when dropping
+	 * this helper.
+	 */
+	primary->format_default = true;
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary, NULL, funcs, NULL);
+	if (ret)
+		goto err_drm_plane_cleanup;
+
+	return 0;
+
+err_drm_plane_cleanup:
+	drm_plane_cleanup(primary);
+	kfree(primary);
+	return ret;
 }
 EXPORT_SYMBOL(drm_crtc_init);
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 0f14b4d3bb10..33357629a7f5 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -448,6 +448,44 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev, size_t size,
 }
 EXPORT_SYMBOL(__drmm_universal_plane_alloc);
 
+void *__drm_universal_plane_alloc(struct drm_device *dev, size_t size,
+				  size_t offset, uint32_t possible_crtcs,
+				  const struct drm_plane_funcs *funcs,
+				  const uint32_t *formats, unsigned int format_count,
+				  const uint64_t *format_modifiers,
+				  enum drm_plane_type type,
+				  const char *name, ...)
+{
+	void *container;
+	struct drm_plane *plane;
+	va_list ap;
+	int ret;
+
+	if (drm_WARN_ON(dev, !funcs))
+		return ERR_PTR(-EINVAL);
+
+	container = kzalloc(size, GFP_KERNEL);
+	if (!container)
+		return ERR_PTR(-ENOMEM);
+
+	plane = container + offset;
+
+	va_start(ap, name);
+	ret = __drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
+					 formats, format_count, format_modifiers,
+					 type, name, ap);
+	va_end(ap);
+	if (ret)
+		goto err_kfree;
+
+	return container;
+
+err_kfree:
+	kfree(container);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(__drm_universal_plane_alloc);
+
 int drm_plane_register_all(struct drm_device *dev)
 {
 	unsigned int num_planes = 0;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 660c4cbc0b3d..6b8a014b5e97 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1281,32 +1281,6 @@ static const struct drm_plane_funcs nv04_primary_plane_funcs = {
 	.destroy = drm_plane_helper_destroy,
 };
 
-static struct drm_plane *
-create_primary_plane(struct drm_device *dev)
-{
-        struct drm_plane *primary;
-        int ret;
-
-        primary = kzalloc(sizeof(*primary), GFP_KERNEL);
-        if (primary == NULL) {
-                DRM_DEBUG_KMS("Failed to allocate primary plane\n");
-                return NULL;
-        }
-
-        /* possible_crtc's will be filled in later by crtc_init */
-        ret = drm_universal_plane_init(dev, primary, 0,
-				       &nv04_primary_plane_funcs,
-                                       modeset_formats,
-                                       ARRAY_SIZE(modeset_formats), NULL,
-                                       DRM_PLANE_TYPE_PRIMARY, NULL);
-        if (ret) {
-                kfree(primary);
-                primary = NULL;
-        }
-
-        return primary;
-}
-
 static int nv04_crtc_vblank_handler(struct nvif_notify *notify)
 {
 	struct nouveau_crtc *nv_crtc =
@@ -1321,6 +1295,7 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 {
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_crtc *nv_crtc;
+	struct drm_plane *primary;
 	int ret;
 
 	nv_crtc = kzalloc(sizeof(*nv_crtc), GFP_KERNEL);
@@ -1335,8 +1310,18 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 	nv_crtc->save = nv_crtc_save;
 	nv_crtc->restore = nv_crtc_restore;
 
-	drm_crtc_init_with_planes(dev, &nv_crtc->base,
-                                  create_primary_plane(dev), NULL,
+	primary = __drm_universal_plane_alloc(dev, sizeof(*primary), 0, 0,
+					      &nv04_primary_plane_funcs,
+					      modeset_formats,
+					      ARRAY_SIZE(modeset_formats), NULL,
+					      DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(primary)) {
+		ret = PTR_ERR(primary);
+		kfree(nv_crtc);
+		return ret;
+	}
+
+	drm_crtc_init_with_planes(dev, &nv_crtc->base, primary, NULL,
                                   &nv04_crtc_funcs, NULL);
 	drm_crtc_helper_add(&nv_crtc->base, &nv04_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(&nv_crtc->base, 256);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 910cb941f3d5..21dfa7f97948 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -809,6 +809,50 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev,
 					      format_count, format_modifiers, \
 					      plane_type, name, ##__VA_ARGS__))
 
+__printf(10, 11)
+void *__drm_universal_plane_alloc(struct drm_device *dev,
+				  size_t size, size_t offset,
+				  uint32_t possible_crtcs,
+				  const struct drm_plane_funcs *funcs,
+				  const uint32_t *formats,
+				  unsigned int format_count,
+				  const uint64_t *format_modifiers,
+				  enum drm_plane_type plane_type,
+				  const char *name, ...);
+
+/**
+ * drm_universal_plane_alloc - Allocate and initialize an universal plane object
+ * @dev: DRM device
+ * @type: the type of the struct which contains struct &drm_plane
+ * @member: the name of the &drm_plane within @type
+ * @possible_crtcs: bitmask of possible CRTCs
+ * @funcs: callbacks for the new plane
+ * @formats: array of supported formats (DRM_FORMAT\_\*)
+ * @format_count: number of elements in @formats
+ * @format_modifiers: array of struct drm_format modifiers terminated by
+ *                    DRM_FORMAT_MOD_INVALID
+ * @plane_type: type of plane (overlay, primary, cursor)
+ * @name: printf style format string for the plane name, or NULL for default name
+ *
+ * Allocates and initializes a plane object of type @type. The caller
+ * is responsible for releasing the allocated memory with kfree().
+ *
+ * Drivers are encouraged to use drmm_universal_plane_alloc() instead.
+ *
+ * Drivers that only support the DRM_FORMAT_MOD_LINEAR modifier support may set
+ * @format_modifiers to NULL. The plane will advertise the linear modifier.
+ *
+ * Returns:
+ * Pointer to new plane, or ERR_PTR on failure.
+ */
+#define drm_universal_plane_alloc(dev, type, member, possible_crtcs, funcs, formats, \
+				   format_count, format_modifiers, plane_type, name, ...) \
+	((type *)__drm_universal_plane_alloc(dev, sizeof(type), \
+					     offsetof(type, member), \
+					     possible_crtcs, funcs, formats, \
+					     format_count, format_modifiers, \
+					     plane_type, name, ##__VA_ARGS__))
+
 /**
  * drm_plane_index - find the index of a registered plane
  * @plane: plane to find index for
-- 
2.37.2

