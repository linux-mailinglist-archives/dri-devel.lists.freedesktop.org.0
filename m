Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7A262E76
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 14:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DD86EB68;
	Wed,  9 Sep 2020 12:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 207BD6EB68
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 12:23:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD3B5113E;
 Wed,  9 Sep 2020 05:23:41 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8081D3F68F;
 Wed,  9 Sep 2020 05:23:40 -0700 (PDT)
Subject: Re: [PATCH 3/5] drm/panfrost: add support for reset quirk
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-4-narmstrong@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <ff982600-d705-1dc8-44c8-b69015791997@arm.com>
Date: Wed, 9 Sep 2020 13:23:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908151853.4837-4-narmstrong@baylibre.com>
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
> The T820, G31 & G52 GPUs integratewd by Amlogic in the respective GXM, G12A/SM1 & G12B
> SoCs needs a quirk in the PWR registers at the GPU reset time.
> 
> This adds a callback in the device compatible struct of permit this.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_device.h | 3 +++
>   drivers/gpu/drm/panfrost/panfrost_gpu.c    | 4 ++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 2cf1a6a13af8..4c9cd5452ba5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -73,6 +73,9 @@ struct panfrost_compatible {
>   
>   	/* IOMMU quirks flags */
>   	unsigned long pgtbl_quirks;
> +
> +	/* Vendor implementation quirks at reset time callback */
> +	void (*vendor_reset_quirk)(struct panfrost_device *pfdev);
>   };
>   
>   struct panfrost_device {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index e0f190e43813..c129aaf77790 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -62,6 +62,10 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>   	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
>   	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
>   
> +	/* The Amlogic GPU integration needs quirks at this stage */
> +	if (pfdev->comp->vendor_reset_quirk)
> +		pfdev->comp->vendor_reset_quirk(pfdev);
> +
>   	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
>   		val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);

Placing the quirk before the reset has completed is dodgy. Can this be 
ordered after the GPU_IRQ_RESET_COMPLETED signal has been seen? The 
problem is the reset could (in theory) cause a power transition (e.g. if 
the GPU is reset while a core is powered) and changing the PWR_OVERRIDEx 
registers during a transition is undefined. But I don't know the details 
of how the hardware is broken so it is possible the override is needed 
for the reset to complete so this would need testing.

I also wonder if this could live in panfrost_gpu_init_quirks() instead? 
Although that is mostly about quirks common to all Mali GPU 
implementations rather than a specific implementation. Although now I've 
looked I've noticed we have a bug as we don't appear to reapply those 
quirks after a reset - I'll send a patch!

Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
