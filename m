Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D59EAC57
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 10:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E9B10E870;
	Tue, 10 Dec 2024 09:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZR53lNjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6918E10E86E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733823406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYjPaPXaAn3ov9rPBUR6OWMDHSADuNyflqCMsjS1U2Q=;
 b=ZR53lNjh26+IMGYY9HylrE3IiBiJ6FygqyEiDTmjuAl7Y1QWvMeNbZvNn4TQrFa2kMRr8R
 i6A3mVc9o9VO1U0KnX6hZes2SiWRupKC65LSr6O8Tfb4jVqRjI6RWN3dw4RFexSdwKRvjU
 n9JtXvTn6ihTUGWGEs6u5yAMJXbcykI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-nfJeKGshNja4kk6SHkqICA-1; Tue,
 10 Dec 2024 04:36:45 -0500
X-MC-Unique: nfJeKGshNja4kk6SHkqICA-1
X-Mimecast-MFC-AGG-ID: nfJeKGshNja4kk6SHkqICA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3DA1519560A2; Tue, 10 Dec 2024 09:36:43 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.39])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E914B195608A; Tue, 10 Dec 2024 09:36:39 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v3 5/6] drm/i915: Add drm_panic support
Date: Tue, 10 Dec 2024 10:28:45 +0100
Message-ID: <20241210093505.589893-6-jfalempe@redhat.com>
In-Reply-To: <20241210093505.589893-1-jfalempe@redhat.com>
References: <20241210093505.589893-1-jfalempe@redhat.com>
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

This adds drm_panic support for a wide range of Intel GPU. I've
tested it only on 2 laptops, Haswell (with 128MB of eDRAM),
Cometlake.
For hardware using DPT, it's not possible to disable tiling, as you
will need to reconfigure the way the GPU is accessing the
framebuffer.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c | 85 ++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index d89630b2d5c19..bafb1421f3b30 100644
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
 
@@ -1204,14 +1209,92 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
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
+		/* Can't disable tiling if DPT is in use */
+		if (intel_fb_uses_dpt(fb))
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

