Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E821F164165
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42956E5A0;
	Wed, 19 Feb 2020 10:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0C46E59D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:32 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id a6so6141021wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TK5dzp5ligxOpGfGzgJo12623GuODFkBXw3/vQUAgYs=;
 b=b3JOmnVhkdnAkjjXlP+an1PSyXSTWi6A0m+mHWibaznA4bXasWvAoXzePfM8CrLFol
 teXivn0X+RpDGqnvJBAeFfF0aQHGMNiytJnuHR3+Evk2Ixft24bQssXIJ2S5UD1lmJPV
 2sHbccAGaBlVSktvcIK54ETdoPgO0TNvwasFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TK5dzp5ligxOpGfGzgJo12623GuODFkBXw3/vQUAgYs=;
 b=ROh7OqwsDxIS8vT028P3/2NUqkluG4DbMqNKryJBOevQGIYvOCF/jzYxMFXRW5qQ/X
 DdPdPH97c2vczEf4VxuccJJJ26cGpDtt6kLv2GtCSjeNkOkGvgt2aWKJYoBi2AHaCH+n
 ZDl1C0hnxxksGV211txcoI3W141pM7SRvy5cZ+IiruYrmj1tSSJmMzYQENCMC5cfZ0X8
 b9vuTLZmU/RJszmM7KqiUGjFrnxS/kLmVtPgYQeUBEjg3q4eCrfsjxdPDNGqet6sqveh
 Om0O4iIqnMUTGwcbmtqdWI2KJUcLdPUPdke25DYns5icG9B/4807HJqoS3KGFwXwz5b3
 kQxg==
X-Gm-Message-State: APjAAAXw1pb53O9cKxBpr2ZHTAm1Z5bGkxXmVK6Y7bDtOtCLWIs9Lcit
 4mu+ASvd2A5BTCcpKO0i5H0umPKDuj0=
X-Google-Smtp-Source: APXvYqzA0u7QIAkB2kzIVz6dZfGtpJC6SOH3LC1zOBxpy+sHzm1zPnM+AN582RJ95qpIBPcLckRA9A==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr8889164wme.153.1582107690678; 
 Wed, 19 Feb 2020 02:21:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:30 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/52] drm_device managed resources
Date: Wed, 19 Feb 2020 11:20:30 +0100
Message-Id: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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

So I finally bit the bullet and started a little framework for managed
resources tied to the drm_device lifetime, instead of the lifetime of the
underlying physical device. Because I've seen one patch too many that just
totally got this wrong.

Yes it's huge, but I think this is what we minimally need to show an
actual improvement, and at least a glimpse of the road ahead.

For reading the patch series I think it'd be best to start at the very
end, which contains the documentation for the entire thing. I've assembled
that at the end since a few of the intermediate states are a bit gross,
but necessary to get there with full bisectability.

Once you know where things will go, start at the front (the two very first
patches are just trivial prep that got in the way).

There's three major phases:

- Handling the final kfree of the structure containing the drm_device

- Converting drm_dev_fini to the managed resource framework

- Converting drm_mode_config_cleanup to the managed resource framework.

The last patch's commit message also contains a bit a todo about what next
possible steps could be.

Review (primarily on the big picture at least at first) but also testing
for all the drivers I'm touching very much appreciated.

Cheers, Daniel

Daniel Vetter (52):
  mm/sl[uo]b: export __kmalloc_track(_node)_caller
  drm/i915: Don't clear drvdata in ->release
  drm: add managed resources tied to drm_device
  drm: Set final_kfree in drm_dev_alloc
  drm/mipi_dbi: Use drmm_add_final_kfree in all drivers
  drm/udl: Use drmm_add_final_kfree
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
  drm/inigenic: Use drmm_add_final_kfree
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
 drivers/gpu/drm/drm_drv.c                     | 217 ++++++--------
 drivers/gpu/drm/drm_gem.c                     |  21 +-
 drivers/gpu/drm/drm_internal.h                |   5 +-
 drivers/gpu/drm/drm_managed.c                 | 278 ++++++++++++++++++
 drivers/gpu/drm/drm_mipi_dbi.c                |  24 +-
 drivers/gpu/drm/drm_mode_config.c             |  12 +-
 drivers/gpu/drm/drm_vblank.c                  |  31 +-
 drivers/gpu/drm/i915/i915_drv.c               |  21 +-
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  20 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c         |  17 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  35 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   9 +-
 drivers/gpu/drm/meson/meson_drv.c             |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 -
 drivers/gpu/drm/qxl/qxl_kms.c                 |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  10 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      |   2 -
 drivers/gpu/drm/shmobile/shmob_drm_kms.c      |   6 +-
 drivers/gpu/drm/stm/drv.c                     |  10 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  10 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |  19 +-
 drivers/gpu/drm/tidss/tidss_kms.h             |   1 -
 drivers/gpu/drm/tiny/gm12u320.c               | 225 ++++++--------
 drivers/gpu/drm/tiny/hx8357d.c                |   5 +-
 drivers/gpu/drm/tiny/ili9225.c                |   5 +-
 drivers/gpu/drm/tiny/ili9341.c                |   5 +-
 drivers/gpu/drm/tiny/ili9486.c                |   5 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |   5 +-
 drivers/gpu/drm/tiny/repaper.c                |  14 +-
 drivers/gpu/drm/tiny/st7586.c                 |   5 +-
 drivers/gpu/drm/tiny/st7735r.c                |   5 +-
 drivers/gpu/drm/udl/udl_drv.c                 |  14 +-
 drivers/gpu/drm/udl/udl_drv.h                 |   2 -
 drivers/gpu/drm/udl/udl_main.c                |  10 -
 drivers/gpu/drm/udl/udl_modeset.c             |  21 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 |  38 +--
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |   2 +
 drivers/gpu/drm/vgem/vgem_drv.c               |  15 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |  19 +-
 drivers/gpu/drm/xen/xen_drm_front.c           |   4 +-
 include/drm/drm_device.h                      |  12 +
 include/drm/drm_drv.h                         |   9 +-
 include/drm/drm_managed.h                     |  93 ++++++
 include/drm/drm_mipi_dbi.h                    |   1 -
 include/drm/drm_mode_config.h                 |   2 +-
 include/drm/drm_print.h                       |   6 +
 mm/slob.c                                     |   2 +
 mm/slub.c                                     |   2 +
 60 files changed, 816 insertions(+), 602 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_managed.c
 create mode 100644 include/drm/drm_managed.h

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
