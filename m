Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB45E5AD619
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AF810E41C;
	Mon,  5 Sep 2022 15:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D14C10E41C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69RvVGMWC6PWcztw+ehBzvKOoAq86yIaOh4KmWH1rn8=;
 b=E6kBxVrHQg5BpXAhB3aH8H20+QiJVQY6Tt1eoILmv9a2SwXJ7gPZxSy904ojlpay+Ri0nq
 LEfZ3I98OAXEOpB7/tjZFIVaioXZ7X+1VIAUyHclT0Und+PpRqOYXnpvmThjU69mq5fA/Z
 mA+oB8d/JenwetQbjxvsgzfdrc5q05s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-XB52ZKznPhmmmagOk18XHg-1; Mon, 05 Sep 2022 11:19:19 -0400
X-MC-Unique: XB52ZKznPhmmmagOk18XHg-1
Received: by mail-ej1-f72.google.com with SMTP id
 gn30-20020a1709070d1e00b0074144af99d1so2460346ejc.17
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=69RvVGMWC6PWcztw+ehBzvKOoAq86yIaOh4KmWH1rn8=;
 b=RE40Q64/2BqQBmEknAsDJ8Vccgg/p7KoET/cxx9Ziz9AtNbW/ZbQx6qmc3gH73xXIT
 QnvnE3d2u8FpJxzkDGcL+N5Ls7EqFnXCb/vPkjdUMaZY3KdMdN/KQWndevM4CeeWzXaw
 GmmF5z31TCKIUDcGGIfMw34ZX6WFAonaU16YQ3VM52Pl4mQHuDidpgGVNKD0hNT9L/sA
 y7XrH+hq8Dh7yX2+X5lhuwjeWmYTdNyyRIq+/bXob/ymERzCM/o9E56hfPbGo6LFL53x
 udabisLJgaITaTrPdw4Yhsb3kibaJaML2fdEiqG0v8D8NeEU+WbxLt6csmtQNIEmQdyn
 KE9Q==
X-Gm-Message-State: ACgBeo01feLLfkXhH5bkTC9U7P4Zh0yNdnKCdt5Q2Bz5nTu6jpQTroqS
 iQM++da8Oai+NXnr28oLbTL6NeSn4mJ5EH2PbsUErWpYM+Jy3AZkDlooPbHVFPstXklTnmT1yJ5
 Mq7lmG29y+m9flDpHJ+pmcJJtd/cy
X-Received: by 2002:a17:907:7628:b0:73d:e0eb:2e51 with SMTP id
 jy8-20020a170907762800b0073de0eb2e51mr33667194ejc.237.1662391158773; 
 Mon, 05 Sep 2022 08:19:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6kcCtmJ0UuqvCPq50MTZD4S71/b8ch7tlxDuf+WGjPZhKl45DuBotJUWEhskX/YbPZg45ZIg==
X-Received: by 2002:a17:907:7628:b0:73d:e0eb:2e51 with SMTP id
 jy8-20020a170907762800b0073de0eb2e51mr33667181ejc.237.1662391158606; 
 Mon, 05 Sep 2022 08:19:18 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 n12-20020aa7d04c000000b0044e702cd712sm2741485edo.41.2022.09.05.08.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:19:18 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 1/8] drm/arm/malidp: use drmm_* to
 allocate driver structures
Date: Mon,  5 Sep 2022 17:19:03 +0200
Message-Id: <20220905151910.98279-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905151910.98279-1-dakr@redhat.com>
References: <20220905151910.98279-1-dakr@redhat.com>
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

