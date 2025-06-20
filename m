Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A595DAE113A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 04:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC71510E20C;
	Fri, 20 Jun 2025 02:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BLmH3ddh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166B010E20C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 02:50:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 286A6A50E1D;
 Fri, 20 Jun 2025 02:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861FDC4CEEA;
 Fri, 20 Jun 2025 02:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750387799;
 bh=tVUGmwudnPHtt0FAp/eQCsy7CQzmylV7GVpKzRyrQJg=;
 h=From:To:Cc:Subject:Date:From;
 b=BLmH3ddh0nPQLvGOwLBQLZwrJOUsaYpuI2kEgbnH6ZtRch276fXQS0xPY1H078mDm
 q75Z4C04WDgTyP1KGLfar17f6fBNXrT497v7S4FPlgdvAmNsogPoRUccHYChCLpSFc
 zsrOSeP7SpX+TkYqydvB1fbqsVg+LzB+zyq+5wZg2JukriPj2bZnHTzfd8/R/ebW3p
 g09B6O/OGGIK8RgoSGW2v1j5Gg5tygKyW2WgSAxafqPYKhj41htmBRl+/C+jugkKu2
 RTVD85tVhod62FJ8SV/hYDq5LcDRbRQDnPiMwOhdM4Mdb98e6J3hVd6aSgXoKPOdaA
 DN9o3rXnyvNrA==
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
Subject: [PATCH v3 0/7] Adjust fbcon console device detection
Date: Thu, 19 Jun 2025 21:49:36 -0500
Message-ID: <20250620024943.3415685-1-superm1@kernel.org>
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
not change there. To avoid regression to fbcon, fall back to VGA arbiter.

In order for userspace to also be able to discover which device was the
primary framebuffer create a link to that device from fbcon.

v2->v3:
 * Pick up tags
 * Drop old patch 6
 * Add 2 new patches for fbcon

Link: https://lore.kernel.org/linux-pci/20250617175910.1640546-1-superm1@kernel.org/ [1]

Mario Limonciello (7):
  PCI: Add helper for checking if a PCI device is a display controller
  vfio/pci: Use pci_is_display()
  vga_switcheroo: Use pci_is_display()
  iommu/vt-d: Use pci_is_display()
  ALSA: hda: Use pci_is_display()
  PCI/VGA: Move check for firmware default out of VGA arbiter
  fbcon: Make a symlink to the device selected as primary

 arch/x86/video/video-common.c    | 28 +++++++++++++++++++++++++
 drivers/gpu/vga/vga_switcheroo.c |  2 +-
 drivers/iommu/intel/iommu.c      |  2 +-
 drivers/pci/vgaarb.c             | 36 ++------------------------------
 drivers/vfio/pci/vfio_pci_igd.c  |  3 +--
 drivers/video/fbdev/core/fbcon.c | 10 ++++++++-
 include/linux/pci.h              | 15 +++++++++++++
 sound/hda/hdac_i915.c            |  2 +-
 sound/pci/hda/hda_intel.c        |  4 ++--
 9 files changed, 60 insertions(+), 42 deletions(-)

-- 
2.43.0

