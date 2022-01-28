Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE449F54C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12491123A9;
	Fri, 28 Jan 2022 08:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB57112383;
 Fri, 28 Jan 2022 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358978; x=1674894978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1U7pwJGMWLiJdfXnMg2A6L06pGkJX6HEaTyDzBjv1+4=;
 b=hlyE7Huxj0AP65B/HWmgbpb3XIS1edtZ35fNJfnq/P1Tm4asf28JXxHQ
 JV6AWM98E7RtAAmIq6XHo/38a76ubxiS2NBJmqHUhBAAVqLZJPUtDbcxv
 hteAtetX67bhExeF1r1aVva6bCVba8ddR9zM092joJImC01jE97qLofoi
 QbChzh5i6XuDWaAFaNc7qUWR4TIv6eEbjjTBH9k/Keu8MA+Er6tPJXSay
 b+dD5rsSaYl+jzx0O+5jNg+q5q9ZHpmV6/E1WMUG8+sw7IERKj2pjKbsp
 nzELAmkc+HtKYkMI9hkg1inhE7aXXRxxK1Rtvdsx0tYauYE/XJTooONpW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="333430492"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="333430492"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788757"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/14] drm/tegra: Replace dma-buf-map with iosys-map
Date: Fri, 28 Jan 2022 00:36:22 -0800
Message-Id: <20220128083626.3012259-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

iosys-map is the new name for dma-buf-map and will gain new
capabitilities. Replace with the new API in tegra.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/tegra/gem.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index fce0e52973c2..0063403ab5e1 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -174,7 +174,7 @@ static void tegra_bo_unpin(struct host1x_bo_mapping *map)
 static void *tegra_bo_mmap(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
-	struct dma_buf_map map;
+	struct iosys_map map;
 	int ret;
 
 	if (obj->vaddr) {
@@ -191,7 +191,7 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
 static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
-	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(addr);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(addr);
 
 	if (obj->vaddr)
 		return;
@@ -699,17 +699,17 @@ static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
 	return __tegra_gem_mmap(gem, vma);
 }
 
-static int tegra_gem_prime_vmap(struct dma_buf *buf, struct dma_buf_map *map)
+static int tegra_gem_prime_vmap(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct drm_gem_object *gem = buf->priv;
 	struct tegra_bo *bo = to_tegra_bo(gem);
 
-	dma_buf_map_set_vaddr(map, bo->vaddr);
+	iosys_map_set_vaddr(map, bo->vaddr);
 
 	return 0;
 }
 
-static void tegra_gem_prime_vunmap(struct dma_buf *buf, struct dma_buf_map *map)
+static void tegra_gem_prime_vunmap(struct dma_buf *buf, struct iosys_map *map)
 {
 }
 
-- 
2.35.0

