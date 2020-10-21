Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E8929499B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDE56EA8A;
	Wed, 21 Oct 2020 08:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9465D6E10C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:57:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c194so734091wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gont0CCKnHMdGa6wrKlYRfieb2OHeQGvhAdNIYmokXs=;
 b=VVnDgmxWGYk+ZwdNbZx6Qfo0t6kaRkEL0VNWUHATbLIt3jMjgaYOfdtnMpPlXBmHJZ
 gFnQDrMYEk/gKZHAwJOELTKxwsgwZW/CWn+u6zaKjIMCN9lm18HqsVeG9jRC0MGVpVvf
 8q8WCf23NrfOC9Q0xk18B4qoZ/OnP3rTMfyrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gont0CCKnHMdGa6wrKlYRfieb2OHeQGvhAdNIYmokXs=;
 b=kkW7WMq7gpa2Qjek/5dWVw8rizGmETdN6YG4kzau3IlkeE60BDHJVjh/LX0VHv+ZIO
 nPScMcUOyG4IKQAHO8gmYO+iuxqieeiWFvgiYb/0y5IJDc7H8+JU/VXZYiWV48ufb5L/
 5F13pHJK+H+5hr/9/eJQhE7kQk8xGwuZNV4VQr+WpPzMwFWu3fVvoHOzd9rzqV8DbKBi
 5kidbQbGdzcdeZX5u0Owcaqv38Ld9IEzFO3FgW8kFXz0QlAUcGiG/cZ/NCUASj0TUa5V
 zfxij1O+i7ucT3h0QmI9+wDJk/x1TLph/BfgHAfsVvfD4Ux1w+XqL/maSMcqyMDPCWmH
 P3Aw==
X-Gm-Message-State: AOAM530kyPvUDsMhx8P7n3PuNx0MtHJpI9Rta5aNf2J3gwtDxyMYuhju
 F8nCyp0F88Nr5ai8SHvPv73uUaJswDAsYw1b
X-Google-Smtp-Source: ABdhPJyYzWpMyeyH5q5wodO7eI820GbpOZirLgvPnOfJ1Y9pegsPCbV57mxWuzvlDgRCukgCBprgLQ==
X-Received: by 2002:a1c:dc8b:: with SMTP id t133mr2490486wmg.151.1603270621770; 
 Wed, 21 Oct 2020 01:57:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:57:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 00/16] follow_pfn and other iomap races
Date: Wed, 21 Oct 2020 10:56:39 +0200
Message-Id: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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

Round 3 of my patch series to clamp down a bunch of races and gaps
around follow_pfn and other access to iomem mmaps. Previous version:

v1: https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
v2: https://lore.kernel.org/dri-devel/20201009075934.3509076-1-daniel.vetter@ffwll.ch

And the discussion that sparked this journey:

https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/

I was waiting for the testing result for habanalabs from Oded, but I guess
Oded was waiting for my v3.

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

The big thing I can't test are all the frame_vector changes in habanalbas,
exynos and media. Gerald has given the s390 patch a spin already.

Review, testing, feedback all very much welcome.

Cheers, Daniel
Daniel Vetter (16):
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

 arch/s390/pci/pci_mmio.c                      |  98 ++++++++++-------
 drivers/char/mem.c                            |  86 +--------------
 drivers/gpu/drm/exynos/Kconfig                |   1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  48 ++++-----
 drivers/media/common/videobuf2/Kconfig        |   1 -
 drivers/media/common/videobuf2/Makefile       |   1 +
 .../media/common/videobuf2}/frame_vector.c    |  54 ++++------
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
 mm/memory.c                                   |  76 ++++++++++++-
 mm/nommu.c                                    |  17 +++
 security/Kconfig                              |  13 +++
 27 files changed, 403 insertions(+), 285 deletions(-)
 rename {mm => drivers/media/common/videobuf2}/frame_vector.c (85%)
 create mode 100644 include/media/frame_vector.h

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
