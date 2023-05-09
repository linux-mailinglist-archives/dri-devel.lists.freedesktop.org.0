Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E9D6FC28A
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 11:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2203110E364;
	Tue,  9 May 2023 09:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com
 [14.137.139.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D31F10E363
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 09:19:22 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4QFsl60pKKz9xFrg
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 17:08:18 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.212.219])
 by APP2 (Coremail) with SMTP id GxC2BwDHdz7lD1pksN2OAg--.5S3;
 Tue, 09 May 2023 10:18:59 +0100 (CET)
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
Subject: [PATCH v2 RESEND 1/7] swiotlb: Use a helper to initialize swiotlb
 fields in struct device
Date: Tue,  9 May 2023 11:18:13 +0200
Message-Id: <3fe75f413b87dd2106c023e73f336231d16abc96.1683623618.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GxC2BwDHdz7lD1pksN2OAg--.5S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4DuF1Utry5Cry7Jw1xuFg_yoW8ZrWUpF
 97AayrGFW2gFs7CrW7C3s7AF1fKan7Ca4xCrya9wnYkrnxJr9xJFyDtrW5Awn5Jr409F4f
 JFySvryYkF1xAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
 A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
 Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
 Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAKzI0EY4
 vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
 2RwZUUUUU
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

Move swiotlb initialization code to swiotlb.h. This change also
allows to provide a stub implementation if swiotlb is not
configured, getting rid of an #ifdef in driver core.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 drivers/base/core.c     |  4 +---
 include/linux/swiotlb.h | 12 ++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 3dff5037943e..46d1d78c5beb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3108,9 +3108,7 @@ void device_initialize(struct device *dev)
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 	dev->dma_coherent = dma_default_coherent;
 #endif
-#ifdef CONFIG_SWIOTLB
-	dev->dma_io_tlb_mem = &io_tlb_default_mem;
-#endif
+	swiotlb_dev_init(dev);
 }
 EXPORT_SYMBOL_GPL(device_initialize);
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 7af2673b47ba..d851dbce1143 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -128,6 +128,15 @@ static inline bool is_swiotlb_force_bounce(struct device *dev)
 	return mem && mem->force_bounce;
 }
 
+/**
+ * swiotlb_dev_init() - initialize swiotlb fields in &struct device
+ * @dev: device to be initialized
+ */
+static inline void swiotlb_dev_init(struct device *dev)
+{
+	dev->dma_io_tlb_mem = &io_tlb_default_mem;
+}
+
 void swiotlb_init(bool addressing_limited, unsigned int flags);
 void __init swiotlb_exit(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
@@ -137,6 +146,9 @@ void __init swiotlb_adjust_size(unsigned long size);
 static inline void swiotlb_init(bool addressing_limited, unsigned int flags)
 {
 }
+static inline void swiotlb_dev_init(struct device *dev)
+{
+}
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
-- 
2.25.1

