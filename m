Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C8A19D836
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AE16EBB5;
	Fri,  3 Apr 2020 13:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589AC6EB96
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:54 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a81so7789587wmf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rcj6BayWka2EitDRdS6u20GaaWgPfY4TfOGuURPK+fk=;
 b=XR4DTDiWVSUSqs0ZrqPlwuJ0qiB8Rz6sFtdzIpsaYWEeRBe4Jgcpv+k11obBKjvf2Z
 +AbXnPz55X4kQMkfdIN6FqI+e3mcuLQswmN3H29XaF1lappzEhFyg0wxxGnU1ONOhzot
 4Hjxn3J1Sl38BCQ2YGJrxZzxx0TUMhGnkGN+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rcj6BayWka2EitDRdS6u20GaaWgPfY4TfOGuURPK+fk=;
 b=A55mxCGMI1nAoiLfI0/xzDg4vuKdwlIF3k0HFX+sKRTx+phUuCJl8X7ecpxTxgFcdt
 XJ1qem40B2oYoUhV5t3igBRdT3cQcHL9URJcG6SpWdbsBVSyfV5QRDIHbUpk/fTglKT2
 RE/UbHQqVk5LdJlvrvmrbqZUlnRQc925/fLCPPR3rq0hi+xDoIhQH1wXc5z5n5lJxW6w
 9UMaLZU2e5rLqN91dPP0aUzqJTCIkj+dGZ071LxLSr52JfW9H9742XtzKKoC4hwuYuOi
 Pcy855/xlbIdK83hJRcTTZkldzJnA4gTHX+nGq07I+zI+SZ/FL3/MRkNvsZN7v/SJXqd
 ocjQ==
X-Gm-Message-State: AGi0PuawlR5caml/Ymh9VPRndqpEknbmkNdh3UQaJ3xeoPtjAJs7ZBMU
 pvWc4X+8IbCJMwA0VqDLXtdDJu0/bIGFTQ==
X-Google-Smtp-Source: APiQypL33ENV5ZD5B9CcahUMM7NoJ1Avbm+N08a+Le+t/KelBY+oXG0I6QOA19BLb+xYF2a3EkYbrg==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr3584892wmj.50.1585922332688; 
 Fri, 03 Apr 2020 06:58:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/44] drm/udl: Use demv_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:57:59 +0200
Message-Id: <20200403135828.2542770-16-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also init the fbdev emulation before we register the device, that way
we can rely on the auto-cleanup and simplify the probe error code even
more.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/gpu/drm/udl/udl_drv.c | 36 +++++++++++------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1ce2d865c36d..4ba5149fdd57 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -57,27 +57,20 @@ static struct udl_device *udl_driver_create(struct usb_interface *interface)
 	struct udl_device *udl;
 	int r;
 
-	udl = kzalloc(sizeof(*udl), GFP_KERNEL);
-	if (!udl)
-		return ERR_PTR(-ENOMEM);
-
-	r = drm_dev_init(&udl->drm, &driver, &interface->dev);
-	if (r) {
-		kfree(udl);
-		return ERR_PTR(r);
-	}
+	udl = devm_drm_dev_alloc(&interface->dev, &driver,
+				 struct udl_device, drm);
+	if (IS_ERR(udl))
+		return udl;
 
 	udl->udev = udev;
 	udl->drm.dev_private = udl;
-	drmm_add_final_kfree(&udl->drm, udl);
 
 	r = udl_init(udl);
-	if (r) {
-		drm_dev_put(&udl->drm);
+	if (r)
 		return ERR_PTR(r);
-	}
 
 	usb_set_intfdata(interface, udl);
+
 	return udl;
 }
 
@@ -91,23 +84,17 @@ static int udl_usb_probe(struct usb_interface *interface,
 	if (IS_ERR(udl))
 		return PTR_ERR(udl);
 
+	r = drm_fbdev_generic_setup(&udl->drm, 0);
+	if (r)
+		return r;
+
 	r = drm_dev_register(&udl->drm, 0);
 	if (r)
-		goto err_free;
+		return r;
 
 	DRM_INFO("Initialized udl on minor %d\n", udl->drm.primary->index);
 
-	r = drm_fbdev_generic_setup(&udl->drm, 0);
-	if (r)
-		goto err_drm_dev_unregister;
-
 	return 0;
-
-err_drm_dev_unregister:
-	drm_dev_unregister(&udl->drm);
-err_free:
-	drm_dev_put(&udl->drm);
-	return r;
 }
 
 static void udl_usb_disconnect(struct usb_interface *interface)
@@ -117,7 +104,6 @@ static void udl_usb_disconnect(struct usb_interface *interface)
 	drm_kms_helper_poll_fini(dev);
 	udl_drop_usb(dev);
 	drm_dev_unplug(dev);
-	drm_dev_put(dev);
 }
 
 /*
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
