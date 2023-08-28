Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3681578A779
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 10:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F39710E237;
	Mon, 28 Aug 2023 08:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF2010E237
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 08:19:36 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68a41031768so1962116b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 01:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693210776; x=1693815576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=STR53w+n0mJPUS4uOx0MPcYbGDkDAhQu6X8V6hhu27Q=;
 b=S24LFt6WlYrVzqeUL4nh3xmbWsnyGkUJqAEem1C7Qk/kT5nUKTbK4vNmKhFAgOI+Tl
 hWZHV0UMOJWWvIHGkW3NdY7WFGu9RI0d+MyvV+q4Qfhv6KIsXbuRfTElD0e7Zgkq2jMT
 CkdCudrLjNakMq/+nsWENnbiX0/4jmKqZaaa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693210776; x=1693815576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=STR53w+n0mJPUS4uOx0MPcYbGDkDAhQu6X8V6hhu27Q=;
 b=CVqsay4r7JWPAnEQ6e2CyWGA0jx2jVyN1Axhb2gVQuNpQbPeFiYxBn7dVY3ws75Pi1
 xMrsSzguGhtBq3DVzQM0xds5E1InNEBkGxkFcKdtsZfFruv3cDrNIeVaymRcjh5Y3akR
 BkCYG9iE47+PvDPLHkHy23vjhRWl7NY0GwgSKa3xgga6Z4+PyHaPL4D0HvMQt3hbt6Bq
 3XYAikEUX9v19/c5LbOTgjaQ4sJLTsN0gNx6cJ6VxlbrckYpJUK0so8ADD+mtasOxi+f
 16DtfypGQV8BJqzfHC9SZpR4ef6iEYJYJUqhoAm0nFujw6jq7oMlK5MlKwIqDu0qMLFI
 e3IA==
X-Gm-Message-State: AOJu0Yyd/SE1XvXGuIwIeiXfmd0eHIMLhEP7aVB0ukVsTHTwou8kzg+f
 2bqrHzTZUDONG0VuhLcamadjlA==
X-Google-Smtp-Source: AGHT+IEaiV2e0xU93hqGVaHiIRDf1PtqblBVu3uFJESa6ohyXbUNarKYwLxGAe5rxV0odjPaFdq6AA==
X-Received: by 2002:a05:6a20:7490:b0:13a:43e8:3fb8 with SMTP id
 p16-20020a056a20749000b0013a43e83fb8mr23789273pzd.54.1693210776264; 
 Mon, 28 Aug 2023 01:19:36 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a170902d91800b001bf6ea340b3sm6616779plz.116.2023.08.28.01.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 01:19:35 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com,
	mairacanal@riseup.net,
	jshargo@chromium.org
Subject: [PATCH v5 0/7] Adds support for ConfigFS to VKMS!
Date: Mon, 28 Aug 2023 08:17:02 +0000
Message-ID: <20230828081929.3574228-1-brpol@chromium.org>
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

Since V5:
========
Fixed some bad merge conflicts and locking behaviours as well as
clarified some documentation, should be good to go now :

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
 drivers/gpu/drm/vkms/vkms_configfs.c  | 721 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c      | 102 ++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 206 +++++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 182 +++++--
 drivers/gpu/drm/vkms/vkms_output.c    | 405 +++++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c     |  44 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  31 +-
 11 files changed, 1508 insertions(+), 235 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

-- 
2.42.0.rc1.204.g551eb34607-goog

