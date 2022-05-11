Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54A552319A
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0198810E3DD;
	Wed, 11 May 2022 11:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E3E10E3DD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652268655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKBAcv9/i+j+NmGeneztCrY9Hfc9zc/TOb5Jz8UH/dw=;
 b=eesVQDngvovNK6LrPfcWyxvs+f4bGZLQ+GGGh7p10aOQqHuVo6/Cr3wUZALFZMX/8i/pap
 CRgfvtc1ZWfysuAk7F8c98tYwJ24CL+UjlLVthj8iEjduIQOjWFWrM6SYnIolLuo5azst0
 mZVzGytZqDsrCh+f89xllyNW6yXI8U8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-fW982OSRPZ6PPFg_ZhAjSg-1; Wed, 11 May 2022 07:30:54 -0400
X-MC-Unique: fW982OSRPZ6PPFg_ZhAjSg-1
Received: by mail-wm1-f69.google.com with SMTP id
 t184-20020a1c46c1000000b00394209f54f1so591756wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bKBAcv9/i+j+NmGeneztCrY9Hfc9zc/TOb5Jz8UH/dw=;
 b=SC9wPhjUg31yTo6tTrJp87KROx2a+SLwJI7uSzyPopow/hwsj9Ka40pc5NAXChOUfK
 GodZlhlzvQcYaNst3gAVixvxbtJeH7HRYOmrdmnvDNXdXAR4NI5JGJ30r3TV3VV/2MSV
 U1SAhpSvhqKOrR0XVdzLRh11xX8jD9DDJZklIn9TZRX9a5rn806GFBiToAdxATTL6rzY
 NSfMNVZ6odSQSMDnrkvYPZBM39aUFjD1UAKDAb+cuCPa3/WUqUQe25wwHBPfAFaDn7Il
 LyvAqy2Y4nujvAqP1i+e+wioEQMiegRttBJlvTj6nGpd4LwdmMQOsTR11zk8nIZAInGT
 oQqA==
X-Gm-Message-State: AOAM533gnrgqIK6NUf2efmpXK0P8lwsMZkLYGiHVDaIHFvaWAnMzuyue
 PPpmBJJ3FKFdEk+mDVA0IOJmoa07trebMDZ5R6FWjPpUB0WoBEqk+iDqzufIaOt3C9Qtzu+sMI4
 3HBUOY9xbCl6w3ymX/39vo5dZ7r1Y
X-Received: by 2002:adf:9dcc:0:b0:20a:ed44:fd48 with SMTP id
 q12-20020adf9dcc000000b0020aed44fd48mr22330185wre.120.1652268653117; 
 Wed, 11 May 2022 04:30:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIJjtshhhNaPS9SyMj2B6z8Yib37iNGrRjx/XQ5eyK5wW8o/9hh+eocyK9ixZaPPybN81Bxg==
X-Received: by 2002:adf:9dcc:0:b0:20a:ed44:fd48 with SMTP id
 q12-20020adf9dcc000000b0020aed44fd48mr22330167wre.120.1652268652888; 
 Wed, 11 May 2022 04:30:52 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w9-20020a5d4049000000b0020c5253d8cfsm1722625wrp.27.2022.05.11.04.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:30:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/7] fbdev: Restart conflicting fb removal loop when
 unregistering devices
Date: Wed, 11 May 2022 13:30:39 +0200
Message-Id: <20220511113039.1252432-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511112438.1251024-1-javierm@redhat.com>
References: <20220511112438.1251024-1-javierm@redhat.com>
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
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
index b445a7a00def..2fda5917c212 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1555,6 +1555,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 {
 	int i;
 
+restart_removal:
 	/* check all firmware fbs and kick off if the base addr overlaps */
 	for_each_registered_fb(i) {
 		struct apertures_struct *gen_aper;
@@ -1587,12 +1588,23 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
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
@@ -1899,13 +1911,9 @@ EXPORT_SYMBOL(register_framebuffer);
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
index 69c67c70fa78..bbe1e4571899 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -511,7 +511,6 @@ struct fb_info {
 	} *apertures;
 
 	bool skip_vt_switch; /* no VT switch on suspend/resume required */
-	bool forced_out; /* set when being removed by another driver */
 };
 
 static inline struct apertures_struct *alloc_apertures(unsigned int max_num) {
-- 
2.35.1

