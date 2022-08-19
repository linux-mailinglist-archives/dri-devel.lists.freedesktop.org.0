Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5FC59A781
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 23:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB6810E469;
	Fri, 19 Aug 2022 21:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB1010E11C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 21:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660944029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69RvVGMWC6PWcztw+ehBzvKOoAq86yIaOh4KmWH1rn8=;
 b=SVhtS8uVhAfEP+qtYYsOOkpdL05WJzJstd3GlwqYaUvmyMBcwEVWJ/Lh1plPpmg33/ypDO
 c25/L+CnNgT5FI5Xb7rIU/heXkoNFu6q/dPxO7sH2sbzxA+KYI2jwppBOy2n5Od4a7uM7Z
 ze3pcihQCdAKDffMbll0sNAib81gzwE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-pVJ6-I6UMzCP4NfwNvApRw-1; Fri, 19 Aug 2022 17:20:20 -0400
X-MC-Unique: pVJ6-I6UMzCP4NfwNvApRw-1
Received: by mail-ej1-f70.google.com with SMTP id
 qf23-20020a1709077f1700b007308a195618so1904706ejc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 14:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=69RvVGMWC6PWcztw+ehBzvKOoAq86yIaOh4KmWH1rn8=;
 b=Qd1o7gzKcCYZNVa8+Y71Av5fBzwui1aNJ/qxwhZhtnUlOuWvIr3/kfCSj5HwPV5dh0
 MN1YwJo2WwOzryfu7P8DPHygKdLrIA1MdW5AJnNyfofiUsJXMOTwupiRWIvKRCJ19//g
 cwJY8aTsCBRqHhHUsu9ieTq5rAjA7ZltSX+j/Bdsz8J3vSJqpNp5AfGuevrZYd2WLpzE
 7mTMIlyTJIimYCurTQa7lYTa4Ix1+YZhKadIfbIT4myJaueUbyD1IzKL1lMXXvzMmv8e
 YDytSbv77CKaAtGNfIuoRZKVRa6a2131fS6sydJ07l59HhEJFETEHcizHW9/RSfA7SEH
 +J4w==
X-Gm-Message-State: ACgBeo2P587syhWdN5bINmma9hY08Td3dcnsJFOh/1tGOJI3VVc4vJDY
 QumpajCYMPShno9YysJh0Q+OISFEUN/NHENAais33Y9ILF/V2OBWjUXj1BmOb+GcxOYz44qD6t+
 pEWqiwbHLuD4OgzxRA5mmTGABb5OO
X-Received: by 2002:a05:6402:1d4e:b0:43d:9822:b4d1 with SMTP id
 dz14-20020a0564021d4e00b0043d9822b4d1mr7554032edb.212.1660944019758; 
 Fri, 19 Aug 2022 14:20:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5dFXgAXxrRicMIg3tcN2kRGkCFPbbgLp6c8l7TyVrDiXaHWuT6VnRsLgQQrd2FZHWq8dN9SQ==
X-Received: by 2002:a05:6402:1d4e:b0:43d:9822:b4d1 with SMTP id
 dz14-20020a0564021d4e00b0043d9822b4d1mr7554018edb.212.1660944019625; 
 Fri, 19 Aug 2022 14:20:19 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a1709063a8e00b0073a644ef803sm2777029ejd.101.2022.08.19.14.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 14:20:19 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 1/8] drm/arm/malidp: use drmm_* to allocate
 driver structures
Date: Fri, 19 Aug 2022 23:20:08 +0200
Message-Id: <20220819212015.556220-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819212015.556220-1-dakr@redhat.com>
References: <20220819212015.556220-1-dakr@redhat.com>
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
2.37.2

