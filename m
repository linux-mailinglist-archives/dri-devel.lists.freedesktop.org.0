Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93832745043
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 21:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C0910E01F;
	Sun,  2 Jul 2023 19:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C3B8921E
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 19:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688325344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4kLj8dmTPlNd9hpuLLmsoj1kmn9VFM9AznQMmSVeuFI=;
 b=VuDErYKcK3BlwYA5DZSw0Z8ewbztBss5DCQSNaTrggyX5EzQc7zlcKBGNM8LpDg3NToGGF
 9OMgYobIXohFi47vWsxWzs/UmC4wa2+MeKnKXHHaNGhMqZi2zBwfx/dpRmkodh26+BSJ0a
 XGHtZ7hsQSZdYlUe/pJgXl30+c/yRM0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-KUa3ns8_NCqjbWgloxZKzw-1; Sun, 02 Jul 2023 15:15:43 -0400
X-MC-Unique: KUa3ns8_NCqjbWgloxZKzw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so18895605e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 12:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688325342; x=1690917342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4kLj8dmTPlNd9hpuLLmsoj1kmn9VFM9AznQMmSVeuFI=;
 b=hJ6mUAlo0uLaDTIPPHxd7xUOLDsDl4/Y741OWqinALNWUjet60TbtAfOrTgtJRCnmj
 i2pqz+cm5j3NqyQ0RgOGTml0NnON2YprhjTM5ZD42yqbBiStdmVhGISKa+6tZqa6+ZT8
 KhFQ1Rzy+51CZoIqVG+XqT4PpsUwz1/rytoAddgtA+/e9tjdq5U4DpGzjEB4Hs61WuBc
 9+4GFrfSY+uaaGOH2yXy4a3RYCUKcabQa8+/ZbhzrtXES8dKfVP60IRtI1AiPBmGpUfR
 /R1LHzf0M4nVEbp0m6yD0v/5dajXZJNRcK27OCtBlo/Rtdu+74DSo8W11hcOgR/IYgzl
 Vyag==
X-Gm-Message-State: AC+VfDydYe7gjolWb7CkMVsThCUCcNt+gCsTG0J0A1XiD+K858l8JCRs
 ixfhKLFa6pf7nSWrd1eXFh4ygqjatFdR2uq8/fth2jGE3xHDGP++JHBDtGQzms/M/IMJKh9Masj
 hYbubhQwfOoEopItYYHBVsc2n5S5R
X-Received: by 2002:a05:600c:294a:b0:3fa:770c:5918 with SMTP id
 n10-20020a05600c294a00b003fa770c5918mr5858771wmd.9.1688325341934; 
 Sun, 02 Jul 2023 12:15:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7zvHRJ6y1/LCj1vDiagN6ACwcdgHIj6l3XviwcGwUovId3cFIYrKqPqTFSB9KPelIQ9jAP7w==
X-Received: by 2002:a05:600c:294a:b0:3fa:770c:5918 with SMTP id
 n10-20020a05600c294a00b003fa770c5918mr5858748wmd.9.1688325341581; 
 Sun, 02 Jul 2023 12:15:41 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g11-20020a7bc4cb000000b003fbab76165asm14144231wmk.48.2023.07.02.12.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 12:15:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
Date: Sun,  2 Jul 2023 21:15:17 +0200
Message-ID: <20230702191529.768248-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
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

Patch #1 is just a cleanup for the DRM symbol prompt and help texts, patch
DRM symbol to select FB_CORE if CONFIG_DRM_FBDEV_EMULATION was enabled.

This is a v3 of the patch-set that addresses issues pointed out by Arnd
Bergmann, Thomas Zimmermann and Geert Uytterhoeven in the previous v2:

https://lists.freedesktop.org/archives/dri-devel/2023-July/411660.html

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

Javier Martinez Canillas (3):
  drm: Improve Kconfig symbol prompt and help texts
  fbdev: Split frame buffer support in FB and FB_CORE symbols
  drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled

 arch/x86/Makefile                 |  2 +-
 arch/x86/video/Makefile           |  2 +-
 drivers/gpu/drm/Kconfig           | 29 ++++++++++++----------
 drivers/video/console/Kconfig     |  2 +-
 drivers/video/fbdev/Kconfig       | 40 +++++++++++++++++++------------
 drivers/video/fbdev/core/Makefile |  8 +++----
 6 files changed, 49 insertions(+), 34 deletions(-)

-- 
2.41.0

