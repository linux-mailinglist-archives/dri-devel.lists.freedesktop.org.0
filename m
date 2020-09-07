Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC68225F4F2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D916E323;
	Mon,  7 Sep 2020 08:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8D76E323
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:22:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e11so11807145wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnCJ3txJAmDAOljhzlhO5vFVgCQu8nNKgbG5tKbImjg=;
 b=JB8epBmaVCCSPzG3T1CnpHQ569r7kuMhPxDKKime2nZMYzudZ5nFb6dG95tvPcVHZ2
 JkNqi8u9NPTYVy2yJ+2NWPHvTXjeRYyeXr2ZA56G9w8b6TQOqx0eniqdUZO6dLqgoBNl
 yvcSLgi65NSi7BjUcYDdCmTZ7KtXWQMnvITLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SnCJ3txJAmDAOljhzlhO5vFVgCQu8nNKgbG5tKbImjg=;
 b=hrA/LEVARCRyEEaoqZXuPEP+HPbYPIURoV8n/43JXCfuXzaWa84hXX1OTpOWkbHbfW
 FtPO6ty04f/lBL5apa2O1ZV/nVMMqGvCxdLGuQFZ7wYQk67Sqg8R0u6tfHG8JZfnmpJ8
 Noth+KJvpN1+kRWNIGCPzlp44nIpLBJm+S0R3yX+fvGzeC2UoxzzI5gdrSHKQYMdKQ20
 e9xYe4OU03ng+iyu7JbqQXa7HqMhZUxBc79AMH7RhQIkDTZ9KfDcgP/AgFkXGNyZHsxp
 Qj89jVDz6aTLVoemUnSNYGe/jEqbsvV1ctNV2WOMSywEitZ9xwO9T3fkahXurG9nYDaw
 rWWQ==
X-Gm-Message-State: AOAM531OiB2bYwfNS5iBQHK+KKxplBSCQ8AqZaGCB3Y08Pr787/6khEy
 pf4qVt3JD9ujPCLiu9vcyC700Q==
X-Google-Smtp-Source: ABdhPJziwAbrAyGtz2st6BdSyI/BpBzEAohmthAPuja2nuLTmf1IvW6Qmq8DmmH75kRYPyT8Kt0puw==
X-Received: by 2002:a1c:1f41:: with SMTP id f62mr20374345wmf.51.1599466951031; 
 Mon, 07 Sep 2020 01:22:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 11sm24954061wmi.14.2020.09.07.01.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:22:30 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/xlnx: Use devm_drm_dev_alloc
Date: Mon,  7 Sep 2020 10:22:25 +0200
Message-Id: <20200907082225.150837-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-7-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-7-daniel.vetter@ffwll.ch>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michal Simek <michal.simek@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gets rid of drmm_add_final_kfree, which I want to unexport so that it
stops confusion people about this transitional state of rolling drm
managed memory out.

This also fixes the missing drm_dev_put in the error path of the probe
code.

v2: Drop the misplaced drm_dev_put from zynqmp_dpsub_drm_init (all
other paths leaked on error, this should have been in
zynqmp_dpsub_probe), now that subsumed by the auto-cleanup of
devm_drm_dev_alloc.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 26328c76305b..8e69303aad3f 100644
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
