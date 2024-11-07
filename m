Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938699C0B8A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 17:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF84910E888;
	Thu,  7 Nov 2024 16:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sgq9DuN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB61610E883;
 Thu,  7 Nov 2024 16:27:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E2BFAA41F1A;
 Thu,  7 Nov 2024 16:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3AFC4CECC;
 Thu,  7 Nov 2024 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730996829;
 bh=RaF/yzDkwC/xI3JHS3wDYezLNgto4gJR15z4QCLcIec=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=sgq9DuN999fo+gF31O1Sog3B6QwMV6OvcPe7VPqi8sJ1TCzU/W1Ez/tliuLSn6HZv
 H6WJr617Z9ho3vOtVhPzMb0TyqS+gb2SI7mq/C0wytQj+BYrK8SHegywRApVWEjefm
 VrP+Uq41/kYqyiwmALEKXPYG2sF+9dXoP558MEULT3X9CJ2qlfOgYo5XQQ/akQ/Li+
 8PC//m2NPppcQqPE5AwaE9VZUm8GEStHJrNdsbBXQj3zX2/Uw70Eqzdl18ZXk0ykpu
 Nv3hNeVLx2kThS8Iy5jvLz2TwdYaK/p8look0JzKdaIO94mqldL4oshBd2UJ53q8QV
 LBGXXQk7Ujmww==
Date: Thu, 7 Nov 2024 10:27:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 03/10] PCI/sysfs: Calculate bin_attribute size through
 bin_size()
Message-ID: <20241107162707.GA1618544@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-3-71110628844c@weissschuh.net>
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

On Sun, Nov 03, 2024 at 05:03:32PM +0000, Thomas Weißschuh wrote:
> Stop abusing the is_bin_visible() callback to calculate the attribute
> size. Instead use the new, dedicated bin_size() one.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Thanks for doing this!

> ---
>  drivers/pci/pci-sysfs.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 5d0f4db1cab78674c5e5906f321bf7a57b742983..040f01b2b999175e8d98b05851edc078bbabbe0d 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -818,21 +818,20 @@ static struct bin_attribute *pci_dev_config_attrs[] = {
>  	NULL,
>  };
>  
> -static umode_t pci_dev_config_attr_is_visible(struct kobject *kobj,
> -					      struct bin_attribute *a, int n)
> +static size_t pci_dev_config_attr_bin_size(struct kobject *kobj,
> +					   const struct bin_attribute *a,
> +					   int n)
>  {
>  	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
>  
> -	a->size = PCI_CFG_SPACE_SIZE;
>  	if (pdev->cfg_size > PCI_CFG_SPACE_SIZE)
> -		a->size = PCI_CFG_SPACE_EXP_SIZE;
> -
> -	return a->attr.mode;
> +		return PCI_CFG_SPACE_EXP_SIZE;
> +	return PCI_CFG_SPACE_SIZE;
>  }
>  
>  static const struct attribute_group pci_dev_config_attr_group = {
>  	.bin_attrs = pci_dev_config_attrs,
> -	.is_bin_visible = pci_dev_config_attr_is_visible,
> +	.bin_size = pci_dev_config_attr_bin_size,
>  };
>  
>  /*
> @@ -1330,21 +1329,26 @@ static umode_t pci_dev_rom_attr_is_visible(struct kobject *kobj,
>  					   struct bin_attribute *a, int n)
>  {
>  	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
> -	size_t rom_size;
>  
>  	/* If the device has a ROM, try to expose it in sysfs. */
> -	rom_size = pci_resource_len(pdev, PCI_ROM_RESOURCE);
> -	if (!rom_size)
> +	if (!pci_resource_end(pdev, PCI_ROM_RESOURCE))
>  		return 0;
>  
> -	a->size = rom_size;
> -
>  	return a->attr.mode;
>  }
>  
> +static size_t pci_dev_rom_attr_bin_size(struct kobject *kobj,
> +					const struct bin_attribute *a, int n)
> +{
> +	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
> +
> +	return pci_resource_len(pdev, PCI_ROM_RESOURCE);
> +}
> +
>  static const struct attribute_group pci_dev_rom_attr_group = {
>  	.bin_attrs = pci_dev_rom_attrs,
>  	.is_bin_visible = pci_dev_rom_attr_is_visible,
> +	.bin_size = pci_dev_rom_attr_bin_size,
>  };
>  
>  static ssize_t reset_store(struct device *dev, struct device_attribute *attr,
> 
> -- 
> 2.47.0
> 
