Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B091D78BDC0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 07:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB45310E3AB;
	Tue, 29 Aug 2023 05:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D534E10E3AB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 05:32:08 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c1ff5b741cso2061205ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693287128; x=1693891928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bOmxtFVEMcnYTfOvvgMDLlhWsd8Xdf7SZTlsshecY+c=;
 b=nNKIIZS2Er0+n9sV4ALiqZbmBR6pPsthiM/4lTjJ9ZqHzjYswwO9ed5Be1QFQjGbhn
 G2Hd5VtAaqcB2Fwm0Zm8WzGQStFyQ6aVbFNVkbKvUtv+Rc+nzAJtkwV+kTUiukmdAXWI
 B1RZ+BF8ZYjFN4yB1wxtjTCSjC1ggSAIoL/uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693287128; x=1693891928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bOmxtFVEMcnYTfOvvgMDLlhWsd8Xdf7SZTlsshecY+c=;
 b=lVJw8gbkVcFmYWsnZnyC1iUIsuJpAEqyfO83nm0C7W9OdGdQwhB/guwfHPBwDJYEw/
 WMKK/+1QLkd0i4B0PIZqAHpa+oizCjGqbFGVummEJOK7zfLIRKXP3YZeITsGKsZVhhO6
 KOxatEn6pHH+lnBo8JWUFFwD8IW6Wkvn3QdzGRGuZEGXZmK1hZ+AK3K53eCeypEb+pxT
 jRS7bp3bKSn3BULcK7v3aVTTWld9Zui0MYD++lfFUBL7GdxS4p/9y/zSTXEsj5ZBrDB6
 xVyhccSRZQZ8ZJw7qB+V7vdAFp5kSj8OXvkMUH1BQwCnxkIVOvKzHtSzQL6xcLErapYP
 EsMg==
X-Gm-Message-State: AOJu0Yy4aZBmXYW25KGcAQmZzutlcvlakOTuLpWM4IWG9LGjLD1XSQNN
 W8yvxMC815Q7gfcM348oJpbLBg==
X-Google-Smtp-Source: AGHT+IFqkh8sU3waz+EAlcz3C9rOwJxyX0JfN9k8aPIUVY1IZevun3+s2UJxqC4GJk+7KLIv/kW/Ig==
X-Received: by 2002:a17:902:f54b:b0:1b8:92fc:7429 with SMTP id
 h11-20020a170902f54b00b001b892fc7429mr33762213plf.53.1693287128354; 
 Mon, 28 Aug 2023 22:32:08 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a170902c38600b001bdccf6b8c9sm8420874plg.127.2023.08.28.22.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 22:32:08 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com,
	mairacanal@riseup.net,
	jshargo@chromium.org
Subject: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Date: Tue, 29 Aug 2023 05:30:52 +0000
Message-ID: <20230829053201.423261-1-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
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
 linux-doc@vger.kernel.org, hirono@chromium.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mduggan@chromium.org, mripard@kernel.org,
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

Since V6:
========
rmdirs for documentation examples
fix crtc mask for writebacks

Since V5:
========
Fixed some bad merge conflicts and locking behaviours as well as
clarified some documentation, should be good to go now :)

Since V4:
========
Fixed up some documentation as suggested by Marius
Fixed up some bad locking as suggested by Marius
Small fixes here and there (most have email responses to previous chain
emails)

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
 drivers/gpu/drm/vkms/vkms_configfs.c  | 723 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c      | 102 ++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 206 +++++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 182 +++++--
 drivers/gpu/drm/vkms/vkms_output.c    | 404 ++++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c     |  44 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  42 +-
 11 files changed, 1514 insertions(+), 241 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

