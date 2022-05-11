Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D3A5231B2
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27AF10E75A;
	Wed, 11 May 2022 11:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDF310E75A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652268711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2kp5jYCNfGNB7HC1VHLTEN7JTAmf+2Dpd6yPG+mBtE=;
 b=gfJAi33Ui+bTcOo/sjKnVYbQpDYRs1CY9f10trH3JEAONwAFaJvmGUg1eG/N2Y3jRoyW++
 Umu9gYtyI4uk9QCJ4PNGSUuM5IVJx+A/DS2EdQWuuZcmHiLZGk2CEIn8lD7LoH7qBi4VGP
 9Ys2SYyzvBBl6GsUTLzkLYkkcmp8Ji0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-IforE786OmygJlfCGkGKig-1; Wed, 11 May 2022 07:31:50 -0400
X-MC-Unique: IforE786OmygJlfCGkGKig-1
Received: by mail-wm1-f71.google.com with SMTP id
 v124-20020a1cac82000000b003948b870a8dso2713804wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R2kp5jYCNfGNB7HC1VHLTEN7JTAmf+2Dpd6yPG+mBtE=;
 b=W8gPl4z+JDj+LwrQk6PmdZRsepu/wI9T38AABoPZ/c5OB1HKWvKplQsn3tnfGC/w2e
 2GaCkJvCz8OReOE5d6Wmi8DL0xjKb96ameluFC75i2sQExiUWtwqg4VyvVi8G3rKBcbd
 9Z6ic3Lp2iviaynN2X9eKqQERzxV1DMuHq/wgIX8llLInUKvTAMAOUD67dcAekJYtw0/
 U6o1l/X1+wokqivG7WSeydib3QIiqEISPvVovrGZ6FF6uhbLuQ321QsnCuHNKgSjtb0i
 FwDthNHMJukJR8w1FxrTLn9kkoV6tyNbdoUJSOxNsmf9Se87bVST46OU18qvJQNSN7QW
 0DtA==
X-Gm-Message-State: AOAM531XCxs5dhJKc+wJkHoXBWnDu+Bda7zcZYZt9CFhpS5apR6egqpp
 tg1vcDiGWoFIJH4ju8LJXE65MsP6VzPFo526oARgEMP5XlJ65EVK5d/pQU1FOVRTzpR503ks8io
 fiwdKtDI5Hk+NetXpY8wC6LWu5vhq
X-Received: by 2002:a1c:4d10:0:b0:394:788a:24d7 with SMTP id
 o16-20020a1c4d10000000b00394788a24d7mr4323366wmh.113.1652268709257; 
 Wed, 11 May 2022 04:31:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVdOZ6jj+GkTcslb2h+9g+NLK3aby//uMM8giiBszt74nPvf6lrNJh9rn58+o3dxXtHD+dwg==
X-Received: by 2002:a1c:4d10:0:b0:394:788a:24d7 with SMTP id
 o16-20020a1c4d10000000b00394788a24d7mr4323344wmh.113.1652268709014; 
 Wed, 11 May 2022 04:31:49 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e8-20020a5d5308000000b0020c5253d8c2sm1450213wrv.14.2022.05.11.04.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:31:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] fbdev: Disable sysfb device registration when removing
 conflicting FBs
Date: Wed, 11 May 2022 13:31:44 +0200
Message-Id: <20220511113144.1252729-1-javierm@redhat.com>
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

 drivers/video/fbdev/core/fbmem.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 9b035ef4d552..265efa189bcc 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1789,6 +1789,17 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 	if (do_free)
 		kfree(a);
 
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
 	return 0;
 }
 EXPORT_SYMBOL(remove_conflicting_framebuffers);
-- 
2.35.1

