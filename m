Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E51779BA7
	for <lists+dri-devel@lfdr.de>; Sat, 12 Aug 2023 01:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A8510E030;
	Fri, 11 Aug 2023 23:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68A10E030
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 23:49:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8185D67C04;
 Fri, 11 Aug 2023 23:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B577AC433C8;
 Fri, 11 Aug 2023 23:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691797774;
 bh=lvyc5+WYzavz74MfhYZvuWoQcJPYUBOS18BDP6pLKVA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=PJyz9LGZInzYKoqqxS7x5q/cVNuyXxPcB9c2dJy/JUYmqHGL5kHzkB9W+682c15O5
 NzXHH+LjraNWokF/Jop8Ry5RA56GE3Giqwp2Q3FzvyA/Bly03vuH+daxwU5kMGLQce
 bDH+p29fVitq6xq9fSs3vIrSZFG8O7xBUvRledPphTjSNdblErVxdGY3LDXmG2AhgH
 OlriE8wQlxr9BziYwvpLd0JGUrMXj8E5Tqqia4Gecqixkc78SC8jY1+JMTQkwaATQP
 7Iv5tYQOXtYU52Xv9aYD5M/ggWdDBkOIjzApSA7W3Nn+jvVmtdzFyzlh9Im16l+qRX
 0kxw2UB5d7g/Q==
Date: Fri, 11 Aug 2023 18:49:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH] PCI/VGA: Make the vga_is_firmware_default() less
 arch-independent
Message-ID: <20230811234932.GA116749@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230808145859.1590625-1-suijingfeng@loongson.cn>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 10:58:59PM +0800, Sui Jingfeng wrote:
> Currently, the vga_is_firmware_default() function works only on x86 and
> IA64 architectures, but it is a no-op on ARM64, PPC, RISC-V, etc. This
> patch completes the implementation by tracking the firmware framebuffer's
> address range. The added code is trying to identify the VRAM aperture that
> contains the firmware framebuffer. Once found, related information about
> the VRAM aperture will be tracked.
> 
> Note that we need to identify the VRAM aperture before it get moved. We
> achieve this by using DECLARE_PCI_FIXUP_CLASS_HEADER(), which ensures that
> vga_arb_firmware_fb_addr_tracker() gets called before PCI resource
> allocation. Once we found the VRAM aperture that contains firmware fb, we
> are able to monitor the address changes of it. If the VRAM aperture of the
> primary GPU do moved, we will update our cached firmware framebuffer's
> address range accordingly. This approach overcomes the VRAM bar relocation
> issue successfully. Hence, this patch make the vga_is_firmware_default()
> function works on whatever arch that has UEFI GOP support, including x86
> and IA64. But, at the first step, we make it available only on platforms
> which PCI resource relocation do happens. Once provided method proved to
> be effective and reliable, it can be expanded to other arch easily.

I think this patch tries to solve two problems, and it should be split
into two patches:

  1) Identify firmware framebuffer on arches other than x86 and ia64
  2) Deal with VGA devices where the PCI core has moved the BAR
     containing the framebuffer

For x86 and ia64, vga_is_firmware_default() currently gets the
framebuffer base and size from screen_info.  Whenever
vga_arbiter_add_pci_device() adds a VGA device, we check to see if it
has a BAR containing the framebuffer.

It looks like this patch retains that for x86 and ia64, but only if
CONFIG_EFI=y.  I think CONFIG_EFI is optional for both x86 and ia64,
so it looks like this will break systems where CONFIG_X86=y and
CONFIG_EFI is not set.

> This patch is tested on
> 1) LS3A5000+LS7A2000 and LS3A5000+LS7A1000 platform.
> 2) Intel i3-8100 CPU + H110 D4L motherboard with triple video cards:
> 
> $ lspci | grep VGA
> 
> Intel Corporation CoffeeLake-S GT2 [UHD Graphics 630]
> Advanced Micro Devices, Inc. [AMD/ATI] Ellesmere [Radeon RX 470] (rev cf)
> ASPEED Technology, Inc. ASPEED Graphics Family (rev 52)
> 
> Note that on x86, in order to testing the new approach this patch provided,
> we remove the vga_arb_get_fb_range_from_screen_info() call in
> vga_is_firmware_default() function, as following.
> 
> -#if defined(CONFIG_X86) || defined(CONFIG_IA64)
> -       ret = vga_arb_get_fb_range_from_screen_info(&fb_start, &fb_end);
> -#else
>         ret = vga_arb_get_fb_range_from_tracker(&fb_start, &fb_end);
> -#endif
> 
> It is just that we don't observe the case which VRAM Bar of VGA compatible
> controller moves, so there just no need to unify it. But on LoongArch,
> the VRAM Bar of AMDGPU do moves.
> 
> v2:
> 	* Fix test robot warnnings and fix typos
> 
> v3:
> 	* Fix linkage problems if the global screen_info is not exported

This doesn't build on x86:

  $ git checkout -b wip/sui-vga-default-arch-independent v6.5-rc1
  $ b4 am 20230808145859.1590625-1-suijingfeng@loongson.cn
  $ git am ./20230808_suijingfeng_pci_vga_make_the_vga_is_firmware_default_less_arch_independent.mbx
  $ make drivers/pci/vgaarb.o
    CC      drivers/pci/vgaarb.o
  drivers/pci/vgaarb.c:114:13: error: ‘vga_arb_get_fb_range_from_tracker’ defined but not used [-Werror=unused-function]
    114 | static bool vga_arb_get_fb_range_from_tracker(resource_size_t *start,
	|             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/pci/vgaarb.c | 154 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 139 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 5a696078b382..e0919a70af3e 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -61,6 +61,92 @@ static bool vga_arbiter_used;
>  static DEFINE_SPINLOCK(vga_lock);
>  static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
>  
> +static struct firmware_fb_tracker {
> +	/* The PCI(e) device who owns the firmware framebuffer */
> +	struct pci_dev *pdev;
> +	/* The index of the VRAM Bar */
> +	unsigned int bar;
> +	/* Firmware fb's offset from the VRAM aperture start */
> +	resource_size_t offset;
> +	/* The firmware fb's size, in bytes */
> +	resource_size_t size;
> +
> +	/* Firmware fb's address range, suffer from change */
> +	resource_size_t start;
> +	resource_size_t end;

It's redundant to save start, size, and end.  Start and end should be
enough, and maybe you could use a struct resource for that.

It's not clear to me why you need to save the start/end/etc anyway.
All we need to know is which pci_dev is the firmware device.  Doesn't
your fixup quirk identify it?  Once you set firmware_fb.pdev, I don't
think it's ever changed.

> +} firmware_fb;
> +
> +/*
> + * Get the physical address range that the firmware framebuffer occupies.
> + *
> + * The global screen_info is arch-specific; it will not be exported if the
> + * CONFIG_EFI is not selected on Arm64. Hence, CONFIG_EFI is chosen as
> + * compile-time conditional to suppress linkage problems. This guard can be
> + * removed if the global screen_info became arch-independent one day.

What's the connection between CONFIG_EFI and screen_info?  I see
screen_info global symbols for alpha, hexagon, powerpc, sparc, and
several more if CONFIG_VT.  Please explain the connection so we can
easily verify it.

> +static bool vga_arb_get_fb_range_from_screen_info(resource_size_t *start,
> +						  resource_size_t *end)
> +{
> +	resource_size_t fb_start = 0;
> +	resource_size_t fb_size = 0;
> +	resource_size_t fb_end;
> +
> +#if defined(CONFIG_EFI)
> +	fb_start = screen_info.lfb_base;
> +	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> +		fb_start |= (u64)screen_info.ext_lfb_base << 32;
> +
> +	fb_size = screen_info.lfb_size;
> +#endif
> +
> +	/* No firmware framebuffer support */
> +	if (!fb_start || !fb_size)
> +		return false;
> +
> +	fb_end = fb_start + fb_size - 1;
> +
> +	*start = fb_start;
> +	*end = fb_end;
> +
> +	return true;
> +}
> +
> +static bool vga_arb_get_fb_range_from_tracker(resource_size_t *start,
> +					      resource_size_t *end)
> +{
> +	struct pci_dev *pdev = firmware_fb.pdev;
> +	resource_size_t new_vram_base;
> +	resource_size_t new_fb_start;
> +	resource_size_t old_fb_start;
> +	resource_size_t old_fb_end;
> +
> +	/*
> +	 * No firmware framebuffer support or no aperture that contains the
> +	 * firmware FB is found. In this case, the firmware_fb.pdev will be
> +	 * NULL. We will return immediately.
> +	 */
> +	if (!pdev)
> +		return false;
> +
> +	new_vram_base = pdev->resource[firmware_fb.bar].start;
> +	new_fb_start = new_vram_base + firmware_fb.offset;
> +	old_fb_start = firmware_fb.start;
> +	old_fb_end = firmware_fb.end;
> +
> +	if (new_fb_start != old_fb_start) {
> +		firmware_fb.start = new_fb_start;
> +		firmware_fb.end = new_fb_start + firmware_fb.size - 1;
> +		vgaarb_dbg(&pdev->dev,
> +			   "[0x%llx, 0x%llx] -> [0x%llx, 0x%llx]\n",
> +			   (u64)old_fb_start, (u64)old_fb_end,
> +			   (u64)firmware_fb.start, (u64)firmware_fb.end);

This should be %pR format (see
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/core-api/printk-formats.rst?id=v6.4#n205).

Maybe you could even use struct resource directly instead of
new_fb_start old_fb_start, old_fb_end.

Maybe these "get_fb_range" functions could even *return* a struct
resource * instead of a boolean?  Boolean functions should not have
side-effects anyway, and ideally their names should be questions with
true/false answers or assertions that are true or false, e.g.,
"pcie_cap_has_lnkctl()", "pci_ats_supported()",
"of_device_is_compatible()", etc.

> +	}
> +
> +	*start = firmware_fb.start;
> +	*end = firmware_fb.end;
> +
> +	return true;
> +}
>  
>  static const char *vga_iostate_to_str(unsigned int iostate)
>  {
> @@ -543,20 +629,21 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
>  }
>  EXPORT_SYMBOL(vga_put);
>  
> +/* Select the device owning the boot framebuffer if there is one */
>  static bool vga_is_firmware_default(struct pci_dev *pdev)
>  {
> -#if defined(CONFIG_X86) || defined(CONFIG_IA64)
> -	u64 base = screen_info.lfb_base;
> -	u64 size = screen_info.lfb_size;
>  	struct resource *r;
> -	u64 limit;
> +	resource_size_t fb_start;
> +	resource_size_t fb_end;
> +	bool ret;
>  
> -	/* Select the device owning the boot framebuffer if there is one */
> -
> -	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> -		base |= (u64)screen_info.ext_lfb_base << 32;
> -
> -	limit = base + size;
> +#if defined(CONFIG_X86) || defined(CONFIG_IA64)
> +	ret = vga_arb_get_fb_range_from_screen_info(&fb_start, &fb_end);
> +#else
> +	ret = vga_arb_get_fb_range_from_tracker(&fb_start, &fb_end);

vga_is_firmware_default() is a boolean function and should have no
side effects.  But vga_arb_get_fb_range_from_tracker() *does* have
side effects -- it may update firmware_fb.start/end.

It's OK if you need to update those, but I don't think it should be in
the vga_is_boot_device().  And vga_arb_get_fb_range_from_tracker()
doesn't have anything to do with the specific device being added by
vga_arbiter_add_pci_device(), so it should only need to be called
once.  If you only need a one-time thing, maybe it should be called
from vga_arb_device_init()?

> +#endif
> +	if (!ret)
> +		return false;
>  
>  	/* Does firmware framebuffer belong to us? */
>  	pci_dev_for_each_resource(pdev, r) {
> @@ -566,12 +653,10 @@ static bool vga_is_firmware_default(struct pci_dev *pdev)
>  		if (!r->start || !r->end)
>  			continue;
>  
> -		if (base < r->start || limit >= r->end)
> -			continue;
> -
> -		return true;
> +		if (fb_start >= r->start && fb_end <= r->end)
> +			return true;
>  	}
> -#endif
> +
>  	return false;
>  }
>  
> @@ -1555,3 +1640,42 @@ static int __init vga_arb_device_init(void)
>  	return rc;
>  }
>  subsys_initcall_sync(vga_arb_device_init);
> +
> +static void vga_arb_firmware_fb_addr_tracker(struct pci_dev *pdev)
> +{
> +	resource_size_t fb_start;
> +	resource_size_t fb_end;
> +	unsigned int i;
> +
> +	/* Already found the pdev which has firmware framebuffer ownership */
> +	if (firmware_fb.pdev)
> +		return;
> +
> +	if (!vga_arb_get_fb_range_from_screen_info(&fb_start, &fb_end))
> +		return;
> +
> +	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> +		struct resource *ap = &pdev->resource[i];

What does "ap" mean?  Typical name for such a pointer is "r" or "res".

> +		if (resource_type(ap) != IORESOURCE_MEM)
> +			continue;
> +
> +		if (!ap->start || !ap->end)
> +			continue;
> +
> +		if (ap->start <= fb_start && fb_end <= ap->end) {
> +			firmware_fb.pdev = pdev;
> +			firmware_fb.bar = i;
> +			firmware_fb.size = fb_end - fb_start + 1;
> +			firmware_fb.offset = fb_start - ap->start;
> +			firmware_fb.start = fb_start;
> +			firmware_fb.end = fb_end;
> +
> +			vgaarb_dbg(&pdev->dev,
> +				   "BAR %u contains firmware FB\n", i);

Include at least the %pR of the BAR and maybe of the framebuffer
itself as well.

> +			break;
> +		}
> +	}
> +}
> +DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_DISPLAY_VGA,
> +			       8, vga_arb_firmware_fb_addr_tracker);
> -- 
> 2.34.1
> 
