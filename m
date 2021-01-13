Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444342F4A31
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 12:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477FE6E563;
	Wed, 13 Jan 2021 11:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0999A6E563
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 11:31:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 888B7AF0D;
 Wed, 13 Jan 2021 11:31:13 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tiantao6@hisilicon.com
Subject: [PATCH] drm/hisilicon/hibmc: Remove hibmc_ttm.c
Date: Wed, 13 Jan 2021 12:31:07 +0100
Message-Id: <20210113113107.12005-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 dri-devel@lists.freedesktop.org, Gong junjie <gongjunjie2@huawei.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The file is not in use. It got re-added by a rebased patch. Removing
it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 4d4dad21cc7b ("drm/hibmc: Remove references to struct drm_device.pdev")
Reported-by: Tian Tao <tiantao6@hisilicon.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao  <tiantao6@hisilicon.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Gong junjie <gongjunjie2@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c | 61 ---------------------
 1 file changed, 61 deletions(-)
 delete mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
deleted file mode 100644
index 77f075075db2..000000000000
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* Hisilicon Hibmc SoC drm driver
- *
- * Based on the bochs drm driver.
- *
- * Copyright (c) 2016 Huawei Limited.
- *
- * Author:
- *	Rongrong Zou <zourongrong@huawei.com>
- *	Rongrong Zou <zourongrong@gmail.com>
- *	Jianhua Li <lijianhua@huawei.com>
- */
-
-#include <linux/pci.h>
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_gem.h>
-#include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_gem_vram_helper.h>
-#include <drm/drm_print.h>
-
-#include "hibmc_drm_drv.h"
-
-int hibmc_mm_init(struct hibmc_drm_private *hibmc)
-{
-	struct drm_vram_mm *vmm;
-	int ret;
-	struct drm_device *dev = hibmc->dev;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-
-	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(pdev, 0),
-				       hibmc->fb_size);
-	if (IS_ERR(vmm)) {
-		ret = PTR_ERR(vmm);
-		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
-{
-	if (!hibmc->dev->vram_mm)
-		return;
-
-	drm_vram_helper_release_mm(hibmc->dev);
-}
-
-int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
-		      struct drm_mode_create_dumb *args)
-{
-	return drm_gem_vram_fill_create_dumb(file, dev, 0, 128, args);
-}
-
-const struct drm_mode_config_funcs hibmc_mode_funcs = {
-	.mode_valid = drm_vram_helper_mode_valid,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
-	.fb_create = drm_gem_fb_create,
-};
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
