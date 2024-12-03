Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B29E177E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD4710E9BA;
	Tue,  3 Dec 2024 09:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fAhnKBfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2872410E9B7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733218156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ln7QmybwS+wJD0e1iridJGR/UG992shbcYyS2kThagY=;
 b=fAhnKBfhrIp0EQnWMB1ud4gTRVmv0SNDLrDU3LhoVp7gHm+wkyaM68vahqq7H53XBQnUAK
 OMkpzvDVx9egQsLl2rriBnQRH9ynfudGnAyuLipoJ+LMCt4gNQQrJIhfiPv/9/isSiFIca
 mJnGw1lSEWxGdmplfL2GClXlVYMuR6s=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-Hb8pwYsuPdu_IXZygEPKHA-1; Tue,
 03 Dec 2024 04:29:13 -0500
X-MC-Unique: Hb8pwYsuPdu_IXZygEPKHA-1
X-Mimecast-MFC-AGG-ID: Hb8pwYsuPdu_IXZygEPKHA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D9B3719560BF; Tue,  3 Dec 2024 09:29:10 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.255])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C1A9919560A3; Tue,  3 Dec 2024 09:29:07 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 4/5] drm/i915/gem: Add i915_gem_object_panic_map()
Date: Tue,  3 Dec 2024 09:50:21 +0100
Message-ID: <20241203092836.426422-5-jfalempe@redhat.com>
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

Prepare the work for drm_panic support. This is used to map the
current framebuffer, so the CPU can overwrite it with the panic
message.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_bo.c    | 10 +++++++++
 drivers/gpu/drm/i915/display/intel_bo.h    |  2 ++
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 25 ++++++++++++++++++++++
 drivers/gpu/drm/xe/display/intel_bo.c      | 11 ++++++++++
 5 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
index fbd16d7b58d95..5eeb3ba827edf 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.c
+++ b/drivers/gpu/drm/i915/display/intel_bo.c
@@ -22,6 +22,11 @@ bool intel_bo_is_shmem(struct drm_gem_object *obj)
 	return i915_gem_object_is_shmem(to_intel_bo(obj));
 }
 
+bool intel_bo_has_iomem(struct drm_gem_object *obj)
+{
+	return i915_gem_object_has_iomem(to_intel_bo(obj));
+}
+
 bool intel_bo_is_protected(struct drm_gem_object *obj)
 {
 	return i915_gem_object_is_protected(to_intel_bo(obj));
@@ -57,3 +62,8 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
 {
 	i915_debugfs_describe_obj(m, to_intel_bo(obj));
 }
+
+void *intel_bo_panic_map(struct drm_gem_object *obj)
+{
+	return i915_gem_object_panic_map(to_intel_bo(obj));
+}
diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
index ea7a2253aaa57..0eb084955e9af 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.h
+++ b/drivers/gpu/drm/i915/display/intel_bo.h
@@ -13,6 +13,7 @@ struct vm_area_struct;
 bool intel_bo_is_tiled(struct drm_gem_object *obj);
 bool intel_bo_is_userptr(struct drm_gem_object *obj);
 bool intel_bo_is_shmem(struct drm_gem_object *obj);
+bool intel_bo_has_iomem(struct drm_gem_object *obj);
 bool intel_bo_is_protected(struct drm_gem_object *obj);
 void intel_bo_flush_if_display(struct drm_gem_object *obj);
 int intel_bo_fb_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
@@ -23,5 +24,6 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(struct drm_gem_object *obj,
 						   struct intel_frontbuffer *front);
 
 void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
+void *intel_bo_panic_map(struct drm_gem_object *obj);
 
 #endif /* __INTEL_BO__ */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 3dc61cbd2e11f..f85326a98aefc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -694,6 +694,8 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
 int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
 int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
 
+void *i915_gem_object_panic_map(struct drm_i915_gem_object *obj);
+
 /**
  * i915_gem_object_pin_map - return a contiguous mapping of the entire object
  * @obj: the object to map into kernel address space
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 8780aa2431053..07c33169603c9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -355,6 +355,31 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 	return vaddr ?: ERR_PTR(-ENOMEM);
 }
 
+/* Map the current framebuffer for CPU access. Called from panic handler, so no
+ * need to pin or cleanup.
+ */
+void *i915_gem_object_panic_map(struct drm_i915_gem_object *obj)
+{
+	enum i915_map_type has_type;
+	void *ptr;
+
+	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
+
+	if (ptr)
+		return ptr;
+
+	if (i915_gem_object_has_struct_page(obj))
+		ptr = i915_gem_object_map_page(obj, I915_MAP_WB);
+	else
+		ptr = i915_gem_object_map_pfn(obj, I915_MAP_WB);
+
+	if (IS_ERR(ptr))
+		return NULL;
+
+	obj->mm.mapping = page_pack_bits(ptr, I915_MAP_WB);
+	return ptr;
+}
+
 /* get, pin, and map the pages of the object into kernel space */
 void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 			      enum i915_map_type type)
diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 9f54fad0f1c0c..c05feeeec3806 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -23,6 +23,11 @@ bool intel_bo_is_shmem(struct drm_gem_object *obj)
 	return false;
 }
 
+bool intel_bo_has_iomem(struct drm_gem_object *obj)
+{
+	return false;
+}
+
 bool intel_bo_is_protected(struct drm_gem_object *obj)
 {
 	return false;
@@ -82,3 +87,9 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
 {
 	/* FIXME */
 }
+
+void *intel_bo_panic_map(struct drm_gem_object *obj)
+{
+	/* TODO: map the object so CPU can write the panic screen to it */
+	return NULL;
+}
-- 
2.47.1

