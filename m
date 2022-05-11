Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B395231B1
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEC110E6DB;
	Wed, 11 May 2022 11:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F3910E75A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652268697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SX2bFHVDV/mv6k7vv6fW/ROIxkWSEMHBP8/xN2gTDGs=;
 b=fRiPLP5evTe8G8sRrlnEl66/H2jQyRGXJQKQVAFpW2HWYJRGK2z5YiBZNovJz6uO1yvhPy
 4/EzoKZxLfqSQ6EJ0e3uyx0GutL3FEy2x/doYK+FkS3byqXTNkN2YOoDPH6Rg6q05aHnrp
 eLqMCrnHryk8sm1yALeJcWurh8OBRaI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-s55cMnqtNwaPIkJNHetHMg-1; Wed, 11 May 2022 07:31:36 -0400
X-MC-Unique: s55cMnqtNwaPIkJNHetHMg-1
Received: by mail-wm1-f71.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so592173wma.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SX2bFHVDV/mv6k7vv6fW/ROIxkWSEMHBP8/xN2gTDGs=;
 b=fmVTwRI5zHwsUHdeXEEfGnuAWvN0HaOZqjBpLV70k90U7dez9e6Szn5CIqLok1woW9
 B8QqB66msbR/u68hBXi6uqEMYCfZfzB9rQ2BFxcxV1FhXTgFA6GFAiGcUa8Yp6PvuT/9
 zl2G9qYyS2/UjezUKyF1Mn5ui0vm1UN+aM+xGmmQ+VavG9BH7YmQy3mG+SRnzVNygA46
 9D6i2GEPSAJ+KSnmCDyIQGWhOf1JgMysAsAst4nGFhTCDPtkdiPAtKEMQ0xaPQaZEFY3
 ozVYeOmTpGvvAmpcwSVBzPqq8vkhREqkZGuu/aIYZgVh7UKKZ+0Nno1RNEAHkKKCrDbE
 2NiQ==
X-Gm-Message-State: AOAM532b+48MFZ1jQ8Jmh2oisPrJSg20o1qDfPzMkMuF1vUjMbEcEW+W
 bF8MtmYwRDBDL2HBc1VTG2BUNBMC23fO1cezxPI4X9Opqsv1tlg7u0UTLtn+ZyN+IKUK9mkkHXa
 Y8ucTZGiNRRlbwAyqn8idXqKd7wYi
X-Received: by 2002:adf:f152:0:b0:20a:cb56:c20d with SMTP id
 y18-20020adff152000000b0020acb56c20dmr22007077wro.699.1652268694872; 
 Wed, 11 May 2022 04:31:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0z1zDlwGIzZgJwvaUaNGzfZllclBP5T5A4FWJ6skTVqjs02PfSApxo9GnfjeSuNrfEEz42w==
X-Received: by 2002:adf:f152:0:b0:20a:cb56:c20d with SMTP id
 y18-20020adff152000000b0020acb56c20dmr22007059wro.699.1652268694617; 
 Wed, 11 May 2022 04:31:34 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 be5-20020a05600c1e8500b003942a244f54sm5611293wmb.45.2022.05.11.04.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:31:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/7] fbdev: Make sysfb to unregister its own registered
 devices
Date: Wed, 11 May 2022 13:31:25 +0200
Message-Id: <20220511113125.1252660-1-javierm@redhat.com>
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

The platform devices registered in sysfb match with a firmware-based fbdev
or DRM driver, that are used to have early graphics using framebuffers set
up by the system firmware.

Real DRM drivers later are probed and remove all conflicting framebuffers,
leading to these platform devices for generic drivers to be unregistered.

But the current solution has the problem that sysfb doesn't know when the
device that registered is unregistered. This means that is not able to do
any cleanup if needed since the device pointer may not be valid anymore.

Not all platforms use sysfb to register the simple framebuffer devices,
so an unregistration has to be forced by fbmem if sysfb_try_unregister()
does not succeed at unregister the device.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

---

(no changes since v4)

Changes in v4:
- Drop call to sysfb_disable() in fbmem since is done in other places now.

Changes in v2:
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).

 drivers/video/fbdev/core/fbmem.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 2fda5917c212..9b035ef4d552 100644
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
@@ -1587,18 +1588,35 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
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
+						 * FIXME: sysfb didn't register this device, the platform
+						 * device was registered in other platform code.
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
-- 
2.35.1

