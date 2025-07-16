Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80055B080E1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 01:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640810E2E7;
	Wed, 16 Jul 2025 23:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PdRxKix7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADDF10E2E7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 23:23:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 97F7745885;
 Wed, 16 Jul 2025 23:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D48C4CEE7;
 Wed, 16 Jul 2025 23:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752708181;
 bh=kc48KClrflS3QKuEYBrw6FQdfI3+0RKI6uqfLZEJCJA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=PdRxKix7vIub6Gp83B+TjdRX9RT5n0aOAp+7iLG3sar+bkphz2AxNajgCR6Q5GetF
 kvrzzKiqY9/Ez8rJ6UCttQpmr4wbRxRjT7Qp+ad4M+04xdkpKXRHhnOSU+oQrQOcn5
 C7Rac+lPveNjLIqMz+krFJGo5a5J8PXunMqjny+Vj4ZhntS3TinZFib/sgkc9go1Dp
 Hla+maen/j4qwXWOK1ch0swazxv+ROJglFlI6zOBSc0x1B2QAZ2bX4CNdq8T36GSBG
 ZA779cD7dPXejEtlo5ztNScmQxaXBNUcRU28TZGdZxFnb9v9KTENfWg/MbrhXqBOkc
 Y1eO4q0QLnhKw==
Date: Wed, 16 Jul 2025 18:23:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v8 0/9] Adjust fbcon console device detection
Message-ID: <20250716232300.GA2565283@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714212147.2248039-1-superm1@kernel.org>
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

On Mon, Jul 14, 2025 at 04:21:37PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> This series started out as changes to VGA arbiter to try to handle a case
> of a system with 2 GPUs that are not VGA devices.  This was discussed
> but decided not to overload the VGA arbiter for non VGA devices.
> 
> Instead move the x86 specific detection of framebuffer resources into x86
> specific code that the fbcon can use to properly identify the primary
> device. This code is still called from the VGA arbiter, and the logic does
> not change there. To avoid regression default to VGA arbiter and only fall
> back to looking up with x86 specific detection method.
> 
> In order for userspace to also be able to discover which device was the
> primary video display device create a new sysfs file 'boot_display'.
> 
> A matching userspace implementation for this file is available here:
> Link: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/39
> Link: https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2038
> 
> Dave Airlie has been pinged for a comment on this approach.
> Dave had suggested in the past [1]:
> 
> "
>  But yes if that doesn't work, then maybe we need to make the boot_vga
>  flag mean boot_display_gpu, and fix it in the kernel
> "
> 
> This was one of the approached tried in earlier revisions and it was
> rejected in favor of creating a new sysfs file (which is what this
> version does).
> 
> It is suggested that this series merge entirely through the PCI tree.
> 
> Link: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/37#note_2938602 [1]

There's an underlying bug that we're trying to fix with this series
and the related libpciaccess and xserver changes, isn't there?  Can we
include that somewhere to help motivate this?  (I guess it's really
only the last two or three patches that are strictly related, right?)

> v8 fixes an LKP robot reported issue
> 
> Mario Limonciello (9):
>   PCI: Add helper for checking if a PCI device is a display controller
>   vfio/pci: Use pci_is_display()
>   vga_switcheroo: Use pci_is_display()
>   iommu/vt-d: Use pci_is_display()
>   ALSA: hda: Use pci_is_display()
>   Fix access to video_is_primary_device() when compiled without
>     CONFIG_VIDEO
>   PCI/VGA: Replace vga_is_firmware_default() with a screen info check
>   fbcon: Use screen info to find primary device
>   PCI: Add a new 'boot_display' attribute
> 
>  Documentation/ABI/testing/sysfs-bus-pci |  8 +++++
>  arch/parisc/include/asm/video.h         |  2 +-
>  arch/sparc/include/asm/video.h          |  2 ++
>  arch/x86/include/asm/video.h            |  2 ++
>  arch/x86/video/video-common.c           | 17 ++++++++-
>  drivers/gpu/vga/vga_switcheroo.c        |  2 +-
>  drivers/iommu/intel/iommu.c             |  2 +-
>  drivers/pci/pci-sysfs.c                 | 46 +++++++++++++++++++++++++
>  drivers/pci/vgaarb.c                    | 31 +++--------------
>  drivers/vfio/pci/vfio_pci_igd.c         |  3 +-
>  include/linux/pci.h                     | 15 ++++++++
>  sound/hda/hdac_i915.c                   |  2 +-
>  sound/pci/hda/hda_intel.c               |  4 +--
>  13 files changed, 101 insertions(+), 35 deletions(-)
> 
> -- 
> 2.43.0
> 
