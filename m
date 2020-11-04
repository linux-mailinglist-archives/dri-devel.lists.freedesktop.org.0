Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7112A611C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 11:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAA06E98E;
	Wed,  4 Nov 2020 10:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AA66E98D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:04:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p22so1763725wmg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 02:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rbMlA+2ZGai32FIpt95gGwqvjqEH0LhXvEtCRMbQL/c=;
 b=ZtZIFr4q4SY0KTy8hKiWwkJxKHQKHqxCKjChzMZ2QKIW7PnTyI4xJNal/uw27r7q9p
 ovyR/EQZNmU0Q+PlsoxaZ4Dg4FJZ03q1oYifgnfRdSwyAeK1qe7t4imcwEGIfN7PN4E6
 O1RUiGRethWT1JKYNvJ8tfX4bkWh7Xs+aaklM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rbMlA+2ZGai32FIpt95gGwqvjqEH0LhXvEtCRMbQL/c=;
 b=JYvQGjcdwcesTUUtFpyHr8dcIeEQSBDQ1tdTzQKsM9ktlw8ldO0Mn9vPmnqlfXLYAQ
 SInS4ZyoHUE9RWUPKOuLSk3USWGtILbGOZ6w4+lZGc3ib/86tX4LSUnZILURZTT6+Ajs
 bg7wDoYFjyvcMGiJAL2bmHJu1sR0Naifn4wGHsFZa+/6cqV9u8o3Xemg7pnd2YwgVsr2
 sB7GTERCKCG2XiyyL7Tuv5YrHFjhHuP1kea88gL4+4uBfgTwEXcLmYbminY3j5++Ex7X
 G90K+0fwtTwb1TjjwL51om0FukB7qX5FhrLForLoiDdv6jgUkfk5pRuIJknKbycXAHtu
 NYkg==
X-Gm-Message-State: AOAM530jIOIZk03CJiPvl4QNJ1lxxOS6af7yJhIilaOHFWiwNhpbnV5s
 Cw3+wqksfiOyKRyhVtExw0IhjhTO1+Tv1p4l
X-Google-Smtp-Source: ABdhPJy3MPZ4PyyeAZHkF1QA+6SBDNNgPFGlZNqbhHraSO3Qwe6JSjzgAhsuS6cXH7sSIu/XJm2fhA==
X-Received: by 2002:a1c:9848:: with SMTP id a69mr3635815wme.158.1604484273327; 
 Wed, 04 Nov 2020 02:04:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n23sm120113wmk.24.2020.11.04.02.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 02:04:32 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/6] drm: Compile out legacy chunks from struct drm_device
Date: Wed,  4 Nov 2020 11:04:21 +0100
Message-Id: <20201104100425.1922351-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104100425.1922351-1-daniel.vetter@ffwll.ch>
References: <20201104100425.1922351-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This means some very few #ifdef in code, but it allows us to
enlist the compiler to make sure this stuff isn't used anymore.

More important, only legacy drivers change drm_device (for the
legacy_dev_list shadow attach management), therefore this is
prep to allow modern drivers to have a const driver struct. Which
is nice, because there's a ton of function pointers in there.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Review-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_file.c   |  2 ++
 drivers/gpu/drm/drm_vblank.c | 15 ++++++++++++---
 include/drm/drm_drv.h        |  2 ++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 0ac4566ae3f4..b50380fa80ce 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -258,9 +258,11 @@ void drm_file_free(struct drm_file *file)
 		  (long)old_encode_dev(file->minor->kdev->devt),
 		  atomic_read(&dev->open_count));
 
+#ifdef CONFIG_DRM_LEGACY
 	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
 	    dev->driver->preclose)
 		dev->driver->preclose(dev, file);
+#endif
 
 	if (drm_core_check_feature(dev, DRIVER_LEGACY))
 		drm_legacy_lock_release(dev, file->filp);
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index ba7e741764aa..15e5ea436434 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -210,9 +210,12 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 
 		if (crtc->funcs->get_vblank_counter)
 			return crtc->funcs->get_vblank_counter(crtc);
-	} else if (dev->driver->get_vblank_counter) {
+	}
+#ifdef CONFIG_DRM_LEGACY
+	else if (dev->driver->get_vblank_counter) {
 		return dev->driver->get_vblank_counter(dev, pipe);
 	}
+#endif
 
 	return drm_vblank_no_hw_counter(dev, pipe);
 }
@@ -430,9 +433,12 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
 
 		if (crtc->funcs->disable_vblank)
 			crtc->funcs->disable_vblank(crtc);
-	} else {
+	}
+#ifdef CONFIG_DRM_LEGACY
+	else {
 		dev->driver->disable_vblank(dev, pipe);
 	}
+#endif
 }
 
 /*
@@ -1097,9 +1103,12 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
 
 		if (crtc->funcs->enable_vblank)
 			return crtc->funcs->enable_vblank(crtc);
-	} else if (dev->driver->enable_vblank) {
+	}
+#ifdef CONFIG_DRM_LEGACY
+	else if (dev->driver->enable_vblank) {
 		return dev->driver->enable_vblank(dev, pipe);
 	}
+#endif
 
 	return -EINVAL;
 }
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index c6d17550efc9..7af220226a25 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -498,6 +498,7 @@ struct drm_driver {
 	 */
 	const struct file_operations *fops;
 
+#ifdef CONFIG_DRM_LEGACY
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 
@@ -512,6 +513,7 @@ struct drm_driver {
 	int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
 	void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
 	int dev_priv_size;
+#endif
 };
 
 void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
