Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB64FBD8D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E00110F196;
	Mon, 11 Apr 2022 13:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5515710F196
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649684649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CjN21VmJpSy28ESOyK/llXOAxqy8fb7fyJQUIDHDxnM=;
 b=BUGvJXpjR/O8DZnjIelNvfzVOn3gtAbtrNBH4hphKcIlrkIGGBFYylBDxsT7blA/lp/6AX
 jdUBypIm6Syzg5ApaDwJ1ujjMK0vUR/ItIlNyJrbAnx6I96IicJSsRuGJOcLHHm2cn9ISv
 HempzHTgE1G+giMBRV6LUI0sguXt33o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-MpbdYLk3NOy1FFnCyG862Q-1; Mon, 11 Apr 2022 09:44:08 -0400
X-MC-Unique: MpbdYLk3NOy1FFnCyG862Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 c17-20020a5d6cd1000000b00207a6974951so739747wrc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CjN21VmJpSy28ESOyK/llXOAxqy8fb7fyJQUIDHDxnM=;
 b=QJInkvSKM+PAAEEyc5LRLZ4UH/zygYDcpJAPjCSvN1pptS6z0KZnXR+kqYQSQN6Ctv
 fZlSAfKmCQTtvR3DMyQnBglaRWAkMVDVMOPesJmLD97Ykq3oTp3uvmjbMtLEZd7ejlAm
 OiVwPD0Lg/dv9cZdqVJ71z1bfvxMQfpozJQIFRdZlp047b+ZTqqsWLoYAZK1AmbAtVFP
 RQeuyA81gF+KAf8dV9WFZyzopb33ZJbQq9PKzoNxiIHETzZcfS8dlRtJX2m5PF0AvRkN
 sATI+Q0Se0IQOic50vTfI/4cm04AaRxpF3h+1VPZo0z3aB5ObHaf2pXjcxVT2OffPrIM
 xl+w==
X-Gm-Message-State: AOAM532rFnj3SSpSgRQL2x8YhHDjiqMSamUTrQ3zDwol8BrTzxET9HZr
 quoR+kikdDm337YPFCjgogrwtOBIWTBCVsORLMsLqtnJNF9mUa0MpJgiyk8L8IsBtgTxTv49zqo
 8Tj1MpjN+UiHf5HzGguPcGXZVBwYN
X-Received: by 2002:a1c:21c5:0:b0:38e:b464:6a39 with SMTP id
 h188-20020a1c21c5000000b0038eb4646a39mr9449882wmh.186.1649684647017; 
 Mon, 11 Apr 2022 06:44:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYqO1iHko0ulx2b8/UM9jUAYrDB7yqBjz+ZHI+mQa1d0U3CbDys6u2WYLDAxLaR0TaetvPug==
X-Received: by 2002:a1c:21c5:0:b0:38e:b464:6a39 with SMTP id
 h188-20020a1c21c5000000b0038eb4646a39mr9449862wmh.186.1649684646769; 
 Mon, 11 Apr 2022 06:44:06 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72]) by smtp.gmail.com with ESMTPSA id
 l9-20020a5d6d89000000b00203d62072c4sm27780641wrs.43.2022.04.11.06.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 06:44:05 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf-map: remove renamed header file
Date: Mon, 11 Apr 2022 15:44:04 +0200
Message-Id: <20220411134404.524776-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 7938f4218168 ("dma-buf-map: Rename to iosys-map") already renamed
this file, but it got brought back by a merge.

Delete it for real this time.

Fixes: 30424ebae8df ("Merge tag 'drm-intel-gt-next-2022-02-17' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-next")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 include/linux/dma-buf-map.h | 266 ------------------------------------
 1 file changed, 266 deletions(-)
 delete mode 100644 include/linux/dma-buf-map.h

diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
deleted file mode 100644
index 19fa0b5ae5ec..000000000000
--- a/include/linux/dma-buf-map.h
+++ /dev/null
@@ -1,266 +0,0 @@
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
-#endif /* __DMA_BUF_MAP_H__ */
-- 
2.35.1

