Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5723262E75
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 14:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC506EB65;
	Wed,  9 Sep 2020 12:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 99D036EB65
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 12:23:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47A431045;
 Wed,  9 Sep 2020 05:23:39 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CE083F68F;
 Wed,  9 Sep 2020 05:23:38 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm/panfrost: add support specifying pgtbl quirks
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-3-narmstrong@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <2c9bc126-d191-c24a-c745-d69ea1d16d1e@arm.com>
Date: Wed, 9 Sep 2020 13:23:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908151853.4837-3-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2020 16:18, Neil Armstrong wrote:
> Add a pgtbl_quirks entry in the compatible specific table to permit specyfying IOMMU
> quirks for platforms.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_device.h | 3 +++
>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 953f7536a773..2cf1a6a13af8 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -70,6 +70,9 @@ struct panfrost_compatible {
>   	int num_pm_domains;
>   	/* Only required if num_pm_domains > 1. */
>   	const char * const *pm_domain_names;
> +
> +	/* IOMMU quirks flags */
> +	unsigned long pgtbl_quirks;
>   };
>   
>   struct panfrost_device {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index e8f7b11352d2..55a846c70e46 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -368,6 +368,7 @@ int panfrost_mmu_pgtable_alloc(struct panfrost_file_priv *priv)
>   	mmu->as = -1;
>   
>   	mmu->pgtbl_cfg = (struct io_pgtable_cfg) {
> +		.quirks = pfdev->comp ? pfdev->comp->pgtbl_quirks : 0,
>   		.pgsize_bitmap	= SZ_4K | SZ_2M,
>   		.ias		= FIELD_GET(0xff, pfdev->features.mmu_features),
>   		.oas		= FIELD_GET(0xff00, pfdev->features.mmu_features),
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
