Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD055F1DB9
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 18:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7793C10E661;
	Sat,  1 Oct 2022 16:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C5F10E65F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664642395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TF2idh4cfIfrFOF9EVS0R3ai/ZWpJhhFk/BXprIYCn4=;
 b=DbxmXzE3TY/dQocpqx5xeK2LdE5tAEjMKt4X6W8mr0PMLzV/ty6Xzz1QNyPoZtGIai5yWJ
 7Z5EORtma5dSxuk4Py/fnxt/eWZ/qzvd+KaPrBa3YfXfGP80+IZPjaEWPH57ETRjUdom52
 cqBtcfZ1B+tRgRpacWdClFk5tQl5zrM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-oso4ngkgPYGBSmoO2-moxA-1; Sat, 01 Oct 2022 12:39:54 -0400
X-MC-Unique: oso4ngkgPYGBSmoO2-moxA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y9-20020a056402270900b00451dfbbc9b2so5722757edd.12
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 09:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TF2idh4cfIfrFOF9EVS0R3ai/ZWpJhhFk/BXprIYCn4=;
 b=z2ICDU9wCmgaosUu7kl4M257tHoOkgyRtpvSbM6U/hhqrlQJlCAqmoq6r7Ov7JXirR
 xiKNgvHQd4/nFI1hYAeI+ZjeS0CHP6m+HHVw3i0jyGI23mWRMX/nhzew/q4xzJ/SpS8z
 HwWnvfxwDHmVIF5vSgq7lq4xKGvvRj5Sq6UR1ALglyDTV+Ruv5c4yLRSwl3IIYxUTXFx
 vobYNyMjMs6Bak9tZjO66RMCj6qH7JgeZQn2QK+S62wJYyp9+Te2yvYr2//HWA3NbCTV
 Cp54u6/y9rrEbKpJ+kbsgGtxKFdqddhyLibN+EPIqGcm5vSlepKO6sCfTHzPrYJ6wm+N
 lm7g==
X-Gm-Message-State: ACrzQf3hvwgurd1pHkapn6PnFz5+kX39B1JR/k/R8fVCwVRe3lJ1xsxI
 HY2lZn8RnIiPAGCZPodfCf41won5xlWf8wN87JZ2iEY3V57P7oH+hBeVyU+v3RGZBT91kJR8HfL
 cMj1XG3BMVLNWFdFyOgoie0ov8vk+
X-Received: by 2002:a17:907:7f13:b0:782:9f6f:edbc with SMTP id
 qf19-20020a1709077f1300b007829f6fedbcmr10285488ejc.544.1664642393319; 
 Sat, 01 Oct 2022 09:39:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4YiWo0W/l5+cQbA+w/X6w8Td19k+zzcWJMDh5uRvB8+XjnLfEvERBP2DIzt/cps2Y5Dr7exw==
X-Received: by 2002:a17:907:7f13:b0:782:9f6f:edbc with SMTP id
 qf19-20020a1709077f1300b007829f6fedbcmr10285478ejc.544.1664642393151; 
 Sat, 01 Oct 2022 09:39:53 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a05640214d200b004588ef795easm2841896edx.34.2022.10.01.09.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:39:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 1/9] drm/arm/malidp: use drmm_* to allocate
 driver structures
Date: Sat,  1 Oct 2022 18:39:38 +0200
Message-Id: <20221001163946.534067-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001163946.534067-1-dakr@redhat.com>
References: <20221001163946.534067-1-dakr@redhat.com>
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

