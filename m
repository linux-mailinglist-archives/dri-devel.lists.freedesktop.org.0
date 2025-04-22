Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42876A979AF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 23:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410510E3BE;
	Tue, 22 Apr 2025 21:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FcrQXoBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AB210E3BE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 21:47:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 758B1614E0;
 Tue, 22 Apr 2025 21:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451DBC4CEE9;
 Tue, 22 Apr 2025 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745358433;
 bh=RPojC3b1nEKZhf0p4kkS9DaOsT5aYr010F373zcdvwA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=FcrQXoBnsiYdtAHICcGnYrZR32ZHOHqmCEv0xTKizpCD7unfxt4Yn4CuFV3u9Iq62
 tAtIwwDtA9R6tpADG7ZzPMkKldbT/diHNIRNSmt05n9KmvpNWVzv0w1XhnCKaauuwg
 xQ7xxNW7lq4wZWKqx1/+Y5aiFzGNtq8ggf5nWB2pdlcjKGnKnVtBjDSpJ7r7E8ZsYA
 0qckIK47D4DzXJbt3PEl3X5SmlRLNT/+9szkUQWyW16L5n1yVnCO1cKDsGswSS9VJl
 jctj/u1y4JOueiyZD8sW65AAxdr9u65SlsUVOJek+LlkKSWIWPx4fJC/Zi1jYgLSVh
 wl8p0NFG2e47g==
Date: Tue, 22 Apr 2025 16:47:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, iivanov@suse.de, tiwai@suse.de, bhelgaas@google.com,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] video: screen_info: Relocate framebuffers behind PCI
 bridges
Message-ID: <20250422214711.GA385826@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422075056.12989-1-tzimmermann@suse.de>
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

On Tue, Apr 22, 2025 at 09:49:57AM +0200, Thomas Zimmermann wrote:
> Apply bridge window offsets to screen_info framebuffers during
> relocation. Fixes invalid access to I/O memory.
> 
> Resources behind a PCI bridge can be located at a certain offset
> in the kernel's I/O range. The framebuffer memory range stored in
> screen_info refers to the offset as seen during boot (essentialy 0).
> During boot up, the kernel may assign a different memory offset to
> the bridge device and thereby relocating the framebuffer address of
> the PCI graphics device as seen by the kernel. The information in
> screen_info must be updated as well.

I can't see the bug report below, so I'm not sure what's happening
here.  Apparently the platform is one where PCI bus addresses are not
identical to CPU physical addresses.  On such platforms, the PCI host
bridge applies an offset between CPU and PCI addresses.  There are
several systems like that, but I'm not aware of any that change that
CPU->PCI bus address offset at runtime.

So I suspect the problem is not that the kernel has assigned a
different offset.  I think it's more likely that the hardware or
firmware has determined the offset before the kernel starts, and this
code just doesn't account for that.

I don't know what "stored in screen_info" means.  Most of the
addresses filled in by screen_info_resources() are hard-coded bus
addresses specified by PCI and VGA specs.  These are not just offsets
"seen during boot"; these are legacy addresses that are not
programmable via usual PCI BARs.  They're hard-wired into VGA devices,
so if we use the VGA frame buffer at 0xA0000, the 0xA0000 address must
appear on the PCI bus.

VIDEO_TYPE_VLFB and VIDEO_TYPE_EFI are exceptions; I don't know how
they work, but if they return addresses from firmware, I would expect 
them to be PCI bus addresses as well.

> The helper pcibios_bus_to_resource() performs the relocation of
> the screen_info resource. The result now matches the I/O-memory
> resource of the PCI graphics device. As before, we store away the
> information necessary to update the information in screen_info.
> 
> Commit 78aa89d1dfba ("firmware/sysfb: Update screen_info for relocated
> EFI framebuffers") added the code for updating screen_info. It is
> based on similar functionality that pre-existed in efifb. Efifb uses
> a pointer to the PCI resource, while the newer code does a memcpy of
> the region. Hence efifb sees any updates to the PCI resource and avoids
> the issue.
> 
> v2:
> - Fixed tags (Takashi, Ivan)
> - Updated information on efifb
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: "Ivan T. Ivanov" <iivanov@suse.de>
> Closes: https://bugzilla.suse.com/show_bug.cgi?id=1240696

This bug isn't public.  Can it be made public?  Or even better, a
report at https://bugzilla.kernel.org?

s/essentialy/essentially/

> Tested-by: "Ivan T. Ivanov" <iivanov@suse.de>
> Fixes: 78aa89d1dfba ("firmware/sysfb: Update screen_info for relocated EFI framebuffers")
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.9+
> ---
>  drivers/video/screen_info_pci.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/screen_info_pci.c b/drivers/video/screen_info_pci.c
> index 6c5833517141..c46c75dc3fae 100644
> --- a/drivers/video/screen_info_pci.c
> +++ b/drivers/video/screen_info_pci.c
> @@ -8,7 +8,7 @@
>  static struct pci_dev *screen_info_lfb_pdev;
>  static size_t screen_info_lfb_bar;
>  static resource_size_t screen_info_lfb_offset;
> -static struct resource screen_info_lfb_res = DEFINE_RES_MEM(0, 0);
> +static struct pci_bus_region screen_info_lfb_region;
>  
>  static bool __screen_info_relocation_is_valid(const struct screen_info *si, struct resource *pr)
>  {
> @@ -31,7 +31,7 @@ void screen_info_apply_fixups(void)
>  	if (screen_info_lfb_pdev) {
>  		struct resource *pr = &screen_info_lfb_pdev->resource[screen_info_lfb_bar];
>  
> -		if (pr->start != screen_info_lfb_res.start) {
> +		if (pr->start != screen_info_lfb_region.start) {
>  			if (__screen_info_relocation_is_valid(si, pr)) {
>  				/*
>  				 * Only update base if we have an actual
> @@ -69,10 +69,21 @@ static void screen_info_fixup_lfb(struct pci_dev *pdev)
>  
>  	for (i = 0; i < numres; ++i) {
>  		struct resource *r = &res[i];
> +		struct pci_bus_region bus_region = {
> +			.start = r->start,
> +			.end = r->end,
> +		};

screen_info_resources() above fills in "struct resource res[]", but
that's not quite right.  A struct resource contains CPU addresses, and
screen_info_resources() fills in PCI bus addresses (0xa0000, etc).

struct pci_bus_region is meant to hold PCI bus addresses, so this
assignment gets them back where they should be.

>  		const struct resource *pr;
>  
>  		if (!(r->flags & IORESOURCE_MEM))
>  			continue;
> +
> +		/*
> +		 * Translate the address to resource if the framebuffer
> +		 * is behind a PCI bridge.
> +		 */
> +		pcibios_bus_to_resource(pdev->bus, r, &bus_region);

And this converts the PCI bus addresses to CPU addresses, so this
makes sense.

The comment might be a little misleading, though.  When PCI bus
addresses are different from CPU addresses, it's because the PCI host
bridge has applied an offset.  This only happens at the host bridge,
never at a PCI-PCI bridge (which is what "PCI bridge" usually means).

The commit log and comments could maybe be clarified, but this all
looks to me like it's doing the right thing in spite of abusing the
use of struct resource.

>  		pr = pci_find_resource(pdev, r);
>  		if (!pr)
>  			continue;
> @@ -85,7 +96,7 @@ static void screen_info_fixup_lfb(struct pci_dev *pdev)
>  		screen_info_lfb_pdev = pdev;
>  		screen_info_lfb_bar = pr - pdev->resource;
>  		screen_info_lfb_offset = r->start - pr->start;
> -		memcpy(&screen_info_lfb_res, r, sizeof(screen_info_lfb_res));
> +		memcpy(&screen_info_lfb_region, &bus_region, sizeof(screen_info_lfb_region));
>  	}
>  }
>  DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY, 16,
> -- 
> 2.49.0
> 
