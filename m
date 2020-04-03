Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85CE19D816
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CB76EB99;
	Fri,  3 Apr 2020 13:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0296EB9A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h9so8654108wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8/N8JPFZBswClTGR7ryKNpwNdSbMA6fevSc4DawaN04=;
 b=Qzw/GylBgGbYqHa+mTxNzflIUHE6dZIIXhUqJvgKOEQYMu3RGCS1MQf1OroAJMWHFk
 cMxgUdU4Q/e42mVe/8025EnRiMVAYKbWhMAZZdcioH3dWR2yulmmYPbHw2RujpaFizAZ
 tS114aTlTO2sqWtoYvPTQsp1t/nhGQM2w6ink=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8/N8JPFZBswClTGR7ryKNpwNdSbMA6fevSc4DawaN04=;
 b=pmWkPfARlg+zgERgga/RoXiX5uE46z/bUpE1McjSTXWkcliw4yhQcesWy/B4YyslHO
 WPuTcXLRvL2buWucsnk2rj34iQOwuxOdB6GG2TR48tJtNQOerb1/bxthRucWofapHT27
 BhDNjfNX8cFvUTTH0KNfmi0q2ZNPNXqEuHRrdTO2w/IGICqu7dFbyXNHwv47rOa/EfUl
 iPJtZ3VwlZm5ted27WvdldB1WkuUszF6SntHkjPHZXvseWoAa/DJRUd3dbAlycGB+Ipx
 B3ms1h447JsYnZMdII9VcsoH8F1sK7D2BlKRdGGB+GO3g9IBnd+fLfwv+v+xeKb10aXW
 PNCQ==
X-Gm-Message-State: AGi0PubAnIPxxQlnKa29/C3XAW/jHHVhsYM4lLPS2n2B2p7N53EOpjFk
 Mn4uPS08ggWvkSRPSGqucCVZ3RLNEVO5mw==
X-Google-Smtp-Source: APiQypKAcqqbQkOstiFuer/6xUZr8xQdkRYGCDOKd8knwuXVbfrAdtIDM20WL6VVqSgZSmDOGJaEAg==
X-Received: by 2002:adf:e747:: with SMTP id c7mr1940062wrn.29.1585922315055;
 Fri, 03 Apr 2020 06:58:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:34 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/44] devm_drm_dev_alloc, no more drmm_add_final_kfree
Date: Fri,  3 Apr 2020 15:57:44 +0200
Message-Id: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
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

Here's the promised follow-up to get rid of the drmm_add_final_kfree calls
from drivers. I've also sprinkled in a bunch of cleanups for the drivers
I've had to touch anyway. I think with devm_drm_dev_alloc we now have a
very neat and clean way to init the drm_device, and all the interim stage
with drm_dev_init and devm_drm_dev_init are unexported.

For reading, documenation changes are all concentrated in the last patch,
because the interim state would result in way too much shuffling and
readjusting.

The driver core patch is only required for vkms, vgem and i915/selftest
patches, everything else only needs the patch to add devm_drm_dev_alloc.
Once that's landed we can merge driver patches in any order, only the
final patch needs to wait until everything has landed.

As usual, review, testing and comments very much appreciated.

Cheers, Daniel

Daniel Vetter (44):
  drivers/base: Always release devres on device_del
  drm: Add devm_drm_dev_alloc macro
  drm/device: Deprecate dev_private harder
  drm/vgem: Use devm_drm_dev_alloc
  drm/vkms: Use devm_drm_dev_alloc
  drm/vboxvideo: drop DRM_MTRR_WC #define
  drm/vboxvideo: Use devm_drm_dev_alloc
  drm/vboxvideo: Stop using drm_device->dev_private
  drm/vboxvidoe: use managed pci functions
  drm/vboxvideo: Use devm_gen_pool_create
  drm/v3d: Don't set drm_device->dev_private
  drm/v3d: Use devm_drm_dev_alloc
  drm/v3d: Delete v3d_dev->dev
  drm/v3d: Delete v3d_dev->pdev
  drm/udl: Use demv_drm_dev_alloc
  drm/udl: don't set drm_device->dev_private
  drm/st7735r: Use devm_drm_dev_alloc
  drm/st7586: Use devm_drm_dev_alloc
  drm/repaper: Use devm_drm_dev_alloc
  drm/mi0283qt: Use devm_drm_dev_alloc
  drm/ili9486: Use devm_drm_dev_alloc
  drm/ili9341: Use devm_drm_dev_alloc
  drm/ili9225: Use devm_drm_dev_alloc
  drm/hx8357d: Use devm_drm_dev_alloc
  drm/gm12u320: Use devm_drm_dev_alloc
  drm/gm12u320: Don't use drm_device->dev_private
  drm/tidss: Use devm_drm_dev_alloc
  drm/tidss: Don't use drm_device->dev_private
  drm/tidss: Delete tidss->saved_state
  drm/qxl: Use devm_drm_dev_alloc
  drm/qxl: Don't use drm_device->dev_private
  drm/mcde: Use devm_drm_dev_alloc
  drm/mcde: Don't use drm_device->dev_private
  drm/ingenic: Use devm_drm_dev_alloc
  drm/ingenic: Don't set drm_device->dev_private
  drm/komeda: use devm_drm_dev_alloc
  drm/armada: Use devm_drm_dev_alloc
  drm/armada: Don't use drm_device->dev_private
  drm/cirrus: Use devm_drm_dev_alloc
  drm/cirrus: Don't use drm_device->dev_private
  drm/i915: Use devm_drm_dev_alloc
  drm/i915/selftest: Create mock_destroy_device
  drm/i915/selftests: align more to real device lifetimes
  drm/managed: Cleanup of unused functions and polishing docs

 .../driver-api/driver-model/devres.rst        |   2 +-
 drivers/base/dd.c                             |   2 +
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  16 +-
 drivers/gpu/drm/armada/armada_crtc.c          |   4 +-
 drivers/gpu/drm/armada/armada_debugfs.c       |   2 +-
 drivers/gpu/drm/armada/armada_drm.h           |   2 +
 drivers/gpu/drm/armada/armada_drv.c           |  30 +---
 drivers/gpu/drm/armada/armada_fbdev.c         |   4 +-
 drivers/gpu/drm/armada/armada_gem.c           |   4 +-
 drivers/gpu/drm/armada/armada_overlay.c       |   8 +-
 drivers/gpu/drm/cirrus/cirrus.c               |  22 ++-
 drivers/gpu/drm/drm_drv.c                     | 142 ++++++------------
 drivers/gpu/drm/drm_internal.h                |   1 +
 drivers/gpu/drm/drm_managed.c                 |  15 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |   2 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   2 +-
 .../drm/i915/gem/selftests/i915_gem_object.c  |   2 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |   2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |   2 +-
 drivers/gpu/drm/i915/i915_drv.c               |  17 +--
 drivers/gpu/drm/i915/i915_pci.c               |   2 -
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |   2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |   2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |   2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |   2 +-
 .../drm/i915/selftests/intel_memory_region.c  |   2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  33 ++--
 .../gpu/drm/i915/selftests/mock_gem_device.h  |   5 +
 drivers/gpu/drm/ingenic/ingenic-drm.c         |  15 +-
 drivers/gpu/drm/mcde/mcde_display.c           |  10 +-
 drivers/gpu/drm/mcde/mcde_drm.h               |   2 +
 drivers/gpu/drm/mcde/mcde_drv.c               |  21 +--
 drivers/gpu/drm/mcde/mcde_dsi.c               |   2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c             |   7 +-
 drivers/gpu/drm/qxl/qxl_display.c             |  32 ++--
 drivers/gpu/drm/qxl/qxl_drv.c                 |  23 +--
 drivers/gpu/drm/qxl/qxl_drv.h                 |   7 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                |   2 +-
 drivers/gpu/drm/qxl/qxl_gem.c                 |   2 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c               |  14 +-
 drivers/gpu/drm/qxl/qxl_irq.c                 |   2 +-
 drivers/gpu/drm/qxl/qxl_kms.c                 |  13 +-
 drivers/gpu/drm/qxl/qxl_object.c              |   2 +-
 drivers/gpu/drm/qxl/qxl_release.c             |   2 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                 |   2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c            |  16 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  17 +--
 drivers/gpu/drm/tidss/tidss_drv.h             |   4 +-
 drivers/gpu/drm/tidss/tidss_irq.c             |  12 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |   2 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |   6 +-
 drivers/gpu/drm/tiny/gm12u320.c               |  24 ++-
 drivers/gpu/drm/tiny/hx8357d.c                |  13 +-
 drivers/gpu/drm/tiny/ili9225.c                |  13 +-
 drivers/gpu/drm/tiny/ili9341.c                |  13 +-
 drivers/gpu/drm/tiny/ili9486.c                |  13 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |  13 +-
 drivers/gpu/drm/tiny/repaper.c                |  14 +-
 drivers/gpu/drm/tiny/st7586.c                 |  13 +-
 drivers/gpu/drm/tiny/st7735r.c                |  13 +-
 drivers/gpu/drm/udl/udl_connector.c           |   4 +-
 drivers/gpu/drm/udl/udl_drv.c                 |  37 ++---
 drivers/gpu/drm/udl/udl_modeset.c             |   6 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c             |  12 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 |  47 +++---
 drivers/gpu/drm/v3d/v3d_drv.h                 |   7 +-
 drivers/gpu/drm/v3d/v3d_gem.c                 |  17 ++-
 drivers/gpu/drm/v3d/v3d_irq.c                 |  16 +-
 drivers/gpu/drm/v3d/v3d_mmu.c                 |  10 +-
 drivers/gpu/drm/v3d/v3d_sched.c               |  10 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  26 +---
 drivers/gpu/drm/vboxvideo/vbox_drv.h          |   1 +
 drivers/gpu/drm/vboxvideo/vbox_irq.c          |   2 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c         |  29 ++--
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  10 +-
 drivers/gpu/drm/vboxvideo/vbox_ttm.c          |  12 --
 drivers/gpu/drm/vgem/vgem_drv.c               |  51 ++-----
 drivers/gpu/drm/vkms/vkms_drv.c               |  48 ++----
 include/drm/drm_device.h                      |   9 +-
 include/drm/drm_drv.h                         |  51 +++++--
 81 files changed, 422 insertions(+), 660 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
