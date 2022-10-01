Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C6E5F1842
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 03:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9EA10EDF7;
	Sat,  1 Oct 2022 01:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65C810EDF7
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 01:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664587155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLaZVg/Gn3THIn1ghLrf5MedEqRFiq/AUqXfvtIcrvk=;
 b=PaDP/rAwA1usCWsU8HRj0xQ7xc2MvInSxOsyV5d3P2mqZGp559cqNNnUx8e7f69kzD6rKa
 CApjCE8CexCAXTBmZ7ouNd0avIp3tQPvQiE8XIb2KGb8Ef8NskmOQzQ83ElIN2v3rofg/w
 JtqvSCj2SJPIruO16omxam2yiG6xn1g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-PTdE3r_5OoC6AV2878UA-w-1; Fri, 30 Sep 2022 21:19:14 -0400
X-MC-Unique: PTdE3r_5OoC6AV2878UA-w-1
Received: by mail-ed1-f71.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so4618622eda.19
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 18:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fLaZVg/Gn3THIn1ghLrf5MedEqRFiq/AUqXfvtIcrvk=;
 b=ujm4jhwTgmbMj+1gJVElEDku8leqnTECo8F04AOJdogY22pDQbIcqdAy4Lh2x080jl
 bDe/EqedDS2d09InrP0bDAAsPKSUR4uXzOjP9YKrrtL4kk04yxMjFhnWCbDIY2T9Wf/f
 FDXjZmihwAPBpNEIh/Q6eqL/HynVdemYykX4zgt5I/ijw7pSRuYfwopX6sm1BZZiFAum
 +8TE2yFKPvsB49jNqwe/sz2tXU2Udg3gS4p2aTVZqZez+nqHTGM1SltbvXSuviq/xddO
 tYsV36+GRce9x/R2h2371BWlYIKMvClX0EsHPkLnmYuFmmTg4enBgf7LFavuxscZNAwH
 3y1g==
X-Gm-Message-State: ACrzQf3Sji0AHXX+WgRtNd6RQKsNGbAzfAPk9+m6fp/UbdbDJyhF3Frw
 lHfn+F/WI+KNFPE//7XhT/LbtJxsnW7HgOdbK7hXRBH/3JgQdWuDtOtUkLpzeW5uLnpI/8TM8lq
 NwhktdhRxT73VD4Z7ORPmPuSCspgK
X-Received: by 2002:a17:907:8a23:b0:782:6a5:6dd5 with SMTP id
 sc35-20020a1709078a2300b0078206a56dd5mr7966642ejc.581.1664587152866; 
 Fri, 30 Sep 2022 18:19:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78eXx11AzAz/KYCu4ClVlwjL9PudeR4cdFQOhob9od/+BuIzr8TrZGeicdldxZ/IHZxleCMg==
X-Received: by 2002:a17:907:8a23:b0:782:6a5:6dd5 with SMTP id
 sc35-20020a1709078a2300b0078206a56dd5mr7966632ejc.581.1664587152705; 
 Fri, 30 Sep 2022 18:19:12 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a17090604d200b007822196378asm1934302eja.176.2022.09.30.18.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 18:19:12 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 1/7] drm/arm/hdlcd: use drmm_* to allocate
 driver structures
Date: Sat,  1 Oct 2022 03:18:59 +0200
Message-Id: <20221001011905.433408-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001011905.433408-1-dakr@redhat.com>
References: <20221001011905.433408-1-dakr@redhat.com>
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
 drivers/gpu/drm/arm/hdlcd_drv.c | 12 ++++--------
 drivers/gpu/drm/arm/hdlcd_drv.h |  1 +
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index a032003c340c..463381d11cff 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -247,13 +247,11 @@ static int hdlcd_drm_bind(struct device *dev)
 	struct hdlcd_drm_private *hdlcd;
 	int ret;
 
-	hdlcd = devm_kzalloc(dev, sizeof(*hdlcd), GFP_KERNEL);
-	if (!hdlcd)
-		return -ENOMEM;
+	hdlcd = devm_drm_dev_alloc(dev, &hdlcd_driver, typeof(*hdlcd), base);
+	if (IS_ERR(hdlcd))
+		return PTR_ERR(hdlcd);
 
-	drm = drm_dev_alloc(&hdlcd_driver, dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	drm = &hdlcd->base;
 
 	drm->dev_private = hdlcd;
 	dev_set_drvdata(dev, drm);
@@ -319,7 +317,6 @@ static int hdlcd_drm_bind(struct device *dev)
 err_free:
 	drm_mode_config_cleanup(drm);
 	dev_set_drvdata(dev, NULL);
-	drm_dev_put(drm);
 
 	return ret;
 }
@@ -344,7 +341,6 @@ static void hdlcd_drm_unbind(struct device *dev)
 	drm_mode_config_cleanup(drm);
 	drm->dev_private = NULL;
 	dev_set_drvdata(dev, NULL);
-	drm_dev_put(drm);
 }
 
 static const struct component_master_ops hdlcd_master_ops = {
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.h b/drivers/gpu/drm/arm/hdlcd_drv.h
index 909c39c28487..3892b36767ac 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.h
+++ b/drivers/gpu/drm/arm/hdlcd_drv.h
@@ -7,6 +7,7 @@
 #define __HDLCD_DRV_H__
 
 struct hdlcd_drm_private {
+	struct drm_device		base;
 	void __iomem			*mmio;
 	struct clk			*clk;
 	struct drm_crtc			crtc;
-- 
2.37.3

