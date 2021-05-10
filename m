Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7B3798AD
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 22:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B0E6E8E6;
	Mon, 10 May 2021 20:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19116E8E6;
 Mon, 10 May 2021 20:56:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA08B61183;
 Mon, 10 May 2021 20:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620680218;
 bh=Eybd5Prm8MecsrOo0CDKgicCBzQ5UXTLu9q5Wu9ESqk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=I2mBwzTPjLFM1PneoaeJIakqQX9qza9nmvbL3uTEEQ+bBE/Ev+fYCJ+n9Npn2qHlR
 w5nxF+2puek1aDXHITJNoKp0DYAaNR69udJLrRzzM/fP62/RsAYkwNrOPy25E87w5R
 GmfgclC0xb1T1v5/PAKUAHV03e/6BNmupsNj0qLfAwvBZbsiP1zQEI73N+6m28EA4t
 UsdWvac/YoSlOFVPWa8dbM+IEf5/r1Wh9G6EVviB57xzGDH2k0P+lptJ2rRHFF78td
 dd8xgP6QKcn4l7TmbdSd9AYP1T0Um0qWrpDWSbvuEs8lkqGkll+KV/96Y/Z6CEw+wj
 zOj6DA6pZpeDw==
Date: Mon, 10 May 2021 15:56:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v6 08/16] PCI: Add support for dev_groups to struct
 pci_device_driver
Message-ID: <20210510205656.GA2301233@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510163625.407105-9-andrey.grodzovsky@amd.com>
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In subject:

  PCI: Add support for dev_groups to struct pci_driver

(not "struct pci_device_driver," which does not exist)

On Mon, May 10, 2021 at 12:36:17PM -0400, Andrey Grodzovsky wrote:
> This helps converting PCI drivers sysfs attributes to static.
> 
> Analogous to b71b283e3d6d ("USB: add support for dev_groups to
> struct usb_driver")
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

With the subject change above,

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/pci-driver.c | 1 +
>  include/linux/pci.h      | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index ec44a79e951a..3a72352aa5cf 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -1385,6 +1385,7 @@ int __pci_register_driver(struct pci_driver *drv, struct module *owner,
>  	drv->driver.owner = owner;
>  	drv->driver.mod_name = mod_name;
>  	drv->driver.groups = drv->groups;
> +	drv->driver.dev_groups = drv->dev_groups;
>  
>  	spin_lock_init(&drv->dynids.lock);
>  	INIT_LIST_HEAD(&drv->dynids.list);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 86c799c97b77..b57755b03009 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -858,6 +858,8 @@ struct module;
>   *		number of VFs to enable via sysfs "sriov_numvfs" file.
>   * @err_handler: See Documentation/PCI/pci-error-recovery.rst
>   * @groups:	Sysfs attribute groups.
> + * @dev_groups: Attributes attached to the device that will be
> + *              created once it is bound to the driver.
>   * @driver:	Driver model structure.
>   * @dynids:	List of dynamically added device IDs.
>   */
> @@ -873,6 +875,7 @@ struct pci_driver {
>  	int  (*sriov_configure)(struct pci_dev *dev, int num_vfs); /* On PF */
>  	const struct pci_error_handlers *err_handler;
>  	const struct attribute_group **groups;
> +	const struct attribute_group **dev_groups;
>  	struct device_driver	driver;
>  	struct pci_dynids	dynids;
>  };
> -- 
> 2.25.1
> 
