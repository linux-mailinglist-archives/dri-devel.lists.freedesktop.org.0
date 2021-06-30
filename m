Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4543E3B89C0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 22:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0206EA7E;
	Wed, 30 Jun 2021 20:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307EB6EA7E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 20:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=xTIvq7JeERaP44xmsJM3Rl+J9yNC0I1vFHCkU0Gk1ls=; b=ZAk/0tshkV3bIKnweqX8zlrT5B
 6qqMrqdo+EG92wpGBZ3aOmd0tq5oHvXAW/rirIH/pAD13jDZZ59nxGvdmcLJhmwuBW/lRqohfWlWa
 b2JwaCb4QlvURfGocqQ4ZuE9DFC/BM90pGzhPPMITeYjg6un4Z8c1BqvY9+CedgxxDLE7EsNTahxA
 cpEEud7AVAeOLakhN9Li2qCzJhCEHeCzPxWzWrUlF/H6GVwA/f66A4kySze/4gbBJm7h11aHzfQ10
 1Jq1I9ODqY+OSxW+gzVRC8ALYavtYjJyJ7YL8iToAsT6V1StyPRBKIJxxIDE0jcBcxxEQObGIHc5P
 RT4Wlv4Q==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lygtB-00FDiE-NU; Wed, 30 Jun 2021 20:32:53 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] drm: vmwgfx: add header file for ttm_range_manager
Date: Wed, 30 Jun 2021 13:32:52 -0700
Message-Id: <20210630203252.32471-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a header file for ttm_range_manager function prototypes to
eliminate build errors:

../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function ‘vmw_vram_manager_init’:
../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:678:8: error: implicit declaration of function ‘ttm_range_man_init’; did you mean ‘ttm_tt_mgr_init’? [-Werror=implicit-function-declaration]
  ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function ‘vmw_vram_manager_fini’:
../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:690:2: error: implicit declaration of function ‘ttm_range_man_fini’; did you mean ‘ttm_pool_mgr_fini’? [-Werror=implicit-function-declaration]
  ttm_range_man_fini(&dev_priv->bdev, TTM_PL_VRAM);

Fixes: 9c3006a4cc1b ("drm/ttm: remove available_caching")
Fixes: a343160235f5 ("drm/vmwgfx/ttm: fix the non-THP cleanup path.")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: "VMware Graphics" <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210630.orig/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ linux-next-20210630/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -37,6 +37,7 @@
 #include <drm/drm_sysfs.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
 #include <generated/utsrelease.h>
 
 #include "ttm_object.h"
