Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 150CE6D3938
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 18:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B935410E124;
	Sun,  2 Apr 2023 16:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB6110E0F1;
 Sun,  2 Apr 2023 16:49:18 +0000 (UTC)
Received: from workpc.. (109-252-124-32.nat.spd-mgts.ru [109.252.124.32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EA3226602E9A;
 Sun,  2 Apr 2023 17:49:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680454157;
 bh=HiyDIkUkEjDEJF+osjkxQkulrceoXx475BclUH016Os=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cwC+tKlUtghtXqFxGAXYwzku4b2+TE0IjQ12simTDuoet2q0PP4V1f6uHSx47V3WP
 KQ8nFsLvFAGWHb4+uIWHwUB04Mz3cQq98ImYA70IIPzQHvZfaRR5tP5UTfKLm1+F/O
 ApvhCHuHxl7JOXBkAzMxNf+2LTi4F8RCwUGPHRLlN1USR4t3/KRK48vHaHwIp3VdPF
 N6vAVjXaBHt0k0q4jEUkOxxF6cC52ghP8fXF/iSoQMNasnzJtfOgHdP2pVeiLnHaef
 3xBFze+MosYws9gNT+MOelFRJipTQiL64js8gKnDqMAD63kD7RGXenT5+MOP+lCSzv
 oI1I1BZswh6jQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Subject: [PATCH v1 2/7] Revert "dma-buf/heaps: Assert held reservation lock
 for dma-buf mmapping"
Date: Sun,  2 Apr 2023 19:48:21 +0300
Message-Id: <20230402164826.752842-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230402164826.752842-1-dmitry.osipenko@collabora.com>
References: <20230402164826.752842-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't assert held dma-buf reservation lock on memory mapping of exported
buffer.

We're going to change dma-buf mmap() locking policy such that exporters
will have to handle the lock. The previous locking policy caused deadlock
problem for DRM drivers in a case of self-imported dma-bufs, it's solved
by moving the lock down to exporters.

Fixes: 27f3733a1049 ("dma-buf/heaps: Assert held reservation lock for dma-buf mmapping")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 3 ---
 drivers/dma-buf/heaps/system_heap.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 1131fb943992..28fb04eccdd0 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -13,7 +13,6 @@
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
 #include <linux/dma-map-ops.h>
-#include <linux/dma-resv.h>
 #include <linux/err.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
@@ -183,8 +182,6 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 {
 	struct cma_heap_buffer *buffer = dmabuf->priv;
 
-	dma_resv_assert_held(dmabuf->resv);
-
 	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
 		return -EINVAL;
 
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index e8bd10e60998..fcf836ba9c1f 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -13,7 +13,6 @@
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-heap.h>
-#include <linux/dma-resv.h>
 #include <linux/err.h>
 #include <linux/highmem.h>
 #include <linux/mm.h>
@@ -202,8 +201,6 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	struct sg_page_iter piter;
 	int ret;
 
-	dma_resv_assert_held(dmabuf->resv);
-
 	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
 		struct page *page = sg_page_iter_page(&piter);
 
-- 
2.39.2

