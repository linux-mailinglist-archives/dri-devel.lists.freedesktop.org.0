Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD766FC29E
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 11:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A2810E365;
	Tue,  9 May 2023 09:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com
 [14.137.139.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A9210E365
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 09:20:46 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.18.147.229])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4QFsp20NQPz9v7JD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 17:10:50 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.212.219])
 by APP2 (Coremail) with SMTP id GxC2BwDHdz7lD1pksN2OAg--.5S9;
 Tue, 09 May 2023 10:20:22 +0100 (CET)
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Borislav Petkov <bp@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Kim Phillips <kim.phillips@amd.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 iommu@lists.linux.dev (open list:DMA MAPPING HELPERS)
Subject: [PATCH v2 RESEND 7/7] swiotlb: per-device flag if there are
 dynamically allocated buffers
Date: Tue,  9 May 2023 11:18:19 +0200
Message-Id: <69f9e058bb1ad95905a62a4fc8461b064872af97.1683623618.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GxC2BwDHdz7lD1pksN2OAg--.5S9
X-Coremail-Antispam: 1UD129KBjvJXoWxWr1UWr47Jw1kGryUAr4ktFb_yoW5uFW3pF
 y8uF98KF4qqFWkA3sF9w17uF17uw4q93y3CrWFgr1Fkry5X345WF4kCry2y34rJr409F4x
 XryjvrWrAF17Wr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPCb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
 Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
 rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
 AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E
 14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrV
 C2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE
 7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0264
 kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2Iq
 xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
 WY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8I
 cVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
 Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI
 43ZEXa7IU8gAw7UUUUU==
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
index d1d2b8557b30..e340e0f06dce 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -516,6 +516,9 @@ struct device_physical_location {
  * @dma_io_tlb_dyn_slots:
  *		Dynamically allocated bounce buffers for this device.
  *		Not for driver use.
+ * @dma_io_tlb_have_dyn:
+ *		Does this device have any dynamically allocated bounce
+ *		buffers? Not for driver use.
  * @archdata:	For arch-specific additions.
  * @of_node:	Associated device tree node.
  * @fwnode:	Associated device node supplied by platform firmware.
@@ -623,6 +626,7 @@ struct device {
 	struct io_tlb_mem *dma_io_tlb_mem;
 	spinlock_t dma_io_tlb_dyn_lock;
 	struct list_head dma_io_tlb_dyn_slots;
+	bool dma_io_tlb_have_dyn;
 #endif
 	/* arch specific additions */
 	struct dev_archdata	archdata;
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index daa2064f2ede..8cbb0bebb0bc 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -152,7 +152,11 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 
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
index 81eab1c72c50..e8be3ee50f18 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -642,6 +642,9 @@ static phys_addr_t swiotlb_dyn_map(struct device *dev, phys_addr_t orig_addr,
 
 	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
 	list_add(&slot->node, &dev->dma_io_tlb_dyn_slots);
+	if (!dev->dma_io_tlb_have_dyn)
+		/* Pairs with smp_load_acquire() in is_swiotlb_buffer() */
+		smp_store_release(&dev->dma_io_tlb_have_dyn, true);
 	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);
 
 	return page_to_phys(slot->page);
@@ -668,6 +671,9 @@ static void swiotlb_dyn_unmap(struct device *dev, phys_addr_t tlb_addr,
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

