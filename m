Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC5E6CED74
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2484C10EB64;
	Wed, 29 Mar 2023 15:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3874E10EB55
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:50:43 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:58922.1411433373
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id CF745100211;
 Wed, 29 Mar 2023 23:50:39 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-bkw2h with ESMTP id
 126a1573416742bdbdd4f32dbe181f51 for maarten.lankhorst@linux.intel.com; 
 Wed, 29 Mar 2023 23:50:40 CST
X-Transaction-ID: 126a1573416742bdbdd4f32dbe181f51
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH v9 0/2] drm: add kms driver for loongson display controller
Date: Wed, 29 Mar 2023 23:50:31 +0800
Message-Id: <20230329155033.1303550-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: linaro-mm-sig@lists.linaro.org, loongson-kernel@lists.loongnix.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Loongson display controller IP has been integrated in both Loongson
North Bridge chipset(ls7a1000 and ls7a2000) and Loongson SoCs(ls2k1000
and ls2k2000 etc), it even has been included in Loongson BMC products.

This display controller is a PCI device, it has two display pipe. For
the DC in LS7A1000 and LS2K1000 each way has a DVO output interface
which provide RGB888 signals, vertical & horizontal synchronisations,
and the pixel clock. Each CRTC is able to support 1920x1080@60Hz,
the maximum resolution is 2048x2048 according to the hardware spec.

For the DC in LS7A2000, each display pipe is equipped with a built-in
HDMI encoder which is compliant with HDMI 1.4 specification, thus it
support 3840x2160@30Hz. The first display pipe is also equipped with
a transparent vga encoder which is parallel with the HDMI encoder.
The DC in LS7A2000 is more complete, besides above feature, it has
two hardware cursors, two hardware vblank counter and two scanout
position recorders.

 v1 -> v2:
  1) Use hpd status reg when polling for ls7a2000
  2) Fix all warnings emerged when compile with W=1

 v2 -> v3:
  1) Add COMPILE_TEST in Kconfig and make the driver off by default
  2) Alphabetical sorting headers (Thomas)
  3) Untangle register access functions as much as possible (Thomas)
  4) Switch to TTM based memory manager and prefer cached mapping
     for Loongson SoC (Thomas)
  5) Add chip id detection method, now all models are distinguishable.
  6) Revise builtin HDMI phy driver, nearly all main stream mode
     below 4K@30Hz is tested, this driver supported these mode very
     well including clone display mode and extend display mode.

 v3 -> v4:
  1) Quickly fix a small mistake.

 v4 -> v5:
  1) Drop potential support for Loongson 2K series SoC temporary,
     this part should be resend with the DT binding patch in the future.
  2) Add per display pipe debugfs support to the builtin HDMI encoder.
  3) Rewrite atomic_update() for hardware cursors plane(Thomas)
  4) Rewrite encoder and connector initialization part, untangle it
     according to the chip(Thomas).

 v5 -> v6:
  1) Remove stray code which didn't get used, say lsdc_of_get_reserved_ram
  2) Fix all typos I could found, make sentences and code more readable
  3) Untangle lsdc_hdmi*_connector_detect() function according to the pipe
  4) After a serious consideration, we rename this driver as loongson.
     Because we also have drivers toward the LoongGPU IP in LS7A2000 and
     LS2K2000. Besides, there are also drivers about the external encoder,
     HDMI audio driver and vbios support etc. This patch only provide DC
     driver part, my teammate Li Yi believe that loongson will be more
     suitable for loongson graphics than lsdc in the long run.

     loongson.ko = LSDC + LoongGPU + encoders driver + vbios/DT ...

  v6 -> v7:
   1) Add prime support, self-sharing is works. sharing buffer with etnaviv
      is also tested, and its works with limitation.
   2) Implement buffer objects tracking with list_head.
   3) S3(sleep to RAM) is tested on ls3a5000+ls7a2000 evb and it works.
   4) Rewrite lsdc_bo_move, since ttm core stop allocating resources
      during BO creation. Patch V1 ~ V6 of this series no longer works
      on latest kernel. Thus, we send V7 to revival them.

  v7 -> v8:
   1) Zero a compile warnnings on 32-bit platform, compile with W=1
   2) Revise lsdc_bo_gpu_offset() and minor cleanup
   3) Pageflip tested on the virtual terminal with following commands

      modetest -M loongson -s 32:1920x1080 -v
      modetest -M loongson -s 34:1920x1080 -v -F tiles

     It works like a charm, when running pageflip test with dual screnn
     configuration, another two additional bo created by the modetest
     emerged, VRAM usage up to 40+MB, well we have at least 64MB, still
     enough.

     # cat bos

         bo[0000]: size:     8112kB VRAM
         bo[0001]: size:       16kB VRAM
         bo[0002]: size:       16kB VRAM
         bo[0003]: size:    16208kB VRAM
         bo[0004]: size:     8112kB VRAM
         bo[0005]: size:     8112kB VRAM

  v8 -> v9:
   1) Select I2C and I2C_ALGOBIT in Kconfig and should depend on MMU.
   2) Using pci_get_domain_bus_and_slot to get the GPU device.
   3) Other minor improvements.

Sui Jingfeng (2):
  MAINTAINERS: add maintainers for DRM LOONGSON driver
  drm: add kms driver for loongson display controller

 MAINTAINERS                             |   7 +
 drivers/gpu/drm/Kconfig                 |   2 +
 drivers/gpu/drm/Makefile                |   1 +
 drivers/gpu/drm/loongson/Kconfig        |  17 +
 drivers/gpu/drm/loongson/Makefile       |  16 +
 drivers/gpu/drm/loongson/lsdc_crtc.c    | 381 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.c | 261 +++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.c     | 508 +++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h     | 324 ++++++++++++++
 drivers/gpu/drm/loongson/lsdc_gem.c     | 294 +++++++++++++
 drivers/gpu/drm/loongson/lsdc_gem.h     |  26 ++
 drivers/gpu/drm/loongson/lsdc_i2c.c     | 171 +++++++
 drivers/gpu/drm/loongson/lsdc_irq.c     |  86 ++++
 drivers/gpu/drm/loongson/lsdc_irq.h     |  12 +
 drivers/gpu/drm/loongson/lsdc_output.c  | 563 ++++++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h  |  14 +
 drivers/gpu/drm/loongson/lsdc_plane.c   | 432 ++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.c     | 338 ++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.h     |  76 ++++
 drivers/gpu/drm/loongson/lsdc_probe.c   |  86 ++++
 drivers/gpu/drm/loongson/lsdc_probe.h   |  11 +
 drivers/gpu/drm/loongson/lsdc_regs.h    | 370 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_ttm.c     | 426 ++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_ttm.h     |  71 +++
 24 files changed, 4493 insertions(+)
 create mode 100644 drivers/gpu/drm/loongson/Kconfig
 create mode 100644 drivers/gpu/drm/loongson/Makefile
 create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.h

-- 
2.25.1

