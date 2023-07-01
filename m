Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B8E744B2C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 23:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482F610E0C1;
	Sat,  1 Jul 2023 21:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04AB10E0C1
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 21:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688247919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjYFztOePLsPaJm5e5mc9Fspsz0Ww9J9HtOwfHiQKzE=;
 b=FuUULAd0zOsDpqWV2Hm5rGknwFBCiK9PhipDjf41U894eRCkShpIGTO9dmQ3D54/CMwd/Z
 QDn7xxjKhnCpLI0Sb8b4oEacO1Ard7rNrpaRv6oV7PbqkMWbez6lVarb94+dXgiBormp+5
 vEmN/gNnRRIEnrlhWAm80SXn3XaBVUU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-_IhekqT6P-Gh5yzjytG_lA-1; Sat, 01 Jul 2023 17:45:16 -0400
X-MC-Unique: _IhekqT6P-Gh5yzjytG_lA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f9bef91aa4so18319995e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jul 2023 14:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688247915; x=1690839915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YjYFztOePLsPaJm5e5mc9Fspsz0Ww9J9HtOwfHiQKzE=;
 b=PTNGUz0Pp4L+9n8ufFuG3I0EKSucQK0K1XME2g3OOms4gbEs2BoTKi12+ue3JY/63y
 FNtR+M4LMTPrt5pUxZHajqHZkp7LmfhrxgVWMN4zpc3/9KISvv7LUVfcSqqoQnjEZA/P
 6dGiuVpCcdZl3rzDt64isGQHonKVpS6JI0wElTsL6pwh2be6ltkJ20yIJUwwurzOrPiL
 obC4yfcaqa/dvkrhI3HedH/g1s+wNWbsUb9yM31bi31TBwfA0BdgP1pfkZy4Z6JSUnl3
 WXkjS9lgoJqBUYwQ6uvHNsAq+iRyQCgHT42u9kHgUiKFbL1TFx6AWoVcATc1tAuSAmZJ
 ApTg==
X-Gm-Message-State: AC+VfDx3MpmmI0cDyy8YkALuyE1Pxkk/gTaedyKm4DJp2g8uMvhQzDtG
 FOxBXxu2oFBqmyoH2iJo2eGfuvswNGdCAU3dQnwS0zbKYUgda7uo792x9vA3+Cim1a6OdNFoAnq
 EvH4ayIshJZNw8Kgrq0+mYHyn4urY
X-Received: by 2002:a05:600c:2181:b0:3fa:96ae:fd78 with SMTP id
 e1-20020a05600c218100b003fa96aefd78mr5114274wme.29.1688247915506; 
 Sat, 01 Jul 2023 14:45:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4QL/alylsKkmsCF50GPU6dzPKVvFKUXejyBEKTLhORjiMD3xe/aN1kkO/WkkVl4mUmO/qwpg==
X-Received: by 2002:a05:600c:2181:b0:3fa:96ae:fd78 with SMTP id
 e1-20020a05600c218100b003fa96aefd78mr5114264wme.29.1688247915076; 
 Sat, 01 Jul 2023 14:45:15 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fbc0ea491dsm6913800wmc.40.2023.07.01.14.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 14:45:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm: Make fbdev emulation select FB_CORE instead of
 depends on FB
Date: Sat,  1 Jul 2023 23:44:51 +0200
Message-ID: <20230701214503.550549-3-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230701214503.550549-1-javierm@redhat.com>
References: <20230701214503.550549-1-javierm@redhat.com>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the fbdev core has been split in FB_CORE and FB, make DRM fbdev
emulation layer to just select the former.

This allows to disable the CONFIG_FB option if is not needed, which will
avoid the need to explicitly disable each of the legacy fbdev drivers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Make CONFIG_DRM_FBDEV_EMULATION to select FB_CORE (Thomas Zimmermann).

 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f425..d9b1710e3ad0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -132,7 +132,7 @@ config DRM_DEBUG_MODESET_LOCK
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM_KMS_HELPER
-	depends on FB=y || FB=DRM_KMS_HELPER
+	select FB_CORE
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default y
-- 
2.41.0

