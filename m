Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C18288430
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8851C6EC70;
	Fri,  9 Oct 2020 07:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5C86EC70
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:59:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e2so8909852wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=immTPDdSm8V7ezbOteojXYm/j7WkY1f3P9Y0YpK7onQ=;
 b=DEazGm3//HS7eifrtPTNpv9gPNwxpuxjM7cgzXbcLG0mO5e39cJ73eX9iQKQEkxr4Y
 FwEAxZ/eknqujf87zOGqp6tESSOeL2I6VSIobgrZsNnXiWlr9VWW7WhVnV0GrVhO4vMj
 1v4YtSGCDuC7IGf+ELUEOwyj9sMdI3c9bq3Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=immTPDdSm8V7ezbOteojXYm/j7WkY1f3P9Y0YpK7onQ=;
 b=TlOlrdM2Xh8p/2xSjZw/EurstqvdKN4iv7vOCUmX8cFOLjmS8/dCttbEtWb3/MpIHY
 GkoA8AgtySeCqzVLouzcbzTXPrZ4TlvTOkJSAAtKTP9tQymxwdAcWeXQKXItfAHTITch
 gMJQXTPTzNJc+KG2xAre7NapEG7pX6R5+KznONIubx/ixijUDL8EYwN9H0/NzXjaFo+5
 fDEygj+uqykGvw3PAR0TJ3ciHWn0vFJMwNdayst41puQ0QVaqt8te2uoQUKsh3pJoPrR
 poj9H88P1XxqHgl87E8cn3DXCbXHoNqEV35jF+Wunt3W9s3FYaJaI/CSRXpIyHR2dTbt
 Xo3w==
X-Gm-Message-State: AOAM533yvjmYkUE1Z4UPMGh/oGTFb2w+TJN9vP8277VK1tITayptMuMe
 0lPd3QMTotiZGg7F6jThbNzqfN513V1jUgTA
X-Google-Smtp-Source: ABdhPJzyDJpFjA/Q+sv1RhX5gsGPQpkP/4WlxxT8RLqjQWQaBWIid1inU3iHz1dJQWF+W7VpBZ1zIA==
X-Received: by 2002:a1c:f311:: with SMTP id q17mr13703008wmq.168.1602230391713; 
 Fri, 09 Oct 2020 00:59:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.00.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 00:59:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 00/17] follow_pfn and other iomap races
Date: Fri,  9 Oct 2020 09:59:17 +0200
Message-Id: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 kvm@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Round two of my patch series to clamp down a bunch of races and gaps
around follow_pfn and other access to iomem mmaps. Previous version:

v1: https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/

And the discussion that sparked this journey:

https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/

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

The big thing I can't test are all the frame_vector changes in habanalbas,
exynos and media. Gerald has given the s390 patch a spin already.

Review, testing, feedback all very much welcome.

Cheers, Daniel

Daniel Vetter (17):
  drm/exynos: Stop using frame_vector helpers
  drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
  misc/habana: Stop using frame_vector helpers
  misc/habana: Use FOLL_LONGTERM for userptr
  mm/frame-vector: Use FOLL_LONGTERM
  media: videobuf2: Move frame_vector into media subsystem
  mm: Close race in generic_access_phys
  s390/pci: Remove races against pte updates
  mm: Add unsafe_follow_pfn
  media/videbuf1|2: Mark follow_pfn usage as unsafe
  vfio/type1: Mark follow_pfn as unsafe
  PCI: Obey iomem restrictions for procfs mmap
  /dev/mem: Only set filp->f_mapping
  resource: Move devmem revoke code to resource framework
  sysfs: Support zapping of binary attr mmaps
  PCI: Revoke mappings like devmem
  drm/i915: Properly request PCI BARs

 arch/s390/pci/pci_mmio.c                      | 98 +++++++++++--------
 drivers/char/mem.c                            | 86 +---------------
 drivers/gpu/drm/exynos/Kconfig                |  1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 48 ++++-----
 drivers/gpu/drm/i915/intel_uncore.c           | 25 ++++-
 drivers/media/common/videobuf2/Kconfig        |  1 -
 drivers/media/common/videobuf2/Makefile       |  1 +
 .../media/common/videobuf2}/frame_vector.c    | 54 ++++------
 drivers/media/platform/omap/Kconfig           |  1 -
 drivers/media/v4l2-core/videobuf-dma-contig.c |  2 +-
 drivers/misc/habanalabs/Kconfig               |  1 -
 drivers/misc/habanalabs/common/habanalabs.h   |  3 +-
 drivers/misc/habanalabs/common/memory.c       | 50 ++++------
 drivers/pci/pci-sysfs.c                       |  4 +
 drivers/pci/proc.c                            |  6 ++
 drivers/vfio/vfio_iommu_type1.c               |  4 +-
 fs/sysfs/file.c                               | 11 +++
 include/linux/ioport.h                        |  6 +-
 include/linux/mm.h                            | 47 +--------
 include/linux/sysfs.h                         |  2 +
 include/media/videobuf2-core.h                | 42 ++++++++
 kernel/resource.c                             | 95 +++++++++++++++++-
 mm/Kconfig                                    |  3 -
 mm/Makefile                                   |  1 -
 mm/memory.c                                   | 76 +++++++++++++-
 mm/nommu.c                                    | 17 ++++
 security/Kconfig                              | 13 +++
 27 files changed, 412 insertions(+), 286 deletions(-)
 rename {mm => drivers/media/common/videobuf2}/frame_vector.c (85%)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
