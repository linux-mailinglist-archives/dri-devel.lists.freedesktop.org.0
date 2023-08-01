Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DFA76C101
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9474F10E048;
	Tue,  1 Aug 2023 23:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB1C10E048
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:21 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-34930fe8608so5546145ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932920; x=1691537720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZPnDxRLG/KRln4yCcMb7QGx3X7ufNtTNc3Xj4neAY/g=;
 b=WfuaK+C4hWPQAe+VYx02Wgc3N+2wSh/c9XMA1FCBeCAHU+fXN2z5k6rHI8AbGiNrZu
 SVVqnpav3AD8O8oAgGTEZE/Fi40OhwvbWQLsj9RFF8/KSG+tpvWiT2g1U1rQvDa1dV+C
 eV51goFtKe06xbYcmtR/DWL0GQRI9l5vMc9EvxxIhrWkA+s7iouywNHNOi6NzQE9h3z/
 pqONiT9AGgp+4C7+f6XtldcIpkfD1Hf9NHWitaBVymBHLWXrqIYndbA7031BewcUTgih
 ir8SqZliEjs8bXo2aQBd22Q/1Qm6BmqPJsz01I6xKMMgIi28NscWQnd6yCfvbIcCtibt
 2YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932920; x=1691537720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZPnDxRLG/KRln4yCcMb7QGx3X7ufNtTNc3Xj4neAY/g=;
 b=ZhHuDZaygaW7ak0n+WOI4QD2RjCBCcu6iyZQLBksMmaghRPsM2HiiWlmTpX/wadldL
 f4yrNFVp08hMXIguwGGhKOdAuS9ZRU2pxpe+OA8Pk7HsIglITWbGUGmJdAqBtXgvH7GW
 6WTZvPxo97O3fVvP4Kl3Cd1DTOs0jGQUdkphH2pU66palsG8NDjXlwKvMPWgBfSJN2K/
 mZZ5pQvLkj2ASg/wQ6P4gGm+kxSfFbWlQySolml4cYQePfqpScu3AhUOhd7DIOLARSsj
 gt6dgC0tgpWQTgjmf08S5ebXlP7N8abuK3UpvoKkRsRDLujEXlzurfMZCfiXqDWz/Kl6
 29Qg==
X-Gm-Message-State: ABy/qLZMB4yHijQI/M6kMGb6/MexebAQoI5xMXTvVdhfhFMtj/Q18T8T
 mscCd0gHkdFjI2ITpH/vizc=
X-Google-Smtp-Source: APBJJlGv5SR/kG3JmHXdauIsN2PlLRIoP6EoFjuPMGCB79AZG7BvwML/s3SBjiknEWA8jbqA9xHfNA==
X-Received: by 2002:a05:6e02:1a47:b0:348:ffdb:70 with SMTP id
 u7-20020a056e021a4700b00348ffdb0070mr16307318ilv.16.1690932920486; 
 Tue, 01 Aug 2023 16:35:20 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:20 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/22] fix DRM_USE_DYNAMIC_DEBUG regression
Date: Tue,  1 Aug 2023 17:34:46 -0600
Message-ID: <20230801233515.166971-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason, Daniel

Since patchwork puked on v5 just sent, Im calling this v5b.
Its also on github

remote: Create a pull request for 'dd-fix-5b' on GitHub by visiting:
remote:      https://github.com/jimc/linux/pull/new/dd-fix-5b
remote: 
To github.com:jimc/linux.git
 * [new branch]                dd-fix-5b -> dd-fix-5b

This is V5, Im hoping to land this one.
 patchwork will probably call this set v3
 113361	fix DRM_USE_DYNAMIC_DEBUG regression - revs 1,2
 111652	DRM_USE_DYNAMIC_DEBUG regression - older, also 2 revs

It (patch 14 mainly):
 Fixes: aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
 Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")
 Ref: commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")

It replaces DECLARE_DYNDBG_CLASSMAP macro with 2 new ones;
DYNDBG_CLASSMAP_DEFINE/_USE, and invokes them from drm.ko and drivers
respectively.  A new __dyndbg_class_users section contains each
driver's _USE; dyndbg scans it at driver-module load, finds drm.debug,
and applies it to the driver's class'd prdbgs.

The code it fixes went in here:
https://lore.kernel.org/lkml/Yy7%2F6oTBW2lqVSK1@kroah.com/

then Ref: effectively marked DRM_USE_DYNAMIC_DEBUG=y as broken

and https://lore.kernel.org/lkml/Y3XUrOGAV4I7bB3M@kroah.com/
GregKH opined:
This should go through the drm tree now.  The rest probably should also
go that way and not through my tree as well.

While most of this patchset's churn is still in lib/, DRM is the real
user for all this classmap stuff, and the real acceptance test is in
DRM CI.  Hopefully it won't fall over in BAT.

However, theres also a dyndbg patch to add -s flag, I havent seen it
lately, but it might have a nominal conflict.

I'll happily take reviews/Acks/tested-bys, grumpily breakage reports.
And some landing instructions, wind-speed, runway assignment, etc from the Tower.

theres also a few drive-by checkpatch tweaks.
13 fixes a warning that 14 gets about vmlinux.lds.h declared linker-symbols.


Jim Cromie (22):
  drm: use correct ccflags-y syntax
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: make ddebug_class_param union members same size
  dyndbg: replace classmap list with a vector
  dyndbg: ddebug_apply_class_bitmap - add module arg, select on it
  dyndbg: split param_set_dyndbg_classes to module/wrapper fns
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: reduce verbose/debug clutter
  dyndbg: silence debugs with no-change updates
  dyndbg: tighten ddebug_class_name() 1st arg type
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  checkpatch: file-scoped extern special case for linker-symbol
  dyndbg-API: fix CONFIG_DRM_USE_DYNAMIC_DEBUG regression
  dyndbg: add for_each_boxed_vector
  dyndbg: refactor ddebug_classparam_clamp_input
  dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
  dyndbg-test: build it with just CONFIG_DYNAMIC_DEBUG_CORE
  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
  drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
  dyndbg-doc: add classmap info to howto
  checkpatch: reword long-line warn about commit-msg

 .../admin-guide/dynamic-debug-howto.rst       |  64 ++-
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
 include/linux/dynamic_debug.h                 | 113 +++--
 kernel/module/main.c                          |   3 +
 lib/Kconfig.debug                             |  10 +-
 lib/Makefile                                  |   4 +-
 lib/dynamic_debug.c                           | 406 +++++++++++-------
 lib/test_dynamic_debug.c                      | 127 +++---
 lib/test_dynamic_debug_submod.c               |  10 +
 scripts/checkpatch.pl                         |  22 +-
 28 files changed, 550 insertions(+), 341 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

-- 
2.41.0

