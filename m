Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27DBAEA862
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 22:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E722D10E28A;
	Thu, 26 Jun 2025 20:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hn9LJB4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4990A10E28A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 20:45:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4EF45C68E8;
 Thu, 26 Jun 2025 20:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4413AC4CEEB;
 Thu, 26 Jun 2025 20:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750970741;
 bh=y44KbF3C7rhYBkeJUpprj4Hik/9NkPbfiCyQ/CmZYI0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Hn9LJB4+wuyQ+xtwfZPAIAyfAmaPZUL8TYDnbOGgRk1KSbDX80XziLoX9/rjjXh6V
 h9waOa+PkLTNAYq+a3LdV0aqRp33R2fikWgze11a+4RZ6aArT8MOB9nS39tJnvfiMK
 NiT4q6hEuHnJarVyVAh+zl7vXxBSPzL8hyHmvVCzLDeE/UHCB37jK4BXOO4pYNh5oC
 3SH6f98nl6R+X5bjxWiBngJPgh2NlA86FPTgsyMD5IYaqdGtWtPXVU6zde6G4QojZg
 +b8epJ/QvMWT15Ffkzt35F32OqZ/B5Qg9ZZxqJSmgYQxvdVQc4qHXHbgABOgzqVASJ
 HDwhGBhsohBAQ==
Date: Thu, 26 Jun 2025 15:45:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
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
Subject: Re: [PATCH v5 7/9] PCI/VGA: Replace vga_is_firmware_default() with a
 screen info check
Message-ID: <20250626204540.GA1639372@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624203042.1102346-8-superm1@kernel.org>
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

On Tue, Jun 24, 2025 at 03:30:40PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> vga_is_firmware_default() checks firmware resources to find the owner
> framebuffer resources to find the firmware PCI device.  This is an
> open coded implementation of screen_info_pci_dev().  Switch to using
> screen_info_pci_dev() instead.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

(after the kernel robot issue is fixed, of course)

> ---
> v5:
>  * split from next patch
> ---
>  drivers/pci/vgaarb.c | 29 ++---------------------------
>  1 file changed, 2 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 78748e8d2dbae..c3457708c01e3 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -556,34 +556,9 @@ EXPORT_SYMBOL(vga_put);
>  
>  static bool vga_is_firmware_default(struct pci_dev *pdev)
>  {
> -#if defined(CONFIG_X86)
> -	u64 base = screen_info.lfb_base;
> -	u64 size = screen_info.lfb_size;
> -	struct resource *r;
> -	u64 limit;
> +	struct screen_info *si = &screen_info;
>  
> -	/* Select the device owning the boot framebuffer if there is one */
> -
> -	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> -		base |= (u64)screen_info.ext_lfb_base << 32;
> -
> -	limit = base + size;
> -
> -	/* Does firmware framebuffer belong to us? */
> -	pci_dev_for_each_resource(pdev, r) {
> -		if (resource_type(r) != IORESOURCE_MEM)
> -			continue;
> -
> -		if (!r->start || !r->end)
> -			continue;
> -
> -		if (base < r->start || limit >= r->end)
> -			continue;
> -
> -		return true;
> -	}
> -#endif
> -	return false;
> +	return pdev == screen_info_pci_dev(si);
>  }
>  
>  static bool vga_arb_integrated_gpu(struct device *dev)
> -- 
> 2.43.0
> 
