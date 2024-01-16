Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0C82FA3F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 22:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F3710E582;
	Tue, 16 Jan 2024 21:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 732 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jan 2024 21:27:56 UTC
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi
 [62.142.5.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955AF10E582
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 21:27:56 +0000 (UTC)
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
 by fgw20.mail.saunalahti.fi (Halon) with ESMTP
 id 1bdb063f-b4b6-11ee-b3cf-005056bd6ce9;
 Tue, 16 Jan 2024 23:27:54 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Tue, 16 Jan 2024 23:27:53 +0200
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 02/10] pci: deprecate iomap-table functions
Message-ID: <Zab02RyfvP-IZTl4@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
 <20240115144655.32046-4-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115144655.32046-4-pstanner@redhat.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mon, Jan 15, 2024 at 03:46:13PM +0100, Philipp Stanner kirjoitti:
> The old plural devres functions tie PCI's devres implementation to the
> iomap-table mechanism which unfortunately is not extensible.
> 
> As the purlal functions are almost never used with more than one bit set
> in their bit-mask, deprecating them and encouraging users to use the new
> singular functions instead is reasonable.
> 
> Furthermore, to make the implementation more consistent and extensible,
> the plural functions should use the singular functions.
> 
> Add new wrapper to request / release all BARs.
> Make the plural functions call into the singular functions.
> Mark the plural functions as deprecated.
> Remove as much of the iomap-table-mechanism as possible.
> Add comments describing the path towards a cleaned-up API.

...

>  static void pcim_iomap_release(struct device *gendev, void *res)
>  {
> -	struct pci_dev *dev = to_pci_dev(gendev);
> -	struct pcim_iomap_devres *this = res;
> -	int i;
> -
> -	for (i = 0; i < PCIM_IOMAP_MAX; i++)
> -		if (this->table[i])
> -			pci_iounmap(dev, this->table[i]);
> +	/*
> +	 * Do nothing. This is legacy code.
> +	 *
> +	 * Cleanup of the mappings is now done directly through the callbacks
> +	 * registered when creating them.
> +	 */
>  }

How many users we have? Can't we simply kill it for good?

...

> + * This function is DEPRECATED. Do not use it in new code.

We have __deprecated IIRC, can it be used?

...

> +	if (pcim_add_mapping_to_legacy_table(pdev, mapping, bar) != 0)

Redundant ' != 0' part.

> +		goto err_table;

...

> +static inline bool mask_contains_bar(int mask, int bar)
> +{
> +	return mask & (1 << bar);

BIT() ?

> +}

But I believe this function is not needed (see below).

...

>  /**
> - * pcim_iomap_regions - Request and iomap PCI BARs
> + * pcim_iomap_regions - Request and iomap PCI BARs (DEPRECATED)
>   * @pdev: PCI device to map IO resources for
>   * @mask: Mask of BARs to request and iomap
>   * @name: Name associated with the requests
>   *
> + * Returns 0 on success, negative error code on failure.

Validate the kernel-doc.

>   * Request and iomap regions specified by @mask.
> + *
> + * This function is DEPRECATED. Don't use it in new code.
> + * Use pcim_iomap_region() instead.
>   */

...

> +	for (bar = 0; bar < DEVICE_COUNT_RESOURCE; bar++) {
> +		if (!mask_contains_bar(mask, bar))
> +			continue;

NIH for_each_set_bit().

...

> +		ret = pcim_add_mapping_to_legacy_table(pdev, mapping, bar);
> +		if (ret != 0)

		if (ret)

> +			goto err;
> +	}

...

> + err:

Better to name it like

err_unmap_and_remove:

> +	while (--bar >= 0) {

	while (bar--)

is easier to read.

> +		pcim_iounmap_region(pdev, bar);
> +		pcim_remove_bar_from_legacy_table(pdev, bar);
> +	}

...

> +/**
> + * pcim_request_all_regions - Request all regions
> + * @pdev: PCI device to map IO resources for
> + * @name: name associated with the request
> + *
> + * Requested regions will automatically be released at driver detach. If desired,
> + * release individual regions with pcim_release_region() or all of them at once
> + * with pcim_release_all_regions().
> + */

Validate kernel-doc.

...

> +		ret = pcim_request_region(pdev, bar, name);
> +		if (ret != 0)

		if (ret)

> +			goto err;


...

> +	short bar;

Why signed?

> +	int ret = -1;

Oy vei!

...

> +	ret = pcim_request_all_regions(pdev, name);
> +	if (ret != 0)

Here and in plenty other places

	if (ret)

> +		return ret;

> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> +		if (!mask_contains_bar(mask, bar))
> +			continue;

NIH for_each_set_bit()

> +		if (!pcim_iomap(pdev, bar, 0))
> +			goto err;
> +	}

...

> +	if (!legacy_iomap_table)

What's wrong with positive check?

> +		ret = -ENOMEM;
> +	else
> +		ret = -EINVAL;

Can be even one liner


What's wrong with positive check?

		ret = legacy_iomap_table ? -EINVAL : -ENOMEM;

...

> +	while (--bar >= 0)

	while (bar--)

> +		pcim_iounmap(pdev, legacy_iomap_table[bar]);

...

> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> +		if (!mask_contains_bar(mask, bar))
>  			continue;

NIH for_each_set_bit()

> -		pcim_iounmap(pdev, iomap[i]);
> -		pci_release_region(pdev, i);
> +		pcim_iounmap_region(pdev, bar);
> +		pcim_remove_bar_from_legacy_table(pdev, bar);
>  	}

-- 
With Best Regards,
Andy Shevchenko


