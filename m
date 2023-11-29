Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DA87FCED0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 07:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9E310E5FD;
	Wed, 29 Nov 2023 06:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DACD10E5FD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 06:06:05 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5cddc35545dso72084067b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 22:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701237965; x=1701842765;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BFBgGZHgdrEFpnu/cpKOcJzser1reIBdXzg/6fniV64=;
 b=xqCTSCGBzzpc0xThThjFhaptQiRs3bpBmpk33zAXn2Ys2pa8qLrCdoZnvIYn/MMM5B
 2sdrcC2iw7oYKrHzjQ/b9q7tk3UO+/u9nsY/WwB0oCayc1TkXeHXuE9uX/DizTZRxSJ5
 7nHdLDszTvXj3xcaD63AzGKCUjAvL1UqZkEe7yfIeRGA92pXoQsHunIJgTbIhqFHzD2K
 zTJh5NOqElMbVFNlUx7/SNHMULMgZrnpGYfE/W0IvUImQRtAHM7FPxV7hvBi0XtKq0ol
 itzbFUp76n1ZqO0GA0/t1q5Hrgh4rNqYhnpFtBNjKC5rGX5oCRVfuKz5dvvI5AvDHxsa
 venA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701237965; x=1701842765;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BFBgGZHgdrEFpnu/cpKOcJzser1reIBdXzg/6fniV64=;
 b=gb1oUmndzdWKRz6Gtf8XUSKv0mu8UZO9tFUdTeLrjr/T7jAjjA9thD0X4OJCM/G2+/
 gbGX2V5BhdaRBH7Puu0ewhdehFzX4XgSjvNws+Y+tczEjg+sXUg6GlpGrjdQW9mkOkt0
 WKr0GbQ0kMz+iyzv2XyL//WMsa9xvcwpKKSE/M9u8322KWZd/8lqf4oGb86YjbdLEm/7
 kV1zZGh54we4VCn7W7v8Dgcenzqy0Sx41fWXJrQfknLcrLDgopY/c9VmWAGIw8oUX1+o
 7cz4uqFKyLRpQDgRDq4HPT6np3MaE66dwG7Qi1M1+kzjrcGjOt+q+hyB3wgGXl573m+B
 slPg==
X-Gm-Message-State: AOJu0YxiVqs62PAt4pBUD/dCmoeaM9BfUBiXysBVU6O32qWqvPbc4kOH
 S71N3ccNnoTyre3YH67ipImcnFNlzC7+
X-Google-Smtp-Source: AGHT+IG4ZcbE3hB8V6+vKX0zxYUr0OpHfbf/WNlvcGBdlOoo8eTYBCxtpp+7m/8KdVPZTHDTWhORx94znMfW
X-Received: from morats.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:d9e])
 (user=moritzf job=sendgmr) by 2002:a25:c044:0:b0:db5:1f69:704e
 with SMTP id
 c65-20020a25c044000000b00db51f69704emr38263ybf.1.1701237964651; Tue, 28 Nov
 2023 22:06:04 -0800 (PST)
Date: Wed, 29 Nov 2023 06:06:03 +0000
In-Reply-To: <4-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Mime-Version: 1.0
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <4-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Message-ID: <20231129060603.hxtmbsefxurxnwkh@google.com>
Subject: Re: [PATCH 04/10] iommu: Mark dev_iommu_get() with lockdep
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

On Tue, Nov 28, 2023 at 08:48:00PM -0400, Jason Gunthorpe wrote:
> Allocation of dev->iommu must be done under the
> iommu_probe_device_lock. Mark this with lockdep to discourage future
> mistakes.

> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Tested-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 2 ++
>   1 file changed, 2 insertions(+)

> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 0d25468d53a68a..4323b6276e977f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -334,6 +334,8 @@ static struct dev_iommu *dev_iommu_get(struct device  
> *dev)
>   {
>   	struct dev_iommu *param = dev->iommu;

> +	lockdep_assert_held(&iommu_probe_device_lock);
> +
>   	if (param)
>   		return param;

> --
> 2.42.0


Reviewed-by: Moritz Fischer <moritzf@google.com>

Cheers,
Moritz
