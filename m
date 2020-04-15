Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767171A94B4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518B26E8AF;
	Wed, 15 Apr 2020 07:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4CC6E889
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f13so17850793wrm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DeMO3vlmgxOJF9CNwpQjB+v8eWcJq3jGpnPcZIzXutE=;
 b=gjrx1chkYeUEcIaHdeH8s4z11nOP1syPUIkoVGO0e4XoRfV3w4XW38Wc0HV+5s1drJ
 NRp9L2mF3rpduiiJungyv24OrrR/qyciaFeQUOsin1Cs4UEJMkHObLggJ7LzO21Pc2WZ
 d50BPmBnVuGwYEzTcNoJfJDHS2jj6JwPVQjoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DeMO3vlmgxOJF9CNwpQjB+v8eWcJq3jGpnPcZIzXutE=;
 b=BRypwA0QspTQDD5mbz/Z9o/dyIuAWqEPWF8EGTrSKCaP1pziSO+1CYQaJGF5FBRZX9
 nYb+NpHa9nANZ4Rm28Zv25+bjOZAGFVikDzOufRqp3A3rojueO4XiEf7319LtupSUlpP
 HIf6ZyhkCbm1WKUYqfbhVy0/tCOV5egDB2S7oE4JKfwitm2XgFiKZXHy2i/vfc3ydgQp
 fPTGiKHXoTRmj6QH1e7hUKkmbzLO3izpIuYzk4XKBZo5UFo6evXEf1QewiUF8ZX3SeP1
 Z5BUp2/eIa3+dGPxtspGHDT49egkegj8xfZpnFgnswHZ4RpzxSVI9O1jI1sAqHFl/Vy+
 YEyg==
X-Gm-Message-State: AGi0PuYfYajXswBCHJSnGMajYozDLQ5f1gC7uYRR1cl5BzlmP20ES55Y
 oZ8t6Pnyo31UgpDO5411UhfOoQ==
X-Google-Smtp-Source: APiQypKtihbjQqJm3Jnxso5irDArazHMZESwCu/Ssw6YteIUYK1yEIOc9VL4luAk7ORb88Bbrci98Q==
X-Received: by 2002:adf:fe03:: with SMTP id n3mr26844871wrr.315.1586936462938; 
 Wed, 15 Apr 2020 00:41:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 21/59] drm/gm12u320: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:39:56 +0200
Message-Id: <20200415074034.175360-22-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already using devm_drm_dev_init, so very simple replacment.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
