Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88499999536
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 00:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4598010E9E8;
	Thu, 10 Oct 2024 22:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UjE3esmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0AB10E9E5;
 Thu, 10 Oct 2024 22:30:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A5D965C062A;
 Thu, 10 Oct 2024 22:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D8BC4CEC5;
 Thu, 10 Oct 2024 22:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728599419;
 bh=RmmjDvDZ7iJUH7ngcCFh624/xsW4HOovYjuPHee/7VI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=UjE3esmTX8+GJNF4Z+olw+k/0MBVzlX+Exnc4NXTcyz7/XGvQP93CbXMtkqgXeq2M
 eEb1WKi3YFEIJtuqB3us4HyKnAdfT37xKrmmtt4azZCZl32W3ysP3Ph9wLeTldCBnL
 594f2SyzMueaWevU3StH5oRsHt1nHrXMHPFpOtb1sJ6guQNEHQ9G0ZTw1QoB12ROGV
 DJkQWXGM/sjMj2Ej33uH+4ncmZZ0VuRH0I0ZVMdFuHzdi29bjVca0sXNVCzEFVTQTm
 16nl0LRI50D1DVSFo8QYcRMxBvZQMfK5MK9vwVi0k7gSC1UMwoo+bsr1Yq5X/GwKQE
 bnJj/C6sKVuQA==
Date: Thu, 10 Oct 2024 17:30:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 2/5] PCI: Add a helper to identify IOV resources
Message-ID: <20241010223017.GA581272@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010103203.382898-3-michal.winiarski@intel.com>
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

On Thu, Oct 10, 2024 at 12:32:00PM +0200, Michał Winiarski wrote:
> There are multiple places where special handling is required for IOV
> resources.
> Extract it to a helper and drop a few ifdefs.

Add blank line between paragraphs.

Include name of helper in subject line and commit log, i.e.,
pci_resource_is_iov().  No point in guessing or making us extract it
from the patch.  This will also make the commit log say more clearly
what the patch does.

> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/pci/pci.h       | 18 ++++++++++++++----
>  drivers/pci/setup-bus.c |  5 +----
>  drivers/pci/setup-res.c |  4 +---
>  3 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 14d00ce45bfa9..c55f2d7a4f37e 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -580,6 +580,10 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
>  resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
>  void pci_restore_iov_state(struct pci_dev *dev);
>  int pci_iov_bus_range(struct pci_bus *bus);
> +static inline bool pci_resource_is_iov(int resno)
> +{
> +	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
> +}
>  extern const struct attribute_group sriov_pf_dev_attr_group;
>  extern const struct attribute_group sriov_vf_dev_attr_group;
>  #else
> @@ -589,12 +593,20 @@ static inline int pci_iov_init(struct pci_dev *dev)
>  }
>  static inline void pci_iov_release(struct pci_dev *dev) { }
>  static inline void pci_iov_remove(struct pci_dev *dev) { }
> +static inline void pci_iov_update_resource(struct pci_dev *dev, int resno) { }
> +static inline resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
> +{
> +	return 0;
> +}
>  static inline void pci_restore_iov_state(struct pci_dev *dev) { }
>  static inline int pci_iov_bus_range(struct pci_bus *bus)
>  {
>  	return 0;
>  }
> -
> +static inline bool pci_resource_is_iov(int resno)
> +{
> +	return false;
> +}
>  #endif /* CONFIG_PCI_IOV */
>  
>  #ifdef CONFIG_PCIE_PTM
> @@ -616,12 +628,10 @@ unsigned long pci_cardbus_resource_alignment(struct resource *);
>  static inline resource_size_t pci_resource_alignment(struct pci_dev *dev,
>  						     struct resource *res)
>  {
> -#ifdef CONFIG_PCI_IOV
>  	int resno = res - dev->resource;
>  
> -	if (resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END)
> +	if (pci_resource_is_iov(resno))
>  		return pci_sriov_resource_alignment(dev, resno);
> -#endif
>  	if (dev->class >> 8 == PCI_CLASS_BRIDGE_CARDBUS)
>  		return pci_cardbus_resource_alignment(res);
>  	return resource_alignment(res);
> diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
> index 23082bc0ca37a..8909948bc9a9f 100644
> --- a/drivers/pci/setup-bus.c
> +++ b/drivers/pci/setup-bus.c
> @@ -1093,17 +1093,14 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
>  			     (r->flags & mask) != type3))
>  				continue;
>  			r_size = resource_size(r);
> -#ifdef CONFIG_PCI_IOV
>  			/* Put SRIOV requested res to the optional list */
> -			if (realloc_head && i >= PCI_IOV_RESOURCES &&
> -					i <= PCI_IOV_RESOURCE_END) {
> +			if (realloc_head && pci_resource_is_iov(i)) {
>  				add_align = max(pci_resource_alignment(dev, r), add_align);
>  				r->end = r->start - 1;
>  				add_to_list(realloc_head, dev, r, r_size, 0 /* Don't care */);
>  				children_add_size += r_size;
>  				continue;
>  			}
> -#endif
>  			/*
>  			 * aligns[0] is for 1MB (since bridge memory
>  			 * windows are always at least 1MB aligned), so
> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> index c6d933ddfd464..e2cf79253ebda 100644
> --- a/drivers/pci/setup-res.c
> +++ b/drivers/pci/setup-res.c
> @@ -127,10 +127,8 @@ void pci_update_resource(struct pci_dev *dev, int resno)
>  {
>  	if (resno <= PCI_ROM_RESOURCE)
>  		pci_std_update_resource(dev, resno);
> -#ifdef CONFIG_PCI_IOV
> -	else if (resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END)
> +	else if (pci_resource_is_iov(resno))
>  		pci_iov_update_resource(dev, resno);
> -#endif
>  }
>  
>  int pci_claim_resource(struct pci_dev *dev, int resource)
> -- 
> 2.47.0
> 
