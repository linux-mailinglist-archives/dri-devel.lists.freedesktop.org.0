Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DA25CBCB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 23:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6536E082;
	Thu,  3 Sep 2020 21:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 862686E082;
 Thu,  3 Sep 2020 21:04:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB1381045;
 Thu,  3 Sep 2020 14:04:07 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D4DE3F68F;
 Thu,  3 Sep 2020 14:04:07 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH] drm/msm: Drop local dma_parms
Date: Thu,  3 Sep 2020 22:04:03 +0100
Message-Id: <7914512e76103ca81d5e6edf8971508b5e8e17a6.1599166862.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
for platform devices"), struct platform_device already provides a
dma_parms structure, so we can save allocating another one.

Also the DMA segment size is simply a size, not a bitmask.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7d641c7e3514..2b73d29642b7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -453,15 +453,7 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	if (!dev->dma_parms) {
-		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
-					      GFP_KERNEL);
-		if (!dev->dma_parms) {
-			ret = -ENOMEM;
-			goto err_msm_uninit;
-		}
-	}
-	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(dev, UINT_MAX);
 
 	msm_gem_shrinker_init(ddev);
 
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
