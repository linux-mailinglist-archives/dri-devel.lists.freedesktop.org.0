Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B311D76BA35
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE63510E19B;
	Tue,  1 Aug 2023 17:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3A110E19B;
 Tue,  1 Aug 2023 17:03:03 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-79095499a16so122209739f.2; 
 Tue, 01 Aug 2023 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909383; x=1691514183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HpLKlPkPuDeZTaydF9hSSkY9Ellw/0x0sPYE01QQjK8=;
 b=dwZwdTx3LbTEUjrG7cqObNua7f/Y6UApTOfS71NoiM+4B3YWrCLr2w6QEvPLWhDQ82
 ok+QSNsMDSsGiu47UdPyWXPoOyDyTuozvp5e3kulaStWriPzuNLhXDZHiZFxvO2/uNzf
 KecRX12r2tzxow1wQSwHlyXAwcXrd6DN3vaOB288qxzuGWTJIPqGKCnh+kXjRo7+d7cl
 YJy/HTYGtvfXMJJMvEwmrwK6qExfYDLuiSpgauCDrQI+LNAysON/q5beCISdZTol7XVt
 x0NxJHLAetlZGoKrBTjXmCCJRX4bPGCjmOjSxGm744nOgpviFoHbdKlhLAbdxUCTC3fh
 6BCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909383; x=1691514183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HpLKlPkPuDeZTaydF9hSSkY9Ellw/0x0sPYE01QQjK8=;
 b=DWEJH+9eU4jvbPZrwWvrdKJKycq8prN1yihQeBcJHjZ10hYLTjaS5ru9mZhiS+Yt17
 fifgWM0hRSvW5kE389mRf7upx+sIqvx3Id6b00UjlhnvkoXOicN7CgrD3FLx8keCJsJa
 0hM04DMPmJNAytEyH9M4Sg3BK95lQf9EkDDUEFHwsnjNNXqK34Nh5wFav35M9nrpoBAh
 pfatkZ4v7bF0d2j2Z1JHfy7Da0Rgs3Laqr+WMoFlAonXfJDg4IGuwU4rfmXbklJ0OQTq
 W1V9WYu7o8w/o82pBCuyDqX9MzeaeFVZWBdPSTJrnwHPhq5U2JPZK1+3eg36YpSiolhR
 /28w==
X-Gm-Message-State: ABy/qLbm3r2eX18YgssqPIRugyffGaXlNgdImNpCyagg7KeJizwp+OOu
 pDNwXeXEJYIR1B1hMFn7SRw=
X-Google-Smtp-Source: APBJJlFnXDkFGfkVLtL6cxCofA5CYCbk4OYOGIz5bGjX04E7JRgdcDA1DzDAmsNmGGPAU1VpuideFQ==
X-Received: by 2002:a05:6e02:1aa3:b0:345:66f5:3404 with SMTP id
 l3-20020a056e021aa300b0034566f53404mr14132076ilv.0.1690909382631; 
 Tue, 01 Aug 2023 10:03:02 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 00/22] fix DRM_USE_DYNAMIC_DEBUG regression
Date: Tue,  1 Aug 2023 11:02:32 -0600
Message-ID: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason, Daniel, etal

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

