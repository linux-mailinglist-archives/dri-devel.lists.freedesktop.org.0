Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B16E7CE35C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AC210E3F8;
	Wed, 18 Oct 2023 17:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC310E3D8;
 Wed, 18 Oct 2023 17:06:10 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-79fd60f40ebso175701639f.1; 
 Wed, 18 Oct 2023 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648769; x=1698253569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iDIMi3YYxbivuzog7Wd3D25OWadKQ7tl2Cz/eAegiFA=;
 b=WzxzZPSYMqQXXG2Pq5EEFfzd1Y84K35hy3lU+Mu2m80Rqr5hj4t2viMflp+/EH1T34
 Dha5J+H3LJ3lfHxxCzfV2MUKons30VYRRvL6Z3sJWf/iHH8bM8AFdMKKo0ygLO6nnltq
 b5YTyk9Qd3DDYO2kmVZO1AcTSPavj9dSBpwsilLwHgugOeQ+eWbselxIe9y63UXSekvk
 84wjRytafMwKbZ6zZQMy452U8spQxFx9OuydbMLqNHS3PMsyZ/KHxCd/YRGdADZdM0q6
 OLAMy84VYHkblB7s4VO4nyJIvC8FXk75etNOkwiVkXg955oh+R0gK7+5FWSE2fcOdmcD
 okwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648769; x=1698253569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iDIMi3YYxbivuzog7Wd3D25OWadKQ7tl2Cz/eAegiFA=;
 b=eed+sGyGiMb9K+NGID+YbaFRzda53+QiVVT1BP53Vwa+NbiOWmf170mNY09YXSBvW9
 1C/QASa0pjv0egVGsxVOdcoW9UwysulqQPHEkIXpsPpthsDqxDHY6UPJSELo+Owvf1QT
 QYfaunQC2vsBYuiHnbvncn1RjekjFQCZnb8St8I3wfuW63uUfrFWei9FRQt5wq5Xnb8G
 jLQGxNFYBIqVPuJkWVWyg8l8FbjxRUi6xAEdE1VNLxKOy7c8hNLB71mKa0LJkMjxorQS
 0ng5FNqg8QEyAro403uQlLdi+dnzNNFt7s2HoYpp0ktacWL+o94pcbVtyYyw3kYhLPJx
 VP7w==
X-Gm-Message-State: AOJu0Yy0GmMaML6LlRCPdIsAay85UI6lpnfG3bDNAwF0vaUCpOzvZNHN
 L2whKvGythkTDdj23F3hh/g=
X-Google-Smtp-Source: AGHT+IHY3fLMgmqD0vaBDzNlt6Ab/WZIlFd+GwQzZq5a5ZGq5Q1cMEKfoCxtDKcSakkNW79Pxr+XDw==
X-Received: by 2002:a05:6602:158d:b0:785:d5d4:9f26 with SMTP id
 e13-20020a056602158d00b00785d5d49f26mr5816215iow.9.1697648769301; 
 Wed, 18 Oct 2023 10:06:09 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:08 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 00/24] fix DRM_USE_DYNAMIC_DEBUG=y regression
Date: Wed, 18 Oct 2023 11:05:40 -0600
Message-ID: <20231018170604.569042-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


hi Jason, DRM-folk

(v7c now with all checkpatch fixes)

This patchest fixes the chicken-egg initialization problem in the 1st
version of ddebug-class-maps, that DRM-CI uncovered.

The root-problem was DECLARE_DYNDBG_CLASSMAP, which broke the K&R rule:
"define once, refer many".  In patch 14 it is replaced by:

 DYNDBG_CLASSMAP_DEFINE - define and export a struct ddebug_class_map
 DYNDBG_CLASSMAP_USE - ref the exported struct

test-dynamic-debug is also extended with a -submod.ko, in order to
recapitulate the drm & drivers initialization scenario.

They're on v6.6-rc6 now, and recently applied cleanly to drm-tip/drm-tip.

Ive been running recent revs on rc3+, on my desktop and laptop.

The final blocker was a missing __align(8) on the ddebug_class_user
record inserted by DYNDBG_CLASSMAP_USE.  This caused DRM=y (builtin
only) to have a corrupt record for drm_kms_helper (a builtin dependent).
Curiously, a clang build did not exhibit this problem.

Heres a part of dmesg, for a DRM=y kernel, booted with
     dynamic_debug.verbose=3 drm.debug=0x10

[    0.466747] dyndbg: add-module: drm 406 sites
[    0.467569] dyndbg: classes[0]: module:drm base:0 len:10 type:DISJOINT_BITS
[    0.467743] dyndbg: module:drm attached 1 classes
[    0.468557] dyndbg: builtin class: module:drm base:0 len:10 type:DISJOINT_BITS
[    0.468742] dyndbg:  found kp:drm.debug =0x10
[    0.468743] dyndbg:   mapped to: module:drm base:0 len:10 type:DISJOINT_BITS
[    0.469742] dyndbg:   drm.debug: classbits: 0x10
[    0.470573] dyndbg: apply bitmap: 0x10 to: 0x0 for drm
[    0.470743] dyndbg: query 0: "class DRM_UT_ATOMIC +p" mod:drm
[    0.471743] dyndbg: split into words: "class" "DRM_UT_ATOMIC" "+p"
[    0.472743] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[    0.473679] dyndbg: parsed: func="" file="" module="drm" format="" lineno=0-0 class=DRM_UT_ATOMIC
[    0.473749] dyndbg: processed 1 queries, with 0 matches, 0 errs
[    0.474742] dyndbg: bit_4: 0 matches on class: DRM_UT_ATOMIC -> 0x10
[    0.475742] dyndbg: applied bitmap: 0x10 to: 0x0 for drm
[    0.476686] dyndbg: 406 debug prints in module drm
[    0.476743] dyndbg: add-module: drm_kms_helper 93 sites
[    0.477727] dyndbg: class_ref[0] drm_kms_helper -> drm module:drm base:0 len:10 type:DISJOINT_BITS
[    0.477743] dyndbg: builtin class: module:drm base:0 len:10 type:DISJOINT_BITS
[    0.478742] dyndbg:  found kp:drm.debug =0x10
[    0.478743] dyndbg:   mapped to: module:drm base:0 len:10 type:DISJOINT_BITS
[    0.479743] dyndbg:   drm.debug: classbits: 0x10
[    0.480592] dyndbg: apply bitmap: 0x10 to: 0x0 for drm_kms_helper
[    0.480743] dyndbg: query 0: "class DRM_UT_ATOMIC +p" mod:drm_kms_helper
[    0.481743] dyndbg: split into words: "class" "DRM_UT_ATOMIC" "+p"
[    0.482743] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[    0.483743] dyndbg: parsed: func="" file="" module="drm_kms_helper" format="" lineno=0-0 class=DRM_UT_ATOMIC
[    0.484750] dyndbg: class-ref: drm_kms_helper.DRM_UT_ATOMIC  module:drm_kms_helper nd:93 nc:0 nu:1
[    0.485809] dyndbg: processed 1 queries, with 44 matches, 0 errs
[    0.486742] dyndbg: bit_4: 44 matches on class: DRM_UT_ATOMIC -> 0x10
[    0.487742] dyndbg: applied bitmap: 0x10 to: 0x0 for drm_kms_helper
[    0.488743] dyndbg: attach-client-module:  module:drm_kms_helper nd:93 nc:0 nu:1
[    0.489742] dyndbg:  93 debug prints in module drm_kms_helper

Widespread testing is appreciated.
I have scripts if anyone wants them.
lkp-robot reported success on dd-fix-7b, no report yet on 7c

Patches are also at https://github.com/jimc/linux/tree/dd-fix-7c

Jim Cromie (24):
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: replace classmap list with a vector
  dyndbg: ddebug_apply_class_bitmap - add module arg, select on it
  dyndbg: split param_set_dyndbg_classes to module/wrapper fns
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: reduce verbose/debug clutter
  dyndbg: silence debugs with no-change updates
  dyndbg: tighten ddebug_class_name() 1st arg type
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: reduce verbose=3 messages in ddebug_add_module
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  dyndbg-API: fix CONFIG_DRM_USE_DYNAMIC_DEBUG regression
  dyndbg: refactor ddebug_classparam_clamp_input
  dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
  dyndbg-doc: add classmap info to howto
  dyndbg: reserve flag bit _DPRINTK_FLAGS_PREFIX_CACHED
  dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP
  dyndbg: refactor *dynamic_emit_prefix
  dyndbg: change WARN_ON to WARN_ON_ONCE
  drm: use correct ccflags-y spelling
  drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN

 .../admin-guide/dynamic-debug-howto.rst       |  60 ++-
 MAINTAINERS                                   |   2 +-
 drivers/gpu/drm/Kconfig                       |   3 +-
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +
 drivers/gpu/drm/drm_print.c                   |  35 +-
 drivers/gpu/drm/gud/gud_drv.c                 |   2 +
 drivers/gpu/drm/i915/i915_params.c            |  12 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 +
 drivers/gpu/drm/radeon/radeon_drv.c           |   2 +
 drivers/gpu/drm/udl/udl_main.c                |   2 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +
 include/asm-generic/vmlinux.lds.h             |   1 +
 include/drm/drm_print.h                       |  12 +-
 include/linux/dynamic_debug.h                 | 121 +++--
 kernel/module/main.c                          |   3 +
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   3 +
 lib/dynamic_debug.c                           | 458 +++++++++++-------
 lib/test_dynamic_debug.c                      | 131 ++---
 lib/test_dynamic_debug_submod.c               |  17 +
 27 files changed, 584 insertions(+), 365 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

-- 
2.41.0

