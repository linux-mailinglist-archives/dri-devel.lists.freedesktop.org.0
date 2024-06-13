Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD04D9078D6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 18:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E5310E084;
	Thu, 13 Jun 2024 16:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBGCYp+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6814510EAEE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 16:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718297687; x=1749833687;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=sYo6CLQpNd3oyOaLOKtkTCnu2wQNyDqzPkAA6LWmf+Q=;
 b=FBGCYp+2KapaQiUlYlSD02OsUA6S4oFAzvNgLOLjch3RbdV+HzYAOBi6
 3joW4Ll5sbo/E7Q42TO9gFLy1C0lNmwtM8TJ4WmrquMI9ywriM+C6TCDk
 vmsqY/1HiS8PyTehhDhsJWKds9TwNRtWdkpnfQ/N5EiW6BDClYr64C3vx
 0TYr7aSDCX6SoxLG+fTooQ7xUBfJgaFQSpVC5GTI+bec9+5rRWQ4aujc7
 1Gb4ebIo0BGonsrH5uqPbharVHhN8habixU/+GI3Q62Gn8btbPaPfREe8
 hX89ZjhI+LPMELSFuHJgN+QEImWOdrz652tEJLtcp2I5sFsAnfYLjEpbq w==;
X-CSE-ConnectionGUID: jqzT2Em/RzanfXCd9imWnw==
X-CSE-MsgGUID: V+dbWp7TRsap21Hp4m0zuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="37661659"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="37661659"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 09:54:47 -0700
X-CSE-ConnectionGUID: DYmygLxuTaCi88bc17INcA==
X-CSE-MsgGUID: F2upfiHKSzSIAhIc0QOaew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="44585157"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.209])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 09:54:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 19:54:38 +0300 (EEST)
To: Philipp Stanner <pstanner@redhat.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 03/13] PCI: Reimplement plural devres functions
In-Reply-To: <20240605081605.18769-5-pstanner@redhat.com>
Message-ID: <aa4e5dd8-2ac4-ae58-2b1b-8d05115ac769@linux.intel.com>
References: <20240605081605.18769-2-pstanner@redhat.com>
 <20240605081605.18769-5-pstanner@redhat.com>
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

> When the original PCI devres API was implemented, priority was given to
> the creation of a set of "plural functions" such as
> pcim_request_regions(). These functions have bit masks as parameters to
> specify which BARs shall get mapped. Most users, however, only use those
> to map 1-3 BARs.
> 
> A complete set of "singular functions" does not exist.
> 
> As functions mapping / requesting multiple BARs at once have (almost) no
> mechanism in C to return the resources to the caller of the plural
> function, the PCI devres API utilizes the iomap-table administrated by the
> function pcim_iomap_table().
> 
> The entire PCI devres API was strongly tied to that table
> which only allows for mapping whole, complete BARs, as the BAR's index
> is used as table index. Consequently, it's not possible to, e.g., have a
> pcim_iomap_range() function with that mechanism.
> 
> An additional problem is hat the PCI devres API has been ipmlemented in
> a sort of "hybrid-mode": Some unmanaged functions have managed
> counterparts (e.g.: pci_iomap() <-> pcim_iomap()), making their managed
> nature obvious to the programmer. However, the region-request functions
> in pci.c, prefixed with pci_, behave either managed or unmanaged,
> depending on whether pci_enable_device() or pcim_enable_device() has
> been called in advance.
> 
> This hybrid API is confusing and should be more cleanly separated by
> providing always-managed functions prefixed with pcim_.
> 
> Thus, the existing PCI devres API is not desirable because:
>   a) The vast majority of the users of the plural functions only ever
>      sets a single bit in the bit mask, consequently making them singular
>      functions anyways.
>   b) There is no mechanism to request / iomap only part of a BAR.
>   c) The iomap-table mechanism is over-engineered and complicated. Even
>      worse, some users index over the table administration function
>      directly:
>      void __iomem *mapping = pcim_iomap_table(pdev)[my_index];
>      This can not perform bounds checks; an invalid index won't cause
>      return of -EINVAL or even NULL, resulting in undefined behavior.
>   d) region-request functions being sometimes managed and sometimes not
>      is bug-provoking.
> 
> Implement a set of internal helper functions that don't have the problem
> of a hybrid nature that their counter parts in pci.c have. Write those
> helpers in a generic manner so that they can easily be extended to,
> e.g., ranged mappings and requests.
> 
> Implement a set of singular functions that use devres as it's intended
> and use those singular functions to reimplement the plural functions.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

>  /*
> - * PCI iomap devres
> + * On the state of PCI's devres implementation:
> + *
> + * The older devres API for PCI has two significant problems:
> + *
> + * 1. It is very strongly tied to the statically allocated mapping table in
> + *    struct pcim_iomap_devres below. This is mostly solved in the sense of the
> + *    pcim_ functions in this file providing things like ranged mapping by
> + *    bypassing this table, wheras the functions that were present in the old
> + *    API still enter the mapping addresses into the table for users of the old
> + *    API.
> + * 2. The region-request-functions in pci.c do become managed IF the device has
> + *    been enabled with pcim_enable_device() instead of pci_enable_device().
> + *    This resulted in the API becoming inconsistent: Some functions have an
> + *    obviously managed counter-part (e.g., pci_iomap() <-> pcim_iomap()),
> + *    whereas some don't and are never managed, while others don't and are
> + *    _sometimes_ managed (e.g. pci_request_region()).
> + *    Consequently, in the new API, region requests performed by the pcim_
> + *    functions are automatically cleaned up through the devres callback
> + *    pcim_addr_resource_release(), while requests performed by
> + *    pcim_enable_device() + pci_*region*() are automatically cleaned up
> + *    through the for-loop in pcim_release().
> + *
> + * TODO 1:
> + * Remove the legacy table entirely once all calls to pcim_iomap_table() in
> + * the kernel have been removed.
> + *
> + * TODO 2:
> + * Port everyone calling pcim_enable_device() + pci_*region*() to using the
> + * pcim_ functions. Then, remove all devres functionality from pci_*region*()
> + * functions and remove the associated cleanups described above in point #2.
>   */
> -#define PCIM_IOMAP_MAX	PCI_STD_NUM_BARS
>  
> +/*
> + * Legacy struct storing addresses to whole mapped BARs.
> + */
>  struct pcim_iomap_devres {
> -	void __iomem *table[PCIM_IOMAP_MAX];
> +	void __iomem *table[PCI_STD_NUM_BARS];
> +};

> +/**
> + * __pcim_request_region_range - Request a ranged region
> + * @pdev: PCI device the region belongs to
> + * @bar: The BAR the region is within
> + * @offset: offset from the BAR's start address
> + * @maxlen: length in bytes, beginning at @offset
> + * @name: name associated with the request
> + * @req_flags: flags for the request. For example for kernel-exclusive requests.
> + *
> + * Returns: 0 on success, a negative error code on failure.
> + *
> + * Request a ranged region within a device's PCI BAR. This function performs
> + * sanity checks on the input.
> + */
> +static int __pcim_request_region_range(struct pci_dev *pdev, int bar,
> +		unsigned long offset, unsigned long maxlen,
> +		const char *name, int req_flags)
> +{
> +	resource_size_t start = pci_resource_start(pdev, bar);
> +	resource_size_t len = pci_resource_len(pdev, bar);
> +	unsigned long dev_flags = pci_resource_flags(pdev, bar);
> +
> +	if (start == 0 || len == 0) /* That's an unused BAR. */
> +		return 0;
> +	if (len <= offset)
> +		return  -EINVAL;

Extra space.

> +
> +	start += offset;
> +	len -= offset;
> +
> +	if (len > maxlen && maxlen != 0)
> +		len = maxlen;
> +
> +	if (dev_flags & IORESOURCE_IO) {
> +		if (!request_region(start, len, name))
> +			return -EBUSY;
> +	} else if (dev_flags & IORESOURCE_MEM) {
> +		if (!__request_mem_region(start, len, name, req_flags))
> +			return -EBUSY;
> +	} else {
> +		/* That's not a device we can request anything on. */
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __pcim_release_region_range(struct pci_dev *pdev, int bar,
> +		unsigned long offset, unsigned long maxlen)
> +{
> +	resource_size_t start = pci_resource_start(pdev, bar);
> +	resource_size_t len = pci_resource_len(pdev, bar);
> +	unsigned long flags = pci_resource_flags(pdev, bar);
> +
> +	if (len <= offset || start == 0)
> +		return;
> +
> +	if (len == 0 || maxlen == 0) /* This an unused BAR. Do nothing. */
> +		return;
> +
> +	start += offset;
> +	len -= offset;
> +
> +	if (len > maxlen)
> +		len = maxlen;
> +
> +	if (flags & IORESOURCE_IO)
> +		release_region(start, len);
> +	else if (flags & IORESOURCE_MEM)
> +		release_mem_region(start, len);
> +}

> @@ -473,19 +945,14 @@ EXPORT_SYMBOL(pcim_iomap_regions_request_all);
>   */
>  void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
>  {
> -	void __iomem * const *iomap;
> -	int i;
> -
> -	iomap = pcim_iomap_table(pdev);
> -	if (!iomap)
> -		return;
> +	short bar;

The current best practice is to use unsigned for loop vars that will never 
be negative.

I don't entirely follow what is reasoning behind making it short instead 
of unsigned int?

> -	for (i = 0; i < PCIM_IOMAP_MAX; i++) {
> -		if (!mask_contains_bar(mask, i))
> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {

Is this change minimal if it contains variable renames like this?
Was "i" not "bar" even if it was given as a parameter to 
mask_contains_bar()?

-- 
 i.

> +		if (!mask_contains_bar(mask, bar))
>  			continue;
>  
> -		pcim_iounmap(pdev, iomap[i]);
> -		pci_release_region(pdev, i);
> +		pcim_iounmap_region(pdev, bar);
> +		pcim_remove_bar_from_legacy_table(pdev, bar);
>  	}
>  }
>  EXPORT_SYMBOL(pcim_iounmap_regions);
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index e5f243dd4288..b5d21d8207d6 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3880,6 +3880,16 @@ void pci_release_region(struct pci_dev *pdev, int bar)
>  		release_mem_region(pci_resource_start(pdev, bar),
>  				pci_resource_len(pdev, bar));
>  
> +	/*
> +	 * This devres utility makes this function sometimes managed
> +	 * (when pcim_enable_device() has been called before).
> +	 * This is bad because it conflicts with the pcim_ functions being
> +	 * exclusively responsible for managed pci. Its "sometimes yes, sometimes
> +	 * no" nature can cause bugs.
> +	 *
> +	 * TODO: Remove this once all users that use pcim_enable_device() PLUS
> +	 * a region request function have been ported to using pcim_ functions.
> +	 */
>  	dr = find_pci_dr(pdev);
>  	if (dr)
>  		dr->region_mask &= ~(1 << bar);


