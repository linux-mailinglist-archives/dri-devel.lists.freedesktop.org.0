Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9742D7AEC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 17:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1786E48F;
	Fri, 11 Dec 2020 16:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081CF6E489
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 16:29:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e25so9150518wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 08:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M+228KxWOj9lE8LzORx+5f7rY+oHeaR5/sfW2M1gtjI=;
 b=gdhAC7AIgvYnLzDgzz0qE8CiSvkTWNnXs8cHg57C2FgnSPzlq2LfNOdVLGwhVVRnUg
 s4dtP4eUpLjwHfU3omT/XjpXJxnjkW83R7n7gR6VqCBcfKQyPM4Xbv24sGuNmL8QCXaC
 M7HhW8qZKgdKcnb1VI8WY/5BZ2u2tmFW2VCg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M+228KxWOj9lE8LzORx+5f7rY+oHeaR5/sfW2M1gtjI=;
 b=c43eiCdx/jHER1WrdGaGWyB4jpsUsnrdj/lTT3F40ZmwlbDTPCy9WWZWNF3Fy4vwrP
 8WPC0vqVk4SfPeLLbzDO5jOmQKu0HlsgJJ59cBQxj95t6DKjOd95I51Xj6PxLAFH2KXN
 D61RowTfwcYyqy+yIfAzq1e4y8+9KiOLTQA66dgxHpLuXdx43fDWYQ9dESIUftcx2xMv
 gLR7S2yeL9cpR5CHb2DhuPmXpY1r2ybGL6Do5gqZIEcOMJDiEYE5Dnl7PLaZBJLPLvVk
 HQUEQ22Cv0kEUf180BrQsLWjAkv01ti3ag8ilQfFbAv+JQU9Gk0CZjZ9p07fxxFqZ6Rs
 yHMw==
X-Gm-Message-State: AOAM531Bwk2LE5N6t3qa/423lkli2KTP6NRoQPyNtpV/JzhBadGLe0bm
 +Y/1pGIFqmu3PqBuWaoYL7SRlKMADaxOqg==
X-Google-Smtp-Source: ABdhPJyL2gHtKTQzXRMDc8gB+vFSGI+AQkkLwx2INz0fY8Aue1koD9cjOKya5EZOcsDuk/pCSnIG9g==
X-Received: by 2002:a1c:9ac6:: with SMTP id
 c189mr14514742wme.137.1607704189453; 
 Fri, 11 Dec 2020 08:29:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n126sm15917654wmn.21.2020.12.11.08.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 08:29:48 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/vmwgfx: Drop svga_lock
Date: Fri, 11 Dec 2020 17:29:40 +0100
Message-Id: <20201211162942.3399050-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, sroland@vmware.com,
 linux-graphics-maintainer@vmware.com, Daniel Vetter <daniel.vetter@ffwll.ch>
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
index 0008be02d31c..204f7a1830f0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -672,7 +672,6 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	spin_lock_init(&dev_priv->hw_lock);
 	spin_lock_init(&dev_priv->waiter_lock);
 	spin_lock_init(&dev_priv->cap_lock);
-	spin_lock_init(&dev_priv->svga_lock);
 	spin_lock_init(&dev_priv->cursor_lock);
 
 	for (i = vmw_res_context; i < vmw_res_max; ++i) {
@@ -1189,12 +1188,10 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
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
@@ -1220,14 +1217,12 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
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
@@ -1254,17 +1249,14 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
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
index 5b9a28157dd3..715f2bfee08a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -596,7 +596,6 @@ struct vmw_private {
 
 	bool stealth;
 	bool enable_fb;
-	spinlock_t svga_lock;
 
 	/**
 	 * PM management.
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
