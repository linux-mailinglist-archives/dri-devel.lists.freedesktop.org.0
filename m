Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D19E296ED8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684846E5C0;
	Fri, 23 Oct 2020 12:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463836E5A5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n18so1578397wrs.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sepS93iJ7zpT+itLWcPBu2Qy3lb7bnsCuQ3H9UGy9VQ=;
 b=ClldJuMtdJRM0xkpLI7thGvbyq5ZqYusWP05b6nIVys8Q34SCqAqgu7Y0G4bF5f1SC
 LvWM3xt7iREcroRxqYb3CWWFeOb4h766kDuftP/uK+n8MxbIvmlFleNQ1CBjvVAOHSLi
 KXFG7r80/sgf3NshjEFs3Kk0IrqasasuWZ1pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sepS93iJ7zpT+itLWcPBu2Qy3lb7bnsCuQ3H9UGy9VQ=;
 b=dvXhtDXaTIFIl9VAi7S7scNSlefVWJS2GSFA2Mn2iDqCbVt9wXaaMvMUNvZSEW0DkI
 vhTBXhgNE4pW1unINx4D5BhUzTb6SRMBMPimiINmHD2vgINf6j4iCYDmj2m+Vq36qTOP
 3YWgyvFiK70LUEhR9ZttDORAyTwNERB3oDwSuyBc325FDo/UrAy2TuuFv+2n6b8n4tXR
 wjUcrUMKHvWAkb/8FHLOHvMO8MByX1Th+r7EMvtofy7vB3/JgvhjYzvb5gbcFxtnVquz
 ywW2yfWFZyoDJ57wnXKhJpjlmItuqluhd5LIIndLjdBPquyQWboRNLuK4Vci9l2+HksM
 aOhA==
X-Gm-Message-State: AOAM5327LYMLUX0GX31H5MUL7e2utwxlo0PkwZqxg/eHTP3r5ks5qnB/
 9icpn5j6KSSFNXMHacZ3ebx2FPg9awNGXHgG
X-Google-Smtp-Source: ABdhPJxDMc+OJfluSvuWnt9N7/uWbAVT3O+asWQjLxLc1s5xy2/4OiYqu6skPgjuWJv1CQslj1WtkQ==
X-Received: by 2002:a05:6000:1109:: with SMTP id
 z9mr2147122wrw.388.1603455771716; 
 Fri, 23 Oct 2020 05:22:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 26/65] drm/vmwgfx: Drop svga_lock
Date: Fri, 23 Oct 2020 14:21:37 +0200
Message-Id: <20201023122216.2373294-26-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This isn't actually protecting anything becuase:
- when running, ttm_resource_manager->use_type is protected through
  vmw_private->reservation_semaphore against concurrent execbuf or
  well anything else that might evict or reserve buffers
- during suspend/resume there's nothing else running, hence
  vmw_pm_freeze and vmw_pm_restore do not need to take the same lock.
- this also holds for the SVGA_REG_ENABLE register write

Hence it is safe to just remove that spinlock.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 10 +---------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 4860370740e0..6ecdd1df311b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -677,7 +677,6 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	spin_lock_init(&dev_priv->hw_lock);
 	spin_lock_init(&dev_priv->waiter_lock);
 	spin_lock_init(&dev_priv->cap_lock);
-	spin_lock_init(&dev_priv->svga_lock);
 	spin_lock_init(&dev_priv->cursor_lock);
 
 	for (i = vmw_res_context; i < vmw_res_max; ++i) {
@@ -1194,12 +1193,10 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 
-	spin_lock(&dev_priv->svga_lock);
 	if (!ttm_resource_manager_used(man)) {
 		vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
 		ttm_resource_manager_set_used(man, true);
 	}
-	spin_unlock(&dev_priv->svga_lock);
 }
 
 /**
@@ -1225,14 +1222,12 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 
-	spin_lock(&dev_priv->svga_lock);
 	if (ttm_resource_manager_used(man)) {
 		ttm_resource_manager_set_used(man, false);
 		vmw_write(dev_priv, SVGA_REG_ENABLE,
 			  SVGA_REG_ENABLE_HIDE |
 			  SVGA_REG_ENABLE_ENABLE);
 	}
-	spin_unlock(&dev_priv->svga_lock);
 }
 
 /**
@@ -1259,17 +1254,14 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 	 */
 	vmw_kms_lost_device(dev_priv->dev);
 	ttm_write_lock(&dev_priv->reservation_sem, false);
-	spin_lock(&dev_priv->svga_lock);
 	if (ttm_resource_manager_used(man)) {
 		ttm_resource_manager_set_used(man, false);
-		spin_unlock(&dev_priv->svga_lock);
 		if (ttm_resource_manager_evict_all(&dev_priv->bdev, man))
 			DRM_ERROR("Failed evicting VRAM buffers.\n");
 		vmw_write(dev_priv, SVGA_REG_ENABLE,
 			  SVGA_REG_ENABLE_HIDE |
 			  SVGA_REG_ENABLE_ENABLE);
-	} else
-		spin_unlock(&dev_priv->svga_lock);
+	}
 	ttm_write_unlock(&dev_priv->reservation_sem);
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index b45becbb00f8..266096728520 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -597,7 +597,6 @@ struct vmw_private {
 
 	bool stealth;
 	bool enable_fb;
-	spinlock_t svga_lock;
 
 	/**
 	 * PM management.
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
