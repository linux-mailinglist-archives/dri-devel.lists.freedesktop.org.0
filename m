Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6BAAFBA4A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 20:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB4B10E505;
	Mon,  7 Jul 2025 18:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B97110E505
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 18:00:43 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 635AA2C06647;
 Mon,  7 Jul 2025 20:00:41 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 5A63B31D02; Mon,  7 Jul 2025 20:00:41 +0200 (CEST)
Date: Mon, 7 Jul 2025 20:00:41 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Hans de Goede <hansg@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Andi Kleen <ak@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] agp/amd64: Remove support for probing unlisted PCI
 devices
Message-ID: <aGwLSeX3gZmjJ48_@wunner.de>
References: <20250707173710.313701-1-hansg@kernel.org>
 <20250707173710.313701-4-hansg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707173710.313701-4-hansg@kernel.org>
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

On Mon, Jul 07, 2025 at 07:37:10PM +0200, Hans de Goede wrote:
> AMD64 boards with AGP support are so old that the agp_amd64_pci_table
> should be complete and there is no need to probe unlisted PCI devices,
> so lets completely remove support for probing unlisted PCI devices.
[...]
> --- a/drivers/char/agp/amd64-agp.c
> +++ b/drivers/char/agp/amd64-agp.c
> @@ -734,47 +733,10 @@ static struct pci_driver agp_amd64_pci_driver = {
>  /* Not static due to IOMMU code calling it early. */
>  int __init agp_amd64_init(void)
>  {
> -	struct pci_dev *pdev = NULL;
> -	int err = 0;
> -
>  	if (agp_off)
>  		return -EINVAL;
>  
> -	err = pci_register_driver(&agp_amd64_pci_driver);
> -	if (err < 0)
> -		return err;
> -
> -	if (agp_bridges_found == 0) {
> -		if (!agp_try_unsupported && !agp_try_unsupported_boot) {
> -			printk(KERN_INFO PFX "No supported AGP bridge found.\n");
> -#ifdef MODULE
> -			printk(KERN_INFO PFX "You can try agp_try_unsupported=1\n");
> -#else
> -			printk(KERN_INFO PFX "You can boot with agp=try_unsupported\n");
> -#endif
> -			pci_unregister_driver(&agp_amd64_pci_driver);
> -			return -ENODEV;
> -		}
> -
> -		/* First check that we have at least one AMD64 NB */
> -		if (!amd_nb_num()) {
> -			pci_unregister_driver(&agp_amd64_pci_driver);
> -			return -ENODEV;
> -		}

Here the PCI driver used to be unregistered if no AGP bridges were found
and successfully probed...

> -
> -		/* Look for any AGP bridge */
> -		for_each_pci_dev(pdev)
> -			if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
> -				pci_add_dynid(&agp_amd64_pci_driver,
> -					      pdev->vendor, pdev->device,
> -					      pdev->subsystem_vendor,
> -					      pdev->subsystem_device, 0, 0, 0);
> -		if (agp_bridges_found == 0) {
> -			pci_unregister_driver(&agp_amd64_pci_driver);
> -			err = -ENODEV;
> -		}
> -	}
> -	return err;
> +	return pci_register_driver(&agp_amd64_pci_driver);
>  }

... and now the PCI driver will be kept around.  Is that intentional?

Keeping the PCI driver around only makes sense if an AGP bridge is
later on hot-plugged.  I guess that never happens with AGP bridges,
at least it's not supported by this driver so far.

Thanks,

Lukas
