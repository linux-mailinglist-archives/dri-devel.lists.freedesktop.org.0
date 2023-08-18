Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84084780695
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 09:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C34D10E485;
	Fri, 18 Aug 2023 07:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE8110E47E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 07:51:28 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bda9207132so5326675ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692345088; x=1692949888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GNjosiFza5eZ8AzQ6EtrPFDkWUDthg2MbmBsjDUS0f4=;
 b=OFeh6xVr4kXV6Q1jV7E46aI8kzKDR7ZLAYO0UcLqsJVApAi9zup8+PJhe62UfF+KJu
 /WNKE9FSJsShKLLIMjT5jzLUKfni9Pv8PAa7ERNF82oCEieEKrcY/H7sFoVVKOmeSune
 udSLWJXyeF1SfGrMZmo3JYsmWSe4uQT6uAwzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692345088; x=1692949888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GNjosiFza5eZ8AzQ6EtrPFDkWUDthg2MbmBsjDUS0f4=;
 b=MBKh/73YowgDfIJ0Xp4xXNVGdqAnEly6vRTPISc1XpCcGmyIxWRAIC9rRja6Cl4ig4
 PfTvtosarkq0wt8mE/oFQKqjXe4QMg/b7ex8R4yPCKjOdJq8e4vBOEfu592bGDavqoEI
 k2Ud57Up+mkdW/fIZZ1ys/t/0I/K9p7vGP7M5nygjtvqhcrdHzs55RmKOCshU2yGcwWG
 lIz023qHS8ZCpBqNIGgMIuPvi57mQbs8JfEawF+SHNAfPcqiYtTUaD58lnnmrDYF7sWY
 hb0Y61xmFbx4YYtlGqu9oRB0nz2ANkZQKNrVgCSDP0b/wy1wpDoR9HVKRn8Kdnfw5xkN
 FVqw==
X-Gm-Message-State: AOJu0YwUcRanNLzytNyrBW2kQMXpCUhFIrqLgxV0UEZ/JPFIZYdv6vMk
 oWv8EBpxYX5gaeeFpOC0FQ/xUw==
X-Google-Smtp-Source: AGHT+IE0qUgsLAEdbNZSbOllAJUBEu6mdWYQlh4tavv+TAFALNCFVxPl8/bJqJYd/MFzx+dhzL5rUw==
X-Received: by 2002:a17:902:e74b:b0:1b8:94f4:3e0 with SMTP id
 p11-20020a170902e74b00b001b894f403e0mr2237474plf.14.1692345087938; 
 Fri, 18 Aug 2023 00:51:27 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 jj19-20020a170903049300b001ba066c589dsm1051834plb.137.2023.08.18.00.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 00:51:27 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com,
	jshargo@chromium.org
Subject: [PATCH v3 0/7] Adds support for ConfigFS to VKMS!
Date: Fri, 18 Aug 2023 07:43:05 +0000
Message-ID: <20230818075057.3426088-1-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, mduggan@chromium.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 tzimmermann@suse.de, Brandon Pollack <brpol@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since Jim is busy with other work and I'm working on some things that
rely on this, I've taken up the task of doing the iterations.  I've
addressed the comments as best I can (those replies are to each
individual change) and here is the patch set to go with those.

I added my own signoff to each commit, but I've left jshargo@ as the
author of all the commits he wrote.  I'm sure there is still more to
address and the ICT tests that were writtein parallel to this may also
need some additions, but I'm hoping we're in a good enough state to get
this in and iterate from there soon.

Since V3:
========
I've added hotplug support in the latest patch.  This has been reviewed some
and the notes from that review are addressed here as well.

Relevant/Utilizing work:
=======================
I've built a while test framework based on this as proof it functions (though
I'm sure there may be lingering bugs!).  You can check that out on
crrev.com if you are interested and need to get started yourself (but be
aware of any licensing that may differ from the kernel itself!  Make
sure you understand the license:

https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/tast-tests/LICENSE

That said, you can see the changes in review on the crrev gerrit:

https://chromium-review.googlesource.com/c/chromiumos/platform/tast-tests/+/4666669

Outro:
=====
I really appreciate everyone's input and tolerance in getting these
changes in.  Jim's first patch series was this, and other than some
small cleanups and documentation, taking over it is also mine.

Thank you everyone :)

Original Message:
>Usage
>=====
>
>After installing these patches, you can create a VKMS device with two
>displays and a movable overlay like so (this is documented in the
>patches):
>
>  $ modprobe vkms enable_overlay=1 enable_cursor=1 enable_writeback=1
>  $ mkdir -p /config/
>  $ mount -t configfs none /config
>
>  $ export DRM_PLANE_TYPE_PRIMARY=1
>  $ export DRM_PLANE_TYPE_CURSOR=2
>  $ export DRM_PLANE_TYPE_OVERLAY=0
>
>  $ mkdir /config/vkms/test
>
>  $ mkdir /config/vkms/test/planes/primary
>  $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type
>
>  $ mkdir /config/vkms/test/planes/other_primary
>  $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_primary/type
>
>  $ mkdir /config/vkms/test/planes/cursor
>  $ echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type
>
>  $ mkdir /config/vkms/test/planes/overlay
>  $ echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/type
>
>  $ mkdir /config/vkms/test/crtcs/crtc
>  $ mkdir /config/vkms/test/crtcs/crtc_other
>  $ mkdir /config/vkms/test/encoders/encoder
>  $ mkdir /config/vkms/test/connectors/connector
>
>  $ ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connectors/connector/possible_encoders
>  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encoder/possible_crtcs/
>  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary/possible_crtcs/
>  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/possible_crtcs/
>  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay/possible_crtcs/
>  $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/overlay/possible_crtcs/
>  $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/other_primary/possible_crtcs/
>
>  $ echo 1 > /config/vkms/test/enabled
>
>Changes within core VKMS
>========================
>
>This introduces a few important changes to the overall structure of
>VKMS:
>
>  - Devices are now memory managed!
>  - Support for multiple CRTCs and other objects has been added
>
>Since v1
>========
>
>  - Added DRMM memory management to automatically clean up resources
>  - Added a param to disable the default device
>  - Renamed "cards" to "devices" to improve legibility
>  - Added a lock for the configfs setup handler
>  - Moved all the new docs into the relevant .c file
>  - Addressed as many of sean@poorly.run as possible
>
>Testing
>=======
>
>  - New IGT tests (see
>    gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/merge_requests/1)
>  - Existing IGT tests (excluding .*suspend.*, including .*kms_flip.*
>    .*kms_writeback.* .*kms_cursor_crc.*, .*kms_plane.*)
>
>Outro
>=====
>
>I'm excited to share these changes, it's my still my first kernel patch
>and I've been putting a lot of love into these.

Brandon Pollack (1):
  drm/vkms Add hotplug support via configfs to VKMS.

Jim Shargo (6):
  drm/vkms: Back VKMS with DRM memory management instead of static
    objects
  drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device
  drm/vkms: Provide platform data when creating VKMS devices
  drm/vkms: Add ConfigFS scaffolding to VKMS
  drm/vkms: Support enabling ConfigFS devices
  drm/vkms: Add a module param to enable/disable the default device

 Documentation/gpu/vkms.rst            |  20 +-
 drivers/gpu/drm/Kconfig               |   1 +
 drivers/gpu/drm/vkms/Makefile         |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c  |  30 +-
 drivers/gpu/drm/vkms/vkms_configfs.c  | 724 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c      | 103 ++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 206 +++++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 182 +++++--
 drivers/gpu/drm/vkms/vkms_output.c    | 340 ++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c     |  38 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  33 +-
 11 files changed, 1443 insertions(+), 235 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

-- 
2.42.0.rc1.204.g551eb34607-goog

