Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C03248FDA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A9F89ADC;
	Tue, 18 Aug 2020 21:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0BF89ADC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:17 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id j187so19655647qke.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FAVR8N11R8hcw0gNu4V80+dcwfnRdCjs1crMEXH9DH4=;
 b=dGHl/MlgzwcDYVHxNVUy7bHhckYEO1yyTPjNTJxCqIfyQGLLN4jPJBj8lJd8L8OMr+
 67VEjkG3y+X3jFtc8khrKwnKWkdMWzn83zhbsgTod5Vf6BG3gR4O8996zbWrOIj+qtlV
 4Lndo3e/u2iGgSNgO1WLb0Tic1sX6xLKObTiTJ1ynYypMRh67u/y2mlbrNGIRpkgo0If
 NLdSyfxtFJhd/XcBhyksXG4XeaoGQaXsCAjbEo2K0Omg8wu5W0+Qx0Majd6JDLc9CwtP
 M8EIN/2OUf1cOnGSQ6kgJKxBYRDrQWyArmdTQCQylVOGQo5rePwHSawJrJjfHQ3rdYN7
 pGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FAVR8N11R8hcw0gNu4V80+dcwfnRdCjs1crMEXH9DH4=;
 b=oyvYNGI0nQdF/Nv2+X66HoYiKdfCObfNygyRlguo2fT+hzJAt+BPXDjqiFt5ymPkBJ
 UZijW7ymkUg2oz3zX+thBsZ4wADc2uX07qmQwFa4e11e8V2oFXBm+MMP3vnbOo/6M6Ng
 i/DXCDJ5AzvaaDtcpzrXuh7DamZWu9Mi23q69yumHBixwNINh8h+h7V9JC4zQUkWn8mH
 XC1+I5ytqxTVHq9zosAnqszwFjPKrHr6hTMVjO7TaqBAbfRp5fsPSWJg/W9AGSXibfBt
 rVkursH6b9kNiK9ejMlWz5uTapVr4yJBW5LQfspYBpgfxiC5ujdjtYa3DbhCDgCHz7Cy
 bgTQ==
X-Gm-Message-State: AOAM533Z7dpQVrUrDc+LTHqlcqyjNlFAwg8Y12kr4WRfjT2ndTBbv2Hq
 OEHUtp1Wv4xpVn9dQyv2leG/YxLtMOhIEg==
X-Google-Smtp-Source: ABdhPJwcAc/c/EjZoha/LxwU2sukkAtdqWaSeKpaLKnXw2B1tyeaaJ1b+mAGOBlP4EClXtItacWWVQ==
X-Received: by 2002:a05:620a:1315:: with SMTP id
 o21mr19201252qkj.227.1597784716504; 
 Tue, 18 Aug 2020 14:05:16 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id 65sm23453340qkf.33.2020.08.18.14.05.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:15 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 00/14] drm/trace: Mirror DRM debug logs to tracefs
Date: Tue, 18 Aug 2020 17:04:56 -0400
Message-Id: <20200818210510.49730-1-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Cc: daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Mostly a rebase on drm-tip.

New changes:
 - Use the new trace_array_init_printk() call init the global trace buffers.
 - Add patch 13 to the set to pipe atomic state logging through trace

v5 is available here:
 https://patchwork.freedesktop.org/series/78133/

Sean Paul (14):
  drm/mipi_dbi: Convert pr_debug calls to DRM_DEBUG_DRIVER
  drm/sil164: Convert dev_printk to drm_dev_dbg
  drm/i915/utils: Replace dev_printk with drm helpers
  drm/msm/dpu: Replace definitions for dpu debug macros
  drm/print: rename drm_debug* to be more syslog-centric
  drm/amd: Gate i2c transaction logs on drm_debug_syslog
  drm/etnaviv: Change buffer dump checks to target syslog
  drm/nouveau: Change debug checks to specifically target syslog
  drm/i915: Change infoframe debug checks to specify syslog
  drm/print: Add drm_debug_category_printer
  drm/mst: Convert debug printers to debug category printers
  drm/i915: Use debug category printer for welcome message
  drm/atomic: Use debug category printer for atomic state printer
  drm/print: Add tracefs support to the drm logging helpers

 Documentation/gpu/drm-uapi.rst               |   6 +
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c   |   4 +-
 drivers/gpu/drm/drm_atomic.c                 |   5 +-
 drivers/gpu/drm/drm_atomic_uapi.c            |   2 +-
 drivers/gpu/drm/drm_crtc_internal.h          |   3 +-
 drivers/gpu/drm/drm_dp_mst_topology.c        |   9 +-
 drivers/gpu/drm/drm_drv.c                    |   3 +
 drivers/gpu/drm/drm_mipi_dbi.c               |   8 +-
 drivers/gpu/drm/drm_print.c                  | 235 ++++++++++++++++---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   8 +-
 drivers/gpu/drm/i2c/sil164_drv.c             |  12 +-
 drivers/gpu/drm/i915/display/intel_display.c |   4 +-
 drivers/gpu/drm/i915/i915_drv.c              |   3 +-
 drivers/gpu/drm/i915/i915_utils.c            |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  20 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h        |   4 +-
 include/drm/drm_print.h                      |  96 +++++++-
 17 files changed, 329 insertions(+), 98 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
