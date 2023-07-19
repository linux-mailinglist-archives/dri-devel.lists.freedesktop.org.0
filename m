Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A820758FF6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F25C10E41F;
	Wed, 19 Jul 2023 08:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8172310E078
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689754555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=40ASWVJugYUVdn1GncG1gYQu4TsA6479quLHdQQNoPg=;
 b=R07QMZzeVejvjhm9UUXSDHsVfmlFbd8BUIxj8briBNmYeoF8KCFqcu6d0frYCuHc8YOxX6
 GGX/9z7V9+cumWWo7RfExhtbaIMUXnFnrSXOVcM7x0x48hBZ9vFmWKjxClEZT9ceDef3V3
 PPeym5w5BQXFgBS3rG16KbezouuZD6c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-nwSiB13aOIGBFaiG0SEeyQ-1; Wed, 19 Jul 2023 04:15:54 -0400
X-MC-Unique: nwSiB13aOIGBFaiG0SEeyQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-314275b653eso3665470f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689754553; x=1690359353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=40ASWVJugYUVdn1GncG1gYQu4TsA6479quLHdQQNoPg=;
 b=OYbFfCmNn1ZvcD29Suw8Pedinl8MYTIoc2jLXfCcfh6RWVrQIrb74jaesbzO2O297W
 Hy1S9k9RGQapApw7BzA1uJ/0klGlGGyEVd7K4GWGx0bXb5p3wtf/H/DYJPOo7iLbJ6kp
 c793nlKIMIvExhyYxXk7V/AKgx9SbHMa5jdWSCQY4PSI1seml10Fa8tk9D2gb1SnEmgw
 VQGeEbDbE7WjWHCFQspZXCcQHX9j6k6Em72bvv4ZKn2yIH3FX5hjN+FPjhs2b99VM3Kl
 SbkgRnPSQPzPl8vjGYMvqL1MBRjOIw7cT5sjlpKLL0wo9fld5UaoxppH4u5PD7ymfLo+
 VEEw==
X-Gm-Message-State: ABy/qLbOXfxdVkJlng6jSsQTw4bZi4l2UcXEDw8uoT5j5PEun7Pl76Hd
 XZHRl3qGLhvxO36sNCa8ptTvY7/QFhsBwU2oXRusTMI8lRYJfu06+czy8brYahw17GEGz/pRpBS
 ST9xkMeveGWmwyBvtk+n2STpIBDAk
X-Received: by 2002:adf:f010:0:b0:30f:c5b1:23ef with SMTP id
 j16-20020adff010000000b0030fc5b123efmr1442013wro.41.1689754553207; 
 Wed, 19 Jul 2023 01:15:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHwdSs8ByNSqXngMlZ63oFzlT6IoL2Kc3yr4P/RuiEvXHHGVP6vSlDKFsJHCgGc5/EQ8pwhrA==
X-Received: by 2002:adf:f010:0:b0:30f:c5b1:23ef with SMTP id
 j16-20020adff010000000b0030fc5b123efmr1441993wro.41.1689754552888; 
 Wed, 19 Jul 2023 01:15:52 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d5-20020a5d5385000000b0031423a8f4f7sm4574354wrv.56.2023.07.19.01.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 01:15:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
Date: Wed, 19 Jul 2023 10:15:34 +0200
Message-ID: <20230719081544.741051-1-javierm@redhat.com>
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
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
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

This is a v6 of the patch-set that addresses issues pointed out by Arnd
Bergmann in the previous v5:

https://lists.freedesktop.org/archives/dri-devel/2023-July/413943.html

Changes in v6:
- Don't move FB_{HECUBA,SVGALIB,MACMODES} to config/Kcore (Arnd Bergmann).
- Fix link error when CONFIG_FB_CORE=y and CONFIG_FB=m (Arnd Bergmann).

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
 drivers/video/fbdev/Kconfig         | 197 ++--------------------------
 drivers/video/fbdev/core/Kconfig    | 190 +++++++++++++++++++++++++++
 drivers/video/fbdev/core/Makefile   |  10 +-
 10 files changed, 218 insertions(+), 202 deletions(-)
 create mode 100644 drivers/video/fbdev/core/Kconfig

-- 
2.41.0

