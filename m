Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F2430A752
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 13:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E90B6E56D;
	Mon,  1 Feb 2021 12:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E3C66E56D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 12:13:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 952E8142F;
 Mon,  1 Feb 2021 04:13:39 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACB583F718;
 Mon,  1 Feb 2021 04:13:38 -0800 (PST)
Subject: Re: [PATCH 3/3] drm/panfrost: Stay in the threaded MMU IRQ handler
 until we've handled all IRQs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210201082116.267208-1-boris.brezillon@collabora.com>
 <20210201082116.267208-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <ecf5fb35-fd3b-5980-5eb0-fba36d6bd83f@arm.com>
Date: Mon, 1 Feb 2021 12:13:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210201082116.267208-4-boris.brezillon@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/02/2021 08:21, Boris Brezillon wrote:
> Doing a hw-irq -> threaded-irq round-trip is counter-productive, stay
> in the threaded irq handler as long as we can.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Looks fine to me, but I'm interested to know if you actually saw a 
performance improvement. Back-to-back MMU faults should (hopefully) be 
fairly uncommon.

Regardless:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_mmu.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 21e552d1ac71..65bc20628c4e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -580,6 +580,8 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>   	u32 status = mmu_read(pfdev, MMU_INT_RAWSTAT);
>   	int i, ret;
>   
> +again:
> +
>   	for (i = 0; status; i++) {
>   		u32 mask = BIT(i) | BIT(i + 16);
>   		u64 addr;
> @@ -628,6 +630,11 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>   		status &= ~mask;
>   	}
>   
> +	/* If we received new MMU interrupts, process them before returning. */
> +	status = mmu_read(pfdev, MMU_INT_RAWSTAT);
> +	if (status)
> +		goto again;
> +
>   	mmu_write(pfdev, MMU_INT_MASK, ~0);
>   	return IRQ_HANDLED;
>   };
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
