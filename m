Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E908AEADDA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 06:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3354410E955;
	Fri, 27 Jun 2025 04:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HwNMc6br";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705F010E95B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 04:31:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1A3B5C643D;
 Fri, 27 Jun 2025 04:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A804C4CEE3;
 Fri, 27 Jun 2025 04:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750998675;
 bh=0M8ENBUgJpYWdqDPptXBiIAcVDOQpN779919of1Ylao=;
 h=From:To:Cc:Subject:Date:From;
 b=HwNMc6br/86SWTAf2Al9i/DC7sIhdMgBlr/piYuh5A7ga2cP+v2QumzvTssRb8ZJN
 o0woLJRiKrqiM+dXvzwt/+gfXV4ku2aXwAzfLvY62rxlWrjCuJ2lH+FJeWkne3rpHn
 H7JveObRMVtBrdcP/NbYAE15jX0kO0/PBcnzf6v69O0zSi2x1ozaObNMgcdWTAHyHD
 6+Es8DoRDoqWzQk7lcSIVHTIrCV7wyz4slJR1ZeslyFbsBeMaihJUbYVeIj/AVA1BP
 Tz2Uiz/wEzjjs4q7V/uBCbOpZgsUtCl3/Ik/kcf/pfRhPXGvzE1kCn9mR47gIwz70o
 87JfFd+kufeKQ==
From: Mario Limonciello <superm1@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 iommu@lists.linux.dev (open list:INTEL IOMMU (VT-d)),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 kvm@vger.kernel.org (open list:VFIO DRIVER),
 linux-sound@vger.kernel.org (open list:SOUND),
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v6 0/9] Adjust fbcon console device detection
Date: Thu, 26 Jun 2025 23:30:59 -0500
Message-ID: <20250627043108.3141206-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

This series started out as changes to VGA arbiter to try to handle a case
of a system with 2 GPUs that are not VGA devices [1].  This was discussed
but decided not to overload the VGA arbiter for non VGA devices.

Instead move the x86 specific detection of framebuffer resources into x86
specific code that the fbcon can use to properly identify the primary
device. This code is still called from the VGA arbiter, and the logic does
not change there. To avoid regression default to VGA arbiter and only fall
back to looking up with x86 specific detection method.

In order for userspace to also be able to discover which device was the
primary video display device create a new sysfs file 'boot_display'.

A matching userspace implementation for this file is available here:
https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/39
https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2038

It is suggested that this series merge entirely through the PCI tree.

Mario Limonciello (9):
  PCI: Add helper for checking if a PCI device is a display controller
  vfio/pci: Use pci_is_display()
  vga_switcheroo: Use pci_is_display()
  iommu/vt-d: Use pci_is_display()
  ALSA: hda: Use pci_is_display()
  Fix access to video_is_primary_device() when compiled without
    CONFIG_VIDEO
  PCI/VGA: Replace vga_is_firmware_default() with a screen info check
  fbcon: Use screen info to find primary device
  PCI: Add a new 'boot_display' attribute

 Documentation/ABI/testing/sysfs-bus-pci |  8 +++++
 arch/parisc/include/asm/video.h         |  2 +-
 arch/sparc/include/asm/video.h          |  2 ++
 arch/x86/include/asm/video.h            |  2 ++
 arch/x86/video/video-common.c           | 13 ++++++-
 drivers/gpu/vga/vga_switcheroo.c        |  2 +-
 drivers/iommu/intel/iommu.c             |  2 +-
 drivers/pci/pci-sysfs.c                 | 46 +++++++++++++++++++++++++
 drivers/pci/vgaarb.c                    | 31 +++--------------
 drivers/vfio/pci/vfio_pci_igd.c         |  3 +-
 include/linux/pci.h                     | 15 ++++++++
 sound/hda/hdac_i915.c                   |  2 +-
 sound/pci/hda/hda_intel.c               |  4 +--
 13 files changed, 97 insertions(+), 35 deletions(-)

-- 
2.43.0

