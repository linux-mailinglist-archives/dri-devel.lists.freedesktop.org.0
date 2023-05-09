Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99616FC290
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 11:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31DE10E366;
	Tue,  9 May 2023 09:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com
 [14.137.139.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3610010E366
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 09:19:50 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4QFsmy25tpz9v7J8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 17:09:54 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.212.219])
 by APP2 (Coremail) with SMTP id GxC2BwDHdz7lD1pksN2OAg--.5S5;
 Tue, 09 May 2023 10:19:27 +0100 (CET)
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
Subject: [PATCH v2 RESEND 3/7] dma-mapping: introduce the DMA_ATTR_MAY_SLEEP
 attribute
Date: Tue,  9 May 2023 11:18:15 +0200
Message-Id: <5d00f29ab7f26a5de32c93792df32b689ccd9f3f.1683623618.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GxC2BwDHdz7lD1pksN2OAg--.5S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF17ur1rGrWUZw18GFy5XFb_yoW8Cw48p3
 ZagFyfGrZ2gr1xCr1kG3W29r4UXa18u345GF40vr1rZFW5A3Z29rZ8Kw1Yq3s8XryxCFWF
 vrW29ry5CryqyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPmb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
 A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2
 WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkE
 bVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0264kExV
 AvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
 x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r
 4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
 1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
 AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZE
 Xa7IU86BT5UUUUU==
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

Introduce a DMA attribute to tell the DMA-mapping subsystem that
the operation is allowed to sleep.

This patch merely adds the flag, but it does not do anything at
the moment.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 Documentation/core-api/dma-attributes.rst | 10 ++++++++++
 include/linux/dma-mapping.h               |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
index 1887d92e8e92..9ce00926455f 100644
--- a/Documentation/core-api/dma-attributes.rst
+++ b/Documentation/core-api/dma-attributes.rst
@@ -130,3 +130,13 @@ accesses to DMA buffers in both privileged "supervisor" and unprivileged
 subsystem that the buffer is fully accessible at the elevated privilege
 level (and ideally inaccessible or at least read-only at the
 lesser-privileged levels).
+
+DMA_ATTR_MAY_SLEEP
+------------------
+
+This tells the DMA-mapping subsystem that it is allowed to sleep. For example,
+if mapping needs a bounce buffer, software IO TLB may use CMA for the
+allocation if this flag is given.
+
+This attribute is not used for dma_alloc\* functions. Instead, the provided
+GFP flags are used to determine whether the allocation may sleep.
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 0ee20b764000..7a75c503ac38 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -61,6 +61,12 @@
  */
 #define DMA_ATTR_PRIVILEGED		(1UL << 9)
 
+/*
+ * DMA_ATTR_MAY_SLEEP: This tells the DMA-mapping subsystem that it is allowed
+ * to sleep.
+ */
+#define DMA_ATTR_MAY_SLEEP		(1UL << 10)
+
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
  * be given to a device to use as a DMA source or target.  It is specific to a
-- 
2.25.1

