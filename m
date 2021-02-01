Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBE930A750
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 13:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CAC6E55C;
	Mon,  1 Feb 2021 12:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E9D896E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 12:13:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC16BED1;
 Mon,  1 Feb 2021 04:13:26 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E51723F718;
 Mon,  1 Feb 2021 04:13:25 -0800 (PST)
Subject: Re: [PATCH 1/3] drm/panfrost: Clear MMU irqs before handling the fault
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210201082116.267208-1-boris.brezillon@collabora.com>
 <20210201082116.267208-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <8cb47743-5d1b-f4bb-3914-022dd02c2b91@arm.com>
Date: Mon, 1 Feb 2021 12:13:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210201082116.267208-2-boris.brezillon@collabora.com>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/02/2021 08:21, Boris Brezillon wrote:
> When a fault is handled it will unblock the GPU which will continue
> executing its shader and might fault almost immediately on a different
> page. If we clear interrupts after handling the fault we might miss new
> faults, so clear them before.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 187d2929206e ("drm/panfrost: Add support for GPU heap allocations")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Good catch (although this oddly rings a bell - so perhaps it was me you 
discussed it with before)

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 7c1b3481b785..904d63450862 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -593,6 +593,8 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>   		access_type = (fault_status >> 8) & 0x3;
>   		source_id = (fault_status >> 16);
>   
> +		mmu_write(pfdev, MMU_INT_CLEAR, mask);
> +
>   		/* Page fault only */
>   		ret = -1;
>   		if ((status & mask) == BIT(i) && (exception_type & 0xF8) == 0xC0)
> @@ -616,8 +618,6 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>   				access_type, access_type_name(pfdev, fault_status),
>   				source_id);
>   
> -		mmu_write(pfdev, MMU_INT_CLEAR, mask);
> -
>   		status &= ~mask;
>   	}
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
