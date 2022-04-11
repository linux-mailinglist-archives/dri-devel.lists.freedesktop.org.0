Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DA44FC548
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 21:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9805110E0D2;
	Mon, 11 Apr 2022 19:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5B8110E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 19:49:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33D1D1570;
 Mon, 11 Apr 2022 12:49:17 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BC0C3F70D;
 Mon, 11 Apr 2022 12:49:16 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: thierry.reding@gmail.com
Subject: [PATCH v2] drm: tegra: Include DMA API header where used
Date: Mon, 11 Apr 2022 20:49:10 +0100
Message-Id: <9043e2c18728f99fc6b025a8f59437fc05a3c2be.1649706479.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though the IOVA API never actually needed it, iova.h is still
carrying an include of dma-mapping.h, now solely for the sake of not
breaking tegra-drm. Fix that properly.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: Apparently nvdec.c needs one now too.

 drivers/gpu/drm/tegra/dc.c    | 1 +
 drivers/gpu/drm/tegra/hub.c   | 1 +
 drivers/gpu/drm/tegra/nvdec.c | 1 +
 drivers/gpu/drm/tegra/plane.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index c6951cf5d2ca..bfc79c61bca6 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/iommu.h>
 #include <linux/interconnect.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index b8d3174c04c9..5f9b85959fae 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/host1x.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 79e1e88203cf..b412cc5c6db2 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/host1x.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index e0e6938c6200..e46adb107f77 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2017 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/dma-mapping.h>
 #include <linux/iommu.h>
 #include <linux/interconnect.h>
 
-- 
2.28.0.dirty

