Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05B5AC6B6
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E42510E12D;
	Sun,  4 Sep 2022 21:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C912D10E010;
 Sun,  4 Sep 2022 21:41:59 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id k2so3867452ilu.9;
 Sun, 04 Sep 2022 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Rk0v3z6nbpdvu88IImrHMGbLoUUPdnPRh/3Godzt1FA=;
 b=J2j1esbki5TiJj8l6H2Q6c2JHxiCFaB7O6YGdT/pn7Ag+2yqvlGJJweNSqogG5zEb3
 diZzFKrda46JEN7PyM8gc/0Xahl4bAs5OoUt1yopJui7ZMfGo//PDQeA59ddFWxzg3vz
 gqvfrHJ06LSDXQQTH322kmGT2t5nLF5iYUtCtLULrNzzZclYuwWFMpEPMJNuuaJz2f5E
 KlO5OmjsdjFozKTAmalEqVDHQzJH1gBZ4o6kAqUA0n3MRbhARGj+Pg2J3y5bONpqxZMN
 9gxyQ4asUPXvVEsUeYypcYKMsqMw/Nl60eI1KOPpWsEPBmGHn30hJUDfnigMHVwuBZIX
 6LBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Rk0v3z6nbpdvu88IImrHMGbLoUUPdnPRh/3Godzt1FA=;
 b=LRf12Rx0wnojkkQPoOTGpOgpZeqpTdlovBLIzbba7+ETDQGi0akLp4rY3f44hax0xi
 JRP4Qr9Q6FRFgw9YBMy7cdAFsvBal4kPv4YpIXiBNHfKAqBloNF6iEXur15wYVLM1zj3
 E88MA2Bf5qNOPq0GdZiQx8EtYKmwAJWRHQgziu5NyCcghZGSwbklGidIfvKGMZAzeo/F
 HU4jOp0BdWjaCE5B5D+1b5a9h2LGwbUIdcsq9sSb2ykNOX19kff0E+O/zj+HHeMevMST
 91Elct/tJowb0i5H4FySgRLK0/LKHVrvNp+yoN7pm8dq2O/p/bL7gqPH1LOWa1LsbWJf
 Y4tA==
X-Gm-Message-State: ACgBeo2QniuxEuw1T3TtILtKhYgRN5dA35pr61havREbwdDXaanobYpT
 pkg2N/rybc86hpBiguFTDEU=
X-Google-Smtp-Source: AA6agR7CD92JSdC+7MhP3s0TXTkBFP2IYi9ja006MgU6Xo9IdJnxicAEFaNporcaAvAi1/sbjpYAow==
X-Received: by 2002:a05:6e02:543:b0:2eb:5d3c:dde6 with SMTP id
 i3-20020a056e02054300b002eb5d3cdde6mr12602343ils.84.1662327719085; 
 Sun, 04 Sep 2022 14:41:59 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:41:58 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/57] DYNDBG: opt-in class'd debug for modules, use in drm.
Date: Sun,  4 Sep 2022 15:40:37 -0600
Message-Id: <20220904214134.408619-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Greg, Jason, DRM-folk, Steven,

If Im not too late for linux-next in this cycle, heres V6.  Diffs are minor:

 - rebased onto e47eb90a0a9a (tag: next-20220901, linux-next/master)
   gets past Kconfig conflict, same for drm-tip.
 - uint debug_level, not ulong.  to fit nouveau.
 - -1 on param-read-back, to match prev write val.
 - added back tracefs parts, missing from -V5
   updated for tracing/events: Add __vstring() and __assign_vstr() helper macros
   no decorations-lite in TP_printk, do it right later.
 - commit-msg tweaks

Theres also new RFC stuff with the potential to reduce the size of the
__dyndbgs section by 20%.  Not ready for prime time, or linux-next,
but I hope compelling.

FEATURE DESCRIPTION

dyndbg provides DECLARE_DYNAMIC_DEBUG_CLASSMAP() which allows module
authors to declare "good" class-names, of 4 types.

  DYNAMIC_DEBUG_CLASSMAP(drm_debug_classes,
  			DD_CLASS_TYPE_DISJOINT_BITS, offset,
                        "DRM_UT_CORE",
                        "DRM_UT_DRIVER",
                        "DRM_UT_KMS",
                        "DRM_UT_PRIME",
                        "DRM_UT_ATOMIC",
                        "DRM_UT_VBL",
                        "DRM_UT_STATE",
                        "DRM_UT_LEASE",
                        "DRM_UT_DP",
                        "DRM_UT_DRMRES");

That usage authorizes dyndbg to set class'd pr_debugs accordingly:

  echo class DRM_UT_CORE +p > /proc/dynamic_debug/control
  echo class DRM_UT_KMS  +p > /proc/dynamic_debug/control

Because the DRM modules declare the same classes, they each authorize
dyndbg with the same classnames, which allows dyndbg to effect changes
to its selected class'd prdbgs.

Opting in by using the macro effectively privatizes the limited
63-classes available per module; only modules which share classnames
must coordinate their use of the common range, and they can
independently use the remaining id-space.

Other dyndbg filtering pertains too, so single sites can be selected.


4 DD_CLASS_TYPE_*_*s determine 2 behaviors:

  DISJOINT	bits are independent, like drm.debug categories
  LEVELs	3>2, turns on level-2, like nouveau debug-levels
  NUM/BITS	numeric input, bitmap if disjoint, else 0-32.
  NAMES		accept proper names, like DRM_UT_CORE

Dyndbg provides param-callbacks which enforce those behaviors:

  # DISJOINT_BITS
  echo 0x03 > /sys/module/drm/parameters/debug

  # LEVEL_NUM
  echo 3 > /sys/module/drm/nouveau/debug-mumble*

  # DISJOINT_NAMES
  echo +DRM_UT_CORE,+DRM_UT_KMS,-DRM_UT_DRIVER > /sys/module/drm/parameters/debug_categories

  # LEVEL_NAMES
  echo NV_TRACE > /sys/module/nouveau/parameters/debug-mumble*

That design choice is allowed cuz verbosity is always attached to a
(user visible) interface, and theres no reason not to put the
implementation there (in the callback).  It also considerably
simplifies things; ddebug_change can treat class_id's as disjoint,
period.


Jim Cromie (57):
prep:
  dyndbg: fix static_branch manipulation
  dyndbg: fix module.dyndbg handling
  dyndbg: show both old and new in change-info
  dyndbg: reverse module walk in cat control
  dyndbg: reverse module.callsite walk in cat control
  dyndbg: use ESCAPE_SPACE for cat control
  dyndbg: let query-modname override actual module name
  dyndbg: add test_dynamic_debug module
  dyndbg: drop EXPORTed dynamic_debug_exec_queries
  dyndbg: cleanup auto vars in dynamic_debug_init
  dyndbg: gather __dyndbg[] state into struct _ddebug_info

class feature:
  dyndbg: add class_id to pr_debug callsites
  dyndbg: add __pr_debug_cls for testing
  dyndbg: add DECLARE_DYNDBG_CLASSMAP macro
  kernel/module: add __dyndbg_classes section
  dyndbg: add ddebug_attach_module_classes
  dyndbg: validate class FOO by checking with module
  doc-dyndbg: describe "class CLASS_NAME" query support
  doc-dyndbg: edit dynamic-debug-howto for brevity, audience
  dyndbg: add drm.debug style (drm/parameters/debug) bitmap support
  dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes

drm-use-case:
  drm_print: condense enum drm_debug_category
  drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.
  drm_print: interpose drm_*dbg with forwarding macros
  drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro
  drm-print.h: include dyndbg header
  drm-print: add drm_dbg_driver to improve namespace symmetry
  drm_print: refine drm_debug_enabled for jump-label
  drm_print: prefer bare printk KERN_DEBUG on generic fn
  drm_print: add _ddebug descriptor to drm_*dbg prototypes
  nouveau: change nvkm_debug/trace to use dev_dbg POC
  nouveau: adapt NV_DEBUG, NV_ATOMIC to use DRM.debug
  nouveau: WIP add 2 LEVEL_NUM classmaps for CLI, SUBDEV

dyndbg-tracefs:
  dyndbg: add _DPRINTK_FLAGS_ENABLED
  dyndbg: add _DPRINTK_FLAGS_TRACE
  dyndbg: add write-events-to-tracefs code
  dyndbg: add 2 trace-events: drm_debug, drm_devdbg
  dyndbg: add 2 more trace-events: pr_debug, dev_dbg
  dyndbg/drm: POC add tracebits sysfs-knob

RFC-20%-data-reclaim:
  dyndbg: abstraction macros for modname,function,filename fields
  dyndbg: split repeating columns to new struct _ddebug_site
  dyndbg: shrink lineno field by 2 bits
  dyndbg: add _index,_map to struct _ddebug
  dyndbg: extend __ddebug_add_module proto to allow packing sites
  dyndbg: de-duplicate sites
  dyndbg: drop site-> in add-module, more needed
  dyndbg: demote iter->site in _init
  dyndbg: add .gnu.linkonce slot in vmlinux.lds.h KEEPs
  dyndbg: add structs _ddebug_hdr, _ddebug_site_hdr
  dyndbg: count unique callsites
  dyndbg: prevent build bugs via -DNO_DYNAMIC_DEBUG_TABLE
  dyndbg: add DEFINE_DYNAMIC_DEBUG_TABLE, use it tacitly RFC
  dyndbg: add/use is_dyndbg_header then set _uplink
  dyndbg: add .gnu.linkonce. & __dyndbg* sections in module.lds.h
  dyndbg: dynamic_debug_sites_reclaim() using free_reserved_page() WAG
  dyndbg: work ddebug_map_site
  dyndbg: fiddle with readback value on LEVEL_NAMES types

 .../admin-guide/dynamic-debug-howto.rst       | 249 +++---
 MAINTAINERS                                   |   2 +
 arch/arm/boot/compressed/Makefile             |   2 +
 arch/sparc/vdso/Makefile                      |   2 +
 arch/x86/boot/compressed/Makefile             |   1 +
 arch/x86/entry/vdso/Makefile                  |   3 +
 arch/x86/purgatory/Makefile                   |   1 +
 drivers/firmware/efi/libstub/Makefile         |   3 +-
 drivers/gpu/drm/Kconfig                       |  12 +
 drivers/gpu/drm/Makefile                      |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  14 +
 drivers/gpu/drm/display/drm_dp_helper.c       |  13 +
 drivers/gpu/drm/drm_crtc_helper.c             |  13 +
 drivers/gpu/drm/drm_print.c                   |  83 +-
 drivers/gpu/drm/i915/i915_params.c            |  12 +
 .../gpu/drm/nouveau/include/nvkm/core/debug.h |  16 +
 .../drm/nouveau/include/nvkm/core/subdev.h    |  17 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  20 +
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  16 +-
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c    |  23 +
 include/asm-generic/module.lds.h              |  12 +-
 include/asm-generic/vmlinux.lds.h             |  10 +
 include/drm/drm_print.h                       |  85 +-
 include/linux/dynamic_debug.h                 | 286 ++++++-
 include/trace/events/drm.h                    |  54 ++
 include/trace/events/dyndbg.h                 |  73 ++
 kernel/module/internal.h                      |   4 +-
 kernel/module/main.c                          |  22 +-
 lib/Kconfig.debug                             |  10 +
 lib/Makefile                                  |   1 +
 lib/dynamic_debug.c                           | 792 +++++++++++++++---
 lib/test_dynamic_debug.c                      | 165 ++++
 32 files changed, 1680 insertions(+), 338 deletions(-)
 create mode 100644 include/trace/events/drm.h
 create mode 100644 include/trace/events/dyndbg.h
 create mode 100644 lib/test_dynamic_debug.c

-- 
2.37.2

