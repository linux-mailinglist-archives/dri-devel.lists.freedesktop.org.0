Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E344497711
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 02:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC0C10E5C5;
	Mon, 24 Jan 2022 01:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574B410E27C;
 Mon, 24 Jan 2022 01:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642989254; x=1674525254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+LXecIMRVcm+6l6u17VPJeZsX7SGcDdtoraU1ufkp0U=;
 b=R5xyLskPBTZNg58Kl/RPA5/3s7uSoIYM/XXZGmgN7bKkeqjdO44ODBUc
 JzQ8UMsLgq4YyfHs63pUMNoV40cVaW7bZdgAo/SAcbOESCEGvfnTo3JOj
 oZjIixLOl6XBjVpTE09R5jbkmqbYFCwlYKSrfy4pMWXZVWPBuoub++QpC
 dtW3UNaQutkloRSpQnfbTPjEXQiJ+8Cq+yxvzTOwpqJq+5Rlf76SrX+bK
 qGJ3Nf7TRkreXbMjo5gqaGsK9eGGuE3/dVzLcdZspcJREWftHDWXqbYzM
 493fJ7c0KTr/vTx65y8RB0JFBfpO6CS66mqyVCSwAE+IxmuQywMOLC0vY A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="226616219"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="226616219"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:54:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="627320393"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:54:13 -0800
From: ira.weiny@intel.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH V2 3/7] drm/gma: Remove calls to kmap()
Date: Sun, 23 Jan 2022 17:54:05 -0800
Message-Id: <20220124015409.807587-4-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220124015409.807587-1-ira.weiny@intel.com>
References: <20220124015409.807587-1-ira.weiny@intel.com>
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
 amd-gfx@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

kmap() is being deprecated and these instances are easy to convert to
kmap_local_page().

Furthermore, in gma_crtc_cursor_set() use the memcpy_from_page() helper
instead of an open coded use of kmap_local_page().

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/gpu/drm/gma500/gma_display.c | 6 ++----
 drivers/gpu/drm/gma500/mmu.c         | 8 ++++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index 99da3118131a..60ba7de59139 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -335,7 +335,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 	struct psb_gem_object *pobj;
 	struct psb_gem_object *cursor_pobj = gma_crtc->cursor_pobj;
 	struct drm_gem_object *obj;
-	void *tmp_dst, *tmp_src;
+	void *tmp_dst;
 	int ret = 0, i, cursor_pages;
 
 	/* If we didn't get a handle then turn the cursor off */
@@ -400,9 +400,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 		/* Copy the cursor to cursor mem */
 		tmp_dst = dev_priv->vram_addr + cursor_pobj->offset;
 		for (i = 0; i < cursor_pages; i++) {
-			tmp_src = kmap(pobj->pages[i]);
-			memcpy(tmp_dst, tmp_src, PAGE_SIZE);
-			kunmap(pobj->pages[i]);
+			memcpy_from_page(tmp_dst, pobj->pages[i], 0, PAGE_SIZE);
 			tmp_dst += PAGE_SIZE;
 		}
 
diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
index fe9ace2a7967..a70b01ccdf70 100644
--- a/drivers/gpu/drm/gma500/mmu.c
+++ b/drivers/gpu/drm/gma500/mmu.c
@@ -184,17 +184,17 @@ struct psb_mmu_pd *psb_mmu_alloc_pd(struct psb_mmu_driver *driver,
 		pd->invalid_pte = 0;
 	}
 
-	v = kmap(pd->dummy_pt);
+	v = kmap_local_page(pd->dummy_pt);
 	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
 		v[i] = pd->invalid_pte;
 
-	kunmap(pd->dummy_pt);
+	kunmap_local(v);
 
-	v = kmap(pd->p);
+	v = kmap_local_page(pd->p);
 	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
 		v[i] = pd->invalid_pde;
 
-	kunmap(pd->p);
+	kunmap_local(v);
 
 	clear_page(kmap(pd->dummy_page));
 	kunmap(pd->dummy_page);
-- 
2.31.1

