Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B019540ACD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DC610F299;
	Tue,  7 Jun 2022 18:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4053610F26F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654626233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVERor1pDjv50JOPQD6dbA5hWF6IpXrW4mZT/xer28A=;
 b=FDmip8dXUdASL0h6/CLTSSde9UwXLq8ysWdO0jiOfQ8h2JMhUB26QuJ2Kk6N3xZvacodXG
 RKTp+1ANKp09pZ4zEV1aq/PTNDaiZRFooxUxL7hvtUJBqrUA/PtqmjU5tb/bT3UBUiC2PA
 KztC5pYVuJ1Zn1RgQudLW4nLmoZoCC4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-Fcfyuz0IP5KI0uWetT6aGA-1; Tue, 07 Jun 2022 14:23:50 -0400
X-MC-Unique: Fcfyuz0IP5KI0uWetT6aGA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ay4-20020a5d6f04000000b002183e363f9bso2046368wrb.22
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVERor1pDjv50JOPQD6dbA5hWF6IpXrW4mZT/xer28A=;
 b=U0f6nS61i5i43tlD+nVyBIG0+eNfT8z8b8xyMsjPmcmYb76QbMUPgyJArsmem0RoQh
 0kPzfTsj0f/T0yhrKzk0iEXCe7EVLy6caWDROb1u1BnWIgzkomCA2BIoZ0tWCWcfvXUD
 j/FxI1nxFMhPIkqqQNpTODQbV3EemnhgLhMPdU4fHw4ohLOydV8ifG1OD7GAaAZipdAm
 Sb90ptXOswDmTo8acECDizljDIxyWJYLT/DrQj8RtvxGOqt9wnx3ZdxulwTktPNvSSjA
 EJ6JsshqNx+6S7TEfwKIGRVgPX6NPWnGdFJ/ol5Ceb19JL2lgeHHZz0qYreZncE5YRbp
 WmMA==
X-Gm-Message-State: AOAM533M3QzVmlVyRc1yuTh890XYz1SnIbNbXM3Jufs77dQORGWdedBa
 TZZuTUloS5L7Ihfwr02vQC1sy6SXiuEHc95ctkgDKOkqahPHHr/NDj6SRMxZa3FmmIPbn1w/Sdp
 eGjS/5Czf5ummcy6KuQdcfNyXvNHr
X-Received: by 2002:a05:6000:1b03:b0:216:43b4:82f1 with SMTP id
 f3-20020a0560001b0300b0021643b482f1mr18992413wrz.232.1654626229027; 
 Tue, 07 Jun 2022 11:23:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIJ2ZaSX69tcbwGyt9OTbAcEXndsJiDIZKc+WEe5sBYC0UmDo7XaAT1uT5eNOYdA7eP4tzzQ==
X-Received: by 2002:a05:6000:1b03:b0:216:43b4:82f1 with SMTP id
 f3-20020a0560001b0300b0021643b482f1mr18992391wrz.232.1654626228799; 
 Tue, 07 Jun 2022 11:23:48 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003942a244f51sm28267502wmq.42.2022.06.07.11.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:23:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/5] fbdev: Disable sysfb device registration when removing
 conflicting FBs
Date: Tue,  7 Jun 2022 20:23:36 +0200
Message-Id: <20220607182338.344270-4-javierm@redhat.com>
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform devices registered by sysfb match with firmware-based DRM or
fbdev drivers, that are used to have early graphics using a framebuffer
provided by the system firmware.

DRM or fbdev drivers later are probed and remove all conflicting framebuffers,
leading to these platform devices for generic drivers to be unregistered.

But the current solution has a race, since the sysfb_init() function could
be called after a DRM or fbdev driver is probed and request to unregister
the devices for drivers with conflicting framebuffes.

To prevent this, disable any future sysfb platform device registration by
calling sysfb_disable(), if a driver requests to remove the conflicting
framebuffers.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

Changes in v6:
- Move the sysfb_disable() before the remove conflicting framebuffers
  loop (Daniel Vetter).

Changes in v5:
- Move the sysfb_disable() call at conflicting framebuffers again to
  avoid the need of a DRIVER_FIRMWARE capability flag.
- Add Daniel Vetter's Reviewed-by tag again since reverted to the old
  patch that he already reviewed in v2.

Changes in v3:
- Call sysfb_disable() when a DRM dev and a fbdev are registered rather
  than when conflicting framebuffers are removed (Thomas Zimmermann).
- Call sysfb_disable() when a fbdev framebuffer is registered rather
  than when conflicting framebuffers are removed (Thomas Zimmermann).
- Drop Daniel Vetter's Reviewed-by tag since patch changed a lot.

Changes in v2:
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).

 drivers/video/fbdev/core/fbmem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 2fda5917c212..e0720fef0ee6 100644
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
@@ -1764,6 +1765,17 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
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
2.36.1

