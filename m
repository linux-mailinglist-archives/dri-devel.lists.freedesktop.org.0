Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DC86BBEB3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 22:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D65310E329;
	Wed, 15 Mar 2023 21:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9793110E00E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 21:16:04 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:37096.426874733
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id A1ED8100210;
 Thu, 16 Mar 2023 05:15:51 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-698c9d7bb7-s8g24 with ESMTP id
 7debb2e646d9458da9ab23061c7de39e for maarten.lankhorst@linux.intel.com; 
 Thu, 16 Mar 2023 05:16:01 CST
X-Transaction-ID: 7debb2e646d9458da9ab23061c7de39e
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
Subject: [PATCH v7 0/2] drm: add kms driver for loongson display controller
Date: Thu, 16 Mar 2023 05:15:48 +0800
Message-Id: <20230315211550.2620818-1-15330273260@189.cn>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
  3) Untange lsdc_hdmi*_connector_detect() function according to the pipe
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
     on Linux 6.3.0-rc2. Thus, we send V7 to revival them.
  5) Remove depends on LOONGARCH || MIPS || COMPILE_TEST and other
     improvements to help review on x86 machine and add a cover letter
     to help patchwork tracking my patch.

  V1 ~ V4 can be found at link [1], V5 at link [2], V6 at link [3]

  [1] https://patchwork.freedesktop.org/series/113566/
  [2] https://patchwork.freedesktop.org/series/114386/
  [3] https://patchwork.freedesktop.org/patch/524532/

suijingfeng (2):
  MAINTAINERS: add maintainers for DRM LOONGSON driver
  drm: add kms driver for loongson display controller

 MAINTAINERS                             |   8 +
 drivers/gpu/drm/Kconfig                 |   2 +
 drivers/gpu/drm/Makefile                |   1 +
 drivers/gpu/drm/loongson/Kconfig        |  15 +
 drivers/gpu/drm/loongson/Makefile       |  16 +
 drivers/gpu/drm/loongson/lsdc_crtc.c    | 384 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.c | 261 +++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.c     | 502 +++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h     | 319 ++++++++++++++
 drivers/gpu/drm/loongson/lsdc_gem.c     | 291 ++++++++++++
 drivers/gpu/drm/loongson/lsdc_gem.h     |  26 ++
 drivers/gpu/drm/loongson/lsdc_i2c.c     | 172 ++++++++
 drivers/gpu/drm/loongson/lsdc_irq.c     |  88 ++++
 drivers/gpu/drm/loongson/lsdc_irq.h     |  11 +
 drivers/gpu/drm/loongson/lsdc_output.c  | 564 ++++++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h  |  14 +
 drivers/gpu/drm/loongson/lsdc_plane.c   | 409 +++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.c     | 338 ++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.h     |  76 ++++
 drivers/gpu/drm/loongson/lsdc_probe.c   |  85 ++++
 drivers/gpu/drm/loongson/lsdc_probe.h   |  11 +
 drivers/gpu/drm/loongson/lsdc_regs.h    | 370 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_ttm.c     | 422 ++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_ttm.h     |  71 +++
 24 files changed, 4456 insertions(+)
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

