Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 746604B8F61
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D46410E6F9;
	Wed, 16 Feb 2022 17:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954D610E728;
 Wed, 16 Feb 2022 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033253; x=1676569253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rvXopUfjDpHc+wjPGTgErpvZjrynLNqAft6dbbSTJ8M=;
 b=U7vd3T6MgoZ2n4HSoDi3Xgg/jZX3tDt3VVNSiDK3yZMncGFYPeKflxXY
 EBT4ypdYxsSkLkXPQPLFBQDwd8QSkVJly5DKbChtGuk1/76Rh5PUuuQbY
 aEsVPAqg5D29383Bq3Ruu3N0PR/bUVR66MwvbS+ZRW0gqtCrBBpRtMgQo
 rBxKtefJkgjMtKSLmvU6mKW7pZx+XDkBL3w0qh5X7iF9puNw0SHJV5jw7
 KQcYAH3tzFfh2cNlxxSMqj5KL98PF5KUp7bBEKYK3aesad3lZ/vHsGWbf
 0L4MzusMn7uRHVtTaD3Kx762cw2qN7JuEFjTPFmER109tzpwS6gn73i35 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230641935"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230641935"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="540226609"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:52 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/16] drm/i915/gt: Add helper for shmem copy to iosys_map
Date: Wed, 16 Feb 2022 09:41:34 -0800
Message-Id: <20220216174147.3073235-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216174147.3073235-1-lucas.demarchi@intel.com>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
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
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matt Atwood <matthew.s.atwood@intel.com>,
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

v2: Add an offset as argument and instead of using a map iterator, use the
offset to keep track of where we are writing data to.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/i915/gt/shmem_utils.c | 32 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/shmem_utils.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 0683b27a3890..402f085f3a02 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -3,6 +3,7 @@
  * Copyright © 2020 Intel Corporation
  */
 
+#include <linux/iosys-map.h>
 #include <linux/mm.h>
 #include <linux/pagemap.h>
 #include <linux/shmem_fs.h>
@@ -123,6 +124,37 @@ static int __shmem_rw(struct file *file, loff_t off,
 	return 0;
 }
 
+int shmem_read_to_iosys_map(struct file *file, loff_t off,
+			    struct iosys_map *map, size_t map_off, size_t len)
+{
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
+		iosys_map_memcpy_to(map, map_off, vaddr + offset_in_page(off),
+				    this);
+		mark_page_accessed(page);
+		kunmap(page);
+		put_page(page);
+
+		len -= this;
+		map_off += this;
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
index c1669170c351..b2b04d88c6e5 100644
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
+			    struct iosys_map *map, size_t map_off, size_t len);
 int shmem_read(struct file *file, loff_t off, void *dst, size_t len);
 int shmem_write(struct file *file, loff_t off, void *src, size_t len);
 
-- 
2.35.1

