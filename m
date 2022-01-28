Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA94F49F636
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 10:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A0910F142;
	Fri, 28 Jan 2022 09:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF8210F147;
 Fri, 28 Jan 2022 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643361851; x=1674897851;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ER2BZu+9DfXj2YDMatEqd0NnPYkMLNcVuboE1qKqCQM=;
 b=C4NsJzr3QrM2NLEe+jGpFwjzfPmoY+LufuKSle1eSYARt7DmIB1wq/xg
 G1M0vx2WfwStRKsYxSFh9g7lhmYWl6g/3PHvMQtY0TASGGNTpDplMQ+Yr
 jC71hw2ibURCUhTd5BqdnekTATa6pl89G2yQ+jz9tVjLlgHLLCvbzsYzv
 m5F3lsXTvn//YaapaShWPKnS/LtpMXP3Xte2rNjdUbJC0dVwR96iSKbLN
 uYk4Y6hbZWgfBp9XUnIWVD0O4wT97gHbv+KsxHm3OZ7jDo7yt8JBvDiIx
 WtoztOjgWUS1q2OWd9KALzo4DVbKGLe1C4KDHA0UHz6MbNM0+U+99XksZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="230663377"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="230663377"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 01:24:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="480674538"
Received: from weif1-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.10.48])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 01:24:11 -0800
Date: Fri, 28 Jan 2022 01:24:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/14] iosys-map: Introduce renamed dma-buf-map
Message-ID: <20220128092353.h2g6exun7enidw4q@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
 <20220128083626.3012259-2-lucas.demarchi@intel.com>
 <37e3c34b-6fe3-5270-2128-40158b6e0c9e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37e3c34b-6fe3-5270-2128-40158b6e0c9e@suse.de>
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, srinivas.kandagatla@linaro.org,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 09:53:59AM +0100, Thomas Zimmermann wrote:
>Hi
>
>Am 28.01.22 um 09:36 schrieb Lucas De Marchi:
>>Add a new type, struct iosys_map, to eventually replace
>>struct dma_buf_map and its helpers defiend in
>>include/linux/dma-buf-map.h.
>>
>>This is mostly a copy of dma-buf-map with the renames in place and
>>slightly different wording to avoid tying iosys_map to dma-buf: in fact
>>it's just a shim layer to abstract system memory, that can be accessed
>>via regular load and store, from IO memory that needs to be acessed via
>>arch helpers. Over time the dma-buf-map proved useful outside of buffer
>>sharing among drivers and started to be used in helper functions for
>>allocation and generic use. See e.g.
>>
>>	drivers/gpu/drm/drm_gem_shmem_helper.c
>>	drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>	drivers/gpu/drm/drm_fb_helper.c
>
>Well, that was the original motivation: framebuffer memory can be 
>located in system or I/O memory, and even change their location. For 
>some architectures this makes difference. IIRC the framebuffer console 
>crashed on sparc64 because we didn't access I/O memory in the correct 
>way. Hence, we added dma_buf_map to return the type of memory from 
>dma_buf_vmap/dma_buf_vunmap.  And because everything is tied together, 
>we had quite a bit of churn throughout the DRM/media code. There are 

Thanks for the history on this. It's helpful. My motivation for starting
using dma_buf_map was very similar:  i915 is full of direct load/store.
It works on x86 for IO memory. While testing it on arm64 the story
was not kind the same. Since we want to support archs other than x86 we
need to start using some abstractions and dma_buf_map seemed a nice fit
:)

>still places in DRM where we access the raw pointers within 
>dma_buf_map. We need to clean this up at some point.

at least those are easier to find than just the raw pointers without
the abstraction

>
>>
>>In the i915 driver it's also desired to share the implementation for
>>integrated graphics, which uses mostly system memory, with discrete
>>graphics, which may need to access IO memory.
>>
>>Once all the drivers using dma_buf_map are converted, the dma_buf_map
>>can be retired and iosys_map extended to cover new use cases.
>
>Wrt the renaming: the old name isn't good and the new one isn't good 
>either. But I don't have strong feelings for either of them.

:(. As the quote: "There are only two hard things in Computer Science:
cache invalidation and naming things."

[ oh, and I'm also having to deal with cache invalidation to properly
   support other archs. ]

At least I had 2 people saying the name was ok.

>
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  MAINTAINERS                 |   1 +
>>  include/linux/dma-buf-map.h |   3 +
>>  include/linux/iosys-map.h   | 254 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 258 insertions(+)
>>  create mode 100644 include/linux/iosys-map.h
>>
>>diff --git a/MAINTAINERS b/MAINTAINERS
>>index ea3e6c914384..27ebaded85f8 100644
>>--- a/MAINTAINERS
>>+++ b/MAINTAINERS
>>@@ -5734,6 +5734,7 @@ F:	Documentation/driver-api/dma-buf.rst
>>  F:	drivers/dma-buf/
>>  F:	include/linux/*fence.h
>>  F:	include/linux/dma-buf*
>>+F:	include/linux/iosys-map.h
>
>If anything, I'd complain tha twe now have something in dma-buf that 
>isn't obviously connected to dma-buf.

Let's see if others come with a better name

thanks
Lucas De Marchi

>
>Best regards
>Thomas
>
>>  F:	include/linux/dma-resv.h
>>  K:	\bdma_(?:buf|fence|resv)\b
>>diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>>index 19fa0b5ae5ec..4b4b2930660b 100644
>>--- a/include/linux/dma-buf-map.h
>>+++ b/include/linux/dma-buf-map.h
>>@@ -263,4 +263,7 @@ static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
>>  		map->vaddr += incr;
>>  }
>>+/* Temporary include for API migration */
>>+#include <linux/iosys-map.h>
>>+
>>  #endif /* __DMA_BUF_MAP_H__ */
>>diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>>new file mode 100644
>>index 000000000000..ad1f08f8f97f
>>--- /dev/null
>>+++ b/include/linux/iosys-map.h
>>@@ -0,0 +1,254 @@
>>+/* SPDX-License-Identifier: GPL-2.0-only */
>>+/*
>>+ * Pointer abstraction for IO/system memory
>>+ */
>>+
>>+#ifndef __IOSYS_MAP_H__
>>+#define __IOSYS_MAP_H__
>>+
>>+#include <linux/io.h>
>>+#include <linux/string.h>
>>+
>>+/* Temporary include while user of dma-buf-map are converted to iosys-map */
>>+#include <linux/dma-buf-map.h>
>>+
>>+/**
>>+ * DOC: overview
>>+ *
>>+ * When accessing a memory region, depending on the its location, users may have
>>+ * to access it with I/O operations or memory load/store operations. For
>>+ * example, copying to system memory could be done with memcpy(), copying to I/O
>>+ * memory would be done with memcpy_toio().
>>+ *
>>+ * .. code-block:: c
>>+ *
>>+ *	void *vaddr = ...; // pointer to system memory
>>+ *	memcpy(vaddr, src, len);
>>+ *
>>+ *	void *vaddr_iomem = ...; // pointer to I/O memory
>>+ *	memcpy_toio(vaddr, _iomem, src, len);
>>+ *
>>+ * The user of such pointer may not have information about the mapping of that
>>+ * region or may want to have a single code path to handle operations on that
>>+ * buffer, regardless if it's located in system or IO memory. The type
>>+ * :c:type:`struct iosys_map <iosys_map>` and its helpers abstract that so the
>>+ * buffer can be passed around to other drivers or have separate duties inside
>>+ * the same driver for allocation, read and write operations.
>>+ *
>>+ * Open-coding access to :c:type:`struct iosys_map <iosys_map>` is considered
>>+ * bad style. Rather then accessing its fields directly, use one of the provided
>>+ * helper functions, or implement your own. For example, instances of
>>+ * :c:type:`struct iosys_map <iosys_map>` can be initialized statically with
>>+ * IOSYS_MAP_INIT_VADDR(), or at runtime with iosys_map_set_vaddr(). These
>>+ * helpers will set an address in system memory.
>>+ *
>>+ * .. code-block:: c
>>+ *
>>+ *	struct iosys_map map = IOSYS_MAP_INIT_VADDR(0xdeadbeaf);
>>+ *
>>+ *	iosys_map_set_vaddr(&map, 0xdeadbeaf);
>>+ *
>>+ * To set an address in I/O memory, use iosys_map_set_vaddr_iomem().
>>+ *
>>+ * .. code-block:: c
>>+ *
>>+ *	iosys_map_set_vaddr_iomem(&map, 0xdeadbeaf);
>>+ *
>>+ * Instances of struct iosys_map do not have to be cleaned up, but
>>+ * can be cleared to NULL with iosys_map_clear(). Cleared mappings
>>+ * always refer to system memory.
>>+ *
>>+ * .. code-block:: c
>>+ *
>>+ *	iosys_map_clear(&map);
>>+ *
>>+ * Test if a mapping is valid with either iosys_map_is_set() or
>>+ * iosys_map_is_null().
>>+ *
>>+ * .. code-block:: c
>>+ *
>>+ *	if (iosys_map_is_set(&map) != iosys_map_is_null(&map))
>>+ *		// always true
>>+ *
>>+ * Instances of :c:type:`struct iosys_map <iosys_map>` can be compared for
>>+ * equality with iosys_map_is_equal(). Mappings that point to different memory
>>+ * spaces, system or I/O, are never equal. That's even true if both spaces are
>>+ * located in the same address space, both mappings contain the same address
>>+ * value, or both mappings refer to NULL.
>>+ *
>>+ * .. code-block:: c
>>+ *
>>+ *	struct iosys_map sys_map; // refers to system memory
>>+ *	struct iosys_map io_map; // refers to I/O memory
>>+ *
>>+ *	if (iosys_map_is_equal(&sys_map, &io_map))
>>+ *		// always false
>>+ *
>>+ * A set up instance of struct iosys_map can be used to access or manipulate the
>>+ * buffer memory. Depending on the location of the memory, the provided helpers
>>+ * will pick the correct operations. Data can be copied into the memory with
>>+ * iosys_map_memcpy_to(). The address can be manipulated with iosys_map_incr().
>>+ *
>>+ * .. code-block:: c
>>+ *
>>+ *	const void *src = ...; // source buffer
>>+ *	size_t len = ...; // length of src
>>+ *
>>+ *	iosys_map_memcpy_to(&map, src, len);
>>+ *	iosys_map_incr(&map, len); // go to first byte after the memcpy
>>+ */
>>+
>>+/**
>>+ * struct iosys_map - Pointer to IO/system memory
>>+ * @vaddr_iomem:	The buffer's address if in I/O memory
>>+ * @vaddr:		The buffer's address if in system memory
>>+ * @is_iomem:		True if the buffer is located in I/O memory, or false
>>+ *			otherwise.
>>+ */
>>+#define iosys_map dma_buf_map
>>+
>>+/**
>>+ * IOSYS_MAP_INIT_VADDR - Initializes struct iosys_map to an address in system memory
>>+ * @vaddr_:	A system-memory address
>>+ */
>>+#define IOSYS_MAP_INIT_VADDR(vaddr_)	\
>>+	{				\
>>+		.vaddr = (vaddr_),	\
>>+		.is_iomem = false,	\
>>+	}
>>+
>>+/**
>>+ * iosys_map_set_vaddr - Sets a iosys mapping structure to an address in system memory
>>+ * @map:	The iosys_map structure
>>+ * @vaddr:	A system-memory address
>>+ *
>>+ * Sets the address and clears the I/O-memory flag.
>>+ */
>>+static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
>>+{
>>+	map->vaddr = vaddr;
>>+	map->is_iomem = false;
>>+}
>>+
>>+/**
>>+ * iosys_map_set_vaddr_iomem - Sets a iosys mapping structure to an address in I/O memory
>>+ * @map:		The iosys_map structure
>>+ * @vaddr_iomem:	An I/O-memory address
>>+ *
>>+ * Sets the address and the I/O-memory flag.
>>+ */
>>+static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
>>+					     void __iomem *vaddr_iomem)
>>+{
>>+	map->vaddr_iomem = vaddr_iomem;
>>+	map->is_iomem = true;
>>+}
>>+
>>+/**
>>+ * iosys_map_is_equal - Compares two iosys mapping structures for equality
>>+ * @lhs:	The iosys_map structure
>>+ * @rhs:	A iosys_map structure to compare with
>>+ *
>>+ * Two iosys mapping structures are equal if they both refer to the same type of memory
>>+ * and to the same address within that memory.
>>+ *
>>+ * Returns:
>>+ * True is both structures are equal, or false otherwise.
>>+ */
>>+static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
>>+				      const struct iosys_map *rhs)
>>+{
>>+	if (lhs->is_iomem != rhs->is_iomem)
>>+		return false;
>>+	else if (lhs->is_iomem)
>>+		return lhs->vaddr_iomem == rhs->vaddr_iomem;
>>+	else
>>+		return lhs->vaddr == rhs->vaddr;
>>+}
>>+
>>+/**
>>+ * iosys_map_is_null - Tests for a iosys mapping to be NULL
>>+ * @map:	The iosys_map structure
>>+ *
>>+ * Depending on the state of struct iosys_map.is_iomem, tests if the
>>+ * mapping is NULL.
>>+ *
>>+ * Returns:
>>+ * True if the mapping is NULL, or false otherwise.
>>+ */
>>+static inline bool iosys_map_is_null(const struct iosys_map *map)
>>+{
>>+	if (map->is_iomem)
>>+		return !map->vaddr_iomem;
>>+	return !map->vaddr;
>>+}
>>+
>>+/**
>>+ * iosys_map_is_set - Tests if the iosys mapping has been set
>>+ * @map:	The iosys_map structure
>>+ *
>>+ * Depending on the state of struct iosys_map.is_iomem, tests if the
>>+ * mapping has been set.
>>+ *
>>+ * Returns:
>>+ * True if the mapping is been set, or false otherwise.
>>+ */
>>+static inline bool iosys_map_is_set(const struct iosys_map *map)
>>+{
>>+	return !iosys_map_is_null(map);
>>+}
>>+
>>+/**
>>+ * iosys_map_clear - Clears a iosys mapping structure
>>+ * @map:	The iosys_map structure
>>+ *
>>+ * Clears all fields to zero, including struct iosys_map.is_iomem, so
>>+ * mapping structures that were set to point to I/O memory are reset for
>>+ * system memory. Pointers are cleared to NULL. This is the default.
>>+ */
>>+static inline void iosys_map_clear(struct iosys_map *map)
>>+{
>>+	if (map->is_iomem) {
>>+		map->vaddr_iomem = NULL;
>>+		map->is_iomem = false;
>>+	} else {
>>+		map->vaddr = NULL;
>>+	}
>>+}
>>+
>>+/**
>>+ * iosys_map_memcpy_to - Memcpy into iosys mapping
>>+ * @dst:	The iosys_map structure
>>+ * @src:	The source buffer
>>+ * @len:	The number of byte in src
>>+ *
>>+ * Copies data into a iosys mapping. The source buffer is in system
>>+ * memory. Depending on the buffer's location, the helper picks the correct
>>+ * method of accessing the memory.
>>+ */
>>+static inline void iosys_map_memcpy_to(struct iosys_map *dst, const void *src,
>>+				       size_t len)
>>+{
>>+	if (dst->is_iomem)
>>+		memcpy_toio(dst->vaddr_iomem, src, len);
>>+	else
>>+		memcpy(dst->vaddr, src, len);
>>+}
>>+
>>+/**
>>+ * iosys_map_incr - Increments the address stored in a iosys mapping
>>+ * @map:	The iosys_map structure
>>+ * @incr:	The number of bytes to increment
>>+ *
>>+ * Increments the address stored in a iosys mapping. Depending on the
>>+ * buffer's location, the correct value will be updated.
>>+ */
>>+static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
>>+{
>>+	if (map->is_iomem)
>>+		map->vaddr_iomem += incr;
>>+	else
>>+		map->vaddr += incr;
>>+}
>>+
>>+#endif /* __IOSYS_MAP_H__ */
>
>-- 
>Thomas Zimmermann
>Graphics Driver Developer
>SUSE Software Solutions Germany GmbH
>Maxfeldstr. 5, 90409 Nürnberg, Germany
>(HRB 36809, AG Nürnberg)
>Geschäftsführer: Ivo Totev



