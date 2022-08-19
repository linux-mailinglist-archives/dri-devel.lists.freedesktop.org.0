Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D6159A910
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 01:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C3310EDE2;
	Fri, 19 Aug 2022 23:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227B710E213
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 23:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660950666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FE6F/FaZU56VVek/ild/rdOe20eLgXYTWVytxZbV5OU=;
 b=MtmSaLbIKauTsp3vMqjOSjI37p5UyDFZTiWRLooemKepfKHAqQvmiKFOkdvo4AvQq0A2HW
 W72lOJjKDwYGp84rc7gYbgpN+SBKFNbwgCQNqXJn1VBtQzRCgdRA05H9gDCm6CJaYnQ4GR
 vptcMJZcV5wqrXIZ0X4pR/jXM8YwyOE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-JH62tAFfN4q8v2em-bTyEw-1; Fri, 19 Aug 2022 19:11:04 -0400
X-MC-Unique: JH62tAFfN4q8v2em-bTyEw-1
Received: by mail-ej1-f70.google.com with SMTP id
 gn23-20020a1709070d1700b0073094d0e02cso1995893ejc.20
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FE6F/FaZU56VVek/ild/rdOe20eLgXYTWVytxZbV5OU=;
 b=e8GrEvclHjfRDMmitH00Mc4P6FBBUbkXGXHUdBs6LmCyOJEusPjMzymi+s6+ESeypH
 Hu2w1DOV/hdW+/wcXobCw9vwhy8OfNK5698aXjus1r0ESBotlFe0XT3QuRCpRGo+Zi6J
 qdjN2fWfvfWlbk/ckTqF+KO8vUjH88MMIOgMv1NXevO6z5r0YE24osLR2eW7KKcuRB6h
 Jxm9BxgTqur+FmuijXg8KeX50hh6pNn0sTuhIExHVbkmXAdYFnGV9zyD2MZS6PXCLXLL
 02+cqHWxjWQa4JuOjxWhBwDmHdMV/DSLvRXWz0/mgo45UEe/fnQIYAE6rw0oYSoVtOBF
 nvPw==
X-Gm-Message-State: ACgBeo11gcYme7z4SUXH8bauBbV+mP9wDngBkkHSi46WQTI5gwrwqC9b
 6+p0WounoD3MMP4OKM5VCH1E95X8qVh5ixXZNOn5kMXOy11kx1tpCBpfYawAZtygIIGHqTOr37Q
 Nzi9RL/wBARzlruL5zEc2APzvOvbI
X-Received: by 2002:a05:6402:26c9:b0:446:354a:ede4 with SMTP id
 x9-20020a05640226c900b00446354aede4mr4448974edd.424.1660950663421; 
 Fri, 19 Aug 2022 16:11:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6BLVr1Yg+PkMQqjnyOamsS7c3J30OI7E+eQHw0nlsYqnq4YTHzerFj8CavCvwWsievdP/amQ==
X-Received: by 2002:a05:6402:26c9:b0:446:354a:ede4 with SMTP id
 x9-20020a05640226c900b00446354aede4mr4448960edd.424.1660950663264; 
 Fri, 19 Aug 2022 16:11:03 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ss28-20020a170907c01c00b00730a18a8b68sm2887088ejc.130.2022.08.19.16.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 16:11:02 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 1/7] drm/arm/hdlcd: use drmm_* to allocate
 driver structures
Date: Sat, 20 Aug 2022 01:10:52 +0200
Message-Id: <20220819231058.647658-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819231058.647658-1-dakr@redhat.com>
References: <20220819231058.647658-1-dakr@redhat.com>
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

