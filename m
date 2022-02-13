Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40ED4B3A46
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 09:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6225310E4E7;
	Sun, 13 Feb 2022 08:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1111 seconds by postgrey-1.36 at gabe;
 Sun, 13 Feb 2022 08:39:29 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E615310E36A;
 Sun, 13 Feb 2022 08:39:29 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 68846300002A0;
 Sun, 13 Feb 2022 09:39:28 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 5AF1C2DEC3C; Sun, 13 Feb 2022 09:39:28 +0100 (CET)
Date: Sun, 13 Feb 2022 09:39:28 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 3/9] PCI: drop `is_thunderbolt` attribute
Message-ID: <20220213083928.GB23572@wunner.de>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-4-mario.limonciello@amd.com>
 <YgY5N1eVWmi0Xyuw@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgY5N1eVWmi0Xyuw@lahna>
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 12:23:51PM +0200, Mika Westerberg wrote:
> On Thu, Feb 10, 2022 at 04:43:23PM -0600, Mario Limonciello wrote:
> > @@ -2955,7 +2955,7 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
> >  			return true;
> >  
> >  		/* Even the oldest 2010 Thunderbolt controller supports D3. */
> > -		if (bridge->is_thunderbolt)
> > +		if (dev_is_removable(&bridge->dev))
> 
> For this, I'm not entirely sure this is what we want. The purpose of
> this check is to enable port power management of Apple systems with
> Intel Thunderbolt controller and therefore checking for "removable" here
> is kind of misleading IMHO.
[...]
> and then make a quirk in quirks.c that adds the software node property
> for the Apple systems? Or something along those lines.

Honestly, that feels wrong to me.

There are non-Apple products with Thunderbolt controllers,
e.g. Supermicro X10SAT was a Xeon board with Redwood Ridge
which was introduced in 2013.  This was way before Microsoft
came up with the HotPlugSupportInD3 property.  It was also way
before the 2015 BIOS cut-off date that we use to disable
power management on older boards.

Still, we currently whitelist the Thunderbolt ports on that
board for D3 because we know it works.  What if products like
this one use their own power management scheme and we'd cause
a power regression if we needlessly disable D3 for them now?

Thanks,

Lukas
