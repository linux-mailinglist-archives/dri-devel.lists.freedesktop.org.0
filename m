Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE10EB5164E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD7810E8FA;
	Wed, 10 Sep 2025 12:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mWl+6sw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5037410E8FD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tW1USIXLc0Dq/y8H/P2lGfMn3/5IHhkvBVZxDJqMySM=; b=mWl+6sw9VSL0rb0RsKONU+vgJn
 X7gZmL4uVIk1Tk6yImBURvfpgHPXyqaFSodljIXY9ghTOhtLmvtJ+kY12nnpinlVKNABotfbX2aog
 PekrLbzKl6aw2nQ0sSkqEsiNZH12o6srSwQgOL0zfUjSba0jDWSjz6XHRUpzlBzvWLHQGHzK4hm5h
 +bOzAlKgKMwxJVCkManqJJ/0YV8BQfRkndehR6JUEaHAB5YFID7TCWcw+ws07g3BO+w+ujXTZ/zfM
 8R49lgBqi5GzDNNYLqJrnuBoUddBz6n3HkSTklGHuUqz8UDmnvhf9knwp9WGnfWOXLNFXOpN61Rzv
 oHTNrFOQ==;
Received: from 179-125-86-100-dinamico.pombonet.net.br ([179.125.86.100]
 helo=[127.0.0.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uwJUK-009NeO-5t; Wed, 10 Sep 2025 13:59:48 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Wed, 10 Sep 2025 08:59:30 -0300
Subject: [PATCH] drm: ttm: do not direct reclaim when allocating high order
 pages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com>
X-B4-Tracking: v=1; b=H4sIACFowWgC/x3MQQqDMBBG4avIrA2MKWLtVURCMH/aAU0kCVII3
 r2hmwff5lXKSIJMr65SwiVZYmgY+o62jw1vKHHNpFmPPPOsSjnMGeNuQjROErZiWnYrhwL4yZP
 V7uFBbXAmePn+58t63z+sY8enbAAAAA==
X-Change-ID: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
To: Christian Koenig <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.14.2
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

When the TTM pool tries to allocate new pages, it stats with max order. If
there are no pages ready in the system, the page allocator will start
reclaim. If direct reclaim fails, the allocator will reduce the order until
it gets all the pages it wants with whatever order the allocator succeeds
to reclaim.

However, while the allocator is reclaiming, lower order pages might be
available, which would work just fine for the pool allocator. Doing direct
reclaim just introduces latency in allocating memory.

The system should still start reclaiming in the background with kswapd, but
the pool allocator should try to allocate a lower order page instead of
directly reclaiming.

If not even a order-1 page is available, the TTM pool allocator will
eventually get to start allocating order-0 pages, at which point it should
and will directly reclaim.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index baf27c70a4193a121fbc8b4e67cd6feb4c612b85..6124a53cd15634c833bce379093b557d2a2660fd 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -144,9 +144,11 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 	 * Mapping pages directly into an userspace process and calling
 	 * put_page() on a TTM allocated page is illegal.
 	 */
-	if (order)
+	if (order) {
 		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
 			__GFP_THISNODE;
+		gfp_flags &= ~__GFP_DIRECT_RECLAIM;
+	}
 
 	if (!pool->use_dma_alloc) {
 		p = alloc_pages_node(pool->nid, gfp_flags, order);

---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

