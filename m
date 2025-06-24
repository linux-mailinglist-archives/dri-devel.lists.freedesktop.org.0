Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46980AE607E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DE110E546;
	Tue, 24 Jun 2025 09:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ETPJTHXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7488610E546
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750756561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OmJwdacQ6VMJMEMU78KNPg5YPywi1AuSeiIZT3c5MpQ=;
 b=ETPJTHXwWix0lyjaRKx7d6j5UCIWUASRaRTBG3/GQwgNvyTyY8nd+Icw0R5cKadWPaKI2p
 CtRHMgd+P8yyZ3nsSrT4hkicZcHwRqpJLnZf8/rwjVQYHy/ZN8x3U0CEmx97pZWiVn+kXk
 PDjQF2pBEDw3jmh9BOddWsxNxdwq+08=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-lRT8G5F3No230-yl7McaPA-1; Tue,
 24 Jun 2025 05:15:57 -0400
X-MC-Unique: lRT8G5F3No230-yl7McaPA-1
X-Mimecast-MFC-AGG-ID: lRT8G5F3No230-yl7McaPA_1750756555
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 55D06180136B; Tue, 24 Jun 2025 09:15:55 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.209])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B2C4D18002B8; Tue, 24 Jun 2025 09:15:49 +0000 (UTC)
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
Subject: [PATCH v11 07/11] drm/i915: Add intel_bo_panic_setup() and
 intel_bo_panic_finish()
Date: Tue, 24 Jun 2025 11:01:16 +0200
Message-ID: <20250624091501.257661-8-jfalempe@redhat.com>
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

Implement both functions for i915 and xe, they prepare the work for
drm_panic support.
They both use kmap_try_from_panic(), and map one page at a time, to
write the panic screen on the framebuffer.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v5:
 * Use iosys_map for intel_bo_panic_map().

v7:
 * Return int for i915_gem_object_panic_map() (Ville Syrjälä)

v8:
 * Complete rewrite, to use kmap_try_from_panic() which is safe
   to call from a panic handler.

v9:
 * Fix missing kfree() for i915_panic_pages in i915_gem_object_panic_finish()
   Also change i915_panic_pages allocation to kmalloc, as kvmalloc is not
   safe to call from the panic handler.

v10:
 * Replace static variables with new fields in struct intel_framebuffer
   (Maarten Lankhorst)
 * Add error handling if i915_gem_object_panic_pages() returns NULL
 * Declare struct drm_scanout_buffer instead of including <drm/drm_panic.h>
   in intel_bo.h

v11:
 * Use struct i915_framebuffer and xe_framebuffer

 drivers/gpu/drm/i915/display/intel_bo.c    |  11 +++
 drivers/gpu/drm/i915/display/intel_bo.h    |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 106 +++++++++++++++++++++
 drivers/gpu/drm/xe/display/intel_bo.c      |  64 +++++++++++++
 5 files changed, 188 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
index bcf2eded7469..65d64f79a4bd 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.c
+++ b/drivers/gpu/drm/i915/display/intel_bo.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 /* Copyright © 2024 Intel Corporation */
 
+#include <drm/drm_panic.h>
 #include "display/intel_display_types.h"
 #include "gem/i915_gem_mman.h"
 #include "gem/i915_gem_object.h"
@@ -63,3 +64,13 @@ struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
 {
 	return i915_gem_object_alloc_framebuffer();
 }
+
+int intel_bo_panic_setup(struct drm_scanout_buffer *sb)
+{
+	return i915_gem_object_panic_setup(sb);
+}
+
+void intel_bo_panic_finish(struct intel_framebuffer *fb)
+{
+	return i915_gem_object_panic_finish(fb);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
index 315a81768c73..97087a64d23b 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.h
+++ b/drivers/gpu/drm/i915/display/intel_bo.h
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 
 struct drm_gem_object;
+struct drm_scanout_buffer;
 struct intel_framebuffer;
 struct seq_file;
 struct vm_area_struct;
@@ -25,5 +26,7 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(struct drm_gem_object *obj,
 
 void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
 struct intel_framebuffer *intel_bo_alloc_framebuffer(void);
+int intel_bo_panic_setup(struct drm_scanout_buffer *sb);
+void intel_bo_panic_finish(struct intel_framebuffer *fb);
 
 #endif /* __INTEL_BO__ */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 364941444a0a..565f8fa330db 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -16,6 +16,7 @@
 #include "i915_gem_ww.h"
 #include "i915_vma_types.h"
 
+struct drm_scanout_buffer;
 enum intel_region_id;
 struct intel_framebuffer;
 
@@ -693,6 +694,9 @@ int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
 int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
 
 struct intel_framebuffer *i915_gem_object_alloc_framebuffer(void);
+int i915_gem_object_panic_setup(struct drm_scanout_buffer *sb);
+void i915_gem_object_panic_finish(struct intel_framebuffer *fb);
+
 /**
  * i915_gem_object_pin_map - return a contiguous mapping of the entire object
  * @obj: the object to map into kernel address space
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 10b84970f17f..91c7549e6ff2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -4,8 +4,10 @@
  */
 
 #include <drm/drm_cache.h>
+#include <drm/drm_panic.h>
 #include <linux/vmalloc.h>
 
+#include "display/intel_fb.h"
 #include "display/intel_display_types.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_tlb.h"
@@ -366,6 +368,67 @@ struct i915_framebuffer {
 	struct i915_panic_data panic;
 };
 
+static inline struct i915_panic_data *to_i915_panic_data(struct intel_framebuffer *fb)
+{
+	return &container_of_const(fb, struct i915_framebuffer, base)->panic;
+}
+
+static void i915_panic_kunmap(struct i915_panic_data *panic)
+{
+	if (panic->vaddr) {
+		drm_clflush_virt_range(panic->vaddr, PAGE_SIZE);
+		kunmap_local(panic->vaddr);
+		panic->vaddr = NULL;
+	}
+}
+
+static struct page **i915_gem_object_panic_pages(struct drm_i915_gem_object *obj)
+{
+	unsigned long n_pages = obj->base.size >> PAGE_SHIFT, i;
+	struct page *page;
+	struct page **pages;
+	struct sgt_iter iter;
+
+	/* For a 3840x2160 32 bits Framebuffer, this should require ~64K */
+	pages = kmalloc_array(n_pages, sizeof(*pages), GFP_ATOMIC);
+	if (!pages)
+		return NULL;
+
+	i = 0;
+	for_each_sgt_page(page, iter, obj->mm.pages)
+		pages[i++] = page;
+	return pages;
+}
+
+/*
+ * The scanout buffer pages are not mapped, so for each pixel,
+ * use kmap_local_page_try_from_panic() to map the page, and write the pixel.
+ * Try to keep the map from the previous pixel, to avoid too much map/unmap.
+ */
+static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
+						 unsigned int y, u32 color)
+{
+	unsigned int new_page;
+	unsigned int offset;
+	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
+	struct i915_panic_data *panic = to_i915_panic_data(fb);
+
+	offset = y * sb->pitch[0] + x * sb->format->cpp[0];
+
+	new_page = offset >> PAGE_SHIFT;
+	offset = offset % PAGE_SIZE;
+	if (new_page != panic->page) {
+		i915_panic_kunmap(panic);
+		panic->page = new_page;
+		panic->vaddr =
+			kmap_local_page_try_from_panic(panic->pages[panic->page]);
+	}
+	if (panic->vaddr) {
+		u32 *pix = panic->vaddr + offset;
+		*pix = color;
+	}
+}
+
 struct intel_framebuffer *i915_gem_object_alloc_framebuffer(void)
 {
 	struct i915_framebuffer *i915_fb;
@@ -376,6 +439,49 @@ struct intel_framebuffer *i915_gem_object_alloc_framebuffer(void)
 	return NULL;
 }
 
+/*
+ * Setup the gem framebuffer for drm_panic access.
+ * Use current vaddr if it exists, or setup a list of pages.
+ * pfn is not supported yet.
+ */
+int i915_gem_object_panic_setup(struct drm_scanout_buffer *sb)
+{
+	enum i915_map_type has_type;
+	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
+	struct i915_panic_data *panic = to_i915_panic_data(fb);
+	struct drm_i915_gem_object *obj = to_intel_bo(intel_fb_bo(&fb->base));
+	void *ptr;
+
+	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
+	if (ptr) {
+		if (i915_gem_object_has_iomem(obj))
+			iosys_map_set_vaddr_iomem(&sb->map[0], (void __iomem *)ptr);
+		else
+			iosys_map_set_vaddr(&sb->map[0], ptr);
+
+		return 0;
+	}
+	if (i915_gem_object_has_struct_page(obj)) {
+		panic->pages = i915_gem_object_panic_pages(obj);
+		if (!panic->pages)
+			return -ENOMEM;
+		panic->page = -1;
+		sb->set_pixel = i915_gem_object_panic_page_set_pixel;
+		return 0;
+	}
+	return -EOPNOTSUPP;
+}
+
+void i915_gem_object_panic_finish(struct intel_framebuffer *fb)
+{
+	struct i915_panic_data *panic = to_i915_panic_data(fb);
+
+	i915_panic_kunmap(panic);
+	panic->page = -1;
+	kfree(panic->pages);
+	panic->pages = NULL;
+}
+
 /* get, pin, and map the pages of the object into kernel space */
 void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 			      enum i915_map_type type)
diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 926fcd9c86e1..bbb504f8e242 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -1,8 +1,11 @@
 // SPDX-License-Identifier: MIT
 /* Copyright © 2024 Intel Corporation */
 
+#include <drm/drm_cache.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_panic.h>
 
+#include "intel_fb.h"
 #include "intel_display_types.h"
 
 #include "xe_bo.h"
@@ -73,6 +76,50 @@ struct xe_framebuffer {
 	struct xe_panic_data panic;
 };
 
+static inline struct xe_panic_data *to_xe_panic_data(struct intel_framebuffer *fb)
+{
+	return &container_of_const(fb, struct xe_framebuffer, base)->panic;
+}
+
+static void xe_panic_kunmap(struct xe_panic_data *panic)
+{
+	if (panic->vaddr) {
+		drm_clflush_virt_range(panic->vaddr, PAGE_SIZE);
+		kunmap_local(panic->vaddr);
+		panic->vaddr = NULL;
+	}
+}
+
+/*
+ * The scanout buffer pages are not mapped, so for each pixel,
+ * use kmap_local_page_try_from_panic() to map the page, and write the pixel.
+ * Try to keep the map from the previous pixel, to avoid too much map/unmap.
+ */
+static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
+				    unsigned int y, u32 color)
+{
+	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
+	struct xe_panic_data *panic = to_xe_panic_data(fb);
+	struct xe_bo *bo = gem_to_xe_bo(intel_fb_bo(&fb->base));
+	unsigned int new_page;
+	unsigned int offset;
+
+	offset = y * sb->pitch[0] + x * sb->format->cpp[0];
+
+	new_page = offset >> PAGE_SHIFT;
+	offset = offset % PAGE_SIZE;
+	if (new_page != panic->page) {
+		xe_panic_kunmap(panic);
+		panic->page = new_page;
+		panic->vaddr = ttm_bo_kmap_try_from_panic(&bo->ttm,
+							  panic->page);
+	}
+	if (panic->vaddr) {
+		u32 *pix = panic->vaddr + offset;
+		*pix = color;
+	}
+}
+
 struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
 {
 	struct xe_framebuffer *xe_fb;
@@ -83,3 +130,20 @@ struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
 	return NULL;
 }
 
+int intel_bo_panic_setup(struct drm_scanout_buffer *sb)
+{
+	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
+	struct xe_panic_data *panic = to_xe_panic_data(fb);
+
+	panic->page = -1;
+	sb->set_pixel = xe_panic_page_set_pixel;
+	return 0;
+}
+
+void intel_bo_panic_finish(struct intel_framebuffer *fb)
+{
+	struct xe_panic_data *panic = to_xe_panic_data(fb);
+
+	xe_panic_kunmap(panic);
+	panic->page = -1;
+}
-- 
2.49.0

