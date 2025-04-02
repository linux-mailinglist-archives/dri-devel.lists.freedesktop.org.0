Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F5A78BDB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C910510E737;
	Wed,  2 Apr 2025 10:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5975510E738
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:20:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19C851063;
 Wed,  2 Apr 2025 03:20:18 -0700 (PDT)
Received: from [10.57.15.238] (unknown [10.57.15.238])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB3D43F63F;
 Wed,  2 Apr 2025 03:20:13 -0700 (PDT)
Message-ID: <6a10f9d4-8581-483b-baf2-747e3273c0e5@arm.com>
Date: Wed, 2 Apr 2025 11:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/panthor: Update panthor_mmu::irq::mask when
 needed
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250401182348.252422-1-boris.brezillon@collabora.com>
 <20250401182348.252422-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250401182348.252422-4-boris.brezillon@collabora.com>
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
> When we clear the faulty bits in the AS mask, we also need to update
> the panthor_mmu::irq::mask field otherwise our IRQ handler won't get
> called again until the GPU is reset.
> 
> Changes in v2:
> - Add Liviu's R-b
> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 12a02e28f50f..7cca97d298ea 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -781,6 +781,7 @@ int panthor_vm_active(struct panthor_vm *vm)
>  	if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as)) {
>  		gpu_write(ptdev, MMU_INT_CLEAR, panthor_mmu_as_fault_mask(ptdev, as));
>  		ptdev->mmu->as.faulty_mask &= ~panthor_mmu_as_fault_mask(ptdev, as);
> +		ptdev->mmu->irq.mask |= panthor_mmu_as_fault_mask(ptdev, as);
>  		gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
>  	}
>  

