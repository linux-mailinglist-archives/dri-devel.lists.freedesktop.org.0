Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A64A49D39E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320BB10E901;
	Wed, 26 Jan 2022 20:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F37B10E705;
 Wed, 26 Jan 2022 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229386; x=1674765386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fT5raPuy4gQlCWtdlnkOy0l3+TfxT0XyYHiwiGiH8uo=;
 b=lI9fHdrsctMT9Bp/sNs7zmjUj8buzy3tIcHMoo0WinvmytFuHfEpizbX
 wruxTmRwc9JXD/ySziGpC9XvbQ8PBRPWl6HpS7s8SOsnL/257ne5xUy7Q
 IjJ4CCYzcADSU9WANSLpe68o/7M5Pe2/EcIE61Ys5LaA8xKh73BEzutH3
 3RZNnUTec67Xr/xhFyLj28L2fSAoRwRsp0PipX/YBXtINg4QMcJoSSKyQ
 h9cgfbR54OAsezJ91GXdiJg6QLmciIY7ogreNcwHUpYHUYFdW9s9h9a98
 HWgL669rJq5P/G1mUO9dPqW2ZX5y1Ds7qZlgHUQa4i6CFHdcrSpgTGzpc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000494"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000494"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221490"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/19] dma-buf-map: Add read/write helpers
Date: Wed, 26 Jan 2022 12:36:44 -0800
Message-Id: <20220126203702.1784589-2-lucas.demarchi@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In certain situations it's useful to be able to read or write to an
offset that is calculated by having the memory layout given by a struct
declaration. Usually we are going to read/write a u8, u16, u32 or u64.

Add a pair of macros dma_buf_map_read_field()/dma_buf_map_write_field()
to calculate the offset of a struct member and memcpy the data from/to
the dma_buf_map. We could use readb, readw, readl, readq and the write*
counterparts, however due to alignment issues this may not work on all
architectures. If alignment needs to be checked to call the right
function, it's not possible to decide at compile-time which function to
call: so just leave the decision to the memcpy function that will do
exactly that on IO memory or dereference the pointer.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/dma-buf-map.h | 81 +++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index 19fa0b5ae5ec..65e927d9ce33 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -6,6 +6,7 @@
 #ifndef __DMA_BUF_MAP_H__
 #define __DMA_BUF_MAP_H__
 
+#include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/string.h>
 
@@ -229,6 +230,46 @@ static inline void dma_buf_map_clear(struct dma_buf_map *map)
 	}
 }
 
+/**
+ * dma_buf_map_memcpy_to_offset - Memcpy into offset of dma-buf mapping
+ * @dst:	The dma-buf mapping structure
+ * @offset:	The offset from which to copy
+ * @src:	The source buffer
+ * @len:	The number of byte in src
+ *
+ * Copies data into a dma-buf mapping with an offset. The source buffer is in
+ * system memory. Depending on the buffer's location, the helper picks the
+ * correct method of accessing the memory.
+ */
+static inline void dma_buf_map_memcpy_to_offset(struct dma_buf_map *dst, size_t offset,
+						const void *src, size_t len)
+{
+	if (dst->is_iomem)
+		memcpy_toio(dst->vaddr_iomem + offset, src, len);
+	else
+		memcpy(dst->vaddr + offset, src, len);
+}
+
+/**
+ * dma_buf_map_memcpy_from_offset - Memcpy from offset of dma-buf mapping into system memory
+ * @dst:	Destination in system memory
+ * @src:	The dma-buf mapping structure
+ * @src:	The offset from which to copy
+ * @len:	The number of byte in src
+ *
+ * Copies data from a dma-buf mapping with an offset. The dest buffer is in
+ * system memory. Depending on the mapping location, the helper picks the
+ * correct method of accessing the memory.
+ */
+static inline void dma_buf_map_memcpy_from_offset(void *dst, const struct dma_buf_map *src,
+						  size_t offset, size_t len)
+{
+	if (src->is_iomem)
+		memcpy_fromio(dst, src->vaddr_iomem + offset, len);
+	else
+		memcpy(dst, src->vaddr + offset, len);
+}
+
 /**
  * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
  * @dst:	The dma-buf mapping structure
@@ -263,4 +304,44 @@ static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
 		map->vaddr += incr;
 }
 
+/**
+ * dma_buf_map_read_field - Read struct member from dma-buf mapping with
+ * arbitrary size and handling un-aligned accesses
+ *
+ * @map__:	The dma-buf mapping structure
+ * @type__:	The struct to be used containing the field to read
+ * @field__:	Member from struct we want to read
+ *
+ * Read a value from dma-buf mapping calculating the offset and size: this assumes
+ * the dma-buf mapping is aligned with a a struct type__. A single u8, u16, u32
+ * or u64 can be read, based on the offset and size of type__.field__.
+ */
+#define dma_buf_map_read_field(map__, type__, field__) ({				\
+	type__ *t__;									\
+	typeof(t__->field__) val__;							\
+	dma_buf_map_memcpy_from_offset(&val__, map__, offsetof(type__, field__),	\
+				       sizeof(t__->field__));				\
+	val__;										\
+})
+
+/**
+ * dma_buf_map_write_field - Write struct member to the dma-buf mapping with
+ * arbitrary size and handling un-aligned accesses
+ *
+ * @map__:	The dma-buf mapping structure
+ * @type__:	The struct to be used containing the field to write
+ * @field__:	Member from struct we want to write
+ * @val__:	Value to be written
+ *
+ * Write a value to the dma-buf mapping calculating the offset and size.
+ * A single u8, u16, u32 or u64 can be written based on the offset and size of
+ * type__.field__.
+ */
+#define dma_buf_map_write_field(map__, type__, field__, val__) ({			\
+	type__ *t__;									\
+	typeof(t__->field__) val____ = val__;						\
+	dma_buf_map_memcpy_to_offset(map__, offsetof(type__, field__),			\
+				     &val____, sizeof(t__->field__));			\
+})
+
 #endif /* __DMA_BUF_MAP_H__ */
-- 
2.35.0

