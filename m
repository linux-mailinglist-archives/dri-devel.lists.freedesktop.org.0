Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470E79078E6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 18:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B35510EB03;
	Thu, 13 Jun 2024 16:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbeKBbxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B1B10EAEE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718297852; x=1749833852;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=hd9vc6MALzfwEyeQxQIYvuAxlS8U6K9tjwKHqZH1mZE=;
 b=VbeKBbxdTFrJHCJqOMxZHN391EeSBA+HTYNZoiat7z8eEhzLiwt6PT+u
 njNgEbMUGU0SKba4uHpH/NDi/GsMhNBAtxXY9UuX1WwalLs7CSYLUMOS2
 pia8FNvxqSs+M1HrGA4wvI6bTH5bM+WvZVsuM0HXJS8SSNbxhx7HurguP
 vJKpguobG2BS+VWOVjBaOB495eadp+9p7ZU0eeahN/b//suTOeafYnWDO
 hOGL0F3MqCUdv5b8VxmoPZ/G/KRUa1nFHRn+ExTmcW0fHsDvBpRS9KarU
 VS42xl0rvuvCRjfFf1Q5nBXWGyULJcgrjE4jeMWyU/+0cPERueB36YJE4 w==;
X-CSE-ConnectionGUID: JEAnvPEfT6m8LhmnGwCbOg==
X-CSE-MsgGUID: C0WpwL48TWWftVIezypTTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26561754"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="26561754"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 09:57:32 -0700
X-CSE-ConnectionGUID: raO9RN/gQDSJ86BMnHowAA==
X-CSE-MsgGUID: Y90vooGuQBaEo/L6sctEwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="71007612"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.209])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 09:57:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 19:57:24 +0300 (EEST)
To: Philipp Stanner <pstanner@redhat.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 01/13] PCI: Add and use devres helper for bit masks
In-Reply-To: <20240605081605.18769-3-pstanner@redhat.com>
Message-ID: <c1ae8732-357a-fce7-8853-9ea7051d306d@linux.intel.com>
References: <20240605081605.18769-2-pstanner@redhat.com>
 <20240605081605.18769-3-pstanner@redhat.com>
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

> The current derves implementation uses manual shift operations to check
> whether a bit in a mask is set. The code can be made more readable by
> writing a small helper function for that.
> 
> Implement mask_contains_bar() and use it where applicable.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/pci/devres.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index 2c562b9eaf80..f13edd4a3873 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -161,6 +161,10 @@ int pcim_set_mwi(struct pci_dev *dev)
>  }
>  EXPORT_SYMBOL(pcim_set_mwi);
>  
> +static inline bool mask_contains_bar(int mask, int bar)

Why these are signed? Using & for signed values is an indication that the 
types should have been unsigned. The typing change has ripple effects to 
caller-side typing.

> +{
> +	return mask & BIT(bar);
> +}

-- 
 i.

>  
>  static void pcim_release(struct device *gendev, void *res)
>  {
> @@ -169,7 +173,7 @@ static void pcim_release(struct device *gendev, void *res)
>  	int i;
>  
>  	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
> -		if (this->region_mask & (1 << i))
> +		if (mask_contains_bar(this->region_mask, i))
>  			pci_release_region(dev, i);
>  
>  	if (this->mwi)
> @@ -363,7 +367,7 @@ int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name)
>  	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
>  		unsigned long len;
>  
> -		if (!(mask & (1 << i)))
> +		if (!mask_contains_bar(mask, i))
>  			continue;
>  
>  		rc = -EINVAL;
> @@ -386,7 +390,7 @@ int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name)
>  	pci_release_region(pdev, i);
>   err_inval:
>  	while (--i >= 0) {
> -		if (!(mask & (1 << i)))
> +		if (!mask_contains_bar(mask, i))
>  			continue;
>  		pcim_iounmap(pdev, iomap[i]);
>  		pci_release_region(pdev, i);
> @@ -438,7 +442,7 @@ void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
>  		return;
>  
>  	for (i = 0; i < PCIM_IOMAP_MAX; i++) {
> -		if (!(mask & (1 << i)))
> +		if (!mask_contains_bar(mask, i))
>  			continue;
>  
>  		pcim_iounmap(pdev, iomap[i]);
> 
