Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E54FA32E3C4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 09:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C92B6EB13;
	Fri,  5 Mar 2021 08:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Thu, 04 Mar 2021 15:20:12 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057696E4BA;
 Thu,  4 Mar 2021 15:20:12 +0000 (UTC)
Message-Id: <20210303132712.077853188@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614870853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=vxawU6WKg1yAdTzwxrwR7A69cfqTRPEP3GzbWm7j6PI=;
 b=LX6ER4CAc5RBvSn/4Sh0tSlX2kpHC1KfR7bKF6Bx4m+WqypmrPPtsQWDI+0qkI2qj0dKH9
 q3CuC5FUl22+d71u7vWfpqnp5HnifLp/M5QmGMGSNF2Dn117m3Qb+1OY5NglP/RAdvlhhx
 RxkcOSuWrB75nBY/AueAI+oYiBkfF3J7FUuOfam73IA+j7E8ZL25d4XGyFbU8dA38d+QZI
 KOGj7IA5rV3z8EDovPDLYkbVg+EUoZjnEgr4aKnM3y1DEGpqQNdXGpGdLJbITkqL/Wuh7+
 qnE9PqdYbE1oskv+BGJf6UsfsWzdCXZ1eBIYxJoxK6puCd6780muD3se3rKctg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614870853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=vxawU6WKg1yAdTzwxrwR7A69cfqTRPEP3GzbWm7j6PI=;
 b=mNo5mK70whIQOzTO5Gqg7GGZ1K+G8Bi2DJq4ELQUjaQI7UigGmWbIz4DJ0+ZdeawSGyZzS
 xE5CavRZ1AJUw4Cg==
Date: Wed, 03 Mar 2021 14:20:30 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 7/7] io-mapping: Remove io_mapping_map_atomic_wc()
References: <20210303132023.077167457@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Mar 2021 08:36:53 +0000
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 spice-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian Koenig <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Gleixner <tglx@linutronix.de>

No more users. Get rid of it and remove the traces in documentation.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
---
 Documentation/driver-api/io-mapping.rst |   22 +++++-----------
 include/linux/io-mapping.h              |   42 +-------------------------------
 2 files changed, 9 insertions(+), 55 deletions(-)

--- a/Documentation/driver-api/io-mapping.rst
+++ b/Documentation/driver-api/io-mapping.rst
@@ -21,19 +21,15 @@ mappable, while 'size' indicates how lar
 enable. Both are in bytes.
 
 This _wc variant provides a mapping which may only be used with
-io_mapping_map_atomic_wc(), io_mapping_map_local_wc() or
-io_mapping_map_wc().
+io_mapping_map_local_wc() or io_mapping_map_wc().
 
 With this mapping object, individual pages can be mapped either temporarily
 or long term, depending on the requirements. Of course, temporary maps are
-more efficient. They come in two flavours::
+more efficient.
 
 	void *io_mapping_map_local_wc(struct io_mapping *mapping,
 				      unsigned long offset)
 
-	void *io_mapping_map_atomic_wc(struct io_mapping *mapping,
-				       unsigned long offset)
-
 'offset' is the offset within the defined mapping region.  Accessing
 addresses beyond the region specified in the creation function yields
 undefined results. Using an offset which is not page aligned yields an
@@ -50,9 +46,6 @@ io_mapping_map_local_wc() has a side eff
 migration to make the mapping code work. No caller can rely on this side
 effect.
 
-io_mapping_map_atomic_wc() has the side effect of disabling preemption and
-pagefaults. Don't use in new code. Use io_mapping_map_local_wc() instead.
-
 Nested mappings need to be undone in reverse order because the mapping
 code uses a stack for keeping track of them::
 
@@ -65,11 +58,10 @@ Nested mappings need to be undone in rev
 The mappings are released with::
 
 	void io_mapping_unmap_local(void *vaddr)
-	void io_mapping_unmap_atomic(void *vaddr)
 
-'vaddr' must be the value returned by the last io_mapping_map_local_wc() or
-io_mapping_map_atomic_wc() call. This unmaps the specified mapping and
-undoes the side effects of the mapping functions.
+'vaddr' must be the value returned by the last io_mapping_map_local_wc()
+call. This unmaps the specified mapping and undoes eventual side effects of
+the mapping function.
 
 If you need to sleep while holding a mapping, you can use the regular
 variant, although this may be significantly slower::
@@ -77,8 +69,8 @@ If you need to sleep while holding a map
 	void *io_mapping_map_wc(struct io_mapping *mapping,
 				unsigned long offset)
 
-This works like io_mapping_map_atomic/local_wc() except it has no side
-effects and the pointer is globaly visible.
+This works like io_mapping_map_local_wc() except it has no side effects and
+the pointer is globaly visible.
 
 The mappings are released with::
 
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -60,28 +60,7 @@ io_mapping_fini(struct io_mapping *mappi
 	iomap_free(mapping->base, mapping->size);
 }
 
-/* Atomic map/unmap */
-static inline void __iomem *
-io_mapping_map_atomic_wc(struct io_mapping *mapping,
-			 unsigned long offset)
-{
-	resource_size_t phys_addr;
-
-	BUG_ON(offset >= mapping->size);
-	phys_addr = mapping->base + offset;
-	preempt_disable();
-	pagefault_disable();
-	return __iomap_local_pfn_prot(PHYS_PFN(phys_addr), mapping->prot);
-}
-
-static inline void
-io_mapping_unmap_atomic(void __iomem *vaddr)
-{
-	kunmap_local_indexed((void __force *)vaddr);
-	pagefault_enable();
-	preempt_enable();
-}
-
+/* Temporary mappings which are only valid in the current context */
 static inline void __iomem *
 io_mapping_map_local_wc(struct io_mapping *mapping, unsigned long offset)
 {
@@ -163,24 +142,7 @@ io_mapping_unmap(void __iomem *vaddr)
 {
 }
 
-/* Atomic map/unmap */
-static inline void __iomem *
-io_mapping_map_atomic_wc(struct io_mapping *mapping,
-			 unsigned long offset)
-{
-	preempt_disable();
-	pagefault_disable();
-	return io_mapping_map_wc(mapping, offset, PAGE_SIZE);
-}
-
-static inline void
-io_mapping_unmap_atomic(void __iomem *vaddr)
-{
-	io_mapping_unmap(vaddr);
-	pagefault_enable();
-	preempt_enable();
-}
-
+/* Temporary mappings which are only valid in the current context */
 static inline void __iomem *
 io_mapping_map_local_wc(struct io_mapping *mapping, unsigned long offset)
 {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
