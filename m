Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC3C3F41EE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F0689D40;
	Sun, 22 Aug 2021 22:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D0089CDF;
 Sun, 22 Aug 2021 22:20:19 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so31211693otf.6; 
 Sun, 22 Aug 2021 15:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vjgj6w+zbgn1146WXU3kPdkHix2wiSW7AS6QZB19vv0=;
 b=U1RHlD1xBGXU36FLOnv0uEdvjekxmddM94p1l4+8iCvPqWge47JtmbvBWn1D9qthN9
 ROAV55DeIpXnxg2d6w8rNYH12Gk+2nYASm/wLHpJQW3YThU7HyvkhVCw8TJEV7SlaSQ1
 Lt1IFjhnsCASv+agnyd8oApkjCOD1XVHVFvktAIkkf8mF+Yxe44bGWQJSajiOYmcmS4f
 AuVWSmaFDiKjJy0a2YgJokSc+CVT3uapEwtyfWieztoWxAK5tVYxk5rzZrxO2tVBlGsR
 Jt9cH1NpMfklUdB70zID5PkMUHRgdKanql0papRHm6ZxDMGXoTMIZeYl4sasDNfF0asM
 ihPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vjgj6w+zbgn1146WXU3kPdkHix2wiSW7AS6QZB19vv0=;
 b=ouSo/hJ13yN5LfATAXqmIZllzk/pQnQTgLdASkF9o/pOAWiDHWxn8OE3NNkCd0FZ9i
 eZhymz1Z7Y66KnDsz7ZkgRRlZooeYk0mXHd7+IR7wfg52KOHFqs9xjSqHYWyuy7cscQm
 VMXX1U5GOOXiMQbyZraSTvbtezu9AQN2K7FuBte7/kJ5lZXUAMiSmW4hOIyf0AzoEleo
 pP1G3w5UAjyllF1WQrUEVZkLVuK3f5R4T4FP+0GiZZpe7m/LbSwmjCk1rJYG6gIkeCGH
 aHkfh8gnTyClMDcupSRA0W4on+d/Oo5Y8jDoDH2nonfFA0PS6QKDOu5/+p668EasTjP3
 Mxpg==
X-Gm-Message-State: AOAM531hxObntu93rTL+0PqTUNsmP8Oz73357+FOmItZbBHV/DZ+xUMG
 5BmQuj5ix4V5MiGcgeWxDfs=
X-Google-Smtp-Source: ABdhPJz0eijJJyjUfIl7atjizNUf0pAk5ocAxfrb2CaKZtlQF2ggxgSMrsYBn+jo24OYrKUoUtTtcQ==
X-Received: by 2002:a9d:5f16:: with SMTP id f22mr24670188oti.322.1629670818575; 
 Sun, 22 Aug 2021 15:20:18 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 00/11] use DYNAMIC_DEBUG to implement DRM.debug
Date: Sun, 22 Aug 2021 16:19:58 -0600
Message-Id: <20210822222009.2035788-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset does 3 main things.

Adds DEFINE_DYNAMIC_DEBUG_CATEGORIES to define bitmap => category
control of pr_debugs, and to create their sysfs entries.

Uses it in amdgpu, i915 to control existing pr_debugs according to
their ad-hoc categorizations.

Plugs dyndbg into drm-debug framework, in a configurable manner.

v6: cleans up per v5 feedback, and adds RFC stuff:

- test_dynamic_debug.ko: uses tracer facility added in v5:8/9
- prototype print-once & rate-limiting

Hopefully adding RFC stuff doesnt distract too much.

Jim Cromie (11):
  moduleparam: add data member to struct kernel_param
  dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and callbacks
  i915/gvt: remove spaces in pr_debug "gvt: core:" etc prefixes
  i915/gvt: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to create "gvt:core:"
    etc categories
  amdgpu: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to control categorized
    pr_debugs
  drm_print: add choice to use dynamic debug in drm-debug
  drm_print: instrument drm_debug_enabled
  amdgpu_ucode: reduce number of pr_debug calls
  nouveau: fold multiple DRM_DEBUG_DRIVERs together
  dyndbg: RFC add debug-trace callback, selftest with it. RFC
  dyndbg: RFC add print-once and print-ratelimited features. RFC.

 drivers/gpu/drm/Kconfig                       |  13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 293 ++++++++-------
 .../gpu/drm/amd/display/dc/core/dc_debug.c    |  44 ++-
 drivers/gpu/drm/drm_print.c                   |  49 ++-
 drivers/gpu/drm/i915/gvt/Makefile             |   4 +
 drivers/gpu/drm/i915/gvt/debug.h              |  18 +-
 drivers/gpu/drm/i915/i915_params.c            |  35 ++
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  36 +-
 include/drm/drm_print.h                       | 148 ++++++--
 include/linux/dynamic_debug.h                 |  81 ++++-
 include/linux/moduleparam.h                   |  11 +-
 lib/Kconfig.debug                             |  11 +
 lib/Makefile                                  |   1 +
 lib/dynamic_debug.c                           | 336 ++++++++++++++++--
 lib/test_dynamic_debug.c                      | 279 +++++++++++++++
 15 files changed, 1117 insertions(+), 242 deletions(-)
 create mode 100644 lib/test_dynamic_debug.c

-- 
2.31.1

