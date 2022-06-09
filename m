Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F431545887
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 01:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927DA12AC50;
	Thu,  9 Jun 2022 23:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3262112AC1A;
 Thu,  9 Jun 2022 23:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654816822; x=1686352822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R+Fo1R+Cx7Kjh3MFvBqzlSN0LIqhrzUE8y5UbCpsfyo=;
 b=DI+CXSEZJXqB07RuZil0ouezelCDnF0lDkSJZP2qyXZsxW3ExuZeSVK1
 cNNcQoUVDei757yprDWMxL35wOh3r1g0nAtfv7OqE4dq06tCo6H58py2J
 wbdOPMYXeJfZFZwFTJQP84kuyeIzisCgYXD7VQxpWaUqjWyNqKSgo3tC9
 l/IX5lSGxWX6p1ySGxw9dOr0OGmMLr5XOD2ybgd68J4JzXtoKMvAwl65O
 i335AHrQrUPPUAJUkmJtUKfzpw3/ooL4R+aezQ7HPKVUrrv6S392cv0TD
 M5XQizJDybnxleU6cJe0jbFpz+b/OFUWJyI4jp6pt5rHrwbiPWnWiGzac A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278257503"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="278257503"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 16:20:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="908586197"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 16:20:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] iosys-map: Add word-sized reads
Date: Thu,  9 Jun 2022 16:20:21 -0700
Message-Id: <20220609232020.2292649-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: daniel.vetter@ffwll.ch, Lucas De Marchi <lucas.demarchi@intel.com>,
 christian.koenig@amd.com, tzimmermann@suse.de,
 Chris Wilson <chris@chris-wilson.co.uk>
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
changes to track object creation time. This happens to accidentaly
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

If this is acceptable we should probably add the write counterpart, too.
Sending here only the read for now since this fixes the issue we are
seeing and to gather feedback.

 include/linux/iosys-map.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index e69a002d5aa4..4ae3e459419e 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -333,6 +333,20 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
 		memset(dst->vaddr + offset, value, len);
 }
 
+#ifdef CONFIG_64BIT
+#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)			\
+	u64: val_ = readq(vaddr_iomem_),
+#else
+#define __iosys_map_u64_case(val_, vaddr_iomem_)
+#endif
+
+#define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,	\
+	u8: val__ = readb(vaddr_iomem__),				\
+	u16: val__ = readw(vaddr_iomem__),				\
+	u32: val__ = readl(vaddr_iomem__),				\
+	__iosys_map_rd_io_u64_case(val__, vaddr_iomem__)		\
+	default: memcpy_fromio(&(val__), vaddr_iomem__, sizeof(val__)))
+
 /**
  * iosys_map_rd - Read a C-type value from the iosys_map
  *
@@ -346,10 +360,14 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
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
+		__iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
+	} else {								\
+		memcpy(&val, (map__)->vaddr + offset__, sizeof(val));		\
+	}									\
+	val;									\
 })
 
 /**
-- 
2.36.1

