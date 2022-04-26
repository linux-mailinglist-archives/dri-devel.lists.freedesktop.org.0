Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134650F0A6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 08:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E36110EEC6;
	Tue, 26 Apr 2022 06:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 56356 seconds by postgrey-1.36 at gabe;
 Tue, 26 Apr 2022 06:08:42 UTC
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C769910EEC6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 06:08:42 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1650953320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ug9uQ7MO8p5lAMaOYLg82gdoR0QvVH+wRiaruaTU7/M=;
 b=H0dx5u62TZdPskxIIVhdsChJfduatSw8eVPGqkb/o6/xCbHB6fmS99y1cn+Np4lvGH8eXC
 h1wqWv/cVIwctMp8/GQI7KJTI4av9hLXnIdVhWaMVLPbGoQfrT2bq1Nt+gxYstLkt2OhpC
 hHwKYlaC3fnbkznyLO6tBkT22Yd6nGM=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Subject: [PATCH v2 0/4] drm/nvdla: Add driver support for NVDLA
Date: Tue, 26 Apr 2022 14:07:57 +0800
Message-Id: <20220426060808.78225-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
which is integrated into NVIDIA Jetson AGX Xavier,
so add driver support for this accelerator."

v1->v2:
*Rename nvdla_drm.[ch] to nvdla_drv.[ch] and rename nvdla_ioctl.h to nvdla_drm.h,
 move it to uapi.
 comments link: https://lore.kernel.org/lkml/20bac605-97e6-e5cd-c4e4-83a8121645d8@amd.com/
*Remove the  onexistent filename  in Makefile
 comments link: https://lore.kernel.org/lkml/202204201512.pp20MXT5-lkp@intel.com/
*Sort file names alphabetically in Makefile.
*Rearrange the error messages, and use drm_err/_dbg() instead of pr_err/_dbg().
*Replace  "dla_" prefix with "nvdla_"
*Check the iosys_map by iosys_map_is_null(), and check "ret" directly.
*Using iosys_map_memcpy_to/_from() for iosys_map instead of memcpy()
*Fix parameter error "dma_buf_vunmap(buf, ptr)", use "&map" instead of "ptr"
*Use iosys_map instead of kvaddr and use "iosys_map_set_vaddr()" to initialize iosys_map
*Using "vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node)" to update vm_pgoff is cleaner
*Remove the unused nvdla_drm_gem_mmap, register drm_gem_mmap to file_operations directly.
*Use DEFINE_DRM_GEM_FOPS() to define nvdla_drm_fops.
*Remove the unused nvdla_drm_gem_mmap_buf, register drm_gem_prime_mmap to drm_driver directly.
 comments link: https://lore.kernel.org/lkml/7fa19996-5830-af3d-ab24-08c76e1d5604@suse.de/
*Fix typo and some code style
*Remove unused function nvdla_get_time_us()
 comments link: https://lore.kernel.org/lkml/0fa9ab41-c18e-a569-e6fe-a0e9d965905e@stargateuniverse.net/

Cai Huoqing (4):
  MAINTAINERS: Add the driver info of the NVDLA
  drm/nvdla: Add driver support for NVDLA
  drm/nvdla: Add register head file of NVDLA
  drm/nvdla/uapi: Add UAPI of NVDLA driver

 MAINTAINERS                             |    7 +
 drivers/gpu/drm/Kconfig                 |    2 +
 drivers/gpu/drm/Makefile                |    1 +
 drivers/gpu/drm/nvdla/Kconfig           |    8 +
 drivers/gpu/drm/nvdla/Makefile          |   17 +
 drivers/gpu/drm/nvdla/nvdla_bdma.c      |  198 +
 drivers/gpu/drm/nvdla/nvdla_cache.c     |  202 +
 drivers/gpu/drm/nvdla/nvdla_cdp.c       |  299 ++
 drivers/gpu/drm/nvdla/nvdla_common.c    |  293 ++
 drivers/gpu/drm/nvdla/nvdla_common.h    |  835 +++
 drivers/gpu/drm/nvdla/nvdla_conv.c      |  684 +++
 drivers/gpu/drm/nvdla/nvdla_drv.c       |  694 +++
 drivers/gpu/drm/nvdla/nvdla_drv.h       |  129 +
 drivers/gpu/drm/nvdla/nvdla_engine.c    |  233 +
 drivers/gpu/drm/nvdla/nvdla_engine.h    |  272 +
 drivers/gpu/drm/nvdla/nvdla_gem.c       |  358 ++
 drivers/gpu/drm/nvdla/nvdla_pdp.c       |  448 ++
 drivers/gpu/drm/nvdla/nvdla_reg.h       | 6411 +++++++++++++++++++++++
 drivers/gpu/drm/nvdla/nvdla_rubik.c     |  214 +
 drivers/gpu/drm/nvdla/nvdla_sched.h     |   37 +
 drivers/gpu/drm/nvdla/nvdla_scheduler.c | 1012 ++++
 drivers/gpu/drm/nvdla/nvdla_sdp.c       |  723 +++
 include/uapi/drm/nvdla_drm.h            |   99 +
 23 files changed, 13176 insertions(+)
 create mode 100644 drivers/gpu/drm/nvdla/Kconfig
 create mode 100644 drivers/gpu/drm/nvdla/Makefile
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_bdma.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_cache.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_cdp.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_conv.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_drv.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_drv.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_gem.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_pdp.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_reg.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_rubik.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_sched.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_scheduler.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_sdp.c
 create mode 100644 include/uapi/drm/nvdla_drm.h

-- 
2.25.1

