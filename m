Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197D87FCEC8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 07:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A88D10E33F;
	Wed, 29 Nov 2023 06:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBF210E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 06:05:04 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5ccaa0da231so84971877b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 22:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701237903; x=1701842703;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WO7CXB1mNGxZSEafQP2SArLxdW3co4lj0A5pbLIXeXc=;
 b=0UPru3BvwJY1cYQE7ai99hbarbn5JLyYYKmCdK+14pj+Ndq1iTo2yk5rSvKxvO8kDz
 9i2mFb3+qnNJvqRJZjKaE8bI6Hcyj1c9QrfbrL1/0lW1+5Vo+WTqfDxfN1dgm0eU6upu
 h/m3XOeXDZ54SE5Vh4GzKJ2Z7wPycrd+EaFy5aFUsfGssslG+9pJitzNtldSiBJHVfzv
 z7/NDHPutdzgn4ddErxKvQ+JNkSFsFV9KzzWBOzsKzfunCc3H0chhdFQqIgcGq1CKVIU
 gJ57PdV7oPGPoD5/fmsegmn0HL52D51ED15yxsNKABU7rqZaJ2vnIzSp3njopAnyJX7f
 3XIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701237903; x=1701842703;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WO7CXB1mNGxZSEafQP2SArLxdW3co4lj0A5pbLIXeXc=;
 b=OILT0QKnXIBkWgoXEVKMczj6YvdSWuMo46Wc3ULrlLUXBK0y3PJmaIp/V8fQEyZ1uS
 T0guSpS8HO+cn3QAEMivtLMgFW+ZKB9UYltEDLlqm48H++IjABD8Y9O+7KzfCX+qJysV
 9y5CArJdj3QWxVg+Ly973uZ5s/DlNGp3M8c0RVlrcSnzyivNQaAYXvkFnl9Eg9d/v9Uo
 R4yLpuLvUk094dnpNYivwVHkCpflRB+LVNkyF6J8vIC0V3a7bf0NVis5Xq1rp7t2qPWx
 Q1T8zY2tXiCZVW6wKxwW9FuE+zbEoD3uWwH3TwcgVuynilNdm32KygNxYY2lECo8EUqQ
 WfCA==
X-Gm-Message-State: AOJu0YzA1Z5wbkfCl6C0zWqkm2SHLfMOuM92nyyRWiqN5lrr6+wZnHF8
 qE9hRuQBn3SJ7rw/aTyPQCXR/d5LePR8
X-Google-Smtp-Source: AGHT+IHL7hgboFJ1jDI8fHK0ttAzMEfTsQjA7vmjwBnF03SxrfXdHuhYyFsTgeIfr3cTonrW5FaGXfJVhISd
X-Received: from morats.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:d9e])
 (user=moritzf job=sendgmr) by 2002:a05:690c:903:b0:59b:eb63:4beb
 with SMTP id
 cb3-20020a05690c090300b0059beb634bebmr584543ywb.7.1701237903050; Tue, 28 Nov
 2023 22:05:03 -0800 (PST)
Date: Wed, 29 Nov 2023 06:04:59 +0000
In-Reply-To: <3-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Mime-Version: 1.0
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <3-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Message-ID: <20231129060459.gcunam3msksainng@google.com>
Subject: Re: [PATCH 03/10] iommu/of: Use -ENODEV consistently in
 of_iommu_configure()
From: Moritz Fischer <moritzf@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
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
Cc: linux-hyperv@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Laxman Dewangan <ldewangan@nvidia.com>,
 Hanjun Guo <guohanjun@huawei.com>, linux-riscv@lists.infradead.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Wei Liu <wei.liu@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Jon Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 iommu@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Haiyang Zhang <haiyangz@microsoft.com>, Vineet Gupta <vgupta@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Robin Murphy <robin.murphy@arm.com>, Hector Martin <marcan@marcan.st>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>,
 dmaengine@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 08:47:59PM -0400, Jason Gunthorpe wrote:
> Instead of returning 1 and trying to handle positive error codes just
> stick to the convention of returning -ENODEV. Remove references to ops
> from of_iommu_configure(), a NULL ops will already generate an error code.

> There is no reason to check dev->bus, if err=0 at this point then the
> called configure functions thought there was an iommu and we should try to
> probe it. Remove it.

> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Tested-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/of_iommu.c | 49 ++++++++++++----------------------------
>   1 file changed, 15 insertions(+), 34 deletions(-)

> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index c6510d7e7b241b..164317bfb8a81f 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -17,8 +17,6 @@
>   #include <linux/slab.h>
>   #include <linux/fsl/mc.h>

> -#define NO_IOMMU	1
> -
>   static int of_iommu_xlate(struct device *dev,
>   			  struct of_phandle_args *iommu_spec)
>   {
> @@ -29,7 +27,7 @@ static int of_iommu_xlate(struct device *dev,
>   	ops = iommu_ops_from_fwnode(fwnode);
>   	if ((ops && !ops->of_xlate) ||
>   	    !of_device_is_available(iommu_spec->np))
> -		return NO_IOMMU;
> +		return -ENODEV;

>   	ret = iommu_fwspec_init(dev, &iommu_spec->np->fwnode, ops);
>   	if (ret)
> @@ -61,7 +59,7 @@ static int of_iommu_configure_dev_id(struct device_node  
> *master_np,
>   			 "iommu-map-mask", &iommu_spec.np,
>   			 iommu_spec.args);
>   	if (err)
> -		return err == -ENODEV ? NO_IOMMU : err;
> +		return err;

>   	err = of_iommu_xlate(dev, &iommu_spec);
>   	of_node_put(iommu_spec.np);
> @@ -72,7 +70,7 @@ static int of_iommu_configure_dev(struct device_node  
> *master_np,
>   				  struct device *dev)
>   {
>   	struct of_phandle_args iommu_spec;
> -	int err = NO_IOMMU, idx = 0;
> +	int err = -ENODEV, idx = 0;

>   	while (!of_parse_phandle_with_args(master_np, "iommus",
>   					   "#iommu-cells",
> @@ -117,9 +115,8 @@ static int of_iommu_configure_device(struct  
> device_node *master_np,
>   int of_iommu_configure(struct device *dev, struct device_node *master_np,
>   		       const u32 *id)
>   {
> -	const struct iommu_ops *ops = NULL;
>   	struct iommu_fwspec *fwspec;
> -	int err = NO_IOMMU;
> +	int err;

>   	if (!master_np)
>   		return -ENODEV;
> @@ -153,37 +150,21 @@ int of_iommu_configure(struct device *dev, struct  
> device_node *master_np,
>   	} else {
>   		err = of_iommu_configure_device(master_np, dev, id);
>   	}
> -
> -	/*
> -	 * Two success conditions can be represented by non-negative err here:
> -	 * >0 : there is no IOMMU, or one was unavailable for non-fatal reasons
> -	 *  0 : we found an IOMMU, and dev->fwspec is initialised appropriately
> -	 * <0 : any actual error
> -	 */
> -	if (!err) {
> -		/* The fwspec pointer changed, read it again */
> -		fwspec = dev_iommu_fwspec_get(dev);
> -		ops    = fwspec->ops;
> -	}
>   	mutex_unlock(&iommu_probe_device_lock);

> -	/*
> -	 * If we have reason to believe the IOMMU driver missed the initial
> -	 * probe for dev, replay it to get things in order.
> -	 */
> -	if (!err && dev->bus)
> -		err = iommu_probe_device(dev);
> -
> -	/* Ignore all other errors apart from EPROBE_DEFER */
> -	if (err < 0) {
> -		if (err == -EPROBE_DEFER)
> -			return err;
> -		dev_dbg(dev, "Adding to IOMMU failed: %pe\n", ERR_PTR(err));
> +	if (err == -ENODEV || err == -EPROBE_DEFER)
>   		return err;
> -	}
> -	if (!ops)
> -		return -ENODEV;
> +	if (err)
> +		goto err_log;
> +
> +	err = iommu_probe_device(dev);
> +	if (err)
> +		goto err_log;
>   	return 0;
> +
> +err_log:
> +	dev_dbg(dev, "Adding to IOMMU failed: %pe\n", ERR_PTR(err));
> +	return err;
>   }

>   static enum iommu_resv_type __maybe_unused
> --
> 2.42.0


Reviewed-by: Moritz Fischer <moritzf@google.com>
