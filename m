Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE9D376F4D
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 05:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F466E850;
	Sat,  8 May 2021 03:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246B06E852
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 03:56:20 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FcYMT1TF9z16Pc9;
 Sat,  8 May 2021 11:53:41 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 11:56:10 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] drm/mga: Fix error return code in
 mga_do_pci_dma_bootstrap()
Date: Sat, 8 May 2021 11:55:54 +0800
Message-ID: <20210508035554.2424-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The user may incorrectly set the value of dma_bs->secondary_bin_count to 0.
In this case, the for loop is not entered and the 'err' value remains 0.

Fixes: 6795c985a648 ("Add support for PCI MGA cards to MGA DRM.")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/mga/mga_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mga/mga_dma.c b/drivers/gpu/drm/mga/mga_dma.c
index 1cb7d120d18f..e41d44ec26de 100644
--- a/drivers/gpu/drm/mga/mga_dma.c
+++ b/drivers/gpu/drm/mga/mga_dma.c
@@ -693,7 +693,7 @@ static int mga_do_pci_dma_bootstrap(struct drm_device *dev,
 	}
 
 	if (bin_count == 0) {
-		DRM_ERROR("Unable to add secondary DMA buffers: %d\n", err);
+		DRM_ERROR("Unable to add secondary DMA buffers: %d\n", err ? : -EINVAL);
 		return err;
 	}
 
-- 
2.25.1


