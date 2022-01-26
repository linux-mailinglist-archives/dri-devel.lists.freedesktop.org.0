Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1663C49D393
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1920910E804;
	Wed, 26 Jan 2022 20:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17FB10E705;
 Wed, 26 Jan 2022 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229386; x=1674765386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N1JcWJhtFV0j9BhbtynUEaZW700UjalgFcxpWKXF3gk=;
 b=M/n68IcXFJMqbNUUrmJHpqaOSz2QPfnexO1p2vlpmNYR9/cDy9A5XQUV
 X6/1IdXW+QY4oXyOfdhg0VhmSCBO25iCNsB8yLUBPQo8VY0NB7a4nSNcE
 ycM5RYEtXgzfqHylXt2irsNFFWYAk8WF7Av3QMXQvDHLDLDwoWJ7eLLvw
 +HpyDrt0zkRECrlVruUlLrm3gN8fya4BsRvu4ps6InDmkljLGv/1D0cMY
 oNfUCPTGVyim+NYv+YuOcVncd/ugVTEErJn4wkUbayf5qeJq2N6WNA8Jj
 JUoqIHg/XXCnkMaUUyYUlSk3Tfc5/AF/w9r7PednvXrjtDdQcD7/cb2aW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000496"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000496"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221497"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/19] drm/i915/gt: Add helper for shmem copy to dma_buf_map
Date: Wed, 26 Jan 2022 12:36:46 -0800
Message-Id: <20220126203702.1784589-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220126203702.1784589-1-lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a variant of shmem_read() that takes a dma_buf_map pointer rather
than a plain pointer as argument. It's mostly a copy __shmem_rw() but
adapting the api and removing the write support since there's currently
only need to use dma_buf_map as destination.

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
 drivers/gpu/drm/i915/gt/shmem_utils.c | 32 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/shmem_utils.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 0683b27a3890..d7968e68ccfb 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -3,6 +3,7 @@
  * Copyright © 2020 Intel Corporation
  */
 
+#include <linux/dma-buf-map.h>
 #include <linux/mm.h>
 #include <linux/pagemap.h>
 #include <linux/shmem_fs.h>
@@ -123,6 +124,37 @@ static int __shmem_rw(struct file *file, loff_t off,
 	return 0;
 }
 
+int shmem_read_to_dma_buf_map(struct file *file, loff_t off,
+			      struct dma_buf_map *map, size_t len)
+{
+	struct dma_buf_map map_iter = *map;
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
+		dma_buf_map_memcpy_to(&map_iter, vaddr + offset_in_page(off), this);
+		mark_page_accessed(page);
+		kunmap(page);
+		put_page(page);
+
+		len -= this;
+		dma_buf_map_incr(&map_iter, this);
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
index c1669170c351..a3d4ce966f74 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.h
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct dma_buf_map;
 struct drm_i915_gem_object;
 struct file;
 
@@ -17,6 +18,8 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj);
 void *shmem_pin_map(struct file *file);
 void shmem_unpin_map(struct file *file, void *ptr);
 
+int shmem_read_to_dma_buf_map(struct file *file, loff_t off,
+			      struct dma_buf_map *map, size_t len);
 int shmem_read(struct file *file, loff_t off, void *dst, size_t len);
 int shmem_write(struct file *file, loff_t off, void *src, size_t len);
 
-- 
2.35.0

