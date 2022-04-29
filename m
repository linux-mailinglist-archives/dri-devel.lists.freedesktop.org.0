Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261D751447A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA2C89935;
	Fri, 29 Apr 2022 08:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB0110FC8E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Brj5kPf1vp2+xvAmZf1o0QRVBdqqcyn2KbRWKGy9p24=;
 b=dVl2loMhhf6AX9WLQ+vbKwooWlanvxTjgaTxGwebvbMj6TtigdeM6i4cR2GLcZIl1VZp/M
 NI9eXAFacbXvYUnW7py9M6Kgjd4GvCVXaT/uK835ql9efa1lHwXZi7HSM7XH2B67ZDYke2
 gLB5LfClmtUeEDWwOxGWgBJuKgPL8Y4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-xhYJ8pF7PjmdcX1RlaWksQ-1; Fri, 29 Apr 2022 04:43:16 -0400
X-MC-Unique: xhYJ8pF7PjmdcX1RlaWksQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 b10-20020adfc74a000000b0020ab029d5edso2789957wrh.18
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Brj5kPf1vp2+xvAmZf1o0QRVBdqqcyn2KbRWKGy9p24=;
 b=1bcJCEUsVO20INSHtJT4wiyG5xQVVSNH9Lst8SkK23pjBgfrEWidncEVTYorkOa0Bq
 tSpgBDurz5xjy8cbYKuQLyKTchMuHJZVwejapwrVrksMYu6GheZb10zhU205uxvIB/dY
 Vk6eyUxgicySdzkEkEWTwBYK78AbDuXadrEuzndTgsqprJU+0wHqlYWv8yDUOeBaNOFm
 efLXmqYd1yIgwhd3EhkOHNOkeAEXEdbcLEs0DEoHF4zReTCNtD1MuZIxH6r+t4jLUtB+
 g4FrJn4hv1rMH2yjNhAqGDlxPE3JuXJvynXatlffkA0ik5UNP+nk7r9NtTIa5gnyaAKk
 KFFw==
X-Gm-Message-State: AOAM530kKQYM4gNPUQMrAYWvFNdC5Veh1aa5L2URGGchMnFW/+cH56a/
 VBxN23h5Sk9QuNI9cimdXCoN5gJ3HiXrFjw+5J/1h2Mk8v35yjdvyUrA22tksvYGhEoINOaxQAF
 f++STJNlKAALA/e9x2MeQ8pZHk8Zp
X-Received: by 2002:a05:600c:1d9b:b0:393:ffc8:a09b with SMTP id
 p27-20020a05600c1d9b00b00393ffc8a09bmr2179616wms.40.1651221795059; 
 Fri, 29 Apr 2022 01:43:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrVFdFCXeRphGLRkfrU/+tc/H0r7qF9nFcGL4D+eRkGaWuTGNr1P6BVgMPY5uynZbJ2i3UmQ==
X-Received: by 2002:a05:600c:1d9b:b0:393:ffc8:a09b with SMTP id
 p27-20020a05600c1d9b00b00393ffc8a09bmr2179599wms.40.1651221794848; 
 Fri, 29 Apr 2022 01:43:14 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:43:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 06/11] fbdev: Restart conflicting fb removal loop when
 unregistering devices
Date: Fri, 29 Apr 2022 10:42:48 +0200
Message-Id: <20220429084253.1085911-7-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429084253.1085911-1-javierm@redhat.com>
References: <20220429084253.1085911-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

(no changes since v1)

 drivers/video/fbdev/core/fbmem.c | 22 +++++++++++++++-------
 include/linux/fb.h               |  1 -
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 84427470367b..0bb459258df3 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1553,6 +1553,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 {
 	int i;
 
+restart_removal:
 	/* check all firmware fbs and kick off if the base addr overlaps */
 	for_each_registered_fb(i) {
 		struct apertures_struct *gen_aper;
@@ -1585,12 +1586,23 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 				pr_warn("fb%d: no device set\n", i);
 				do_unregister_framebuffer(registered_fb[i]);
 			} else if (dev_is_platform(device)) {
-				registered_fb[i]->forced_out = true;
+				/*
+				 * Drop the lock because if the device is unregistered, its
+				 * driver will call to unregister_framebuffer(), that takes
+				 * this lock.
+				 */
+				mutex_unlock(&registration_lock);
 				platform_device_unregister(to_platform_device(device));
+				mutex_lock(&registration_lock);
 			} else {
 				pr_warn("fb%d: cannot remove device\n", i);
 				do_unregister_framebuffer(registered_fb[i]);
 			}
+			/*
+			 * Restart the removal loop now that the device has been
+			 * unregistered and its associated framebuffer gone.
+			 */
+			goto restart_removal;
 		}
 	}
 }
@@ -1897,13 +1909,9 @@ EXPORT_SYMBOL(register_framebuffer);
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
index f95da1af9ff6..b781bc721113 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -502,7 +502,6 @@ struct fb_info {
 	} *apertures;
 
 	bool skip_vt_switch; /* no VT switch on suspend/resume required */
-	bool forced_out; /* set when being removed by another driver */
 };
 
 static inline struct apertures_struct *alloc_apertures(unsigned int max_num) {
-- 
2.35.1

