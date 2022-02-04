Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EB64A9DF8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6ACC10EEEC;
	Fri,  4 Feb 2022 17:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3DB10E8C5;
 Fri,  4 Feb 2022 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996710; x=1675532710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ETlEkJotXscY1acR0RRNJRgVVqgQwciPhVqY20Tn/w=;
 b=ZPgz1ng2mkIgpeLoGS0i46+9wt0WMWlIdmk7wEL5f7K0sQAvlAHKspeV
 iRDB5ZI9WgWzP2PTAM1Ru4EkSTrPL5laCuaZbIjGYa8Lunetko395BO7a
 0XM0catD2P73eIwOE49v5UKn4jqTM74/e2bRlyjUVF3ZoWZVhu8qD4rkz
 jV3dooJItgVWKlSetoInv0QI/0x5EcUtNWmTOwU+gUy7YPU8l+nf/fH/f
 pZw5j98fC8Tg/M+uF45pdbZz8QvWJ84osEUP+1TsYWF1iTxxSDuzZOe6D
 kbFy3YbBAqscNHsQlAtAssG4Yd0LPEBx8G7Rfb7vMQgIRH2EgqXDTohfj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242171"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242171"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240793"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/19] iosys-map: Add a few more helpers
Date: Fri,  4 Feb 2022 09:44:20 -0800
Message-Id: <20220204174436.830121-4-lucas.demarchi@intel.com>
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
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First the simplest ones:

	- iosys_map_memset(): when abstracting system and I/O memory,
	  just like the memcpy() use case, memset() also has dedicated
	  functions to be called for using IO memory.
	- iosys_map_memcpy_from(): we may need to copy data from I/O
	  memory, not only to.

In certain situations it's useful to be able to read or write to an
offset that is calculated by having the memory layout given by a struct
declaration. Usually we are going to read/write a u8, u16, u32 or u64.

As a pre-requisite for the implementation, add iosys_map_memcpy_from()
to be the equivalent of iosys_map_memcpy_to(), but in the other
direction. Then add 2 pairs of macros:

	- iosys_map_rd() / iosys_map_wr()
	- iosys_map_rd_field() / iosys_map_wr_field()

The first pair takes the C-type and offset to read/write. The second
pair uses a struct describing the layout of the mapping in order to
calculate the offset and size being read/written.

We could use readb, readw, readl, readq and the write* counterparts,
however due to alignment issues this may not work on all architectures.
If alignment needs to be checked to call the right function, it's not
possible to decide at compile-time which function to call: so just leave
the decision to the memcpy function that will do exactly that.

Finally, in order to use the above macros with a map derived from
another, add another initializer: IOSYS_MAP_INIT_OFFSET().

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/iosys-map.h | 154 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 153 insertions(+), 1 deletion(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index edd7fa3be9e9..96f8b61ac6fb 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -6,6 +6,7 @@
 #ifndef __IOSYS_MAP_H__
 #define __IOSYS_MAP_H__
 
+#include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/string.h>
 
@@ -133,6 +134,45 @@ static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
 	map->is_iomem = false;
 }
 
+/**
+ * IOSYS_MAP_INIT_OFFSET - Initializes struct iosys_map from another iosys_map
+ * @map_:	The dma-buf mapping structure to copy from
+ * @offset_:	Offset to add to the other mapping
+ *
+ * Initializes a new iosys_map struct based on another passed as argument. It
+ * does a shallow copy of the struct so it's possible to update the back storage
+ * without changing where the original map points to. It is the equivalent of
+ * doing:
+ *
+ * .. code-block: c
+ *
+ *	iosys_map map = other_map;
+ *	iosys_map_incr(&map, &offset);
+ *
+ * Example usage:
+ *
+ * .. code-block: c
+ *
+ *	void foo(struct device *dev, struct iosys_map *base_map)
+ *	{
+ *		...
+ *		struct iosys_map map = IOSYS_MAP_INIT_OFFSET(base_map, FIELD_OFFSET);
+ *		...
+ *	}
+ *
+ * The advantage of using the initializer over just increasing the offset with
+ * ``iosys_map_incr()`` like above is that the new map will always point to the
+ * right place of the buffer during  its scope. It reduces the risk of updating
+ * the wrong part of the buffer and having no compiler warning about that. If
+ * the assignment to IOSYS_MAP_INIT_OFFSET() is forgotten, the compiler can warn
+ * using a uninitialized variable.
+ */
+#define IOSYS_MAP_INIT_OFFSET(map_, offset_)	(struct iosys_map)	\
+	{								\
+		.vaddr = (map_)->vaddr + (offset_),			\
+		.is_iomem = (map_)->is_iomem,				\
+	}
+
 /**
  * iosys_map_set_vaddr_iomem - Sets a iosys mapping structure to an address in I/O memory
  * @map:		The iosys_map structure
@@ -220,7 +260,7 @@ static inline void iosys_map_clear(struct iosys_map *map)
 }
 
 /**
- * iosys_map_memcpy_to_offset - Memcpy into offset of iosys_map
+ * iosys_map_memcpy_to - Memcpy into iosys_map
  * @dst:	The iosys_map structure
  * @dst_offset:	The offset from which to copy
  * @src:	The source buffer
@@ -239,6 +279,26 @@ static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
 		memcpy(dst->vaddr + dst_offset, src, len);
 }
 
+/**
+ * iosys_map_memcpy_from - Memcpy from iosys_map into system memory
+ * @dst:	Destination in system memory
+ * @src:	The iosys_map structure
+ * @src_offset:	The offset from which to copy
+ * @len:	The number of byte in src
+ *
+ * Copies data from a iosys_map with an offset. The dest buffer is in
+ * system memory. Depending on the mapping location, the helper picks the
+ * correct method of accessing the memory.
+ */
+static inline void iosys_map_memcpy_from(void *dst, const struct iosys_map *src,
+					 size_t src_offset, size_t len)
+{
+	if (src->is_iomem)
+		memcpy_fromio(dst, src->vaddr_iomem + src_offset, len);
+	else
+		memcpy(dst, src->vaddr + src_offset, len);
+}
+
 /**
  * iosys_map_incr - Increments the address stored in a iosys mapping
  * @map:	The iosys_map structure
@@ -255,4 +315,96 @@ static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
 		map->vaddr += incr;
 }
 
+/**
+ * iosys_map_memset - Memset iosys_map
+ * @dst:	The iosys_map structure
+ * @offset:	Offset from dst where to start setting value
+ * @value:	The value to set
+ * @len:	The number of bytes to set in dst
+ *
+ * Set value in iosys_map. Depending on the buffer's location, the helper
+ * picks the correct method of accessing the memory.
+ */
+static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
+				    int value, size_t len)
+{
+	if (dst->is_iomem)
+		memset_io(dst->vaddr_iomem + offset, value, len);
+	else
+		memset(dst->vaddr + offset, value, len);
+}
+
+/**
+ * iosys_map_rd - Read a C-type value from the iosys_map
+ *
+ * @map__:	The iosys_map structure
+ * @offset__:	The offset from which to read
+ * @type__:	Type of the value being read
+ *
+ * Read a C type value from iosys_map, handling possible un-aligned accesses to
+ * the mapping.
+ *
+ * Returns:
+ * The value read from the mapping.
+ */
+#define iosys_map_rd(map__, offset__, type__) ({			\
+	type__ val;							\
+	iosys_map_memcpy_from(&val, map__, offset__, sizeof(val));	\
+	val;								\
+})
+
+/**
+ * iosys_map_wr - Write a C-type value to the iosys_map
+ *
+ * @map__:	The iosys_map structure
+ * @offset__:	The offset from the mapping to write to
+ * @type__:	Type of the value being written
+ * @val__:	Value to write
+ *
+ * Write a C-type value to the iosys_map, handling possible un-aligned accesses
+ * to the mapping.
+ */
+#define iosys_map_wr(map__, offset__, type__, val__) ({			\
+	type__ val = (val__);						\
+	iosys_map_memcpy_to(map__, offset__, &val, sizeof(val));	\
+})
+
+/**
+ * iosys_map_rd_field - Read a member from a struct in the iosys_map
+ *
+ * @map__:		The iosys_map structure
+ * @struct_type__:	The struct describing the layout of the mapping
+ * @field__:		Member of the struct to read
+ *
+ * Read a value from iosys_map assuming its layout is described by a struct,
+ * passed as argument. The offset and size to the struct member is calculated
+ * and possible un-aligned accesses to the mapping handled.
+ *
+ * Returns:
+ * The value read from the mapping.
+ */
+#define iosys_map_rd_field(map__, struct_type__, field__) ({			\
+	struct_type__ *s;							\
+	iosys_map_rd(map__, offsetof(struct_type__, field__),			\
+		     typeof(s->field__));					\
+})
+
+/**
+ * iosys_map_wr_field - Write to a member of a struct in the iosys_map
+ *
+ * @map__:		The iosys_map structure
+ * @struct_type__:	The struct describing the layout of the mapping
+ * @field__:		Member of the struct to read
+ * @val__:		Value to write
+ *
+ * Write a value to the iosys_map assuming its layout is described by a struct,
+ * passed as argument. The offset and size to the struct member is calculated
+ * and possible un-aligned accesses to the mapping handled.
+ */
+#define iosys_map_wr_field(map__, struct_type__, field__, val__) ({		\
+	struct_type__ *s;							\
+	iosys_map_wr(map__, offsetof(struct_type__, field__),			\
+		     typeof(s->field__), val__);				\
+})
+
 #endif /* __IOSYS_MAP_H__ */
-- 
2.35.1

