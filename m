Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A199E1781
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B8910E9AD;
	Tue,  3 Dec 2024 09:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PGy8LrwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DBE10E9AD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733218159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnIpLUaZjZ89RucMDbcSAI8aEU0VifFxCRWXuWOR5LI=;
 b=PGy8LrwXlC8fxmgaFCw7yYxc23SEtS+fnbUXFkvxJUYug6RTz30YiSJ/ZviEm/VlnuvM4m
 i4QMno6ASVBoPQWyqYZ4zbv9mnSQxz1+kZA4B2z8wg+LbgxpFNqVt1wybv3OnOOff4pxWA
 xaI1OOkF0EleqAQJVlVSxyuwfr2HDlM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-9ri83S1KOnqNWER8SpvSmw-1; Tue,
 03 Dec 2024 04:29:15 -0500
X-MC-Unique: 9ri83S1KOnqNWER8SpvSmw-1
X-Mimecast-MFC-AGG-ID: 9ri83S1KOnqNWER8SpvSmw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3E2D4195396F; Tue,  3 Dec 2024 09:29:14 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.255])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4C55D19560A3; Tue,  3 Dec 2024 09:29:11 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 5/5] drm/i915: Add drm_panic support
Date: Tue,  3 Dec 2024 09:50:22 +0100
Message-ID: <20241203092836.426422-6-jfalempe@redhat.com>
In-Reply-To: <20241203092836.426422-1-jfalempe@redhat.com>
References: <20241203092836.426422-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
tested it only on 3 laptops, haswell (with 128MB of eDRAM),
cometlake and alderlake.

 * DPT: if I disable tiling on a framebuffer using DPT, then it
   displays some other memory location. As DPT is enabled only for
   tiled framebuffer, there might be some hardware limitations.
 * fbdev: On my haswell laptop, the fbdev framebuffer is configured
   with tiling enabled, but really it's linear, because fbcon don't
   know about tiling, and the panic screen is perfect when it's drawn
   as linear.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c | 85 ++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index b7e462075ded3..58eb3b4c55fa5 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -33,16 +33,20 @@
 
 #include <linux/dma-fence-chain.h>
 #include <linux/dma-resv.h>
+#include <linux/iosys-map.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_cache.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 
 #include "i915_config.h"
 #include "i9xx_plane_regs.h"
 #include "intel_atomic_plane.h"
+#include "intel_bo.h"
 #include "intel_cdclk.h"
 #include "intel_cursor.h"
 #include "intel_display_rps.h"
@@ -50,6 +54,7 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
+#include "intel_fbdev.h"
 #include "skl_scaler.h"
 #include "skl_watermark.h"
 
@@ -1198,14 +1203,92 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 	intel_plane_unpin_fb(old_plane_state);
 }
 
+/* Only used by drm_panic get_scanout_buffer() and panic_flush(), so it is
+ * protected by the drm panic spinlock
+ */
+static struct iosys_map panic_map;
+
+static void intel_panic_flush(struct drm_plane *plane)
+{
+	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
+	struct drm_i915_private *dev_priv = to_i915(plane->dev);
+	struct drm_framebuffer *fb = plane_state->hw.fb;
+	struct intel_plane *iplane = to_intel_plane(plane);
+
+	/* Force a cache flush, otherwise the new pixels won't show up */
+	drm_clflush_virt_range(panic_map.vaddr, fb->height * fb->pitches[0]);
+
+	/* Don't disable tiling if it's the fbdev framebuffer.*/
+	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(dev_priv->display.fbdev.fbdev))
+		return;
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
+	struct drm_i915_private *dev_priv = to_i915(plane->dev);
+	void *ptr;
+
+	if (!plane->state || !plane->state->fb || !plane->state->visible)
+		return -ENODEV;
+
+	plane_state = to_intel_plane_state(plane->state);
+	fb = plane_state->hw.fb;
+	obj = intel_fb_bo(fb);
+	if (!obj)
+		return -ENODEV;
+
+	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(dev_priv->display.fbdev.fbdev)) {
+		ptr = intel_fbdev_get_vaddr(dev_priv->display.fbdev.fbdev);
+	} else {
+		/* can't disable tiling if DPT is in use */
+		if (intel_bo_is_tiled(obj) && HAS_DPT(dev_priv))
+			return -EOPNOTSUPP;
+
+		ptr = intel_bo_panic_map(obj);
+	}
+
+	if (!ptr)
+		return -ENOMEM;
+
+	if (intel_bo_has_iomem(obj))
+		iosys_map_set_vaddr_iomem(&panic_map, ptr);
+	else
+		iosys_map_set_vaddr(&panic_map, ptr);
+
+	sb->map[0] = panic_map;
+	sb->width = fb->width;
+	sb->height = fb->height;
+	sb->format = fb->format;
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
2.47.1

