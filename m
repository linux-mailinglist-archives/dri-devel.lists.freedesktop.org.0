Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41660E4DB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C62310E556;
	Wed, 26 Oct 2022 15:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A898410E563
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666798486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLaZVg/Gn3THIn1ghLrf5MedEqRFiq/AUqXfvtIcrvk=;
 b=WDZ/VQ7mAV3BLJUWozQ7m4KqM26e9cGITH2Jr43zY4kS2jfa6lvOWbmudI2TEAwy3BAARB
 SbkkejtYtl3wPjWxTwvGnFQ/HTFRHXkEGTVKHDY/Z6cdcCThtsW5c3cVLiWBVCcdpXzeMJ
 WN9Vc3BsaCNfbMwZIlxTiNQxlB/XxJ0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-W7eue0f-OFqS54BYogoSzA-1; Wed, 26 Oct 2022 11:34:43 -0400
X-MC-Unique: W7eue0f-OFqS54BYogoSzA-1
Received: by mail-ed1-f72.google.com with SMTP id
 c9-20020a05640227c900b0045d4a88c750so14176202ede.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 08:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLaZVg/Gn3THIn1ghLrf5MedEqRFiq/AUqXfvtIcrvk=;
 b=rKImN9Gbmj8a9TIJj7ykZqD+SirUQYEjQjNZLIErvRrS3sGq4bTHh6aJHr/sZV3Mq1
 Nve2aca+F0qbV2dep0Vsb7zGW0sV3qXn7oDWGQubodc7cRw8ri/Zzv50BdJTf1gyHXYF
 UJM/YYJezZVALr92Ib76uvY8ZTWj2HOgSFKWLBC1wzGnHC2VVF6T7B5li1H7h6G8hURm
 Oc6M5nGD/apUdkGSdBslmwg9MOjAEkyLDL20G8bNr7MGJBUaQoixih15/TPcPyrOkltE
 C2PtKc0tVMewQ+jyt4AIKPW83TDs9iC5eUQtgZz5Lp7H59KvHNV4Y2rOYgPNGSHB/UAD
 3WeQ==
X-Gm-Message-State: ACrzQf2KMZCM49Geb/N2DjNxkFa/fn7Ko3fEQ8+Oyf66QaAYN7gPZBk2
 RXjHl+08prEabGKu4uXOrNqepgVHwLU1/OoxUcLv0IPQc6GLjJH+gwj59SRhNhsWN7hPIorYYq3
 DIZ0zumjCBpy8lFZZZ74cjKK6rzQp
X-Received: by 2002:a05:6402:27c6:b0:461:e426:dc8b with SMTP id
 c6-20020a05640227c600b00461e426dc8bmr12855803ede.403.1666798482015; 
 Wed, 26 Oct 2022 08:34:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7dYi2tzVQq42OFzB50D9ddEtWodBh0BQMxyElzqyZXWM3GFmgLvhs6sr8aj83t2ilqgGbccA==
X-Received: by 2002:a05:6402:27c6:b0:461:e426:dc8b with SMTP id
 c6-20020a05640227c600b00461e426dc8bmr12855779ede.403.1666798481834; 
 Wed, 26 Oct 2022 08:34:41 -0700 (PDT)
Received: from pollux.. ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a170906271100b0078a543e9301sm3048896ejc.200.2022.10.26.08.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:34:41 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v4 1/4] drm/arm/hdlcd: use drmm_* to allocate
 driver structures
Date: Wed, 26 Oct 2022 17:34:28 +0200
Message-Id: <20221026153431.72033-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026153431.72033-1-dakr@redhat.com>
References: <20221026153431.72033-1-dakr@redhat.com>
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

