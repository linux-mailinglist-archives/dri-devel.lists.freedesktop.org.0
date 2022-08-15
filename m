Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8159FFBF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFBF14A2A0;
	Wed, 24 Aug 2022 16:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97716A8A90
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 09:55:41 +0000 (UTC)
Received: from dimapc.. (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C74E366016A1;
 Mon, 15 Aug 2022 10:55:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660557339;
 bh=zaXcPVUZxkdbpr2itiBa39wL3eHk/P8Ka7Jms7D1Uxs=;
 h=From:To:Cc:Subject:Date:From;
 b=nn2FXdBGgkdyeCuzWeFNE+CZBjGphBbWrlU+pWSfPGogHI8XKwIbbh1pPgFWkq2NQ
 H8pknAh1ogquLUmudfBHSiWMGE/VktpxBd57FZb6N74wUjXVc/IfBdgYYBjYs/xx6F
 4GDn0sSyc5AbKiHjlc02yIVEYSFuvT6BBB1bH1h5s92RWn6fwB12xQP985eDpfUaK7
 rvUICptj6DFpdYG2Fc+diH3rNrejGuBqTUNnCreL7X9gFPYmayFudVKigGtjzNCfYT
 Fb1XGNGD0kFaztjuMnEM/FNtFtJv+qKAWFXXVBdsl3UxuRbNiyxvkYMY4nvPfpN0W+
 048ukBrErzMUw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: [PATCH v1] drm/ttm: Refcount allocated tail pages
Date: Mon, 15 Aug 2022 12:54:23 +0300
Message-Id: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.2
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Higher order pages allocated using alloc_pages() aren't refcounted and they
need to be refcounted, otherwise it's impossible to map them by KVM. This
patch sets the refcount of the tail pages and fixes the KVM memory mapping
faults.

Without this change guest virgl driver can't map host buffers into guest
and can't provide OpenGL 4.5 profile support to the guest. The host
mappings are also needed for enabling the Venus driver using host GPU
drivers that are utilizing TTM.

Based on a patch proposed by Trigger Huang.

Cc: stable@vger.kernel.org
Cc: Trigger Huang <Trigger.Huang@gmail.com>
Link: https://www.collabora.com/news-and-blog/blog/2021/11/26/venus-on-qemu-enabling-new-virtual-vulkan-driver/#qcom1343
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # AMDGPU (Qemu and crosvm)
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 21b61631f73a..11e92bb149c9 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -81,6 +81,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
 	struct ttm_pool_dma *dma;
 	struct page *p;
+	unsigned int i;
 	void *vaddr;
 
 	/* Don't set the __GFP_COMP flag for higher order allocations.
@@ -93,8 +94,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 
 	if (!pool->use_dma_alloc) {
 		p = alloc_pages(gfp_flags, order);
-		if (p)
+		if (p) {
 			p->private = order;
+			goto ref_tail_pages;
+		}
 		return p;
 	}
 
@@ -120,6 +123,23 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 
 	dma->vaddr = (unsigned long)vaddr | order;
 	p->private = (unsigned long)dma;
+
+ref_tail_pages:
+	/*
+	 * KVM requires mapped tail pages to be refcounted because put_page()
+	 * is invoked on them in the end of the page fault handling, and thus,
+	 * tail pages need to be protected from the premature releasing.
+	 * In fact, KVM page fault handler refuses to map tail pages to guest
+	 * if they aren't refcounted because hva_to_pfn_remapped() checks the
+	 * refcount specifically for this case.
+	 *
+	 * In particular, unreferenced tail pages result in a KVM "Bad address"
+	 * failure for VMMs that use VirtIO-GPU when guest's Mesa VirGL driver
+	 * accesses mapped host TTM buffer that contains tail pages.
+	 */
+	for (i = 1; i < 1 << order; i++)
+		page_ref_inc(p + i);
+
 	return p;
 
 error_free:
@@ -133,6 +153,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 {
 	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
 	struct ttm_pool_dma *dma;
+	unsigned int i;
 	void *vaddr;
 
 #ifdef CONFIG_X86
@@ -142,6 +163,8 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 	if (caching != ttm_cached && !PageHighMem(p))
 		set_pages_wb(p, 1 << order);
 #endif
+	for (i = 1; i < 1 << order; i++)
+		page_ref_dec(p + i);
 
 	if (!pool || !pool->use_dma_alloc) {
 		__free_pages(p, order);
-- 
2.37.2

