Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD293F97C9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 12:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3026E911;
	Fri, 27 Aug 2021 10:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3516C6E911
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630058722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lZeoDfGlQri5XDPiQdcQrgFtTksnEzEKvvSetj4F1YU=;
 b=Sl5cBHnOaFct937evfOxWWHPUc+gxCcovxJIkxi5N/bKan5YKjyJhoc+4h64FNoHkXA2e2
 GWWuDXmSCLElVDJQzcEz9Q8u9gRPj76awZLyhNkumh8kngjA231Zr6z/Tzo2W+SbsaThI5
 dtoQ7yHlQZh+iPdWacq6Ete95tFKEEw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-0tyr01pSP9y1xzf7_Ecg7A-1; Fri, 27 Aug 2021 06:05:21 -0400
X-MC-Unique: 0tyr01pSP9y1xzf7_Ecg7A-1
Received: by mail-wr1-f72.google.com with SMTP id
 l1-20020adff481000000b00156e670a09dso1713902wro.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 03:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZeoDfGlQri5XDPiQdcQrgFtTksnEzEKvvSetj4F1YU=;
 b=FAXtNky9fMcUDjm/v44WIxCz0XN6u3ximJiG41xjS1IG8ayzlY/GPF8okNaZqc9Yry
 gk8qNVkWFA3TLEn/i708e3ozKYZ2IHpX7rfQXl1PL1Njz+iupfQOEL98BLfazT5+r+nd
 PS7YhA8xT83fiAOH1GN+FQTnE+Y+JGeY5U5U2fSzSpzWu50bIoE3x4/Hm6HiU42K3Dy6
 IrLMO3k+yL8l9alEWoe67sEUJIPd1m+edRDp5dxSMWtwyOE7Mif01NFRyV/pByXuXog/
 l/ticusv7EOztm3RsFJaFUNPcKGVADFfC1l7r4p4pE8UA7abQJQJrexXL56Ial68st3+
 59Fg==
X-Gm-Message-State: AOAM530u5jefus1g90C8Om9DUQEoIa0V9AiX/g6rmI9sWBy3clsR4+8j
 9avOxJIUBNoGC03WCQ3plMUCE8g11b8J4l7YSroTrZSGPJERGqAmBXILgaL3TadG23Nmj74FHiO
 +RwY1Xd9fh+Nj6E1LoxNFrrRA9fPi
X-Received: by 2002:adf:df08:: with SMTP id y8mr9392596wrl.124.1630058719698; 
 Fri, 27 Aug 2021 03:05:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYBGwA75JVWOcmJT5hsoigsXYLcUTaODP/05DgoTOGDrSnXVpxO4l4S8a8RqPK/jBwF3ToxQ==
X-Received: by 2002:adf:df08:: with SMTP id y8mr9392561wrl.124.1630058719405; 
 Fri, 27 Aug 2021 03:05:19 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id e26sm6215156wrc.6.2021.08.27.03.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 03:05:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, x86@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [RFC PATCH 2/4] fbdev: Move framebuffer_{alloc,
 release}() functions to fbmem.c
Date: Fri, 27 Aug 2021 12:05:10 +0200
Message-Id: <20210827100510.1578493-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The framebuffer_alloc() and framebuffer_release() functions are much more
related with the functions in drivers/fbdev/core/fbmem.c than the ones in
drivers/fbdev/core/fbsysfs.c, that are only to manage sysfs attributes.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/core/fbmem.c   | 65 +++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbsysfs.c | 71 ------------------------------
 2 files changed, 65 insertions(+), 71 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index d886582c0a4..2b22e46b815 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -57,6 +57,71 @@ bool fb_center_logo __read_mostly;
 
 int fb_logo_count __read_mostly = -1;
 
+/**
+ * framebuffer_alloc - creates a new frame buffer info structure
+ *
+ * @size: size of driver private data, can be zero
+ * @dev: pointer to the device for this fb, this can be NULL
+ *
+ * Creates a new frame buffer info structure. Also reserves @size bytes
+ * for driver private data (info->par). info->par (if any) will be
+ * aligned to sizeof(long).
+ *
+ * Returns the new structure, or NULL if an error occurred.
+ *
+ */
+struct fb_info *framebuffer_alloc(size_t size, struct device *dev)
+{
+#define BYTES_PER_LONG (BITS_PER_LONG/8)
+#define PADDING (BYTES_PER_LONG - (sizeof(struct fb_info) % BYTES_PER_LONG))
+	int fb_info_size = sizeof(struct fb_info);
+	struct fb_info *info;
+	char *p;
+
+	if (size)
+		fb_info_size += PADDING;
+
+	p = kzalloc(fb_info_size + size, GFP_KERNEL);
+
+	if (!p)
+		return NULL;
+
+	info = (struct fb_info *) p;
+
+	if (size)
+		info->par = p + fb_info_size;
+
+	info->device = dev;
+	info->fbcon_rotate_hint = -1;
+
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+	mutex_init(&info->bl_curve_mutex);
+#endif
+
+	return info;
+#undef PADDING
+#undef BYTES_PER_LONG
+}
+EXPORT_SYMBOL(framebuffer_alloc);
+
+/**
+ * framebuffer_release - marks the structure available for freeing
+ *
+ * @info: frame buffer info structure
+ *
+ * Drop the reference count of the device embedded in the
+ * framebuffer info structure.
+ *
+ */
+void framebuffer_release(struct fb_info *info)
+{
+	if (!info)
+		return;
+	kfree(info->apertures);
+	kfree(info);
+}
+EXPORT_SYMBOL(framebuffer_release);
+
 static struct fb_info *get_fb_info(unsigned int idx)
 {
 	struct fb_info *fb_info;
diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index a040d6bd6c3..2c1e3f0effe 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -5,12 +5,6 @@
  * Copyright (c) 2004 James Simmons <jsimmons@infradead.org>
  */
 
-/*
- * Note:  currently there's only stubs for framebuffer_alloc and
- * framebuffer_release here.  The reson for that is that until all drivers
- * are converted to use it a sysfsification will open OOPSable races.
- */
-
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/fb.h>
@@ -20,71 +14,6 @@
 
 #define FB_SYSFS_FLAG_ATTR 1
 
-/**
- * framebuffer_alloc - creates a new frame buffer info structure
- *
- * @size: size of driver private data, can be zero
- * @dev: pointer to the device for this fb, this can be NULL
- *
- * Creates a new frame buffer info structure. Also reserves @size bytes
- * for driver private data (info->par). info->par (if any) will be
- * aligned to sizeof(long).
- *
- * Returns the new structure, or NULL if an error occurred.
- *
- */
-struct fb_info *framebuffer_alloc(size_t size, struct device *dev)
-{
-#define BYTES_PER_LONG (BITS_PER_LONG/8)
-#define PADDING (BYTES_PER_LONG - (sizeof(struct fb_info) % BYTES_PER_LONG))
-	int fb_info_size = sizeof(struct fb_info);
-	struct fb_info *info;
-	char *p;
-
-	if (size)
-		fb_info_size += PADDING;
-
-	p = kzalloc(fb_info_size + size, GFP_KERNEL);
-
-	if (!p)
-		return NULL;
-
-	info = (struct fb_info *) p;
-
-	if (size)
-		info->par = p + fb_info_size;
-
-	info->device = dev;
-	info->fbcon_rotate_hint = -1;
-
-#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
-	mutex_init(&info->bl_curve_mutex);
-#endif
-
-	return info;
-#undef PADDING
-#undef BYTES_PER_LONG
-}
-EXPORT_SYMBOL(framebuffer_alloc);
-
-/**
- * framebuffer_release - marks the structure available for freeing
- *
- * @info: frame buffer info structure
- *
- * Drop the reference count of the device embedded in the
- * framebuffer info structure.
- *
- */
-void framebuffer_release(struct fb_info *info)
-{
-	if (!info)
-		return;
-	kfree(info->apertures);
-	kfree(info);
-}
-EXPORT_SYMBOL(framebuffer_release);
-
 static int activate(struct fb_info *fb_info, struct fb_var_screeninfo *var)
 {
 	int err;
-- 
2.31.1

