Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6470C47CE44
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D1610F8B5;
	Wed, 22 Dec 2021 08:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B38410F4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hbQRb30yFnbPRrQK/qwkVgeb4aTpo5Ai4KaBIhKcKkg=;
 b=cTwLcOZ39ppyJ+Mq8eEjdItOn6hcZFhHbxXnkr7U61z5RZkTpxWZYlZZHlBDMUfsIqvFzD
 DNXUddFf0iE0b62i9aOOzLfIm6xgoQ3JMoBC/JoJ3PAwuQc905OCYde8NXuxV3Zjcs/KY6
 yLLJK4w6hYQkiCf7P6TNUGq8GX24JhY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-NGM1SmKRMh2z4KpbK7il3g-1; Wed, 22 Dec 2021 03:28:44 -0500
X-MC-Unique: NGM1SmKRMh2z4KpbK7il3g-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg20-20020a05600c3c9400b0033a9300b44bso433295wmb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hbQRb30yFnbPRrQK/qwkVgeb4aTpo5Ai4KaBIhKcKkg=;
 b=2p+0P6jCmdzn+95OiB2eE7jEMFJU13MoThf/VK4Pvq5Y1SJNKwBwMEbAKWIUq8Hxn2
 velVvezq4iS15vjneHh0gfMp0P5TpGl7pKH4nNaqbLOUCUh71pyjT2FAUuQS7xlYh8jL
 jRIxOgtuwpOiCXzXY9dfrS1W7eu68i9Vnq4csj6XlM25tCZesGcpVT4ZjErFYiQo3ooy
 pb4gRWzRFMrNZiSc6HgxVa8B8KKqGN8wSaBLUONxFKphGay09MBM0qqRjMxjRgI3nwmJ
 fZehwyFqEpufzURgmlE3dh49CdmjSeEaPKlD7CoxV/qUpnLnLzmlabLiCs9MQrmeDi9Y
 /IZA==
X-Gm-Message-State: AOAM530+UBVD6S2JEXcX/nuqYR8HO8ag6CjLd2QyfPHISKmml5H4/A0X
 XYq2gkLrKpSant0/eykea9W5KtCzFVodBHJrhRB9AbDI8+wkWo+vwkwTDIDMtjbqWj2PyoEy1+H
 J98jnSOpTeRdOfIBc9OgLZ76yaBVp
X-Received: by 2002:a05:600c:3b2a:: with SMTP id
 m42mr118170wms.4.1640161722986; 
 Wed, 22 Dec 2021 00:28:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNbvNKWRYRRx42OwX6hAbth/vJE/sgOJvPPhgItN3MC3bPcTGbWNoNV+D2bK5szud1caQ+Kg==
X-Received: by 2002:a05:600c:3b2a:: with SMTP id
 m42mr118157wms.4.1640161722786; 
 Wed, 22 Dec 2021 00:28:42 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:42 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/10] drm/ast: Replace module-init boiler-plate code with
 DRM helpers
Date: Wed, 22 Dec 2021 09:28:23 +0100
Message-Id: <20211222082831.196562-3-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
References: <20211222082831.196562-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

Remove custom ast_init() and ast_exit() functions and initialize the
module with DRM module helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/ast/ast_drv.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 6d8613f6fe1c..7465c4f0156a 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -34,6 +34,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 
 #include "ast_drv.h"
@@ -230,22 +231,7 @@ static struct pci_driver ast_pci_driver = {
 	.driver.pm = &ast_pm_ops,
 };
 
-static int __init ast_init(void)
-{
-	if (drm_firmware_drivers_only() && ast_modeset == -1)
-		return -EINVAL;
-
-	if (ast_modeset == 0)
-		return -EINVAL;
-	return pci_register_driver(&ast_pci_driver);
-}
-static void __exit ast_exit(void)
-{
-	pci_unregister_driver(&ast_pci_driver);
-}
-
-module_init(ast_init);
-module_exit(ast_exit);
+drm_module_pci_driver_if_modeset(ast_pci_driver, ast_modeset);
 
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
-- 
2.33.1

