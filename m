Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260B24B2FEF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 22:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DED10EB51;
	Fri, 11 Feb 2022 21:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9BC10EB4F;
 Fri, 11 Feb 2022 21:58:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0B9461155;
 Fri, 11 Feb 2022 21:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEEDC340E9;
 Fri, 11 Feb 2022 21:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644616708;
 bh=oXg5rxwwUausbzZKfN+RufJo9Nkk/xAVMAtcyDF0/WM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=fp310UIIKN84A4YeT/Tcs1AeYKNWTo+/UZPC+EFT2ECaEyXmPQeoqIdeoKjpu6ltu
 EdiV+R7W+4T2JxHH2CpEvNoy+XIyvSCvLD4F32wVza2+hjIjJyRSV+yfAcqxv6PARk
 lp5yk4vVHvnete5kHumveMBmLlEymdKtoT0GT3AvGMijPTwyIglClyyP+WSbRZFgF9
 +fpoZR8kv0a5lef7j0nkJpzXWfpoE7RneTVgkuZlRZHn6p2QaaRfK4znnmsC+uEnYM
 iY8KWMXSLfR5EdkXlIIPdUbhSJ8nhDUHhPcBOkj0f5l8q/wgvsfQ36/aJbk+axctcm
 W5JSlN40mF4XA==
Date: Fri, 11 Feb 2022 15:58:26 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 06/12] PCI: Explicitly mark USB4 NHI devices as
 removable
Message-ID: <20220211215826.GA737975@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211193250.1904843-7-mario.limonciello@amd.com>
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
 Alexander.Deucher@amd.com, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 01:32:44PM -0600, Mario Limonciello wrote:
> USB4 class devices are also removable like Intel Thunderbolt devices.

Spec reference, please.

> Drivers of downstream devices use this information to declare functional
> differences in how the drivers perform by knowing that they are connected
> to an upstream TBT/USB4 port.
> 
> Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pci/probe.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 2693211d31cf..67ca33188cba 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -1610,6 +1610,7 @@ static void pci_set_removable(struct pci_dev *dev)
>  	 * exposed as "removable" to userspace.
>  	 */
>  	if (vsec ||
> +	    dev->class == PCI_CLASS_SERIAL_USB_USB4 ||
>  	    pci_acpi_is_usb4(dev) ||
>  	    (parent &&
>  	    (parent->external_facing || dev_is_removable(&parent->dev))))
> -- 
> 2.34.1
> 
