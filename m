Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BC34B2F49
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 22:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036A810EB38;
	Fri, 11 Feb 2022 21:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D0410EB2D;
 Fri, 11 Feb 2022 21:20:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6798DB82D1E;
 Fri, 11 Feb 2022 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B2EC340ED;
 Fri, 11 Feb 2022 21:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644614427;
 bh=UfUFmaXMeBVMDhEvq/Ay84fjFn6Fp13Zs7ea6/QFMhs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=neQsFRKavHKvFU9Ki8tBnVfqQK3sczt5cs5C/VXEoOoR6DppL4XbHf1XAcSRYZ/ql
 SgNgB0ecY41GNDmsDr6LaaaNLZAWshMiXYxc7zm5HPreA+xxv71qCg4XrNp1L8H5hc
 JZuymM65S13/NP0NbDbY2ysAvxtNeh+SxkwHoHeMXATaChYLdFGwmr7YpzkDCxOYTE
 m8IhkZQ9KP5DxPoWFkea8SM7pVJquATf+ISUhTKK2qJqQktxszuZKo+//dNDQY1FjA
 +Dhd7YMXLqljO+Auwvc8rFWsKTIols4vbWShD2XzZxYzka/XkK9nqaCSpDI7KFslO/
 EiJnvwjovmZhw==
Date: Fri, 11 Feb 2022 15:20:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 02/12] PCI: Move `is_thunderbolt` check for lack of
 command completed to a quirk
Message-ID: <20220211212025.GA735312@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211193250.1904843-3-mario.limonciello@amd.com>
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

Update subject to something like:

  PCI: pciehp: Quirk broken Command Completed support on Intel Thunderbolt controllers

On Fri, Feb 11, 2022 at 01:32:40PM -0600, Mario Limonciello wrote:
> The `is_thunderbolt` check is currently used to indicate the lack of
> command completed support for a number of older Thunderbolt devices.
> 
> This however is heavy handed and should have been done via a quirk.  Move
> the affected devices outlined in commit 493fb50e958c ("PCI: pciehp: Assume
> NoCompl+ for Thunderbolt ports") into pci quirks.
> 
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pci/hotplug/pciehp_hpc.c |  6 +-----
>  drivers/pci/quirks.c             | 17 +++++++++++++++++
>  include/linux/pci.h              |  2 ++
>  3 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
> index 1c1ebf3dad43..e4c42b24aba8 100644
> --- a/drivers/pci/hotplug/pciehp_hpc.c
> +++ b/drivers/pci/hotplug/pciehp_hpc.c
> @@ -996,11 +996,7 @@ struct controller *pcie_init(struct pcie_device *dev)
>  	if (pdev->hotplug_user_indicators)
>  		slot_cap &= ~(PCI_EXP_SLTCAP_AIP | PCI_EXP_SLTCAP_PIP);
>  
> -	/*
> -	 * We assume no Thunderbolt controllers support Command Complete events,
> -	 * but some controllers falsely claim they do.
> -	 */
> -	if (pdev->is_thunderbolt)
> +	if (pdev->no_cmd_complete)
>  		slot_cap |= PCI_EXP_SLTCAP_NCCS;
>  
>  	ctrl->slot_cap = slot_cap;
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index d2dd6a6cda60..6d3c88edde00 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -3675,6 +3675,23 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
>  			quirk_thunderbolt_hotplug_msi);

Please add a comment above to the effect that PCI_EXP_SLTCAP_NCCS
being clear means the controller generates a Command Completed software
notification when it completes a command, and these controllers don't
generate those notifications even though PCI_EXP_SLTCAP_NCCS is clear
(PCIe r6.0, sec 7.5.3.9).

> +static void quirk_thunderbolt_command_completed(struct pci_dev *pdev)

Rename to quirk_no_command_completed().  This doesn't have anything to
do with Thunderbolt; it's just that the affected devices happen to be
Thunderbolt controllers.

> +{
> +	pdev->no_cmd_complete = 1;
> +}
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
> +			quirk_thunderbolt_command_completed);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EAGLE_RIDGE,
> +			quirk_thunderbolt_command_completed);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_PEAK,
> +			quirk_thunderbolt_command_completed);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
> +			quirk_thunderbolt_command_completed);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C,
> +			quirk_thunderbolt_command_completed);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
> +			quirk_thunderbolt_command_completed);

Can we put these in drivers/pci/hotplug/pciehp_hpc.c?  We already
have a few similar quirks there.

>  #ifdef CONFIG_ACPI
>  /*
>   * Apple: Shutdown Cactus Ridge Thunderbolt controller.
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 8253a5413d7c..1e5b769e42fc 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -443,6 +443,8 @@ struct pci_dev {
>  	unsigned int	is_hotplug_bridge:1;
>  	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
>  	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
> +	unsigned int	no_cmd_complete:1;	/* Lies about command completed events */
> +
>  	/*
>  	 * Devices marked being untrusted are the ones that can potentially
>  	 * execute DMA attacks and similar. They are typically connected
> -- 
> 2.34.1
> 
