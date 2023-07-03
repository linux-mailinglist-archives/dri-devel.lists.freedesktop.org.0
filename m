Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7C7746607
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 01:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9163710E250;
	Mon,  3 Jul 2023 23:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E261D10E24E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 23:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688425551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lkg59yW6N3qp9OWXgPkPBl5HF5mAhGC8YRJ6AIKa7QU=;
 b=Gr0auuNsXRw2Lij7u3CIfGp4MCLlQaw977HDcla3PBDiTE0DV962IHKRLlBf6MpCNgY4cO
 28BQvKN6GTCuV2cJnvVpCEM8ORm8ywN2tiDBVtAN8ni7pkHas9AtREg0TWto/VJsxF8GUf
 wYRvP4vUIr+eGYkYuEJUL3Ej6Fvn8w0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-yJ34WN2GPuOgOtCmxxHv5g-1; Mon, 03 Jul 2023 19:05:50 -0400
X-MC-Unique: yJ34WN2GPuOgOtCmxxHv5g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fa8f8fb7b3so57197475e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 16:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688425549; x=1691017549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lkg59yW6N3qp9OWXgPkPBl5HF5mAhGC8YRJ6AIKa7QU=;
 b=i5UOnC4DHNTniaMl8zV68fe5qLGt7domYVmKbPUYRVno1DVpj44owuXcH/yCTHVjkX
 GhAkKVR41oU6LITsrxeaItNlIfP/it8E8mcSryxQcvUrYEWCME9FF6VBDywNK3kGaQt0
 0juJO9NnrzURfIDqqzIHnKEuQnn5mINwXiJOVttrdm2so8rod0knrr/hyKMFeZc0xeKH
 CwMmqojk9oLO2l4Woo2//AgjjOWlQi3X/Wdls08UvHvrXmw/+Be/4DeSRqE9hsEslRxp
 nUnTp/ebdy6pFCqkPTclpLfvz/tRBDuYgeN3eACPfIUKKpkEQLR8rFHVg6p5M6bbR6ih
 5KIQ==
X-Gm-Message-State: ABy/qLbn8bR8Jjyib6AtZfGYA9+pfEWX7BlEQJvC+6DMCMP44+6Cdz91
 N22OLhdj0FIXRFRUUj5xIHeS/3TZAsF4UrByJAqxi2q5s8lr7C1mvJvclXGiv+9UoaVjXSxrqAu
 koHQ7LKqyREuQ04AI0SuDavPwiLIH
X-Received: by 2002:a7b:c3c1:0:b0:3fb:c77e:80f6 with SMTP id
 t1-20020a7bc3c1000000b003fbc77e80f6mr14175966wmj.36.1688425549033; 
 Mon, 03 Jul 2023 16:05:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFH9VDFE2aV2/hIaFGZ0GQV1akJl6P61RNQPug3Y8zK/CzFjL40FrXKgHbC+BraT1RvK21S8Q==
X-Received: by 2002:a7b:c3c1:0:b0:3fb:c77e:80f6 with SMTP id
 t1-20020a7bc3c1000000b003fbc77e80f6mr14175942wmj.36.1688425548710; 
 Mon, 03 Jul 2023 16:05:48 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a056000090d00b003112f836d4esm26504465wrb.85.2023.07.03.16.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 16:05:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] drm: Make FB_CORE to be selected if DRM fbdev
 emulation is enabled
Date: Tue,  4 Jul 2023 01:05:29 +0200
Message-ID: <20230703230534.997525-6-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703230534.997525-1-javierm@redhat.com>
References: <20230703230534.997525-1-javierm@redhat.com>
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
index afb3b2f5f425..775564558152 100644
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
@@ -95,7 +98,6 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
-	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  CRTC helpers for KMS drivers.
 
@@ -131,8 +133,7 @@ config DRM_DEBUG_MODESET_LOCK
 
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

