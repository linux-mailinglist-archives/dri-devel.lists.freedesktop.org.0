Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6D7AE607C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D228A10E54C;
	Tue, 24 Jun 2025 09:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KkZz28X5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAF510E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750756557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eb6XlDkmvoO4BSJ/pffBshuzeYgbAuMvLWZW7j3rhYk=;
 b=KkZz28X5Bs992reHtILH7FIWejmBHefg6+6gsU4JVOberaXsNipXeqNguREHJ6VDfP7KrJ
 YgHkIySV1JeRPc4JYw6tvDHTEOOQ3iJ6ZAN/7easqv/Lz/pN4QWqXy/aZs0h7vY2BVBmmO
 xQCM3qZmDoVSxPkxgBYf714bS4hCejY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-KM3_h5gZNU-Tn2S3ut1Xhw-1; Tue,
 24 Jun 2025 05:15:51 -0400
X-MC-Unique: KM3_h5gZNU-Tn2S3ut1Xhw-1
X-Mimecast-MFC-AGG-ID: KM3_h5gZNU-Tn2S3ut1Xhw_1750756549
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 30C9C1809C8F; Tue, 24 Jun 2025 09:15:49 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.209])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8A57C180045B; Tue, 24 Jun 2025 09:15:43 +0000 (UTC)
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
Subject: [PATCH v11 06/11] drm/i915: Add intel_bo_alloc_framebuffer()
Date: Tue, 24 Jun 2025 11:01:15 +0200
Message-ID: <20250624091501.257661-7-jfalempe@redhat.com>
In-Reply-To: <20250624091501.257661-1-jfalempe@redhat.com>
References: <20250624091501.257661-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

Encapsulate the struct intel_framebuffer into an xe_framebuffer
or i915_framebuffer, and allow to add specific fields for each
variant for the panic use-case.
This is particularly needed to have a struct xe_res_cursor available
to support drm panic on discrete GPU.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v11:
 * Added in v11

 drivers/gpu/drm/i915/display/i9xx_plane.c     |  3 ++-
 drivers/gpu/drm/i915/display/intel_bo.c       |  6 +++++
 drivers/gpu/drm/i915/display/intel_bo.h       |  2 ++
 drivers/gpu/drm/i915/display/intel_fb.c       |  2 +-
 .../drm/i915/display/skl_universal_plane.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 ++
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 22 +++++++++++++++++
 drivers/gpu/drm/xe/display/intel_bo.c         | 24 +++++++++++++++++++
 8 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index e7e35fd4bdc3..f291ced989dc 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -15,6 +15,7 @@
 #include "i9xx_plane.h"
 #include "i9xx_plane_regs.h"
 #include "intel_atomic.h"
+#include "intel_bo.h"
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_regs.h"
@@ -1174,7 +1175,7 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 
 	drm_WARN_ON(display->drm, pipe != crtc->pipe);
 
-	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
+	intel_fb = intel_bo_alloc_framebuffer();
 	if (!intel_fb) {
 		drm_dbg_kms(display->drm, "failed to alloc fb\n");
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
index fbd16d7b58d9..bcf2eded7469 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.c
+++ b/drivers/gpu/drm/i915/display/intel_bo.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 /* Copyright © 2024 Intel Corporation */
 
+#include "display/intel_display_types.h"
 #include "gem/i915_gem_mman.h"
 #include "gem/i915_gem_object.h"
 #include "gem/i915_gem_object_frontbuffer.h"
@@ -57,3 +58,8 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
 {
 	i915_debugfs_describe_obj(m, to_intel_bo(obj));
 }
+
+struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
+{
+	return i915_gem_object_alloc_framebuffer();
+}
diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
index ea7a2253aaa5..315a81768c73 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.h
+++ b/drivers/gpu/drm/i915/display/intel_bo.h
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 
 struct drm_gem_object;
+struct intel_framebuffer;
 struct seq_file;
 struct vm_area_struct;
 
@@ -23,5 +24,6 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(struct drm_gem_object *obj,
 						   struct intel_frontbuffer *front);
 
 void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
+struct intel_framebuffer *intel_bo_alloc_framebuffer(void);
 
 #endif /* __INTEL_BO__ */
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 763b36c4de10..6158031821fd 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2346,7 +2346,7 @@ intel_framebuffer_create(struct drm_gem_object *obj,
 	struct intel_framebuffer *intel_fb;
 	int ret;
 
-	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
+	intel_fb = intel_bo_alloc_framebuffer();
 	if (!intel_fb)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 1ba04f1b3ec0..cbd0521a201c 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -3029,7 +3029,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		return;
 	}
 
-	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
+	intel_fb = intel_bo_alloc_framebuffer();
 	if (!intel_fb) {
 		drm_dbg_kms(display->drm, "failed to alloc fb\n");
 		return;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index c34f41605b46..364941444a0a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -17,6 +17,7 @@
 #include "i915_vma_types.h"
 
 enum intel_region_id;
+struct intel_framebuffer;
 
 #define obj_to_i915(obj__) to_i915((obj__)->base.dev)
 
@@ -691,6 +692,7 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
 int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
 int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
 
+struct intel_framebuffer *i915_gem_object_alloc_framebuffer(void);
 /**
  * i915_gem_object_pin_map - return a contiguous mapping of the entire object
  * @obj: the object to map into kernel address space
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 7f83f8bdc8fb..10b84970f17f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -6,6 +6,7 @@
 #include <drm/drm_cache.h>
 #include <linux/vmalloc.h>
 
+#include "display/intel_display_types.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_tlb.h"
 
@@ -354,6 +355,27 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 	return vaddr ?: ERR_PTR(-ENOMEM);
 }
 
+struct i915_panic_data {
+	struct page **pages;
+	int page;
+	void *vaddr;
+};
+
+struct i915_framebuffer {
+	struct intel_framebuffer base;
+	struct i915_panic_data panic;
+};
+
+struct intel_framebuffer *i915_gem_object_alloc_framebuffer(void)
+{
+	struct i915_framebuffer *i915_fb;
+
+	i915_fb = kzalloc(sizeof(*i915_fb), GFP_KERNEL);
+	if (i915_fb)
+		return &i915_fb->base;
+	return NULL;
+}
+
 /* get, pin, and map the pages of the object into kernel space */
 void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 			      enum i915_map_type type)
diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 27437c22bd70..926fcd9c86e1 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -3,6 +3,8 @@
 
 #include <drm/drm_gem.h>
 
+#include "intel_display_types.h"
+
 #include "xe_bo.h"
 #include "intel_bo.h"
 
@@ -59,3 +61,25 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
 {
 	/* FIXME */
 }
+
+struct xe_panic_data {
+	struct page **pages;
+	int page;
+	void *vaddr;
+};
+
+struct xe_framebuffer {
+	struct intel_framebuffer base;
+	struct xe_panic_data panic;
+};
+
+struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
+{
+	struct xe_framebuffer *xe_fb;
+
+	xe_fb = kzalloc(sizeof(*xe_fb), GFP_KERNEL);
+	if (xe_fb)
+		return &xe_fb->base;
+	return NULL;
+}
+
-- 
2.49.0

