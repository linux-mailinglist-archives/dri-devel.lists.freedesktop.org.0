Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 232E64B2F6E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 22:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BC010E241;
	Fri, 11 Feb 2022 21:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E8D10E4C5;
 Fri, 11 Feb 2022 21:35:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 545F360C2B;
 Fri, 11 Feb 2022 21:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE38C340E9;
 Fri, 11 Feb 2022 21:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644615309;
 bh=Uym5sGm/byYDXRVkQyzO2iV7FqTMXRqkyIiYcfpzlP4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=YMqf8I2TxkIM3DEZj6iM1MmjbgUusob+8/FI95vCfgUfq5iSZNrRpNPcCLzrMXZb+
 SawqBBMkKqlctHHt8RppXVvm+0BApxF91qvAhMj7/l4cNJVHD/G9nPgNGoDDDwMk0V
 4bddRM+pfjc/JHr6PhKj6ouPdW2Fu90xCXZvUkb1QRtL6SB+CtkmywJeFpRTB/3oIF
 womnOG9reE9D28OU8zT/KKSvXp6fqPzF0jxkZuO7nVBx9SZqpT5hwnDIOjCo5UfdaR
 tcQ+/5Vk6HTZYJVHhpc/QUYQKb8sro31plektm+Wjj6TKtTV9eBQ3Q5hxP6FFgHT/Z
 QOdt4HBo9SbAw==
Date: Fri, 11 Feb 2022 15:35:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 03/12] PCI: Move check for old Apple Thunderbolt
 controllers into a quirk
Message-ID: <20220211213508.GA736191@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211193250.1904843-4-mario.limonciello@amd.com>
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
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com, Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 01:32:41PM -0600, Mario Limonciello wrote:
> `pci_bridge_d3_possible` currently checks explicitly for a Thunderbolt
> controller to indicate that D3 is possible.  As this is used solely
> for older Apple systems, move it into a quirk that enumerates across
> all Intel TBT controllers.
> 
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pci/pci.c    | 12 +++++-----
>  drivers/pci/quirks.c | 53 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 9ecce435fb3f..5002e214c9a6 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1064,7 +1064,13 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
>  	if (pci_use_mid_pm())
>  		return false;
>  
> -	return acpi_pci_bridge_d3(dev);
> +	if (acpi_pci_bridge_d3(dev))
> +		return true;
> +
> +	if (device_property_read_bool(&dev->dev, "HotPlugSupportInD3"))
> +		return true;

Why do we need this?  acpi_pci_bridge_d3() already looks for
"HotPlugSupportInD3".

> +	return false;
>  }
>  
>  /**
> @@ -2954,10 +2960,6 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
>  		if (pci_bridge_d3_force)
>  			return true;
>  
> -		/* Even the oldest 2010 Thunderbolt controller supports D3. */
> -		if (bridge->is_thunderbolt)
> -			return true;
> -
>  		/* Platform might know better if the bridge supports D3 */
>  		if (platform_pci_bridge_d3(bridge))
>  			return true;
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 6d3c88edde00..aaf098ca7d54 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -3756,6 +3756,59 @@ DECLARE_PCI_FIXUP_SUSPEND_LATE(PCI_VENDOR_ID_INTEL,
>  			       quirk_apple_poweroff_thunderbolt);
>  #endif
>  
> +/* Apple machines as old as 2010 can do D3 with Thunderbolt controllers, but don't specify
> + * it in the ACPI tables

Wrap to fit in 80 columns like the rest of the file.  Also use the:

  /*
   * comment ...
   */

style if it's more than one line.

I don't think "as old as 2010" is helpful here -- I assume 2010 is
there because there *were* no Thunderbolt controllers before 2010, but
the code doesn't check any dates, so we basically assume all Apple
machines of any age with the listed controllers can do this.

> + */
> +static void quirk_apple_d3_thunderbolt(struct pci_dev *dev)
> +{
> +	struct property_entry properties[] = {
> +		PROPERTY_ENTRY_BOOL("HotPlugSupportInD3"),
> +		{},
> +	};
> +
> +	if (!x86_apple_machine)
> +		return;

The current code doesn't check x86_apple_machine, so this needs some
justification.  How do I know this works the same as before?

> +
> +	if (device_create_managed_software_node(&dev->dev, properties, NULL))
> +		pci_warn(dev, "could not add HotPlugSupportInD3 property");
> +}
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
> +			quirk_apple_d3_thunderbolt);

The current code assumes *all* Thunderbolt controllers support D3, so
it would assume a controller released next year would support D3, but
this code would assume the opposite.  Are we supposed to add
everything to this list, or do newer machines supply
HotPlugSupportInD3, or ...?

How did you derive this list?  (Question for the commit log and/or
comments here.)

> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EAGLE_RIDGE,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_PEAK,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_2C_NHI,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_2C_BRIDGE,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_4C_NHI,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_4C_BRIDGE,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_BRIDGE,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_BRIDGE,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_NHI,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_BRIDGE,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_NHI,
> +			quirk_apple_d3_thunderbolt);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE,
> +			quirk_apple_d3_thunderbolt);
> +
>  /*
>   * Following are device-specific reset methods which can be used to
>   * reset a single function if other methods (e.g. FLR, PM D0->D3) are
> -- 
> 2.34.1
> 
