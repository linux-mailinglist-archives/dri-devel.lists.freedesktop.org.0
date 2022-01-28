Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C111849F54A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886B01123A1;
	Fri, 28 Jan 2022 08:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E47112382;
 Fri, 28 Jan 2022 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358982; x=1674894982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LpsaWrEIBoj/K/IOLk0N+aujJU8LhhzxyAjfqGHu7Ls=;
 b=UFIayBclnVB1IC/ZZoAf5PamBkC7U/VfrwO8HOikCa+0PGw9Y8QI9oIG
 6AiLZTiL6YRbA03JkUFLvVoLKkM4fV847piE6a6uyiZObUO5MNtVAwgu3
 eNq/zOoQVLx6LBUP97n0g1H7vCwUrtOQUNy+0yWsXn3djIYMjHzh4guX0
 BuG9xdrsvjlJRD0jHk79EiTPkzCvO6CW4NPVwjgzBMhR7HZnjfDS7sXup
 xJj1OeTlkQtERYZVSzEih856kCcVc8Ctyy/XV3biwcqfdBHOfdpb2JbUp
 aY6O7s2fo7RUcdIsJEoxhdqeA0/qVJ2kwGLs1f3trsfyABVsKkXOaPDIT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227056612"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="227056612"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788772"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:18 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/14] dma-buf-map: Remove API in favor of iosys-map
Date: Fri, 28 Jan 2022 00:36:26 -0800
Message-Id: <20220128083626.3012259-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All users are now converted to iosys-map, which is the renamed version
of dma-buf-map. Remove remaining references to dma-buf-map.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 MAINTAINERS                 |   1 -
 include/linux/dma-buf-map.h | 269 ------------------------------------
 include/linux/iosys-map.h   |  11 +-
 3 files changed, 7 insertions(+), 274 deletions(-)
 delete mode 100644 include/linux/dma-buf-map.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 27ebaded85f8..b1d0b180515f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5733,7 +5733,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/driver-api/dma-buf.rst
 F:	drivers/dma-buf/
 F:	include/linux/*fence.h
-F:	include/linux/dma-buf*
 F:	include/linux/iosys-map.h
 F:	include/linux/dma-resv.h
 K:	\bdma_(?:buf|fence|resv)\b
diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
deleted file mode 100644
index 4b4b2930660b..000000000000
--- a/include/linux/dma-buf-map.h
+++ /dev/null
@@ -1,269 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Pointer to dma-buf-mapped memory, plus helpers.
- */
-
-#ifndef __DMA_BUF_MAP_H__
-#define __DMA_BUF_MAP_H__
-
-#include <linux/io.h>
-#include <linux/string.h>
-
-/**
- * DOC: overview
- *
- * Calling dma-buf's vmap operation returns a pointer to the buffer's memory.
- * Depending on the location of the buffer, users may have to access it with
- * I/O operations or memory load/store operations. For example, copying to
- * system memory could be done with memcpy(), copying to I/O memory would be
- * done with memcpy_toio().
- *
- * .. code-block:: c
- *
- *	void *vaddr = ...; // pointer to system memory
- *	memcpy(vaddr, src, len);
- *
- *	void *vaddr_iomem = ...; // pointer to I/O memory
- *	memcpy_toio(vaddr, _iomem, src, len);
- *
- * When using dma-buf's vmap operation, the returned pointer is encoded as
- * :c:type:`struct dma_buf_map <dma_buf_map>`.
- * :c:type:`struct dma_buf_map <dma_buf_map>` stores the buffer's address in
- * system or I/O memory and a flag that signals the required method of
- * accessing the buffer. Use the returned instance and the helper functions
- * to access the buffer's memory in the correct way.
- *
- * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
- * actually independent from the dma-buf infrastructure. When sharing buffers
- * among devices, drivers have to know the location of the memory to access
- * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
- * solves this problem for dma-buf and its users. If other drivers or
- * sub-systems require similar functionality, the type could be generalized
- * and moved to a more prominent header file.
- *
- * Open-coding access to :c:type:`struct dma_buf_map <dma_buf_map>` is
- * considered bad style. Rather then accessing its fields directly, use one
- * of the provided helper functions, or implement your own. For example,
- * instances of :c:type:`struct dma_buf_map <dma_buf_map>` can be initialized
- * statically with DMA_BUF_MAP_INIT_VADDR(), or at runtime with
- * dma_buf_map_set_vaddr(). These helpers will set an address in system memory.
- *
- * .. code-block:: c
- *
- *	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(0xdeadbeaf);
- *
- *	dma_buf_map_set_vaddr(&map, 0xdeadbeaf);
- *
- * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
- *
- * .. code-block:: c
- *
- *	dma_buf_map_set_vaddr_iomem(&map, 0xdeadbeaf);
- *
- * Instances of struct dma_buf_map do not have to be cleaned up, but
- * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
- * always refer to system memory.
- *
- * .. code-block:: c
- *
- *	dma_buf_map_clear(&map);
- *
- * Test if a mapping is valid with either dma_buf_map_is_set() or
- * dma_buf_map_is_null().
- *
- * .. code-block:: c
- *
- *	if (dma_buf_map_is_set(&map) != dma_buf_map_is_null(&map))
- *		// always true
- *
- * Instances of :c:type:`struct dma_buf_map <dma_buf_map>` can be compared
- * for equality with dma_buf_map_is_equal(). Mappings the point to different
- * memory spaces, system or I/O, are never equal. That's even true if both
- * spaces are located in the same address space, both mappings contain the
- * same address value, or both mappings refer to NULL.
- *
- * .. code-block:: c
- *
- *	struct dma_buf_map sys_map; // refers to system memory
- *	struct dma_buf_map io_map; // refers to I/O memory
- *
- *	if (dma_buf_map_is_equal(&sys_map, &io_map))
- *		// always false
- *
- * A set up instance of struct dma_buf_map can be used to access or manipulate
- * the buffer memory. Depending on the location of the memory, the provided
- * helpers will pick the correct operations. Data can be copied into the memory
- * with dma_buf_map_memcpy_to(). The address can be manipulated with
- * dma_buf_map_incr().
- *
- * .. code-block:: c
- *
- *	const void *src = ...; // source buffer
- *	size_t len = ...; // length of src
- *
- *	dma_buf_map_memcpy_to(&map, src, len);
- *	dma_buf_map_incr(&map, len); // go to first byte after the memcpy
- */
-
-/**
- * struct dma_buf_map - Pointer to vmap'ed dma-buf memory.
- * @vaddr_iomem:	The buffer's address if in I/O memory
- * @vaddr:		The buffer's address if in system memory
- * @is_iomem:		True if the dma-buf memory is located in I/O
- *			memory, or false otherwise.
- */
-struct dma_buf_map {
-	union {
-		void __iomem *vaddr_iomem;
-		void *vaddr;
-	};
-	bool is_iomem;
-};
-
-/**
- * DMA_BUF_MAP_INIT_VADDR - Initializes struct dma_buf_map to an address in system memory
- * @vaddr_:	A system-memory address
- */
-#define DMA_BUF_MAP_INIT_VADDR(vaddr_) \
-	{ \
-		.vaddr = (vaddr_), \
-		.is_iomem = false, \
-	}
-
-/**
- * dma_buf_map_set_vaddr - Sets a dma-buf mapping structure to an address in system memory
- * @map:	The dma-buf mapping structure
- * @vaddr:	A system-memory address
- *
- * Sets the address and clears the I/O-memory flag.
- */
-static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, void *vaddr)
-{
-	map->vaddr = vaddr;
-	map->is_iomem = false;
-}
-
-/**
- * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to an address in I/O memory
- * @map:		The dma-buf mapping structure
- * @vaddr_iomem:	An I/O-memory address
- *
- * Sets the address and the I/O-memory flag.
- */
-static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
-					       void __iomem *vaddr_iomem)
-{
-	map->vaddr_iomem = vaddr_iomem;
-	map->is_iomem = true;
-}
-
-/**
- * dma_buf_map_is_equal - Compares two dma-buf mapping structures for equality
- * @lhs:	The dma-buf mapping structure
- * @rhs:	A dma-buf mapping structure to compare with
- *
- * Two dma-buf mapping structures are equal if they both refer to the same type of memory
- * and to the same address within that memory.
- *
- * Returns:
- * True is both structures are equal, or false otherwise.
- */
-static inline bool dma_buf_map_is_equal(const struct dma_buf_map *lhs,
-					const struct dma_buf_map *rhs)
-{
-	if (lhs->is_iomem != rhs->is_iomem)
-		return false;
-	else if (lhs->is_iomem)
-		return lhs->vaddr_iomem == rhs->vaddr_iomem;
-	else
-		return lhs->vaddr == rhs->vaddr;
-}
-
-/**
- * dma_buf_map_is_null - Tests for a dma-buf mapping to be NULL
- * @map:	The dma-buf mapping structure
- *
- * Depending on the state of struct dma_buf_map.is_iomem, tests if the
- * mapping is NULL.
- *
- * Returns:
- * True if the mapping is NULL, or false otherwise.
- */
-static inline bool dma_buf_map_is_null(const struct dma_buf_map *map)
-{
-	if (map->is_iomem)
-		return !map->vaddr_iomem;
-	return !map->vaddr;
-}
-
-/**
- * dma_buf_map_is_set - Tests is the dma-buf mapping has been set
- * @map:	The dma-buf mapping structure
- *
- * Depending on the state of struct dma_buf_map.is_iomem, tests if the
- * mapping has been set.
- *
- * Returns:
- * True if the mapping is been set, or false otherwise.
- */
-static inline bool dma_buf_map_is_set(const struct dma_buf_map *map)
-{
-	return !dma_buf_map_is_null(map);
-}
-
-/**
- * dma_buf_map_clear - Clears a dma-buf mapping structure
- * @map:	The dma-buf mapping structure
- *
- * Clears all fields to zero; including struct dma_buf_map.is_iomem. So
- * mapping structures that were set to point to I/O memory are reset for
- * system memory. Pointers are cleared to NULL. This is the default.
- */
-static inline void dma_buf_map_clear(struct dma_buf_map *map)
-{
-	if (map->is_iomem) {
-		map->vaddr_iomem = NULL;
-		map->is_iomem = false;
-	} else {
-		map->vaddr = NULL;
-	}
-}
-
-/**
- * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
- * @dst:	The dma-buf mapping structure
- * @src:	The source buffer
- * @len:	The number of byte in src
- *
- * Copies data into a dma-buf mapping. The source buffer is in system
- * memory. Depending on the buffer's location, the helper picks the correct
- * method of accessing the memory.
- */
-static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
-{
-	if (dst->is_iomem)
-		memcpy_toio(dst->vaddr_iomem, src, len);
-	else
-		memcpy(dst->vaddr, src, len);
-}
-
-/**
- * dma_buf_map_incr - Increments the address stored in a dma-buf mapping
- * @map:	The dma-buf mapping structure
- * @incr:	The number of bytes to increment
- *
- * Increments the address stored in a dma-buf mapping. Depending on the
- * buffer's location, the correct value will be updated.
- */
-static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
-{
-	if (map->is_iomem)
-		map->vaddr_iomem += incr;
-	else
-		map->vaddr += incr;
-}
-
-/* Temporary include for API migration */
-#include <linux/iosys-map.h>
-
-#endif /* __DMA_BUF_MAP_H__ */
diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index ad1f08f8f97f..46b13eab4454 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -9,9 +9,6 @@
 #include <linux/io.h>
 #include <linux/string.h>
 
-/* Temporary include while user of dma-buf-map are converted to iosys-map */
-#include <linux/dma-buf-map.h>
-
 /**
  * DOC: overview
  *
@@ -105,7 +102,13 @@
  * @is_iomem:		True if the buffer is located in I/O memory, or false
  *			otherwise.
  */
-#define iosys_map dma_buf_map
+struct iosys_map {
+	union {
+		void __iomem *vaddr_iomem;
+		void *vaddr;
+	};
+	bool is_iomem;
+};
 
 /**
  * IOSYS_MAP_INIT_VADDR - Initializes struct iosys_map to an address in system memory
-- 
2.35.0

