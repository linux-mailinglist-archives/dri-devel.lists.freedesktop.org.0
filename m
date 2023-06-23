Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B0173C404
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 00:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2D110E6CD;
	Fri, 23 Jun 2023 22:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EF810E6CD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 22:24:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fa798cf204so15474005e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687559069; x=1690151069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HCQm6L24JN7h7YAY5YLo/KLz+bCxV7q1iWuvA+ssee8=;
 b=McMM8qRf4LAPhKWB+qH1vWr0eILwaa28nZl4EwjAWZ5JKyWCc8F1KZlflgu6Fenu2z
 8p2L+NJkoq1mwTE13Ec9GlGjDot7H36L526dLhIaQv8q0/BLChNebSU4/0uceAIGt8Zi
 NKWhVtZ/polveq8TKpGBx8XRlKQR8ytpc3EzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687559069; x=1690151069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HCQm6L24JN7h7YAY5YLo/KLz+bCxV7q1iWuvA+ssee8=;
 b=MT1ezsVtviUuevboOjzhWUzQrmKz3fpibMVUdy5wVLbamO5TeaRX2wd0tcu3P7K5p9
 3BRr9uRaQs8PrCAPhp6im8p2SKdaSWEQF9kzLf0z3ymXzw72gQqu1rtDQpGLPWhKKrdm
 6onWxXb2t2ITntoEbQkkJnt/blIusRHnYPmLvieKR4OncsMh8lZHjil6A5ncmeoBImO5
 Vn50FqSNj8x3A30VOIEE3eKREltgqgNC02+aPwtw8mFE7z1lJEYHUve6iJpohoVY2PWn
 /7h4YLHlVOJ5gjqnOuxoNK9eG8c/Ies8QXZw4o6y9xczXBnf9bS42FwoqQGKa71gMkp/
 kNCw==
X-Gm-Message-State: AC+VfDzsZ8DVrMiygW+VRkxcjAbqgceyO34cIBqf/LFjVSQ15kZPBnZL
 ShLR+MaPu3C7CrTiPlQ5MI5wTg==
X-Google-Smtp-Source: ACHHUZ5i4VyTlmfKvSj9N4tKIp95whP30Srd/cZr5yJyHkGu1U/UsDNCUViF0aar0wPXbGemSw+J5w==
X-Received: by 2002:adf:e387:0:b0:30f:fec1:ac0f with SMTP id
 e7-20020adfe387000000b0030ffec1ac0fmr23653128wrm.36.1687559068747; 
 Fri, 23 Jun 2023 15:24:28 -0700 (PDT)
Received: from big-boopo.mynetworksettings.com
 (pool-108-46-233-209.nycmny.fios.verizon.net. [108.46.233.209])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4106000000b0030c2e3c7fb3sm453223wrp.101.2023.06.23.15.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 15:24:28 -0700 (PDT)
From: Jim Shargo <jshargo@chromium.org>
To: mairacanal@riseup.net, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/6] Adds support for ConfigFS to VKMS!
Date: Fri, 23 Jun 2023 18:23:42 -0400
Message-ID: <20230623222353.97283-1-jshargo@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
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
Cc: Jim Shargo <jshargo@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Intro
=====

At long last, we're back!

This patchset adds basic ConfigFS support to VKMS, allowing users to
build new DRM devices with user-defined DRM objects and object
relationships by creating, writing, and symlinking files.

Usage
=====

After installing these patches, you can create a VKMS device with two
displays and a movable overlay like so (this is documented in the
patches):

  $ modprobe vkms enable_overlay=1 enable_cursor=1 enable_writeback=1
  $ mkdir -p /config/
  $ mount -t configfs none /config

  $ export DRM_PLANE_TYPE_PRIMARY=1
  $ export DRM_PLANE_TYPE_CURSOR=2
  $ export DRM_PLANE_TYPE_OVERLAY=0

  $ mkdir /config/vkms/test

  $ mkdir /config/vkms/test/planes/primary
  $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type

  $ mkdir /config/vkms/test/planes/other_primary
  $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_primary/type

  $ mkdir /config/vkms/test/planes/cursor
  $ echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type

  $ mkdir /config/vkms/test/planes/overlay
  $ echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/type

  $ mkdir /config/vkms/test/crtcs/crtc
  $ mkdir /config/vkms/test/crtcs/crtc_other
  $ mkdir /config/vkms/test/encoders/encoder
  $ mkdir /config/vkms/test/connectors/connector

  $ ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connectors/connector/possible_encoders
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encoder/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/overlay/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/other_primary/possible_crtcs/

  $ echo 1 > /config/vkms/test/enabled

Changes within core VKMS
========================

This introduces a few important changes to the overall structure of
VKMS:

  - Devices are now memory managed!
  - Support for multiple CRTCs and other objects has been added

Since v1
========

  - Added DRMM memory management to automatically clean up resources
  - Added a param to disable the default device
  - Renamed "cards" to "devices" to improve legibility
  - Added a lock for the configfs setup handler
  - Moved all the new docs into the relevant .c file
  - Addressed as many of sean@poorly.run as possible

Testing
=======

  - New IGT tests (see
    gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/merge_requests/1)
  - Existing IGT tests (excluding .*suspend.*, including .*kms_flip.*
    .*kms_writeback.* .*kms_cursor_crc.*, .*kms_plane.*)

Outro
=====

I'm excited to share these changes, it's my still my first kernel patch
and I've been putting a lot of love into these.

Jim Shargo (6):
  drm/vkms: Back VKMS with DRM memory management instead of static
    objects
  drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device
  drm/vkms: Provide platform data when creating VKMS devices
  drm/vkms: Add ConfigFS scaffolding to VKMS
  drm/vkms: Support enabling ConfigFS devices
  drm/vkms: Add a module param to enable/disable the default device

 Documentation/gpu/vkms.rst            |  17 +-
 drivers/gpu/drm/Kconfig               |   1 +
 drivers/gpu/drm/vkms/Makefile         |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c  |  28 +-
 drivers/gpu/drm/vkms/vkms_configfs.c  | 657 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c      |  97 ++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 208 +++++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 166 +++++--
 drivers/gpu/drm/vkms/vkms_output.c    | 299 ++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c     |  44 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  26 +-
 11 files changed, 1312 insertions(+), 232 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

-- 
2.41.0.162.gfafddb0af9-goog

