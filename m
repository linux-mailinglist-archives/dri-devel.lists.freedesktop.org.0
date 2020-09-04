Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B02125DBFD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132666EC0D;
	Fri,  4 Sep 2020 14:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E436EBED
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:39:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k15so6966457wrn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NqrDMWKPVBEXKxMkEUSZRSbvqc8CLg+CwI6i4dEMZeg=;
 b=SifpAuEmHbqeHebuJLfbshEF0Iu4B2BZVBntxOws9U08eLFFyAe2mBfvc/nb3Gy5ad
 7hs3LiSmWIJF/NHjPuc8DNTDP437uOTjEGxnlf+JsJs7cyQ4aYVhkPfquwXxSqbnzwXZ
 tu4v7bze3q8hgkUxqysmO54qHEupegU/yV/XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NqrDMWKPVBEXKxMkEUSZRSbvqc8CLg+CwI6i4dEMZeg=;
 b=fiY7JtbG50Gs9Vl9lc9o/ZXk0JModS196xG1q+MMHghGgiFdUOk6QX3T/U93ViKBAi
 USIOFPP6AohBakh78aRyK21SnFJaDGN5KMxfNemxm8UWTI2lzoAzHhy0eFd5zlfDe4QR
 0dbrOIR/FwxY5ygUfK+ipKQBgudeKWK+GmrjMTZcB7XXwsp3L/0zmrCM+Ldj9947RdIA
 o2FmhG9vF9KH96AiiXOrLhvy7i/bfHgBZaPwnqbXzUI0ROmpy9CHljPL1ztatlqcqVAP
 WAoRrL1zNjiOUwodJb8qlqDjHH3kFWwlfkOOZmNs1ddV6x8KDb+KIKRhm0Ntd7mu8YvG
 CZRQ==
X-Gm-Message-State: AOAM533ib52WluzpmJVyXxQno/btjq/Vqmm2fs9HyY04OAT0YGjKyDog
 k4EiGo+yHl/tFOkFiOxNSNB9fD9P0mbzEkO7
X-Google-Smtp-Source: ABdhPJwPEJ3BZ3mdyweBni7RP9oc5oU9d4IzFmeXdtvgSBcZxg7k2MoWvJwtXfV3YCbHBT4uIjNA0g==
X-Received: by 2002:adf:f8d0:: with SMTP id f16mr8587525wrq.66.1599230397711; 
 Fri, 04 Sep 2020 07:39:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:39:57 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/24] drm/xlnx: Use devm_drm_dev_alloc
Date: Fri,  4 Sep 2020 16:39:23 +0200
Message-Id: <20200904143941.110665-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
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

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 26328c76305b..80b8edd20442 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -208,27 +208,16 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
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
 
@@ -286,8 +275,6 @@ static int zynqmp_dpsub_remove(struct platform_device *pdev)
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
