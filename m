Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C24F6D1F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF3910E0A0;
	Wed,  6 Apr 2022 21:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E1E10E0FC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 21:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649281255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KV4A7vxPY5Ri/A7ExTRv30H1oUVvMjyO4SRhZ4A4Rkc=;
 b=PRCtSlSSKY/bkKd65+7MTTKoKfntbk/X63eUE/ILmcQmS1jhJy4xINO01n9qydaMNFt+eu
 iEkYMmtd800YOJK6LPSluSbXmwEhnGMARCV6U9t7F3qAa5Bem/SWt2U5XTp7BfJciFMnBu
 +664IqN45r/feXS2JhrbLpdPbB4SFDE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-ny1YbA_-M-Kvsk1gHjmsaA-1; Wed, 06 Apr 2022 17:40:54 -0400
X-MC-Unique: ny1YbA_-M-Kvsk1gHjmsaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 189-20020a1c02c6000000b0038e6c4c6472so3546050wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 14:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KV4A7vxPY5Ri/A7ExTRv30H1oUVvMjyO4SRhZ4A4Rkc=;
 b=yPes0YTCL+1DJMx3m4qRpuX4CORjVePMcQ6jeJXpmntqqzSunvfwmwUUWZwVNvnfbe
 D0SXbLVLsddbBShwgpKg19Oe+coYpUsWlD9RMmHAZqvRehnsz5Wt/DUqyjOeJENbZZD9
 PjGqkYtOcy/Dx5gphgpIsJx4nKC9K2YDp0RuJmePuWtOpFMWaXeXnVB9tWy7hlduB7oZ
 tn5BofEUudC9TWxnhdqWeSke1vq3JOq21+C/AL6YP5awCvpZNfziUJPjU1bhF06mS8a5
 nQaXV/VY4rHVkQgeHN/vpR0kmhdOKp7Owr4x92FAZGIuGxqIgAdbX9glbXcq5j+GoMU/
 2cyg==
X-Gm-Message-State: AOAM533Zf254HxminaCfkJUysRBJH7iCr3rQeFiomBvA1DYuGGgxl3rh
 PjvBQ4K7ia6SOAtYOnnQbm7MO5DYd6ms1gTx/Kdx+TmthvDpjwO/6I3Qf79CIHpkMg85ttSBpTy
 tRqOjVRDgh4ajG6FqhPT2xWtYKJEd
X-Received: by 2002:adf:d1e8:0:b0:206:fdb:849 with SMTP id
 g8-20020adfd1e8000000b002060fdb0849mr8274612wrd.251.1649281253649; 
 Wed, 06 Apr 2022 14:40:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/mJZqMWnMsmiDK/QHEbj6zIloBdqX55fsoP+DxKAu2//ICDmt3KL7sczE6heg786RoMwiDQ==
X-Received: by 2002:adf:d1e8:0:b0:206:fdb:849 with SMTP id
 g8-20020adfd1e8000000b002060fdb0849mr8274601wrd.251.1649281253422; 
 Wed, 06 Apr 2022 14:40:53 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a05600c511d00b0038e3532b23csm5876020wms.15.2022.04.06.14.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:40:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH 3/5] fbdev: Restart conflicting fb removal loop
 when unregistering devices
Date: Wed,  6 Apr 2022 23:39:17 +0200
Message-Id: <20220406213919.600294-4-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406213919.600294-1-javierm@redhat.com>
References: <20220406213919.600294-1-javierm@redhat.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers that want to remove registered conflicting framebuffers prior to
register their own framebuffer, calls remove_conflicting_framebuffers().

This function takes the registration_lock mutex, to prevent a races when
drivers register framebuffer devices. But if a conflicting framebuffer
device is found, the underlaying platform device is unregistered and this
will lead to the platform driver .remove callback to be called, which in
turn will call to the unregister_framebuffer() that takes the same lock.

To prevent this, a struct fb_info.forced_out field was used as indication
to unregister_framebuffer() whether the mutex has to be grabbed or not.

A cleaner solution is to drop the lock before platform_device_unregister()
so unregister_framebuffer() can take it when called from the fbdev driver,
and just grab the lock again after the device has been registered and do
a removal loop restart.

Since the framebuffer devices will already be removed, the loop would just
finish when no more conflicting framebuffers are found.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/core/fbmem.c | 21 ++++++++++++++-------
 include/linux/fb.h               |  1 -
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index b585339509b0..c1bfb8df9cba 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1555,6 +1555,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 {
 	int i;
 
+restart_removal:
 	/* check all firmware fbs and kick off if the base addr overlaps */
 	for_each_registered_fb(i) {
 		struct apertures_struct *gen_aper;
@@ -1582,8 +1583,18 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 			 * fix would add code to remove the device from the system.
 			 */
 			if (dev_is_platform(device)) {
-				registered_fb[i]->forced_out = true;
+				/*
+				 * Drop the lock since the driver will call to the
+				 * unregister_framebuffer() function that takes it.
+				 */
+				mutex_unlock(&registration_lock);
 				platform_device_unregister(to_platform_device(device));
+				mutex_lock(&registration_lock);
+				/*
+				 * Restart the removal now that the platform device
+				 * has been unregistered and its associated fb gone.
+				 */
+				goto restart_removal;
 			} else {
 				pr_warn("fb%d: cannot remove device\n", i);
 				do_unregister_framebuffer(registered_fb[i]);
@@ -1917,13 +1928,9 @@ EXPORT_SYMBOL(register_framebuffer);
 void
 unregister_framebuffer(struct fb_info *fb_info)
 {
-	bool forced_out = fb_info->forced_out;
-
-	if (!forced_out)
-		mutex_lock(&registration_lock);
+	mutex_lock(&registration_lock);
 	do_unregister_framebuffer(fb_info);
-	if (!forced_out)
-		mutex_unlock(&registration_lock);
+	mutex_unlock(&registration_lock);
 }
 EXPORT_SYMBOL(unregister_framebuffer);
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 39baa9a70779..f1e0cd751b06 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -503,7 +503,6 @@ struct fb_info {
 	} *apertures;
 
 	bool skip_vt_switch; /* no VT switch on suspend/resume required */
-	bool forced_out; /* set when being removed by another driver */
 };
 
 static inline struct apertures_struct *alloc_apertures(unsigned int max_num) {
-- 
2.35.1

