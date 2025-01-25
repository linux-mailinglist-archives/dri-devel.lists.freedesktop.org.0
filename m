Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB9A1C1B3
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE8110EAA6;
	Sat, 25 Jan 2025 06:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b9hIvNrs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E7510EA9E;
 Sat, 25 Jan 2025 06:47:45 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3cf880d90bdso10176905ab.3; 
 Fri, 24 Jan 2025 22:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787665; x=1738392465; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T6GCuzeAmDEU4hGwplnvXwuVetfxA5yWhKc4RU1kN3E=;
 b=b9hIvNrs9/CIlk3KXdfGb03dCY7M41nGFlVyZQlyTKgPOqwxeDC1SQ7JobcqqVnGEQ
 eR6bwlCgRKpjZ51+025CAgkWXOfE5y/C6hvyPUBBXHAb2R6VwW3ZkM37n7D+JhUHMl6H
 9Y55xwveDqZNbDJ0X6PHmIqANakLxrS31acyanoNyDtuOsgvbUVMpubX/t3ekOXDgV5l
 ZiJf3KvX3XLQnYj/rGpRZeZoKxc5iZ1Nc1fa7TSdKwyro68ePjcE43erN7/bYZIsZIC4
 1NXG3yvq51mPsv9XqCC32HaAEEP4ISxrUUO4BhWh5ie6s2C7CgcfYv40NW9HyVCnF/u3
 SzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787665; x=1738392465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T6GCuzeAmDEU4hGwplnvXwuVetfxA5yWhKc4RU1kN3E=;
 b=B82qiDe0faopH5gwKOI1GyDLbCWtDtUAWRtWeTf1T3Y5esmRP480wIvKxMABfuc4L5
 J+pm6mLNlqu/dScHcMjlSpnHilOFgg5RiikvYBKvOf3LuuE5arkyfONd6jCP1aKDde69
 DuQRCEbuBEXGhG0fNV9ZxNugk4CJT3qYef2uF5tX5Pp0bLn6DvSPDOBXco+Mkt6RLPNR
 05ML/OjHigSHOHapxTYD8q8xJijLyDibW9E2G5Myp3hOZhfvnTmgNU3/0PJ3m2exySVo
 S9HKQkW6Zszb1smdezCuoEpagEIRb8KCiibfxb8DH6j0iDdj71NnancQcZvyuq6N44wk
 aKxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+za09FWy+MozGe5eXaxKOBWL8tfbIMzGG4jVxRgmVO4DJDi1yTmfLp7IxDSIRm+MoyBrrZnnCeCII@lists.freedesktop.org,
 AJvYcCVPp7QH9FZ4itb4rYp8Dg48fRsgUejFtyROdEyGUF6wiYJGD7ZqXoMaCTIScdXeked4ziuQ9iA8@lists.freedesktop.org,
 AJvYcCVY9cyWTeRG2kSRH/MRB3thTzHdCXg+8pfMrrW8f+A+SpkOOlFYVhd4yNYBQ9idDgvGaMo8iWuL0LoMVZDBXQ==@lists.freedesktop.org,
 AJvYcCWJB5tTzPAxJSXhe8DicKRT3/c/FRexDxcN0o4I+LC5cyToEAxATWcrpzhDkme4LaAQ0MEqdEBVcPPV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys4yJjQC7id1W0JJ3Ei0yfqOE+7jv1JUolH9X+rjlnVEsICpPO
 FRtMl4NJpD0ZCrVAu8PB8F/3Stgotj/EINihsebmiZkVn5dPb1L9
X-Gm-Gg: ASbGncsZXmn0ic0EztjCt1tgtID7Rq/7jQxrlG/0IUHNRCptmD3oVhe9jf9kFgnx7KD
 B5lXQL0AQLOUuUmhujFQhd7QJqef+X97dvuWVTDWbJFAuz0a4gJnbB6j39OepMuoaRtq1iYEvrW
 O6SbpNhlUYrDbH/2mVllBF/QMvi63l3SjFbd0ccej+hDxhF56VH6bQ6S7igwOmYLoMlOJ5HgnGd
 cUbtQLeajdeUekGtL7PF7pjpaPVYFnTeardn/uQf88sWDQCwtP1lL44lnA8xj5ZDsPiBcMBuEdI
 5/wqbMm6eBa117KAK0rAo9vXVujYTUAk54D46g==
X-Google-Smtp-Source: AGHT+IEujLOtg9gkMTa7OzcouFF4HjwPZbpakCrytdnwwqxtjFJ2Exad5qI/+pzTRXAa2s9JlPkT4Q==
X-Received: by 2002:a05:6602:48c:b0:834:d7b6:4fea with SMTP id
 ca18e2360f4ac-851b61f1347mr3241540439f.6.1737787665030; 
 Fri, 24 Jan 2025 22:47:45 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:44 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 64/64] This series fixes dyndbg (dynamic debug) classmap
 support for DRM.
Date: Fri, 24 Jan 2025 23:46:18 -0700
Message-ID: <20250125064619.8305-65-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Despite a few latent flaws (1-3 below), classmaps-v1 went in with:

ee7d633f2dfb drm-print.h: include dyndbg header
84ec67288c10 drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro
e820f52577b1 drm_print: interpose drm_*dbg with forwarding macros
f158936b60a7 drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.
0406faf25fb1 drm_print: condense enum drm_debug_category

and

6ea3bf466ac6 dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes
b9400852c080 dyndbg: add drm.debug style (drm/parameters/debug) bitmap support
ace7c4bbb240 doc-dyndbg: edit dynamic-debug-howto for brevity, audience
753914ed85ac doc-dyndbg: describe "class CLASS_NAME" query support
a4a2a427413e dyndbg: validate class FOO by checking with module
c45f67ace832 dyndbg: add ddebug_attach_module_classes
66f4006b6ace kernel/module: add __dyndbg_classes section
aad0214f3026 dyndbg: add DECLARE_DYNDBG_CLASSMAP macro
3fc95d80a536 dyndbg: add __pr_debug_cls for testing
ca90fca7f7b5 dyndbg: add class_id to pr_debug callsites
b7b4eebdba7b dyndbg: gather __dyndbg[] state into struct _ddebug_info

Those flaws:

1. Regression during initialization.  classmaps-v1 inits drm-dbg
callsites' static-keys when drm is "modprobed/initd" with
drm.debug=<initval>, but not during driver & helper modprobes.

Previously __drm_debug vs DRM_UT_* was checked at runtime, which
made this a non-issue.  My test scripts passed dyndbg=<options>,
which obscured this lack of "propagation" to drivers, and I didn't
pick up on it.

2. DECLARE_DYNDBG_CLASSMAP violated a K&R rule "define once, refer
after", and is the root cause under 1.

3. classmaps-v1 was something of a flag-day patchset; dyndbg & DRM
parts were overly coupled, and test-dyndbg didn't validate multi-
module classes.

Consequently we got:
commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")

Classmaps-v2 fixes these as follows:

2. replace DECLARE_DYNDBG_CLASSMAP with DYNDBG_CLASSMAP_DEFINE
(invoked once in drm-core) and DYNDBG_CLASSMAP_USE (repeatedly, in
drivers & helpers).

_DEFINE now exports the classmap, which _USE can repeatedly refer to.

_USE adds a usage/linkage record referring to the _DEFINEd (&
exported) classmap, in a new __dyndbg_class_users section.

1. Now at modprobe, dyndbg scans the new section, follows the linkage
to the _DEFINEr module, finds the (optional) kernel-param controlling
the classmap, examines its drm.debug=<initval>, and applies it to the
module being initialized.

3. test/validate dyndbg for multi-module classes wo DRM involvement.

A. add test_dynamic_debug_submod.ko, a clone of parent.
This allows recapitulating various multi-module scenarios.

B. add tools/testing/selftests/dynamic_debug/*

This verifies spec'd behavior, including the multi-module scenarios
made available in 3a.

C. to decouple dyndbg from DRM, DECLARE_DYNDBG_CLASSMAP is preserved
until after DRM adapts to the api change.

Since the last rev sent here/LKML:
  https://lore.kernel.org/lkml/20240716185806.1572048-1-jim.cromie@gmail.com/

Ive rebased onto recent drm-tip, and tested with drm-trybot:
  https://patchwork.freedesktop.org/series/139147/

and made the following additions:

1- drop class "protection" special case, per JBaron's preference.
   current use is marked BROKEN so nobody to affect.
   now framed as policy-choice:
   #define ddebug_client_module_protects_classes false

2- compile-time arg-tests in DYNDBG_CLASSMAP_DEFINE
   implement several required constraints, fail obviously.

3- modprobe time check of conflicting class-id reservations
   only affects 2+classmaps users.
   compile-time solution not apparent.

4- dyndbg can now cause modprobe to fail.
   needed toq catch 3.
   maybe some loose ends here on failure.

5- refactor & rename ddebug_attach_*module_classes
   reduce repetetive boilerplate on 2 types: maps, users.
   rework mostly brought forward in patchset to reduce churn
   TBD: maybe squash more.

The recent trybot submissions (against drm-tip) pass CI.BAT, and fail
one or few CI.IGT tests randomly; re-tests do not repeat the failures.

its also at github.com:jimc/linux.git

commit c0f15eda9c3676149dedbc5a5fc0faee9550a2f7 (HEAD -> dd-fix-9s-ontip, ghlinux/dd-fix-9s-ontip)

Im running it on my laptop & desktop w/o issues.

The drivers/gpu/drm patches are RFC, I think there might be a place to
put a single DRM_CLASSMAP_USE(drm_ddbug_classes) to replace the
sprinkling of USEs in drivers and helpers.  IIRC, I tried adding a
_DEFINE into drm_drv.c, that didn't do it.

I think the dyndbg core additions are ready for review and merging
into a (next-next) test/integration tree, I'd like to find out.

Jim Cromie (63):
pre-cleanup:
  docs/dyndbg: update examples \012 to \n
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: replace classmap list with a vector
  dyndbg: ddebug_apply_class_bitmap - add module arg, select on it
  dyndbg: split param_set_dyndbg_classes to _module & wrapper fns
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: reduce verbose/debug clutter
  dyndbg: silence debugs with no-change updates
  dyndbg: tighten ddebug_class_name() 1st arg type
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: reduce verbose=3 messages in ddebug_add_module
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  checkpatch: add an exception to the do-while wrapper advice

core change:
  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: check DYNDBG_CLASSMAP_DEFINE args at compile-time
  dyndbg: add/use for_subvec() to reduce boilerplate
  dyndbg: make proper substructs in _ddebug_info
  dyndbg: drop premature optimization in ddebug_add_module
  dyndbg: allow ddebug_add_module to fail
  dyndbg: rework ddebug_attach_*module_classes()
  dyndbg: fail modprobe on ddebug_class_range_overlap()
  dyndbg: hoist the range-overlap checks
  ddebug: cleanup-range-overlap fails
  dyndbg-test: change do_prints testpoint to accept a loopct
  selftests-dyndbg: add tools/testing/selftests/dynamic_debug/*
  dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
  dyndbg-doc: add classmap info to howto

new features:
  dyndbg: treat comma as a token separator
  selftests-dyndbg: add comma_terminator_tests
  dyndbg: split multi-query strings with %
  selftests-dyndbg: test_percent_splitting
  docs/dyndbg: explain new delimiters: comma, percent

finishing:
  selftests-dyndbg: add test_mod_submod
  docs/dyndbg: explain flags parse 1st
  dyndbg: change __dynamic_func_call_cls* macros into expressions
  dyndbg: drop "protection" of class'd pr_debugs from legacy queries

DRM: (phase 2)
  drm: use correct ccflags-y spelling
  checkpatch: dont warn about unused macro arg on empty body
  drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
  drm-dyndbg: adapt DRM to invoke DYNDBG_CLASSMAP_PARAM
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

 .../admin-guide/dynamic-debug-howto.rst       | 116 +++-
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/Kconfig                       |   3 +-
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +
 drivers/gpu/drm/drm_print.c                   |  38 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |   2 +
 drivers/gpu/drm/gma500/psb_drv.c              |   2 +
 drivers/gpu/drm/gud/gud_drv.c                 |   2 +
 drivers/gpu/drm/i915/i915_params.c            |  12 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 +
 drivers/gpu/drm/radeon/radeon_drv.c           |   2 +
 drivers/gpu/drm/tiny/bochs.c                  |   2 +
 drivers/gpu/drm/tiny/simpledrm.c              |   2 +
 drivers/gpu/drm/udl/udl_main.c                |   2 +
 drivers/gpu/drm/virtio/virtgpu_drv.c          |   2 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +
 drivers/gpu/drm/xe/xe_drm_client.c            |   2 +
 include/asm-generic/vmlinux.lds.h             |   1 +
 include/drm/drm_print.h                       |  12 +
 include/linux/dynamic_debug.h                 | 193 ++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   3 +
 lib/dynamic_debug.c                           | 555 +++++++++++-------
 lib/test_dynamic_debug.c                      | 181 +++---
 lib/test_dynamic_debug_submod.c               |  17 +
 scripts/checkpatch.pl                         |   3 +-
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   2 +
 .../dynamic_debug/dyndbg_selftest.sh          | 364 ++++++++++++
 38 files changed, 1206 insertions(+), 425 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

--
2.47.0
-- 
2.47.1

