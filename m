Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC9725CAE5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 22:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9DE6E8B8;
	Thu,  3 Sep 2020 20:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AAC916E8B8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 20:36:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DCEC12FC;
 Thu,  3 Sep 2020 13:36:18 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8833F3F71F;
 Thu,  3 Sep 2020 13:36:17 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: james.qian.wang@arm.com,
	liviu.dudau@arm.com,
	mihail.atanassov@arm.com
Subject: [PATCH] drm/komeda: Drop local dma_parms
Date: Thu,  3 Sep 2020 21:36:13 +0100
Message-Id: <8de297b5b916628c77b99068fb5aac1a69eed6f5.1599164796.git.robin.murphy@arm.com>
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
Cc: malidp@foss.arm.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
for platform devices"), struct platform_device already provides a
dma_parms structure, so we can save allocating another one.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

FYI, get_maintainer.pl seems to be choking on your L: entry somehow,
since it just shows " (open list:ARM KOMEDA DRM-KMS DRIVER)" without the
description or address, not sure what's up with that.

 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 1 -
 drivers/gpu/drm/arm/display/komeda/komeda_dev.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 1d767473ba8a..e7bb905062d9 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -261,7 +261,6 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
 		goto disable_clk;
 	}

-	dev->dma_parms = &mdev->dma_parms;
 	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));

 	mdev->iommu = iommu_get_domain_for_dev(mdev->dev);
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
index ce27f2f27c24..5b536f0cb548 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
@@ -163,8 +163,6 @@ struct komeda_dev {
 	struct device *dev;
 	/** @reg_base: the base address of komeda io space */
 	u32 __iomem   *reg_base;
-	/** @dma_parms: the dma parameters of komeda */
-	struct device_dma_parameters dma_parms;

 	/** @chip: the basic chip information */
 	struct komeda_chip_info chip;
--
2.28.0.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
