Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D194F6FC298
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 11:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA97910E36B;
	Tue,  9 May 2023 09:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com
 [14.137.139.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA1010E36B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 09:20:32 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4QFsmR61Yvz9v7Gm
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 17:09:27 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.212.219])
 by APP2 (Coremail) with SMTP id GxC2BwDHdz7lD1pksN2OAg--.5S8;
 Tue, 09 May 2023 10:20:08 +0100 (CET)
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
Subject: [PATCH v2 RESEND 6/7] drm: Use DMA_ATTR_MAY_SLEEP from process context
Date: Tue,  9 May 2023 11:18:18 +0200
Message-Id: <ec83fcc727c7749924a3e146f1731d93c2b6ba08.1683623618.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GxC2BwDHdz7lD1pksN2OAg--.5S8
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4kXFWDJF1Duw1rJry5Jwb_yoW8XFWkpF
 4xAFyqqrW0qFZYva9rZ3WkZa43ua17tFWxua4UJ395u3WYyF9FgryYy3y2qrWDAr97Xr4S
 qr9Fyryjyry2kFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

These mappings are never done from atomic context. If a dynamically
allocated bounce buffer is used for the mapping, this change allows
to allocate from CMA.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 drivers/gpu/drm/drm_prime.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4ea6507a77e5..b32dcefb17a9 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -709,7 +709,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, DMA_ATTR_MAY_SLEEP);
 	if (ret)
 		goto err_free_sgt;
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d29dafce9bb0..ac28489943b8 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -639,7 +639,7 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 		return sgt;
 
 	ret = dma_map_sgtable(attach->dev, sgt, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC);
+			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MAY_SLEEP);
 	if (ret) {
 		sg_free_table(sgt);
 		kfree(sgt);
-- 
2.25.1

