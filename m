Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLX6LFgbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2281A128748
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DED10E66E;
	Thu, 12 Feb 2026 00:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O7UzMUZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4484D10E66E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:11 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-409470ad5bbso2299758fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855250; x=1771460050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oYYjNKp3UsQzO+2OD46ySZC9b2kjYdV0fvcEg0ICJZg=;
 b=O7UzMUZKodDYJdIlIHVaMwvsImH8LTJNYbIr8/bQqxQXHkb2YrIy+sMNVsFWQkwy/D
 XriZtyPr0+3Bt+HocLI9+/WibeY9ULtWz2//XuiedV4/ihnrfx/VxBJ97/+/UmhXyZHr
 XK19v/wQL5E5L2QZCIOonx8JlfIraBJc0w3DBFA6c88P6bjnnegXg3B9b80BOM5HL2ZQ
 rUzJSXXUnaAZbM2+PEb4XUi2JP8wV0hC8WFnAPTebEmUYSf66DK6EwoC8ZS5lNNdDSsb
 AFDENR/3aFuF/wyJg8UrChQkUcgxei1x0vgdxFvwVzZlXKvll3LSlDwEYjZ+NjlAi79Q
 I55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855250; x=1771460050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYYjNKp3UsQzO+2OD46ySZC9b2kjYdV0fvcEg0ICJZg=;
 b=TPyPcZq/+sAQoG/7W0fVeKNxwi2CBpn/fPGyL5152sC+IEoCeNvXaf0Jpk+MuiURBx
 3J5GdwUBGdVQ30bN9s8jvSoZ+v0u2q3SQ9eyTJx1f1jWPe22nNsFrJzqzUyJtVIw5f8i
 RPO5AC+LE5/ZN30t5SvZ+fRkXkiT8zvApz/ug29JVpp/oJqnf2ebkRy0X2vhjWnuMzGB
 rDpDz4XsskcUGg2yl5+f15cBfQfUOKmkZTKKi1XBeZD2cFfoVLMxDxreg+lHg7PXUoKd
 kc71tp19bQDb/h5ZCw2xRmLyc4RDp19TR1A11CRk94KpKLmdkUKn4gok9o/8soZ4j8EH
 e/PA==
X-Gm-Message-State: AOJu0YwSx7eYRcXfel6FSQIMSt/wMqXZ60qmDDOpyNuV6rk9FgLGur/j
 iwUJ2kHV98p5gFA1kkKr1sAZJaNYD07x3mnCRccchaEVQfxQl4nOK11UYSE/Vg==
X-Gm-Gg: AZuq6aKM10GI5i0SgZRlagzql0u1DxdPt4OtPyjL5HmfrogGktq5zv/A7YMKPxpvwGB
 NIaRYLhnuvFTmL9XXwzLijaBgb4XGKSVbHswbLPeqLjjPGCUbOYfjalifoymX9guMFLEjubDgMC
 lHR1C6aHaSyEJWICaRtAbJXnl6k+D5gb4fJHM6zgiVGIYXq19/z/R9JQProCMdafdKJ8F6bGIX4
 ON4Gy9hNEh9v/P1m3bLh0dMM0jL2XNhw+pT3jlcl0rVIOPqhLdhCxTRkOiXz4ZpaRc3yq0zMwm1
 izZ8yI/Xvnd4IN+czhf3lEB+CcYMJEmZMhyV+YMCB7MpeS6iDBGLg48b95ibTq5f6aXuGivH8ek
 h6vKxAM44xTVfzMrLldqp4QGtYmcTNb1oTXOQrzI5c7iLuAbNihhEUQzbDP6IdLZt9cs7dwMomx
 jcc2Z6Z5QGGl1Hm7bTRRQOOclU+NttH7dVP4vIiUSd0xTm1O6/dWwp
X-Received: by 2002:a05:6870:350b:b0:408:ed50:2af4 with SMTP id
 586e51a60fabf-40ec731db95mr589694fac.51.1770855250152; 
 Wed, 11 Feb 2026 16:14:10 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:09 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v10 00/61] drm/dyndbg: Fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
 MIME-Version: 1.0
Date: Wed, 11 Feb 2026 17:12:55 -0700
Message-ID: <20260212001359.97296-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2281A128748
X-Rspamd-Action: no action

Hi all,

This series fixes the long-standing BROKEN state of "classmaps" with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y. When enabled, the ~4k dev*dbg() calls
are implemented with a static-key, so they avoid the repeated bit
tests in the '=n' case.

But it was broken for loadable driver modules, because drm.debug=<val>
was applied before the drivers were modprobed, so the drivers'
drm_*_dbg sites did not yet exist, and missed the enablement.

Fixing this required an api change: replace DECLARE_DYNAMIC_DEBUG with
DYNAMIC_DEBUG_CLASSMAP_DEFINE and DYNAMIC_DEBUG_CLASSMAP_USE; 1st is
called by drm.ko (core) to define the classmap, 2nd is called by
drivers and helpers to reference it.  This distinction allows drivers
to find the drm.debug param, and apply its settings to the driver
modules.

This patch set revision includes:

1. v9 of dynamic-debug classmaps.
   it included a test script to show the changes work as intended

2. applies the API changes to DRM core, drivers & helpers
   this is the acid test
   included here so DRM CI (trybot) can prove it works for DRM.

3. applies API to DRM_ACCEL modules
   these modules already use drm.debug macros, so *are* DRM modules

Jim Cromie (61):
  dyndbg: fix NULL ptr on i386 due to section alignment
  dyndbg: factor ddebug_match_desc out from ddebug_change
  dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
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
  dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
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
  dyndbg: resolve "protection" of class'd pr_debug
  dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
  docs/dyndbg: add classmap info to howto
  drm: use correct ccflags-y spelling
  drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
  drm-dyndbg: adapt DRM to invoke DYNAMIC_DEBUG_CLASSMAP_PARAM
  drm-print: modernize an archaic comment
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
  accel/ivpu: implement IVPU_DBG_* as a dyndbg classmap
  accel: add -DDYNAMIC_DEBUG_MODULE to subdir-cflags - RFC
  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
  drm_vblank: use dyndbg's static-key to avoid flag-check
  accel: ethosu enable drm.debug control
  accel: rocket enable drm.debug control

 .../admin-guide/dynamic-debug-howto.rst       | 184 ++++-
 MAINTAINERS                                   |   3 +-
 drivers/accel/Makefile                        |   2 +
 drivers/accel/ivpu/ivpu_drv.c                 |  27 +-
 drivers/accel/ivpu/ivpu_drv.h                 |  45 +-
 drivers/gpu/drm/Kconfig.debug                 |   1 -
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   1 +
 drivers/gpu/drm/drm_print.c                   |  38 +-
 drivers/gpu/drm/drm_vblank.c                  |  10 +-
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
 include/asm-generic/vmlinux.lds.h             |  19 +-
 include/drm/drm_print.h                       |  22 +-
 include/linux/dynamic_debug.h                 | 302 +++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   5 +
 lib/dynamic_debug.c                           | 776 +++++++++++-------
 lib/test_dynamic_debug.c                      | 198 +++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 +++++++++
 41 files changed, 1613 insertions(+), 559 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.53.0

