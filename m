Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AF26E771D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 12:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E5710E913;
	Wed, 19 Apr 2023 10:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com
 [14.137.139.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247FF10E918
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 10:05:37 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4Q1blQ38RPz9v7V0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:56:02 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.45.152.239])
 by APP1 (Coremail) with SMTP id LxC2BwAXi_aYvD9k7TY6Ag--.1944S4;
 Wed, 19 Apr 2023 11:05:07 +0100 (CET)
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Kim Phillips <kim.phillips@amd.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Muchun Song <muchun.song@linux.dev>, Ondrej Zary <linux@zary.sk>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Petr Tesarik <petr.tesarik.ext@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Won Chung <wonchung@google.com>,
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 iommu@lists.linux.dev (open list:DMA MAPPING HELPERS)
Subject: [PATCH v2 2/7] swiotlb: Move code around in preparation for dynamic
 bounce buffers
Date: Wed, 19 Apr 2023 12:03:54 +0200
Message-Id: <2954d90769bb926271c22553ef57ec805fea7865.1681898595.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
References: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LxC2BwAXi_aYvD9k7TY6Ag--.1944S4
X-Coremail-Antispam: 1UD129KBjvJXoW3JryUur45Aw47Kw4fKF4kZwb_yoW3uFW8pF
 1ft3WrtFsxJF1xC397uw48JF1Fkw1kG343Caya9ryF9Fy3Xrn0vFZ8CrW5WayFvFWv9F4U
 Xr98uF4rKF47Jr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmGb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
 A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2
 WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkE
 bVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7
 AKxVWUtVW8ZwCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
 6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
 C2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
 6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rV
 WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWx
 JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8go7tUUUUU==
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
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
Cc: petr@tesarici.cz, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Roberto Sassu <roberto.sassu@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

To prepare for the introduction of dynamically allocated bounce
buffers, separate out common code and code which handles non-dynamic
(aka fixed) bounce buffers.

No functional change, but this commit should make the addition of
dynamic allocations easier to review.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 include/linux/swiotlb.h |  31 ++++++++++-
 kernel/dma/swiotlb.c    | 110 +++++++++++++++++++++++++++++++++-------
 2 files changed, 122 insertions(+), 19 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index b65b7330f7e5..a0bb6b30b17c 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -105,11 +105,40 @@ struct io_tlb_mem {
 };
 extern struct io_tlb_mem io_tlb_default_mem;
 
+/**
+ * is_swiotlb_fixed() - check if a physical address belongs to a swiotlb slot
+ * @mem:	relevant swiotlb pool
+ * @paddr:	physical address within the DMA buffer
+ *
+ * Check if @paddr points into a fixed bounce buffer slot.
+ * This check should be as fast as possible.
+ *
+ * Return:
+ * * %true if @paddr points into a @mem fixed slot
+ * * %false otherwise
+ */
+static inline bool is_swiotlb_fixed(struct io_tlb_mem *mem, phys_addr_t paddr)
+{
+	return paddr >= mem->start && paddr < mem->end;
+}
+
+/**
+ * is_swiotlb_buffer() - check if a physical address is allocated from the
+ *                       swiotlb pool
+ * @dev:	device which has mapped the buffer
+ * @paddr:	physical address within the DMA buffer
+ *
+ * Check if @paddr points into a bounce buffer.
+ *
+ * Return:
+ * * %true if @paddr points into a bounce buffer
+ * * %false otherwise
+ */
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 
-	return mem && paddr >= mem->start && paddr < mem->end;
+	return mem && is_swiotlb_fixed(mem, paddr);
 }
 
 static inline bool is_swiotlb_force_bounce(struct device *dev)
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index dac42a2ad588..2f09a4ed4215 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -78,6 +78,10 @@ phys_addr_t swiotlb_unencrypted_base;
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 static unsigned long default_nareas;
 
+static void swiotlb_copy(struct device *dev, phys_addr_t orig_addr,
+		unsigned char *vaddr, size_t size, size_t alloc_size,
+		unsigned int tlb_offset, enum dma_data_direction dir);
+
 /**
  * struct io_tlb_area - IO TLB memory area descriptor
  *
@@ -523,7 +527,6 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
-	unsigned long pfn = PFN_DOWN(orig_addr);
 	unsigned char *vaddr = mem->vaddr + tlb_addr - mem->start;
 	unsigned int tlb_offset, orig_addr_offset;
 
@@ -540,6 +543,34 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 	}
 
 	tlb_offset -= orig_addr_offset;
+	swiotlb_copy(dev, orig_addr, vaddr, size, alloc_size, tlb_offset, dir);
+}
+
+/**
+ * swiotlb_copy() - copy swiotlb buffer content, checking for overflows.
+ * @dev:	device which has mapped the bounce buffer
+ * @orig_addr:	physical address of the original buffer
+ * @vaddr:	virtual address inside the bounce buffer
+ * @size:	number of bytes to copy
+ * @alloc_size:	total allocated size of the bounce buffer
+ * @tlb_offset:	offset within the bounce buffer
+ * @dir:	direction of the data transfer
+ *
+ * If @dir is %DMA_TO_DEVICE, copy data from the original buffer to the
+ * bounce buffer, otherwise copy from the bounce buffer to the original
+ * buffer.
+ *
+ * The original buffer may be in high memory; that's why @orig_addr is
+ * a physical address. Note that this is the address of the beginning
+ * of the bounce buffer. Copying starts at offset @tlb_offset. This is
+ * needed to check accesses beyond the allocated size.
+ */
+static void swiotlb_copy(struct device *dev, phys_addr_t orig_addr,
+		unsigned char *vaddr, size_t size, size_t alloc_size,
+		unsigned int tlb_offset, enum dma_data_direction dir)
+{
+	unsigned long pfn = PFN_DOWN(orig_addr);
+
 	if (tlb_offset > alloc_size) {
 		dev_WARN_ONCE(dev, 1,
 			"Buffer overflow detected. Allocation size: %zu. Mapping size: %zu+%u.\n",
@@ -734,15 +765,65 @@ static unsigned long mem_used(struct io_tlb_mem *mem)
 	return used;
 }
 
+/**
+ * swiotlb_fixed_map() - allocate a bounce buffer from fixed slots
+ * @dev:	device which maps the buffer
+ * @orig_addr:	address of the original buffer
+ * @alloc_size:	total size of the original buffer
+ * @alloc_align_mask:
+ *		required physical alignment of the I/O buffer
+ * @attrs:	optional DMA attributes for the map operation
+ *
+ * Search for a suitable slot or sequence of slots and initialize them
+ * for use with the original buffer.
+ *
+ * Return: Physical address of the bounce buffer, or %DMA_MAPPING_ERROR.
+ */
+static phys_addr_t swiotlb_fixed_map(struct device *dev, phys_addr_t orig_addr,
+			size_t alloc_size, unsigned int alloc_align_mask,
+			unsigned long attrs)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
+	int index = swiotlb_find_slots(dev, orig_addr,
+				       alloc_size + offset, alloc_align_mask);
+	unsigned int i;
+
+	if (index == -1)
+		return (phys_addr_t)DMA_MAPPING_ERROR;
+
+	/*
+	 * Save away the mapping from the original address to the DMA address.
+	 * This is needed when we sync the memory.  Then we sync the buffer if
+	 * needed.
+	 */
+	for (i = 0; i < nr_slots(alloc_size + offset); i++)
+		mem->slots[index + i].orig_addr = slot_addr(orig_addr, i);
+	return slot_addr(mem->start, index) + offset;
+}
+
+/**
+ * swiotlb_tbl_map_single() - map DMA buffer to a bounce buffer
+ * @dev:	device which maps the buffer
+ * @orig_addr:	address of the original buffer
+ * @mapping_size: size of the original buffer to be synced now
+ * @alloc_size:	total size of the original buffer
+ * @alloc_align_mask:
+ *		required physical alignment of the I/O buffer
+ * @dir:	direction of the data transfer
+ * @attrs:	optional DMA attributes for the map operation
+ *
+ * Create a mapping of the DMA buffer into a bounce buffer and copy the
+ * original data.
+ *
+ * Return: Physical address of the bounce buffer, or %DMA_MAPPING_ERROR.
+ */
 phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		unsigned int alloc_align_mask, enum dma_data_direction dir,
 		unsigned long attrs)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
-	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
-	unsigned int i;
-	int index;
 	phys_addr_t tlb_addr;
 
 	if (!mem || !mem->nslabs) {
@@ -760,24 +841,17 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
-	index = swiotlb_find_slots(dev, orig_addr,
-				   alloc_size + offset, alloc_align_mask);
-	if (index == -1) {
+	tlb_addr = swiotlb_fixed_map(dev, orig_addr, alloc_size,
+				     alloc_align_mask, attrs);
+
+	if (tlb_addr == (phys_addr_t)DMA_MAPPING_ERROR) {
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
-	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-				 alloc_size, mem->nslabs, mem_used(mem));
-		return (phys_addr_t)DMA_MAPPING_ERROR;
+				"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
+				alloc_size, mem->nslabs, mem_used(mem));
+		return tlb_addr;
 	}
 
-	/*
-	 * Save away the mapping from the original address to the DMA address.
-	 * This is needed when we sync the memory.  Then we sync the buffer if
-	 * needed.
-	 */
-	for (i = 0; i < nr_slots(alloc_size + offset); i++)
-		mem->slots[index + i].orig_addr = slot_addr(orig_addr, i);
-	tlb_addr = slot_addr(mem->start, index) + offset;
 	/*
 	 * When dir == DMA_FROM_DEVICE we could omit the copy from the orig
 	 * to the tlb buffer, if we knew for sure the device will
-- 
2.25.1

