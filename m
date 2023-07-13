Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6F752881
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0859410E711;
	Thu, 13 Jul 2023 16:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A51610E060;
 Thu, 13 Jul 2023 16:36:47 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-34617b29276so5095455ab.0; 
 Thu, 13 Jul 2023 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266206; x=1691858206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xsnxNcz70qyyc9HqO162D63ZHCaN0/jJDoy6JcdJGmw=;
 b=i7IstqIiYWKSdTInB7RRLoyrrLWTiSdmQH/GS8yzHgjpyNNVM889S9qI6PuD9MVvxM
 VQZcQfLjMkwsMYEvKNkl2vEihabVz0KhBorU1Q3ef3UANCHHBUoaqdOYNEWSrbMze7gX
 IGzqWcHtueflYkrTcnZFQTzjqHv7dQinHY87CQviORAljaCB+pEZViGmvwwkp0Gx3jM9
 j9A6pGTk4bVLjQjRGttATxcQKWRhvE4CDsuoHqd17oe6ZB8Bz3kxioFnZeXJxL3ZdLLo
 +8Z0QUKR7wUQlnXTHfHADwqU8TrDxBkffg+V1vQDV/whjTgUH/6TFLvIAfzb7SYvQR8t
 lsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266206; x=1691858206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xsnxNcz70qyyc9HqO162D63ZHCaN0/jJDoy6JcdJGmw=;
 b=hYqj59wAaIfez1fBH8Tylp4D/wdvYPTCj0MUt8IZf3drxNXry5HzUgYMLWYrxV8Dtx
 NF3y2ZC8LWEQfLetfTDLjSnBlCyX+KN6+d/2aHSYhXmKc/Rxrf5q6klLw7RRBnZ/knuB
 dRbDWmyVzHe3IVDZGzx/O3C7QlCphp7ww+B7VGN90uaDTUXoi1aJsRxrYmJJgpAYQWK1
 UloSt0HfN1+yQXyN44S+UpuHmqx0Jl48KGUtY5T+WF0B7SuuCnJbMFMDKUug2Ig9tNi3
 hgv7jzyKmaTpJ9XEIXKTmyXCIlptpKQzHsOGr0SANKDwGicv/RRmCaRM9KpEyK7WStMs
 tT2A==
X-Gm-Message-State: ABy/qLZbnMHGlsQMOvKsPfzUbODlnuvEe3LJO/jpwO10H4zV7jmIlnVL
 9QBbqbwbxRwbtf1Kmg1P+og=
X-Google-Smtp-Source: APBJJlEpTm+P9ou1CsNfuTysTeyM1Re1D8qofR3fYXOdTSWwLaStjYdeCmokoG5fYZfAgKGPMOpiyQ==
X-Received: by 2002:a05:6e02:1043:b0:342:558c:d88e with SMTP id
 p3-20020a056e02104300b00342558cd88emr100849ilj.11.1689266206006; 
 Thu, 13 Jul 2023 09:36:46 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:36:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 00/21] fix DRM_USE_DYNAMIC_DEBUG regression
Date: Thu, 13 Jul 2023 10:36:05 -0600
Message-ID: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Jason, Daniel, Greg, etal

Heres another run at the regression, adequately explained in V3 here:
 https://lore.kernel.org/lkml/20230125203743.564009-1-jim.cromie@gmail.com/
 https://patchwork.freedesktop.org/series/113363/

V3 exposed an init-ordering issue with jump-label, fixed by Jason with
7deabd674988 ("dyndbg: use the module notifier callbacks")

These patches are against v6.4, they apply cleanly to drm-next-2023-07-07
Also at https://github.com/jimc/linux.git (dd-fix-2k2, dd-fix-2k-on-drm)


The bulk of the work is in the 2nd of the dyndbg-API commits, it
probably requires the most scrutiny.  It splits the confused
double-duty job of DECLARE_DYNDBG_CLASSMAP into DYNDBG_CLASSMAP_DEFINE
and DYNDBG_CLASSMAP_USE.

The other dyndbg-API patches could stand a wider review, since they
make new API.  Bikeshed on names, now while its easy.  Fresh eyes see
inconsistencies better.

I considered s/class_map/classmap/, since theres also CLASSMAP, and
also PeterZ's new CLASS macros (which I should generally stay away from).
Or is that just churn ?  catmap ??  And maybe *param* fn-names too.

I yanked the NAME class-types, since there are no users except the
test-module, we could have it back later if anyone wants it.

theres also an RFC s/__LINE__/__COUNTER__/ in __UNIQUE_ID fallback.


Jim Cromie (21):
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
  dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP & CONFIG_DRM_USE_DYNAMIC_DEBUG
  dyndbg: refactor ddebug_classparam_clamp_input
  dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
  dyndbg-test: make it build with just CONFIG_DYNAMIC_DEBUG_CORE
  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
  compiler.h: RFC - s/__LINE__/__COUNTER__/ in __UNIQUE_ID fallback
  drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
  config TEST_DYNAMIC_DEBUG default m
  dyndbg-doc: add classmap info to howto

 .../admin-guide/dynamic-debug-howto.rst       |  60 +++
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
 include/linux/compiler.h                      |   4 +-
 include/linux/dynamic_debug.h                 | 112 +++--
 kernel/module/main.c                          |   3 +
 lib/Kconfig.debug                             |  13 +-
 lib/Makefile                                  |   4 +-
 lib/dynamic_debug.c                           | 399 +++++++++++-------
 lib/test_dynamic_debug.c                      | 127 +++---
 lib/test_dynamic_debug_submod.c               |  10 +
 27 files changed, 522 insertions(+), 340 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

-- 
2.41.0

