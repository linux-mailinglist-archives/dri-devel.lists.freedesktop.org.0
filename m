Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803B96E772D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 12:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931BA10E91F;
	Wed, 19 Apr 2023 10:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com
 [14.137.139.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B120010E91F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 10:07:11 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.18.147.227])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4Q1bm875kkz9xFnC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:56:40 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.45.152.239])
 by APP1 (Coremail) with SMTP id LxC2BwAXi_aYvD9k7TY6Ag--.1944S9;
 Wed, 19 Apr 2023 11:06:42 +0100 (CET)
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
Subject: [PATCH v2 7/7] swiotlb: per-device flag if there are dynamically
 allocated buffers
Date: Wed, 19 Apr 2023 12:03:59 +0200
Message-Id: <08ec2c2baa9a24d2eae5d5107868fd6df0f7dd1c.1681898595.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
References: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LxC2BwAXi_aYvD9k7TY6Ag--.1944S9
X-Coremail-Antispam: 1UD129KBjvJXoWxWr1UWr47Jw1kZw4UKF48Zwb_yoW5uFW3pF
 y8uF98KF4qqFykZ3sF9w47uF47uw4q93y3CrWFgr1Fkry5X34rWF4kCry2y34rJr409F4x
 XryjvrWrAF17Ww7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmEb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
 Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
 rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
 AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E
 14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrV
 C2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE
 7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262
 kKe7AKxVWUtVW8ZwCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcI
 k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4U
 JVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8yxR3UUUUU==
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

Do not walk the list of dynamically allocated bounce buffers if the
list is empty. This avoids taking dma_io_tlb_dyn_lock for devices
which do not use any dynamically allocated bounce buffers.

When unmapping the last dynamically allocated bounce buffer, the
flag is set to false as soon as possible to allow skipping the
spinlock even before the list itself is updated.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 include/linux/device.h  | 4 ++++
 include/linux/swiotlb.h | 6 +++++-
 kernel/dma/swiotlb.c    | 6 ++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index e12d6092bb9c..131b6db7fb3f 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -511,6 +511,9 @@ struct device_physical_location {
  * @dma_io_tlb_dyn_slots:
  *		Dynamically allocated bounce buffers for this device.
  *		Not for driver use.
+ * @dma_io_tlb_have_dyn:
+ *		Does this device have any dynamically allocated bounce
+ *		buffers? Not for driver use.
  * @archdata:	For arch-specific additions.
  * @of_node:	Associated device tree node.
  * @fwnode:	Associated device node supplied by platform firmware.
@@ -618,6 +621,7 @@ struct device {
 	struct io_tlb_mem *dma_io_tlb_mem;
 	spinlock_t dma_io_tlb_dyn_lock;
 	struct list_head dma_io_tlb_dyn_slots;
+	bool dma_io_tlb_have_dyn;
 #endif
 	/* arch specific additions */
 	struct dev_archdata	archdata;
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index e614aa0f4f64..9ca4812b5977 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -143,7 +143,11 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 
 	return mem &&
 		(is_swiotlb_fixed(mem, paddr) ||
-		 (mem->allow_dyn && is_swiotlb_dyn(dev, paddr)));
+		 /* Pairs with smp_store_release() in swiotlb_dyn_map()
+		  * and swiotlb_dyn_unmap().
+		  */
+		 (smp_load_acquire(&dev->dma_io_tlb_have_dyn) &&
+		  is_swiotlb_dyn(dev, paddr)));
 }
 
 static inline bool is_swiotlb_force_bounce(struct device *dev)
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 4899fb0e4331..9b4faed7ef8f 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -685,6 +685,9 @@ static phys_addr_t swiotlb_dyn_map(struct device *dev, phys_addr_t orig_addr,
 
 	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
 	list_add(&slot->node, &dev->dma_io_tlb_dyn_slots);
+	if (!dev->dma_io_tlb_have_dyn)
+		/* Pairs with smp_load_acquire() in is_swiotlb_buffer() */
+		smp_store_release(&dev->dma_io_tlb_have_dyn, true);
 	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);
 
 	return page_to_phys(slot->page);
@@ -711,6 +714,9 @@ static void swiotlb_dyn_unmap(struct device *dev, phys_addr_t tlb_addr,
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
+	if (list_is_singular(&dev->dma_io_tlb_dyn_slots))
+		/* Pairs with smp_load_acquire() in is_swiotlb_buffer() */
+		smp_store_release(&dev->dma_io_tlb_have_dyn, false);
 	slot = lookup_dyn_slot_locked(dev, tlb_addr);
 	list_del(&slot->node);
 	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);
-- 
2.25.1

