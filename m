Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200CA91CB41
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 07:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E4610E213;
	Sat, 29 Jun 2024 05:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="PD5Yikpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3433110E213
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 05:23:23 +0000 (UTC)
Delivered-To: uwu@icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1719638598; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=N/pQoJ2HBGvk5OK+rAVXPycZXrx862RBstQIPY3TLRJFlxTQGNm3x5+pdTId6PIFR/xFLKl+zNYPmVdHX/u7stLAqPAXOiRYBSDGbWX0oQ+ZZ2MTBdFPweATWUa2FrJ1xwW0owIMVG2UGCJAwA4pbwtcphMmH9zrfDD48hs/Jtk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1719638598;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZiTmCeUwyWMd9DM1cMRWsanJUulWwCpqnbNYD4zrjzg=; 
 b=XiDgC3JhNqZXq3Dl/co1ZX9jCsgGaeO1sy4ayn2iV7CC/nzYUyRRrkmZ6CL0y39P5nHhg8Eqjn+Rc+pho9NGbri77nRrpO+I7ujk7UUGXAWuoen1utBAvgcCM/ZlsZ4baUYHX/7B/gBJanO+sGmdCcUdqUVGwGlOwHiG3XUX6XA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719638598; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZiTmCeUwyWMd9DM1cMRWsanJUulWwCpqnbNYD4zrjzg=;
 b=PD5Yikpx54BMenJrjK/5RN8Nx43MLhxJbJdCq4ryw9GJhTyAw3y3sT/SEk8dAoI5
 dkDAGn61fk51ei0dAE9cs+9R5eXuHNz26yvlI82iu9eg+eqTfLeroKmGzxjTTsafXss
 gy0M9q1usdBjzdZQf7yHgxn4rHin7T/qN1WOuJ1nqc+tmeU/Cr7dRZyeDgXycSPyGu/
 3E1PxqfdeesDrojoKPJdV4uM1q3J+Xh50PUARjTLX7e4eW5mGV/CZ8WjgeIbPlIVWXc
 RrdAStixwbiKk+JHHwq/sY2U5jKL9BL3benHiUfI8asoTw8bcipK5dup2XlVHYnpSHM
 1zMaMYQkAA==
Received: by mx.zohomail.com with SMTPS id 1719638596401770.5863508458222;
 Fri, 28 Jun 2024 22:23:16 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined when
 snooping not available
Date: Sat, 29 Jun 2024 13:22:47 +0800
Message-ID: <20240629052247.2653363-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240629052247.2653363-1-uwu@icenowy.me>
References: <20240629052247.2653363-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

As we can now acquire the presence of the full DMA coherency (snooping
capability) from ttm_device, we can now map the CPU side memory as
write-combined when cached is requested and snooping is not avilable.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 4 ++++
 drivers/gpu/drm/ttm/ttm_tt.c      | 4 ++++
 include/drm/ttm/ttm_caching.h     | 3 ++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 0b3f4267130c4..6519ce047787d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -302,6 +302,10 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 		caching = res->bus.caching;
 	}
 
+	/* Downgrade cached mapping for non-snooping devices */
+	if (!bo->bdev->dma_coherent && caching == ttm_cached)
+		caching = ttm_write_combined;
+
 	return ttm_prot_from_caching(caching, tmp);
 }
 EXPORT_SYMBOL(ttm_io_prot);
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 7b00ddf0ce49f..3335df45fba5e 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 			       enum ttm_caching caching,
 			       unsigned long extra_pages)
 {
+	/* Downgrade cached mapping for non-snooping devices */
+	if (!bo->bdev->dma_coherent && caching == ttm_cached)
+		caching = ttm_write_combined;
+
 	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
 	ttm->page_flags = page_flags;
 	ttm->dma_address = NULL;
diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_caching.h
index a18f43e93abab..f92d7911f50e4 100644
--- a/include/drm/ttm/ttm_caching.h
+++ b/include/drm/ttm/ttm_caching.h
@@ -47,7 +47,8 @@ enum ttm_caching {
 
 	/**
 	 * @ttm_cached: Fully cached like normal system memory, requires that
-	 * devices snoop the CPU cache on accesses.
+	 * devices snoop the CPU cache on accesses. Downgraded to
+	 * ttm_write_combined when the snooping capaiblity is missing.
 	 */
 	ttm_cached
 };
-- 
2.45.2

