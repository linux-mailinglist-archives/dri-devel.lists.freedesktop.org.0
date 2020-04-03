Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E6D19D830
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E216EBAF;
	Fri,  3 Apr 2020 13:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465926EBAF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so6518545wrt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvvbzvaEawldwbqG9NrrkW5/kLuFE/AGudq3HTtP+kU=;
 b=TSJEjD+RrwjZ8qDSJw+E6YXzfOBtdlJJN68WfyPRjUkj57zEKZajs3MulKuKjiFD4b
 oK3d1g3gEtnRgv1sJy9fyDy/0UrVkAaDYeSkdMaPZchy2mE1S9YQzToBy8eOk22JydVw
 ew4DqIyKmBO/c1q77ugiLinbo57WOj5FgyJLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvvbzvaEawldwbqG9NrrkW5/kLuFE/AGudq3HTtP+kU=;
 b=Id2zG6/zxT5TR8uJchhefBJx7VjWsHByz3kjkqyIwUdNWJv0LwACKUTBMXJipnZmT/
 oM82Dc4m9PaycbrHRKm6cTJlqXxXBXM9qpecMYxTHw2giXdh8o6IjxXp1bEQ13N+woRs
 0FkGuKR2/eCpqEAT603FzHMUjmyGwEhfE1izy0VPtBeG8lENwe+lpsV4D2rERz6N6mnT
 48rJsYs1Qqm5AX5xaVRuXTVDu5C4u0xSyG5aaRhCr7hIBaas7+/4i5kmxLTZYq8ZY8th
 xyCP6Dl28spiutBadjyTfiFUWqFkOPTYI/FnEesqzGCoB9bMttjjOPbgeeO3f7/CQrCP
 P1uw==
X-Gm-Message-State: AGi0PuZ2lfJZgvwkhqJz0j5QZXbsQqkf4Z8ZPIL+JU1KWbEOlB+YPkc0
 bbFpQxCAqjiZftNmbcevbYl9Tjz6YeLx8g==
X-Google-Smtp-Source: APiQypKYbCFJgX92q3hSrcgxzO8LOpH//fU1wJZr2yVkv57hDj0pEj6TkkE7M2zluhOFjIZfCC0dbA==
X-Received: by 2002:adf:b35d:: with SMTP id k29mr9397039wrd.239.1585922329361; 
 Fri, 03 Apr 2020 06:58:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/44] drm/v3d: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:57:56 +0200
Message-Id: <20200403135828.2542770-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also allows us to simplify the unroll code since the drm_dev_put
disappears.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index ead62a15d48f..f57d408ef371 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -251,29 +251,23 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	u32 ident1;
 
 
-	v3d = kzalloc(sizeof(*v3d), GFP_KERNEL);
-	if (!v3d)
-		return -ENOMEM;
+	v3d = devm_drm_dev_alloc(dev, &v3d_drm_driver, struct v3d_dev, drm);
+	if (IS_ERR(v3d))
+		return PTR_ERR(v3d);
+
 	v3d->dev = dev;
 	v3d->pdev = pdev;
 	drm = &v3d->drm;
 
-	ret = drm_dev_init(&v3d->drm, &v3d_drm_driver, dev);
-	if (ret) {
-		kfree(v3d);
-		return ret;
-	}
-
 	platform_set_drvdata(pdev, drm);
-	drmm_add_final_kfree(drm, v3d);
 
 	ret = map_regs(v3d, &v3d->hub_regs, "hub");
 	if (ret)
-		goto dev_destroy;
+		return ret;
 
 	ret = map_regs(v3d, &v3d->core_regs[0], "core0");
 	if (ret)
-		goto dev_destroy;
+		return ret;
 
 	mmu_debug = V3D_READ(V3D_MMU_DEBUG_INFO);
 	dev->coherent_dma_mask =
@@ -291,29 +285,28 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 		ret = PTR_ERR(v3d->reset);
 
 		if (ret == -EPROBE_DEFER)
-			goto dev_destroy;
+			return ret;
 
 		v3d->reset = NULL;
 		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
 		if (ret) {
 			dev_err(dev,
 				"Failed to get reset control or bridge regs\n");
-			goto dev_destroy;
+			return ret;
 		}
 	}
 
 	if (v3d->ver < 41) {
 		ret = map_regs(v3d, &v3d->gca_regs, "gca");
 		if (ret)
-			goto dev_destroy;
+			return ret;
 	}
 
 	v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
 					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
 	if (!v3d->mmu_scratch) {
 		dev_err(dev, "Failed to allocate MMU scratch page\n");
-		ret = -ENOMEM;
-		goto dev_destroy;
+		return -ENOMEM;
 	}
 
 	pm_runtime_use_autosuspend(dev);
@@ -340,8 +333,6 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	v3d_gem_destroy(drm);
 dma_free:
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
-dev_destroy:
-	drm_dev_put(drm);
 	return ret;
 }
 
@@ -354,8 +345,6 @@ static int v3d_platform_drm_remove(struct platform_device *pdev)
 
 	v3d_gem_destroy(drm);
 
-	drm_dev_put(drm);
-
 	dma_free_wc(v3d->dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
 
 	return 0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
