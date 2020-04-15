Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BA81A9486
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470AD6E880;
	Wed, 15 Apr 2020 07:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661496E87B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o81so10589197wmo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bok9AOfXpc8WxM2FkBHKvFNBbVnlP3pLk3X35qaaPdE=;
 b=aZZb/MVW3jLt3Bw1uXYgHXYoEyjlLvfvLI/TI0RjNt5IjCzYcAHYAZYlndGJ9vHqPY
 p8f3TCMRFPNvzfYJ+7mK77IctWPARoHFhuWcTpZzmNypwjqQdLDRAfuwukpVkIhkM8hM
 QUCalK+iZU7AHh7PAos77iT4lvQHq8ygCS+Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bok9AOfXpc8WxM2FkBHKvFNBbVnlP3pLk3X35qaaPdE=;
 b=ke6Hi04CRuRzgeeYIeeGXJJ4jjZM5O4Bt8sVimJaHe3x3vwYDsaJtkvAEeqlZcpMW/
 PUACaSo0V5ymv4AqvmXOa4tskwlcPkvRA/BiKXolfLTWC+MJy/lGHYxKBnPUicfQTJ2K
 xN7/22Od3wFG0sE0zZvjuDFYgrWX6W5u+DhT6IDR87Kt6rakz/4AEWt/0KlT7J6x6FD4
 THaE10olcGbv/8nMAAiO1Fm+WiKPiZbg5cMczcCKd+8wV2VkIEOqY+qAe4rjyGC3PYor
 2lxW72QsUtftLpozhQzlcLY0BF+ooKThbr14fzk10dFBY6u3ZzLjp8250P35AlEAuX6/
 gjIw==
X-Gm-Message-State: AGi0PuZkA5HJMuUEUtzzUJC4R6LahLQ56g/Enrg5XIFShfZ/xX3x/Bs8
 hOfkoNJ50+jHGB5INDtFYhx/sA==
X-Google-Smtp-Source: APiQypJEVzWnC/fMsSJZu897iYqdo9qTrNR9WdmRvzh0ab011PpmavnW1z3+KMrWqNPiu4fUc9HfGA==
X-Received: by 2002:a05:600c:2c47:: with SMTP id
 r7mr3725217wmg.50.1586936449055; 
 Wed, 15 Apr 2020 00:40:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 08/59] drm/v3d: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:39:43 +0200
Message-Id: <20200415074034.175360-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also allows us to simplify the unroll code since the drm_dev_put
disappears.

Acked-by: Eric Anholt <eric@anholt.net>
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
