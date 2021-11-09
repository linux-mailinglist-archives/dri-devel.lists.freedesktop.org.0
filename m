Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578C44B25F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 19:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB61689496;
	Tue,  9 Nov 2021 18:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79F789496;
 Tue,  9 Nov 2021 18:06:18 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id r5so24731pls.1;
 Tue, 09 Nov 2021 10:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rw7greifZhABHFWn91CmTF/gCrftsakQTlW3OGkKU7w=;
 b=enPy7SkbEuOM34F2ldNjQ6Qo9jy30AoeEMZpGhGUZ14g1aSmmrrK3qwTekOdP511+e
 OZliap5To5bm1bASWlIjABS+jpnkJS4XGePgdoI6mdaIL5LLSkwYzFgnyQFdDDbkNyVV
 klv11EuJrRm7JFV8+BBjIh4jeMzS2GDVyktKGtx2g++o+bxStdyLKN2K/tVVIJw8e0Gw
 JEd/djYc84/moHfRP9z3NINPAOMov8pxyjx93siIUhbQGwkc1x/PXjiopbONHYNXGajY
 h8D/8KGekgvgV4lX7tGy2Fj2GzmyHPbNRLB6GK5bbGvEuwsvDdlGAk1W0d8u7ecE5nU7
 dIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rw7greifZhABHFWn91CmTF/gCrftsakQTlW3OGkKU7w=;
 b=c34YKPknmlcXqxIP+hSv9cRlTPO43uROf5A0+rUG3Ws/xBxWr39QE9r1KgFDMMxnDt
 f3DL9hUTtk1yJM7Ks0oL/XKW9K6GBqmE1V+SjzyHe+unUwiebvOL4a7Cnl+gAZvs9t80
 ovYirWQbb+Xf9zvved7y4Mu+cdiogDC4Y+fQeQGogxonIdg55I8dTG+vP+gm3GBRXBqL
 TnLrCkQeMFnTF2RZS4X0J/+5jwJVeb2VdAu1UiIbm8DOShNdYayTjMGXzeOJCEU5SqyL
 +eqPp/Qj0ZPGHrWxG6MS6nkpHduzt588byJBrQkFCoTYa7iVAJ0sXvjq7Lzr42pvyVED
 MXYQ==
X-Gm-Message-State: AOAM532E+mWmucLkL6uU1EOpXgadECX8xryt2hZJB44FEnBPBVAhm8Ej
 LpmSfFwEVZSqy3gmEoiXhs86h3LO0IM=
X-Google-Smtp-Source: ABdhPJy5aPYKosWeIJsueKC34CrIMDut9eS6BASfVfXTdZefBNR7/9Pqe/Uk05vW50M5F0F4FsqADQ==
X-Received: by 2002:a17:90a:df97:: with SMTP id
 p23mr9401227pjv.3.1636481177667; 
 Tue, 09 Nov 2021 10:06:17 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 i185sm11221292pfg.80.2021.11.09.10.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 10:06:15 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/msm: Remove unnecessary struct_mutex
Date: Tue,  9 Nov 2021 10:11:01 -0800
Message-Id: <20211109181117.591148-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109181117.591148-1-robdclark@gmail.com>
References: <20211109181117.591148-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The struct_mutex locking is a remnant from the days before per-obj locks,
and no longer needed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 37 ++++++++++---------------------
 drivers/gpu/drm/msm/msm_fbdev.c   | 13 ++++-------
 2 files changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index dee13fedee3b..698e86f5b960 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -134,8 +134,10 @@ DEFINE_SIMPLE_ATTRIBUTE(shrink_fops,
 			"0x%08llx\n");
 
 
-static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
+static int msm_gem_show(struct seq_file *m, void *arg)
 {
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
@@ -150,8 +152,10 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 	return 0;
 }
 
-static int msm_mm_show(struct drm_device *dev, struct seq_file *m)
+static int msm_mm_show(struct seq_file *m, void *arg)
 {
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
@@ -159,8 +163,10 @@ static int msm_mm_show(struct drm_device *dev, struct seq_file *m)
 	return 0;
 }
 
-static int msm_fb_show(struct drm_device *dev, struct seq_file *m)
+static int msm_fb_show(struct seq_file *m, void *arg)
 {
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_framebuffer *fb, *fbdev_fb = NULL;
 
@@ -183,29 +189,10 @@ static int msm_fb_show(struct drm_device *dev, struct seq_file *m)
 	return 0;
 }
 
-static int show_locked(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
-	int (*show)(struct drm_device *dev, struct seq_file *m) =
-			node->info_ent->data;
-	int ret;
-
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
-	if (ret)
-		return ret;
-
-	ret = show(dev, m);
-
-	mutex_unlock(&dev->struct_mutex);
-
-	return ret;
-}
-
 static struct drm_info_list msm_debugfs_list[] = {
-		{"gem", show_locked, 0, msm_gem_show},
-		{ "mm", show_locked, 0, msm_mm_show },
-		{ "fb", show_locked, 0, msm_fb_show },
+		{"gem", msm_gem_show},
+		{ "mm", msm_mm_show },
+		{ "fb", msm_fb_show },
 };
 
 static int late_init_minor(struct drm_minor *minor)
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 0daaeb54ff6f..4c39ef9dd75d 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -81,8 +81,6 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 
 	bo = msm_framebuffer_bo(fb, 0);
 
-	mutex_lock(&dev->struct_mutex);
-
 	/*
 	 * NOTE: if we can be guaranteed to be able to map buffer
 	 * in panic (ie. lock-safe, etc) we could avoid pinning the
@@ -91,14 +89,14 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	ret = msm_gem_get_and_pin_iova(bo, priv->kms->aspace, &paddr);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to get buffer obj iova: %d\n", ret);
-		goto fail_unlock;
+		goto fail;
 	}
 
 	fbi = drm_fb_helper_alloc_fbi(helper);
 	if (IS_ERR(fbi)) {
 		DRM_DEV_ERROR(dev->dev, "failed to allocate fb info\n");
 		ret = PTR_ERR(fbi);
-		goto fail_unlock;
+		goto fail;
 	}
 
 	DBG("fbi=%p, dev=%p", fbi, dev);
@@ -115,7 +113,7 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	fbi->screen_base = msm_gem_get_vaddr(bo);
 	if (IS_ERR(fbi->screen_base)) {
 		ret = PTR_ERR(fbi->screen_base);
-		goto fail_unlock;
+		goto fail;
 	}
 	fbi->screen_size = bo->size;
 	fbi->fix.smem_start = paddr;
@@ -124,12 +122,9 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	DBG("par=%p, %dx%d", fbi->par, fbi->var.xres, fbi->var.yres);
 	DBG("allocated %dx%d fb", fbdev->fb->width, fbdev->fb->height);
 
-	mutex_unlock(&dev->struct_mutex);
-
 	return 0;
 
-fail_unlock:
-	mutex_unlock(&dev->struct_mutex);
+fail:
 	drm_framebuffer_remove(fb);
 	return ret;
 }
-- 
2.31.1

