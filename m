Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1D48721B8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 15:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336BA10E127;
	Tue,  5 Mar 2024 14:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5465 seconds by postgrey-1.36 at gabe;
 Tue, 05 Mar 2024 14:40:07 UTC
Received: from zg8tmty3ljk5ljewns4xndka.icoremail.net
 (zg8tmty3ljk5ljewns4xndka.icoremail.net [167.99.105.149])
 by gabe.freedesktop.org (Postfix) with ESMTP id 483A810E127;
 Tue,  5 Mar 2024 14:40:06 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [106.117.76.127])
 by mail-app3 (Coremail) with SMTP id cC_KCgAX+zSoLudlI534AQ--.59749S2;
 Tue, 05 Mar 2024 22:39:52 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, dakr@redhat.com, lyude@redhat.com,
 kherbst@redhat.com, timur@kernel.org, jani.nikula@linux.intel.com,
 Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH v2] nouveau/dmem: handle kcalloc() allocation failure
Date: Tue,  5 Mar 2024 22:39:36 +0800
Message-Id: <20240305143936.25283-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgAX+zSoLudlI534AQ--.59749S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trW5Aw4kur1fXw1DKr4kJFb_yoW8WrWfpF
 Z7Gr12vF4jya1jvry8KF48CF13AanxJay8Ka9Fy3sI9Fn5ZFy7C3y2yFyUWayFvr1fCrWv
 qr4kta4Y9F4jqwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwULAWXmGFMTDgAqsz
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kcalloc() in nouveau_dmem_evict_chunk() will return null if
the physical memory has run out. As a result, if we dereference
src_pfns, dst_pfns or dma_addrs, the null pointer dereference bugs
will happen.

Moreover, the GPU is going away. If the kcalloc() fails, we could not
evict all pages mapping a chunk. So this patch adds a __GFP_NOFAIL
flag in kcalloc().

Fixes: 249881232e14 ("nouveau/dmem: evict device private memory during release")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in v2:
  - Allocate with __GFP_NOFAIL.

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 12feecf71e7..f5ae9724ee2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -378,9 +378,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dma_addr_t *dma_addrs;
 	struct nouveau_fence *fence;
 
-	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
-	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
-	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
+	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
+	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
+	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
 			npages);
-- 
2.17.1

