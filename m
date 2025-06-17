Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B733FADDB00
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 19:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1986110E033;
	Tue, 17 Jun 2025 17:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ET94/gYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0885010E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 17:59:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 762C45C680C;
 Tue, 17 Jun 2025 17:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224E6C4CEE3;
 Tue, 17 Jun 2025 17:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750183157;
 bh=LdbdRFx+Ehl4OgY5CnLFfZ3GVdzi7sFfhRUzd9mJ/Fs=;
 h=From:To:Cc:Subject:Date:From;
 b=ET94/gYeHAvPpJUMomSJtv1Jzzzxo/p9LI5dMKgSOrLCx8AMCTFe2cc5kzsrZusVi
 pZA6m0yZ3eKaKXwi4r0JXeI6Ld3NTTtLsUrAiE3RdbKqkYZlNPqR3OnR3xLiKJRwKy
 mW6b2l4vPUooj0+mJXLEuoIO3CsiafjR6Rj+bKNJKIt/ZpHfPG0gxvksHHdpQK2cNz
 a8C4ACij0uQLfbWMq1/4M0HxNo0dv1d0RkLuGmHvorhRb/hoy6zuFMv+jGHVlO+3kS
 JhY2OiBuSsuGefP3WTgx6UINJgVBrfUUnuzb/0WSXg7BO3iZhSfkAW/JAVJk1cTYdD
 WpHOVpKa8Tjuw==
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
Subject: [PATCH v2 0/6] PCI/VGA: Look at all PCI display devices in VGA arbiter
Date: Tue, 17 Jun 2025 12:59:04 -0500
Message-ID: <20250617175910.1640546-1-superm1@kernel.org>
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

On a mobile system with an AMD integrated GPU + NVIDIA discrete GPU the
AMD GPU is not being selected by some desktop environments for any
rendering tasks. This is because the neither GPU is being treated as
"boot_vga" but that is what some environments use to select a GPU [1].

The VGA arbiter driver only looks at devices that report as PCI display
VGA class devices. Neither GPU on the system is a display VGA class
device:

c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
c6:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Device 150e (rev d1)

This series introduces a new helper to find PCI display class devices
and adjusts various places in the kernel to use it.

It also adjust the VGA arbiter code to consider all these devices as
the VGA arbiter code does manage to select the correct device by looking
at which device is using the firmware framebuffer.

v1->v2:
 * Split helper to it's own patch
 * Add patches to use helper elsewhere in kernel
 * Simplify logic instead of making more passes

Mario Limonciello (6):
  PCI: Add helper for checking if a PCI device is a display controller
  vfio/pci: Use pci_is_display()
  vga_switcheroo: Use pci_is_display()
  iommu/vt-d: Use pci_is_display()
  ALSA: hda: Use pci_is_display()
  vgaarb: Look at all PCI display devices in VGA arbiter

 drivers/gpu/vga/vga_switcheroo.c |  2 +-
 drivers/iommu/intel/iommu.c      |  2 +-
 drivers/pci/pci-sysfs.c          |  2 +-
 drivers/pci/vgaarb.c             |  8 ++++----
 drivers/vfio/pci/vfio_pci_igd.c  |  3 +--
 include/linux/pci.h              | 15 +++++++++++++++
 sound/hda/hdac_i915.c            |  2 +-
 sound/pci/hda/hda_intel.c        |  4 ++--
 8 files changed, 26 insertions(+), 12 deletions(-)


base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.43.0

