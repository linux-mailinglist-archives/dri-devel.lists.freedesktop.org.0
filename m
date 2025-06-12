Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6160AD6A26
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279A610E79D;
	Thu, 12 Jun 2025 08:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WYLJM9LN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D5A10E79B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749716094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJz80t3k8roP0jwYc0ruyhd7x0tctzP/gYGBo7lRnQs=;
 b=WYLJM9LNrLPApqKf/yBw6zBMabS1GtFoui3ogc5/cPaeoZK6vdPpku3jRvXyiQ1NPRhsbJ
 ljzqS6Ac8SVzbx/aPG7VyeRppjWxIA1sqjlDnAdt8HqrUpTTAk+PA62IOZinJAgwUxVKSC
 4JgRNhNYJPktPtjUXg+7MZxL0rohqZk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-222-3HAaNyddMBeLCJJmARaeGQ-1; Thu,
 12 Jun 2025 04:14:50 -0400
X-MC-Unique: 3HAaNyddMBeLCJJmARaeGQ-1
X-Mimecast-MFC-AGG-ID: 3HAaNyddMBeLCJJmARaeGQ_1749716088
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 48BD918002A1; Thu, 12 Jun 2025 08:14:48 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.28])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 28CA1195609D; Thu, 12 Jun 2025 08:14:42 +0000 (UTC)
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
Subject: [PATCH v9 7/9] drm/i915/display: Add drm_panic support for Y-tiling
 with DPT
Date: Thu, 12 Jun 2025 10:01:04 +0200
Message-ID: <20250612081344.225200-8-jfalempe@redhat.com>
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

On Alder Lake and later, it's not possible to disable tiling when DPT
is enabled.
So this commit implements Y-Tiling support, to still be able to draw
the panic screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v8:
 * Pass the tiling function to intel_bo_panic_setup()

 .../gpu/drm/i915/display/intel_atomic_plane.c | 67 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bo.c       |  5 +-
 drivers/gpu/drm/i915/display/intel_bo.h       |  3 +-
 .../drm/i915/display/skl_universal_plane.c    | 15 +++--
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 21 +++++-
 drivers/gpu/drm/xe/display/intel_bo.c         | 10 ++-
 7 files changed, 109 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index c310207e23e6..ce5471bd3c43 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1271,6 +1271,32 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 	intel_plane_unpin_fb(old_plane_state);
 }
 
+/* Handle Y-tiling, only if DPT is enabled (otherwise disabling tiling is easier)
+ * All DPT hardware have 128-bytes width tiling, so Y-tile dimension is 32x32
+ * pixels for 32bits pixels.
+ */
+#define YTILE_WIDTH	32
+#define YTILE_HEIGHT	32
+#define YTILE_SIZE (YTILE_WIDTH * YTILE_HEIGHT * 4)
+
+static unsigned int intel_ytile_get_offset(unsigned int width, unsigned int x, unsigned int y)
+{
+	u32 offset;
+	unsigned int swizzle;
+	unsigned int width_in_blocks = DIV_ROUND_UP(width, 32);
+
+	/* Block offset */
+	offset = ((y / YTILE_HEIGHT) * width_in_blocks + (x / YTILE_WIDTH)) * YTILE_SIZE;
+
+	x = x % YTILE_WIDTH;
+	y = y % YTILE_HEIGHT;
+
+	/* bit order inside a block is x4 x3 x2 y4 y3 y2 y1 y0 x1 x0 */
+	swizzle = (x & 3) | ((y & 0x1f) << 2) | ((x & 0x1c) << 5);
+	offset += swizzle * 4;
+	return offset;
+}
+
 static void intel_panic_flush(struct drm_plane *plane)
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
@@ -1296,6 +1322,35 @@ static void intel_panic_flush(struct drm_plane *plane)
 		iplane->disable_tiling(iplane);
 }
 
+static unsigned int (*intel_get_tiling_func(u64 fb_modifier))(unsigned int width,
+							      unsigned int x,
+							      unsigned int y)
+{
+	switch (fb_modifier) {
+	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_Y_TILED_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
+		return intel_ytile_get_offset;
+	case I915_FORMAT_MOD_4_TILED:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
+	case I915_FORMAT_MOD_X_TILED:
+	case I915_FORMAT_MOD_Yf_TILED:
+	case I915_FORMAT_MOD_Yf_TILED_CCS:
+	default:
+	/* Not supported yet */
+		return NULL;
+	}
+}
+
 static int intel_get_scanout_buffer(struct drm_plane *plane,
 				    struct drm_scanout_buffer *sb)
 {
@@ -1303,6 +1358,7 @@ static int intel_get_scanout_buffer(struct drm_plane *plane,
 	struct drm_gem_object *obj;
 	struct drm_framebuffer *fb;
 	struct intel_display *display = to_intel_display(plane->dev);
+	unsigned int (*tiling)(unsigned int width, unsigned int x, unsigned int y) = NULL;
 
 	if (!plane->state || !plane->state->fb || !plane->state->visible)
 		return -ENODEV;
@@ -1318,9 +1374,14 @@ static int intel_get_scanout_buffer(struct drm_plane *plane,
 	} else {
 		int ret;
 		/* Can't disable tiling if DPT is in use */
-		if (intel_fb_uses_dpt(fb))
-			return -EOPNOTSUPP;
-		ret = intel_bo_panic_setup(obj, sb);
+		if (intel_fb_uses_dpt(fb)) {
+			if (fb->format->cpp[0] != 4)
+				return -EOPNOTSUPP;
+			tiling = intel_get_tiling_func(fb->modifier);
+			if (!tiling)
+				return -EOPNOTSUPP;
+		}
+		ret = intel_bo_panic_setup(obj, sb, tiling);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
index 83dbd8ae16fe..16c4ef30133c 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.c
+++ b/drivers/gpu/drm/i915/display/intel_bo.c
@@ -59,9 +59,10 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
 	i915_debugfs_describe_obj(m, to_intel_bo(obj));
 }
 
-int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_buffer *sb)
+int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_buffer *sb,
+			 unsigned int (*tiling)(unsigned int, unsigned int, unsigned int))
 {
-	return i915_gem_object_panic_setup(to_intel_bo(obj), sb);
+	return i915_gem_object_panic_setup(to_intel_bo(obj), sb, tiling);
 }
 
 void intel_bo_panic_finish(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
index 9ac087ea275d..9eecc18005ae 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.h
+++ b/drivers/gpu/drm/i915/display/intel_bo.h
@@ -24,7 +24,8 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(struct drm_gem_object *obj,
 						   struct intel_frontbuffer *front);
 
 void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
-int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_buffer *sb);
+int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_buffer *sb,
+			 unsigned int (*tiling)(unsigned int, unsigned int, unsigned int));
 void intel_bo_panic_finish(struct drm_gem_object *obj);
 
 #endif /* __INTEL_BO__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ffcf50443c0c..e73f171988f3 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2795,15 +2795,22 @@ static void skl_disable_tiling(struct intel_plane *plane)
 {
 	struct intel_plane_state *state = to_intel_plane_state(plane->base.state);
 	struct intel_display *display = to_intel_display(plane);
-	u32 stride = state->view.color_plane[0].scanout_stride / 64;
+	const struct drm_framebuffer *fb = state->hw.fb;
 	u32 plane_ctl;
 
 	plane_ctl = intel_de_read(display, PLANE_CTL(plane->pipe, plane->id));
-	plane_ctl &= ~PLANE_CTL_TILED_MASK;
 
-	intel_de_write_fw(display, PLANE_STRIDE(plane->pipe, plane->id),
-			  PLANE_STRIDE_(stride));
+	if (intel_fb_uses_dpt(fb)) {
+		/* if DPT is enabled, keep tiling, but disable compression */
+		plane_ctl &= ~PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
+	} else {
+		/* if DPT is not supported, disable tiling, and update stride */
+		u32 stride = state->view.color_plane[0].scanout_stride / 64;
 
+		plane_ctl &= ~PLANE_CTL_TILED_MASK;
+		intel_de_write_fw(display, PLANE_STRIDE(plane->pipe, plane->id),
+				  PLANE_STRIDE_(stride));
+	}
 	intel_de_write_fw(display, PLANE_CTL(plane->pipe, plane->id), plane_ctl);
 
 	intel_de_write_fw(display, PLANE_SURF(plane->pipe, plane->id),
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 9a0c1019dcad..a9d4e7f93c1f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -692,7 +692,8 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
 int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
 int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
 
-int i915_gem_object_panic_setup(struct drm_i915_gem_object *obj, struct drm_scanout_buffer *sb);
+int i915_gem_object_panic_setup(struct drm_i915_gem_object *obj, struct drm_scanout_buffer *sb,
+				unsigned int (*tiling)(unsigned int, unsigned int, unsigned int));
 void i915_gem_object_panic_finish(struct drm_i915_gem_object *obj);
 
 /**
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 81cda0a7f4d3..0244e2fd4ad1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -358,6 +358,7 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 static struct page **i915_panic_pages;
 static int i915_panic_page = -1;
 static void *i915_panic_vaddr;
+static unsigned int (*i915_panic_tiling)(unsigned int, unsigned int, unsigned int);
 
 static void i915_panic_kunmap(void)
 {
@@ -386,6 +387,14 @@ static struct page **i915_gem_object_panic_pages(struct drm_i915_gem_object *obj
 	return pages;
 }
 
+static void i915_gem_object_panic_map_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
+						unsigned int y, u32 color)
+{
+	unsigned int offset = i915_panic_tiling(sb->width, x, y);
+
+	iosys_map_wr(&sb->map[0], offset, u32, color);
+}
+
 /*
  * The scanout buffer pages are not mapped, so for each pixel,
  * use kmap_local_page_try_from_panic() to map the page, and write the pixel.
@@ -397,7 +406,10 @@ static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buffer *sb,
 	unsigned int new_page;
 	unsigned int offset;
 
-	offset = y * sb->pitch[0] + x * sb->format->cpp[0];
+	if (i915_panic_tiling)
+		offset = i915_panic_tiling(sb->width, x, y);
+	else
+		offset = y * sb->pitch[0] + x * sb->format->cpp[0];
 
 	new_page = offset >> PAGE_SHIFT;
 	offset = offset % PAGE_SIZE;
@@ -418,11 +430,14 @@ static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buffer *sb,
  * Use current vaddr if it exists, or setup a list of pages.
  * pfn is not supported yet.
  */
-int i915_gem_object_panic_setup(struct drm_i915_gem_object *obj, struct drm_scanout_buffer *sb)
+int i915_gem_object_panic_setup(struct drm_i915_gem_object *obj, struct drm_scanout_buffer *sb,
+				unsigned int (*tiling)(unsigned int, unsigned int, unsigned int))
 {
 	enum i915_map_type has_type;
 	void *ptr;
 
+	i915_panic_tiling = tiling;
+
 	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
 	if (ptr) {
 		if (i915_gem_object_has_iomem(obj))
@@ -430,6 +445,8 @@ int i915_gem_object_panic_setup(struct drm_i915_gem_object *obj, struct drm_scan
 		else
 			iosys_map_set_vaddr(&sb->map[0], ptr);
 
+		if (tiling)
+			sb->set_pixel = i915_gem_object_panic_map_set_pixel;
 		return 0;
 	}
 	if (i915_gem_object_has_struct_page(obj)) {
diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 19b74ebaff2a..20adcf52b9b5 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -64,6 +64,7 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
 static int xe_panic_page = -1;
 static void *xe_panic_vaddr;
 static struct xe_bo *xe_panic_bo;
+static unsigned int (*xe_panic_tiling)(unsigned int, unsigned int, unsigned int);
 
 static void xe_panic_kunmap(void)
 {
@@ -85,7 +86,10 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 	unsigned int new_page;
 	unsigned int offset;
 
-	offset = y * sb->pitch[0] + x * sb->format->cpp[0];
+	if (xe_panic_tiling)
+		offset = xe_panic_tiling(sb->width, x, y);
+	else
+		offset = y * sb->pitch[0] + x * sb->format->cpp[0];
 
 	new_page = offset >> PAGE_SHIFT;
 	offset = offset % PAGE_SIZE;
@@ -101,11 +105,13 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 	}
 }
 
-int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_buffer *sb)
+int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_buffer *sb,
+			 unsigned int (*tiling)(unsigned int, unsigned int, unsigned int))
 {
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 
 	xe_panic_bo = bo;
+	xe_panic_tiling = tiling;
 	sb->set_pixel = xe_panic_page_set_pixel;
 	return 0;
 }
-- 
2.49.0

