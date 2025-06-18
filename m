Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196E7ADE749
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6262010E7C9;
	Wed, 18 Jun 2025 09:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="av9YIraj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C417310E7D0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750239687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCh2D6joaySNbJXE1hejgkSYr1Lc6oM3ACPnz1eIPwY=;
 b=av9YIrajC3A8p/R+d6F+vwzQoja/3LKHgF2oU3w0lPrqpCBfuL96Uzci1FxrELHf/h2RMQ
 JnHXWCh3xM9h7jagwbXDjk6xwneFCFIJ113PU62k1uBQuIF6A7DHgJeZXQvJ9TfFC83jBy
 2roOQrN/nQifzaOVzTjjyPkuOl3RPJQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-6g6f8BYlObKpbmgZKWN-9g-1; Wed,
 18 Jun 2025 05:41:21 -0400
X-MC-Unique: 6g6f8BYlObKpbmgZKWN-9g-1
X-Mimecast-MFC-AGG-ID: 6g6f8BYlObKpbmgZKWN-9g_1750239679
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 51AB11800C25; Wed, 18 Jun 2025 09:41:19 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.137])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A7BEE19560A3; Wed, 18 Jun 2025 09:41:13 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
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
Subject: [PATCH v10 08/10] drm/i915/display: Add drm_panic support for
 Y-tiling with DPT
Date: Wed, 18 Jun 2025 11:31:26 +0200
Message-ID: <20250618094011.238154-9-jfalempe@redhat.com>
In-Reply-To: <20250618094011.238154-1-jfalempe@redhat.com>
References: <20250618094011.238154-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

 .../gpu/drm/i915/display/intel_atomic_plane.c | 64 ++++++++++++++++++-
 .../drm/i915/display/intel_display_types.h    |  1 +
 .../drm/i915/display/skl_universal_plane.c    | 15 +++--
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 16 ++++-
 drivers/gpu/drm/xe/display/intel_bo.c         |  5 +-
 5 files changed, 93 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 9e1c9d1e015f..044328d83df9 100644
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
@@ -1294,6 +1320,35 @@ static void intel_panic_flush(struct drm_plane *plane)
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
@@ -1319,8 +1374,13 @@ static int intel_get_scanout_buffer(struct drm_plane *plane,
 	} else {
 		int ret;
 		/* Can't disable tiling if DPT is in use */
-		if (intel_fb_uses_dpt(fb))
-			return -EOPNOTSUPP;
+		if (intel_fb_uses_dpt(fb)) {
+			if (fb->format->cpp[0] != 4)
+				return -EOPNOTSUPP;
+			intel_fb->panic.tiling = intel_get_tiling_func(fb->modifier);
+			if (!intel_fb->panic.tiling)
+				return -EOPNOTSUPP;
+		}
 		sb->private = intel_fb;
 		ret = intel_bo_panic_setup(sb);
 		if (ret)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 6d6d2d948886..8db6a8c0686c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -134,6 +134,7 @@ struct intel_panic_data {
 	struct page **pages;
 	int page;
 	void *vaddr;
+	unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width);
 };
 
 struct intel_framebuffer {
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ef09ef7b101f..623eff23d9bc 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2796,15 +2796,22 @@ static void skl_disable_tiling(struct intel_plane *plane)
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
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 0bcf4647a2a0..bf7cd7555777 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -384,6 +384,15 @@ static struct page **i915_gem_object_panic_pages(struct drm_i915_gem_object *obj
 	return pages;
 }
 
+static void i915_gem_object_panic_map_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
+						unsigned int y, u32 color)
+{
+	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
+	unsigned int offset = fb->panic.tiling(sb->width, x, y);
+
+	iosys_map_wr(&sb->map[0], offset, u32, color);
+}
+
 /*
  * The scanout buffer pages are not mapped, so for each pixel,
  * use kmap_local_page_try_from_panic() to map the page, and write the pixel.
@@ -396,7 +405,10 @@ static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buffer *sb,
 	unsigned int offset;
 	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
 
-	offset = y * sb->pitch[0] + x * sb->format->cpp[0];
+	if (fb->panic.tiling)
+		offset = fb->panic.tiling(sb->width, x, y);
+	else
+		offset = y * sb->pitch[0] + x * sb->format->cpp[0];
 
 	new_page = offset >> PAGE_SHIFT;
 	offset = offset % PAGE_SIZE;
@@ -431,6 +443,8 @@ int i915_gem_object_panic_setup(struct drm_scanout_buffer *sb)
 		else
 			iosys_map_set_vaddr(&sb->map[0], ptr);
 
+		if (fb->panic.tiling)
+			sb->set_pixel = i915_gem_object_panic_map_set_pixel;
 		return 0;
 	}
 	if (i915_gem_object_has_struct_page(obj)) {
diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 8a6de2dda88c..26db10fc2f48 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -87,7 +87,10 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 	unsigned int new_page;
 	unsigned int offset;
 
-	offset = y * sb->pitch[0] + x * sb->format->cpp[0];
+	if (fb->panic.tiling)
+		offset = fb->panic.tiling(sb->width, x, y);
+	else
+		offset = y * sb->pitch[0] + x * sb->format->cpp[0];
 
 	new_page = offset >> PAGE_SHIFT;
 	offset = offset % PAGE_SIZE;
-- 
2.49.0

