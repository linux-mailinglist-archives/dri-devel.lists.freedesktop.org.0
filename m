Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A346A2DB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19E073DF7;
	Mon,  6 Dec 2021 17:26:48 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFFF73C45
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:42 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1000B29F4A3;
 Mon,  6 Dec 2021 17:26:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811601; bh=4NHO8DTjmU7ohMV1wM/0pu399X1/jJ7h+xlPEfsG2fw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C5dJFz0ZvSwmE78ysja3BfTBPD2m6dBAL7We1sgCf79HWNYasOwVU62IHZ3Z0prUk
 xdt+eFOhXq4ShjgYgZytqgo0Y1he1xch5g6/q2OqSTMH0RxTuAEtHFev6du2iDn+YS
 FkH63y3wYStdG6b3ctOLW/7A/X4JLuaqrvRAM/6fJzsgLqhPyFIbsFM0BjosNGJ1Kb
 zVvs/zfJXFJFilqrS2B4J7BZXOZfNMDideEpFEIv7OuCBcCjmnkYKSe3/h98lWctfA
 D7dO7JXhPb/Rypv4fgVzm436+ngTnLiqfg2v14Zd3xch5zHcA0XtK8tSJ4r6AhJDir
 I+/cRiV8p0x6Q==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 11/12] drm/vmwgfx: Remove usage of MOBFMT_RANGE
Date: Mon,  6 Dec 2021 12:26:19 -0500
Message-Id: <20211206172620.3139754-12-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206172620.3139754-1-zack@kde.org>
References: <20211206172620.3139754-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Using MOBFMT_RANGE in the early days of guest backed objects was a major
performance win but that has changed a lot since. There's no more
a performance reason to use MOBFMT_RANGE. The device can/will still
profit from the pages being contiguous but marking them as MOBFMT_RANGE
no longer matters.
Benchmarks (e.g. heaven, valley) show that creating page tables
for mob memory is actually faster than using mobfmt ranges.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c        |  6 ------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 12 ------------
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 21dd69e5cdfb..1760ba1b0d4a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -333,7 +333,6 @@ struct vmw_sg_table {
 	struct page **pages;
 	const dma_addr_t *addrs;
 	struct sg_table *sgt;
-	unsigned long num_regions;
 	unsigned long num_pages;
 };
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
index 65f7c2bdc322..2d91a44a3b22 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
@@ -146,9 +146,6 @@ static int vmw_setup_otable_base(struct vmw_private *dev_priv,
 	if (otable->size <= PAGE_SIZE) {
 		mob->pt_level = VMW_MOBFMT_PTDEPTH_0;
 		mob->pt_root_page = vmw_piter_dma_addr(&iter);
-	} else if (vsgt->num_regions == 1) {
-		mob->pt_level = SVGA3D_MOBFMT_RANGE;
-		mob->pt_root_page = vmw_piter_dma_addr(&iter);
 	} else {
 		ret = vmw_mob_pt_populate(dev_priv, mob);
 		if (unlikely(ret != 0))
@@ -623,9 +620,6 @@ int vmw_mob_bind(struct vmw_private *dev_priv,
 	if (likely(num_data_pages == 1)) {
 		mob->pt_level = VMW_MOBFMT_PTDEPTH_0;
 		mob->pt_root_page = vmw_piter_dma_addr(&data_iter);
-	} else if (vsgt->num_regions == 1) {
-		mob->pt_level = SVGA3D_MOBFMT_RANGE;
-		mob->pt_root_page = vmw_piter_dma_addr(&data_iter);
 	} else if (unlikely(mob->pt_bo == NULL)) {
 		ret = vmw_mob_pt_populate(dev_priv, mob);
 		if (unlikely(ret != 0))
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 20f752ff6168..b84ecc6d6611 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -288,8 +288,6 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 {
 	struct vmw_private *dev_priv = vmw_tt->dev_priv;
 	struct vmw_sg_table *vsgt = &vmw_tt->vsgt;
-	struct vmw_piter iter;
-	dma_addr_t old;
 	int ret = 0;
 
 	if (vmw_tt->mapped)
@@ -321,16 +319,6 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 		break;
 	}
 
-	old = ~((dma_addr_t) 0);
-	vmw_tt->vsgt.num_regions = 0;
-	for (vmw_piter_start(&iter, vsgt, 0); vmw_piter_next(&iter);) {
-		dma_addr_t cur = vmw_piter_dma_addr(&iter);
-
-		if (cur != old + PAGE_SIZE)
-			vmw_tt->vsgt.num_regions++;
-		old = cur;
-	}
-
 	vmw_tt->mapped = true;
 	return 0;
 
-- 
2.32.0

