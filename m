Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FBA744B2A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 23:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6F310E102;
	Sat,  1 Jul 2023 21:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8848010E0C1
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 21:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688247914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ixfgD95cECm9IJRwnBAQBSBQpbSMzbZAJ/z6SVP266o=;
 b=a/bE9SGXhIhRKOPYUqGPxFf79PDlOWzWMZqO+T0tme+FTcJbTDMQIkOZhflF2x7fmyoklD
 aySY4YM32C5jG3pJwtpN25UV6Ns5uM2U6MDaKmn6xkuU9E7UKN9sZrp48zMuVdT6F5/m5X
 JSdHQHZjWY0QoAAfeiFYE044NBaWhhM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-OlAqbkfEN8Oyhe1tndVQhQ-1; Sat, 01 Jul 2023 17:45:13 -0400
X-MC-Unique: OlAqbkfEN8Oyhe1tndVQhQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fa871e1eaaso38697765e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jul 2023 14:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688247912; x=1690839912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ixfgD95cECm9IJRwnBAQBSBQpbSMzbZAJ/z6SVP266o=;
 b=dMc/XbdfaUPpZyQlRfQW3BST8/wVJNOvcVzi1IcvVM4fOb8jXCXoxaF/ibV6TmEM8q
 9+QHkzdr2SeKTzM2ko9I3wUqsGH/Ftauvg1cqH747l+UJNWDgqN9ATG2NXJ/xQo+hSF8
 8mnGfZiMJbzXPa9cG3r66LCoghcBqysskHfZWTYMxx8SHeFrmJhI71BHQnNDkGu3NtCG
 0HhlQLKnLbv9KyNWUg89AY7UtEUUirXACmwwNskXOLNDvP8vYXpNEPFrffUyKOawvcEh
 6016Cg9p1dnaOQjwSBFamf6QdmVWOPFtW9BVsu7dcuKUAWCFZbnmCi7BK0p9Mt1ym3Jy
 VMAA==
X-Gm-Message-State: AC+VfDz1ku4IldAdfiV9Gy4c6jY056Iq1DcCzfpFavudbh6vpIcwH/c1
 SlcwjAn1TrRwXao5SHtuAYE4Ice2+udOrxpMFtAS+RgoVVlpxAqGjTv0FcFZrieoa5AvxxMT5Vm
 9WlRqFHpvj2FnlWCpRJWp/gtk/Ju8
X-Received: by 2002:a7b:cd8e:0:b0:3fa:8aed:d57f with SMTP id
 y14-20020a7bcd8e000000b003fa8aedd57fmr6784938wmj.24.1688247912607; 
 Sat, 01 Jul 2023 14:45:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VVFAC+mKe4oPCU8/6h1nc/0/NeVojU7eqWExkSndccFGWikoSilyCREx/O03MkmAP6nkbXg==
X-Received: by 2002:a7b:cd8e:0:b0:3fa:8aed:d57f with SMTP id
 y14-20020a7bcd8e000000b003fa8aedd57fmr6784914wmj.24.1688247912252; 
 Sat, 01 Jul 2023 14:45:12 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fbc0ea491dsm6913800wmc.40.2023.07.01.14.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 14:45:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
Date: Sat,  1 Jul 2023 23:44:49 +0200
Message-ID: <20230701214503.550549-1-javierm@redhat.com>
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
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Patch 1/2 makes the CONFIG_FB split that is mentioned above and patch 2/2
makes the DRM fbdev emulation to select the new FB_CORE symbol instead of
depending on FB.

This is a v2 of the patch-set that addresses issues pointed out by Arnd
Bergmann and Thomas Zimmermann in the previous version:

https://lists.freedesktop.org/archives/dri-devel/2023-June/411435.html


Changes in v2:
- Keep "depends on FB" for FB_DDC, FB_HECUBA, FB_SVGALIB, FB_MACMODES,
  FB_BACKLIGHT, FB_MODE_HELPERS and FB_TILEBLITTING (Arnd Bergmann).
- Don't change the fb.o object name (Arnd Bergmann).
- Make FB_CORE a non-visible Kconfig symbol instead (Thomas Zimmermann).
- Make CONFIG_DRM_FBDEV_EMULATION to select FB_CORE (Thomas Zimmermann).

Javier Martinez Canillas (2):
  fbdev: Split frame buffer support in FB and FB_CORE symbols
  drm: Make fbdev emulation select FB_CORE instead of depends on FB

 arch/x86/Makefile                 |  2 +-
 arch/x86/video/Makefile           |  2 +-
 drivers/gpu/drm/Kconfig           |  2 +-
 drivers/video/console/Kconfig     |  2 +-
 drivers/video/fbdev/Kconfig       | 40 +++++++++++++++++++------------
 drivers/video/fbdev/core/Makefile |  2 +-
 6 files changed, 30 insertions(+), 20 deletions(-)


base-commit: 270689d257c88fd1ad7050041ed196a8188e6914
-- 
2.41.0

