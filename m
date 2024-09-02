Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D3596837A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76A510E0F0;
	Mon,  2 Sep 2024 09:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A5A5410E277
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 09:42:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1141FEC;
 Mon,  2 Sep 2024 02:42:59 -0700 (PDT)
Received: from [10.57.74.147] (unknown [10.57.74.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7E403F66E;
 Mon,  2 Sep 2024 02:42:31 -0700 (PDT)
Message-ID: <8c69e939-3019-45cb-9486-510ce7fcb78e@arm.com>
Date: Mon, 2 Sep 2024 10:42:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Use the BITS_PER_LONG macro
To: Jinjie Ruan <ruanjinjie@huawei.com>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240902094404.1943710-1-ruanjinjie@huawei.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240902094404.1943710-1-ruanjinjie@huawei.com>
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

On 02/09/2024 10:44, Jinjie Ruan wrote:
> sizeof(unsigned long) * 8 is the number of bits in an unsigned long
> variable, replace it with BITS_PER_LONG macro to make them simpler.
> 
> And fix the warning:
> 	WARNING: Comparisons should place the constant on the right side of the test
> 	#23: FILE: drivers/gpu/drm/panthor/panthor_mmu.c:2696:
> 	+       if (BITS_PER_LONG < va_bits) {
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks, I'll push to drm-misc-next.

Steve

> ---
> v2:
> - Also fix for below mmu_features.
> - Remoove -next.
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index fa0a002b1016..7b1c345669b7 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2693,9 +2693,9 @@ int panthor_mmu_init(struct panthor_device *ptdev)
>  	 * which passes iova as an unsigned long. Patch the mmu_features to reflect this
>  	 * limitation.
>  	 */
> -	if (sizeof(unsigned long) * 8 < va_bits) {
> +	if (va_bits > BITS_PER_LONG) {
>  		ptdev->gpu_info.mmu_features &= ~GENMASK(7, 0);
> -		ptdev->gpu_info.mmu_features |= sizeof(unsigned long) * 8;
> +		ptdev->gpu_info.mmu_features |= BITS_PER_LONG;
>  	}
>  
>  	return drmm_add_action_or_reset(&ptdev->base, panthor_mmu_release_wq, mmu->vm.wq);

