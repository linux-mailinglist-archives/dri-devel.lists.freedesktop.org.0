Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695CFCAEDF2
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 05:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BAE10E47C;
	Tue,  9 Dec 2025 04:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mGAqRk1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C63C10E47C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 04:28:19 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-34374febdefso5377232a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 20:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765254499; x=1765859299; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okmIi4vWYl0QHDsaJwQNy/3wmdsCyJzm0p/g7ebWdjU=;
 b=mGAqRk1WC4msl/G2VZH8RoD0uA90avJm5//ybbbuPtplSKAFRPSM9UlishUt+gashJ
 4binLRwUabwNCQllkLnZaLmpphPtHJAjHItsAj+X1UzEFdF9FuoIykcbO8k6kOmkH2xF
 gorXgauP4zCX3nC/QmNCS1SzkxfGfGrKTEHc8j59cHrH0v9jE+IXYelDIDJP4oBEs8/5
 kG/39MhgqCYz8lR9xgDJm+aN1P/HNKlE8OV7Yni00CKB6bDmuBV/5VmnBo7aAJBImJOT
 JELBjvWR6ReImNw8OhQI8PWzB/T2fW2QxgFx52OR3ssCo6+gwMPW7JC1EDEDn4rNiE3Z
 I/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765254499; x=1765859299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=okmIi4vWYl0QHDsaJwQNy/3wmdsCyJzm0p/g7ebWdjU=;
 b=SMDncigyxYS54XDXgQ8izy5bJKd9lElHSAaGS1JeWtPmIgxZW0fhc/vg1iO+QUpoAb
 QYxw6lVB1VKQTQbIPU9j5S1zR1Ifvj9jOx0ikV2knVF/GImkfpkpIkWai3IQuaHqUKwI
 Q3B6S49US1MwEwgaisL8VcL5f+y0GvXHjOxxLZULHddoijMSeL6A9HN7ip6152FFKa9p
 HlDuIQcTTOI3gj8iv+4vLDv/adLGM1IUBjbqhfl8H8G5ZbtqrR/U2BuxUq3UO2oI+HDO
 qAH0/Jo7+Po7r/ML7+de0aVwbTMJdkV+pzKQxY01PjCFN6bJ2YCopK9gi6eZuRjxv7rh
 txRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVguL7HGugr+6P4B/kXVpDnHRGhH4ctSZo09q1+BRugdDuWUjmhobMSfdLWkWwSLca6QhGb1YbB7og=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ04QiC5dvYNkzynLcf/+ny/L+QTeLgTsLZ6/GIfXGYfSqjay+
 XLZ16nNEUfKImk0zyEV7FXx3aZjaB9nByncsYMo3GaRaTTXZPZccW8WK
X-Gm-Gg: ASbGncsL46GbXMoEgGlWmbGz/AqXjLq+cs+k8guk2ofzBeGXC3JfJhivhM3UGyxE1CA
 VPCPd2cj6fZKGhhNhM3qznp8ywxMLUizh6PLfky6qY7kdfpNCUfPbtakf7pGCfxyH3OG6BKUUhD
 DjLvRTjLgZWGLIKYlIx/lcToAfHV9ZkbPYa4eXPgl3V5KHy2wiKFKq2au2yr1H1hvkr7qiHaFYE
 UNLK/CPXCywa3zS+iSCb4lbO37woW36QJX0R9KP6LBuR9P6B159VzdtmLaPmnqEsIeCaduVWhCU
 BnMHAPpGHU+vzJsUdI13nmoZKUt7h9FrVWacPi1XtLQ2QVFehubo2J1ke1BNzs+dZwD4X0GlCM0
 Upe+T3TkQS1xtKuatgDkLbjgIXQyiCPMSKxocGBJ4pP4IY8g7YbWOC/ziBClYtlk0pE4xI9WH1Z
 T9NvkgJE/OGQVOGZLAq4d3N8y4O6qyMQA/226p7JvZnBo=
X-Google-Smtp-Source: AGHT+IH/sZjDstHQBk/4kkoOc4q4BWQ69NzeICX5PBywIS3oa9fbeB6YzchPZljjw9QmJ7GHpZIn7A==
X-Received: by 2002:a17:90b:1801:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-349a260ac22mr8426365a91.37.1765254498693; 
 Mon, 08 Dec 2025 20:28:18 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:b455:298d:48bb:1784])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 20:28:18 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH 1/3] fbtft: Make sysfs and dev_*() logging conditional on
 FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:42 -0800
Message-ID: <20251209042744.7875-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209042744.7875-1-chintanlike@gmail.com>
References: <20251209042744.7875-1-chintanlike@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbtft core and sysfs implementation unconditionally dereference
fb_info->dev and register sysfs attributes. When FB_DEVICE=n, these
fields are unavailable, leading to build failures.

This patch wraps all sysfs attribute creation/removal and dev_dbg/dev_info
logging in #ifdef CONFIG_FB_DEVICE, with pr_*() fallbacks for the
non-FB_DEVICE case. This makes fbtft fully buildable when FB_DEVICE is
disabled.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c  | 20 ++++++++++++++++++--
 drivers/staging/fbtft/fbtft-sysfs.c |  8 ++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 9e7b84071174..dc967bdeabe8 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -365,9 +365,14 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 	unsigned int val;
 	int ret = 1;
 
+#ifdef CONFIG_FB_DEVICE
 	dev_dbg(info->dev,
 		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
 		__func__, regno, red, green, blue, transp);
+#else
+	pr_debug("%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
+		 __func__, regno, red, green, blue, transp);
+#endif
 
 	switch (info->fix.visual) {
 	case FB_VISUAL_TRUECOLOR:
@@ -391,8 +396,11 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
 	struct fbtft_par *par = info->par;
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
-		__func__, blank);
+#ifdef CONFIG_FB_DEVICE
+	dev_dbg(info->dev, "%s(blank=%d)\n", __func__, blank);
+#else
+	pr_debug("%s(blank=%d)\n", __func__, blank);
+#endif
 
 	if (!par->fbtftops.blank)
 		return ret;
@@ -793,6 +801,8 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
+
+#ifdef CONFIG_FB_DEVICE
 	dev_info(fb_info->dev,
 		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
 		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
@@ -804,6 +814,12 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 		fb_info->bl_dev->props.power = BACKLIGHT_POWER_ON;
 		fb_info->bl_dev->ops->update_status(fb_info->bl_dev);
 	}
+#else
+	pr_info("%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+		fb_info->fix.smem_len >> 10, text1,
+		HZ / fb_info->fbdefio->delay, text2);
+#endif
 
 	return 0;
 
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index e45c90a03a90..944f74f592d0 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -89,6 +89,7 @@ int fbtft_gamma_parse_str(struct fbtft_par *par, u32 *curves,
 	return ret;
 }
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t
 sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
 {
@@ -145,6 +146,7 @@ static ssize_t show_gamma_curve(struct device *device,
 static struct device_attribute gamma_device_attrs[] = {
 	__ATTR(gamma, 0660, show_gamma_curve, store_gamma_curve),
 };
+#endif
 
 void fbtft_expand_debug_value(unsigned long *debug)
 {
@@ -173,6 +175,7 @@ void fbtft_expand_debug_value(unsigned long *debug)
 	}
 }
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t store_debug(struct device *device,
 			   struct device_attribute *attr,
 			   const char *buf, size_t count)
@@ -200,17 +203,22 @@ static ssize_t show_debug(struct device *device,
 
 static struct device_attribute debug_device_attr =
 	__ATTR(debug, 0660, show_debug, store_debug);
+#endif
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
+#ifdef CONFIG_FB_DEVICE
 	device_create_file(par->info->dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
 		device_create_file(par->info->dev, &gamma_device_attrs[0]);
+#endif
 }
 
 void fbtft_sysfs_exit(struct fbtft_par *par)
 {
+#ifdef CONFIG_FB_DEVICE
 	device_remove_file(par->info->dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
 		device_remove_file(par->info->dev, &gamma_device_attrs[0]);
+#endif
 }
-- 
2.43.0

