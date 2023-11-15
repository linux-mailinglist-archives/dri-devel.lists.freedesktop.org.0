Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258357EC0DA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 11:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BC110E559;
	Wed, 15 Nov 2023 10:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236FD10E544;
 Wed, 15 Nov 2023 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700044827; x=1731580827;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WhUgLMg4fPuk0HcHV6kkPoQlTphUx0dqokHvR43C3OQ=;
 b=DqAHXMexfBurmC/XzfmKuCx86GMZeLwTWhfh6NI1Tue8xJikvQ7WDI89
 wAG/2auxIdgZPwXiA8iVWjCLl4Um1GYfWi+mU+0XB5kSch6/j4K7o9F2Q
 OQvQhIAH+oPHGjZ74xA9a24VC6FNFPWAQ1n50MLMJHGBOr55lq2P0x4hG
 ABaqOeKqvss2uxIGxwUw2HLM0LSU2YkO+XOn4cyEfLEIPRAES+4/Ro/SC
 5BeHcepThfV/0eplCInxvOE5MYVykHvkibXqcdNSjIy28MO2gkG+CuJ1k
 Nzu5ta5iot4ir+IU67QyIHFBPRysT4V/TCNNH6tA9Br/NXawTD8JsaVCo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393711587"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="393711587"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 02:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="768552987"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="768552987"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2023 02:40:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 3653C305; Wed, 15 Nov 2023 12:40:19 +0200 (EET)
Date: Wed, 15 Nov 2023 12:40:19 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 5/7] PCI: ACPI: Detect PCIe root ports that are used
 for tunneling
Message-ID: <20231115104019.GY17433@black.fi.intel.com>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
 <20231114200755.14911-6-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231114200755.14911-6-mario.limonciello@amd.com>
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

On Tue, Nov 14, 2023 at 02:07:53PM -0600, Mario Limonciello wrote:
> USB4 routers support a feature called "PCIe tunneling". This
> allows PCIe traffic to be transmitted over USB4 fabric.
> 
> PCIe root ports that are used in this fashion can be discovered
> by device specific data that specifies the USB4 router they are
> connected to. For the PCI core, the specific connection information
> doesn't matter, but it's interesting to know that this root port is
> used for tunneling traffic. This will allow other decisions to be
> made based upon it.
> 
> Detect the `usb4-host-interface` _DSD and if it's found save it
> into a new `is_virtual_link` bit in `struct pci_device`.

While this is fine for the "first" tunneled link, this does not take
into account possible other "virtual" links that lead to the endpoint in
question. Typically for eGPU it only makes sense to plug it directly to
the host but say there is a USB4 hub (with PCIe tunneling capabilities)
in the middle. Now the link from the hub to the eGPU that is also
"virtual" is not marked as such and the bandwidth calculations may not
get what is expected.

It should be possible to map the PCIe ports that go over USB4 links
through router port operation "Get PCIe Downstream Entry Mapping" and
for the Thunderbolt 3 there is the DROM entries (I believe Lukas has
patches for this part already) but I guess it is outside of the scope of
this series. Out of curiosity I tried to look in Windows documentation
if there is such interface for GPUs as we have in Linux but could not
find (which does not mean it does not exist, though).
