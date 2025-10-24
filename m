Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8D8C0840E
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 00:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C98410E226;
	Fri, 24 Oct 2025 22:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NR+ba8cC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAAD10E05F;
 Fri, 24 Oct 2025 22:44:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D034044A9D;
 Fri, 24 Oct 2025 22:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95334C4CEF1;
 Fri, 24 Oct 2025 22:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761345842;
 bh=tuvy+AqXN0ZLcAf47nDc5FvtJB/fct1wN56RWkZh0R4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=NR+ba8cC460oHiAtsdqg9ooDKlAjej23TdViOJivk9QUD0l2xkzVGuL2KFYYESyCG
 4phUWuErNaIFRfLE2/SZGhkGfvCBmvS8d8GCrsxiOAR4yOJJUL+6S0xMwpJUEV3b06
 C0MMmvU0w33dll58fsAMKaV2Jux2frnCSUFEbfEjjkIZnjzNYivojP9ECqLnyCijsf
 wkZPELw/UOLsaQ2a1PcLVE5uYpJX1GOhe5W+wg1CHE9hFWdj+qp8qZ6sH6+D2+7nuI
 fM8Z418uB3xMKtrFjs8ge3ms3lhOtj4VJnQlMLwr3sHcxH9GQdReJ5CWphMF7fMWZj
 EPi8SZXznJcDw==
Date: Fri, 24 Oct 2025 17:44:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Simon Richter <Simon.Richter@hogyros.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: Release BAR0 of an integrated bridge to allow
 GPU BAR resize
Message-ID: <20251024224401.GA1371085@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918-xe-pci-rebar-2-v1-1-6c094702a074@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 18, 2025 at 01:58:56PM -0700, Lucas De Marchi wrote:
> From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> Resizing BAR to a larger size has to release upstream bridge windows in
> order make the bridge windows larger as well (and to potential relocate
> them into a larger free block within iomem space). Some GPUs have an
> integrated PCI switch that has BAR0. The resource allocation assigns
> space for that BAR0 as it does for any resource.
> 
> An extra resource on a bridge will pin its upstream bridge window in
> place which prevents BAR resize for anything beneath that bridge.
> 
> Nothing in the pcieport driver provided by PCI core, which typically is
> the driver bound to these bridges, requires that BAR0. Because of that,
> releasing the extra BAR does not seem to have notable downsides but
> comes with a clear upside.
> 
> Therefore, release BAR0 of such switches using a quirk and clear its
> flags to prevent any new invocation of the resource assignment
> algorithm from assigning the resource again.
> 
> Due to other siblings within the PCI hierarchy of all the devices
> integrated into the GPU, some other devices may still have to be
> manually removed before the resize is free of any bridge window pins.
> Such siblings can be released through sysfs to unpin windows while
> leaving access to GPU's sysfs entries required for initiating the
> resize operation, whereas removing the topmost bridge this quirk
> targets would result in removing the GPU device as well so no manual
> workaround for this problem exists.
> 
> Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Link: https://lore.kernel.org/linux-pci/fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov/
> Link: https://lore.kernel.org/intel-xe/20250721173057.867829-1-uwu@icenowy.me/
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> Remarks from Ilpo: this feels quite hacky to me and I'm working towards a
> better solution which is to consider Resizable BAR maximum size the
> resource fitting algorithm. But then, I don't expect the better solution
> to be something we want to push into stable due to extremely invasive
> dependencies. So maybe consider this an interim/legacy solution to the
> resizing problem and remove it once the algorithmic approach works (or
> more precisely retain it only in the old kernel versions).
> ---
>  drivers/pci/quirks.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index d97335a401930..9b1c08de3aa89 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -6338,3 +6338,26 @@ static void pci_mask_replay_timer_timeout(struct pci_dev *pdev)
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_timer_timeout);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_timer_timeout);
>  #endif
> +
> +/*
> + * PCI switches integrated into Intel Arc GPUs have BAR0 that prevents
> + * resizing the BARs of the GPU device due to that bridge BAR0 pinning the
> + * bridge window it's under in place. Nothing in pcieport requires that
> + * BAR0.
> + *
> + * Release and disable BAR0 permanently by clearing its flags to prevent
> + * anything from assigning it again.

Does "disabling BAR0" actually work?  This quirk keeps the PCI core
from assigning resources to the BAR, but I don't think we have a way
to actually disable an individual BAR, do we?

I think the only control is PCI_COMMAND_MEMORY, and the bridge must
have PCI_COMMAND_MEMORY enabled so memory accesses to downstream
devices work.

No matter what we do to the struct resource, the hardware BAR still
contains some address, and the bridge will decode any accesses that
match the address in the BAR.

Maybe we could effectively disable the BAR by setting it to some
impossible address, i.e., something outside both the upstream and
downstream bridge windows so memory accesses could never be routed to
it?

> + */
> +static void pci_release_bar0(struct pci_dev *pdev)
> +{
> +	struct resource *res = pci_resource_n(pdev, 0);
> +
> +	if (!res->parent)
> +		return;
> +
> +	pci_release_resource(pdev, 0);
> +	res->flags = 0;
> +}
> +DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0x4fa0, pci_release_bar0);
> +DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0x4fa1, pci_release_bar0);
> +DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0xe2ff, pci_release_bar0);
> 
> -- 
> 2.50.1
> 
