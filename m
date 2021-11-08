Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094FE447F5A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C6D6E0E3;
	Mon,  8 Nov 2021 12:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36F989DFB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636373764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dRa/l3qZgGwxylRM7oW/sBPMPgMJXegt0r8c50WFAdQ=;
 b=jCeo2K2H865IMVsGPRw4M0AnUdNQ+7n/LJce5q1UIncrjbXmcOa0ewZRV8dWTtn/+8Wm4H
 80qRRAT3BYHyHURAjEg88mjFiFKQN2SLud/076HS1QEHwJb7m+/ONHN9lPfcvE1YbSygPo
 l6zE97XVryu4wecfn1knhI1qMzepdaQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-nflTvDHcNAqlva-YASPDOg-1; Mon, 08 Nov 2021 07:16:02 -0500
X-MC-Unique: nflTvDHcNAqlva-YASPDOg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c185-20020a1c35c2000000b003331dc61c6cso4558924wma.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 04:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dRa/l3qZgGwxylRM7oW/sBPMPgMJXegt0r8c50WFAdQ=;
 b=OZ+YAgRZrwsj0ecF94uYN4aDKjea3mymelba95XwC+Jq2Ffh1NUB8b9ifCcBc/ItHn
 8rFvt8LMZH73sUB8pQQWzjxRvBNP/Ehr+lLYp4IC6tGA4Ox3p4LA4Lo5oRY+9z90N+8c
 CDGZwmgxcqLzgZZJdS02m7CPs9KKbC5Lmw6DRUq0Gjjl68anrRqNsdGkkQ/E+3nyOTQq
 LkrpKWlWrwWA9gVCbnhJNEMHRVYK9XPWGpzHIG48Pi7RqVotyIquClxP2M/3DjoL9WQ9
 ROvJj6KvwlZxvDwr8E1YuqH7eQ3SLA15hlQ5yxPexCuPKwf38JbsCOz0+0boAOkNv2Vr
 M3Jg==
X-Gm-Message-State: AOAM530qcZ/rdVfdIavFRjAV33+r5LLGYvGL7w5LyTLPRP78+FVoUeA9
 orb40a9KOYCZWvA5qcnadAhluCwtLTJfyPeuMjG3uWhMictJ+CrJWJ21Joz3uA3/R+BBlePLjaP
 PtVusuDFwgFUIJA+mwi/o+d5kOIEt
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr51879231wmc.127.1636373761018; 
 Mon, 08 Nov 2021 04:16:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPX4ITT3MIil14REYLQATye65t+SSWzbrpaBbeyG/34N3doWNLeQKLhqLWUn2g69sbZ2Zabw==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr51879189wmc.127.1636373760752; 
 Mon, 08 Nov 2021 04:16:00 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q4sm16866866wrs.56.2021.11.08.04.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 04:16:00 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
Date: Mon,  8 Nov 2021 13:15:38 +0100
Message-Id: <20211108121544.776590-1-javierm@redhat.com>
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

This is a v3 of the patches, that address issues pointed out by Jani Nikula
in v2: https://lkml.org/lkml/2021/11/4/594

Patch #1 and #2 are just trivial cleanups.

Patch #3 moves the nomodeset boot option to the DRM subsystem and renames
the variables and functions names.

Patch #4 removes the relationship between the nomodeset parameter and the
CONFIG_VGA_CONSOLE Kconfig symbol.

Patch #5 adds nomodeset to the kernel parameters documentation.

Patch #6 improves the message when nomodeset is enabled to make it more
accurate and less sensational.

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

 .../admin-guide/kernel-parameters.txt         |  4 ++++
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
 19 files changed, 64 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_nomodeset.c

-- 
2.33.1

