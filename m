Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96194D7DF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 22:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B6010E9F9;
	Fri,  9 Aug 2024 20:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sSN8kmxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52A810E9F9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 20:09:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1DEC61767;
 Fri,  9 Aug 2024 20:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0C0C32782;
 Fri,  9 Aug 2024 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723234193;
 bh=TWxH6MDJR9vRLD6TqLUh9ECs1rCynCgT1oMUueBC3RM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=sSN8kmxTVsrWlr2igibsenVZPmn5OL7VoacyHOU+SJMd8MhnxzQSP02RE26i06UpJ
 hplG+16G3uUgovdzBXMS1NBc+H+7Az/7hFlZyHdE6HrTUn4p/Jvji4Y+6sPVSmREbU
 u6GNVdhnqptx8tK/eTKptzdX+Njv3kbEl3Yq3Ifq5pbsBr1LRZxwZOqF7e/wPqs4LN
 Yjij0yX81+HmBupuxTp/2MR1DSNgmEr0mTyiBDnoXP0N8mzjR7UZiwTDw+a/Rnkop+
 7fW09DtM25aKRzqme4eU+32qcXFIQ5Pnrc/lTfxnMyRGHEKtxy+wbEmvusj4i8Uj+R
 Tpb821IpSJ+UQ==
Date: Fri, 9 Aug 2024 15:09:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: Deprecate pcim_iomap_regions() in favor of
 pcim_iomap_region()
Message-ID: <20240809200951.GA212090@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807083018.8734-2-pstanner@redhat.com>
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

On Wed, Aug 07, 2024 at 10:30:18AM +0200, Philipp Stanner wrote:
> pcim_iomap_regions() is a complicated function that uses a bit mask to
> determine the BARs the user wishes to request and ioremap. Almost all
> users only ever set a single bit in that mask, making that mechanism
> questionable.
> 
> pcim_iomap_region() is now available as a more simple replacement.
> 
> Make pcim_iomap_region() a public function.
> 
> Mark pcim_iomap_regions() as deprecated.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Both applied (second with Thomas' reviewed-by and Dave's ack) to
pci/devres for v6.12, thanks!

> ---
>  drivers/pci/devres.c | 8 ++++++--
>  include/linux/pci.h  | 2 ++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index 3780a9f9ec00..89ec26ea1501 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -728,7 +728,7 @@ EXPORT_SYMBOL(pcim_iounmap);
>   * Mapping and region will get automatically released on driver detach. If
>   * desired, release manually only with pcim_iounmap_region().
>   */
> -static void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
> +void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
>  				       const char *name)
>  {
>  	int ret;
> @@ -761,6 +761,7 @@ static void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
>  
>  	return IOMEM_ERR_PTR(ret);
>  }
> +EXPORT_SYMBOL(pcim_iomap_region);
>  
>  /**
>   * pcim_iounmap_region - Unmap and release a PCI BAR
> @@ -783,7 +784,7 @@ static void pcim_iounmap_region(struct pci_dev *pdev, int bar)
>  }
>  
>  /**
> - * pcim_iomap_regions - Request and iomap PCI BARs
> + * pcim_iomap_regions - Request and iomap PCI BARs (DEPRECATED)
>   * @pdev: PCI device to map IO resources for
>   * @mask: Mask of BARs to request and iomap
>   * @name: Name associated with the requests
> @@ -791,6 +792,9 @@ static void pcim_iounmap_region(struct pci_dev *pdev, int bar)
>   * Returns: 0 on success, negative error code on failure.
>   *
>   * Request and iomap regions specified by @mask.
> + *
> + * This function is DEPRECATED. Do not use it in new code.
> + * Use pcim_iomap_region() instead.
>   */
>  int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name)
>  {
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 4cf89a4b4cbc..fc30176d28ca 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2292,6 +2292,8 @@ static inline void pci_fixup_device(enum pci_fixup_pass pass,
>  void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
>  void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr);
>  void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);
> +void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
> +				       const char *name);
>  int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
>  int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
>  				   const char *name);
> -- 
> 2.45.2
> 
