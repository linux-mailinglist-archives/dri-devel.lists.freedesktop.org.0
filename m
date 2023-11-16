Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC967EE0E1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 13:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C0910E288;
	Thu, 16 Nov 2023 12:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D4A10E288;
 Thu, 16 Nov 2023 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700139033; x=1731675033;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=3rbjsPrRXcTI1/onsoaCoIgDQpFdGvTRViKjIazLrTA=;
 b=bOJIS+MFigPGDtKFwJ8cqm0u+554MitSNp/T09gq7NIYSaPRC4gpOPoH
 Ws8yBpfVFeyMmQZOQHk77jL6WorTQldU/8R2iLiYQCs9lbIuxeukv0EUx
 bVMtD0TVfWAUQGckH95E23hjSzmaa3ADvNhhI7C+45T/eqUGlV0ZmLgcd
 dIGYRktnBt9sXcdv+L07izJoauOAUmnZ+XlEafRuUyfPZFqmlsY1mHrOh
 I4tAEXweUNRSb9j+5jmspZ4SB/eLbKon93w2P2GiRa7akyHHXHHcJU4WX
 8YsoJW68QzzPGhzcfIK0PW550LuiaYfassTJ8AKUqvZ5+ogeF/5TSx+IY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="389939224"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="389939224"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 04:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="6716433"
Received: from jhsteyn-mobl1.ger.corp.intel.com ([10.252.40.9])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 04:50:26 -0800
Date: Thu, 16 Nov 2023 14:50:24 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 1/7] drm/nouveau: Switch from
 pci_is_thunderbolt_attached() to dev_is_removable()
In-Reply-To: <20231114200755.14911-2-mario.limonciello@amd.com>
Message-ID: <7284facf-d08d-8274-1b2b-94b121aabbd5@linux.intel.com>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
 <20231114200755.14911-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>,
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023, Mario Limonciello wrote:

> pci_is_thunderbolt_attached() looks at the hierarchy of the PCIe device
> to determine if any bridge along the way has the is_thunderbolt bit set.
> This bit will only be set when one of the devices in the hierarchy is an
> Intel Thunderbolt device.
> 
> However PCIe devices can be connected to USB4 hubs and routers which won't
> necessarily set the is_thunderbolt bit. These devices will however be
> marked as externally facing which means they are marked removable by
> pci_set_removable().
> 
> Look whether the device is marked removable to determine it's
> connected to a Thunderbolt controller or USB4 router.

(I hate having to say this) but I still feel the actual reason why you're 
doing this change is missing from the above and has to be read between the 
lines.

Perhaps something along these lines matches what's your intent here:

The external GPU check added in commit 1d3c11030103 ("drm/nouveau: Don't 
register Thunderbolt eGPU with vga_switcheroo") covers only Thunderbolt
devices but removable PCIe devices can also be connected to USB4 hubs and 
routers. Those devices won't necessarily set the is_thunderbolt bit that
pci_is_thunderbolt_attached() checks for.

USB4 hubs and routers are however marked as externally facing which means 
they are marked removable by pci_set_removable().

Extend the check for removable device beyond Thunderbolt devices by 
using dev_is_removable() that covers also USB4 routers.

?

-- 
 i.

> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2->v3:
>  * Update commit message
> ---
>  drivers/gpu/drm/nouveau/nouveau_vga.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
> index f8bf0ec26844..14215b7ca187 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -94,8 +94,8 @@ nouveau_vga_init(struct nouveau_drm *drm)
>  
>  	vga_client_register(pdev, nouveau_vga_set_decode);
>  
> -	/* don't register Thunderbolt eGPU with vga_switcheroo */
> -	if (pci_is_thunderbolt_attached(pdev))
> +	/* don't register USB4/Thunderbolt eGPU with vga_switcheroo */
> +	if (dev_is_removable(&pdev->dev))
>  		return;
>  
>  	vga_switcheroo_register_client(pdev, &nouveau_switcheroo_ops, runtime);
> @@ -118,7 +118,7 @@ nouveau_vga_fini(struct nouveau_drm *drm)
>  
>  	vga_client_unregister(pdev);
>  
> -	if (pci_is_thunderbolt_attached(pdev))
> +	if (dev_is_removable(&pdev->dev))
>  		return;
>  
>  	vga_switcheroo_unregister_client(pdev);
> 

