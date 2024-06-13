Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9709079C3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F99610E1C1;
	Thu, 13 Jun 2024 17:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvmPSUBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415BA10E1C1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718299416; x=1749835416;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Q4OOJM7TL6DDOZuS/f3Y0Wg65K0+aUCY/JXCCgp+xrM=;
 b=cvmPSUBCxt2fpYlVkJfEjkPbRRmFMoFea6CbIs8s9R4Yla73urmaG3/p
 qy5SCEK8Duhm1FaXnRIBbtWFPTbxY2hli8ndKUL0vJ4rD4AnvfRrDeWhI
 8fes81KZsGf5aOzlohUAKt4gG/PkpJfx+IhRoOP80R2u5YoYg5id056S5
 PAFTUFGNyDD8iCfqePpfxCfOPQ9ULcXQF1QJw+Or5DOiwY83RYdJhu/ZB
 s3SNBnFpT2kSKZE5HxRE+k6khK+MQnlMa+wpRVu+b0r5Bk2jrjBROJAm2
 BclzSdYaZmV+lj7F/w3YsGF9RHcnrr3pE/Yzrc24SeCY0dCIullwZbouk A==;
X-CSE-ConnectionGUID: JyE9IV0TRjO+C5md6/T9mw==
X-CSE-MsgGUID: PD+95MADSDq/0fSmvVpQFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26566868"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="26566868"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 10:23:35 -0700
X-CSE-ConnectionGUID: aHR87dNDTz23+6IlZYkWuA==
X-CSE-MsgGUID: 6HfEH/pTSdygPQCEU+mGfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="45154286"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.209])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 10:23:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 20:23:26 +0300 (EEST)
To: Philipp Stanner <pstanner@redhat.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 10/13] PCI: Give pci(m)_intx its own devres callback
In-Reply-To: <20240605081605.18769-12-pstanner@redhat.com>
Message-ID: <6cd568a9-1332-5a47-bdb2-ea079a8462af@linux.intel.com>
References: <20240605081605.18769-2-pstanner@redhat.com>
 <20240605081605.18769-12-pstanner@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Jun 2024, Philipp Stanner wrote:

> pci_intx() is one of the functions that have "hybrid mode" (i.e.,
> sometimes managed, sometimes not). Providing a separate pcim_intx()
> function with its own device resource and cleanup callback allows for
> removing further large parts of the legacy PCI devres implementation.
> 
> As in the region-request-functions, pci_intx() has to call into its
> managed counterpart for backwards compatibility.
> 
> As pci_intx() is an outdated function, pcim_intx() shall not be made
> visible to drivers via a public API.
> 
> Implement pcim_intx() with its own device resource.
> Make pci_intx() call pcim_intx() in the managed case.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/pci/devres.c | 76 ++++++++++++++++++++++++++++++++++++--------
>  drivers/pci/pci.c    | 23 ++++++++------
>  drivers/pci/pci.h    |  7 ++--
>  3 files changed, 80 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index 0bafb67e1886..9a997de280df 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -40,6 +40,11 @@ struct pcim_iomap_devres {
>  	void __iomem *table[PCI_STD_NUM_BARS];
>  };
>  
> +/* Used to restore the old intx state on driver detach. */

INTx

> +struct pcim_intx_devres {
> +	int orig_intx;
> +};
> +
>  enum pcim_addr_devres_type {
>  	/* Default initializer. */
>  	PCIM_ADDR_DEVRES_TYPE_INVALID,
> @@ -392,32 +397,75 @@ int pcim_set_mwi(struct pci_dev *pdev)
>  }
>  EXPORT_SYMBOL(pcim_set_mwi);
>  
> +
>  static inline bool mask_contains_bar(int mask, int bar)

Stray change.

-- 
 i.

>  {
>  	return mask & BIT(bar);
>  }
>  
> -static void pcim_release(struct device *gendev, void *res)
> +static void pcim_intx_restore(struct device *dev, void *data)
>  {
> -	struct pci_dev *dev = to_pci_dev(gendev);
> -	struct pci_devres *this = res;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct pcim_intx_devres *res = data;
>  
> -	if (this->restore_intx)
> -		pci_intx(dev, this->orig_intx);
> +	pci_intx(pdev, res->orig_intx);
> +}
>  
> -	if (!dev->pinned)
> -		pci_disable_device(dev);
> +static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
> +{
> +	struct pcim_intx_devres *res;
> +
> +	res = devres_find(dev, pcim_intx_restore, NULL, NULL);
> +	if (res)
> +		return res;
> +
> +	res = devres_alloc(pcim_intx_restore, sizeof(*res), GFP_KERNEL);
> +	if (res)
> +		devres_add(dev, res);
> +
> +	return res;
>  }
>  
> -/*
> - * TODO: After the last four callers in pci.c are ported, find_pci_dr()
> - * needs to be made static again.
> +/**
> + * pcim_intx - managed pci_intx()
> + * @pdev: the PCI device to operate on
> + * @enable: boolean: whether to enable or disable PCI INTx
> + *
> + * Returns: 0 on success, -ENOMEM on error.
> + *
> + * Enables/disables PCI INTx for device @pdev.
> + * Restores the original state on driver detach.
>   */
> -struct pci_devres *find_pci_dr(struct pci_dev *pdev)
> +int pcim_intx(struct pci_dev *pdev, int enable)
>  {
> -	if (pci_is_managed(pdev))
> -		return devres_find(&pdev->dev, pcim_release, NULL, NULL);
> -	return NULL;
> +	u16 pci_command, new;
> +	struct pcim_intx_devres *res;
> +
> +	res = get_or_create_intx_devres(&pdev->dev);
> +	if (!res)
> +		return -ENOMEM;
> +
> +	res->orig_intx = !enable;
> +
> +	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
> +
> +	if (enable)
> +		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
> +	else
> +		new = pci_command | PCI_COMMAND_INTX_DISABLE;
> +
> +	if (new != pci_command)
> +		pci_write_config_word(pdev, PCI_COMMAND, new);
> +
> +	return 0;
> +}
> +
> +static void pcim_release(struct device *gendev, void *res)
> +{
> +	struct pci_dev *dev = to_pci_dev(gendev);
> +
> +	if (!dev->pinned)
> +		pci_disable_device(dev);
>  }
>  
>  static struct pci_devres *get_pci_dr(struct pci_dev *pdev)
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 04accdfab7ce..de58e77f0ee0 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4444,11 +4444,23 @@ void pci_disable_parity(struct pci_dev *dev)
>   * This is a "hybrid" function: It's normally unmanaged, but becomes managed
>   * when pcim_enable_device() has been called in advance. This hybrid feature is
>   * DEPRECATED!
> + *
> + * Use pcim_intx() if you need a managed version.
>   */
>  void pci_intx(struct pci_dev *pdev, int enable)
>  {
>  	u16 pci_command, new;
>  
> +	/*
> +	 * This is done for backwards compatibility, because the old PCI devres
> +	 * API had a mode in which this function became managed if the dev had
> +	 * been enabled with pcim_enable_device() instead of pci_enable_device().
> +	 */
> +	if (pci_is_managed(pdev)) {
> +		WARN_ON_ONCE(pcim_intx(pdev, enable) != 0);
> +		return;
> +	}
> +
>  	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
>  
>  	if (enable)
> @@ -4456,17 +4468,8 @@ void pci_intx(struct pci_dev *pdev, int enable)
>  	else
>  		new = pci_command | PCI_COMMAND_INTX_DISABLE;
>  
> -	if (new != pci_command) {
> -		struct pci_devres *dr;
> -
> +	if (new != pci_command)
>  		pci_write_config_word(pdev, PCI_COMMAND, new);
> -
> -		dr = find_pci_dr(pdev);
> -		if (dr && !dr->restore_intx) {
> -			dr->restore_intx = 1;
> -			dr->orig_intx = !enable;
> -		}
> -	}
>  }
>  EXPORT_SYMBOL_GPL(pci_intx);
>  
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index dbf6772aaaaf..3aa57cd8b3e5 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -823,11 +823,14 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
>   * then remove them from here.
>   */
>  struct pci_devres {
> -	unsigned int orig_intx:1;
> -	unsigned int restore_intx:1;
> +	/*
> +	 * TODO:
> +	 * This struct is now surplus. Remove it by refactoring pci/devres.c
> +	 */
>  };
>  
>  struct pci_devres *find_pci_dr(struct pci_dev *pdev);
> +int pcim_intx(struct pci_dev *dev, int enable);
>  
>  int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
>  int pcim_request_region_exclusive(struct pci_dev *pdev, int bar, const char *name);
> 
