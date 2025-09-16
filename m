Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11306B59F58
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 19:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322FE10E11B;
	Tue, 16 Sep 2025 17:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ep7qwY+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC2010E11B;
 Tue, 16 Sep 2025 17:34:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C24C0601B3;
 Tue, 16 Sep 2025 17:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B202C4CEEB;
 Tue, 16 Sep 2025 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758044085;
 bh=g4fOI7lP326A/npVX2fO/Vi1aw7o2KcT7AikMVIOx/U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Ep7qwY+HAMiYSQ0JsRo/bXS+8m6BuJqlhIc7zzuGY54bIXXpYVk6a2JQrPbC2DuBY
 jAy2SsOiUrt+IXCTdcyZJrpgi39Wr8DU/PoTp0SlzwEUe6fdjNpQGsYvmrQ9x0yevD
 mES5NjYdhNG2BKouEJR8D87RuzZMr+dK1mxUsiPzDRc9z38AccLlZWeZSlZ9Vb8dHU
 5LdapKr5LKRkInL3WVJPWHBEHWS7Dd6Afh4FRoNgVKY7gxqrbWOzLF+UZ4lir+t/gq
 gcuQIT2CIuPYIvg2B2zWoKpKffSVki1kivfr+FEK++MimodDQY9EYfOjDO66Hu5MFr
 l7rKe+KmFF24Q==
Date: Tue, 16 Sep 2025 12:34:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, linux-pci@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250916173442.GA1765656@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915072428.1712837-2-vivek.kasireddy@intel.com>
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

[+cc Jason, also doing a lot of ACS work]

On Mon, Sep 15, 2025 at 12:21:05AM -0700, Vivek Kasireddy wrote:
> Typically, functions of the same PCI device (such as a PF and a VF)
> share the same bus and have a common root port and the PF provisions
> resources for the VF. Given this model, they can be considered
> compatible as far as P2PDMA access is considered.

These seem like more than just "typical".  Such devices *always* have
a common Root Port and a PF *always* provisions VF resources.  I guess
it's "typical" or at least common that a PF and VF share the same bus.

> Currently, although the distance (2) is correctly calculated for
> functions of the same device, an ACS check failure prevents P2P DMA
> access between them. Therefore, introduce a small function named
> pci_devfns_support_p2pdma() to determine if the provider and client
> belong to the same device and facilitate P2PDMA between them by
> not enforcing the ACS check.
> 
> However, since it is hard to determine if the device functions of
> any given PCI device are P2PDMA compatible, we only relax the ACS
> check enforcement for device functions of Intel GPUs. This is
> because the P2PDMA communication between the PF and VF of Intel
> GPUs is handled internally and does not typically involve the PCIe
> fabric.
> 
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Cc: <linux-pci@vger.kernel.org>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
> v1 -> v2:
> - Relax the enforcment of ACS check only for Intel GPU functions
>   as they are P2PDMA compatible given the way the PF provisions
>   the resources among multiple VFs.
> 
> v2 -> v3:
> - s/pci_devs_are_p2pdma_compatible/pci_devfns_support_p2pdma
> - Improve the commit message to explain the reasoning behind
>   relaxing the ACS check enforcement only for Intel GPU functions.
> 
> v3 -> v4: (Logan)
> - Drop the dev_is_pf() hunk as no special handling is needed for PFs
> - Besides the provider, also check to see the client is an Intel GPU
> ---
>  drivers/pci/p2pdma.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index da5657a02007..0a1d884cd0ff 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -544,6 +544,19 @@ static unsigned long map_types_idx(struct pci_dev *client)
>  	return (pci_domain_nr(client->bus) << 16) | pci_dev_id(client);
>  }
>  
> +static bool pci_devfns_support_p2pdma(struct pci_dev *provider,
> +				      struct pci_dev *client)
> +{
> +	if (provider->vendor == PCI_VENDOR_ID_INTEL &&
> +	    client->vendor == PCI_VENDOR_ID_INTEL) {
> +		if ((pci_is_vga(provider) && pci_is_vga(client)) ||
> +		    (pci_is_display(provider) && pci_is_display(client)))
> +			return pci_physfn(provider) == pci_physfn(client);
> +	}

I know I've asked this before, but I'm still confused about how this
is related to PCIe r7.0, sec 7.7.12, which says that if an SR-IOV
device implements internal peer-to-peer transactions, ACS is required,
and ACS P2P Egress Control must be supported.

Are you saying that these Intel GPUs don't conform to this?

Or they do, but it's not enough to solve this issue?

Or something else?

Maybe if we add the right comment here, it will keep me from asking
again :)

> +	return false;
> +}
> +
>  /*
>   * Calculate the P2PDMA mapping type and distance between two PCI devices.
>   *
> @@ -643,7 +656,7 @@ calc_map_type_and_dist(struct pci_dev *provider, struct pci_dev *client,
>  
>  	*dist = dist_a + dist_b;
>  
> -	if (!acs_cnt) {
> +	if (!acs_cnt || pci_devfns_support_p2pdma(provider, client)) {
>  		map_type = PCI_P2PDMA_MAP_BUS_ADDR;
>  		goto done;
>  	}
> -- 
> 2.50.1
> 
