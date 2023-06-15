Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3D3731B70
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 16:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E9E10E50F;
	Thu, 15 Jun 2023 14:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F92810E50E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 14:36:21 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:38118.1572836322
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 4E3041001F0;
 Thu, 15 Jun 2023 22:36:15 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 f5b862188a234ec9933da3971fac9fc5 for maarten.lankhorst@linux.intel.com; 
 Thu, 15 Jun 2023 22:36:17 CST
X-Transaction-ID: f5b862188a234ec9933da3971fac9fc5
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH v15 0/2] drm: Add kms driver for loongson display controller
Date: Thu, 15 Jun 2023 22:36:11 +0800
Message-Id: <20230615143613.1236245-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org, inux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Loongson display controller IP has been integrated in both Loongson north
bridge chipset (ls7a1000/ls7a2000) and Loongson SoCs (ls2k1000/ls2k2000).
It has even been included in Loongson's BMC products. It has two display
pipes, and each display pipe supports a primary plane and a cursor plane.

For the DC in the LS7a1000, each display pipe has a DVO output interface,
which is able to support 1920x1080@60Hz. For the DC in the LS7A2000, each
display pipe is equipped with a built-in HDMI encoder, which is compliant
with the HDMI 1.4 specification. The first display pipe is also equipped
with a transparent VGA encoder, which is parallel with the HDMI encoder.
To get a decent performance for writing framebuffer data to the VRAM, the
write combine support should be enabled.

v1 -> v2:
 1) Use hpd status reg when polling for ls7a2000.
 2) Fix all warnings that emerged when compiling with W=1.

v2 -> v3:
 1) Add COMPILE_TEST to Kconfig and make the driver off by default
 2) Alphabetical sorting headers (Thomas)
 3) Untangle register access functions as much as possible (Thomas)
 4) Switch to TTM-based memory manager (Thomas)
 5) Add the chip ID detection function which can be used to distinguish
    chip models
 6) Revise the built-in HDMI phy driver, nearly all main stream mode below
    4K@30Hz is tested, and this driver supports clone(mirror) display mode
    and extend(joint) display mode.

v3 -> v4:
 1) Quickly fix a small mistake.

v4 -> v5:
 1) Add per display pipe debugfs support to the builtin HDMI encoder.

v5 -> v6:
 1) Remove stray code which didn't get used, say lsdc_of_get_reserved_ram
 2) Fix all typos I could found, make sentences and code more readable
 3) Untangle lsdc_hdmi*_connector_detect() function according to the pipe
 4) Rename this driver as loongson.

v6 -> v7:
1) Add prime support for buffer self-sharing, sharing buffer with
   drm/etnaviv is also tested and it works with limitations.
2) Implement buffer object tracking with list_head.
3) Add S3(sleep to RAM) support
4) Rewrite lsdc_bo_move since TTM core stop allocating resources
    during BO creation. Patch V1 ~ V6 of this series no longer work.
    Thus, we send V7.

v7 -> v8:
 1) Zero a compile warning on a 32-bit platform, compile with W=1
 2) Revise lsdc_bo_gpu_offset() and make minor cleanups.
 3) Pageflip tested on the virtual terminal with the following commands:

    modetest -M loongson -s 32:1920x1080 -v
    modetest -M loongson -s 34:1920x1080 -v -F tiles

   It works like a charm, when running the pageflip test with dual screens
   configuration, another two additional BOs were created by the modetest,
   VRAM usage up to 40+ MB, well we have at least 64MB, still enough.

   # cat bos

       bo[0000]: size:     8112kB VRAM
       bo[0001]: size:       16kB VRAM
       bo[0002]: size:       16kB VRAM
       bo[0003]: size:    16208kB VRAM
       bo[0004]: size:     8112kB VRAM
       bo[0005]: size:     8112kB VRAM

v8 -> v9:
 1) Select I2C and I2C_ALGOBIT in Kconfig, should depend on MMU.
 2) Using pci_get_domain_bus_and_slot to get the GPU device.

v9 -> v10:
 1) Revise lsdc_drm_freeze() to implement S3 correctly. We realized that
    the pinned BO could not be moved, the VRAM lost power when sleeping
    to RAM. Thus, the data in the buffer who is pinned in VRAM will get
    lost when resumed. Yet it's not a big problem because this driver
    relies on the CPU to update the front framebuffer. We can see the
    garbage data when resume from S3, but the screen will show the right
    image as I move the cursor. This is due to the CPU repaint. v10 of
    this patch makes S3 perfect by unpin all of the BOs in VRAM, evict
    them all to system RAM in lsdc_drm_freeze().

v10 -> v11:
 1) On a double-screen case, The buffer object backing the single giant
    framebuffer is referenced by two GEM objects; hence, it will be
    pinned at least twice by prepare_fb() function. This causes its pin
    count > 1. V10 of this patch only unpins VRAM BOs once when suspend,
    which is not correct on double-screen case. V11 of this patch unpin
    the BOs until its pin count reaches zero when suspend. Then, we make
    the S3 support complete finally. With v11, I can't see any garbage
    data when resume.

 2) Fix vblank wait timeout when disable CRTC.
 3) Test against IGT, at least fbdev test and kms_flip test passed.
 4) Rewrite pixel PLL update function, magic numbers eliminated (Emil)
 5) Drop a few common hardware features description in lsdc_desc (Emil)
 6) Drop lsdc_mode_config_mode_valid(), instead add restrictions in dumb
    create function. (Emil)
 7) Untangle the ls7a1000 case and ls7a2000 case completely (Thomas)

v11 -> v12:
 none

v12 -> v13:
 1) Add benchmarks to figure out the bandwidth of the hardware platform.
    Usage:
    # cd /sys/kernel/debug/dri/0/
    # cat benchmark

 2) VRAM is filled with garbage data if uninitialized, add a buffer
    clearing procedure (lsdc_bo_clear), clear the BO on creation time.
 3) Update copyrights and adjust coding style (Huacai)

v13 -> v14:
 1) Trying to add async update support for cursor plane.

v14 -> v15:
 1) Add lsdc_vga_set_decode() funciton, which allow us remove multi-video
    cards workaround, now it allow drm/loongson, drm/amdgpu, drm/etnaviv
    co-exist in the system, more is also possible (Emil and Xuerui)
 2) Fix typos and grammar mistakes as much as possible (Xuerui)
 3) Unify copyrights as GPL-2.0+ (Xuerui)
 4) Fix a bug introduce since V13, TTM may import BO from other drivers,
    we shouldn't clear it on such a case.

Sui Jingfeng (2):
  drm: Add kms driver for loongson display controller
  MAINTAINERS: add maintainers for DRM LOONGSON driver

 MAINTAINERS                                   |    7 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/loongson/Kconfig              |   17 +
 drivers/gpu/drm/loongson/Makefile             |   22 +
 drivers/gpu/drm/loongson/loongson_device.c    |  102 ++
 drivers/gpu/drm/loongson/loongson_module.c    |   33 +
 drivers/gpu/drm/loongson/loongson_module.h    |   12 +
 drivers/gpu/drm/loongson/lsdc_benchmark.c     |  133 +++
 drivers/gpu/drm/loongson/lsdc_benchmark.h     |   13 +
 drivers/gpu/drm/loongson/lsdc_crtc.c          | 1024 +++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.c       |  110 ++
 drivers/gpu/drm/loongson/lsdc_drv.c           |  458 ++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h           |  388 +++++++
 drivers/gpu/drm/loongson/lsdc_gem.c           |  311 +++++
 drivers/gpu/drm/loongson/lsdc_gem.h           |   37 +
 drivers/gpu/drm/loongson/lsdc_gfxpll.c        |  199 ++++
 drivers/gpu/drm/loongson/lsdc_gfxpll.h        |   52 +
 drivers/gpu/drm/loongson/lsdc_i2c.c           |  179 +++
 drivers/gpu/drm/loongson/lsdc_i2c.h           |   29 +
 drivers/gpu/drm/loongson/lsdc_irq.c           |   74 ++
 drivers/gpu/drm/loongson/lsdc_irq.h           |   16 +
 drivers/gpu/drm/loongson/lsdc_output.h        |   21 +
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c |  178 +++
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  552 +++++++++
 drivers/gpu/drm/loongson/lsdc_pixpll.c        |  481 ++++++++
 drivers/gpu/drm/loongson/lsdc_pixpll.h        |   86 ++
 drivers/gpu/drm/loongson/lsdc_plane.c         |  799 +++++++++++++
 drivers/gpu/drm/loongson/lsdc_probe.c         |   56 +
 drivers/gpu/drm/loongson/lsdc_probe.h         |   12 +
 drivers/gpu/drm/loongson/lsdc_regs.h          |  406 +++++++
 drivers/gpu/drm/loongson/lsdc_ttm.c           |  591 ++++++++++
 drivers/gpu/drm/loongson/lsdc_ttm.h           |   99 ++
 33 files changed, 6500 insertions(+)
 create mode 100644 drivers/gpu/drm/loongson/Kconfig
 create mode 100644 drivers/gpu/drm/loongson/Makefile
 create mode 100644 drivers/gpu/drm/loongson/loongson_device.c
 create mode 100644 drivers/gpu/drm/loongson/loongson_module.c
 create mode 100644 drivers/gpu/drm/loongson/loongson_module.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_benchmark.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_benchmark.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output_7a1000.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output_7a2000.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.h

-- 
2.25.1

