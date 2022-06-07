Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D855540ACF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693FA10F2D6;
	Tue,  7 Jun 2022 18:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D60310F26F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654626234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s12dM/fUNAK8FcN2HDfoJsYb2JSXAKJ07j+xEpEzvhM=;
 b=C1xLf2sQLdXF47RPmRECLKJxVtt38LPMiHini/swv3SnlMD1qLbTFlleV9/Ok6EbyG2hUc
 sJJ4l6WISqQqn1rkMXYJ/PEGgbw13pYH7wFahqKdUc4wDrLUVY5M9LfIgLhMOLZtsUYwQg
 02JQl0xWKCwE1+SWh23DaXMFz0aZrhM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-hcZoDRhcMmK_vX9Nzj-1bQ-1; Tue, 07 Jun 2022 14:23:53 -0400
X-MC-Unique: hcZoDRhcMmK_vX9Nzj-1bQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d9-20020adfe849000000b00213375a746aso3705836wrn.18
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s12dM/fUNAK8FcN2HDfoJsYb2JSXAKJ07j+xEpEzvhM=;
 b=aoFxI7XBzNrkPpFr96x94GJEfiSRigc5Im93Saf3QIuriN5FEz6KlX+76fCHF81o/M
 hQr05qChZDvgzCuOZBIaPylCUUCJberf2eC3Zfze2fvA54WZL7+eE0ckjR/9XEgOGlRc
 ACjbfwLFbufrbk6SKOZAWbBZrZAf6QpEW1mYgQ7u051odsJZ8tqGUEWIpju2QyXNbLRy
 WzM5kYagCm2UjsDS256ePIVSwPdAYQY5gkL8UKIdP9BWkdMwabbOaBykjsCd0fOp+iqu
 nNzWKwtEMgW2k5chalU3++ghigOUNh+ydrJv/hEsjY2kHggo1qVo5ean/e28yZu9kPeq
 RYiw==
X-Gm-Message-State: AOAM531pTRCAuYvn7i4jaZNXjrpQvJOKZPTZPDMHryB8pFy5MV5lKfDK
 xx4KjkBgDOhBM5fVD4PjTBtk68tBhIOHxMQ0RGxMB3ApRBkY7aAD0p4nsybNk/pIw1UCmJUn9l9
 U1kC46Npr1hxKKIyOFAYp9WyO+rlv
X-Received: by 2002:a05:600c:3d1b:b0:39b:1743:4d84 with SMTP id
 bh27-20020a05600c3d1b00b0039b17434d84mr29741816wmb.118.1654626230272; 
 Tue, 07 Jun 2022 11:23:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHm5Esw2Ac7SpEx33f/vi2LUTuERvwYyQv2tSJ4Nx4mYKDItiXTPZoaSeRZfdNCayFMtQlEg==
X-Received: by 2002:a05:600c:3d1b:b0:39b:1743:4d84 with SMTP id
 bh27-20020a05600c3d1b00b0039b17434d84mr29741791wmb.118.1654626230045; 
 Tue, 07 Jun 2022 11:23:50 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003942a244f51sm28267502wmq.42.2022.06.07.11.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:23:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/5] Revert "fbdev: Prevent probing generic drivers if a FB
 is already registered"
Date: Tue,  7 Jun 2022 20:23:37 +0200
Message-Id: <20220607182338.344270-5-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607182338.344270-1-javierm@redhat.com>
References: <20220607182338.344270-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Ilya Trukhanov <lahvuun@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Jones <pjones@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

This reverts commit fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee.

With

commit 27599aacbaefcbf2af7b06b0029459bbf682000d
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Jan 25 10:12:18 2022 +0100

    fbdev: Hot-unplug firmware fb devices on forced removal

this should be fixed properly and we can remove this somewhat hackish
check here (e.g. this won't catch drm drivers if fbdev emulation isn't
enabled).

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilya Trukhanov <lahvuun@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Cc: Peter Jones <pjones@redhat.com>
Cc: linux-fbdev@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/video/fbdev/efifb.c    | 11 -----------
 drivers/video/fbdev/simplefb.c | 11 -----------
 2 files changed, 22 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index ea42ba6445b2..edca3703b964 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -351,17 +351,6 @@ static int efifb_probe(struct platform_device *dev)
 	char *option = NULL;
 	efi_memory_desc_t md;
 
-	/*
-	 * Generic drivers must not be registered if a framebuffer exists.
-	 * If a native driver was probed, the display hardware was already
-	 * taken and attempting to use the system framebuffer is dangerous.
-	 */
-	if (num_registered_fb > 0) {
-		dev_err(&dev->dev,
-			"efifb: a framebuffer is already registered\n");
-		return -EINVAL;
-	}
-
 	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 94fc9c6d0411..0ef41173325a 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -413,17 +413,6 @@ static int simplefb_probe(struct platform_device *pdev)
 	struct simplefb_par *par;
 	struct resource *res, *mem;
 
-	/*
-	 * Generic drivers must not be registered if a framebuffer exists.
-	 * If a native driver was probed, the display hardware was already
-	 * taken and attempting to use the system framebuffer is dangerous.
-	 */
-	if (num_registered_fb > 0) {
-		dev_err(&pdev->dev,
-			"simplefb: a framebuffer is already registered\n");
-		return -EINVAL;
-	}
-
 	if (fb_get_options("simplefb", NULL))
 		return -ENODEV;
 
-- 
2.36.1

