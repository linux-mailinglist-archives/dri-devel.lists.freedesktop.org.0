Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE5FAF8015
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 20:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8F510E06C;
	Thu,  3 Jul 2025 18:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uSyLT5YZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0023910E06C;
 Thu,  3 Jul 2025 18:34:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BAAA2462C6;
 Thu,  3 Jul 2025 18:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D70C4CEED;
 Thu,  3 Jul 2025 18:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751567686;
 bh=1O+dcVmKb7pf+ofnchqB5Zpzgy1lEe0VkAGuU2rHWj0=;
 h=From:To:Cc:Subject:Date:From;
 b=uSyLT5YZ1mOsWNz927r7VxIOrl4FQnXXx0U/mbouGrSH6qlREA7ovTVAYpVHhVzEa
 QdFJtgYDQQlkCTJrDWXKa0fS0oz8qaLOKOjunu6vbYODIs+gnY6jPk2eIdh7uB5E6V
 2yN0OR03ZdQRhueAMdlBwz9HGkBUl1M+g7TymTvZwKwywLC4htHApkjeLO/2gXUsol
 jSsoyySg/wmfbDnqPM6Pq8wKbJBb4vbOaPVss+GnUu8/ZqFRevuv1iYt/0r6ZOA/Fk
 N+mO1vFa8dK93KT6cqm46dY2Obl0NbwiFglLtrPD2XAZZ1SKMtHWNBwsZ+SnixjnM0
 J7LeaZiGkeFuw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Date: Thu,  3 Jul 2025 13:34:41 -0500
Message-ID: <20250703183442.2073717-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

The original code did not set 'zap_available' to false if
of_address_to_resource() failed which seems like an oversight.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 +++++------------
 drivers/gpu/drm/msm/msm_drv.c           | 15 +++++----------
 2 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 2348ffb35f7e..c1060d5b6d05 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -10,7 +10,7 @@
 #include <linux/interconnect.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kernel.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -33,7 +33,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
-	struct device_node *np, *mem_np;
+	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
@@ -51,18 +51,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		return -ENODEV;
 	}
 
-	mem_np = of_parse_phandle(np, "memory-region", 0);
-	of_node_put(np);
-	if (!mem_np) {
+	ret = of_reserved_mem_region_to_resource(np, 0, &r);
+	if (ret) {
 		zap_available = false;
-		return -EINVAL;
-	}
-
-	ret = of_address_to_resource(mem_np, 0, &r);
-	of_node_put(mem_np);
-	if (ret)
 		return ret;
-
+	}
 	mem_phys = r.start;
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f316e6776f67..31e4de05579a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -8,7 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/fault-inject.h>
 #include <linux/debugfs.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/uaccess.h>
 
 #include <drm/clients/drm_client_setup.h>
@@ -126,8 +126,8 @@ bool msm_use_mmu(struct drm_device *dev)
 static int msm_init_vram(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct device_node *node;
 	unsigned long size = 0;
+	struct resource r;
 	int ret = 0;
 
 	/* In the device-tree world, we could have a 'memory-region'
@@ -147,14 +147,9 @@ static int msm_init_vram(struct drm_device *dev)
 	 *     load and do initial modeset)
 	 */
 
-	node = of_parse_phandle(dev->dev->of_node, "memory-region", 0);
-	if (node) {
-		struct resource r;
-		ret = of_address_to_resource(node, 0, &r);
-		of_node_put(node);
-		if (ret)
-			return ret;
-		size = r.end - r.start + 1;
+	ret = of_reserved_mem_region_to_resource(dev->dev->of_node, 0, &r);
+	if (!ret) {
+		size = resource_size(&r);
 		DRM_INFO("using VRAM carveout: %lx@%pa\n", size, &r.start);
 
 		/* if we have no IOMMU, then we need to use carveout allocator.
-- 
2.47.2

