Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8871641AB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4645D6EB83;
	Wed, 19 Feb 2020 10:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBEB6EB36
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:54 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n3so3666509wmk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FldPWxhzELhYbW6ZcVnvMkTgkkuNURV+FBfGKe9d6tY=;
 b=leaUZqEI8FKwCmANwgAS926f3CPRxOUWdnJPNcMV9Bekz6aRtYmRQkSiVNObL7bmEo
 oUWxTBTJfkZRjBlFCPtr6wBmmixfrejNPMvp14LrUWT2obDZl+N/U1hc7pBre6f9QanC
 GgcJEttbkxmEUL9vI+N++xK7tkooH0lkwPzUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FldPWxhzELhYbW6ZcVnvMkTgkkuNURV+FBfGKe9d6tY=;
 b=fnWm7tGlpCwB7Cw4KHxopKwuS0dU6xkcsk6vEbcr3ZDllFk2LGN/whXxgEkvrtJMsv
 eMSCbuJHOw39vuWqjlrMKl/k5OjA0neI9oaAg2epHygR9HGqYOO7RlruaqPN++Ke120b
 kBpGHCdZhHHeLnnOjLtHS2E0BT4ukPkSkZ7Ne02tr1AW2yiKpBM9z2q9q/rZ5QxjHRtV
 koFI+421QZob21GlD90PqoU27XQ1XjaF3KvB/saPMaVEM5DuetqyqhkG/oTHESClGxDE
 PByx7MX3UeQoLBi1fAZYpI8LMyXyPDkl32z99YLuY/LUkrVb9/n+jME5pSdvZp5ZLNiv
 kgxA==
X-Gm-Message-State: APjAAAUvFQuWVsLTeKwMhvh1YJb2DQkqe/27ZL9NO0MFwpuKLabV0IQw
 WUFn21OqOJjrC6BWe7KY5T4+avZFXbA=
X-Google-Smtp-Source: APXvYqw5OoalXX1KOYcM1QyFFNPcafOfknOJ0qHnQqTpL0z/D6jEXC/K8qAseuQm3aDL/rNYoZNaJg==
X-Received: by 2002:a05:600c:2254:: with SMTP id
 a20mr8714517wmm.188.1582107713215; 
 Wed, 19 Feb 2020 02:21:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:52 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/52] drm/gm12u320: Use drmm_add_final_kfree
Date: Wed, 19 Feb 2020 11:20:48 +0100
Message-Id: <20200219102122.1607365-19-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index a48173441ae0..524ca0941cf9 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -19,6 +19,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -637,7 +638,6 @@ static void gm12u320_driver_release(struct drm_device *dev)
 	gm12u320_usb_free(gm12u320);
 	drm_mode_config_cleanup(dev);
 	drm_dev_fini(dev);
-	kfree(gm12u320);
 }
 
 DEFINE_DRM_GEM_FOPS(gm12u320_fops);
@@ -692,6 +692,7 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 		return ret;
 	}
 	dev->dev_private = gm12u320;
+	drmm_add_final_kfree(dev, gm12u320);
 
 	drm_mode_config_init(dev);
 	dev->mode_config.min_width = GM12U320_USER_WIDTH;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
