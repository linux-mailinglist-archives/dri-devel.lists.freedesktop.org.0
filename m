Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B106A57FA17
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 09:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929AB113151;
	Mon, 25 Jul 2022 07:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36B593E0F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 21:50:03 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id l14so4473846qtv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 14:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lY5HwzJY1HkC64NTT7rUzz8AV8+0iYgX1A3GOOVUboY=;
 b=gGSSMB3IuQ03GboemI4CuYy3gKQ3itbdhDripv2Bf+5aLkKcbxEm9Jnu1zZXTRqono
 TXJSA1bwkt2PbWgNi5oXyZ1jbxHwdKSM9vFC2pDtqwsX9sJ2+RAPB8rYGSyCHM9B+2KE
 /aw+T4CksZacPn6Na5E9FJpGS9Hc5wZbMmyz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lY5HwzJY1HkC64NTT7rUzz8AV8+0iYgX1A3GOOVUboY=;
 b=6XPoy8Nf+2sggKzUW4gnRnrWDFLXfRRKee6rgYZdcTE7dyK9tV81PpV3mbDLgJrXrz
 YhkjYhyzziXSIIPR05mB1s1wwvt8GO8IVfnc5QW/4TaJFwXsq82bhWmAwPfGhc+KpJRh
 CM3BLN6bXOvdgXS5oBpuIkKwu6WkzmU6dDUaiA/tAWJgKuMk2hkpa013cYzglyKzMTni
 AS20ljYa8ckCOGuMMhSuYGKMtOkJhqlVPCz28X19+TDFLOoV9xONJsCAjoaxM8s0bLF5
 xSsXOvqV2rO+fMWJgOD2Kl24c+1KDH+VrUDzg7MxYN4FKJJNnuJ201rJVc1i946sdQmL
 kjoA==
X-Gm-Message-State: AJIora+2/572D9G0pHxOueJlnkxxLJYvSLltIUPYlgB9z2qLWPjAd9rI
 PCzWqLzW0FdFStMOBkGHhVYOhQ==
X-Google-Smtp-Source: AGRyM1t0bg10Rc1JMRJaH05Q/CdwawRrdAHKfoEN8GtAxOYBq6POcf0qA1/DpBwWt1/i1yyXyEb5Mw==
X-Received: by 2002:ac8:5e0d:0:b0:31f:239c:99c6 with SMTP id
 h13-20020ac85e0d000000b0031f239c99c6mr1969906qtx.189.1658526602771; 
 Fri, 22 Jul 2022 14:50:02 -0700 (PDT)
Received: from jshargo (pool-108-14-42-16.nycmny.fios.verizon.net.
 [108.14.42.16]) by smtp.gmail.com with ESMTPSA id
 h22-20020ac87156000000b0031ef622a6a2sm3399575qtp.17.2022.07.22.14.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 14:50:02 -0700 (PDT)
From: Jim Shargo <jshargo@chromium.org>
To: jshargo@google.com, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/5] drm/vkms: Add ConfigFS Support
Date: Fri, 22 Jul 2022 17:50:01 -0400
Message-Id: <20220722215001.1380608-1-jshargo@chromium.org>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Jul 2022 07:23:20 +0000
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
Cc: Jim Shargo <jshargo@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Intro
=====

This patchset adds basic ConfigFS support to VKMS, allowing users to
build new DRM devices with user-defined DRM objects and object
relationships by creating, writing, and symlinking files.

Usage
=====

Modprobe VKMS and mount ConfigFS:

  $ mkdir -p /config/; mount -t configfs
  $ modprobe vkms enable_overlay=1 enable_cursor=1 enable_writeback=1

This will create a `/config/vkms` directory, where users may create
new VKMS devices. The standard default device is still created, so
existing use-cases should be unaffected.

Creating a new device happens in three stages:

  1) Create a new directory to represent a new device:
       $ mkdir /config/vkms/dev

  2) Populate the new device with crtcs, planes, connectors, encoders,
     and CRTCs by mkdir'ing in the appropriate directories. Connect the
     objects via symlinks.

  3) To register the device:
       $ echo 1 > /config/vkms/dev/is_registered

If the write is successful, you have a new VKMS device ready to use!

See the updated vkms.rst for more details and a full example.

Changes within VKMS
===================

The most meaningful change within VKMS is the introduction of a list
of "cards" representing individual virtual drivers. Each card
maintains its own devices, arrays of objects, and output/writeback
machinery.

Until cards are registered, all of their data lives in within the
ConfigFS tree. Only during registration do we interface with DRM at
all to create the device.

Due to limitations with ConfigFS, the default device is a special
case, without all of the objects represented in its ConfigFS
directory.

Testing
=======

Suspend tests are not working in my VM, so I skipped those. Otherwise,
here are the tests that I have been running:

  $ igt-gpu-tools/scripts/run-tests.sh -x ".*suspend.*" \
        -t ".*kms_flip.*" \
        -t ".*kms_writeback.*" \
        -t ".*kms_cursor_crc*" \
        -t ".*kms_plane.*"

I've observed no changes between passed/failed tests before and after
my changes on the default device.

IGT revision: eddc67c5c85b8ee6eb4d13752ca43da5073dc985

I'll also note that I've been working on a VKMS test suite in IGT that
exercises the new ConfigFS behavior, and that it's a work-in-progress.

Future Work
===========

This should be the biggest and most invasive change in VKMS to make it
more configurable and able to mimic real devices. That said, it should
serve as a basis for additional useful features, including:

  - Simulating hot-plugging by keeping the connectors directory live
    and allowing users to add/remove connectors after the device is
    registered.
  - Additional properties could be turned on and off, or tuned, based
    on files within object directories. For instance, GAMMA/DEGAMMA
    LUT sizes could be configurable per-device, or support for
    individual formats could be turned on and off.

Additional Notes
================

This is my first kernel patchset, and though I've had it reviewed by
my team (with a lot of of kernel/drm expertise), I recommend reading
it with a bit of extra scrutiny. As you can tell by the fact this
didn't get mailed with the other patches :P.

Thanks!

Jim Shargo (5):
  drm/vkms: Merge default_config and device
  drm/vkms: VKMS now supports more than one "card"
  drm/vkms: Support multiple objects (crtcs, etc.) per card
  drm/vkms: Add ConfigFS scaffolding to VKMS
  drm/vkms: Support registering configfs devices

 Documentation/gpu/vkms.rst            |  76 ++++
 drivers/gpu/drm/Kconfig               |   1 +
 drivers/gpu/drm/vkms/Makefile         |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c  |  28 +-
 drivers/gpu/drm/vkms/vkms_configfs.c  | 546 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c      |  88 +++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 204 ++++++----
 drivers/gpu/drm/vkms/vkms_drv.h       | 173 ++++++--
 drivers/gpu/drm/vkms/vkms_output.c    | 335 +++++++++++++---
 drivers/gpu/drm/vkms/vkms_plane.c     |  43 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  27 +-
 11 files changed, 1288 insertions(+), 234 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

-- 
2.37.1.359.gd136c6c3e2-goog

