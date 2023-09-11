Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1D579AC1C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27A010E1CA;
	Mon, 11 Sep 2023 23:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C306210E1C7;
 Mon, 11 Sep 2023 23:08:26 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7926b7f8636so122840539f.1; 
 Mon, 11 Sep 2023 16:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473706; x=1695078506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4QPvsUCuesDbdqzdhDuBEQMp4BSGGOAe53BRO5DTLhU=;
 b=Fo8RcEfpUEb7txFLa63858RK7NwICncC34p6F7RnL56x33h734DhOMHuZ/VGjXSMeY
 0B59mUdiAUmzr2yJ0zCFIpx2JQYNBC0Q+l1vrKCXXC8XqPUcRr30QsWfzQ9wO4h5zUM+
 J+4DpveO256grlAeO3X7ivu7wXPlHSQLoKtj+UmXSroLDOF949JH8uMI1GG9P8j5L+92
 xAvxZAL1l77Yk6s8iDXT5RxxdQBDv/AFPG1+YRx4+Q/iEhCahaITPUMlYFxVzJX6CRM7
 Qalxsd8DyICfE8Ck/LdygCW2ciVGOLJESZsNxoHB2nIP4ahC8DNQRBLzy90EbvK9S6ay
 cqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473706; x=1695078506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4QPvsUCuesDbdqzdhDuBEQMp4BSGGOAe53BRO5DTLhU=;
 b=A/HAAbL82pSE2n1tYfVaY6NGD5OGEpD5xHmFp02aL+kj2ASMcqwmBR1R8u4gs2body
 oHXtijqvW8XViFX8WnshK90xaxAAyBcCd2kIMuQ44RVDWrfHzzVzt0RZ9gy6UZvftRZq
 m/wXzunzaaWtGMF/AWGzA+8UlyY48buMkWBj2MXiT3B8aYnEVbY9kFrq1HPrXK/VlLJv
 kDbZRH8fyT9XM+Nsd1CgZVGPy4M5EAnkup2PF1y1pWxrB3sX4PvPVYc+3q7SKZ0w0e+P
 F33dBFXlKR9NSfxsjS8cWHrsjmvrrKWfM9iSxephCfuvEYnwNXDkW+NW/fFfODcd7QvH
 CrKw==
X-Gm-Message-State: AOJu0YyfaXSUq8ni4yOgg9/WvD/GnkdMuQeLfk8VvkVG45pbbFlf5sUV
 VahdDROMVpzcajLrzBzeXy4=
X-Google-Smtp-Source: AGHT+IG7bYicJCrmUYKVqmd3OJOt+rHV8pZgZGqdIESBV9//RY1GB+4nospOwL2Y8hO5uFJ5BARkiQ==
X-Received: by 2002:a05:6602:2e89:b0:792:8c29:7b with SMTP id
 m9-20020a0566022e8900b007928c29007bmr1041872iow.10.1694473705771; 
 Mon, 11 Sep 2023 16:08:25 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 u1-20020a02c041000000b0042b1061c6a8sm2518671jam.84.2023.09.11.16.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:08:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 00/22] fix DRM_USE_DYNAMIC_DEBUG regression
Date: Mon, 11 Sep 2023 17:07:55 -0600
Message-ID: <20230911230817.14402-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes the regression in DRM_USE_DYNAMIC_DEBUG=y

blame analysis: (all mine)

1. my early test scripts did a lot of 'modprobe $m $*',
   with dyndbg=.. and debug=.. args
   this obscured the lack of drm.debug -> drivers propagation

2. I broke K&R rule: "define once, refer many times".
   the classmaps DECLAREd by the drivers would run on args in 1

The thinko beneath that was imitating the "static struct" in the
definition of DEFINE_DYNAMIC_DEBUG_METADATA.  Imitating __drm_debug
export instead broke the mental logjam.

So the patchset splits DECLARE_DYNDBG_CLASSMAP duty in 2: with
DYNDBG_CLASSMAP_DEFINE/_USE, where _DEFINE exports the classmap, so
_USE can reference it.  The _USEs are added into a new section:
__dyndbg_class_users.

ddebug_add_module() now also scans class_users at modprobe time,
whence it finds the kernel-param that refs the classmap, and applies
its initialized state to the user/driver.

test-dynamic-debug is extended with a _submod, allowing it to
recapitulate the drm.ddebug -/-> drivers failure scenario.


NOTE: patch-14 does the DECLARE -> _DEFINE/_USE, so it also changes
DRM to follow the API change.  That makes it buildable, but crosses 2
trees, which isn't so great.  But since the feature is marked BROKEN
at this point, perhaps I should have split them.

Finally 3 DRM patches: drops BROKEN on DRM_USE_DYNAMIC_DEBUG, fixes
drm/Makefile, and wires a bunch more drivers to _USE DRM's
drm_debug_classmap.

You can bang at the test module with:
#!/bin/bash

ddcmd () {
    echo $* > /proc/dynamic_debug/control
}
vx () {
    echo $1 > /sys/module/dynamic_debug/parameters/verbose
}
ddgrep () {
    grep $1 /proc/dynamic_debug/control
}
doprints () {
    cat   /sys/module/test_dynamic_debug/parameters/do_prints
}

note () {
    echo NOTE: $* >&2
    $*
}
ddparms () {
    note ls -l /sys/module/test_dynamic_debug/parameters/
    note cat   /sys/module/test_dynamic_debug/parameters/*
}
up () {
    modprobe drm debug=0x03 debug_trace=0x1ff
}
dn () {
    rmmod drm
}
ddtraceon () {
    echo 1 > /sys/kernel/tracing/tracing_on
    echo 1 > /sys/kernel/tracing/events/dyndbg/enable
}

# replay drm.debug dependent-module scenario
submod () {
    echo  MP test_dynamic_debug $1 $2 dyndbg=+pm $3 $4

    # extra complexity to avoid passing param=s since theyre explicit inits
    if [[ -z $1 ]] ; then
	modprobe test_dynamic_debug dyndbg=+pm
    elif [[ -z $2 ]] ; then
	modprobe test_dynamic_debug dyndbg=+pm \
		 p_disjoint_bits=${1:-0}
    elif [[ -z $3 ]] ; then
	# force 3,4 off, undoing DEBUG - declutter
	modprobe test_dynamic_debug dyndbg=+pm \
		 p_disjoint_bits=${1:-0} p_level_num=${2:-0}
		 # p_disjoint_names=${3:-MID,-LOW,-HI} p_level_names=${4:-L3}
    elif [[ -z $4 ]] ; then
	modprobe test_dynamic_debug dyndbg=+pm \
		 p_disjoint_bits=${1:-0} p_level_num=${2:-0}
		 # p_disjoint_names=${3:-MID}
    else
	modprobe test_dynamic_debug dyndbg=+pm \
		 p_disjoint_bits=${1:-0} p_level_num=${2:-0}
		 # p_disjoint_names=${3:-MID} p_level_names=${4:-L3}
    fi
    
    # _submod should pick up kparams
    echo  MP test_dynamic_debug_submod dyndbg=+pmf
    modprobe test_dynamic_debug_submod dyndbg=+pmf
}
unmod () {
    rmmod test_dynamic_debug_submod
    rmmod test_dynamic_debug
}

# The test:
submod_test () {
    unmod
    submod $*
    sleep 1
    
    note "above submod.s D2_* prdbgs should have printed"
    note "because they are enabled here:"
    ddgrep _submod

    echo 1 > /sys/module/test_dynamic_debug/parameters/do_prints

    note submod prdbgs should print here
    echo 1 > /sys/module/test_dynamic_debug_submod/parameters/do_prints
}

# old-code: triggered jump-label init panic, fixed by doing
# dyndbg-init in notifier, after jump-label
submod_force () {
    unmod
    submod $*
    sleep 1
    # force all classes off, then on
    note trigger toggled warning by turning off the supposed enabled prdbgs in submod

    echo 0     > /sys/module/test_dynamic_debug/parameters/disjoint_bits
    echo 0x2ff > /sys/module/test_dynamic_debug/parameters/disjoint_bits

    note now theyre on
    doprints
}

setup () {
    echo dynbg-verbose-0, clearing kmsg, and running submod_test
    vx 0
    dmesg -W &
    submod_test  7 7
    ddcmd class V +mfl
    ddcmd class V2 +tmfsl
    ddcmd class V3 +mfsl
    ddcmd class V4 +mfs
    ddcmd class V5 +mf
    ddcmd class V6 +m
    doprints
}



Jim Cromie (22):
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
  dyndbg-API: fix CONFIG_DRM_USE_DYNAMIC_DEBUG regression
  dyndbg: add for_each_boxed_vector
  dyndbg: refactor ddebug_classparam_clamp_input
  dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
  dyndbg-test: build it with just CONFIG_DYNAMIC_DEBUG_CORE
  dyndbg-doc: add classmap info to howto
  dyndbg: reserve flag bit _DPRINTK_FLAGS_PREFIX_CACHED
  dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP
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
 include/linux/dynamic_debug.h                 | 122 ++++--
 kernel/module/main.c                          |   3 +
 lib/Kconfig.debug                             |  10 +-
 lib/Makefile                                  |   4 +-
 lib/dynamic_debug.c                           | 407 +++++++++++-------
 lib/test_dynamic_debug.c                      | 137 +++---
 lib/test_dynamic_debug_submod.c               |  17 +
 27 files changed, 546 insertions(+), 346 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

-- 
2.41.0

