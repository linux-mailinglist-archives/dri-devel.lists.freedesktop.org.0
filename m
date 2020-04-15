Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879321A94D0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC38E6E8DE;
	Wed, 15 Apr 2020 07:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B586E8A1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h26so6469781wrb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p5nxv6sFrv49qRkQCRr6EHVDhp/xrnS2ylrpIQk+ldc=;
 b=SL6l+los8yC8KzC+ig7zbUt/3h0Ts8nLQN0J+AGM7pAO5AfMfJ8wCXSZKMhghA0WfW
 AP+6DkU6WAnQGc2TwIeZCPCRV4Rjv6mGtg7yWMFT3pRiz6YPw0VOgSMZgqxJORW86Zu7
 aGpPSkBXVP+18stjpwn4b6rf2A9tGW5ydUkOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p5nxv6sFrv49qRkQCRr6EHVDhp/xrnS2ylrpIQk+ldc=;
 b=XyoSTjykemi+4QjXwJGzOopgcSFkwLC5JgonHT7S5Q79VDr2Yk5P4aC9oyBViQW5qT
 JzBidWmip87KCI3oJ//oqI2VgXVGfqtxHsOapK8pA8lU9LpCRHCNUfTua8rYu2X0WCVr
 rUNNrVKTItOychBobJFq2I9t9QfMdyynXnUckkSDL/DMZn1SmbITaQi6/BU5tR0totJN
 Oh82O3pebPJK5y1g+uKeV0T3A5BW7TEjsMjIVBnIk32xbDfavHUwvLJP3XJptsgETTpL
 AWgB0qfRGLAQHtz826rPpW/AUNBr1k/mncKbYQgzLsuhckYSn5vSOyVw+N/YnpGphmmK
 Xtgw==
X-Gm-Message-State: AGi0Pub9CCUwp9fAEOwzdzAp/Rh7BuptQU03LTMnLosSff6AXfYlFfx4
 4dWsnEUzntOjEpw67vt1nONzoA==
X-Google-Smtp-Source: APiQypJe1V320iBQiAX7XyMkUPj34hmWC2UxrWmIPM54Cy3gpiOjnZREaU9iGvSgGg7Rm/jQjqF0gg==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr26062012wrj.337.1586936481630; 
 Wed, 15 Apr 2020 00:41:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 39/59] drm/arcpgu: Switch to devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:40:14 +0200
Message-Id: <20200415074034.175360-40-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Need to embedded the drm_device, but for now we keep the usual
  pointer chasing.
- No more devm_kzalloc, which fixes a lifetime issues on driver
  remove.
- No more drm_dev_put, that's done by devm_ now.

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
index c05d001163e0..bbd7acb150f3 100644
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
@@ -172,30 +168,28 @@ static struct drm_driver arcpgu_drm_driver = {
 
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
@@ -206,7 +200,6 @@ static int arcpgu_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(drm);
 	arcpgu_unload(drm);
-	drm_dev_put(drm);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
