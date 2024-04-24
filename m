Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDD38B021F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F26110E498;
	Wed, 24 Apr 2024 06:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8229A10E0B6;
 Wed, 24 Apr 2024 06:38:35 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3476dcd9c46so4920900f8f.0; 
 Tue, 23 Apr 2024 23:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713940714; x=1714545514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M7F6fcWvuVbwO8A7BKBGHpEMXt2s9j8A9+ZiuFQieNc=;
 b=VzW0LE0AoN6GuH77ThNHpnfziLLrzLfM8MtqKPmsQJJGup1dJptnkrtu+ov+5hT5MV
 WOq4Egw/p+W2MLA3DmBrm/5+ngEGFeVpyDa1Kb4K5WFxy52XB3kZ8XiL6PSV/PjzDkpL
 xPj+PyTotZUDry+wyvgcehr9Hnl2OKxft+/M/jb4zNW3sCXLhLxBwAVgl55iEJcGpqBp
 gsc3ECMMIEiJ8buqEyXMxRXFP5t5UXuE82UVuuc48dVE6BzsxqSDRbH8tEpMwbQrpVx8
 YAGI8enUipaxRrJc8rLLwoufAVK1gHbFPNSQXuUvTr1inol13cm8X4Xf86GA5iGrsNEA
 R8OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfxdrHdMv5KJl44pvq04kmQCZHsc+lTFGSmDCfJH60DrFD1GNj+tqlH1nc0g1Q4n8FUy4d5lRQWqsCl7eGr++nZhvQ0noU7WT+gGRwXneTD5J6fkc7Jl+vW6KOtJjgOyppBZa1R8a8DG80W6a+YA==
X-Gm-Message-State: AOJu0YwJ8ZM3jDOYXI8yfCqJKazXJX4/CseX+ma1oPrNNjTZmwxKzKVu
 EtOZhwzyM0hpPyryZgFPXMIwUiHazbqb0vJhBP/xFspRKH9CPlnnQ+WrGMRz
X-Google-Smtp-Source: AGHT+IGZxz0n9OTHB3mbYtVMEI21k1MjIrdkYkQkkOS5bd8p0H9eqeY2ndEMfxp9vJxluXAE0WdVSA==
X-Received: by 2002:a5d:4b48:0:b0:346:cd6f:3fd9 with SMTP id
 w8-20020a5d4b48000000b00346cd6f3fd9mr799188wrs.10.1713940713579; 
 Tue, 23 Apr 2024 23:38:33 -0700 (PDT)
Received: from localhost.localdomain (cst-prg-33-92.cust.vodafone.cz.
 [46.135.33.92]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b00419f7b73c55sm14284298wmq.0.2024.04.23.23.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 23:38:33 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: Create an accel device node if compute-only
Date: Wed, 24 Apr 2024 08:37:51 +0200
Message-ID: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.44.0
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

If we expose a render node for NPUs without rendering capabilities, the
userspace stack will offer it to compositors and applications for
rendering, which of course won't work.

Userspace is probably right in not questioning whether a render node
might not be capable of supporting rendering, so change it in the kernel
instead by exposing a /dev/accel node.

Before we bring the device up we don't know whether it is capable of
rendering or not (depends on the features of its blocks), so first try
to probe a rendering node, and if we find out that there is no rendering
hardware, abort and retry with an accel node.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 46 ++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..8e7dd23115f4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_accel.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -488,10 +489,10 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(fops);
+DEFINE_DRM_GEM_FOPS(render_fops);
+DEFINE_DRM_ACCEL_FOPS(accel_fops);
 
-static const struct drm_driver etnaviv_drm_driver = {
-	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
+static struct drm_driver etnaviv_drm_driver = {
 	.open               = etnaviv_open,
 	.postclose           = etnaviv_postclose,
 	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
@@ -500,7 +501,6 @@ static const struct drm_driver etnaviv_drm_driver = {
 #endif
 	.ioctls             = etnaviv_ioctls,
 	.num_ioctls         = DRM_ETNAVIV_NUM_IOCTLS,
-	.fops               = &fops,
 	.name               = "etnaviv",
 	.desc               = "etnaviv DRM",
 	.date               = "20151214",
@@ -508,15 +508,20 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.minor              = 4,
 };
 
-/*
- * Platform driver:
- */
-static int etnaviv_bind(struct device *dev)
+static int etnaviv_bind_with_type(struct device *dev, u32 type)
 {
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
+	bool is_compute_only = true;
 	int ret;
 
+	etnaviv_drm_driver.driver_features = DRIVER_GEM | type;
+
+	if (type == DRIVER_RENDER)
+		etnaviv_drm_driver.fops = &render_fops;
+	else
+		etnaviv_drm_driver.fops = &accel_fops;
+
 	drm = drm_dev_alloc(&etnaviv_drm_driver, dev);
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
@@ -553,6 +558,18 @@ static int etnaviv_bind(struct device *dev)
 
 	load_gpu(drm);
 
+	for (unsigned int i = 0; i < ETNA_MAX_PIPES; i++) {
+		struct etnaviv_gpu *g = priv->gpu[i];
+
+		if (g && (g->identity.minor_features8 & chipMinorFeatures8_COMPUTE_ONLY) == 0)
+			is_compute_only = false;
+	}
+
+	if (type == DRIVER_RENDER && is_compute_only) {
+		ret = -EINVAL;
+		goto out_unbind;
+	}
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto out_unbind;
@@ -571,6 +588,19 @@ static int etnaviv_bind(struct device *dev)
 	return ret;
 }
 
+/*
+ * Platform driver:
+ */
+static int etnaviv_bind(struct device *dev)
+{
+	int ret = etnaviv_bind_with_type(dev, DRIVER_RENDER);
+
+	if (ret == -EINVAL)
+		return etnaviv_bind_with_type(dev, DRIVER_COMPUTE_ACCEL);
+
+	return ret;
+}
+
 static void etnaviv_unbind(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-- 
2.44.0

