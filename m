Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B48606ED2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 06:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD7B10E59A;
	Fri, 21 Oct 2022 04:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E3F10E59A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 04:20:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E81DA61CF1;
 Fri, 21 Oct 2022 04:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C13C433D7;
 Fri, 21 Oct 2022 04:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666326005;
 bh=x6Yni4jyKHX26dLZe1+DQ8f7BW1AP6tIYGLd4CuRJc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ru5nzJAJv1hRYaDwndMf5L6vX4z4bprVEGBNDgWSZwrmS3sL8RArNsyU/hbZLyEJV
 /g8dzlr7WcKE2OfS1IFQRmQBu5YQ8RP1r8oPJsny+RKTw3U+rTts6Kq8SyjZnUVetZ
 yq4HacVuWz5qontlVAs08OaPyaqrh5qGsGsucTHw=
Date: Fri, 21 Oct 2022 06:20:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Subject: Re: [PATCH v5 01/10] gna: add PCI driver module
Message-ID: <Y1IeJplXNHM+VvCJ@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 07:53:25PM +0200, Maciej Kwapulinski wrote:
> Add a new PCI driver for Intel(R) Gaussian & Neural Accelerator

Please drop all of the (R) stuff in here, and in the Kconfig file and in
the .c files.  If your lawyers insist on it, please point them at me and
I will be glad to discuss it with them.

>  Documentation/gpu/drivers.rst    |  1 +
>  Documentation/gpu/gna.rst        | 64 ++++++++++++++++++++++++++++++++

Why not just put the tiny documentation file in the .c code itself?
That way it stays up to date and might actually be noticed?

> --- /dev/null
> +++ b/drivers/gpu/drm/gna/Kconfig
> @@ -0,0 +1,12 @@
> +#
> +# Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)

Again, drop the (R) stuff.

And no SPDX line?

> +#
> +
> +config DRM_GNA
> +	tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
> +	depends on X86 && PCI

Why is this x86 only?  Please let it build on other arches.

> +	help
> +	  This option enables the Intel(R) Gaussian & Neural Accelerator
> +	  (Intel(R) GNA) driver: gna
> +	  Information about functionality is in
> +	  Documentation/gpu/gna.rst

See, you changed this from the first v5 version you sent :(

Also, this needs a lot more information, including the module name that
will be built and you can drop the documentation line.

> diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
> new file mode 100644
> index 000000000000..960b4341c18e
> --- /dev/null
> +++ b/drivers/gpu/drm/gna/gna_device.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright(c) 2017-2022 Intel Corporation
> +
> +#include <linux/module.h>
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_DESCRIPTION("Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA) Driver");
> +MODULE_LICENSE("GPL");

No, that's not ok.  Don't add a file that does nothing.  Only add it
when you need it.


> diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
> new file mode 100644
> index 000000000000..4cc92f27765a
> --- /dev/null
> +++ b/drivers/gpu/drm/gna/gna_device.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright(c) 2017-2022 Intel Corporation */
> +
> +#ifndef __GNA_DEVICE_H__
> +#define __GNA_DEVICE_H__
> +
> +#define DRIVER_NAME		"gna"

This can be KBUILD_MODNAME and then the file isn't needed at all.

> +
> +#endif /* __GNA_DEVICE_H__ */
> diff --git a/drivers/gpu/drm/gna/gna_pci.c b/drivers/gpu/drm/gna/gna_pci.c
> new file mode 100644
> index 000000000000..6bd00c66f3a7
> --- /dev/null
> +++ b/drivers/gpu/drm/gna/gna_pci.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright(c) 2017-2022 Intel Corporation
> +
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +
> +#include "gna_device.h"
> +#include "gna_pci.h"
> +
> +int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
> +{
> +	int err;
> +
> +	err = pcim_enable_device(pcidev);
> +	if (err)
> +		return err;
> +
> +	err = pcim_iomap_regions(pcidev, BIT(0), pci_name(pcidev));
> +	if (err)
> +		return err;
> +
> +	pci_set_master(pcidev);
> +
> +	return 0;
> +}
> +
> +static struct pci_driver gna_pci_driver = {
> +	.name = DRIVER_NAME,
> +	.probe = gna_pci_probe,
> +};
> +
> +module_pci_driver(gna_pci_driver);
> diff --git a/drivers/gpu/drm/gna/gna_pci.h b/drivers/gpu/drm/gna/gna_pci.h
> new file mode 100644
> index 000000000000..b651fa2e6ea1
> --- /dev/null
> +++ b/drivers/gpu/drm/gna/gna_pci.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright(c) 2017-2022 Intel Corporation */
> +
> +#ifndef __GNA_PCI_H__
> +#define __GNA_PCI_H__
> +
> +struct pci_device_id;
> +struct pci_dev;
> +
> +int gna_pci_probe(struct pci_dev *dev, const struct pci_device_id *id);

This is not exported, nor should it be, so you do not need it in the .h
file.

This whole patch can be one .c file, not this mess of tiny ones.

thanks,

greg k-h
