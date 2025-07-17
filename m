Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3517B09350
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 19:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7091910E86E;
	Thu, 17 Jul 2025 17:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MfNsPaxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C5410E86E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 17:38:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2DE1C44608;
 Thu, 17 Jul 2025 17:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB44C4CEE3;
 Thu, 17 Jul 2025 17:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752773902;
 bh=HMRVZWEXmaYc2Zc2cFVavR2PqNmonVLbZH+86HyVwiw=;
 h=From:To:Cc:Subject:Date:From;
 b=MfNsPaxjUp1Pjz4H96JqkhZjofo0GdFbLT03skjKKlu5rUqGBZHAwsTcKk5oEotNo
 CP90yzu2stYpo71vcRQN03uGiSGoEd40w78wOSb9uikCR7UWyCQe+IWE/xPht2deqe
 5eKsGo3uG6EdCJQRsi54cZZNxBZl0YtsM3Fy1lJb6e37vRSZp5DiJjKlOlzVP5MP2l
 Ig7eEjBDBg6RGE3vsomuUi08aA3Mv9olx0uZI27u0M/AWR86t9DUdQLPaUh7Dh5SbX
 1aUsKIylZL64Fb4oSkNbP2JdnEAj2zA5H0ipWJLg/8L2w9anjQsowu7BeXRzpY3Uww
 n4vIsJcaRGHtw==
From: Mario Limonciello <superm1@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
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
Subject: [PATCH v9 0/9] Adjust fbcon console device detection
Date: Thu, 17 Jul 2025 12:38:03 -0500
Message-ID: <20250717173812.3633478-1-superm1@kernel.org>
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

Systems with more than one GPU userspace doesn't know which one to be
used to treat as primary.  The concept of primary is important to be
able to decide which GPU is used for display and  which is used for
rendering.  If it's guessed wrong then both GPUs will be kept awake
burning a lot of power.

Historically it would use the "boot_vga" attribute but this isn't
present on modern GPUs.

This series started out as changes to VGA arbiter to try to handle a case
of a system with 2 GPUs that are not VGA devices and avoid changes to
userspace.  This was discussed but decided not to overload the VGA arbiter
for non VGA devices.

Instead move the x86 specific detection of framebuffer resources into x86
specific code that the fbcon can use to properly identify the primary
device. This code is still called from the VGA arbiter, and the logic does
not change there. To avoid regression default to VGA arbiter and only fall
back to looking up with x86 specific detection method.

In order for userspace to also be able to discover which device was the
primary video display device create a new sysfs file 'boot_display'.

A matching userspace implementation for this file is available here:
Link: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/39
Link: https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2038

Dave Airlie has been pinged for a comment on this approach.
Dave had suggested in the past [1]:

"
 But yes if that doesn't work, then maybe we need to make the boot_vga
 flag mean boot_display_gpu, and fix it in the kernel
"

This was one of the approached tried in earlier revisions and it was
rejected in favor of creating a new sysfs file (which is what this
version does).

It is suggested that this series merge entirely through the PCI tree.

Link: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/37#note_2938602 [1]

v9:
 * Add more to cover letter
 * Add bug link to last patch
 * Update commit message for last patch
 * Update boot_display documentation description

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

 Documentation/ABI/testing/sysfs-bus-pci |  9 +++++
 arch/parisc/include/asm/video.h         |  2 +-
 arch/sparc/include/asm/video.h          |  2 ++
 arch/x86/include/asm/video.h            |  2 ++
 arch/x86/video/video-common.c           | 17 ++++++++-
 drivers/gpu/vga/vga_switcheroo.c        |  2 +-
 drivers/iommu/intel/iommu.c             |  2 +-
 drivers/pci/pci-sysfs.c                 | 46 +++++++++++++++++++++++++
 drivers/pci/vgaarb.c                    | 31 +++--------------
 drivers/vfio/pci/vfio_pci_igd.c         |  3 +-
 include/linux/pci.h                     | 15 ++++++++
 sound/hda/hdac_i915.c                   |  2 +-
 sound/pci/hda/hda_intel.c               |  4 +--
 13 files changed, 102 insertions(+), 35 deletions(-)

-- 
2.43.0

