Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CB6508423
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 10:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFC210ECA2;
	Wed, 20 Apr 2022 08:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A389B10E85D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 08:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650444803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ipOD+iHYz0MO8ka3xCh5rdeCaG6XqtVDndckQG+34g=;
 b=ZKxUF45NptgeIwxYUgwAfgkhMtkNLbDBzNLQ5FkXzckyCrI3haEsP5JqNucmyGTdpm/BCn
 Zila7a2xEEPZKNP9jjH+vGDIGFn0m6ZsvLvNkmQsT3Tlgw8XOj22IY7FEKkj1uviXxMV4T
 B7lW9szqDWcuNa8vGvxqJYtTQ7nrG9o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-7ELTjcWdN-mABQpXOf3TxA-1; Wed, 20 Apr 2022 04:53:22 -0400
X-MC-Unique: 7ELTjcWdN-mABQpXOf3TxA-1
Received: by mail-wr1-f71.google.com with SMTP id
 46-20020adf8031000000b00207ad3febaeso193188wrk.6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 01:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ipOD+iHYz0MO8ka3xCh5rdeCaG6XqtVDndckQG+34g=;
 b=xFkHiMWeNrVtAxa/U5bh34PinGulgatuWdGM3czikdfmUBr2v7RHW5A2SoK8uildSr
 uCtQ7UAfCzoS1wQJ0b3d5o9RYA0okyI4mMo2pXv/sugpIForjEX/cnNkP5CjfkvbyhXU
 d8VFYEOO4zy/lR5XYuhSAchWE7Q3Gc/ZNVkpz0EfHoYEpWnOSN4FpZRKeje++GoFa7Z4
 l0EWhK3TUtzgioEWaJb2k5GjY9iDE6iQO16cVZkC9FtKU7JAA6Md6aljT4Z+AFKEQK4J
 lkyCJZOAh2mi7DjZVCk3I/UGhMKmFk4xNi7cpNkqlZk/6CRKFI2F5c3IKXvjllHajUfi
 4P+w==
X-Gm-Message-State: AOAM5336L5zi+3GdL0eS2jGcMejUNgK9fo9Hle7zbuh+xtmsS4Bk7gnZ
 p/yIwXav0dYByrbGcl2e8eUKdSWe5GkBzlFL7jDR/mjUdAep0+tCUhU0cpiLZ59xWu7uIO/sZLF
 Ur4ivLwC2d45YKanimSdJfmyke6w1
X-Received: by 2002:a5d:5392:0:b0:207:aaca:9bd8 with SMTP id
 d18-20020a5d5392000000b00207aaca9bd8mr14859661wrv.615.1650444800319; 
 Wed, 20 Apr 2022 01:53:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZbvPSUyZXNVpsoDxEqgIOir/+9fpJtKe5GQ7jt7d1nsakg7f78pMNvQTiKbTLOPgE1YW8kA==
X-Received: by 2002:a5d:5392:0:b0:207:aaca:9bd8 with SMTP id
 d18-20020a5d5392000000b00207aaca9bd8mr14859645wrv.615.1650444800067; 
 Wed, 20 Apr 2022 01:53:20 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a0560001ace00b0020aac00f862sm1895343wry.98.2022.04.20.01.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:53:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] fbdev: Fix some race conditions between fbmem and sysfb
Date: Wed, 20 Apr 2022 10:53:02 +0200
Message-Id: <20220420085303.100654-5-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420085303.100654-1-javierm@redhat.com>
References: <20220420085303.100654-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Yizhuo Zhai <yzhai003@ucr.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
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

(no changes since v2)

Changes in v2:
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).

 drivers/video/fbdev/core/fbmem.c | 42 ++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 0bb459258df3..8098305879f8 100644
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
@@ -1585,18 +1586,38 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 			if (!device) {
 				pr_warn("fb%d: no device set\n", i);
 				do_unregister_framebuffer(registered_fb[i]);
-			} else if (dev_is_platform(device)) {
+			} else {
 				/*
 				 * Drop the lock because if the device is unregistered, its
 				 * driver will call to unregister_framebuffer(), that takes
 				 * this lock.
 				 */
 				mutex_unlock(&registration_lock);
-				platform_device_unregister(to_platform_device(device));
+				/*
+				 * First attempt the device to be unregistered by sysfb.
+				 */
+				if (!sysfb_try_unregister(device)) {
+					if (dev_is_platform(device)) {
+						/*
+						 * FIXME: sysfb didn't register this device, is a platform
+						 * device registered by a video driver (e.g: vga16fb), so
+						 * force its unregistration here. A proper fix would be to
+						 * move all device registration to the sysfb infrastructure
+						 * or platform code.
+						 */
+						platform_device_unregister(to_platform_device(device));
+					} else {
+						/*
+						 * If is not a platform device, at least print a warning. A
+						 * fix would add to make the code that registered the device
+						 * to also unregister it.
+						 */
+						pr_warn("fb%d: cannot remove device\n", i);
+						/* call unregister_framebuffer() since the lock was dropped */
+						unregister_framebuffer(registered_fb[i]);
+					}
+				}
 				mutex_lock(&registration_lock);
-			} else {
-				pr_warn("fb%d: cannot remove device\n", i);
-				do_unregister_framebuffer(registered_fb[i]);
 			}
 			/*
 			 * Restart the removal loop now that the device has been
@@ -1762,6 +1783,17 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
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

