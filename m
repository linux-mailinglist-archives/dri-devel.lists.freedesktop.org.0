Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A34229199E
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 21:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D82B6E855;
	Sun, 18 Oct 2020 19:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE436E854
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 19:19:36 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75EA1222C8;
 Sun, 18 Oct 2020 19:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603048776;
 bh=OVYVtUYC6RZLbECK61g9hn+l8J0dj2wlIh4N0N4xiSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=13yAWIDyhmidC2kTN5tiPLOTX+NycadaJPO0VJ1XXrf9ldahedQ1DVddbxa1B++MC
 DRwaWK8EXSoQ++MLYdivWDfN/KWvdbP4RNt9GGP+u3mbCOA0uhdLTGV25HtF6AXLlI
 mnuDGRcWaHCt70u4aNWjVi7jTpYWOR+rVLC0Z444=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 074/111] drm/xlnx: Use devm_drm_dev_alloc
Date: Sun, 18 Oct 2020 15:17:30 -0400
Message-Id: <20201018191807.4052726-74-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

[ Upstream commit 075342ea3d93044d68f821cf91c1a1a7d2fa569e ]

Gets rid of drmm_add_final_kfree, which I want to unexport so that it
stops confusion people about this transitional state of rolling drm
managed memory out.

This also fixes the missing drm_dev_put in the error path of the probe
code.

v2: Drop the misplaced drm_dev_put from zynqmp_dpsub_drm_init (all
other paths leaked on error, this should have been in
zynqmp_dpsub_probe), now that subsumed by the auto-cleanup of
devm_drm_dev_alloc.

Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org
Link: https://patchwork.freedesktop.org/patch/msgid/20200907082225.150837-1-daniel.vetter@ffwll.ch
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 26328c76305be..8e69303aad3f7 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -111,7 +111,7 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 	/* Initialize mode config, vblank and the KMS poll helper. */
 	ret = drmm_mode_config_init(drm);
 	if (ret < 0)
-		goto err_dev_put;
+		return ret;
 
 	drm->mode_config.funcs = &zynqmp_dpsub_mode_config_funcs;
 	drm->mode_config.min_width = 0;
@@ -121,7 +121,7 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 
 	ret = drm_vblank_init(drm, 1);
 	if (ret)
-		goto err_dev_put;
+		return ret;
 
 	drm->irq_enabled = 1;
 
@@ -154,8 +154,6 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 
 err_poll_fini:
 	drm_kms_helper_poll_fini(drm);
-err_dev_put:
-	drm_dev_put(drm);
 	return ret;
 }
 
@@ -208,27 +206,16 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	int ret;
 
 	/* Allocate private data. */
-	dpsub = kzalloc(sizeof(*dpsub), GFP_KERNEL);
-	if (!dpsub)
-		return -ENOMEM;
+	dpsub = devm_drm_dev_alloc(&pdev->dev, &zynqmp_dpsub_drm_driver,
+				   struct zynqmp_dpsub, drm);
+	if (IS_ERR(dpsub))
+		return PTR_ERR(dpsub);
 
 	dpsub->dev = &pdev->dev;
 	platform_set_drvdata(pdev, dpsub);
 
 	dma_set_mask(dpsub->dev, DMA_BIT_MASK(ZYNQMP_DISP_MAX_DMA_BIT));
 
-	/*
-	 * Initialize the DRM device early, as the DRM core mandates usage of
-	 * the managed memory helpers tied to the DRM device.
-	 */
-	ret = drm_dev_init(&dpsub->drm, &zynqmp_dpsub_drm_driver, &pdev->dev);
-	if (ret < 0) {
-		kfree(dpsub);
-		return ret;
-	}
-
-	drmm_add_final_kfree(&dpsub->drm, dpsub);
-
 	/* Try the reserved memory. Proceed if there's none. */
 	of_reserved_mem_device_init(&pdev->dev);
 
@@ -286,8 +273,6 @@ static int zynqmp_dpsub_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dpsub->apb_clk);
 	of_reserved_mem_device_release(&pdev->dev);
 
-	drm_dev_put(drm);
-
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
