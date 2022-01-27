Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E949E79E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 17:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A007E10E186;
	Thu, 27 Jan 2022 16:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B8110E189;
 Thu, 27 Jan 2022 16:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643301268; x=1674837268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c1JSYjzfdbq8gU7ikAAFkClQc7FnpmVyHegh42jYpqU=;
 b=gO+aoLRPcnez8mToHuZm7e81OjvkaZi0QwlIXJjb7krAORTr0eLKU+9o
 GwIM3qFktBVt60wSTFzOxAONpFergWeTgSaD0V1hbO+91xUGw+C2O5EmV
 bCr6y/9PAOw2tK2rIzMIfw2+lMEQRbXqNaZzzVL3dOzXT7n4y5jn7vhuo
 yBGEy6+5gqVKF3h7ZJ1SiGuseZYyeOFAO7S26TmffAkngp/7Oj8mkourq
 HJ8DBrt4tHQYkrNK0ekbv6XnShu8zgOeULbOry19quwSOWPJU2DfEdspH
 E21y0SoPUK7ePHg2lXEDEA+U3RcdwwYoNIEDgg7QEqiDVTphjIEL98Sy3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="247124500"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="247124500"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 08:34:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="618388451"
Received: from anithaha-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.224.126])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 08:34:27 -0800
Date: Thu, 27 Jan 2022 08:34:26 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/19] dma-buf-map: Add read/write helpers
Message-ID: <20220127163426.pehk4iomlvths47b@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-2-lucas.demarchi@intel.com>
 <b7057779-2df8-8737-e174-fcb138544dfb@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7057779-2df8-8737-e174-fcb138544dfb@suse.de>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 03:26:43PM +0100, Thomas Zimmermann wrote:
>Hi
>
>Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>In certain situations it's useful to be able to read or write to an
>>offset that is calculated by having the memory layout given by a struct
>>declaration. Usually we are going to read/write a u8, u16, u32 or u64.
>>
>>Add a pair of macros dma_buf_map_read_field()/dma_buf_map_write_field()
>>to calculate the offset of a struct member and memcpy the data from/to
>>the dma_buf_map. We could use readb, readw, readl, readq and the write*
>>counterparts, however due to alignment issues this may not work on all
>>architectures. If alignment needs to be checked to call the right
>>function, it's not possible to decide at compile-time which function to
>>call: so just leave the decision to the memcpy function that will do
>>exactly that on IO memory or dereference the pointer.
>>
>>Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>Cc: Christian König <christian.koenig@amd.com>
>>Cc: linux-media@vger.kernel.org
>>Cc: dri-devel@lists.freedesktop.org
>>Cc: linaro-mm-sig@lists.linaro.org
>>Cc: linux-kernel@vger.kernel.org
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  include/linux/dma-buf-map.h | 81 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 81 insertions(+)
>>
>>diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>>index 19fa0b5ae5ec..65e927d9ce33 100644
>>--- a/include/linux/dma-buf-map.h
>>+++ b/include/linux/dma-buf-map.h
>>@@ -6,6 +6,7 @@
>>  #ifndef __DMA_BUF_MAP_H__
>>  #define __DMA_BUF_MAP_H__
>>+#include <linux/kernel.h>
>>  #include <linux/io.h>
>>  #include <linux/string.h>
>>@@ -229,6 +230,46 @@ static inline void dma_buf_map_clear(struct dma_buf_map *map)
>>  	}
>>  }
>>+/**
>>+ * dma_buf_map_memcpy_to_offset - Memcpy into offset of dma-buf mapping
>>+ * @dst:	The dma-buf mapping structure
>>+ * @offset:	The offset from which to copy
>>+ * @src:	The source buffer
>>+ * @len:	The number of byte in src
>>+ *
>>+ * Copies data into a dma-buf mapping with an offset. The source buffer is in
>>+ * system memory. Depending on the buffer's location, the helper picks the
>>+ * correct method of accessing the memory.
>>+ */
>>+static inline void dma_buf_map_memcpy_to_offset(struct dma_buf_map *dst, size_t offset,
>>+						const void *src, size_t len)
>>+{
>>+	if (dst->is_iomem)
>>+		memcpy_toio(dst->vaddr_iomem + offset, src, len);
>>+	else
>>+		memcpy(dst->vaddr + offset, src, len);
>>+}
>
>Please don't add a new function. Rather please add the offset 
>parameter to dma_buf_map_memcpy_to() and update the callers. There are 
>only two calls to dma_buf_map_memcpy_to() within the kernel. To make 
>it clear what the offset applies to, I'd call the parameter 
>'dst_offset'.
>
>>+
>>+/**
>>+ * dma_buf_map_memcpy_from_offset - Memcpy from offset of dma-buf mapping into system memory
>>+ * @dst:	Destination in system memory
>>+ * @src:	The dma-buf mapping structure
>>+ * @src:	The offset from which to copy
>>+ * @len:	The number of byte in src
>>+ *
>>+ * Copies data from a dma-buf mapping with an offset. The dest buffer is in
>>+ * system memory. Depending on the mapping location, the helper picks the
>>+ * correct method of accessing the memory.
>>+ */
>>+static inline void dma_buf_map_memcpy_from_offset(void *dst, const struct dma_buf_map *src,
>>+						  size_t offset, size_t len)
>>+{
>>+	if (src->is_iomem)
>>+		memcpy_fromio(dst, src->vaddr_iomem + offset, len);
>>+	else
>>+		memcpy(dst, src->vaddr + offset, len);
>>+}
>>+
>
>With the dma_buf_map_memcpy_to() changes, please just call this 
>function dma_buf_map_memcpy_from().
>
>>  /**
>>   * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
>>   * @dst:	The dma-buf mapping structure
>>@@ -263,4 +304,44 @@ static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
>>  		map->vaddr += incr;
>>  }
>>+/**
>>+ * dma_buf_map_read_field - Read struct member from dma-buf mapping with
>>+ * arbitrary size and handling un-aligned accesses
>>+ *
>>+ * @map__:	The dma-buf mapping structure
>>+ * @type__:	The struct to be used containing the field to read
>>+ * @field__:	Member from struct we want to read
>>+ *
>>+ * Read a value from dma-buf mapping calculating the offset and size: this assumes
>>+ * the dma-buf mapping is aligned with a a struct type__. A single u8, u16, u32
>>+ * or u64 can be read, based on the offset and size of type__.field__.
>>+ */
>>+#define dma_buf_map_read_field(map__, type__, field__) ({				\
>>+	type__ *t__;									\
>>+	typeof(t__->field__) val__;							\
>>+	dma_buf_map_memcpy_from_offset(&val__, map__, offsetof(type__, field__),	\
>>+				       sizeof(t__->field__));				\
>>+	val__;										\
>>+})
>>+
>>+/**
>>+ * dma_buf_map_write_field - Write struct member to the dma-buf mapping with
>>+ * arbitrary size and handling un-aligned accesses
>>+ *
>>+ * @map__:	The dma-buf mapping structure
>>+ * @type__:	The struct to be used containing the field to write
>>+ * @field__:	Member from struct we want to write
>>+ * @val__:	Value to be written
>>+ *
>>+ * Write a value to the dma-buf mapping calculating the offset and size.
>>+ * A single u8, u16, u32 or u64 can be written based on the offset and size of
>>+ * type__.field__.
>>+ */
>>+#define dma_buf_map_write_field(map__, type__, field__, val__) ({			\
>>+	type__ *t__;									\
>>+	typeof(t__->field__) val____ = val__;						\
>>+	dma_buf_map_memcpy_to_offset(map__, offsetof(type__, field__),			\
>>+				     &val____, sizeof(t__->field__));			\
>>+})
>
>As the original author of this file, I feel like this shouldn't be 
>here. At least not until we have another driver using that pattern.

Let me try to clear out the confusion. Then maybe I can extend
the documentation of this function in v2 if I'm able to convince this is
useful here.

This is not about importer/exporter, having this to work cross-driver.
This is about using dma_buf_map (which we are talking about on renaming
to iosys_map or something else) for inner driver
allocations/abstractions. The abstraction added by iosys_map helps on
sharing the same functions we had before.  And this macro here is very
useful when the buffer is described by a struct layout. Example:

	struct bla {
		struct inner inner1;
		struct inner inner2;
		u32 x, y ,z;
	};

Functions that would previously do:

	struct bla *bla = ...;

	bla->x = 100;
	bla->y = 200;
	bla->inner1.inner_inner_field = 30;

Can do the below, having the system/IO memory abstracted away
(calling it iosys_map here instead of dma_buf_map, hopeful it helps):

	struct iosys_map *map = ...;

	iosys_map_write_field(map, struct bla, x, 100);
	iosys_map_write_field(map, struct bla, y, 200);
	iosys_map_write_field(map, struct bla,
			      inner1.inner_inner_field, 30);

When we are using mostly the same map, the individual drivers can add
quick helpers on top. See the ads_blob_write() added in this series,
which guarantees the map it's working on is always the guc->ads_map,
while reducing verbosity to use the API. From patch
"drm/i915/guc: Add read/write helpers for ADS blob":

#define ads_blob_read(guc_, field_)                                    \
        dma_buf_map_read_field(&(guc_)->ads_map, struct __guc_ads_blob, \
                               field_)

#define ads_blob_write(guc_, field_, val_)                             \
        dma_buf_map_write_field(&(guc_)->ads_map, struct __guc_ads_blob,\
                                field_, val_)

So in intel_guc_ads, we can have a lot of:

-	bla->x = 100;
+	ads_blob_write(guc, x, 10);

thanks
Lucas De Marchi
