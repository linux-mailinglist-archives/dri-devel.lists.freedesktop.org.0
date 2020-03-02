Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109991766E4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFF76E152;
	Mon,  2 Mar 2020 22:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59366E152
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:26:42 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id a25so940622wmm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mo0WKFcTPqzM5GCiKelCgN6rPSNekfksp+Zo+oF6zVU=;
 b=JluWbLJxy1/vXYXZ0emARiZ5THJ2KBcou6csEPWKkQzoG0hbBzOFoOYZ51OJ7aR4K5
 3yye2WrPAaZz2aMNaaWyh/tgpuxMDGM9uYdOJiexzYxJnOcEVf/62N04KOHppsZWrh3K
 yJgfy2a71Q5V2yOTgfnJAV8LuPzJ5EyCXp97Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mo0WKFcTPqzM5GCiKelCgN6rPSNekfksp+Zo+oF6zVU=;
 b=CcgD9+S9youKQknmdCWI9F5slpvdq38t2tSE5aCMYRcB9vYfjIb/ZI7z6DzFd7yDWw
 Z0z4FPI9DXaBbwmgO3R/eP/RdfzPdXuxeMDb0hkz6jlk39agj8SKtAg1E8kX6cdyPnjH
 gj/C9nTENnFJjF8wlIwEENRkBRhFr5uy6ncELUEYVS6hxayq5HYMc8MHA+1CZWVYn7RU
 32zBES0rFWODj9NuJQ8LddXNzKFwEVUsl4DIsmVLQS+quB0zOe6pm2Jkt94xHHJZmNWj
 B1epVv6Jt6yMiHBQmA574Jm8dUgFCaGiJWrox9ovvhvgPrPuUelfFChD5HVE53ew808e
 knPg==
X-Gm-Message-State: ANhLgQ1RFvuniHiTjhyrdghxjjwAP8G8XsidVS2xEQWU2uZrwb5av+n8
 xnQBXwNPPdPvEHBVRSForT8ZMGf95ZY=
X-Google-Smtp-Source: ADFU+vsJVfxn4KXvaijfuzuwxpSg15n2K1OeQO5y7slFQ8bBKttZkB+c96r6BFtKHpOPIewaNBg4Lg==
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr532360wmj.34.1583188000634;
 Mon, 02 Mar 2020 14:26:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:26:40 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/51] drm_device managed resources, v4
Date: Mon,  2 Mar 2020 23:25:40 +0100
Message-Id: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Another round, another attempt at fixing the intel-gfx-ci issues in the
selftests. Plus a pile of polish all over, and a bunch more acks/reviews
added.

We're still missing quite a bit of review, so feedback very much welcome.

Thanks, Daniel

Daniel Vetter (51):
  mm/sl[uo]b: export __kmalloc_track(_node)_caller
  drm/i915: Don't clear drvdata in ->release
  drm: add managed resources tied to drm_device
  drm: Set final_kfree in drm_dev_alloc
  drm/mipi_dbi: Use drmm_add_final_kfree in all drivers
  drm/udl: Use drmm_add_final_kfree
  drm/qxl: Use drmm_add_final_kfree
  drm/i915: Use drmm_add_final_kfree
  drm/cirrus: Use drmm_add_final_kfree
  drm/v3d: Use drmm_add_final_kfree
  drm/tidss: Use drmm_add_final_kfree
  drm/mcde: Use drmm_add_final_kfree
  drm/vgem: Use drmm_add_final_kfree
  drm/vkms: Use drmm_add_final_kfree
  drm/repaper: Use drmm_add_final_kfree
  drm/ingenic: Use drmm_add_final_kfree
  drm/gm12u320: Use drmm_add_final_kfree
  drm/<drivers>: Use drmm_add_final_kfree
  drm: Cleanups after drmm_add_final_kfree rollout
  drm: Handle dev->unique with drmm_
  drm: Use drmm_ for drm_dev_init cleanup
  drm: manage drm_minor cleanup with drmm_
  drm: Manage drm_gem_init with drmm_
  drm: Manage drm_vblank_cleanup with drmm_
  drm: Garbage collect drm_dev_fini
  drm: Manage drm_mode_config_init with drmm_
  drm/bochs: Remove leftover drm_atomic_helper_shutdown
  drm/bochs: Drop explicit drm_mode_config_cleanup
  drm/cirrus: Drop explicit drm_mode_config_cleanup call
  drm/cirrus: Fully embrace devm_
  drm/ingenic: Drop explicit drm_mode_config_cleanup call
  drm/mcde: Drop explicit drm_mode_config_cleanup call
  drm/mcde: More devm_drm_dev_init
  drm/meson: Drop explicit drm_mode_config_cleanup call
  drm/pl111: Drop explicit drm_mode_config_cleanup call
  drm/rcar-du: Drop explicit drm_mode_config_cleanup call
  drm/rockchip: Drop explicit drm_mode_config_cleanup call
  drm/stm: Drop explicit drm_mode_config_cleanup call
  drm/shmob: Drop explicit drm_mode_config_cleanup call
  drm/mtk: Drop explicit drm_mode_config_cleanup call
  drm/tidss: Drop explicit drm_mode_config_cleanup call
  drm/gm12u320: More drmm_
  drm/gm12u320: Use devm_drm_dev_init
  drm/gm12u320: Use helpers for shutdown/suspend/resume
  drm/gm12u320: Simplify upload work
  drm/repaper: Drop explicit drm_mode_config_cleanup call
  drm/mipi-dbi: Move drm_mode_config_init into mipi library
  drm/mipi-dbi: Drop explicit drm_mode_config_cleanup call
  drm/udl: Drop explicit drm_mode_config_cleanup call
  drm/udl: drop drm_driver.release hook
  drm: Add docs for managed resources

 Documentation/gpu/drm-internals.rst           |  12 +
 drivers/gpu/drm/Makefile                      |   3 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |   2 +
 drivers/gpu/drm/armada/armada_drv.c           |   2 +
 drivers/gpu/drm/bochs/bochs.h                 |   1 -
 drivers/gpu/drm/bochs/bochs_drv.c             |   6 +-
 drivers/gpu/drm/bochs/bochs_kms.c             |  15 +-
 drivers/gpu/drm/cirrus/cirrus.c               |  74 ++---
 drivers/gpu/drm/drm_drv.c                     | 220 ++++++-------
 drivers/gpu/drm/drm_gem.c                     |  21 +-
 drivers/gpu/drm/drm_internal.h                |   5 +-
 drivers/gpu/drm/drm_managed.c                 | 305 ++++++++++++++++++
 drivers/gpu/drm/drm_mipi_dbi.c                |  24 +-
 drivers/gpu/drm/drm_mode_config.c             |  13 +-
 drivers/gpu/drm/drm_vblank.c                  |  31 +-
 drivers/gpu/drm/i915/i915_drv.c               |  22 +-
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  32 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c         |  17 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  35 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   9 +-
 drivers/gpu/drm/meson/meson_drv.c             |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 -
 drivers/gpu/drm/qxl/qxl_kms.c                 |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  14 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      |   2 -
 drivers/gpu/drm/shmobile/shmob_drm_kms.c      |   6 +-
 drivers/gpu/drm/stm/drv.c                     |  10 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  10 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |  19 +-
 drivers/gpu/drm/tidss/tidss_kms.h             |   1 -
 drivers/gpu/drm/tiny/gm12u320.c               | 226 +++++--------
 drivers/gpu/drm/tiny/hx8357d.c                |   5 +-
 drivers/gpu/drm/tiny/ili9225.c                |   5 +-
 drivers/gpu/drm/tiny/ili9341.c                |   5 +-
 drivers/gpu/drm/tiny/ili9486.c                |   5 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |   5 +-
 drivers/gpu/drm/tiny/repaper.c                |  18 +-
 drivers/gpu/drm/tiny/st7586.c                 |   5 +-
 drivers/gpu/drm/tiny/st7735r.c                |   5 +-
 drivers/gpu/drm/udl/udl_drv.c                 |  16 +-
 drivers/gpu/drm/udl/udl_drv.h                 |   2 -
 drivers/gpu/drm/udl/udl_main.c                |  10 -
 drivers/gpu/drm/udl/udl_modeset.c             |  21 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 |  38 +--
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |   2 +
 drivers/gpu/drm/vgem/vgem_drv.c               |  15 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |  19 +-
 drivers/gpu/drm/xen/xen_drm_front.c           |   4 +-
 include/drm/drm_device.h                      |  15 +
 include/drm/drm_drv.h                         |   9 +-
 include/drm/drm_managed.h                     | 116 +++++++
 include/drm/drm_mipi_dbi.h                    |   1 -
 include/drm/drm_mode_config.h                 |  19 +-
 include/drm/drm_print.h                       |   6 +
 mm/slob.c                                     |   2 +
 mm/slub.c                                     |   2 +
 60 files changed, 906 insertions(+), 610 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_managed.c
 create mode 100644 include/drm/drm_managed.h

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
