Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C97FCEF3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 07:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F5F10E336;
	Wed, 29 Nov 2023 06:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECE510E336
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 06:18:27 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5cccfca81b2so90810487b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 22:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701238707; x=1701843507;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8J4qMZXxn7dMNLyiBgKsZSJFUlenzauaBGTwqmqEkBs=;
 b=MRCjpCW7klTyEc/eu7MlSblUjdlGeLAipB0RxGT8pVry5joDlDYm/8J6sHYpK7t73R
 vUgkis4vBa8Vz10RScQDzQNIkCGUM4wMub1jt5jLEJFhNaj2DVzCcBJgW63mCcyxbxOM
 MOAQi/EHjmAYwOuYZYEAwV4s4Kkl51v56U+ePUtCPbMKlfg1RYTCzMLJBjQf/Xz+XEcO
 36JkQMamQCWPZEDimIFc8+bafr3RgbA2xjb7/iMy+NvddwcHMTLzNTCZl0HPS2oPUw7G
 ryqzaET91hi0W9We9WuT3gdXC6sHA6+WoJsOrPbQr9m4BJbTr62dpRuSj3NkppO5cMnX
 2Q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701238707; x=1701843507;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8J4qMZXxn7dMNLyiBgKsZSJFUlenzauaBGTwqmqEkBs=;
 b=A5qulDY9ApwBsFXCoQ1aVrX7iWjSVDmI52HdGxetzWjwbI/2IIwLVWPO31jxg4UN95
 f1iKwGBTflYDL1TbGvabpk0e28iaVxFv8I2k2czlJpB/paAr7v38ORr1cUwzcGkrdwYW
 Ekn9FbOJcCQXjw1lQVc68ECDn1bGlkjcQBijWXmkiMxYdW74DKRaTnrz+jJJ6lGUakKQ
 hoZP6flFiNlCzRNJjVsNdgRU07PvL2t64ay6nGwuFGyvB2V76a7pGO38OqDrxL7vIjEd
 +8BVPuXEjGgI4j7oBA7vUnT97pJJqfvzqWipM0ZwemfaZE5vUOTOf7Xbk5cAAgOhCLaD
 ffQg==
X-Gm-Message-State: AOJu0YwQZKFZV97A2Ob8xNkpqBkKy/gp79zng44h1qE42VQuNDjroLpv
 ej6UiDQL4P1k4sYfowl5g7kmcQ/njxk+
X-Google-Smtp-Source: AGHT+IFcUygGdfS95PQxvEDzLlpossLvNyVov+P9EiIyJqoPwhfNYT1rdzAgRP7ca8iJPDCSOmBZ7cELCldp
X-Received: from morats.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:d9e])
 (user=moritzf job=sendgmr) by 2002:a25:d287:0:b0:db3:8b00:22eb
 with SMTP id
 j129-20020a25d287000000b00db38b0022ebmr482941ybg.6.1701238706756; Tue, 28 Nov
 2023 22:18:26 -0800 (PST)
Date: Wed, 29 Nov 2023 06:18:25 +0000
In-Reply-To: <9-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Mime-Version: 1.0
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <9-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Message-ID: <20231129061825.altvhmgltws2bvhh@google.com>
Subject: Re: [PATCH 09/10] ACPI: IORT: Cast from ULL to phys_addr_t
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

On Tue, Nov 28, 2023 at 08:48:05PM -0400, Jason Gunthorpe wrote:
> gcc on i386 (when compile testing) warns:

This is a weird test. The Makefile for drivers/acpi/arm64 is conditional
on CONFIG_ARM64. How does this happen?

> 8->8
obj-$(CONFIG_ARM64)		+= arm64/
> 8->8


>   drivers/acpi/arm64/iort.c:2014:18: warning: implicit conversion  
> from 'unsigned long long' to 'phys_addr_t' (aka 'unsigned int') changes  
> value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
>                             local_limit =  
> DMA_BIT_MASK(ncomp->memory_address_limit);

> Because DMA_BIT_MASK returns a large ULL constant. Explicitly truncate it
> to phys_addr_t.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/acpi/arm64/iort.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 6496ff5a6ba20d..bdaf9256870d92 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -2011,7 +2011,8 @@ phys_addr_t __init  
> acpi_iort_dma_get_max_cpu_address(void)

>   		case ACPI_IORT_NODE_NAMED_COMPONENT:
>   			ncomp = (struct acpi_iort_named_component *)node->node_data;
> -			local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);
> +			local_limit = (phys_addr_t)DMA_BIT_MASK(
> +				ncomp->memory_address_limit);
>   			limit = min_not_zero(limit, local_limit);
>   			break;

> @@ -2020,7 +2021,8 @@ phys_addr_t __init  
> acpi_iort_dma_get_max_cpu_address(void)
>   				break;

>   			rc = (struct acpi_iort_root_complex *)node->node_data;
> -			local_limit = DMA_BIT_MASK(rc->memory_address_limit);
> +			local_limit = (phys_addr_t)DMA_BIT_MASK(
> +				rc->memory_address_limit);
>   			limit = min_not_zero(limit, local_limit);
>   			break;
>   		}
> --
> 2.42.0


Cheers,
Moritz
