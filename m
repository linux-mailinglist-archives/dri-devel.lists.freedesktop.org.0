Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828BEADE747
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF8D10E7CD;
	Wed, 18 Jun 2025 09:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NYXBnIpg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8761010E7C9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750239679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cxMb2cLTOpbWxbAgHUp5M2dEnCkGiniDuIogBuIWhI=;
 b=NYXBnIpghUrrUj0sJ9gG7gcGUXeyCS4iM/vs6gL49HjV6jg3Ubh/JdQGlGy7fWJ2iZsHuf
 AjvC8AEngdl4QDyd1GVXlzT+yohCoA0pXFXJw4oFEIQCZLUxToTAFIEJIRDf3NCarXOSsy
 D/04hEKnoIF3ql7EU9FR/sBn4Iqo5OA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-251-MGNXYA7_OeCYm7loX0GdLA-1; Wed,
 18 Jun 2025 05:41:15 -0400
X-MC-Unique: MGNXYA7_OeCYm7loX0GdLA-1
X-Mimecast-MFC-AGG-ID: MGNXYA7_OeCYm7loX0GdLA_1750239673
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2A0FC1808984; Wed, 18 Jun 2025 09:41:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.137])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8FE5C19560A3; Wed, 18 Jun 2025 09:41:07 +0000 (UTC)
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
Subject: [PATCH v10 07/10] drm/i915/display: Add drm_panic support
Date: Wed, 18 Jun 2025 11:31:25 +0200
Message-ID: <20250618094011.238154-8-jfalempe@redhat.com>
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

This adds drm_panic support for a wide range of Intel GPU. I've
tested it only on 4 laptops, Haswell (with 128MB of eDRAM),
Comet Lake, Raptor Lake, and Lunar Lake.
For hardware using DPT, it's not possible to disable tiling, as you
will need to reconfigure the way the GPU is accessing the
framebuffer, so this will be handled by the following patches.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v4:
 * Add support for Xe driver.
 
v6:
 * Use struct intel_display instead of drm_i915_private for intel_atomic_plane.c
 
v7:
 * Fix mismatch {} in intel_panic_flush() (Jani Nikula)

v8:
 * Use intel_bo_panic_setup() and intel_bo_panic_finish().
 
v10:
 * Use struct intel_framebuffer to store the panic variables (Maarten Lankhorst)
 
 .../gpu/drm/i915/display/intel_atomic_plane.c | 83 ++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 15ede7678636..9e1c9d1e015f 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -33,19 +33,23 @@
 
 #include <linux/dma-fence-chain.h>
 #include <linux/dma-resv.h>
+#include <linux/iosys-map.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_damage_helper.h>
+#include <drm/drm_cache.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 
 #include "gem/i915_gem_object.h"
 #include "i915_scheduler_types.h"
 #include "i915_vma.h"
 #include "i9xx_plane_regs.h"
 #include "intel_atomic_plane.h"
+#include "intel_bo.h"
 #include "intel_cdclk.h"
 #include "intel_cursor.h"
 #include "intel_display_rps.h"
@@ -53,6 +57,7 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
+#include "intel_fbdev.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
@@ -1266,14 +1271,90 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 	intel_plane_unpin_fb(old_plane_state);
 }
 
+static void intel_panic_flush(struct drm_plane *plane)
+{
+	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
+	struct intel_plane *iplane = to_intel_plane(plane);
+	struct intel_display *display = to_intel_display(iplane);
+	struct drm_framebuffer *fb = plane_state->hw.fb;
+	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
+
+	intel_bo_panic_finish(intel_fb);
+
+	/* Flush the cache and don't disable tiling if it's the fbdev framebuffer.*/
+	if (intel_fb == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
+		struct iosys_map map;
+
+		intel_fbdev_get_map(display->fbdev.fbdev, &map);
+		drm_clflush_virt_range(map.vaddr, fb->pitches[0] * fb->height);
+		return;
+	}
+
+	if (fb->modifier && iplane->disable_tiling)
+		iplane->disable_tiling(iplane);
+}
+
+static int intel_get_scanout_buffer(struct drm_plane *plane,
+				    struct drm_scanout_buffer *sb)
+{
+	struct intel_plane_state *plane_state;
+	struct drm_gem_object *obj;
+	struct drm_framebuffer *fb;
+	struct intel_framebuffer *intel_fb;
+	struct intel_display *display = to_intel_display(plane->dev);
+
+	if (!plane->state || !plane->state->fb || !plane->state->visible)
+		return -ENODEV;
+
+	plane_state = to_intel_plane_state(plane->state);
+	fb = plane_state->hw.fb;
+	intel_fb = to_intel_framebuffer(fb);
+
+	obj = intel_fb_bo(fb);
+	if (!obj)
+		return -ENODEV;
+
+	if (intel_fb == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
+		intel_fbdev_get_map(display->fbdev.fbdev, &sb->map[0]);
+	} else {
+		int ret;
+		/* Can't disable tiling if DPT is in use */
+		if (intel_fb_uses_dpt(fb))
+			return -EOPNOTSUPP;
+		sb->private = intel_fb;
+		ret = intel_bo_panic_setup(sb);
+		if (ret)
+			return ret;
+	}
+	sb->width = fb->width;
+	sb->height = fb->height;
+	/* Use the generic linear format, because tiling, RC, CCS, CC
+	 * will be disabled in disable_tiling()
+	 */
+	sb->format = drm_format_info(fb->format->format);
+	sb->pitch[0] = fb->pitches[0];
+
+	return 0;
+}
+
 static const struct drm_plane_helper_funcs intel_plane_helper_funcs = {
 	.prepare_fb = intel_prepare_plane_fb,
 	.cleanup_fb = intel_cleanup_plane_fb,
 };
 
+static const struct drm_plane_helper_funcs intel_primary_plane_helper_funcs = {
+	.prepare_fb = intel_prepare_plane_fb,
+	.cleanup_fb = intel_cleanup_plane_fb,
+	.get_scanout_buffer = intel_get_scanout_buffer,
+	.panic_flush = intel_panic_flush,
+};
+
 void intel_plane_helper_add(struct intel_plane *plane)
 {
-	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
+	if (plane->base.type == DRM_PLANE_TYPE_PRIMARY)
+		drm_plane_helper_add(&plane->base, &intel_primary_plane_helper_funcs);
+	else
+		drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
 }
 
 void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_plane_state,
-- 
2.49.0

