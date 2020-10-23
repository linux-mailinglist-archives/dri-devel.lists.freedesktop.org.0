Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB26296F24
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0FC6E5A4;
	Fri, 23 Oct 2020 12:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63266E588
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:28:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q5so1325064wmq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dj2domUp6Tc4E/xynSJbnk7myrhGiB+pBgcgfXE3+yw=;
 b=KEXUk8TDsjfk/8cHeA27aWb2hlXbDLTdHjaJ1fyUKxoOcn68+vHJVTH/BuI3CxFRQ8
 HmltC3dxdgxDbv1HPD79J6LPsBJdHA1A9GjX8e78Nz3q18XHU792tbSlP+fjllhJGI8F
 9o3txJcOXkWKmLawDBlIAK15abfpCykubkHYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dj2domUp6Tc4E/xynSJbnk7myrhGiB+pBgcgfXE3+yw=;
 b=ZGXku5uud2ZULcamSuExDVRFqZpXTr80mPaWBpuujdGNFe/mCsdQwrVb+EU4VSEKdP
 oWL2Kd2wSWoeqYSLfDQd9AqTnH9XfA5F033KIgMfCPBPO1FKsWyj1JtWPs/8wO1fZuom
 n0L4OKvXy4TdUP1DnLGLUlrFfKytEj3WAAubB0AyOJi3+EKdAwnPPMH9j0Kb589UXIxM
 ULSIAMItEfjnbkRDbfw971p9bR+GRNs964d8KolL7eO9HsZ7K1N8bawGNB8/DXdNixJU
 g/on3rwyAGjOeLsdkwT/AMTCBULU10fDQz/m99SMnv2Uw8ndIesV32hc0Y+CJ+En5+io
 SiKA==
X-Gm-Message-State: AOAM533M09dXQnR65JZA7IeesHMoNaYYbsADqDqAEd3KJxQ5yfTQ/C7e
 KrqLfGHHI8pY4g5uj7zXLCwHJ3yy8lCXFXae
X-Google-Smtp-Source: ABdhPJwFukyZg0NRbHXO3De1/avBax66cIGoZNWfed4+Guu5htzIDU/jGCaQ9Q5Xe5rIMsLfB4qfsw==
X-Received: by 2002:a1c:383:: with SMTP id 125mr547324wmd.175.1603456100079;
 Fri, 23 Oct 2020 05:28:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j5sm3133451wrx.88.2020.10.23.05.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:28:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/5] drm: Compile out legacy chunks from struct drm_device
Date: Fri, 23 Oct 2020 14:28:08 +0200
Message-Id: <20201023122811.2374118-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122811.2374118-1-daniel.vetter@ffwll.ch>
References: <20201023122811.2374118-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
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

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
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
