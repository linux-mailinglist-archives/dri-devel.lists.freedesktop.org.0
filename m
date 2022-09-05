Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0006E5AD655
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3136710EA44;
	Mon,  5 Sep 2022 15:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC77410EA44
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FE6F/FaZU56VVek/ild/rdOe20eLgXYTWVytxZbV5OU=;
 b=X7byDzOdog63ft814HY9k+rDPcNjPsU3HEVKDIWwEe0hJVYZ6xPnoVVzjePuEQYXK9Xggg
 HTEmTDy9wv+Ue0TFBPCK8KlrA4L0B+/0sWi4a/pYTQ0+fMGDcMFteLN/jELTwOPf75D7ek
 6vOajLLt0HpqK+qlX2H6RZEJZblB4ms=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-63-FKNG48CTMyuGRLHis-64Qw-1; Mon, 05 Sep 2022 11:27:27 -0400
X-MC-Unique: FKNG48CTMyuGRLHis-64Qw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640235d400b0043e1e74a495so6012105edc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FE6F/FaZU56VVek/ild/rdOe20eLgXYTWVytxZbV5OU=;
 b=qX2Hq460tHkhoxaGntrIz4rBYEhF1OoPE5313+HYqccaELuCrdefsYqPkjOdCQOeqc
 gn5Z69Dv7r3hveWiQD4m5ZW6tRILlA5Ne3MCv1pQxCWIJJz6xYllydqAFYOOq55ZTGLA
 BGo8HEjvatuDzp7936a5DzQ1Ff3qCs7Cc6q8g8lFtSOVa50cb2zWVSnIMFpbyKXdSGiW
 sZ/eoeJ0W108Oa8/ls5IaT4r//BHCyMNL6jj7d3RgpFB1T8R3T+52BydYj3wRwskJxma
 ZEGpztFwFPBWXBfkylaKxrMYscEDr1v9jkMWB8/gyONQJkKF3vytA05Ha2J7Z039uxag
 eAvQ==
X-Gm-Message-State: ACgBeo3JHHB4r2IzeWqfvDx//cjNLfbGDNohUC2gyeZTEG/aUI0/di5X
 89hnsjncc1mJlfL5eCRlN5dv+9iBrUb9dN+qcv/I0/NzFfUEb0R56AWMdrdGeASvgyoPNXsYU/6
 /hiNMrsaqxvm4mvZnIqC70JLqW9Dv
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id
 y12-20020a056402440c00b0043a1124e56amr44852793eda.134.1662391646401; 
 Mon, 05 Sep 2022 08:27:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4BS5DNOpTRPfqGzZykMKxlBAlMPKYg+ROhMX68+pN9BWH3v/YckKemYfM6AbpZZ05FOv8u2A==
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id
 y12-20020a056402440c00b0043a1124e56amr44852783eda.134.1662391646266; 
 Mon, 05 Sep 2022 08:27:26 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 bv6-20020a170906b1c600b00730979f568fsm5145387ejb.150.2022.09.05.08.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:27:25 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 1/7] drm/arm/hdlcd: use drmm_* to
 allocate driver structures
Date: Mon,  5 Sep 2022 17:27:13 +0200
Message-Id: <20220905152719.128539-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905152719.128539-1-dakr@redhat.com>
References: <20220905152719.128539-1-dakr@redhat.com>
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
2.37.2

