Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE172F2A31
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE656E12E;
	Tue, 12 Jan 2021 08:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2516E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:07 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id y187so1257461wmd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iyIOXJ0VIdV0CXTR26cIPfrtzhrJA9S+eFXB+R458hU=;
 b=HkGZwlq1P0ysdDMqtzTlW4gaZzaMCx39NpYnz33gc+0zJhGNJrRgtzudAkPme0jJ4F
 EtjbRwN+A1FwivXzCrCbVP4SlqT9nbTeq568hduKxC3IqF7iIr0FWuCkbW4Z+fUQuD9O
 t2TBmKrUOVzJh256mJRy+pdulk14JKL/5skWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iyIOXJ0VIdV0CXTR26cIPfrtzhrJA9S+eFXB+R458hU=;
 b=IfAvN8P0GIh/oDOSzhU8Jyqp/cuZHsvHcud+p8J1lNI7nUPjjZ5XwL0+H5Jhlk1NfA
 kZjhqDujuHeApgsgS+CNs9WMUMD1ZaFRSAt9Vh6c0M3swYYJff8AZwfbxbBLvHqY9vXz
 qljaZeyq6g3GFphcYmJ/EKhwobkKXm6guc5GGXSsj5N49a3Gfvf3YvD/rhtircKqaLRE
 WwX+bS91ROlGEhOv46HS92ScNcTx7YIffihm5Onk7x+BFVwRuk14ik4LmfVMrCDQH0fA
 Mzf1hpaCQKPdHZgoQDqvBMTp+YzdbFBZ8KRYqr2kzCDAePGXbDK//T0K50QMqS6d2x75
 tBAg==
X-Gm-Message-State: AOAM531gEbUr4qvmYWdxjgFBoJCEkPNZWhJX1fYJen694UqmLxrmNXF8
 bALCZbGtyM7DlL2oGvpiZnMY5+El5p5bwPeN
X-Google-Smtp-Source: ABdhPJw0jsoTfdgfDqSan74YFsQhbeEdH0p3gDMPrB2EylYyKB1p5aav/nLxqEh4m6Dt23AN4Sj3/A==
X-Received: by 2002:a1c:10c:: with SMTP id 12mr2456868wmb.186.1610441045594;
 Tue, 12 Jan 2021 00:44:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:04 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/15] drm/arc: Switch to devm_drm_dev_alloc
Date: Tue, 12 Jan 2021 09:43:44 +0100
Message-Id: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Need to embedded the drm_device, but for now we keep the usual
  pointer chasing.
- No more devm_kzalloc, which fixes a lifetime issues on driver
  remove.
- No more drm_dev_put, that's done by devm_ now.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu.h     |  1 +
 drivers/gpu/drm/arc/arcpgu_drv.c | 33 +++++++++++++-------------------
 2 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index 6aac44b953ad..cd9e932f501e 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -9,6 +9,7 @@
 #define _ARCPGU_H_
 
 struct arcpgu_drm_private {
+	struct drm_device	drm;
 	void __iomem		*regs;
 	struct clk		*clk;
 	struct drm_framebuffer	*fb;
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index f164818ec477..68eb4a31c54b 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -42,18 +42,14 @@ static void arcpgu_setup_mode_config(struct drm_device *drm)
 
 DEFINE_DRM_GEM_CMA_FOPS(arcpgu_drm_ops);
 
-static int arcpgu_load(struct drm_device *drm)
+static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 {
-	struct platform_device *pdev = to_platform_device(drm->dev);
-	struct arcpgu_drm_private *arcpgu;
+	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
 	struct device_node *encoder_node = NULL, *endpoint_node = NULL;
+	struct drm_device *drm = &arcpgu->drm;
 	struct resource *res;
 	int ret;
 
-	arcpgu = devm_kzalloc(&pdev->dev, sizeof(*arcpgu), GFP_KERNEL);
-	if (arcpgu == NULL)
-		return -ENOMEM;
-
 	drm->dev_private = arcpgu;
 
 	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
@@ -162,30 +158,28 @@ static struct drm_driver arcpgu_drm_driver = {
 
 static int arcpgu_probe(struct platform_device *pdev)
 {
-	struct drm_device *drm;
+	struct arcpgu_drm_private *arcpgu;
 	int ret;
 
-	drm = drm_dev_alloc(&arcpgu_drm_driver, &pdev->dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	arcpgu = devm_drm_dev_alloc(&pdev->dev, &arcpgu_drm_driver,
+				    struct arcpgu_drm_private, drm);
+	if (IS_ERR(arcpgu))
+		return PTR_ERR(arcpgu);
 
-	ret = arcpgu_load(drm);
+	ret = arcpgu_load(arcpgu);
 	if (ret)
-		goto err_unref;
+		return ret;
 
-	ret = drm_dev_register(drm, 0);
+	ret = drm_dev_register(&arcpgu->drm, 0);
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_generic_setup(drm, 16);
+	drm_fbdev_generic_setup(&arcpgu->drm, 16);
 
 	return 0;
 
 err_unload:
-	arcpgu_unload(drm);
-
-err_unref:
-	drm_dev_put(drm);
+	arcpgu_unload(&arcpgu->drm);
 
 	return ret;
 }
@@ -196,7 +190,6 @@ static int arcpgu_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(drm);
 	arcpgu_unload(drm);
-	drm_dev_put(drm);
 
 	return 0;
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
