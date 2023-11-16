Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E337EDD37
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF4A10E24F;
	Thu, 16 Nov 2023 09:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE24410E139;
 Thu, 16 Nov 2023 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700125272; x=1731661272;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/STXsbosH6Rz9sQMt/crvGrrS9Z0X1RfO/fEtM3K5Z0=;
 b=c2kzmUqqgVbWi66PCkg97xzHjwQPrQKrLSfj3J8/qfkajdvh9ev+0N5V
 Rd7C8WL+L/g1UKaLioI58MDaVetS4sC1GUj48APtoP5cKM1xAYNT1GELU
 8u1J5BFwTB7DgLlFwOBx9lmEgl1ER3vxBiHhjm3C7lS2QI5+XEGR7nLTy
 N+lhGic8FQMUL/JGcYk30yavq2EW3JqLY+McWkvBKJemIxzZE6a2CqyLX
 ECYM3fGM+b1oTkERX3328ppqNJY8fS4GVTowcc9231721PlJaKE/QFY9V
 UcPpil7sEwDELNzPYG6OUm1/l847Eq5oXpbQ54GBFAmpG8eT9u6uJthbi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457542989"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="457542989"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 01:00:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="768851613"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="768851613"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 16 Nov 2023 01:00:43 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 9BFF0209; Thu, 16 Nov 2023 11:00:42 +0200 (EET)
Date: Thu, 16 Nov 2023 11:00:42 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 5/7] PCI: ACPI: Detect PCIe root ports that are used
 for tunneling
Message-ID: <20231116090042.GF17433@black.fi.intel.com>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
 <20231114200755.14911-6-mario.limonciello@amd.com>
 <20231115104019.GY17433@black.fi.intel.com>
 <70b35a0e-5ccd-4e19-a8ac-4cf095007a69@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <70b35a0e-5ccd-4e19-a8ac-4cf095007a69@amd.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mario,

On Wed, Nov 15, 2023 at 11:08:43AM -0600, Mario Limonciello wrote:
> On 11/15/2023 04:40, Mika Westerberg wrote:
> > Hi Mario,
> > 
> > On Tue, Nov 14, 2023 at 02:07:53PM -0600, Mario Limonciello wrote:
> > > USB4 routers support a feature called "PCIe tunneling". This
> > > allows PCIe traffic to be transmitted over USB4 fabric.
> > > 
> > > PCIe root ports that are used in this fashion can be discovered
> > > by device specific data that specifies the USB4 router they are
> > > connected to. For the PCI core, the specific connection information
> > > doesn't matter, but it's interesting to know that this root port is
> > > used for tunneling traffic. This will allow other decisions to be
> > > made based upon it.
> > > 
> > > Detect the `usb4-host-interface` _DSD and if it's found save it
> > > into a new `is_virtual_link` bit in `struct pci_device`.
> > 
> > While this is fine for the "first" tunneled link, this does not take
> > into account possible other "virtual" links that lead to the endpoint in
> > question. Typically for eGPU it only makes sense to plug it directly to
> > the host but say there is a USB4 hub (with PCIe tunneling capabilities)
> > in the middle. Now the link from the hub to the eGPU that is also
> > "virtual" is not marked as such and the bandwidth calculations may not
> > get what is expected.
> 
> Right; you mentioned the DVSEC available for hubs in this case.  As I don't
> have one of these to validate it works properly I was thinking that should
> be a follow up.
> 
> If you think it should be part of the same series I'll add it, but I'd ask
> if you can please check I did it right on one that reports the DVSEC?

I don't think it should be part of this series. I just checked and DVSEC
is only required for hosts so kind of hardware equivalent for the _DSD
property you are using here. For hubs there is no such luxury
unfortunately.

I think I do have hardware here with the DVSEC in place so if you
decide to add it, I should be able to try it.
