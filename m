Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2623D7E3532
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 07:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB7310E4BD;
	Tue,  7 Nov 2023 06:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBE810E4BA;
 Tue,  7 Nov 2023 06:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699338255; x=1730874255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xMd2rVgz/0nCDHGO5G5Cgmns963Fjfa40nHUcD2LIxI=;
 b=IGCMk8ZZpOLcTsOgycxyY4TH3dQ/eEP5ApYP7g3QYG2nqGBUAliuOluS
 5q0Nz+BKL2CeVuwhRrIK8vN1mQEN37rWnUNnI1BxvrXCo+05EWGnNTi1a
 v0CS1yb/0h97f5ax1fmFs62RLrv9b8S/jp6ZWJnJBMIpQNvLbykJfLf2g
 rNGe2YlKqBXrWEN561Ln0J9ZPIlalDjgXgkN7YnreOfgI5XG4VSa6AX7F
 vArXh463zL2b9g2BwG+UkgLqjUbL1QWzwUxvGEE1WFQ3ROxRSdHNFEo9H
 S5O6TpHxQWi8cqEM+Y1t2t7jqE0j+jbZLdSqqwa251uJAq1k49tAaNClj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="475682220"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="475682220"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 22:24:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="1094047505"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="1094047505"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Nov 2023 22:24:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 15A0E3CC; Tue,  7 Nov 2023 08:24:05 +0200 (EET)
Date: Tue, 7 Nov 2023 08:24:05 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 8/9] PCI: Exclude PCIe ports used for tunneling in
 pcie_bandwidth_available()
Message-ID: <20231107062405.GU17433@black.fi.intel.com>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
 <20231103190758.82911-9-mario.limonciello@amd.com>
 <20231106181022.GA18564@wunner.de>
 <712ebb25-3fc0-49b5-96a1-a13c3c4c4921@amd.com>
 <20231106185652.GA3360@wunner.de>
 <20231107054526.GT17433@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231107054526.GT17433@black.fi.intel.com>
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
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 07:45:26AM +0200, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Nov 06, 2023 at 07:56:52PM +0100, Lukas Wunner wrote:
> > On Mon, Nov 06, 2023 at 12:44:25PM -0600, Mario Limonciello wrote:
> > > Tangentially related; the link speed is currently symmetric but there are
> > > two sysfs files.  Mika left a comment in drivers/thunderbolt/switch.c it may
> > > be asymmetric in the future. So we may need to keep that in mind on any
> > > design that builds on top of them.
> > 
> > Aren't asymmetric Thunderbolt speeds just a DisplayPort thing?
> 
> No, they affect the whole fabric. We have the initial code for
> asymmetric switching in v6.7-rc1.
> 
> > > As 'thunderbolt' can be a module or built in, we need to bring code into PCI
> > > core so that it works in early boot before it loads.
> > 
> > tb_switch_get_generation() is small enough that it could be moved to the
> > PCI core.  I doubt that we need to make thunderbolt built-in only
> > or move a large amount of code to the PCI core.
> 
> If at all possible I would like to avoid this and littering PCI side
> with non-PCI stuff. There could be other similar "mediums" in the future
> where you can transfer packets of "native" protocols such as PCIe so
> instead of making it Thunderbolt/USB4 specific it should be generic
> enough to support future extensions.
> 
> In case of Thunderbolt/USB4 there is no real way to figure out how much
> bandwidth each PCIe tunnel gets (it is kind of bulk traffic that gets
> what is left from isochronous protocols) so I would not even try that
> and instead use the real PCIe links in pcie_bandwidth_available() and
> skip all the "virtual" ones.

Actually can we call the new function something like pci_link_is_virtual()
instead and make pcie_bandwidth_available() call it? That would be more
future proof IMHO.
