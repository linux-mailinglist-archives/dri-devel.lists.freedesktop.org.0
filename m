Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A1A18F75C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582586E194;
	Mon, 23 Mar 2020 14:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865646E14E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s1so17443843wrv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6m0zVPdXeAGM2np3vtJN5AIo7PBWFekNuzkkJaEk55o=;
 b=MMrW1ZyiMb4kYiY94Iy6Y1YHAoqvRbmpcvyQcFVI1UmY1Zyg7S2NTTv3R0X/EQTbFL
 Eoj7uMYjC3J6SMwj0VEceq9Q3NMDr9T2ZXycmnMUgYfV/zE+WNSCizE0gnNhu3vAD+0T
 W3jwmLSn5oMVk6dFp4vBEH7NnfwzqVA/wwsKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6m0zVPdXeAGM2np3vtJN5AIo7PBWFekNuzkkJaEk55o=;
 b=ro8Z1OARdTZahR5UNYPj5B9RbO/ZBGX+n5p/DJ0L2eCQ8zcjFSvbIht9nRNATBMmd8
 fYD+rE/4slqhvXpnuLIJpsI2/2P+8eNBTykEnP1Qz5OVkCwEjti5gWwrg3ErEnWQKGPS
 5YgoW9shWRFUhKwGu1BKceqd2mhCuXy1ZrjCl4SnGKTXJWODn3h5GUpMV/K6+SCFWDN+
 oQRbHn8RWslZwai3QMWCBY7Glt3QrnwJpeTS2pBh9c8/AFPK4oiSowwJYmEI0czRqrt8
 8LT8dapuOCQYFK2mfHxs4Vu9QN8T46CAtnP9jkupFFw0CAihIpUWNk+NIWhnPEalSwFD
 z+Dw==
X-Gm-Message-State: ANhLgQ1/uJAi73Ky5sfClyLCCWy16s3DtCeuWgAW3JdMYh8Q7yOnNVvC
 9UKyGkKDc3v0mhHhfzBMRQUAaY2ThibYmg==
X-Google-Smtp-Source: ADFU+vuRWh/Ej2BnRZ4TmK0Ny1rxE9cpz0obo/aw8q7QqqPlV0jcaxDOsdaqQUmytq76Af6Vas7jlw==
X-Received: by 2002:a05:6000:1212:: with SMTP id
 e18mr32131833wrx.371.1584975010706; 
 Mon, 23 Mar 2020 07:50:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/51] drm/v3d: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:09 +0100
Message-Id: <20200323144950.3018436-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

I also noticed that the unwind code is wrong, after drm_dev_init the
drm_device owns the v3d allocation, so the kfree(v3d) is a double-free.
Reorder the setup to fix this issue.

After a bit more prep in drivers and drm core v3d should be able to
switch over to devm_drm_dev_init, which should clean this up further.

Acked-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 38 ++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index eaa8e9682373..8d0c0daaac81 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -25,6 +25,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_managed.h>
 #include <uapi/drm/v3d_drm.h>
 
 #include "v3d_drv.h"
@@ -257,13 +258,23 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	v3d->pdev = pdev;
 	drm = &v3d->drm;
 
+	ret = drm_dev_init(&v3d->drm, &v3d_drm_driver, dev);
+	if (ret) {
+		kfree(v3d);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, drm);
+	drm->dev_private = v3d;
+	drmm_add_final_kfree(drm, v3d);
+
 	ret = map_regs(v3d, &v3d->hub_regs, "hub");
 	if (ret)
-		goto dev_free;
+		goto dev_destroy;
 
 	ret = map_regs(v3d, &v3d->core_regs[0], "core0");
 	if (ret)
-		goto dev_free;
+		goto dev_destroy;
 
 	mmu_debug = V3D_READ(V3D_MMU_DEBUG_INFO);
 	dev->coherent_dma_mask =
@@ -281,21 +292,21 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 		ret = PTR_ERR(v3d->reset);
 
 		if (ret == -EPROBE_DEFER)
-			goto dev_free;
+			goto dev_destroy;
 
 		v3d->reset = NULL;
 		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
 		if (ret) {
 			dev_err(dev,
 				"Failed to get reset control or bridge regs\n");
-			goto dev_free;
+			goto dev_destroy;
 		}
 	}
 
 	if (v3d->ver < 41) {
 		ret = map_regs(v3d, &v3d->gca_regs, "gca");
 		if (ret)
-			goto dev_free;
+			goto dev_destroy;
 	}
 
 	v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
@@ -303,23 +314,16 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (!v3d->mmu_scratch) {
 		dev_err(dev, "Failed to allocate MMU scratch page\n");
 		ret = -ENOMEM;
-		goto dev_free;
+		goto dev_destroy;
 	}
 
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 50);
 	pm_runtime_enable(dev);
 
-	ret = drm_dev_init(&v3d->drm, &v3d_drm_driver, dev);
-	if (ret)
-		goto dma_free;
-
-	platform_set_drvdata(pdev, drm);
-	drm->dev_private = v3d;
-
 	ret = v3d_gem_init(drm);
 	if (ret)
-		goto dev_destroy;
+		goto dma_free;
 
 	ret = v3d_irq_init(v3d);
 	if (ret)
@@ -335,12 +339,10 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	v3d_irq_disable(v3d);
 gem_destroy:
 	v3d_gem_destroy(drm);
-dev_destroy:
-	drm_dev_put(drm);
 dma_free:
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
-dev_free:
-	kfree(v3d);
+dev_destroy:
+	drm_dev_put(drm);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
