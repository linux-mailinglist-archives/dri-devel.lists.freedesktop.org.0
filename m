Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF4D746602
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 01:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5381B89221;
	Mon,  3 Jul 2023 23:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21B310E24A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 23:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688425542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T2H4I33KaT/CjDOhVJYMDoMgR8IdFg0Tm8qqUiSuquk=;
 b=CpN9N+0QADAzZO1vU/k62qao/Myj1ycHxLqJdMaNIj994XYKUB22dCIsvhQzocV+3wo3qF
 pQ7Hrvlcbs4D+2ge3GwSK1HvtOdiPuRKyLB8unrb0OG/BB+WQEGKVih17r7Eomp+LyukQW
 VUieGWkr1/mSmfB26sbe6eNA9WEXNoo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-0QzDfT5kP4qMbPtsBqKAvQ-1; Mon, 03 Jul 2023 19:05:41 -0400
X-MC-Unique: 0QzDfT5kP4qMbPtsBqKAvQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3141325af78so3358152f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 16:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688425540; x=1691017540;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T2H4I33KaT/CjDOhVJYMDoMgR8IdFg0Tm8qqUiSuquk=;
 b=kyFLTK4lhkzDDAXHNkVGkYRtwy1Lwp1CuEqcPsDg9FllGF3XqpkysNn5u5PLuwGyU8
 iPIl7UhrzAFGxxT2XUCK24EtRgUEK5lTW3YaO3vc9IgHcK5UJRA5S7JNfzYCDXaIB4ua
 gUS/n1H6unP934kkseOA79yjlFH1Bk5Sb29jqCkKYW80Y57unmEKaXuCvUq+wAjYCDhF
 KiGMH377g65Q3jqzxBRElwkl+kcmfJ1thdeox5kSJ0jJQ5bbnaIOv7vTvVX/uBltlJ2J
 jCovtAge7Fif5tUVTECA510kBV+mnHqkgnOb5afM9PsmlZO/Ii/myR3NyifXplOyVtMD
 9beQ==
X-Gm-Message-State: ABy/qLbZGW4uPXRqz4X45C0JhnSD3sUlOiYz1xLLiWtRNKXQ4Tc/Ku9n
 c3o6HjSuSuAaQYE3zULhRzexvnkYOT2YLk40SHDpJWIVYb0lPeqL0+FJCnEnjsJU6lo1DR0C1D5
 mtHPCyPIhdFecZQevREwnHXvKMeyg
X-Received: by 2002:adf:fe02:0:b0:313:f124:aa53 with SMTP id
 n2-20020adffe02000000b00313f124aa53mr9514848wrr.45.1688425540254; 
 Mon, 03 Jul 2023 16:05:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFDiQ9CTDvxM8RjD5e6R9srvFb7gfEdNT7h9sgQp7ev4whpG0Vkx82r/6mI1ZjP3FfbRfvHfA==
X-Received: by 2002:adf:fe02:0:b0:313:f124:aa53 with SMTP id
 n2-20020adffe02000000b00313f124aa53mr9514818wrr.45.1688425539897; 
 Mon, 03 Jul 2023 16:05:39 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a056000090d00b003112f836d4esm26504465wrb.85.2023.07.03.16.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 16:05:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
Date: Tue,  4 Jul 2023 01:05:24 +0200
Message-ID: <20230703230534.997525-1-javierm@redhat.com>
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
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
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

Patch #1, #2 and #3 are cleanups to the "Graphics support" Kconfig menu,
patch #4 does the FB symbol split and introduces the FB_CORE symbol and
finally patch #5 makes the DRM symbol to select FB_CORE if the DRM fbdev
emualtion support was enabled.

Since this series touches three subsystems (auxdisplay, fbdev and DRM),
I would like to merge it through DRM with the acks of these maintainers.

This is a v4 of the patch-set that addresses issues pointed out by Arnd
Bergmann, Thomas Zimmermann and Geert Uytterhoeven in the previous v3:

https://lists.freedesktop.org/archives/dri-devel/2023-July/411689.html

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

Javier Martinez Canillas (5):
  video: Add auxiliary display drivers to Graphics support menu
  fbdev: Move core fbdev symbols to a separate Kconfig file
  drm/arm: Make ARM devices menu depend on DRM
  fbdev: Split frame buffer support in FB and FB_CORE symbols
  drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled

 arch/x86/Makefile                 |   2 +-
 arch/x86/video/Makefile           |   2 +-
 drivers/Kconfig                   |   2 -
 drivers/gpu/drm/Kconfig           |   7 +-
 drivers/gpu/drm/arm/Kconfig       |   1 +
 drivers/video/Kconfig             |   2 +
 drivers/video/console/Kconfig     |   2 +-
 drivers/video/fbdev/Kconfig       | 213 ++----------------------------
 drivers/video/fbdev/core/Kconfig  | 206 +++++++++++++++++++++++++++++
 drivers/video/fbdev/core/Makefile |   8 +-
 10 files changed, 230 insertions(+), 215 deletions(-)
 create mode 100644 drivers/video/fbdev/core/Kconfig

-- 
2.41.0

