Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CA525CC2F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 23:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C726E09F;
	Thu,  3 Sep 2020 21:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 16ECB6E09F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 21:26:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57F6B1045;
 Thu,  3 Sep 2020 14:26:54 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFF2F3F68F;
 Thu,  3 Sep 2020 14:26:52 -0700 (PDT)
Subject: Re: [PATCH] drm/komeda: Drop local dma_parms
From: Robin Murphy <robin.murphy@arm.com>
To: james.qian.wang@arm.com, liviu.dudau@arm.com, mihail.atanassov@arm.com
References: <8de297b5b916628c77b99068fb5aac1a69eed6f5.1599164796.git.robin.murphy@arm.com>
Message-ID: <f7702954-0bea-71c2-b92d-472782203f4b@arm.com>
Date: Thu, 3 Sep 2020 22:26:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8de297b5b916628c77b99068fb5aac1a69eed6f5.1599164796.git.robin.murphy@arm.com>
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
Cc: malidp@foss.arm.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-03 21:36, Robin Murphy wrote:
> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
> for platform devices"), struct platform_device already provides a
> dma_parms structure, so we can save allocating another one.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> FYI, get_maintainer.pl seems to be choking on your L: entry somehow,
> since it just shows " (open list:ARM KOMEDA DRM-KMS DRIVER)" without the
> description or address, not sure what's up with that.
> 
>   drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 1 -
>   drivers/gpu/drm/arm/display/komeda/komeda_dev.h | 2 --
>   2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index 1d767473ba8a..e7bb905062d9 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -261,7 +261,6 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
>   		goto disable_clk;
>   	}
> 
> -	dev->dma_parms = &mdev->dma_parms;
>   	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));

Oops, I missed my "Also the DMA segment size is simply a size, not a 
bitmask" bit here - ideally this should be changed to UINT_MAX while 
we're cleaning up. Maybe that could just be fixed up when applying, but 
let me know if you'd like a resend.

Cheers,
Robin.

>   	mdev->iommu = iommu_get_domain_for_dev(mdev->dev);
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> index ce27f2f27c24..5b536f0cb548 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> @@ -163,8 +163,6 @@ struct komeda_dev {
>   	struct device *dev;
>   	/** @reg_base: the base address of komeda io space */
>   	u32 __iomem   *reg_base;
> -	/** @dma_parms: the dma parameters of komeda */
> -	struct device_dma_parameters dma_parms;
> 
>   	/** @chip: the basic chip information */
>   	struct komeda_chip_info chip;
> --
> 2.28.0.dirty
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
