Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A337F4F6D21
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4A510E012;
	Wed,  6 Apr 2022 21:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5EF10E012
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 21:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649281268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FhXBUnLq/AeYpcQ43hIiOOWtFlBWzfoVNvi0Bsh0Mg=;
 b=L50LCGCn2re4befpwuE6VAc6ODcs3VVYy+Z7YS9JJnXYrVbzwjXBUPuwzOJodORzE+S40l
 3k+wCvYsh7AOa2E3KUWymO2UMeBEXYZd9AT8GibnPSA69vmAuD9imO1/0rntiV2CPNr1BG
 lnjnOiql0zZBPzcn+5udsYNeDd8517s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-Io-Xt4SSNF6tboKe5_BeDA-1; Wed, 06 Apr 2022 17:40:59 -0400
X-MC-Unique: Io-Xt4SSNF6tboKe5_BeDA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c15-20020a7bc84f000000b0038e8df5c9ddso37004wml.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 14:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FhXBUnLq/AeYpcQ43hIiOOWtFlBWzfoVNvi0Bsh0Mg=;
 b=f4i5jQnNwWt6ZBTzziF35LcPzUz66r+PY4DrsFMmOovO5A+3WhZxip6yBH7RMPLdOT
 cFxdlwqMSSSJ9jrAQYvMN+AZQbgGp648i70YY6FWHvBjvHyLRdtmOHGcl6mpuGZ/khGH
 SclnawpilMcGqzKdDo8vKeRg74wLmKEMULJ8+Hn4aGfxfF6iDHu+4w9nSabn+/whEmfZ
 ARbH7aOVDqn/46Z70CXBv+X9kBB6Tl/EuD/oGghaQeUIayGtDOG/rlat2fBqNyei1teG
 dVYw9yF7YbmestZMW8YUDxJeQ5Hj0OnOVj30IvwxibWinRbD77H/XGRRSZHDTfa0VyYk
 1Y9g==
X-Gm-Message-State: AOAM532M/nJDa3wCKnGed3PVglxdSvezodlDl7ER5DqcdDmp/zhwFQZl
 SyDZc1Ns6KGu5bHLClSUZaEsjgHFWXlQAomD2JtGa7sA8/4nPh9Tw+8rcdkuxDCH6fcQcIZHS+x
 6dFkIcUR+cFSpo7rZ6eTkY6s6qu3n
X-Received: by 2002:a7b:cf2f:0:b0:38e:6f21:bba9 with SMTP id
 m15-20020a7bcf2f000000b0038e6f21bba9mr9082585wmg.94.1649281257932; 
 Wed, 06 Apr 2022 14:40:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu0lYRk3QkxgnvH66v8eUTrMYR+LVlqeV9xMaH6jcY66CpHDS6DKp0bRanjMtEYrzwKOSL2A==
X-Received: by 2002:a7b:cf2f:0:b0:38e:6f21:bba9 with SMTP id
 m15-20020a7bcf2f000000b0038e6f21bba9mr9082565wmg.94.1649281257668; 
 Wed, 06 Apr 2022 14:40:57 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a05600c511d00b0038e3532b23csm5876020wms.15.2022.04.06.14.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:40:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH 5/5] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
Date: Wed,  6 Apr 2022 23:39:19 +0200
Message-Id: <20220406213919.600294-6-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406213919.600294-1-javierm@redhat.com>
References: <20220406213919.600294-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ilya Trukhanov <lahvuun@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
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
Cc: Peter Jones <pjones@redhat.com>
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

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
2.35.1

