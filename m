Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA7B211CB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 18:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10E710E51E;
	Mon, 11 Aug 2025 16:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hLnJICRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE1010E518
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 16:26:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 657A6A57455;
 Mon, 11 Aug 2025 16:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D049EC4CEED;
 Mon, 11 Aug 2025 16:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754929572;
 bh=gNYAqjTZupx5u8E+7jSecXNAwLHiAD/o4N6Lakyj2Ms=;
 h=From:To:Cc:Subject:Date:From;
 b=hLnJICRxVvO+g1TrTgxNMNOHIqx1nOpQnsDyp+/Y2tv46pM4kk0J5kU5ibttX4wE+
 KS/sETEhbDYwB5LXd0rFpd+rlvvdEWLE9afBF05qs01nNj5aM4o+qeH2fRaNiJSK4H
 6d4cm6nwI23sw7sIc2NwgjqBByy6bmq4+to8KyKeEWZX31xaYf7UGt/dGZXPKMrYBs
 IMkTR5HAMFinab6Bgi4BheyXhQy4USokXTThPHERcG4ZDZvxPqtg3AopUcuYfDiPQO
 y+RDxkb/ur2tMG7gxlfiTxVG5RYkObjFbUUk7/iH2hsVAb5ndwxbpfI/nsvOfSVk2d
 JGCv+/l0+MDvg==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 Daniel Dadap <ddadap@nvidia.com>, Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v10 0/4] Adjust fbcon console device detection
Date: Mon, 11 Aug 2025 11:26:02 -0500
Message-ID: <20250811162606.587759-1-superm1@kernel.org>
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

As the dependendent symbols are in 6.17-rc1 this can merge through
drm-misc-next.

Link: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/37#note_2938602 [1]

---
v10:
 * Add patches that didn't merge to v6.17-rc1 in
 * Move sysfs file to drm ownership

Mario Limonciello (AMD) (4):
  Fix access to video_is_primary_device() when compiled without
    CONFIG_VIDEO
  PCI/VGA: Replace vga_is_firmware_default() with a screen info check
  fbcon: Use screen info to find primary device
  DRM: Add a new 'boot_display' attribute

 Documentation/ABI/testing/sysfs-class-drm |  8 +++++
 arch/parisc/include/asm/video.h           |  2 +-
 arch/sparc/include/asm/video.h            |  2 ++
 arch/x86/include/asm/video.h              |  2 ++
 arch/x86/video/video-common.c             | 25 +++++++++++++-
 drivers/gpu/drm/drm_sysfs.c               | 41 +++++++++++++++++++++++
 drivers/pci/vgaarb.c                      | 31 +++--------------
 7 files changed, 83 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-drm


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.43.0

