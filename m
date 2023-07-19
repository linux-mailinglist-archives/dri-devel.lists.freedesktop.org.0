Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC68758FF8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23C010E420;
	Wed, 19 Jul 2023 08:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A025510E420
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689754560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcU/rlpXrVWc1+sSauJ1JjLJG+mGlwSz84SkWL7yj6M=;
 b=RhIWPYndaCj+2zCQQjssGseHfb0RKwYEbvXCXsOO5ghJhkDsX9zqOt+FaC0TF/awkOeQjf
 /iLN4CyEpWvgLLFMhOwLMVNbMfJUFDZdnZFU+GjVl+g/TjwP6Mua+shH1qXmTeZC+ab/7R
 oQHQkXghVpslegUVUEXSmsDuOVlMINE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-6Kwf_SvxOfWKRn-VGvI42A-1; Wed, 19 Jul 2023 04:15:59 -0400
X-MC-Unique: 6Kwf_SvxOfWKRn-VGvI42A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso3680735f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689754558; x=1690359358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bcU/rlpXrVWc1+sSauJ1JjLJG+mGlwSz84SkWL7yj6M=;
 b=SEUPwYuoyTj07VYjzBpEMIziH8DsEPXrBi1QCwhqXcMX4d20b0Qf+ZM7eVTNCRjboT
 WyKGR1aEnD74PE/33uXIIm5wHFY7g22fiKdr3rQNnaN2v2kkCpLfSqpBugE86TQ0K/He
 PSu5kcPqUedVmkD9KpDcmO3oyiuXgPR4BvRtFJbnCWHBWN2ihqHBwtI1uyOJzGLfUVz8
 q+pDZ6T9gulraylyZYVXuhl3dMpil09KrabPhyX1fvyJDLIhrJr4HlHOJbjYrGDtP//e
 E2w56bGL6w5k4WGbUB7mwd1Vq63qRGbAaoxJgKnD5QRBvbAK678h6WuGpWZA/XVqtUpT
 5Njw==
X-Gm-Message-State: ABy/qLaRcGYmj55m/5JGcA6r2gPlZ3xvSjDH4vO9nEh7QRR/baxPiRHd
 t582HyKBxjt98Rblf90pKKnxnP10AVAiOWc/ff/AXSrl0IncNluqDS3DHGWeJSDd3UHHO6aqZx+
 +LzDhuebfML3cK93K5WjZfuCCUIS/
X-Received: by 2002:a05:6000:1372:b0:314:12b8:641c with SMTP id
 q18-20020a056000137200b0031412b8641cmr11957816wrz.70.1689754558411; 
 Wed, 19 Jul 2023 01:15:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHsbVjauFmNT/vRl+JPx4O3MKbI+jZCgByxetPf2Hfe5iKn6L05qJBLj522sJa1I8oKCRJP7g==
X-Received: by 2002:a05:6000:1372:b0:314:12b8:641c with SMTP id
 q18-20020a056000137200b0031412b8641cmr11957800wrz.70.1689754558149; 
 Wed, 19 Jul 2023 01:15:58 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d5-20020a5d5385000000b0031423a8f4f7sm4574354wrv.56.2023.07.19.01.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 01:15:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/4] drm: Make FB_CORE to be selected if DRM fbdev
 emulation is enabled
Date: Wed, 19 Jul 2023 10:15:38 +0200
Message-ID: <20230719081544.741051-5-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719081544.741051-1-javierm@redhat.com>
References: <20230719081544.741051-1-javierm@redhat.com>
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

Now that fbdev core has been split in FB_CORE and FB, make the DRM symbol
to select the FB_CORE option if the DRM fbdev emulation layer is enabled.

This allows to disable the CONFIG_FB option if is not needed, which will
avoid the need to explicitly disable each of the legacy fbdev drivers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Arnd Bergmann <arnd@arndb.de>
---

(no changes since v3)

Changes in v3:
- Make the DRM symbol to select FB_CORE if DRM_FBDEV_EMULATION is
  enabled (Arnd Bergmann).
- Also make DRM select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
- Make DRM_FBDEV_EMULATION to depend on DRM instead of DRM_KMS_HELPER.

Changes in v2:
- Make CONFIG_DRM_FBDEV_EMULATION to select FB_CORE (Thomas Zimmermann).

 drivers/gpu/drm/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 22c1ba9ea28c..4f209e5c958c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -9,6 +9,9 @@ menuconfig DRM
 	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
 	select DRM_PANEL_ORIENTATION_QUIRKS
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
+	select FB_CORE if DRM_FBDEV_EMULATION
+	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	select HDMI
 	select I2C
 	select DMA_SHARED_BUFFER
@@ -96,7 +99,6 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
-	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  CRTC helpers for KMS drivers.
 
@@ -132,8 +134,7 @@ config DRM_DEBUG_MODESET_LOCK
 
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
-	depends on DRM_KMS_HELPER
-	depends on FB=y || FB=DRM_KMS_HELPER
+	depends on DRM
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default y
-- 
2.41.0

