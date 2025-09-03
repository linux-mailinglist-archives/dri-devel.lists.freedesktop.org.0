Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E18B4139D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 06:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526ED10E1F0;
	Wed,  3 Sep 2025 04:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CjFXhU0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD57F10E1F0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 04:43:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AC1956013B;
 Wed,  3 Sep 2025 04:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC1AC4CEF0;
 Wed,  3 Sep 2025 04:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756874579;
 bh=aWz5MDl+vUp3tC2LaOmVwlwThf5DJzTm0+LvRWNW0BU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CjFXhU0cO5IsSRZTwXpbGzZrNsCGG3WbO57KNfS3fpMcQ6VCmn0L76qI2+Scs931C
 kMMPcYyiw3RPL6gj0gkM/dfrL+33sX9He6/18ykz5xBTZp7QVg1PYJ3ELRLitwB/qE
 8ctu6g6/+eo+OsuoggDLPxRpR0NgJz7HjpiHNKqOj2ts8se92yJitpiEF9w/AnQkiv
 WyVAgHzzJqKqNOhe4e8IKfqWXaALmAuzlXRif9C8UM5S4oBeGeDLTVp4CBCiIh2zQ4
 ewx0NUjbKG+3psobCjDMIdr2unEij/Y3e1gImlSEGCn3ksoyJ5CoOHim7SDgk2oAZ4
 X8goCEB0EbShA==
Message-ID: <4e3d62bb-11de-4538-a244-251bd7d0d52e@kernel.org>
Date: Tue, 2 Sep 2025 23:42:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] Adjust fbcon console device detection
To: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>
References: <20250811162606.587759-1-superm1@kernel.org>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250811162606.587759-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 8/11/2025 11:26 AM, Mario Limonciello (AMD) wrote:
> Systems with more than one GPU userspace doesn't know which one to be
> used to treat as primary.  The concept of primary is important to be
> able to decide which GPU is used for display and  which is used for
> rendering.  If it's guessed wrong then both GPUs will be kept awake
> burning a lot of power.
> 
> Historically it would use the "boot_vga" attribute but this isn't
> present on modern GPUs.
> 
> This series started out as changes to VGA arbiter to try to handle a case
> of a system with 2 GPUs that are not VGA devices and avoid changes to
> userspace.  This was discussed but decided not to overload the VGA arbiter
> for non VGA devices.
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
>   But yes if that doesn't work, then maybe we need to make the boot_vga
>   flag mean boot_display_gpu, and fix it in the kernel
> "
> 
> This was one of the approached tried in earlier revisions and it was
> rejected in favor of creating a new sysfs file (which is what this
> version does).
> 
> As the dependendent symbols are in 6.17-rc1 this can merge through
> drm-misc-next.
> 
> Link: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/37#note_2938602 [1]
> 
> ---
> v10:
>   * Add patches that didn't merge to v6.17-rc1 in
>   * Move sysfs file to drm ownership
> 
> Mario Limonciello (AMD) (4):
>    Fix access to video_is_primary_device() when compiled without
>      CONFIG_VIDEO
>    PCI/VGA: Replace vga_is_firmware_default() with a screen info check
>    fbcon: Use screen info to find primary device
>    DRM: Add a new 'boot_display' attribute
> 
>   Documentation/ABI/testing/sysfs-class-drm |  8 +++++
>   arch/parisc/include/asm/video.h           |  2 +-
>   arch/sparc/include/asm/video.h            |  2 ++
>   arch/x86/include/asm/video.h              |  2 ++
>   arch/x86/video/video-common.c             | 25 +++++++++++++-
>   drivers/gpu/drm/drm_sysfs.c               | 41 +++++++++++++++++++++++
>   drivers/pci/vgaarb.c                      | 31 +++--------------
>   7 files changed, 83 insertions(+), 28 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-drm
> 
> 
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585

Bjorn,

Any feedback for this series?

Thanks,

