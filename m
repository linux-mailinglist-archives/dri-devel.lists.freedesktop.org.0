Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD3E790429
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3EB10E82C;
	Fri,  1 Sep 2023 23:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F8310E819
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:40 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68c3b9f8333so330449b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611759; x=1694216559;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRgeQgzVDXmV3JVrPP8xBMX8Swv3+BcS7jAR8idQ+gY=;
 b=irkOT8+GSjAcIBYW/JY1mowugLlzEsxK/24cvLRWVJ+PprcB2/l/qcHb5SXeqnQKcb
 xosZ9qosIF9qZ4i2uEiL25XApsn4eGYYMjjkkvBsMURZ7Xs4mKSrRjL9v25PPCAWMv1g
 G9qDnJuvLOBv8Bj+QIEyxs7kO07v9SuSGIyig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611759; x=1694216559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vRgeQgzVDXmV3JVrPP8xBMX8Swv3+BcS7jAR8idQ+gY=;
 b=YjL8ATkMu0WumfZ1Gp8XcIfwmbTcI4tEvlJPGtKFIil+v7iDeaM0KVK+rD3JYQqBvR
 94ToPhyyW6220bKFyVsZlWH5azIlrZ5Cpx6Bz2KuXnuot2yLLSEDckqwcgTdwIjnKu22
 z8OjXxlINR1K7/Tyr3eGHa2BK02xiVhx7UJSrzUhAXfITS9Tai/Fw6oonDx4k4G4+w9S
 B1U50gJ9f2LGMxxCOE61RUoQf8uZFOI1HaSTnqiDnQpruV8YO00QHFlJxbpGrESyrpUM
 NZOt1R4NQSwKrutApRysthg5//wIquNwbZ3UMoQ2pGsuZkDzD/Er1hSR7+edTUSsvUD7
 bYGA==
X-Gm-Message-State: AOJu0Yxj/+jdo61qryNpReUdaKNkrX1KcgvCbNuOtM6rTLMMQ8ceYa3h
 RhlFqEKryaW2yacwLBkKsosEupI/+pkbx/nizLtzReqv
X-Google-Smtp-Source: AGHT+IGtmbAKHGuLHO3p7Yzikip33D41k/UMdvLiEDSJbNafsboBSz7i0yyxWsOXwhZuzfQmGxSWqA==
X-Received: by 2002:a05:6a00:4c8f:b0:68c:59cb:2dd9 with SMTP id
 eb15-20020a056a004c8f00b0068c59cb2dd9mr5216448pfb.1.1693611759266; 
 Fri, 01 Sep 2023 16:42:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 06/15] drm/nouveau: Call drm_atomic_helper_shutdown() or
 equiv at shutdown time
Date: Fri,  1 Sep 2023 16:41:17 -0700
Message-ID: <20230901164111.RFT.6.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() (or
drm_helper_force_disable_all() if not using atomic) at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested. I made my best guess about
how to fit this into the existing code. If someone wishes a different
style, please yell.

 drivers/gpu/drm/nouveau/nouveau_display.c  |  9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_display.h  |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c      | 13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h      |  1 +
 drivers/gpu/drm/nouveau/nouveau_platform.c |  6 ++++++
 5 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 99977e5fe716..04b3a3c0b5a5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -642,6 +642,15 @@ nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime)
 	disp->fini(dev, runtime, suspend);
 }
 
+void
+nouveau_display_shutdown(struct drm_device *dev)
+{
+	if (drm_drv_uses_atomic_modeset(dev))
+		drm_atomic_helper_shutdown(dev);
+	else
+		drm_helper_force_disable_all(dev);
+}
+
 static void
 nouveau_display_create_properties(struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 2ab2ddb1eadf..9df62e833cda 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -47,6 +47,7 @@ void nouveau_display_destroy(struct drm_device *dev);
 int  nouveau_display_init(struct drm_device *dev, bool resume, bool runtime);
 void nouveau_display_hpd_resume(struct drm_device *dev);
 void nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime);
+void nouveau_display_shutdown(struct drm_device *dev);
 int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
 void nouveau_display_resume(struct drm_device *dev, bool runtime);
 int  nouveau_display_vblank_enable(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4396f501b16a..d8e8160cdf35 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -879,6 +879,18 @@ nouveau_drm_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+void
+nouveau_drm_device_shutdown(struct drm_device *dev)
+{
+	nouveau_display_shutdown(dev);
+}
+
+static void
+nouveau_drm_shutdown(struct pci_dev *pdev)
+{
+	nouveau_drm_device_shutdown(pci_get_drvdata(pdev));
+}
+
 static int
 nouveau_do_suspend(struct drm_device *dev, bool runtime)
 {
@@ -1343,6 +1355,7 @@ nouveau_drm_pci_driver = {
 	.id_table = nouveau_drm_pci_table,
 	.probe = nouveau_drm_probe,
 	.remove = nouveau_drm_remove,
+	.shutdown = nouveau_drm_shutdown,
 	.driver.pm = &nouveau_pm_ops,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 3666a7403e47..aa936cabb6cf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -327,6 +327,7 @@ struct drm_device *
 nouveau_platform_device_create(const struct nvkm_device_tegra_func *,
 			       struct platform_device *, struct nvkm_device **);
 void nouveau_drm_device_remove(struct drm_device *dev);
+void nouveau_drm_device_shutdown(struct drm_device *dev);
 
 #define NV_PRINTK(l,c,f,a...) do {                                             \
 	struct nouveau_cli *_cli = (c);                                        \
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index 23cd43a7fd19..b2e82a96411c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -50,6 +50,11 @@ static int nouveau_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void nouveau_platform_shutdown(struct platform_device *pdev)
+{
+	nouveau_drm_device_shutdown(platform_get_drvdata(pdev));
+}
+
 #if IS_ENABLED(CONFIG_OF)
 static const struct nvkm_device_tegra_func gk20a_platform_data = {
 	.iommu_bit = 34,
@@ -94,4 +99,5 @@ struct platform_driver nouveau_platform_driver = {
 	},
 	.probe = nouveau_platform_probe,
 	.remove = nouveau_platform_remove,
+	.shutdown = nouveau_platform_shutdown,
 };
-- 
2.42.0.283.g2d96d420d3-goog

