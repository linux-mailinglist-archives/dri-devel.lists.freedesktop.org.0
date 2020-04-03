Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC019D850
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E966EBD0;
	Fri,  3 Apr 2020 13:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C566EBD5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j17so8572041wru.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FPN50dZaM17ZJWb1kfenSEp3QCWr5XpoArRP6/Y1sQY=;
 b=jFJ0vF8lIWyEQNWiZm3HWP0eofsW+UAjWuR2Ty3jTmZG2e8wUmhXj2xSAHYTFuHpaS
 dhK8bfxGSX3e6ZqMk3SZKfJ4ltjk5lWDMAy2jbTCGowjYG5tg7V2UYtZHeMaJzo8Ax8+
 ZrV9AQd/gyRcPNFNwNowdtfy8i4vsjmSyYKnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FPN50dZaM17ZJWb1kfenSEp3QCWr5XpoArRP6/Y1sQY=;
 b=asjWDcAQd2txRE0JQjdujVcXM+Mtp/+4xGj+tw19pS5DEcp0k4fQdFvIyFbJSisBFl
 sae1Nj3JkFM1ABCkpEH5TI1OYQZGISu0sYoX+ebMc99sKIHSYDwmXMawJQXvxOZN4g5m
 5nBBd6+hEsxiyAjbYAURyrXUTwEK1YmjdW7Kft4m4CRroUQ9b+wMe9jdGkEn4AqIefNR
 puTUGuivbmCM7tw97el5zaLYvdQdt2kiazXh7UUUuz2aTw/g6A2V0E2dWx3t0Ho5n+1R
 JGuNSkKswEndVaOAanweK/1lkJOSKD/2qwqL3SKcrYshmO4qFtpnkQeoGi20GzJ0IUYU
 pUmg==
X-Gm-Message-State: AGi0PuZZabuWxNok4dLPWF+QQEn1ULza5L1JRzT9CC33HBBLaYo0D7Dq
 sOqdWyrFLNC5XwTW34NMOm7golR/J1tuBg==
X-Google-Smtp-Source: APiQypLvsqUpN/mdzUdoXdQ1bkXae6tyvE2zXi+0VTvkDm07g8Uc2f011KFTHFwAWpZy/TDUpwjjRg==
X-Received: by 2002:adf:e747:: with SMTP id c7mr1942114wrn.29.1585922343354;
 Fri, 03 Apr 2020 06:59:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 25/44] drm/gm12u320: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:09 +0200
Message-Id: <20200403135828.2542770-26-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already using devm_drm_dev_init, so very simple replacment.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 6f0ea2827d62..907739a67bf6 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -631,22 +631,17 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 	if (interface->cur_altsetting->desc.bInterfaceNumber != 0)
 		return -ENODEV;
 
-	gm12u320 = kzalloc(sizeof(*gm12u320), GFP_KERNEL);
-	if (gm12u320 == NULL)
-		return -ENOMEM;
+	gm12u320 = devm_drm_dev_alloc(&interface->dev, &gm12u320_drm_driver,
+				      struct gm12u320_device, dev);
+	if (IS_ERR(gm12u320))
+		return PTR_ERR(gm12u320);
 
 	gm12u320->udev = interface_to_usbdev(interface);
 	INIT_DELAYED_WORK(&gm12u320->fb_update.work, gm12u320_fb_update_work);
 	mutex_init(&gm12u320->fb_update.lock);
 
 	dev = &gm12u320->dev;
-	ret = devm_drm_dev_init(&interface->dev, dev, &gm12u320_drm_driver);
-	if (ret) {
-		kfree(gm12u320);
-		return ret;
-	}
 	dev->dev_private = gm12u320;
-	drmm_add_final_kfree(dev, gm12u320);
 
 	ret = drmm_mode_config_init(dev);
 	if (ret)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
