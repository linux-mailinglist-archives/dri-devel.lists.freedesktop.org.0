Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5B296ED7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B876E5B2;
	Fri, 23 Oct 2020 12:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6B76E5B4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n15so1598176wrq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lv9iWimFOIGDRW4jGGjVyXNYdiUYfLpQCq4yXKzlM3Y=;
 b=J13iDv9v54dIwMzbh/MuNDh+Zp/4YqjJp0rkrkG98/nK1P+p/gDP2TEtzeggqntesC
 U1WOWEuQZFl4O3W9v0ew2NanBpZzNvQHusSumq38mFs8Y4Fb7RPQ5JQDppdtV0zc8pIO
 MUx3JFQ04hL0G4AoJjPnAnOvL57ZGIMLUUS8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lv9iWimFOIGDRW4jGGjVyXNYdiUYfLpQCq4yXKzlM3Y=;
 b=l40l7o8UDLWNwKOuJauS3WpZn6yAYgpjZH3ZQDfbdwTROmY/CreCOzSXp/DHWeBeSO
 HSIe6fYZVXppntbnjaow57oXn+WIVvrS2n6TF7IHbChNzC6hO3MiAq3SSFFdH12HBcss
 SrfyCMjNEE+b4sCCHZJE2C1QM6Qr7nwG8IdVEcOCBc6vsR2aTE7oo0yx1LljdhkHHHed
 tDdC3A+CJTgFxO2txtyEbZy1Almg2E9IzrYnA5FaqXND4EGihVfNpt08dgnGIHtjYVcZ
 tB6SFTgw71ALVeEdP8lhJ4ujsi48BhpS61f/euL930SjKJdtC2nWFWOJIKGOsgiIO6Ia
 0b4w==
X-Gm-Message-State: AOAM531x/y/I9TT7Fb0BYX59dZTNDvrBgnu91/YCwQCA29bOylMmf4oH
 wEPEzPMFxDM1pEdCQm0BrynoIsepvR8uUqHU
X-Google-Smtp-Source: ABdhPJxFv1wOmoOA2eJ4PnscSORJp//ItclSTMxFgw9LbqTDP/utYU+s+sJ8ToPR+S83pVmwGQ93LQ==
X-Received: by 2002:adf:dfc7:: with SMTP id q7mr2272630wrn.382.1603455772550; 
 Fri, 23 Oct 2020 05:22:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 27/65] drm/vmwgfx: Always evict vram _before_ disabling it
Date: Fri, 23 Oct 2020 14:21:38 +0200
Message-Id: <20201023122216.2373294-27-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Other way round is a bit inconsistent (but not buggy in any kind).
This is prep work so that ttm_resource_manager_set_used can assert
that the resource manager is empty.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 6ecdd1df311b..68206d0a1237 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1255,9 +1255,9 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 	vmw_kms_lost_device(dev_priv->dev);
 	ttm_write_lock(&dev_priv->reservation_sem, false);
 	if (ttm_resource_manager_used(man)) {
-		ttm_resource_manager_set_used(man, false);
 		if (ttm_resource_manager_evict_all(&dev_priv->bdev, man))
 			DRM_ERROR("Failed evicting VRAM buffers.\n");
+		ttm_resource_manager_set_used(man, false);
 		vmw_write(dev_priv, SVGA_REG_ENABLE,
 			  SVGA_REG_ENABLE_HIDE |
 			  SVGA_REG_ENABLE_ENABLE);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
