Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C12A0225
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 11:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD9C6ED74;
	Fri, 30 Oct 2020 10:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2606ED74
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 10:08:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t9so5752492wrq.11
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 03:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyVNIJTztKiRHheNSQoUfnLRDya4SJw9IE1Vxl86s7c=;
 b=Ghb99UprNaKvFH2nWksoxxcjJMtuQ7UBnEvdaqQ2Xt27pEUza+n/3VR0T/qCjTsgrw
 pnOgvc7R/Us4ABF8mAoJmL0AdohhbtFrlQIZHCXvlxhr3ShQwZsUCHMdPOY4nT2sPNV2
 3n2sDDQkLekRqiTyUq6gRYR6GdNDanQomtL14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyVNIJTztKiRHheNSQoUfnLRDya4SJw9IE1Vxl86s7c=;
 b=FDGLzr2y7/9pyQYuOkWio3whIc6jCkPQAfbVtH4dcZz4BCOihWvyNdxPkdCyZwjFhN
 5o1EUhVQFxe1eytYKn4vd7PxRRaVcvZVGTT2VJedoh2ysKBniOlp09hiIhGVr+0XqL/T
 J4voXhoxvSOxEUpkQOvJrgxu3VoTsm3zAkQK5+lzXFZUAh3Y2LVBJvsmj0NtGYWETGm0
 IaF6yj/lrjXG4ku/eUP1OhP8pwi7nVc7ZsADS7PtT40ddwM1YlIC5RJZ8+FQm9NJ+xwu
 eBSasZ50W5W/llZmR3XhE0oGKOf0pnJLbXKMFrqxuLR6AYKTkX9NegHEUHEaHE182Zl3
 yBSg==
X-Gm-Message-State: AOAM53338Mg5nMe9n/yk/DQ7VB9oJwnIjza2cxUhFmz5nMvMSki6+Bxv
 JpMqMFPssQGQ/6Ex9deHCxrH0FH5toUt7uZX
X-Google-Smtp-Source: ABdhPJw0H9VR4VRiDyzFX/cH5pwaV8XuDt6bBdU2cQb4UZ7RdbthoCu2zTbDyFJZiy6ZQIc6vY++Ww==
X-Received: by 2002:adf:f80a:: with SMTP id s10mr2082685wrp.275.1604052517093; 
 Fri, 30 Oct 2020 03:08:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 03:08:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 00/15] follow_pfn and other iomap races
Date: Fri, 30 Oct 2020 11:08:00 +0100
Message-Id: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all

Another update of my patch series to clamp down a bunch of races and gaps
around follow_pfn and other access to iomem mmaps. Previous version:

v1: https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
v2: https://lore.kernel.org/dri-devel/20201009075934.3509076-1-daniel.vetter@ffwll.ch
v3: https://lore.kernel.org/dri-devel/20201021085655.1192025-1-daniel.vetter@ffwll.ch/
v4: https://lore.kernel.org/dri-devel/20201026105818.2585306-1-daniel.vetter@ffwll.ch/

And the discussion that sparked this journey:

https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/

Changes in v5:
- Tomasz found some issues in the media patches
- Polish suggested by Christoph for the unsafe_follow_pfn patch

Changes in v4:
- Drop the s390 patch, that was very stand-alone and now queued up to land
  through s390 trees.
- Comment polish per Dan's review.

Changes in v3:
- Bunch of polish all over, no functional changes aside from one barrier
  in the resource code, for consistency.
- A few more r-b tags.

Changes in v2:
- tons of small polish&fixes all over, thanks to all the reviewers who
  spotted issues
- I managed to test at least the generic_access_phys and pci mmap revoke
  stuff with a few gdb sessions using our i915 debug tools (hence now also
  the drm/i915 patch to properly request all the pci bar regions)
- reworked approach for the pci mmap revoke: Infrastructure moved into
  kernel/resource.c, address_space mapping is now set up at open time for
  everyone (which required some sysfs changes). Does indeed look a lot
  cleaner and a lot less invasive than I feared at first.

I feel like this is ready for some wider soaking. Since the remaining bits
are all kinda connnected probably simplest if it all goes through -mm.

Cheers, Daniel

Daniel Vetter (15):
  drm/exynos: Stop using frame_vector helpers
  drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
  misc/habana: Stop using frame_vector helpers
  misc/habana: Use FOLL_LONGTERM for userptr
  mm/frame-vector: Use FOLL_LONGTERM
  media: videobuf2: Move frame_vector into media subsystem
  mm: Close race in generic_access_phys
  mm: Add unsafe_follow_pfn
  media/videbuf1|2: Mark follow_pfn usage as unsafe
  vfio/type1: Mark follow_pfn as unsafe
  PCI: Obey iomem restrictions for procfs mmap
  /dev/mem: Only set filp->f_mapping
  resource: Move devmem revoke code to resource framework
  sysfs: Support zapping of binary attr mmaps
  PCI: Revoke mappings like devmem

 drivers/char/mem.c                            |  86 +--------------
 drivers/gpu/drm/exynos/Kconfig                |   1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  48 ++++-----
 drivers/media/common/videobuf2/Kconfig        |   1 -
 drivers/media/common/videobuf2/Makefile       |   1 +
 .../media/common/videobuf2}/frame_vector.c    |  57 ++++------
 .../media/common/videobuf2/videobuf2-memops.c |   3 +-
 drivers/media/platform/omap/Kconfig           |   1 -
 drivers/media/v4l2-core/videobuf-dma-contig.c |   2 +-
 drivers/misc/habanalabs/Kconfig               |   1 -
 drivers/misc/habanalabs/common/habanalabs.h   |   6 +-
 drivers/misc/habanalabs/common/memory.c       |  50 ++++-----
 drivers/pci/pci-sysfs.c                       |   4 +
 drivers/pci/proc.c                            |   6 ++
 drivers/vfio/vfio_iommu_type1.c               |   4 +-
 fs/sysfs/file.c                               |  11 ++
 include/linux/ioport.h                        |   6 +-
 include/linux/mm.h                            |  47 +-------
 include/linux/sysfs.h                         |   2 +
 include/media/frame_vector.h                  |  47 ++++++++
 include/media/videobuf2-core.h                |   1 +
 kernel/resource.c                             | 101 +++++++++++++++++-
 mm/Kconfig                                    |   3 -
 mm/Makefile                                   |   1 -
 mm/memory.c                                   |  80 +++++++++++++-
 mm/nommu.c                                    |  27 ++++-
 security/Kconfig                              |  13 +++
 27 files changed, 360 insertions(+), 250 deletions(-)
 rename {mm => drivers/media/common/videobuf2}/frame_vector.c (84%)
 create mode 100644 include/media/frame_vector.h

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
