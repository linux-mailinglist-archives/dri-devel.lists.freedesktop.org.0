Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A074B3A9B
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 10:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE73F10F4B2;
	Sun, 13 Feb 2022 09:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 472 seconds by postgrey-1.36 at gabe;
 Sun, 13 Feb 2022 09:27:14 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [IPv6:2a01:37:3000::53df:4ef0:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C8510F4B1;
 Sun, 13 Feb 2022 09:27:14 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 05A4D2800B3D2;
 Sun, 13 Feb 2022 10:19:21 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id E8C26294C60; Sun, 13 Feb 2022 10:19:20 +0100 (CET)
Date: Sun, 13 Feb 2022 10:19:20 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 03/12] PCI: Move check for old Apple Thunderbolt
 controllers into a quirk
Message-ID: <20220213091920.GA15535@wunner.de>
References: <20220211193250.1904843-1-mario.limonciello@amd.com>
 <20220211193250.1904843-4-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211193250.1904843-4-mario.limonciello@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andreas Noever <andreas.noever@gmail.com>,
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

I'm not so sure if it is only needed on Apple systems.


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

The fact that Thunderbolt PCIe ports support D3 is a property of those
devices.  It's not a property of the platform or a quirk of a particular
vendor.

Hence in my view the current location of the check (pci_bridge_d3_possible())
makes sense wheras the location you're moving it to does not.


> +/* Apple machines as old as 2010 can do D3 with Thunderbolt controllers, but don't specify
> + * it in the ACPI tables
> + */

Apple started shipping Thunderbolt in 2011.
Intel brought the first chips to market in 2010.

The date is meaningful at the code's current location in
pci_bridge_d3_possible() because a few lines further down
there's a 2015 BIOS cut-off date.

Microsoft came up with an ACPI property that BIOS vendors may set
so that Windows knows it may put a Thunderbolt controller into D3cold.
I'm not even sure if that property was ever officially adopted by the
ACPI spec or if it's just a Microsoft-defined "standard".

Apple had been using its own scheme to put Thunderbolt controllers
into D3cold when nothing is plugged in, about a decade before Microsoft
defined the ACPI property.

I'm not sure if other vendors came up with their own schemes to
power-manage Thunderbolt.  We may regress those with the present
patch.

Thanks,

Lukas
