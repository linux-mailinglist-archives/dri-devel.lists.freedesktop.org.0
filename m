Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CF754049
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 19:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAED10E0F8;
	Fri, 14 Jul 2023 17:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D75610E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689355014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2kL6s2iGtpGIjyrMzCwNbgQ+dYlVfsjyP7TiMQdzptE=;
 b=BhJLxLNvrmF26NOJ6qf9vHAlfQEE39Px1tiDRGqdkEjBL5bc1UYUwsskPt+SLzFz3BoW6B
 4+fhBdZN4iJ5pN/sZPrf2HdbH+2RbrBqHN/7EHUBxPVXm08xezkPWOXM5uuNyOIvlUYkoa
 yr9k8SQY3qbcCeUHAmo6U2Lz0cD0/Hk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-x7KLCheaNfyvfeD68d6V6Q-1; Fri, 14 Jul 2023 13:16:53 -0400
X-MC-Unique: x7KLCheaNfyvfeD68d6V6Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-314394a798dso896537f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689355012; x=1691947012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2kL6s2iGtpGIjyrMzCwNbgQ+dYlVfsjyP7TiMQdzptE=;
 b=DsfwMrE4eV/6JdFh2jeofFbtYXCcaWkVJo77J0uy2L7/tTFiX8flB79JNoIsfpLehi
 uFa5EsFg7IldFoT4/AhZ0a9ZXuJLm05iti3d1o8D2bYYklymiAxAk84tekbD1vcnPQcP
 5P2dr5CCNsnvWJNpPmxAf5ROtN7XpgarYmXCsASlh0nXgBJVoZSDF2Qu0bJcGggJqoKs
 EICA+rFiiLwj0wh2Hb/Hq2vbBry0uS7kSpFLoXaBWvdTgg/ikwt4r/hcG8bIOatJCqOY
 1NG5CPtYOALYg5dw+D+ER0IFl6DJh5sHo+ZKwkEBd6IN4o5c8QeM8Oh1OOqZZajHvBSo
 Bw8Q==
X-Gm-Message-State: ABy/qLaaFPX++zhu55gkFqOM8CluzMv45Vy5iAdwS8YK3+Gp/w2bA/g5
 k95udbhxhUYSx7AQjv9TfUKpTCS+p0NH4MDOtBFY22OB7k2s3fQZHA+2sQ+syzpBLbO2G8rsOkl
 K4llieJQZGXvq9AibE/yK93W9Fb3ksvaVm8nL
X-Received: by 2002:adf:f04f:0:b0:314:3108:500a with SMTP id
 t15-20020adff04f000000b003143108500amr3012613wro.0.1689355012084; 
 Fri, 14 Jul 2023 10:16:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG+Si2gkk224xulr2GYQ3B2/NaZI0tm53emCdaXDgKsHXxBVo/NNGKHPxSgoWGegYqwn2oCFg==
X-Received: by 2002:adf:f04f:0:b0:314:3108:500a with SMTP id
 t15-20020adff04f000000b003143108500amr3012588wro.0.1689355011770; 
 Fri, 14 Jul 2023 10:16:51 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d17-20020adfe891000000b003143cdc5949sm11620842wrm.9.2023.07.14.10.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:16:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
Date: Fri, 14 Jul 2023 19:16:28 +0200
Message-ID: <20230714171642.91185-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Borislav Petkov <bp@alien8.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jingoo Han <jingoohan1@gmail.com>, Oded Gabbay <ogabbay@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series splits the fbdev core support in two different Kconfig
symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
be disabled, while still having the the core fbdev support needed for the
CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
disabling all fbdev drivers instead of having to be disabled individually.

The reason for doing this is that now with simpledrm, there's no need for
the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
now disable them. But it would simplify the config a lot fo have a single
Kconfig symbol to disable all fbdev drivers.

I've built tested with possible combinations of CONFIG_FB, CONFIG_FB_CORE,
CONFIG_DRM_FBDEV_EMULATION and CONFIG_FB_DEVICE symbols set to 'y' or 'n'.

Patch #1 moves the auxdisplay drivers to "Graphics support" Kconfig menu,
patch #2 moves the core fbdev Kconfig symbols to a separate Kconfig file,
patch #3 does the FB symbol split and introduces the FB_CORE symbol and
finally patch #4 makes the DRM symbol to select FB_CORE if the DRM fbdev
emualtion support was enabled.

Since this series touches three subsystems (auxdisplay, fbdev and DRM),
I would like to merge it through DRM with the acks of these maintainers.

This is a v5 of the patch-set that addresses issues pointed out by Arnd
Bergmann, Thomas Zimmermann and Geert Uytterhoeven in the previous v4:

https://lists.freedesktop.org/archives/dri-devel/2023-July/411842.html

Changes in v5:
- Take the auxdisplay/Kconfig source out of "if HAS_IOMEM" (Geert Uytterhoeven).
- Fix ifdef guard check in drivers/video/backlight/backlight.c (Arnd Bergmann).

Changes in v4:
- Fix menuconfig hierarchy that was broken in v3 (Arnd Bergmann).

Changes in v3:
- Really make a hidden symbol by removing the prompt (Arnd Bergmann).
- Change FB_CORE to config instead of menuconfig (Arnd Bergmann).
- Keep "depends on FB" for FIRMWARE_EDID (Arnd Bergmann).
- Compile out fb_backlight.o and fbmon.o that are only needed for FB
  (Arnd Bergmann).
- Make FB_DEVICE to depend on FB_CORE instead of selecting it.
- Make the DRM symbol to select FB_CORE if DRM_FBDEV_EMULATION is
  enabled (Arnd Bergmann).
- Also make DRM select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
- Make DRM_FBDEV_EMULATION to depend on DRM instead of DRM_KMS_HELPER.

Changes in v2:
- Keep "depends on FB" for FB_DDC, FB_HECUBA, FB_SVGALIB, FB_MACMODES,
  FB_BACKLIGHT, FB_MODE_HELPERS and FB_TILEBLITTING (Arnd Bergmann).
- Don't change the fb.o object name (Arnd Bergmann).
- Make FB_CORE a non-visible Kconfig symbol instead (Thomas Zimmermann).
- Make CONFIG_DRM_FBDEV_EMULATION to select FB_CORE (Thomas Zimmermann).

Javier Martinez Canillas (4):
  video: Add auxiliary display drivers to Graphics support menu
  fbdev: Move core fbdev symbols to a separate Kconfig file
  fbdev: Split frame buffer support in FB and FB_CORE symbols
  drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled

 arch/x86/Makefile                   |   2 +-
 arch/x86/video/Makefile             |   2 +-
 drivers/Kconfig                     |   2 -
 drivers/gpu/drm/Kconfig             |   7 +-
 drivers/video/Kconfig               |   2 +
 drivers/video/backlight/backlight.c |   6 +-
 drivers/video/console/Kconfig       |   2 +-
 drivers/video/fbdev/Kconfig         | 213 ++--------------------------
 drivers/video/fbdev/core/Kconfig    | 206 +++++++++++++++++++++++++++
 drivers/video/fbdev/core/Makefile   |   8 +-
 10 files changed, 232 insertions(+), 218 deletions(-)
 create mode 100644 drivers/video/fbdev/core/Kconfig

-- 
2.41.0

