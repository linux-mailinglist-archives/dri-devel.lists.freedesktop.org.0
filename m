Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F9B31CAB4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 13:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FB66E40B;
	Tue, 16 Feb 2021 12:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D3326E40B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 12:47:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00B151FB;
 Tue, 16 Feb 2021 04:47:50 -0800 (PST)
Received: from [10.57.48.219] (unknown [10.57.48.219])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7AED3F694;
 Tue, 16 Feb 2021 04:47:47 -0800 (PST)
Subject: Re: [RFC PATCH 1/8] of/device: Allow specifying a custom iommu_spec
 to of_dma_configure
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 frowand.list@gmail.com
References: <20210208163848.2504291-1-mperttunen@nvidia.com>
 <20210208163848.2504291-2-mperttunen@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <1c33f914-9109-42aa-01f3-04e50cf038c6@arm.com>
Date: Tue, 16 Feb 2021 12:47:43 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210208163848.2504291-2-mperttunen@nvidia.com>
Content-Language: en-GB
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mikko,

On 2021-02-08 16:38, Mikko Perttunen wrote:
> To allow for more customized device tree bindings that point to IOMMUs,
> allow manual specification of iommu_spec to of_dma_configure.
> 
> The initial use case for this is with Host1x, where the driver manages
> a set of device tree-defined IOMMU contexts that are dynamically
> allocated to various users. These contexts don't correspond to
> platform devices and are instead attached to dummy devices on a custom
> software bus.

I'd suggest taking a closer look at the patches that made this 
of_dma_configure_id() in the first place, and the corresponding bus code 
in fsl-mc. At this level, Host1x sounds effectively identical to DPAA2 
in terms of being a bus of logical devices composed from bits of 
implicit behind-the-scenes hardware. I mean, compare your series title 
to the fact that their identifiers are literally named "Isolation 
Context ID" ;)

Please just use the existing mechanisms to describe a mapping between 
Host1x context IDs and SMMU Stream IDs, rather than what looks like a 
giant hacky mess here.

(This also reminds me I wanted to rip out all the PCI special-cases and 
convert pci_dma_configure() over to passing its own IDs too, so thanks 
for the memory-jog...)

Robin.

> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>   drivers/iommu/of_iommu.c  | 12 ++++++++----
>   drivers/of/device.c       |  9 +++++----
>   include/linux/of_device.h | 34 +++++++++++++++++++++++++++-------
>   include/linux/of_iommu.h  |  6 ++++--
>   4 files changed, 44 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index e505b9130a1c..3fefa6c63863 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -87,8 +87,7 @@ int of_get_dma_window(struct device_node *dn, const char *prefix, int index,
>   }
>   EXPORT_SYMBOL_GPL(of_get_dma_window);
>   
> -static int of_iommu_xlate(struct device *dev,
> -			  struct of_phandle_args *iommu_spec)
> +int of_iommu_xlate(struct device *dev, struct of_phandle_args *iommu_spec)
>   {
>   	const struct iommu_ops *ops;
>   	struct fwnode_handle *fwnode = &iommu_spec->np->fwnode;
> @@ -117,6 +116,7 @@ static int of_iommu_xlate(struct device *dev,
>   	module_put(ops->owner);
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(of_iommu_xlate);
>   
>   static int of_iommu_configure_dev_id(struct device_node *master_np,
>   				     struct device *dev,
> @@ -177,7 +177,8 @@ static int of_iommu_configure_device(struct device_node *master_np,
>   
>   const struct iommu_ops *of_iommu_configure(struct device *dev,
>   					   struct device_node *master_np,
> -					   const u32 *id)
> +					   const u32 *id,
> +					   struct of_phandle_args *iommu_spec)
>   {
>   	const struct iommu_ops *ops = NULL;
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> @@ -209,7 +210,10 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
>   		err = pci_for_each_dma_alias(to_pci_dev(dev),
>   					     of_pci_iommu_init, &info);
>   	} else {
> -		err = of_iommu_configure_device(master_np, dev, id);
> +		if (iommu_spec)
> +			err = of_iommu_xlate(dev, iommu_spec);
> +		else
> +			err = of_iommu_configure_device(master_np, dev, id);
>   
>   		fwspec = dev_iommu_fwspec_get(dev);
>   		if (!err && fwspec)
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index aedfaaafd3e7..84ada2110c5b 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -88,8 +88,9 @@ int of_device_add(struct platform_device *ofdev)
>    * can use a platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE events
>    * to fix up DMA configuration.
>    */
> -int of_dma_configure_id(struct device *dev, struct device_node *np,
> -			bool force_dma, const u32 *id)
> +int __of_dma_configure(struct device *dev, struct device_node *np,
> +			bool force_dma, const u32 *id,
> +			struct of_phandle_args *iommu_spec)
>   {
>   	const struct iommu_ops *iommu;
>   	const struct bus_dma_region *map = NULL;
> @@ -170,7 +171,7 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>   	dev_dbg(dev, "device is%sdma coherent\n",
>   		coherent ? " " : " not ");
>   
> -	iommu = of_iommu_configure(dev, np, id);
> +	iommu = of_iommu_configure(dev, np, id, iommu_spec);
>   	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
>   		kfree(map);
>   		return -EPROBE_DEFER;
> @@ -184,7 +185,7 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>   	dev->dma_range_map = map;
>   	return 0;
>   }
> -EXPORT_SYMBOL_GPL(of_dma_configure_id);
> +EXPORT_SYMBOL_GPL(__of_dma_configure);
>   
>   int of_device_register(struct platform_device *pdev)
>   {
> diff --git a/include/linux/of_device.h b/include/linux/of_device.h
> index 07ca187fc5e4..40cc3e788cb9 100644
> --- a/include/linux/of_device.h
> +++ b/include/linux/of_device.h
> @@ -55,14 +55,27 @@ static inline struct device_node *of_cpu_device_node_get(int cpu)
>   	return of_node_get(cpu_dev->of_node);
>   }
>   
> -int of_dma_configure_id(struct device *dev,
> +int __of_dma_configure(struct device *dev,
>   		     struct device_node *np,
> -		     bool force_dma, const u32 *id);
> +		     bool force_dma, const u32 *id,
> +		     struct of_phandle_args *iommu_spec);
>   static inline int of_dma_configure(struct device *dev,
>   				   struct device_node *np,
>   				   bool force_dma)
>   {
> -	return of_dma_configure_id(dev, np, force_dma, NULL);
> +	return __of_dma_configure(dev, np, force_dma, NULL, NULL);
> +}
> +static inline int of_dma_configure_id(struct device *dev,
> +				      struct device_node *np,
> +				      bool force_dma, const u32 *id)
> +{
> +	return __of_dma_configure(dev, np, force_dma, id, NULL);
> +}
> +static inline int
> +of_dma_configure_iommu_spec(struct device *dev, struct device_node *np,
> +			    bool force_dma, struct of_phandle_args *iommu_spec)
> +{
> +	return __of_dma_configure(dev, np, force_dma, NULL, iommu_spec);
>   }
>   #else /* CONFIG_OF */
>   
> @@ -112,18 +125,25 @@ static inline struct device_node *of_cpu_device_node_get(int cpu)
>   	return NULL;
>   }
>   
> -static inline int of_dma_configure_id(struct device *dev,
> +static inline int of_dma_configure(struct device *dev,
>   				   struct device_node *np,
>   				   bool force_dma)
>   {
>   	return 0;
>   }
> -static inline int of_dma_configure(struct device *dev,
> -				   struct device_node *np,
> -				   bool force_dma)
> +
> +static inline int of_dma_configure_id(struct device *dev,
> +				      struct device_node *np,
> +				      bool force_dma, const u32 *id)
>   {
>   	return 0;
>   }
> +
> +static inline int
> +of_dma_configure_iommu_spec(struct device *dev, struct device_node *np,
> +			    bool force_dma, struct of_phandle_args *iommu_spec)
> +{	return 0;
> +}
>   #endif /* CONFIG_OF */
>   
>   #endif /* _LINUX_OF_DEVICE_H */
> diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
> index 16f4b3e87f20..e8d1e6d32d77 100644
> --- a/include/linux/of_iommu.h
> +++ b/include/linux/of_iommu.h
> @@ -14,7 +14,8 @@ extern int of_get_dma_window(struct device_node *dn, const char *prefix,
>   
>   extern const struct iommu_ops *of_iommu_configure(struct device *dev,
>   					struct device_node *master_np,
> -					const u32 *id);
> +					const u32 *id,
> +					struct of_phandle_args *iommu_spec);
>   
>   #else
>   
> @@ -27,7 +28,8 @@ static inline int of_get_dma_window(struct device_node *dn, const char *prefix,
>   
>   static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
>   					 struct device_node *master_np,
> -					 const u32 *id)
> +					 const u32 *id,
> +					 struct of_phandle_args *iommu_spec);
>   {
>   	return NULL;
>   }
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
