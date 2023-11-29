Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD667FDEF1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 18:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9564610E659;
	Wed, 29 Nov 2023 17:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03B0110E659;
 Wed, 29 Nov 2023 17:58:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 176F1143D;
 Wed, 29 Nov 2023 09:59:05 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1ABB43F5A1;
 Wed, 29 Nov 2023 09:58:10 -0800 (PST)
Message-ID: <788519ac-9ad7-459c-a57d-bfe1ec96db3e@arm.com>
Date: Wed, 29 Nov 2023 17:58:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] iommu: Replace iommu_device_lock with
 iommu_probe_device_lock
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>, Frank Rowand
 <frowand.list@gmail.com>, Hanjun Guo <guohanjun@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
 Jon Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Karol Herbst <kherbst@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, nouveau@lists.freedesktop.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>
References: <6-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <6-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Hector Martin <marcan@marcan.st>, Jerry Snitselaar <jsnitsel@redhat.com>,
 patches@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
 Moritz Fischer <mdf@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2023 12:48 am, Jason Gunthorpe wrote:
> The iommu_device_lock protects the iommu_device_list which is only read by
> iommu_ops_from_fwnode().
> 
> This is now always called under the iommu_probe_device_lock, so we don't
> need to double lock the linked list. Use the iommu_probe_device_lock on
> the write side too.

Please no, iommu_probe_device_lock() is a hack and we need to remove the 
*reason* it exists at all. And IMO just because iommu_present() is 
deprecated doesn't justify making it look utterly nonsensical - in no 
way does that have any relationship with probe_device, much less need to 
serialise against it!

Thanks,
Robin.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 30 +++++++++++++-----------------
>   1 file changed, 13 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 08f29a1dfcd5f8..9557c2ec08d915 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -146,7 +146,6 @@ struct iommu_group_attribute iommu_group_attr_##_name =		\
>   	container_of(_kobj, struct iommu_group, kobj)
>   
>   static LIST_HEAD(iommu_device_list);
> -static DEFINE_SPINLOCK(iommu_device_lock);
>   
>   static const struct bus_type * const iommu_buses[] = {
>   	&platform_bus_type,
> @@ -262,9 +261,9 @@ int iommu_device_register(struct iommu_device *iommu,
>   	if (hwdev)
>   		iommu->fwnode = dev_fwnode(hwdev);
>   
> -	spin_lock(&iommu_device_lock);
> +	mutex_lock(&iommu_probe_device_lock);
>   	list_add_tail(&iommu->list, &iommu_device_list);
> -	spin_unlock(&iommu_device_lock);
> +	mutex_unlock(&iommu_probe_device_lock);
>   
>   	for (int i = 0; i < ARRAY_SIZE(iommu_buses) && !err; i++)
>   		err = bus_iommu_probe(iommu_buses[i]);
> @@ -279,9 +278,9 @@ void iommu_device_unregister(struct iommu_device *iommu)
>   	for (int i = 0; i < ARRAY_SIZE(iommu_buses); i++)
>   		bus_for_each_dev(iommu_buses[i], NULL, iommu, remove_iommu_group);
>   
> -	spin_lock(&iommu_device_lock);
> +	mutex_lock(&iommu_probe_device_lock);
>   	list_del(&iommu->list);
> -	spin_unlock(&iommu_device_lock);
> +	mutex_unlock(&iommu_probe_device_lock);
>   
>   	/* Pairs with the alloc in generic_single_device_group() */
>   	iommu_group_put(iommu->singleton_group);
> @@ -316,9 +315,9 @@ int iommu_device_register_bus(struct iommu_device *iommu,
>   	if (err)
>   		return err;
>   
> -	spin_lock(&iommu_device_lock);
> +	mutex_lock(&iommu_probe_device_lock);
>   	list_add_tail(&iommu->list, &iommu_device_list);
> -	spin_unlock(&iommu_device_lock);
> +	mutex_unlock(&iommu_probe_device_lock);
>   
>   	err = bus_iommu_probe(bus);
>   	if (err) {
> @@ -2033,9 +2032,9 @@ bool iommu_present(const struct bus_type *bus)
>   
>   	for (int i = 0; i < ARRAY_SIZE(iommu_buses); i++) {
>   		if (iommu_buses[i] == bus) {
> -			spin_lock(&iommu_device_lock);
> +			mutex_lock(&iommu_probe_device_lock);
>   			ret = !list_empty(&iommu_device_list);
> -			spin_unlock(&iommu_device_lock);
> +			mutex_unlock(&iommu_probe_device_lock);
>   		}
>   	}
>   	return ret;
> @@ -2980,17 +2979,14 @@ EXPORT_SYMBOL_GPL(iommu_default_passthrough);
>   
>   const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
>   {
> -	const struct iommu_ops *ops = NULL;
>   	struct iommu_device *iommu;
>   
> -	spin_lock(&iommu_device_lock);
> +	lockdep_assert_held(&iommu_probe_device_lock);
> +
>   	list_for_each_entry(iommu, &iommu_device_list, list)
> -		if (iommu->fwnode == fwnode) {
> -			ops = iommu->ops;
> -			break;
> -		}
> -	spin_unlock(&iommu_device_lock);
> -	return ops;
> +		if (iommu->fwnode == fwnode)
> +			return iommu->ops;
> +	return NULL;
>   }
>   
>   int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
