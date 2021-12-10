Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5675470E9D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 00:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF4210E589;
	Fri, 10 Dec 2021 23:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EC010E574;
 Fri, 10 Dec 2021 23:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639178651; x=1670714651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jCKk2csSz0SQx21NAsEF7Oy/PZTrkEvuuAP1e36rVeQ=;
 b=Z8fPwvAMJd2XbMmTTZWsGxLasR1abgd5B9LLG1F8MiWJZGQTF8Loca36
 VfFLULbGtDTH4XO+ozUCV4JDH+J/dMbKvohYKUSxFmCkRFyCiQMPl0/7E
 AKkpA3e3bms1hpBc10zOaYrQDsGljJxlmYFb3ZSGC6BWvcZQplTC5Yi2U
 aWuKDn86cZKUFWaFLb1CNDgk262QTnuKemTWITo34yjPqTc5Js88vyKlb
 CiGLiKaHNhY+v1zRa6NxQ32ZFdWHrfvncgkxXgZtjeHkMAtn4PUShcRkd
 Ugz2biNQiX8+Xzyl6oEQdIaxppnjcA0x6FFMXcw4bzPXp+8fGQIbpqHUj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237212370"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="237212370"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 15:24:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="463861449"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 15:24:10 -0800
From: ira.weiny@intel.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 3/7] drm/gma: Remove calls to kmap()
Date: Fri, 10 Dec 2021 15:24:00 -0800
Message-Id: <20211210232404.4098157-4-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210232404.4098157-1-ira.weiny@intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
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
index cbcecbaa041b..caf7c7b321a9 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -334,7 +334,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 	struct gtt_range *gt;
 	struct gtt_range *cursor_gt = gma_crtc->cursor_gt;
 	struct drm_gem_object *obj;
-	void *tmp_dst, *tmp_src;
+	void *tmp_dst;
 	int ret = 0, i, cursor_pages;
 
 	/* If we didn't get a handle then turn the cursor off */
@@ -400,9 +400,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 		/* Copy the cursor to cursor mem */
 		tmp_dst = dev_priv->vram_addr + cursor_gt->offset;
 		for (i = 0; i < cursor_pages; i++) {
-			tmp_src = kmap(gt->pages[i]);
-			memcpy(tmp_dst, tmp_src, PAGE_SIZE);
-			kunmap(gt->pages[i]);
+			memcpy_from_page(tmp_dst, gt->pages[i], 0, PAGE_SIZE);
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

