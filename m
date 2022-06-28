Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352455EDA7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 21:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA29210FB08;
	Tue, 28 Jun 2022 19:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866AB10F7AA;
 Tue, 28 Jun 2022 19:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656443393; x=1687979393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gq0ZzJGdmcvmO4J+ld8VOXGM6Hpl0H6UEJdEzAkOF/M=;
 b=KE+KYo+VvdxJflYf5v3TVPfvBYpCl+NZJqx01aEtgUhNXpfgLJIENGdR
 tlYyXQh49Acvalzq302jc/Odk0riLmedEJNI8d17mTs5M6X2lIetEEYvt
 KlJMScZGDIlzoT/squXykr3gByio5KJZO8/JHfySHJJ5MgYq8BZU5Xj/1
 VFo/bVvlacCKVUtx1Oi4yEitb/jmuH+egzk3RJdr2w8i63dgygG1DvHMo
 i7L/+y2YrEgxhbNWs2a7g9Da7d6jqXvXozUsBfOvgdGv8OUPh0JwQlZ1I
 7IS3dXqoFbl1fGW4jpGK5rWsUpTBEI7JFAQEog5K4OOqBZgXqnvTZNSc6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="264866371"
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="264866371"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 12:09:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="623045373"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 12:09:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [CI 2/2] iosys-map: Add per-word write
Date: Tue, 28 Jun 2022 12:10:16 -0700
Message-Id: <20220628191016.3899428-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628191016.3899428-1-lucas.demarchi@intel.com>
References: <20220628191016.3899428-1-lucas.demarchi@intel.com>
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
v3:
  - Fix precedence issue when casting inside WRITE_ONCE(). By not using ()
    around vaddr__ the offset was not part of the cast, but rather added
    to it, producing a wrong address
  - Remove compiletime_assert() as WRITE_ONCE() already contains it

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Reviewed-by: Christian König <christian.koenig@amd.com> # v1
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/iosys-map.h | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 48e550b290fa..08dad5b0ad17 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -337,9 +337,13 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
 #ifdef CONFIG_64BIT
 #define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
 	u64: val_ = readq(vaddr_iomem_)
+#define __iosys_map_wr_io_u64_case(val_, vaddr_iomem_)				\
+	u64: writeq(val_, vaddr_iomem_)
 #else
 #define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
 	u64: memcpy_fromio(&(val_), vaddr_iomem_, sizeof(u64))
+#define __iosys_map_wr_io_u64_case(val_, vaddr_iomem_)				\
+	u64: memcpy_toio(vaddr_iomem_, &(val_), sizeof(u64))
 #endif
 
 #define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,		\
@@ -351,6 +355,15 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
 #define __iosys_map_rd_sys(val__, vaddr__, type__)				\
 	val__ = READ_ONCE(*(type__ *)(vaddr__));
 
+#define __iosys_map_wr_io(val__, vaddr_iomem__, type__) _Generic(val__,		\
+	u8: writeb(val__, vaddr_iomem__),					\
+	u16: writew(val__, vaddr_iomem__),					\
+	u32: writel(val__, vaddr_iomem__),					\
+	__iosys_map_wr_io_u64_case(val__, vaddr_iomem__))
+
+#define __iosys_map_wr_sys(val__, vaddr__, type__)				\
+	WRITE_ONCE(*(type__ *)(vaddr__), val__);
+
 /**
  * iosys_map_rd - Read a C-type value from the iosys_map
  *
@@ -383,12 +396,17 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
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
@@ -469,10 +487,12 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
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

