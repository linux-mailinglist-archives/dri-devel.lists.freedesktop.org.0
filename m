Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25733AEC0B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4CB6E1B3;
	Mon, 21 Jun 2021 15:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B9D86E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:09:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF5F21042;
 Mon, 21 Jun 2021 08:09:34 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D61BB3F694;
 Mon, 21 Jun 2021 08:09:33 -0700 (PDT)
Subject: Re: [PATCH v2 05/12] drm/panfrost: Disable the AS on unhandled page
 faults
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-6-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <34ff5093-3f4b-d0fc-0d16-0328fc088d8a@arm.com>
Date: Mon, 21 Jun 2021 16:09:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621133907.1683899-6-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2021 14:39, Boris Brezillon wrote:
> If we don't do that, we have to wait for the job timeout to expire
> before the fault jobs gets killed.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Don't we need to do something here to allow recovery of the MMU context
in the future? panfrost_mmu_disable() will zero out the MMU registers on
the hardware, but AFAICS panfrost_mmu_enable() won't be called to
restore the values until something evicts the address space (GPU power
down/reset or just too many other processes).

The ideal would be to block submission of new jobs from this context and
then wait until existing jobs have completed at which point the MMU
state can be restored and jobs allowed again.

But at a minimum I think we should have something like an 'MMU poisoned'
bit that panfrost_mmu_as_get() can check.

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 2a9bf30edc9d..d5c624e776f1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -661,7 +661,7 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>  		if ((status & mask) == BIT(as) && (exception_type & 0xF8) == 0xC0)
>  			ret = panfrost_mmu_map_fault_addr(pfdev, as, addr);
>  
> -		if (ret)
> +		if (ret) {
>  			/* terminal fault, print info about the fault */
>  			dev_err(pfdev->dev,
>  				"Unhandled Page fault in AS%d at VA 0x%016llX\n"
> @@ -679,6 +679,10 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>  				access_type, access_type_name(pfdev, fault_status),
>  				source_id);
>  
> +			/* Disable the MMU to stop jobs on this AS immediately */
> +			panfrost_mmu_disable(pfdev, as);
> +		}
> +
>  		status &= ~mask;
>  
>  		/* If we received new MMU interrupts, process them before returning. */
> 

