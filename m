Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201DA77B7E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 14:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F0410E59A;
	Tue,  1 Apr 2025 12:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Hj1B+GT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F8910E59A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743512353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zioQXFR45W76brR5mzFjXRn1PUWkxy9iylc9xogw/Xg=;
 b=Hj1B+GT0HdBBBPntnLAoaN34xFGuFb0awNc2IM/XsJQjs/KPwEJaDOJg9qmNocAebxWKnK
 2HANLbA2b1zgF+PAB0t1hJo46vkOKrL26zgSWj6Er62bKGM8Rk2LCWa4mRe+ef52lWhw1e
 WviVWZH8zu/PZJH/pUHoysPfTlb2Mcw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-393-dJNTKICTMjKXQ1mNQVmrcA-1; Tue,
 01 Apr 2025 08:59:09 -0400
X-MC-Unique: dJNTKICTMjKXQ1mNQVmrcA-1
X-Mimecast-MFC-AGG-ID: dJNTKICTMjKXQ1mNQVmrcA_1743512348
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3C0E91955BC6; Tue,  1 Apr 2025 12:59:08 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.32.206])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 02DA11956094; Tue,  1 Apr 2025 12:59:02 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v6 7/8] drm/i915/display: Add drm_panic support for Y-tiling
 with DPT
Date: Tue,  1 Apr 2025 14:51:13 +0200
Message-ID: <20250401125818.333033-8-jfalempe@redhat.com>
In-Reply-To: <20250401125818.333033-1-jfalempe@redhat.com>
References: <20250401125818.333033-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
 .../gpu/drm/i915/display/intel_atomic_plane.c | 69 ++++++++++++++++++-
 .../drm/i915/display/skl_universal_plane.c    | 15 ++--
 2 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 5dc880b963fd..76c10555c10e 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1262,6 +1262,33 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
  */
 static struct iosys_map panic_map;
 
+/* Handle Y-tiling, only if DPT is enabled (otherwise disabling tiling is easier)
+ * All DPT hardware have 128-bytes width tiling, so Y-tile dimension is 32x32
+ * pixels for 32bits pixels.
+ */
+#define YTILE_WIDTH	32
+#define YTILE_HEIGHT	32
+#define YTILE_SIZE (YTILE_WIDTH * YTILE_HEIGHT * 4)
+
+static void intel_ytile_set_pixel(struct drm_scanout_buffer *sb, unsigned int x, unsigned int y,
+				  u32 color)
+{
+	u32 offset;
+	unsigned int swizzle;
+	unsigned int width_in_blocks = DIV_ROUND_UP(sb->width, 32);
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
+	iosys_map_wr(&sb->map[0], offset, u32, color);
+}
+
 static void intel_panic_flush(struct drm_plane *plane)
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
@@ -1286,6 +1313,34 @@ static void intel_panic_flush(struct drm_plane *plane)
 		iplane->disable_tiling(iplane);
 }
 
+static void (*intel_get_tiling_func(u64 fb_modifier))(struct drm_scanout_buffer *sb, unsigned int x,
+						      unsigned int y, u32 color)
+{
+	switch (fb_modifier) {
+	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_Y_TILED_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
+		return intel_ytile_set_pixel;
+	case I915_FORMAT_MOD_X_TILED:
+	case I915_FORMAT_MOD_4_TILED:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
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
@@ -1308,8 +1363,13 @@ static int intel_get_scanout_buffer(struct drm_plane *plane,
 		intel_fbdev_get_map(display->fbdev.fbdev, &panic_map);
 	} else {
 		/* Can't disable tiling if DPT is in use */
-		if (intel_fb_uses_dpt(fb))
-			return -EOPNOTSUPP;
+		if (intel_fb_uses_dpt(fb)) {
+			if (fb->format->cpp[0] != 4)
+				return -EOPNOTSUPP;
+			sb->set_pixel = intel_get_tiling_func(fb->modifier);
+			if (!sb->set_pixel)
+				return -EOPNOTSUPP;
+		}
 
 		intel_bo_panic_map(obj, &panic_map);
 	}
@@ -1319,7 +1379,10 @@ static int intel_get_scanout_buffer(struct drm_plane *plane,
 	sb->map[0] = panic_map;
 	sb->width = fb->width;
 	sb->height = fb->height;
-	sb->format = fb->format;
+	/* Use the generic linear format, because tiling, RC, CCS, CC
+	 * will be disabled in disable_tiling()
+	 */
+	sb->format = drm_format_info(fb->format->format);
 	sb->pitch[0] = fb->pitches[0];
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 64a1e8e7122d..9d84e9aecd93 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2794,15 +2794,22 @@ static void skl_disable_tiling(struct intel_plane *plane)
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
-- 
2.49.0

