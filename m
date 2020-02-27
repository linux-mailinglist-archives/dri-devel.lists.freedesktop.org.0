Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B1D172642
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ED26E944;
	Thu, 27 Feb 2020 18:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4926E920
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e8so4638106wrm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4pxRGasxWs3IVVzXpqxaRxT+ojOdwiUl21EFFbU5l8=;
 b=G82dpzyOfzaHYtPgPI2EEXzsk0USAw48iDrF61MDRujfDd6ppYVo2SzaLpoEk0wI2C
 tqEWO6dsCV7w8uZhMCOXhc9HJS6SOysZbkzOq72D9VJpGon3R5u8QwxwZHpKwYS02QlI
 WyBNU+pZhvMgazPpEe6o1ItQXI1bQUP8pz4No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4pxRGasxWs3IVVzXpqxaRxT+ojOdwiUl21EFFbU5l8=;
 b=CoshzhX/wVf/tuvL1Md0lMCEnUm8/Mi3Hyf2kgG/UqZF6qqlq60qabMvA7nMNms+oY
 3St5eMcBK+TMH5zDfL+bYQ0BMSlIoPQvOuwqdAtbFt8Ezj/CB4G4aFVYUWQ5Zyb6+Bak
 rEp943So830cROfG/Jihg/fdV2ZQGaj2ZX8WR2hvaItrXdIJlunQEAZqFyIfi3RIXbUL
 eXM6qXtqvDFrtazFFkQWD77WyJA/eCEzkeinp/qhKuz6rAxK8SffSZDXzHijazwXtnOl
 Ju31TtOssdNwRxZ8G8SWzjqB7DGF87NirucY7LcQWV1rwVfNXEzKxj5BU5yJv1hi/g/I
 XDlg==
X-Gm-Message-State: APjAAAVx7gPywXiputiTGEzy2/RqGgE0wgI5XiwAbKf/32Aa7W7OawkU
 lgYRhSc951nBaSnMsrEo2gD93Z02Z/0=
X-Google-Smtp-Source: APXvYqxydielobYk98ZNRqnUBA2GZn7SCmRdVvvxr8GTqlpMV+i6hSxcUeFU4JJ8Imaq2oeUM5fxIg==
X-Received: by 2002:adf:dfce:: with SMTP id q14mr131086wrn.324.1582827328706; 
 Thu, 27 Feb 2020 10:15:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:28 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/51] drm managed resources, v3
Date: Thu, 27 Feb 2020 19:14:31 +0100
Message-Id: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Bunch more bugfixes (intel-gfx-ci wasn't fully happy yet, and justifiedly
so) all over, bunch more acks/reviews.

Still need a lot more review and acks. Recommended reading order is still
to start with the doc patch at the end for the big picture, then the code
changes in sequence.

Also cc imx folks, they've realized that devm_kzalloc isn't a great idea
the hard way.

Cheers, Daniel

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
 drivers/gpu/drm/drm_drv.c                     | 219 ++++++-------
 drivers/gpu/drm/drm_gem.c                     |  21 +-
 drivers/gpu/drm/drm_internal.h                |   5 +-
 drivers/gpu/drm/drm_managed.c                 | 294 ++++++++++++++++++
 drivers/gpu/drm/drm_mipi_dbi.c                |  24 +-
 drivers/gpu/drm/drm_mode_config.c             |  13 +-
 drivers/gpu/drm/drm_vblank.c                  |  31 +-
 drivers/gpu/drm/i915/i915_drv.c               |  22 +-
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  33 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c         |  17 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  35 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   9 +-
 drivers/gpu/drm/meson/meson_drv.c             |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 -
 drivers/gpu/drm/qxl/qxl_kms.c                 |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  12 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      |   2 -
 drivers/gpu/drm/shmobile/shmob_drm_kms.c      |   6 +-
 drivers/gpu/drm/stm/drv.c                     |  10 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  10 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |  19 +-
 drivers/gpu/drm/tidss/tidss_kms.h             |   1 -
 drivers/gpu/drm/tiny/gm12u320.c               | 226 +++++---------
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
 include/drm/drm_managed.h                     | 116 +++++++
 include/drm/drm_mipi_dbi.h                    |   1 -
 include/drm/drm_mode_config.h                 |   2 +-
 include/drm/drm_print.h                       |   6 +
 mm/slob.c                                     |   2 +
 mm/slub.c                                     |   2 +
 60 files changed, 868 insertions(+), 609 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_managed.c
 create mode 100644 include/drm/drm_managed.h

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
