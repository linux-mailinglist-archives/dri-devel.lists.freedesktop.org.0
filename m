Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD2C3A4C74
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jun 2021 05:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB616E06B;
	Sat, 12 Jun 2021 03:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DF86E06B
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 03:35:44 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G23Bt4nr1z1BLdb;
 Sat, 12 Jun 2021 11:30:46 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sat, 12 Jun 2021 11:35:42 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 12
 Jun 2021 11:35:41 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <linux-graphics-maintainer@vmware.com>, <sroland@vmware.com>,
 <zackr@vmware.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <airlied@redhat.com>
Subject: [PATCH -next] drm/vmwgfx/ttm: Fix build error without
 CONFIG_TRANSPARENT_HUGEPAGE
Date: Sat, 12 Jun 2021 11:35:38 +0800
Message-ID: <20210612033538.42916-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function ‘vmw_vram_manager_init’:
drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:678:8: error: implicit declaration of function ‘ttm_range_man_init’;
 did you mean ‘ttm_tt_mgr_init’? [-Werror=implicit-function-declaration]
  ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
        ^~~~~~~~~~~~~~~~~~
        ttm_tt_mgr_init

Add missing include to fix this.

Fixes: 252f8d7b9174 ("drm/vmwgfx/ttm: convert vram mm init to new code paths")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 6f5ea00973e0..6eb93aa2f311 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -37,6 +37,7 @@
 #include <drm/drm_sysfs.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
 #include <generated/utsrelease.h>
 
 #include "ttm_object.h"
-- 
2.17.1

