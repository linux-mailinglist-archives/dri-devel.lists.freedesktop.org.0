Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED4690799A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF7910E1C6;
	Thu, 13 Jun 2024 17:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjlSjOR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD83F10E1C6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718299197; x=1749835197;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=RmIpd1nTc1q4Ns6AOINhQ9/9u4E1Af4vqvSzsOt87Yw=;
 b=gjlSjOR5q/hfWxiHDjGiAEd1HEW3IRsOzq7yInyMg7OhWaU3mC+dKmaf
 ZqPTRrgkt2uFJYe2p2e3qiquHgDEbV0n2cSBUvKqFB7TRhdQ6Z1t8cZyq
 U6TBxRcvVQOFx3+Y0GjK9dNLHkkN94/NXOvkMyZIxql1JWyyMQTYVEeGp
 GIoTIITPxERS1Beku5rtbGJ5Rfh2RBUZj+IQhJXxCgr/yghVCCKSzuEBZ
 /uKfTqsRIyrNgAZRkdj0hFe8rGWimLm76qRYYS6E4KnEmA3usNYZnr1MK
 81pO0Eq0MCze31YLkHTgwEQr8cqdkyQsoVTISaZ4Wxz/IDBM3l8n3HRq1 Q==;
X-CSE-ConnectionGUID: JTA+Bq8nTCWL8sn0e4jb7Q==
X-CSE-MsgGUID: YAYQYT/eSfWFCUMXfjVz8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25726098"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="25726098"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 10:19:56 -0700
X-CSE-ConnectionGUID: invZadp7R+ur/ZhVQAYztw==
X-CSE-MsgGUID: Ae4SEmaGQEyLuXKXD6POJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="77680971"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.209])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 10:19:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 20:19:47 +0300 (EEST)
To: Philipp Stanner <pstanner@redhat.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 09/13] PCI: Give pcim_set_mwi() its own devres callback
In-Reply-To: <20240605081605.18769-11-pstanner@redhat.com>
Message-ID: <17445053-18a1-a56d-79d0-3b3d3ecab033@linux.intel.com>
References: <20240605081605.18769-2-pstanner@redhat.com>
 <20240605081605.18769-11-pstanner@redhat.com>
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

> Managing pci_set_mwi() with devres can easily be done with its own
> callback, without the necessity to store any state about it in a
> device-related struct.
> 
> Remove the MWI state from struct pci_devres.
> Give pcim_set_mwi() a separate devres-callback.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/pci/devres.c | 29 ++++++++++++++++++-----------
>  drivers/pci/pci.h    |  1 -
>  2 files changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index 936369face4b..0bafb67e1886 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -361,24 +361,34 @@ void __iomem *devm_pci_remap_cfg_resource(struct device *dev,
>  }
>  EXPORT_SYMBOL(devm_pci_remap_cfg_resource);
>  
> +static void __pcim_clear_mwi(void *pdev_raw)
> +{
> +	struct pci_dev *pdev = pdev_raw;
> +
> +	pci_clear_mwi(pdev);
> +}
> +
>  /**
>   * pcim_set_mwi - a device-managed pci_set_mwi()
> - * @dev: the PCI device for which MWI is enabled
> + * @pdev: the PCI device for which MWI is enabled
>   *
>   * Managed pci_set_mwi().
>   *
>   * RETURNS: An appropriate -ERRNO error value on error, or zero for success.
>   */
> -int pcim_set_mwi(struct pci_dev *dev)
> +int pcim_set_mwi(struct pci_dev *pdev)
>  {
> -	struct pci_devres *dr;
> +	int ret;
>  
> -	dr = find_pci_dr(dev);
> -	if (!dr)
> -		return -ENOMEM;
> +	ret = devm_add_action(&pdev->dev, __pcim_clear_mwi, pdev);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = pci_set_mwi(pdev);
> +	if (ret != 0)
> +		devm_remove_action(&pdev->dev, __pcim_clear_mwi, pdev);

I'm sorry if this is a stupid question but why this cannot use 
devm_add_action_or_reset()?

> -	dr->mwi = 1;
> -	return pci_set_mwi(dev);
> +	return ret;
>  }
>  EXPORT_SYMBOL(pcim_set_mwi);

-- 
 i.

