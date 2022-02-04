Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33984A9DFA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7141110E439;
	Fri,  4 Feb 2022 17:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC6910E8D4;
 Fri,  4 Feb 2022 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996710; x=1675532710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OdhmjoGH1RXYU3F60JRt/XNlVcYs+WAxjEpR6SbyasM=;
 b=fQEeFuNb58cKBk1nihkpmLqason7nkxwl2IU6FhYYtGfNW4N0RPJSYoL
 ORLNVOWfT3OBg7UbytKKxx+CfPQ6m49yp9hV4ScCiLuFIAj1E30dZ1Xmr
 b2I0G3hRV3SKp7MPyX8IVfmWtMQOiQwS7RFNcdvqcdrv4+L11lYHmYzIM
 Bp8zKCIE25uneKTdTRdPhePjhryOPLMBH3NazxryHN/pxYcC9Rv35dKyE
 NXQZHDsg4FYzxvQnYUZ//7F8RTpS2bGRfkMXXgddPmASHqnGpQKATdJJd
 t+GX6/+xeaS+/9+NH/Ec0d7+DBELpGOWOU4jrPRkt8FIaRh9NLZjAyKrG g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242172"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240796"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/19] drm/i915/gt: Add helper for shmem copy to iosys_map
Date: Fri,  4 Feb 2022 09:44:21 -0800
Message-Id: <20220204174436.830121-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204174436.830121-1-lucas.demarchi@intel.com>
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a variant of shmem_read() that takes a iosys_map pointer rather
than a plain pointer as argument. It's mostly a copy __shmem_rw() but
adapting the api and removing the write support since there's currently
only need to use iosys_map as destination.

Reworking __shmem_rw() to share the implementation was tempting, but
finding a good balance between reuse and clarity pushed towards a little
code duplication. Since the function is small, just add the similar
function with a copy/paste/adapt approach.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/shmem_utils.c | 33 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/shmem_utils.h |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 0683b27a3890..764adefdb4be 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -3,6 +3,7 @@
  * Copyright © 2020 Intel Corporation
  */
 
+#include <linux/iosys-map.h>
 #include <linux/mm.h>
 #include <linux/pagemap.h>
 #include <linux/shmem_fs.h>
@@ -123,6 +124,38 @@ static int __shmem_rw(struct file *file, loff_t off,
 	return 0;
 }
 
+int shmem_read_to_iosys_map(struct file *file, loff_t off,
+			    struct iosys_map *map, size_t len)
+{
+	struct iosys_map map_iter = *map;
+	unsigned long pfn;
+
+	for (pfn = off >> PAGE_SHIFT; len; pfn++) {
+		unsigned int this =
+			min_t(size_t, PAGE_SIZE - offset_in_page(off), len);
+		struct page *page;
+		void *vaddr;
+
+		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
+						   GFP_KERNEL);
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+
+		vaddr = kmap(page);
+		iosys_map_memcpy_to(&map_iter, 0, vaddr + offset_in_page(off),
+				    this);
+		mark_page_accessed(page);
+		kunmap(page);
+		put_page(page);
+
+		len -= this;
+		iosys_map_incr(&map_iter, this);
+		off = 0;
+	}
+
+	return 0;
+}
+
 int shmem_read(struct file *file, loff_t off, void *dst, size_t len)
 {
 	return __shmem_rw(file, off, dst, len, false);
diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.h b/drivers/gpu/drm/i915/gt/shmem_utils.h
index c1669170c351..e1784999faee 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.h
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct iosys_map;
 struct drm_i915_gem_object;
 struct file;
 
@@ -17,6 +18,8 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj);
 void *shmem_pin_map(struct file *file);
 void shmem_unpin_map(struct file *file, void *ptr);
 
+int shmem_read_to_iosys_map(struct file *file, loff_t off,
+			    struct iosys_map *map, size_t len);
 int shmem_read(struct file *file, loff_t off, void *dst, size_t len);
 int shmem_write(struct file *file, loff_t off, void *src, size_t len);
 
-- 
2.35.1

