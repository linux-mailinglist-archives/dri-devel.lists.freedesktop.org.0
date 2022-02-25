Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89194C3AD8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 02:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559B510E2F5;
	Fri, 25 Feb 2022 01:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F35B10E14A;
 Fri, 25 Feb 2022 01:23:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8BEC60C7A;
 Fri, 25 Feb 2022 01:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EC8C340E9;
 Fri, 25 Feb 2022 01:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645752229;
 bh=WT9Bxm8hy9Zx9+4uOpWY97MNM6hQYpRoQq/T1hnrs4g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=C50+Ss5Q8B6EjURcCBRIy/cJHNllf+HiDwblGn44q80pk/g8LPFXaGsNp1Ms+hMwb
 e9WEtVvnwLxTu8UArBuZa6jBZ/ajgdf0E4OiqkEGfVcrehsXRaXRznQQBdpKktAKJd
 n/qT1+2TyV0A9k7thsT6KGnXHzdQr9qHHvxP2xLIix2uC9Yh87yTjFXXP1x2ChiIna
 3VYSqX8pIMhrJerZekdFP9Ml8M+gf15kzW8NffwXIuRhpqnskM3BsVX+dXp8II/J8Q
 u0S0kJI76PBA2395AP3dDfni+E2pF+qYp6kQiJYZvL5lWHP2IlqDfI1Eygmz/NTLP5
 D1apyl5izGSPw==
Date: Thu, 24 Feb 2022 19:23:46 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Message-ID: <20220225012346.GA317859@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224215116.7138-4-mario.limonciello@amd.com>
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com, Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 03:51:12PM -0600, Mario Limonciello wrote:
> The `is_thunderbolt` attribute originally had a well defined list of
> quirks that it existed for, but it has been overloaded with more
> meaning.
> 
> Instead use the driver core removable attribute to indicate the
> detail a device is attached to a thunderbolt or USB4 chain.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pci/probe.c               | 2 +-
>  drivers/platform/x86/apple-gmux.c | 2 +-
>  include/linux/pci.h               | 5 ++---
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 17a969942d37..1b752d425c47 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -1584,7 +1584,7 @@ static void set_pcie_thunderbolt(struct pci_dev *dev)
>  	/* Is the device part of a Thunderbolt controller? */
>  	vsec = pci_find_vsec_capability(dev, PCI_VENDOR_ID_INTEL, PCI_VSEC_ID_INTEL_TBT);
>  	if (vsec)
> -		dev->is_thunderbolt = 1;
> +		dev->external_facing = true;

I assume there's a spec for the PCI_VSEC_ID_INTEL_TBT Capability.  Is
that public?  Does the spec say that a device with that capability
must be external-facing?

Even if it's not public, I think a citation (name, revision, section)
would be useful.

>  }
>  
>  static void set_pcie_untrusted(struct pci_dev *dev)
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 57553f9b4d1d..4444da0c39b0 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
>  
>  static int is_thunderbolt(struct device *dev, void *data)
>  {
> -	return to_pci_dev(dev)->is_thunderbolt;
> +	return to_pci_dev(dev)->external_facing;

This looks ... sort of weird.  I don't know anything about
apple-gmux.c, so I guess I don't care, but assuming any
external-facing device must be a Thunderbolt device seems like a
stretch.

Ugh.  This is used via "bus_for_each_dev(&pci_bus_type)", which means
it's not hotplug-safe.  I'm sure we "know" implicitly that hotplug
isn't an issue in apple-gmux, but it's better not to have examples
that get copied to places where it *is* an issue.

>  }
>  
>  static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 1e5b769e42fc..d9719eb14654 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -442,7 +442,6 @@ struct pci_dev {
>  	unsigned int	is_virtfn:1;
>  	unsigned int	is_hotplug_bridge:1;
>  	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
> -	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
>  	unsigned int	no_cmd_complete:1;	/* Lies about command completed events */
>  
>  	/*
> @@ -2447,11 +2446,11 @@ static inline bool pci_is_thunderbolt_attached(struct pci_dev *pdev)
>  {
>  	struct pci_dev *parent = pdev;
>  
> -	if (pdev->is_thunderbolt)
> +	if (dev_is_removable(&pdev->dev))
>  		return true;
>  
>  	while ((parent = pci_upstream_bridge(parent)))
> -		if (parent->is_thunderbolt)
> +		if (dev_is_removable(&parent->dev))
>  			return true;

I don't get this.  Plain old PCI devices can be removable, too.

pci_is_thunderbolt_attached() is only used by GPU drivers.  What
property of Thunderbolt do they care about?

nouveau_vga_init() and radeon_device_init() use it to decide to
register with vga_switcheroo.  So maybe that's something to do with
removability?  Of course, that's not specific to Thunderbolt, because
garden-variety PCIe devices are removable.

amdgpu_driver_load_kms() and radeon_driver_load_kms() apparently use
it for something related to power control.  I don't know what the
Thunderbolt connection is.

nbio_v2_3_enable_aspm() looks like it uses it to change some ASPM
parameters.  Seems like potentially a device erratum or quirk
material?

If these things are not specifically related to Thunderbolt, I'd
prefer to get rid of pci_is_thunderbolt_attached() and see if we can
help the GPU folks figure out what they really need.

>  	return false;
> -- 
> 2.34.1
> 
