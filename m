Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BBAA78BDE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B5110E73A;
	Wed,  2 Apr 2025 10:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B513410E73A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:20:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B4B41063;
 Wed,  2 Apr 2025 03:20:27 -0700 (PDT)
Received: from [10.57.15.238] (unknown [10.57.15.238])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C0FB3F63F;
 Wed,  2 Apr 2025 03:20:22 -0700 (PDT)
Message-ID: <ad80f27d-8502-4b5a-9fe5-a052d558170f@arm.com>
Date: Wed, 2 Apr 2025 11:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/panthor: Don't update MMU_INT_MASK in
 panthor_mmu_irq_handler()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250401182348.252422-1-boris.brezillon@collabora.com>
 <20250401182348.252422-6-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250401182348.252422-6-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2025 19:23, Boris Brezillon wrote:
> Interrupts are automatically unmasked in
> panthor_mmu_irq_threaded_handler() when the handler returns. Unmasking
> prematurely might generate spurious interrupts if the IRQ line is
> shared.
> 
> Changes in v2:
> - New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 4ac95a31907d..7a7993016314 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1719,7 +1719,6 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  		 * re-enabled.
>  		 */
>  		ptdev->mmu->irq.mask = new_int_mask;
> -		gpu_write(ptdev, MMU_INT_MASK, new_int_mask);
>  
>  		if (ptdev->mmu->as.slots[as].vm)
>  			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;

