Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FABD4F9A3F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAC610E491;
	Fri,  8 Apr 2022 16:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E213610E4F6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649434429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7QI3SswaraTV8idrWcTwBVC+GiIL0ijW6quL8YZNa3g=;
 b=JweQ1AP6U5md56TElsqsL92R5zFPk1lkRpVnRNhtW5yklEvTZmaTlzY30i5UV0OKJUTZxE
 IFXSwlSeh0ymmaVFq6KWTAHvQ9KFbbWFzSUvLa0dP8wJlbaHTqyNDYie1GJ4xoQCGBj+iK
 BlLcjdFnnyZcw3fWGjN1RLi0Iv4dknU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-j3YYdPUqNO2erBFIQq2qVQ-1; Fri, 08 Apr 2022 12:13:47 -0400
X-MC-Unique: j3YYdPUqNO2erBFIQq2qVQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so4569116wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7QI3SswaraTV8idrWcTwBVC+GiIL0ijW6quL8YZNa3g=;
 b=vck2dBLj36vhclkMujThrwMV71CoyEPuyRvysqpoOcfQTkQaCv76I3QIPEwTyWLMru
 cyzeQHBNIWBR5qTD20LbP9uOOvxZihHy6yCWhCkwiQQUsNy4A+nQH8B3/eWdbODG5nRE
 VqFtfm8V4dPmV8RRD4g002w6AsFXU607zsu2N/g0NVtqIeBRvnTNCObi5pE4CfGUT9P8
 smYmjqPU4cJlCpgwikFVRIPhn8NExBndgC8oqXHVax5Tc/90sLD1r5D+q9iOERhpJ/Lt
 rdem7vAxMp5k75IKc1GswzllqRdiEALov7y5PgPK+v78evUOA3R/9TVdPPSjlr5mSOmb
 inLA==
X-Gm-Message-State: AOAM5317X3fUuWVgfRQjliBca4ISUGtuRGlsYLKk66G6jQfh1uZ3gpBM
 ECKC0xmouSNBh0j/jbWKHTRmui51a12LzfcWkQRo2QzExijiRvWmlj4A9W1Pd/C4Ej2LLd8R/8M
 jroeQcUcMlCkImpenXV3ckWR6CpYL
X-Received: by 2002:adf:fa4c:0:b0:205:7cb2:e6f0 with SMTP id
 y12-20020adffa4c000000b002057cb2e6f0mr15284849wrr.218.1649434425685; 
 Fri, 08 Apr 2022 09:13:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYRy6iFg+nUxs9pKZmeBKF3byaeUvogbu8dmOibs9HJxOPyzETU8IRSiW1efmqzGmnYftbww==
X-Received: by 2002:adf:fa4c:0:b0:205:7cb2:e6f0 with SMTP id
 y12-20020adffa4c000000b002057cb2e6f0mr15284837wrr.218.1649434425421; 
 Fri, 08 Apr 2022 09:13:45 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm14377455wrn.114.2022.04.08.09.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:13:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] fbdev: Fix some race conditions between fbmem and sysfb
Date: Fri,  8 Apr 2022 18:13:21 +0200
Message-Id: <20220408161322.270176-5-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408161322.270176-1-javierm@redhat.com>
References: <20220408161322.270176-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform devices registered in sysfb match with a firmware-based fbdev
or DRM driver, that are used to have early graphics using framebuffers set
up by the system firmware.

Real DRM drivers later are probed and remove all conflicting framebuffers,
leading to these platform devices for generic drivers to be unregistered.

But the current solution has two issues that this patch fixes:

1) It is a layering violation for the fbdev core to unregister a device
   that was registered by sysfb.

   Instead, the sysfb_try_unregister() helper function can be called for
   sysfb to attempt unregistering the device if is the one registered.

2) The sysfb_init() function could be called after a DRM driver is probed
   and requested to unregister devices for drivers with a conflicting fb.

   To prevent this, disable any future sysfb platform device registration
   by calling sysfb_disable(), if a driver requested to remove conflicting
   framebuffers with remove_conflicting_framebuffers().

There are video drivers (e.g: vga16fb) that register their own device and
don't use the sysfb infrastructure for that, so an unregistration has to
be forced by fbmem if sysfb_try_unregister() fails to do the unregister.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

Changes in v2:
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).

 drivers/video/fbdev/core/fbmem.c | 42 +++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index bcdbbe543466..6cb73193410e 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/major.h>
 #include <linux/slab.h>
+#include <linux/sysfb.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/vt.h>
@@ -1582,22 +1583,30 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 			 * this lock.
 			 */
 			mutex_unlock(&registration_lock);
-			if (dev_is_platform(device)) {
-				platform_device_unregister(to_platform_device(device));
-			} else {
-				/*
-				 * If it's not a platform device, at least print a warning. A
-				 * fix would add to code to remove the device from the system.
-				 */
-				pr_warn("fb%d: cannot remove device\n", i);
-				/* call unregister_framebuffer() so it can take the lock */
-				unregister_framebuffer(registered_fb[i]);
+			if (!sysfb_try_unregister(device)) {
+				if (dev_is_platform(device)) {
+					/*
+					 * FIXME: sysfb didn't register this device, is a platform
+					 * device registered by a video driver (e.g: vga16fb), so
+					 * force its unregistration here. A proper fix would be to
+					 * move all device registration to the sysfb infrastructure.
+					 */
+					platform_device_unregister(to_platform_device(device));
+				} else {
+					/*
+					 * If it's not a platform device, at least print a warning. A
+					 * fix would add to code to remove the device from the system.
+					 */
+					pr_warn("fb%d: cannot remove device\n", i);
+					/* call unregister_framebuffer() so it can take the lock */
+					unregister_framebuffer(registered_fb[i]);
+				}
 			}
-			mutex_lock(&registration_lock);
 			/*
 			 * Restart the removal loop now that the device has been
 			 * unregistered and its associated framebuffer gone.
 			 */
+			mutex_lock(&registration_lock);
 			goto restart_removal;
 		}
 	}
@@ -1758,6 +1767,17 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 		do_free = true;
 	}
 
+	/*
+	 * If a driver asked to unregister a platform device registered by
+	 * sysfb, then can be assumed that this is a driver for a display
+	 * that is set up by the system firmware and has a generic driver.
+	 *
+	 * Drivers for devices that don't have a generic driver will never
+	 * ask for this, so let's assume that a real driver for the display
+	 * was already probed and prevent sysfb to register devices later.
+	 */
+	sysfb_disable();
+
 	mutex_lock(&registration_lock);
 	do_remove_conflicting_framebuffers(a, name, primary);
 	mutex_unlock(&registration_lock);
-- 
2.35.1

