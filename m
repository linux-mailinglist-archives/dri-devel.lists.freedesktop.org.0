Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B10FB191B5
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A3310E1B9;
	Sun,  3 Aug 2025 03:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K0+Xm+JF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682CF10E05F;
 Sun,  3 Aug 2025 03:58:27 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3e3dbda56a5so9949935ab.2; 
 Sat, 02 Aug 2025 20:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193506; x=1754798306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DMLk2rTO/k/ZvCq5mpXv9xnm8IkxOQH6hbAYPKMfY2Y=;
 b=K0+Xm+JFzN6qMJAZ8501ZKzyAlTJP0u91Ju4KTpFK1c5rMboK56J9VlF5XBHFEpyXL
 5X9SKwUEtOXv159kMbuK6Ze8cxe3ZmxGJRal6Bp1RNUPeS3ylZKFkbgSmqya7SYC0eYB
 r7Ut50WdWEwKPXh/uGP6ivpsWoycNXlsF5kmIV+bK2/Xwnuwgmrq08E/mWU3x3yXPhuQ
 PtQZ/YdmLzRLJZIfCQd7pnkqWn58B8EjL6NcekFcTEFyiIQWuShvXbd8qanZC6gyBKzH
 uwxp43fW6jjnNOLnpgHcGQ2OVT+JVptRWZvqlsa6R9glgjUrsW5/RNVVftf/pll4jmy4
 xgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193506; x=1754798306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DMLk2rTO/k/ZvCq5mpXv9xnm8IkxOQH6hbAYPKMfY2Y=;
 b=NcGXwKaJB2+1Sugbx2x2YR+Uzfzja1LK+jqyNmxHOCghtqCyIDlk3X8nY3pvpAr7EL
 jD6WpEvQKRAn6iFDphvaKictzudgYXhLjNX9Ke4lKXumGp7MP9qGVxEzrDs6T3nPvpo7
 CgX+u/6hSOQzBbW6OO/eGioIodiIY+7bjwg+ZfvUZunkO6z6wnEh4qnp9ilG+qjKj6V1
 PCsP8c+IPPALeLClpEZd+qq/MXQLs1PJjMtDspUszNPNIyqr3UFqbz6Z3AM/KT0DndqY
 mjz68uOYpyrq58r71KqicFEgmtHR6cBp+Z8kbGTzcfOZs4zJjl2PrrnqPhJOoxwiJUsk
 QQBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKfcrIBut5zp/3POnHYR6M0FJBgv6cDyNwSuYxu5QcgSPXQRCi0WnDo1N610nGsPGCkkaJemXQ9vgbo4dASA==@lists.freedesktop.org,
 AJvYcCXsJ6GQ8x9MMJFq4+u0976E8BoaiNHJCJuIA/60L7HL+JmyJLR9ljFB8wgc5DMamHC/7D2tA7oTs028@lists.freedesktop.org,
 AJvYcCXuRUFnp+7sT0VuYbcL0bRX3hbVjaMrCj1rZm8xPaCbMDh7tfxWftdwzS0asZZUwYNJheA+WiW3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfdYlIO6w0/JLbe40HLtWo5oEDb4/fSL+36E9pflzbXJR+8vnc
 mWa2B6ZjPgVqFByyuecb3VT4lajouNceExVcojy4+Z5u0X7oE6HwNHry
X-Gm-Gg: ASbGncui/Ux4LCc+pAamB1kB6RTypODn4HOccoPvQADAGK1nLG0WEnsRL8DX5jrR/RW
 3xxlTMp/OsF9XHBFBWz46d4n7e0rTRk0Xqso2//bWlPAE4vOLSGRINoFb0DQCgHObko1YVp1B7l
 ma/+aSjFY4KJjNNrrZ17GhBak4RVlbcPNb74GedFetbeX8gOr1jqWlqcVKu/MJZuT/KAYSjmphc
 /wprzcPuzcVHdK6cxFS7zrGKtvwyWbszBupzL+7VxNJoIyNtpBMBp3sESWu3kjpDYcbdrIf4TVm
 ytFiXPzwSyCLfHKfOLamHMxmC7ddgnEN/bJFQr8H9OhdD9T3Sm58+hw1lYmt77jGIGT9LB84epA
 QTVjqnr2S85aFB8wZpCmpThs5S1JXqpke+qx34xzWBPpr3xeNNkMGwSTXPcSUTj8OxhRg0JBU9N
 oZd4Yp2yvjcfo/
X-Google-Smtp-Source: AGHT+IFDXWcxeK0ansnvS8D6N8J4pmENlNHFL9Jokjsm9G5CrdL7bnhQGMlEMGxcgihYNzJFEiflTg==
X-Received: by 2002:a92:c26c:0:b0:3e3:e78e:4dfd with SMTP id
 e9e14a558f8ab-3e41610ba62mr93262065ab.4.1754193506340; 
 Sat, 02 Aug 2025 20:58:26 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 00/58] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Date: Sat,  2 Aug 2025 21:57:18 -0600
Message-ID: <20250803035816.603405-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This series fixes dynamic-debug's support for DRM debug-categories.
Classmaps-v1 evaded full review, and got committed in 2 chunks:

  b7b4eebdba7b..6ea3bf466ac6    # core dyndbg changes
  0406faf25fb1..ee7d633f2dfb    # drm adoption

Then DRM-CI found a regression when booting with drm.debug=<initval>;
the callsites' static-keys under the drm-dbgs in drm.ko got enabled,
but those in drivers & helpers did not, since they weren't yet
modprobed, and didn't yet exist.

The fix is to retire DECLARE_DYNAMIC_DEBUG_CLASSMAP, and distinguish
DYNAMIC_DEBUG_CLASSMAP_USEs from _DEFINEs, then adjust the drivers to
_USE the CLASSMAP _DEFINEd by core drm.ko.  The _DEFINE exports the
classmap, the _USE refs it, adding a linkage dependency, just like
__drm_debug already does.

rev3 is here:
https://lore.kernel.org/lkml/20250402174156.1246171-1-jim.cromie@gmail.com/

changes since are minor:
 .rework several cleanup patches forward
 .code/doc/commit-msg tweaks for Louis Chauvet feedback.
 .refactor dyndbg dynamic-prefix to split TID from cacheable prefix
 .cflags for drivers/accel borrowing DRM.debug

Jim Cromie (58):
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: tweak pr_fmt to avoid expansion conflicts
  dyndbg: reduce verbose/debug clutter
  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: ddebug_table.mod_name down to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  selftests-dyndbg: add a dynamic_debug run_tests target
  dyndbg: change __dynamic_func_call_cls* macros into expressions
  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: drop "protection" of class'd pr_debugs from legacy queries
  dyndbg: restore classmap protection when theres a controlling_param
  docs/dyndbg: add classmap info to howto
  dyndbg: reserve flag-bit _DPRINTK_FLAGS_PREFIX_CACHED
  dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP for +mfsl flags
  dyndbg: refactor *dynamic_emit_prefix to split lookups
  drm: use correct ccflags-y spelling
  drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
  drm-dyndbg: adapt DRM to invoke DYNAMIC_DEBUG_CLASSMAP_PARAM
  drm-print: fix config-dependent unused variable
  drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
  drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
  drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
  drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
  drm-dyndbg: DRM_CLASSMAP_USE in nouveau
  drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
  drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
  drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
  drm-dyndbg: add DRM_CLASSMAP_USE to bochs
  drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
  drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
  drm-dyndbg: add DRM_CLASSMAP_USE to radeon
  drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
  drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
  drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
  drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the drm_gem_shmem_helper driver
  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
  amdxdna: add -DDYNAMIC_DEBUG_MODULE to cflags - RFC
  accel: add -DDYNAMIC_DEBUG_MODULE to subdir-cflags - RFC

 .../admin-guide/dynamic-debug-howto.rst       | 187 ++++-
 MAINTAINERS                                   |   3 +-
 drivers/accel/Makefile                        |   2 +
 drivers/accel/amdxdna/Makefile                |   2 +
 drivers/gpu/drm/Kconfig.debug                 |   1 -
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   1 +
 drivers/gpu/drm/drm_print.c                   |  38 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |   2 +
 drivers/gpu/drm/gma500/psb_drv.c              |   2 +
 drivers/gpu/drm/gud/gud_drv.c                 |   2 +
 drivers/gpu/drm/i915/i915_params.c            |  12 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 +
 drivers/gpu/drm/radeon/radeon_drv.c           |   2 +
 drivers/gpu/drm/sysfb/simpledrm.c             |   2 +
 drivers/gpu/drm/tiny/bochs.c                  |   2 +
 drivers/gpu/drm/udl/udl_main.c                |   2 +
 drivers/gpu/drm/virtio/virtgpu_drv.c          |   2 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +
 drivers/gpu/drm/xe/xe_drm_client.c            |   2 +
 include/asm-generic/vmlinux.lds.h             |   5 +-
 include/drm/drm_print.h                       |  12 +
 include/linux/dynamic_debug.h                 | 254 +++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   5 +
 lib/dynamic_debug.c                           | 679 +++++++++++-------
 lib/test_dynamic_debug.c                      | 203 ++++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 ++++++++++
 39 files changed, 1423 insertions(+), 508 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.50.1

