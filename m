Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF92F44419C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 13:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020B373292;
	Wed,  3 Nov 2021 12:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F021B72E8E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 12:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635942770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WYRilsKXTSd9rCQl94c3WtrJx+PErIlJFSZVj4QEnnA=;
 b=Rxli6xtQF1IzbP59PQeth9DuqNPs+H6uQLnNisulug2Yf2BcwQNSv25xaydSstFGiT8R62
 BZIzFeH0364YpuSZ6kiANrhtvmgv9nhhaZo+XbACIw07CT7YHUZ8wAYPL4+6QGOCQmAE+M
 g3prFKQ3651OdULaqPP30b/M8YIvIZI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-4xiSCJdzNvCj6WyZ3oiVag-1; Wed, 03 Nov 2021 08:32:49 -0400
X-MC-Unique: 4xiSCJdzNvCj6WyZ3oiVag-1
Received: by mail-wm1-f71.google.com with SMTP id
 a18-20020a1cf012000000b0032ca3eb2ac3so1050350wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 05:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WYRilsKXTSd9rCQl94c3WtrJx+PErIlJFSZVj4QEnnA=;
 b=pr4zJMUNcVgJ7AiJBg4iBSJg0gMaCxjM7DO6mS6CkWWVnpW+XmuId2rP3APdLh7/tl
 Dd5mmqJeJrwXmzPGObje9gDOamDLSXVSy6EOe8OtNkWxfLd3rd98QlKp2/Q/05x5sfix
 wQJG0zOEtX8fWIiHUySwcbtXpKE1vY8ulettZueX6yzXKei+sm+qJUqyZXtdVXZv4GhT
 VLQfpwNLo1CsfxyAMBJ+lldTPSgzIsRPfxJEtRy/tyVEFwv4LZEG/q9mNEMvhaCZatoM
 NoN/rUM5IF4+DudzKQtoqRbXjwYkhvYK0ynFssnf+4+ZQzxiR1qzdEf074M/1I5wMb9B
 UxiA==
X-Gm-Message-State: AOAM531y6re5CgReErMXveb2+9ysCSiH2BvcUSoH/uxZji6RIhUCSSi8
 08DUGuWMP3Lu809M3+YohDYuFrlzJgRnRZTbk/z0kXPX8EYzAiqVeFSwIJaer0qLX5XXS62HhEL
 bQk+0eiFrR8T96/vataI3fjOfgqeU
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr28163697wrs.272.1635942768498; 
 Wed, 03 Nov 2021 05:32:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL3nl9ZIaxmy0TeQNyii+JJT5uC8lrIzi9b77Ccpfz42Wnw9LhvaMNMIW70Bij6uW32P/3dA==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr28163669wrs.272.1635942768316; 
 Wed, 03 Nov 2021 05:32:48 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id o8sm1774844wrm.67.2021.11.03.05.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 05:32:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 4/5] drm: Add a drm_drv_enabled() helper function
Date: Wed,  3 Nov 2021 13:32:06 +0100
Message-Id: <20211103123206.1041442-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neal Gompa <ngompa13@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM drivers can use this to determine whether they can be enabled or not.

For now it's just a wrapper around drm_modeset_disabled() but having the
indirection level will allow to add other conditions besides "nomodeset".

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_drv.c | 21 +++++++++++++++++++++
 include/drm/drm_drv.h     |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..70ef08941e06 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -975,6 +975,27 @@ int drm_dev_set_unique(struct drm_device *dev, const char *name)
 }
 EXPORT_SYMBOL(drm_dev_set_unique);
 
+/**
+ * drm_drv_enabled - Checks if a DRM driver can be enabled
+ * @driver: DRM driver to check
+ *
+ * Checks whether a DRM driver can be enabled or not. This may be the case
+ * if the "nomodeset" kernel command line parameter is used.
+ *
+ * Returns:
+ * True if the DRM driver is enabled and false otherwise.
+ */
+bool drm_drv_enabled(const struct drm_driver *driver)
+{
+	if (drm_modeset_disabled()) {
+		DRM_INFO("%s driver is disabled\n", driver->name);
+		return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(drm_drv_enabled);
+
 /*
  * DRM Core
  * The DRM core module initializes all global DRM objects and makes them
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 0cd95953cdf5..48f2b6eec012 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -598,5 +598,6 @@ static inline bool drm_drv_uses_atomic_modeset(struct drm_device *dev)
 
 int drm_dev_set_unique(struct drm_device *dev, const char *name);
 
+bool drm_drv_enabled(const struct drm_driver *driver);
 
 #endif
-- 
2.33.1

