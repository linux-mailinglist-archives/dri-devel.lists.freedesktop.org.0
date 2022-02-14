Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7554B42B8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 08:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058A410E2A2;
	Mon, 14 Feb 2022 07:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFCF10E27D;
 Mon, 14 Feb 2022 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644823410; x=1676359410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8986kutyorRgf8bSEArW0prD8GIGUUBjn9XYUWWmt7s=;
 b=S6gyWVUKIKFSIFAmHmCZdVpijjktxzf1F650EyriakbjV7mmmHEPufOn
 TIT6HDo5fYIp88uEuxvUFme4l43NshibKeFO9rsew1j1cNaTNBU8rC65V
 XT4Ns3hPA7afw3g66dr0gz2hm3F68EBlnq/My3ALwIBSMrEPhE30cbq1k
 Y6qCiNtOmx6ZJGMN4GpxzBVYscj85vDDuK2DKJNrbX7Iw4ezQYEVhYCkx
 7Vi0mvL7zlAJ4Dsb2q4dJnD58VLqwQFK4p+TB36DOnbZRrBPYw0BmWFpY
 bYqfDtBCfesoV8PyKjeVg+RSUQLv6KJ7clmGdIxB25e4mRQQjRaZPGxEz w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="313312256"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="313312256"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:23:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="587076655"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:23:25 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 14 Feb 2022 09:23:22 +0200
Date: Mon, 14 Feb 2022 09:23:22 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3 03/12] PCI: Move check for old Apple Thunderbolt
 controllers into a quirk
Message-ID: <YgoDauh7rd18OvrM@lahna>
References: <20220211193250.1904843-1-mario.limonciello@amd.com>
 <20220211193250.1904843-4-mario.limonciello@amd.com>
 <20220213091920.GA15535@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220213091920.GA15535@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lukas,

On Sun, Feb 13, 2022 at 10:19:20AM +0100, Lukas Wunner wrote:
> On Fri, Feb 11, 2022 at 01:32:41PM -0600, Mario Limonciello wrote:
> > `pci_bridge_d3_possible` currently checks explicitly for a Thunderbolt
> > controller to indicate that D3 is possible.  As this is used solely
> > for older Apple systems, move it into a quirk that enumerates across
> > all Intel TBT controllers.
> 
> I'm not so sure if it is only needed on Apple systems.
> 
> 
> > @@ -2954,10 +2960,6 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
> >  		if (pci_bridge_d3_force)
> >  			return true;
> >  
> > -		/* Even the oldest 2010 Thunderbolt controller supports D3. */
> > -		if (bridge->is_thunderbolt)
> > -			return true;
> > -
> >  		/* Platform might know better if the bridge supports D3 */
> >  		if (platform_pci_bridge_d3(bridge))
> >  			return true;
> 
> The fact that Thunderbolt PCIe ports support D3 is a property of those
> devices.  It's not a property of the platform or a quirk of a particular
> vendor.

It is in fact platform specific. For instance the non-Apple systems
without "HotPlugSupportInD3" property have not been wired to support
entering/exiting D3 runtime so putting these ports into D3 may actually
lead into problems as we are in non-validated territory.

> Hence in my view the current location of the check (pci_bridge_d3_possible())
> makes sense wheras the location you're moving it to does not.
> 
> 
> > +/* Apple machines as old as 2010 can do D3 with Thunderbolt controllers, but don't specify
> > + * it in the ACPI tables
> > + */
> 
> Apple started shipping Thunderbolt in 2011.
> Intel brought the first chips to market in 2010.
> 
> The date is meaningful at the code's current location in
> pci_bridge_d3_possible() because a few lines further down
> there's a 2015 BIOS cut-off date.
> 
> Microsoft came up with an ACPI property that BIOS vendors may set
> so that Windows knows it may put a Thunderbolt controller into D3cold.
> I'm not even sure if that property was ever officially adopted by the
> ACPI spec or if it's just a Microsoft-defined "standard".

AFAIK It was invented by Intel Windows folks but Microsoft "documented"
it. We use the same property in ChromeOS (and therefore Linux) too so it
can be thought of as "de facto" way of declaring such port. 
