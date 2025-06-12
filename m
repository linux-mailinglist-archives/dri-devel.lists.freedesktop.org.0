Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A51AD6A15
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B9210E776;
	Thu, 12 Jun 2025 08:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TcjZK1KC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8EF10E76A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749716062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7zgUFcNjP45KVFN7fvEt+xKxva7ecAlvU3lfLilVE+Q=;
 b=TcjZK1KCsmpxkWA6+9fN5VzEsZgGvmU24ijl3bghVTO2I060h0ARa/KYgriBxUvtjjuU66
 i1qKGodvfBgDvvONGSB6eMuAGjDgufhsnKUxs3cLgmleoQIIAM6pSquh/xR00TgDJJ09nk
 S2SOpWZHm11N4wHuAz/UfJ9IWLN0+VQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-oGwUxBqzO1WP2BV5Aq_ggg-1; Thu,
 12 Jun 2025 04:14:15 -0400
X-MC-Unique: oGwUxBqzO1WP2BV5Aq_ggg-1
X-Mimecast-MFC-AGG-ID: oGwUxBqzO1WP2BV5Aq_ggg_1749716053
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 80DCD1800296; Thu, 12 Jun 2025 08:14:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.28])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CEA26195609D; Thu, 12 Jun 2025 08:14:07 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v9 1/9] drm/i915/fbdev: Add intel_fbdev_get_map()
Date: Thu, 12 Jun 2025 10:00:58 +0200
Message-ID: <20250612081344.225200-2-jfalempe@redhat.com>
In-Reply-To: <20250612081344.225200-1-jfalempe@redhat.com>
References: <20250612081344.225200-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

The vaddr of the fbdev framebuffer is private to the struct
intel_fbdev, so this function is needed to access it for drm_panic.
Also the struct i915_vma is different between i915 and xe, so it
requires a few functions to access fbdev->vma->iomap.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v2:
 * Add intel_fb_get_vaddr() and i915_vma_get_iomap() to build with Xe driver.
 
v4:
 * rename to get_map(), and return the struct iosys_map mapping.
 * implement the Xe variant.

 drivers/gpu/drm/i915/display/intel_fb_pin.c | 5 +++++
 drivers/gpu/drm/i915/display/intel_fb_pin.h | 2 ++
 drivers/gpu/drm/i915/display/intel_fbdev.c  | 5 +++++
 drivers/gpu/drm/i915/display/intel_fbdev.h  | 6 +++++-
 drivers/gpu/drm/i915/i915_vma.h             | 5 +++++
 drivers/gpu/drm/xe/display/xe_fb_pin.c      | 5 +++++
 6 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 98a61a7b0b93..b792e9b062d8 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -334,3 +334,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 			intel_dpt_unpin_from_ggtt(fb->dpt_vm);
 	}
 }
+
+void intel_fb_get_map(struct i915_vma *vma, struct iosys_map *map)
+{
+	iosys_map_set_vaddr_iomem(map, i915_vma_get_iomap(vma));
+}
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.h b/drivers/gpu/drm/i915/display/intel_fb_pin.h
index 01770dbba2e0..81ab79da1af7 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.h
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.h
@@ -12,6 +12,7 @@ struct drm_framebuffer;
 struct i915_vma;
 struct intel_plane_state;
 struct i915_gtt_view;
+struct iosys_map;
 
 struct i915_vma *
 intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
@@ -27,5 +28,6 @@ void intel_fb_unpin_vma(struct i915_vma *vma, unsigned long flags);
 int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 		       const struct intel_plane_state *old_plane_state);
 void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state);
+void intel_fb_get_map(struct i915_vma *vma, struct iosys_map *map);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 2dc4029d71ed..7c4709d58aa3 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -512,3 +512,8 @@ struct i915_vma *intel_fbdev_vma_pointer(struct intel_fbdev *fbdev)
 {
 	return fbdev ? fbdev->vma : NULL;
 }
+
+void intel_fbdev_get_map(struct intel_fbdev *fbdev, struct iosys_map *map)
+{
+	intel_fb_get_map(fbdev->vma, map);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
index a15e3e222a0c..150cc5f45bb3 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.h
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
@@ -13,6 +13,7 @@ struct drm_fb_helper_surface_size;
 struct intel_display;
 struct intel_fbdev;
 struct intel_framebuffer;
+struct iosys_map;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
@@ -22,7 +23,7 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 void intel_fbdev_setup(struct intel_display *display);
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev);
 struct i915_vma *intel_fbdev_vma_pointer(struct intel_fbdev *fbdev);
-
+void intel_fbdev_get_map(struct intel_fbdev *fbdev, struct iosys_map *map);
 #else
 #define INTEL_FBDEV_DRIVER_OPS \
 	.fbdev_probe = NULL
@@ -39,6 +40,9 @@ static inline struct i915_vma *intel_fbdev_vma_pointer(struct intel_fbdev *fbdev
 	return NULL;
 }
 
+static inline void intel_fbdev_get_map(struct intel_fbdev *fbdev, struct iosys_map *map)
+{
+}
 #endif
 
 #endif /* __INTEL_FBDEV_H__ */
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 6a6be8048aa8..4ae610927fa7 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -353,6 +353,11 @@ static inline bool i915_node_color_differs(const struct drm_mm_node *node,
 	return drm_mm_node_allocated(node) && node->color != color;
 }
 
+static inline void __iomem *i915_vma_get_iomap(struct i915_vma *vma)
+{
+	return READ_ONCE(vma->iomap);
+}
+
 /**
  * i915_vma_pin_iomap - calls ioremap_wc to map the GGTT VMA via the aperture
  * @vma: VMA to iomap
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 461ecdfdb742..ac9a5ba363b2 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -465,3 +465,8 @@ u64 intel_dpt_offset(struct i915_vma *dpt_vma)
 {
 	return 0;
 }
+
+void intel_fb_get_map(struct i915_vma *vma, struct iosys_map *map)
+{
+	*map = vma->bo->vmap;
+}
-- 
2.49.0

