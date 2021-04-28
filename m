Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED96336DD91
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51C76EC00;
	Wed, 28 Apr 2021 16:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99EE6EC00;
 Wed, 28 Apr 2021 16:53:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3DB76143A;
 Wed, 28 Apr 2021 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619628801;
 bh=TVF7ngIeGAAI48JjMpH3tV/oTMla6V5fgEtmoWG2xkQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=du5VZyB+RM4IkssG8iol6tkY70VLeW2v6jkkWKMcZBABNQZBK8zgZ1yh1NQN1u6gw
 OjS5dnM9AHYT9BUGTs3iSg8i/dNz+wQ9Yh9HINOs/um6gV0Z8mmm3etLb41jUS0io+
 vzMIHenzB0l/myJCPxzW0ARrf8/B/jCBvp6QZhMUfgEcVexChGOup7Fjf2IiPVrM8l
 Rfiog29G30Mt1j9y3KUNlE1EAdNGPma1xz/rjvSsFa80EVJ5+IOvQswRMQ9TMdyRH4
 Xg61h9PFjKIGoTx7WrAoDd4eMg+lczRiqOEvBe/Nuh4k47E2Jbmq6NjZIbiLTvnJHQ
 cb/atsm9Mcxnw==
Date: Wed, 28 Apr 2021 11:53:18 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v5 08/27] PCI: add support for dev_groups to struct
 pci_device_driver
Message-ID: <20210428165318.GA239081@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428151207.1212258-9-andrey.grodzovsky@amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In subject:

s/PCI: add support/PCI: Add support/

to match convention ("git log --oneline drivers/pci/pci-driver.c" to
learn this).

On Wed, Apr 28, 2021 at 11:11:48AM -0400, Andrey Grodzovsky wrote:
> This is exact copy of 'USB: add support for dev_groups to
> struct usb_device_driver' patch by Greg but just for
> the PCI case.

Ideally this would be an imperative sentence telling us what the patch
*does*, not just that it's a copy of something else.

I'd also like a brief comment about why this is useful, i.e., why you
need this and what you're going to use it for.

The usual commit citation format is 7d9c1d2f7aca ("USB: add support
for dev_groups to struct usb_device_driver") so it's easier to locate
the commit.

I see there is also b71b283e3d6d ("USB: add support for dev_groups to
struct usb_driver").  I don't know enough about USB to know whether
7d9c1d2f7aca or b71b283e3d6d is a closer analogue to what you're doing
here, but I do see that struct usb_driver is far more common than
struct usb_device_driver.

PCI has struct pci_driver, but doesn't have the concept of a struct
pci_device_driver.

> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
