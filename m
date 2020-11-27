Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F3A2C6559
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A18B6ED12;
	Fri, 27 Nov 2020 12:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7161F6ED0A;
 Fri, 27 Nov 2020 12:11:40 +0000 (UTC)
IronPort-SDR: NpsedXbtv7EhOmQdizwM9koqXefBgYE6JSzsG5A8YTpvt6AEK0f5UAzTyWner4xRnRTVB5J3JX
 WGbWPTkN9PeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092925"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092925"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:40 -0800
IronPort-SDR: zwZIY3e7LFH9/uAJPXoWvuSPoeWwcpKsFY9QttpVVE+5cV9Tm5G6KkywK887DstJzeRFkO7wFn
 mLi9py2S0+eQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029849"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:38 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 129/162] drm/i915/dg1: i915_gem_object_memcpy(..)
 infrastructure
Date: Fri, 27 Nov 2020 12:06:45 +0000
Message-Id: <20201127120718.454037-130-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

i915_gem_object_memcpy() will copy the pages from source object
to destination object by using memcpy. If source and destination
are not the same size, copy the smaller pages.

Using pread/pwrite mechanism to do the page read/write.

Signed-off-by: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 151 +++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h |   2 +
 2 files changed, 153 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 89b530841126..65690e3bf648 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -30,11 +30,13 @@
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
 #include "i915_gem_context.h"
+#include "i915_gem_lmem.h"
 #include "i915_gem_mman.h"
 #include "i915_gem_object.h"
 #include "i915_gem_object_blt.h"
 #include "i915_gem_region.h"
 #include "i915_globals.h"
+#include "i915_memcpy.h"
 #include "i915_trace.h"
 
 static struct i915_global_object {
@@ -449,6 +451,155 @@ int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
 	return err;
 }
 
+struct object_memcpy_info {
+	struct drm_i915_gem_object *obj;
+	intel_wakeref_t wakeref;
+	bool write;
+	int clflush;
+	struct page *page;
+	void *vaddr;
+	void *(*get_vaddr)(struct object_memcpy_info *info,
+			   unsigned long idx);
+	void (*put_vaddr)(struct object_memcpy_info *info);
+};
+
+static
+void *lmem_get_vaddr(struct object_memcpy_info *info, unsigned long idx)
+{
+	info->vaddr = i915_gem_object_lmem_io_map_page(info->obj, idx);
+	return info->vaddr;
+}
+
+static
+void lmem_put_vaddr(struct object_memcpy_info *info)
+{
+	io_mapping_unmap(info->vaddr);
+}
+
+static
+void *smem_get_vaddr(struct object_memcpy_info *info, unsigned long idx)
+{
+	info->page = i915_gem_object_get_page(info->obj, (unsigned int)idx);
+	info->vaddr = kmap(info->page);
+	if (info->clflush & CLFLUSH_BEFORE)
+		drm_clflush_virt_range(info->vaddr, PAGE_SIZE);
+	return info->vaddr;
+}
+
+static
+void smem_put_vaddr(struct object_memcpy_info *info)
+{
+	if (info->clflush & CLFLUSH_AFTER)
+		drm_clflush_virt_range(info->vaddr, PAGE_SIZE);
+	kunmap(info->page);
+}
+
+static int
+i915_gem_object_prepare_memcpy(struct drm_i915_gem_object *obj,
+			       struct object_memcpy_info *info,
+			       bool write)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	int ret;
+
+	assert_object_held(obj);
+	ret = i915_gem_object_wait(obj,
+				   I915_WAIT_INTERRUPTIBLE,
+				   MAX_SCHEDULE_TIMEOUT);
+	if (ret)
+		return ret;
+
+	ret = i915_gem_object_pin_pages(obj);
+	if (ret)
+		return ret;
+
+	if (i915_gem_object_is_lmem(obj)) {
+		ret = i915_gem_object_set_to_wc_domain(obj, write);
+		if (!ret) {
+			info->wakeref =
+				intel_runtime_pm_get(&i915->runtime_pm);
+			info->get_vaddr = lmem_get_vaddr;
+			info->put_vaddr = lmem_put_vaddr;
+		}
+	} else {
+		if (write)
+			ret = i915_gem_object_prepare_write(obj,
+							    &info->clflush);
+		else
+			ret = i915_gem_object_prepare_read(obj,
+							   &info->clflush);
+
+		if (!ret) {
+			i915_gem_object_finish_access(obj);
+			info->get_vaddr = smem_get_vaddr;
+			info->put_vaddr = smem_put_vaddr;
+		}
+	}
+
+	if (!ret) {
+		info->obj = obj;
+		info->write = write;
+	} else {
+		i915_gem_object_unpin_pages(obj);
+	}
+
+	return ret;
+}
+
+static void
+i915_gem_object_finish_memcpy(struct object_memcpy_info *info)
+{
+	struct drm_i915_private *i915 = to_i915(info->obj->base.dev);
+
+	if (i915_gem_object_is_lmem(info->obj)) {
+		intel_runtime_pm_put(&i915->runtime_pm, info->wakeref);
+	} else {
+		if (info->write) {
+			i915_gem_object_flush_frontbuffer(info->obj,
+							  ORIGIN_CPU);
+			info->obj->mm.dirty = true;
+		}
+	}
+	i915_gem_object_unpin_pages(info->obj);
+}
+
+int i915_gem_object_memcpy(struct drm_i915_gem_object *dst,
+			   struct drm_i915_gem_object *src)
+{
+	struct object_memcpy_info sinfo, dinfo;
+	void *svaddr, *dvaddr;
+	unsigned long npages;
+	int i, ret;
+
+	ret = i915_gem_object_prepare_memcpy(src, &sinfo, false);
+	if (ret)
+		return ret;
+
+	ret = i915_gem_object_prepare_memcpy(dst, &dinfo, true);
+	if (ret)
+		goto finish_src;
+
+	npages = src->base.size / PAGE_SIZE;
+	for (i = 0; i < npages; i++) {
+		svaddr = sinfo.get_vaddr(&sinfo, i);
+		dvaddr = dinfo.get_vaddr(&dinfo, i);
+
+		/* a performance optimization */
+		if (!i915_gem_object_is_lmem(src) ||
+		    !i915_memcpy_from_wc(dvaddr, svaddr, PAGE_SIZE))
+			memcpy(dvaddr, svaddr, PAGE_SIZE);
+
+		dinfo.put_vaddr(&dinfo);
+		sinfo.put_vaddr(&sinfo);
+	}
+
+	i915_gem_object_finish_memcpy(&dinfo);
+finish_src:
+	i915_gem_object_finish_memcpy(&sinfo);
+
+	return ret;
+}
+
 static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 {
 	return !(obj->cache_level == I915_CACHE_NONE ||
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 1a1aa71a4494..175258106642 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -57,6 +57,8 @@ int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
 			    struct i915_gem_ww_ctx *ww,
 			    struct intel_context *ce,
 			    enum intel_region_id id);
+int i915_gem_object_memcpy(struct drm_i915_gem_object *dst,
+			   struct drm_i915_gem_object *src);
 
 void i915_gem_flush_free_objects(struct drm_i915_private *i915);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
