Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7686A4480D0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 15:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523076E088;
	Mon,  8 Nov 2021 14:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6FA6E088
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636380426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L2nwJsDDJ6lnOHX9UyuWyUCF2Iwb8/6HJk9X/l7N+jI=;
 b=i7YzaRBDfQKnRcYbqFBFHviLbMh7dDbbIsprFjWDY5EY0tNsm6Nn7aLfluj2Mh1gEnzO5M
 WDyTslWWx3QJSh2ynKfrVY4GMQtm0yZUVwm8i2z9m2y5AJunob7vcvKbDhNAJZ4LF4svve
 tguqTKOqQPoyKc4AXB930qbUdIIxGaA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-QQZnQAKOOkq9QRfWFVaxSQ-1; Mon, 08 Nov 2021 09:07:04 -0500
X-MC-Unique: QQZnQAKOOkq9QRfWFVaxSQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so4074203wro.19
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 06:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2nwJsDDJ6lnOHX9UyuWyUCF2Iwb8/6HJk9X/l7N+jI=;
 b=qwTEC7gkySJfEezM064nZAgAd6n6/rXcSs0YUAgp9KszUK9Jf9m/Ep0NgyzUP/JunI
 51zIOKu3uXT3oHWlBFl3cYDM6iXhvqntQefuPxIw/khGj5zbNBvJA6v7olOcan7WRFef
 P4j8YDbaqjDDruxPkTu+NFI+QbH+5PpQVHhi61NhDDjmW9MF8Wq1d3ckk6lBm/AXpATV
 vUVQvyHK4Np+8o+e62obspQHjKu43PWVqrSuDV0E0DF585GQarLl2cfIiQ7+R9yXWG3v
 +Pr4TCAVjZTNJS/UBBFdSOLgbL4MujnmFL1CdF8XJ58IjD8Y2aj+w3mGX7QRacyanmUY
 GOGQ==
X-Gm-Message-State: AOAM5313nJm4uVcYk+5h16JGmaKI++bS7isnZs6c609aDQ+rGvWblZB9
 7IeJHxK8qsoMharYURRvAq8GzQhPMJFUfZ/WFtaMWlEGE4ed3PVoJr/IDWomKYa5lMMLTHDajj6
 eS9pYIShUg/gK04vSvtCpiN100/WR
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr77397wmg.20.1636380423109; 
 Mon, 08 Nov 2021 06:07:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysZB04+wM5KwATDf4oOV/2QZXco8PwMF6dvaPzcuMeSSb3ONesmiTMz17upcy3TYsbmPuz5g==
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr77373wmg.20.1636380422912; 
 Mon, 08 Nov 2021 06:07:02 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id m14sm10081696wrp.28.2021.11.08.06.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:07:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
Date: Mon,  8 Nov 2021 15:06:42 +0100
Message-Id: <20211108140648.795268-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a lot of historical baggage on this parameter. It is defined in
the vgacon driver as nomodeset, but its set function is called text_mode()
and the value queried with a function named vgacon_text_force().

All this implies that it's about forcing text mode for VGA, yet it is not
used in neither vgacon nor other console driver. The only users for these
are DRM drivers, that check for the vgacon_text_force() return value to
determine whether the driver should be loaded or not.

That makes it quite confusing to read the code, because the variables and
function names don't reflect what they actually do and also are not in the
same subsystem as the drivers that make use of them.

This patch-set attempts to cleanup the code by moving the nomodseset param
to the DRM subsystem and do some renaming to make their intention clearer.

This is a v4 of the patches, that address issues pointed out by Thomas
Zimmermann in v3: https://lkml.org/lkml/2021/11/8/384

Patch #1 and #2 are just trivial cleanups.

Patch #3 moves the nomodeset boot option to the DRM subsystem and renames
the variables and functions names.

Patch #4 removes the relationship between the nomodeset parameter and the
CONFIG_VGA_CONSOLE Kconfig symbol.

Patch #5 adds nomodeset to the kernel parameters documentation.

Patch #6 improves the message when nomodeset is enabled to make it more
accurate and less sensational.

Changes in v4:
- Don't mention the simpledrm driver and instead explain in high level
  terms what the nomodeset option is about.
- Don't mention DRM drivers in the kernel message and instead explain
  that only the system framebuffer will be available.

Changes in v3:
- Drop the drm_drv_enabled() function and just call to drm_get_modeset().
- Make drm_get_modeset() just a getter function and don't return an error.
- Move independent cleanups in drivers as separate preparatory patches.

Changes in v2:
- Conditionally build drm_nomodeset.o if CONFIG_VGA_CONSOLE is set.
- Squash patches to move nomodeset logic to DRM and do the renaming.
- Name the function drm_check_modeset() and make it return -ENODEV.
- Squash patch to add drm_drv_enabled() and make drivers use it.
- Make the drivers changes before moving nomodeset logic to DRM.
- Make drm_drv_enabled() return an errno and -ENODEV if nomodeset.
- Remove debug and error messages in drivers.

Javier Martinez Canillas (6):
  drm: Don't print messages if drivers are disabled due nomodeset
  drm/vboxvideo: Drop CONFIG_VGA_CONSOLE guard to call
    vgacon_text_force()
  drm: Move nomodeset kernel parameter to the DRM subsystem
  drm: Decouple nomodeset from CONFIG_VGA_CONSOLE
  Documentation/admin-guide: Document nomodeset kernel parameter
  drm: Make the nomodeset message less sensational

 .../admin-guide/kernel-parameters.txt         |  7 ++++++
 drivers/gpu/drm/Kconfig                       |  6 +++++
 drivers/gpu/drm/Makefile                      |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 ++---
 drivers/gpu/drm/ast/ast_drv.c                 |  4 ++--
 drivers/gpu/drm/drm_nomodeset.c               | 24 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_module.c            |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_drv.c         |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  4 ++--
 drivers/gpu/drm/qxl/qxl_drv.c                 |  4 ++--
 drivers/gpu/drm/radeon/radeon_drv.c           | 10 +++-----
 drivers/gpu/drm/tiny/bochs.c                  |  4 ++--
 drivers/gpu/drm/tiny/cirrus.c                 |  5 ++--
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  6 ++---
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 ++--
 drivers/video/console/vgacon.c                | 21 ----------------
 include/drm/drm_mode_config.h                 |  2 ++
 include/linux/console.h                       |  6 -----
 19 files changed, 67 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_nomodeset.c

-- 
2.33.1

