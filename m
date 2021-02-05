Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DB9310AB8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 12:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85FC6E24D;
	Fri,  5 Feb 2021 11:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1D7C6E24D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 11:57:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E7D4ED1;
 Fri,  5 Feb 2021 03:57:07 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E0843F719;
 Fri,  5 Feb 2021 03:57:06 -0800 (PST)
Subject: Re: [PATCH v2 3/3] drm/panfrost: Stay in the threaded MMU IRQ handler
 until we've handled all IRQs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210205111757.585248-1-boris.brezillon@collabora.com>
 <20210205111757.585248-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <86639a56-aeac-6637-3a28-9dbee4966baa@arm.com>
Date: Fri, 5 Feb 2021 11:57:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205111757.585248-4-boris.brezillon@collabora.com>
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

On 05/02/2021 11:17, Boris Brezillon wrote:
> Doing a hw-irq -> threaded-irq round-trip is counter-productive, stay
> in the threaded irq handler as long as we can.
> 
> v2:
> * Rework the loop to avoid a goto
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_mmu.c | 26 +++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 21e552d1ac71..0581186ebfb3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -578,22 +578,20 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>   {
>   	struct panfrost_device *pfdev = data;
>   	u32 status = mmu_read(pfdev, MMU_INT_RAWSTAT);
> -	int i, ret;
> +	int ret;
>   
> -	for (i = 0; status; i++) {
> -		u32 mask = BIT(i) | BIT(i + 16);
> +	while (status) {
> +		u32 as = ffs(status | (status >> 16)) - 1;
> +		u32 mask = BIT(as) | BIT(as + 16);
>   		u64 addr;
>   		u32 fault_status;
>   		u32 exception_type;
>   		u32 access_type;
>   		u32 source_id;
>   
> -		if (!(status & mask))
> -			continue;
> -
> -		fault_status = mmu_read(pfdev, AS_FAULTSTATUS(i));
> -		addr = mmu_read(pfdev, AS_FAULTADDRESS_LO(i));
> -		addr |= (u64)mmu_read(pfdev, AS_FAULTADDRESS_HI(i)) << 32;
> +		fault_status = mmu_read(pfdev, AS_FAULTSTATUS(as));
> +		addr = mmu_read(pfdev, AS_FAULTADDRESS_LO(as));
> +		addr |= (u64)mmu_read(pfdev, AS_FAULTADDRESS_HI(as)) << 32;
>   
>   		/* decode the fault status */
>   		exception_type = fault_status & 0xFF;
> @@ -604,8 +602,8 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>   
>   		/* Page fault only */
>   		ret = -1;
> -		if ((status & mask) == BIT(i) && (exception_type & 0xF8) == 0xC0)
> -			ret = panfrost_mmu_map_fault_addr(pfdev, i, addr);
> +		if ((status & mask) == BIT(as) && (exception_type & 0xF8) == 0xC0)
> +			ret = panfrost_mmu_map_fault_addr(pfdev, as, addr);
>   
>   		if (ret)
>   			/* terminal fault, print info about the fault */
> @@ -617,7 +615,7 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>   				"exception type 0x%X: %s\n"
>   				"access type 0x%X: %s\n"
>   				"source id 0x%X\n",
> -				i, addr,
> +				as, addr,
>   				"TODO",
>   				fault_status,
>   				(fault_status & (1 << 10) ? "DECODER FAULT" : "SLAVE FAULT"),
> @@ -626,6 +624,10 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>   				source_id);
>   
>   		status &= ~mask;
> +
> +		/* If we received new MMU interrupts, process them before returning. */
> +		if (!status)
> +			status = mmu_read(pfdev, MMU_INT_RAWSTAT);
>   	}
>   
>   	mmu_write(pfdev, MMU_INT_MASK, ~0);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
