Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E2154F397
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 10:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0805811AB51;
	Fri, 17 Jun 2022 08:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A34D11AB4D;
 Fri, 17 Jun 2022 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655455911; x=1686991911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7YpqZy5jywnIGnFwcEJydUXCIo68GYrPBsGFfhq8DBw=;
 b=ZuKyJYo+m8RUx151qNuYhI63dFSEuwPNzqpKzrlrn+GQiNtiKO4ogW2v
 ZdCkrtr3RE9+NLTcgvNS3NZOsSslq1XY5RX4puHBkjsHmcX7mEfpxnPJE
 STYiX7vmYYc6DyxRS92iQMnjGxloqRPh1nyPdCZnaNzMQmwfP9/OMRoBo
 Dr2HefpiExYWqx94SYy58OSWVbZyjlANIi90anIJTbAsDF6n/QeHd+z7u
 87mF/dHdQiYhqNfv26KKPHHkvL+d/K2BSfB5hEPY6MT8vLaoIz/sjoIk1
 /FoAd2Fy8VFk/fDZjanOoIjb7Ao5pdcnk57VJGVZ0UZNvG/o2XvysQLGC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="277031609"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="277031609"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 01:51:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="831958373"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 01:51:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] iosys-map: Add per-word write
Date: Fri, 17 Jun 2022 01:52:04 -0700
Message-Id: <20220617085204.1678035-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617085204.1678035-1-lucas.demarchi@intel.com>
References: <20220617085204.1678035-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, christian.koenig@amd.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like was done for read, provide the equivalent for write. Even if
current users are not in the hot path, this should future-proof it.

v2:
  - Remove default from _Generic() - callers wanting to write more
    than u64 should use iosys_map_memcpy_to()
  - Add WRITE_ONCE() cases dereferencing the pointer when using system
    memory

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Reviewed-by: Christian König <christian.koenig@amd.com> # v1
---
 include/linux/iosys-map.h | 42 ++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index f59dd00ed202..580e14cd360c 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -337,9 +337,13 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
 #ifdef CONFIG_64BIT
 #define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
 	u64: val_ = readq(vaddr_iomem_)
+#define __iosys_map_wr_io_u64_case(val_, vaddr_iomem_)			\
+	u64: writeq(val_, vaddr_iomem_)
 #else
 #define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
 	u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
+#define __iosys_map_wr_io_u64_case(val_, vaddr_iomem_)			\
+	u64: memcpy_toio(vaddr_iomem_, &(val_), sizeof(u64))
 #endif
 
 #define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,		\
@@ -354,6 +358,19 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
 	val__ = READ_ONCE(*((type__ *)vaddr__));				\
 })
 
+#define __iosys_map_wr_io(val__, vaddr_iomem__, type__) _Generic(val__,		\
+	u8: writeb(val__, vaddr_iomem__),					\
+	u16: writew(val__, vaddr_iomem__),					\
+	u32: writel(val__, vaddr_iomem__),					\
+	__iosys_map_wr_io_u64_case(val__, vaddr_iomem__))
+
+#define __iosys_map_wr_sys(val__, vaddr__, type__) ({				\
+	compiletime_assert(sizeof(type__) <= sizeof(u64),			\
+			   "Unsupported access size for __iosys_map_wr_sys()"); \
+	WRITE_ONCE(*((type__ *)vaddr__), val__);				\
+})
+
+
 /**
  * iosys_map_rd - Read a C-type value from the iosys_map
  *
@@ -386,12 +403,17 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * @type__:	Type of the value being written
  * @val__:	Value to write
  *
- * Write a C-type value to the iosys_map, handling possible un-aligned accesses
- * to the mapping.
+ * Write a C type value (u8, u16, u32 and u64) to the iosys_map. For other types
+ * or if pointer may be unaligned (and problematic for the architecture
+ * supported), use iosys_map_memcpy_to()
  */
-#define iosys_map_wr(map__, offset__, type__, val__) ({			\
-	type__ val = (val__);						\
-	iosys_map_memcpy_to(map__, offset__, &val, sizeof(val));	\
+#define iosys_map_wr(map__, offset__, type__, val__) ({				\
+	type__ val = (val__);							\
+	if ((map__)->is_iomem) {						\
+		__iosys_map_wr_io(val, (map__)->vaddr_iomem + (offset__), type__);\
+	} else {								\
+		__iosys_map_wr_sys(val, (map__)->vaddr + (offset__), type__);	\
+	}									\
 })
 
 /**
@@ -472,10 +494,12 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * @field__:		Member of the struct to read
  * @val__:		Value to write
  *
- * Write a value to the iosys_map considering its layout is described by a C struct
- * starting at @struct_offset__. The field offset and size is calculated and the
- * @val__ is written handling possible un-aligned memory accesses. Refer to
- * iosys_map_rd_field() for expected usage and memory layout.
+ * Write a value to the iosys_map considering its layout is described by a C
+ * struct starting at @struct_offset__. The field offset and size is calculated
+ * and the @val__ is written. If the field access would incur in un-aligned
+ * access, then either iosys_map_memcpy_to() needs to be used or the
+ * architecture must support it. Refer to iosys_map_rd_field() for expected
+ * usage and memory layout.
  */
 #define iosys_map_wr_field(map__, struct_offset__, struct_type__, field__, val__) ({	\
 	struct_type__ *s;								\
-- 
2.36.1

