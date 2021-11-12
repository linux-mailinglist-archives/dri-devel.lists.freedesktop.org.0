Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9421144E764
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 14:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19DF6E071;
	Fri, 12 Nov 2021 13:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A00C6E071
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636723970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uBWkInz0f1J6G4VWIx0eG6QJ5CEmZf0S6yUp5qm/mCw=;
 b=HjplO5EVPWmVuWT5kuSDWoj05vrFR04oORuMvAKJWEB4IKT+PaSBYIyKet9gOH+3gp5w5F
 m+vijjUv5o0TKcs9fpJBDOmArWI5RuhLxVeX6jTXE0L5vSvJmTUMaaumpn/0IEIyWE+Dx8
 BZY0Np6FttCFV9cC0CfliHoHafbnfYI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-ULbZGJyNPyCneP5iunHmRw-1; Fri, 12 Nov 2021 08:32:48 -0500
X-MC-Unique: ULbZGJyNPyCneP5iunHmRw-1
Received: by mail-wr1-f69.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so1590225wrh.14
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 05:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uBWkInz0f1J6G4VWIx0eG6QJ5CEmZf0S6yUp5qm/mCw=;
 b=DdEEv2JfuH+MJq6S7PDxwiPybghj3VZak6AhMCR21UzD7p6sZybkcW+CzDXdO0aTOh
 ylMkdUux2s8rdTRkXWFzgszCvf7ducD0jdro8Ea+xJsxG11pAV4ii7NfNy9hwy3cx1Xh
 KYHR3PJt8/u2UJY3QtZzSUKpHPcEtMsXFt8cWVKf/5/ckCjEF95uMht8YemjFoYnYMjf
 CdGwBUX2Gbas/n5aNHHdK4ZIZaFDR+V1rDuhD4dhsPdUfyB2lBKC5OTUqc6PUsX65yKF
 0UhGG63WxUNfX5lqHOkTDipgxurkdUrpJ+NdnrGh/KNhXAALvWDsji2oqsKR4bPIDqgc
 qaow==
X-Gm-Message-State: AOAM532ZCCm4/tPxleiRlU7e+pdN6KDOG2DWSgwK24pP0Sm7rAJpEWVk
 T4vquQxjnMm2Xt+galbVKS2yx1vRZDslAnRZtB5QQSF4J+0fZTwEC3EfC100/WyceA3qvCkWFgM
 84kN+ZnjSXq+DRap/LuIl1J+868hO
X-Received: by 2002:a5d:6151:: with SMTP id y17mr18894053wrt.275.1636723967719; 
 Fri, 12 Nov 2021 05:32:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweFQRkr0PyXjrBf8oym4Y4OL7IMWD4cJ/wYupxgVKu0oGzEp1nKDEvel2QElYeV46gqHNjEA==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr18894012wrt.275.1636723967473; 
 Fri, 12 Nov 2021 05:32:47 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z12sm5733470wrv.78.2021.11.12.05.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:32:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
Date: Fri, 12 Nov 2021 14:32:24 +0100
Message-Id: <20211112133230.1595307-1-javierm@redhat.com>
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

This is a v5 of the patches, that just renames the function used by drivers
to check to drm_firmware_drivers_only(). Other than that is the same as v4.

Patch #1 and #2 are just trivial cleanups.

Patch #3 moves the nomodeset boot option to the DRM subsystem and renames
the variables and functions names.

Patch #4 removes the relationship between the nomodeset parameter and the
CONFIG_VGA_CONSOLE Kconfig symbol.

Patch #5 adds nomodeset to the kernel parameters documentation.

Patch #6 improves the message when nomodeset is enabled to make it more
accurate and less sensational.

Changes in v5:
- Rename drm_get_modeset() to drm_firmware_drivers_only().

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  5 +---
 drivers/gpu/drm/ast/ast_drv.c                 |  3 +--
 drivers/gpu/drm/drm_nomodeset.c               | 24 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_module.c            |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_drv.c         |  3 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  4 ++--
 drivers/gpu/drm/qxl/qxl_drv.c                 |  3 +--
 drivers/gpu/drm/radeon/radeon_drv.c           |  9 ++-----
 drivers/gpu/drm/tiny/bochs.c                  |  3 +--
 drivers/gpu/drm/tiny/cirrus.c                 |  4 ++--
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  5 +---
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  3 +--
 drivers/video/console/vgacon.c                | 21 ----------------
 include/drm/drm_drv.h                         |  1 +
 include/linux/console.h                       |  6 -----
 19 files changed, 56 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_nomodeset.c

-- 
2.33.1

