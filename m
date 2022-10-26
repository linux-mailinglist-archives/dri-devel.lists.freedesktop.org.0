Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9B60E51A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648D110E511;
	Wed, 26 Oct 2022 16:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D65010E20C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666799986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TF2idh4cfIfrFOF9EVS0R3ai/ZWpJhhFk/BXprIYCn4=;
 b=BW8ISnNMsUsR7H4BFkWX5SIbP+dPFUq2Krxd7lQE+lan8ghyk1l5kzfEV1MgdqYVYfNY6X
 nXXppUXN2IvhI80UMoKEC3H50nxumNzu4swwYOgEWyvUD2/5RofLSEIfjbyEOR13rK5a0N
 Gp9v0/1sA05196zSqfl/1NWQaD47zVI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-YM7ISnrCPSmK2BOwXBKlGg-1; Wed, 26 Oct 2022 11:59:45 -0400
X-MC-Unique: YM7ISnrCPSmK2BOwXBKlGg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sa6-20020a1709076d0600b0078d84ed54b9so4756271ejc.18
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 08:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TF2idh4cfIfrFOF9EVS0R3ai/ZWpJhhFk/BXprIYCn4=;
 b=dzaiBI7FPy/egEvgJ8VKJV6DCFF8vP/U0nVhFHnEOiDq9KGjjWf7eUF1tQRCZj+Y5J
 mr2GexU2grOI26HGttxBhCA09kpDFeOIjlFIj5wO87OzqFBzSdOjWviqvr4O7IHMkHAG
 q/1T01IQZ9/7jpDZ3Sc771jYjmZHDdapvKY3JKsxDuek5qaC7ni/cGebdsfylDoXyM7w
 5c5tSGlXScNnkxJEf3Fn+7BDGL2jVzf7/oKch0G5ghvQJCdi3FlUzYqZxgJLAUlQrC/B
 LO/53yfFzWmPlSjhaXQgGvoejJ7P28j+SNhiu6hjvbkSPsQ5zpf41Y5DQX2XXjpiwVJb
 snEQ==
X-Gm-Message-State: ACrzQf36Za7sqOgtgOJFMZhuJSCGJConV/8bmdc9OY4qEcVKgQToiLwx
 pOJbq4onPTkrzcWLK4mxxqrbTG+hFEWrPpNK+ZkYIRR7cOpdRBBJ4kSrmAUbtBrzyK7qkIeQO0J
 ccwz5R8OYTQLpzkrLRa71K3VN/LXm
X-Received: by 2002:a17:907:96a0:b0:78d:dd45:a6d4 with SMTP id
 hd32-20020a17090796a000b0078ddd45a6d4mr38610051ejc.643.1666799984314; 
 Wed, 26 Oct 2022 08:59:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ii8CCAKar6QQOlbxy2yn47jUIqPXJUP1rbe5ZDO3WgicXHPJpDAiPJobAr6N1Rie8IEkLUw==
X-Received: by 2002:a17:907:96a0:b0:78d:dd45:a6d4 with SMTP id
 hd32-20020a17090796a000b0078ddd45a6d4mr38610038ejc.643.1666799984183; 
 Wed, 26 Oct 2022 08:59:44 -0700 (PDT)
Received: from pollux.. ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 a29-20020a509b5d000000b00461c1804cdasm3876740edj.3.2022.10.26.08.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:59:43 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 1/5] drm/arm/malidp: use drmm_* to allocate
 driver structures
Date: Wed, 26 Oct 2022 17:59:30 +0200
Message-Id: <20221026155934.125294-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026155934.125294-1-dakr@redhat.com>
References: <20221026155934.125294-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm managed resources to allocate driver structures and get rid of
the deprecated drm_dev_alloc() call and replace it with
devm_drm_dev_alloc().

This also serves as preparation to get rid of drm_device->dev_private
and to fix use-after-free issues on driver unload.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 20 +++++++-------------
 drivers/gpu/drm/arm/malidp_drv.h |  1 +
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 1d0b0c54ccc7..41c80e905991 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -23,6 +23,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
@@ -716,11 +717,13 @@ static int malidp_bind(struct device *dev)
 	int ret = 0, i;
 	u32 version, out_depth = 0;
 
-	malidp = devm_kzalloc(dev, sizeof(*malidp), GFP_KERNEL);
-	if (!malidp)
-		return -ENOMEM;
+	malidp = devm_drm_dev_alloc(dev, &malidp_driver, typeof(*malidp), base);
+	if (IS_ERR(malidp))
+		return PTR_ERR(malidp);
+
+	drm = &malidp->base;
 
-	hwdev = devm_kzalloc(dev, sizeof(*hwdev), GFP_KERNEL);
+	hwdev = drmm_kzalloc(drm, sizeof(*hwdev), GFP_KERNEL);
 	if (!hwdev)
 		return -ENOMEM;
 
@@ -753,12 +756,6 @@ static int malidp_bind(struct device *dev)
 	if (ret && ret != -ENODEV)
 		return ret;
 
-	drm = drm_dev_alloc(&malidp_driver, dev);
-	if (IS_ERR(drm)) {
-		ret = PTR_ERR(drm);
-		goto alloc_fail;
-	}
-
 	drm->dev_private = malidp;
 	dev_set_drvdata(dev, drm);
 
@@ -887,8 +884,6 @@ static int malidp_bind(struct device *dev)
 		malidp_runtime_pm_suspend(dev);
 	drm->dev_private = NULL;
 	dev_set_drvdata(dev, NULL);
-	drm_dev_put(drm);
-alloc_fail:
 	of_reserved_mem_device_release(dev);
 
 	return ret;
@@ -917,7 +912,6 @@ static void malidp_unbind(struct device *dev)
 		malidp_runtime_pm_suspend(dev);
 	drm->dev_private = NULL;
 	dev_set_drvdata(dev, NULL);
-	drm_dev_put(drm);
 	of_reserved_mem_device_release(dev);
 }
 
diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/malidp_drv.h
index cdfddfabf2d1..00be369b28f1 100644
--- a/drivers/gpu/drm/arm/malidp_drv.h
+++ b/drivers/gpu/drm/arm/malidp_drv.h
@@ -29,6 +29,7 @@ struct malidp_error_stats {
 };
 
 struct malidp_drm {
+	struct drm_device base;
 	struct malidp_hw_device *dev;
 	struct drm_crtc crtc;
 	struct drm_writeback_connector mw_connector;
-- 
2.37.3

