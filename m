Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E867C9072
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF4010E077;
	Fri, 13 Oct 2023 22:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E610010E071;
 Fri, 13 Oct 2023 22:48:30 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3573e6dd79bso9362365ab.2; 
 Fri, 13 Oct 2023 15:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237310; x=1697842110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Mng0G0MZHQ5iG3ZlpwMZtpDxjZVpA+nf77+wmyN2nk=;
 b=IZdIajVWnp0jocQGRgx9QrV2BaD7c+xlCMkiSEppqQfdipBjcmuoinFY9WJu50wl2f
 gnKyS9BvKOpHa66oHhlNXOAaDl+p4ch7LXvy8v0I1tMjjCBwtNk16glX6kKcWtE6kXqy
 PqjQhB1cFt6uJ2eEAz+MW22L48duNsAP5nusfCZB9Cdj/DThy9kKmPfs7g8Ol8i7pKfJ
 M+AWw7XJVBTZNcI15jR9KxZRRu2CEVCabqDqH/rZhhOog7y/1I81HWmr85Fdn4hMTeJv
 y0tHwAmcbu7W+S8dJM9bIZ4hdYqQs4dNM2CRPR07MSGFhnZWmdt1B9bsW8pxDcuqcKQx
 GY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237310; x=1697842110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Mng0G0MZHQ5iG3ZlpwMZtpDxjZVpA+nf77+wmyN2nk=;
 b=wNc0+KKhTrv9vXcb6cJHM1nfwIxO6IdixoJ2TM5zSIsS5iQ8HdOvWQmfIt1Ru5PbEq
 KJVVuLU7DK9NoNkGDSj57ZEE+ee1Fe+AqcGRey6JoA1mCaZm5rdwJe+p6vqiggMGH7Gi
 bKkW+qfNH6mwMCMw8+u9K0NZFIcQlvDlw4vRZ7YhSCkOiaG9LjSQbwGMZIhxb9mF+Cqj
 OfCH+wj9KAzhhw1YC2sSekZhRcXL4Hd62biQ21qf1UbdeF0vZdwZHJSAPVxNZJ6+Jtep
 D5I3YQvG8rvWk3qrf153m7SQt6khpzckctT5aVypC2Mtl1tDFL9OBtR4KUKF3N+sHdsZ
 h1jg==
X-Gm-Message-State: AOJu0YzUMAwNNh+sOCe7aeRztlYofH4qj5rS1e+Qc82iJ2sT+1eXSENh
 A4xqc1pOqvL9t+LwVwWOvLg=
X-Google-Smtp-Source: AGHT+IG+I25uvqNU5DZMw47ZwGEBEd5TljGGiNjhM3n4cZrTiK6lXr5EVFKspt/gyJ2MjEBfwcoK7w==
X-Received: by 2002:a05:6e02:b22:b0:357:5b51:ae6c with SMTP id
 e2-20020a056e020b2200b003575b51ae6cmr5877260ilu.6.1697237310091; 
 Fri, 13 Oct 2023 15:48:30 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 00/25] fix DRM_USE_DYNAMIC_DEBUG=y regression
Date: Fri, 13 Oct 2023 16:47:52 -0600
Message-ID: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Jason, DRM-folk

(now with checkpatch fixes)

This patchest fixes the chicken-egg initialization problem in the 1st
version of ddebug-class-maps, that DRM-CI uncovered.

The root-problem was DECLARE_DYNDBG_CLASSMAP, which broke the K&R rule:
"define once, refer many".  In patch 14 it is replaced by:

 DYNDBG_CLASSMAP_DEFINE - define and export a struct ddebug_class_map
 DYNDBG_CLASSMAP_USE - ref the exported struct

test-dynamic-debug is also extended with a -submod.ko, in order to
recapitulate the drm & drivers initialization scenario.

They're on v6.6-rc5 now, and apply cleanly to drm-tip/drm-tip.

Ive been running recent revs on rc3+, on my desktop and laptop.

The final blocker was a missing __align(8) on the ddebug_class_user
record inserted by DYNDBG_CLASSMAP_USE.  This caused DRM=y (builtin
only) to have a corrupt record for drm_kms_helper (builtin dependent).
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

I'll forward lkp-robot reports here when I get them.
Patches also at https://github.com/jimc/linux (dd-fix-7b)


Jim Cromie (25):
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
  dyndbg: add for_each_boxed_vector
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
 lib/dynamic_debug.c                           | 460 +++++++++++-------
 lib/test_dynamic_debug.c                      | 131 ++---
 lib/test_dynamic_debug_submod.c               |  17 +
 27 files changed, 586 insertions(+), 365 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

-- 
2.41.0

