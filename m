Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81C155BC5B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 00:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A59C10E365;
	Mon, 27 Jun 2022 22:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD78D10E32C;
 Mon, 27 Jun 2022 22:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656370056; x=1687906056;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ljQkH5Y9jtztiwl6SBWSFUeZLVkKTxLoq+xBRQr+Im4=;
 b=IO15+MyIXDkgEtWH4/Cu67FJikz/gDqSnh/E8sneAAQBv4hkoFJ3ohjm
 9McvbGw8VFgRO4355kfS8GX5vROylCoQlKHW2tm1cF04PKpTMk4mOeFIg
 Zk/R2rPYnMCitNB1uhmfAVF/qJ8Qqq5/S0qy+UG2+n7YcCrGVq6WSytoX
 6jEVkJSG/k9psWM1OHjvK4dpf9o4F/8aUU1xw4UR7aEuSmKHpMtGogsYG
 Msv3/Y3gzgNWhszuAys/TXuqizTfXmNAaXQBqV8xNq8zGhPwIduMeBiQb
 1RWiCUQNowAh0CT1RxRwx/JQ9zh/rC3Kdb301B4MoHEfXd8u/ee3xlrDO g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="282671111"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="282671111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 15:47:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="679779275"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 15:47:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [CI 1/2] iosys-map: Add per-word read
Date: Mon, 27 Jun 2022 15:47:50 -0700
Message-Id: <20220627224751.3627465-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.1
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

Instead of always falling back to memcpy_fromio() for any size, prefer
using read{b,w,l}(). When reading struct members it's common to read
individual integer variables individually. Going through memcpy_fromio()
for each of them poses a high penalty.

Employ a similar trick as __seqprop() by using _Generic() to generate
only the specific call based on a type-compatible variable.

For a pariticular i915 workload producing GPU context switches,
__get_engine_usage_record() is particularly hot since the engine usage
is read from device local memory with dgfx, possibly multiple times
since it's racy. Test execution time for this test shows a ~12.5%
improvement with DG2:

Before:
	nrepeats = 1000; min = 7.63243e+06; max = 1.01817e+07;
	median = 9.52548e+06; var = 526149;
After:
	nrepeats = 1000; min = 7.03402e+06; max = 8.8832e+06;
	median = 8.33955e+06; var = 333113;

Other things attempted that didn't prove very useful:
1) Change the _Generic() on x86 to just dereference the memory address
2) Change __get_engine_usage_record() to do just 1 read per loop,
   comparing with the previous value read
3) Change __get_engine_usage_record() to access the fields directly as it
   was before the conversion to iosys-map

(3) did gave a small improvement (~3%), but doesn't seem to scale well
to other similar cases in the driver.

Additional test by Chris Wilson using gem_create from igt with some
changes to track object creation time. This happens to accidentally
stress this code path:

	Pre iosys_map conversion of engine busyness:
	lmem0: Creating    262144 4KiB objects took 59274.2ms

	Unpatched:
	lmem0: Creating    262144 4KiB objects took 108830.2ms

	With readl (this patch):
	lmem0: Creating    262144 4KiB objects took 61348.6ms

	s/readl/READ_ONCE/
	lmem0: Creating    262144 4KiB objects took 61333.2ms

So we do take a little bit more time than before the conversion, but
that is due to other factors: bringing the READ_ONCE back would be as
good as just doing this conversion.

v2:
- Remove default from _Generic() - callers wanting to read more
  than u64 should use iosys_map_memcpy_from()
- Add READ_ONCE() cases dereferencing the pointer when using system
  memory

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com> # v1
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/iosys-map.h | 45 +++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 4b8406ee8bc4..ec81ed995c59 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -6,6 +6,7 @@
 #ifndef __IOSYS_MAP_H__
 #define __IOSYS_MAP_H__
 
+#include <linux/compiler_types.h>
 #include <linux/io.h>
 #include <linux/string.h>
 
@@ -333,6 +334,26 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
 		memset(dst->vaddr + offset, value, len);
 }
 
+#ifdef CONFIG_64BIT
+#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
+	u64: val_ = readq(vaddr_iomem_)
+#else
+#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
+	u64: memcpy_fromio(&(val_), vaddr_iomem_, sizeof(u64))
+#endif
+
+#define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,		\
+	u8: val__ = readb(vaddr_iomem__),					\
+	u16: val__ = readw(vaddr_iomem__),					\
+	u32: val__ = readl(vaddr_iomem__),					\
+	__iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
+
+#define __iosys_map_rd_sys(val__, vaddr__, type__) ({				\
+	compiletime_assert(sizeof(type__) <= sizeof(u64),			\
+			   "Unsupported access size for __iosys_map_rd_sys()");	\
+	val__ = READ_ONCE(*((type__ *)vaddr__));				\
+})
+
 /**
  * iosys_map_rd - Read a C-type value from the iosys_map
  *
@@ -340,16 +361,21 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * @offset__:	The offset from which to read
  * @type__:	Type of the value being read
  *
- * Read a C type value from iosys_map, handling possible un-aligned accesses to
- * the mapping.
+ * Read a C type value (u8, u16, u32 and u64) from iosys_map. For other types or
+ * if pointer may be unaligned (and problematic for the architecture supported),
+ * use iosys_map_memcpy_from().
  *
  * Returns:
  * The value read from the mapping.
  */
-#define iosys_map_rd(map__, offset__, type__) ({			\
-	type__ val;							\
-	iosys_map_memcpy_from(&val, map__, offset__, sizeof(val));	\
-	val;								\
+#define iosys_map_rd(map__, offset__, type__) ({				\
+	type__ val;								\
+	if ((map__)->is_iomem) {						\
+		__iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
+	} else {								\
+		__iosys_map_rd_sys(val, (map__)->vaddr + (offset__), type__);	\
+	}									\
+	val;									\
 })
 
 /**
@@ -379,9 +405,10 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  *
  * Read a value from iosys_map considering its layout is described by a C struct
  * starting at @struct_offset__. The field offset and size is calculated and its
- * value read handling possible un-aligned memory accesses. For example: suppose
- * there is a @struct foo defined as below and the value ``foo.field2.inner2``
- * needs to be read from the iosys_map:
+ * value read. If the field access would incur in un-aligned access, then either
+ * iosys_map_memcpy_from() needs to be used or the architecture must support it.
+ * For example: suppose there is a @struct foo defined as below and the value
+ * ``foo.field2.inner2`` needs to be read from the iosys_map:
  *
  * .. code-block:: c
  *
-- 
2.36.1

