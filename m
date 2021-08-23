Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A863F47CA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 11:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6D289AC0;
	Mon, 23 Aug 2021 09:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CBCC589AC0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 09:40:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F2B76D;
 Mon, 23 Aug 2021 02:40:56 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8D303F66F;
 Mon, 23 Aug 2021 02:40:54 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/panfrost: Use u64 for size in lock_region
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
References: <20210820213117.13050-1-alyssa.rosenzweig@collabora.com>
 <20210820213117.13050-3-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <71392001-a5a9-fee2-79a5-91df55ba3081@arm.com>
Date: Mon, 23 Aug 2021 10:40:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820213117.13050-3-alyssa.rosenzweig@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/08/2021 22:31, Alyssa Rosenzweig wrote:
> Mali virtual addresses are 48-bit. Use a u64 instead of size_t to ensure
> we can express the "lock everything" condition as ~0ULL without relying
> on platform-specific behaviour.

'platform-specific behaviour' makes it sound like this is something to
do with a particular board. This is 32bit/64bit - it's going to be
broken on 32bit: large lock regions are not going to work.

> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Tested-by: Chris Morgan <macromorgan@hotmail.com>

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")

Reviewed-by: Steven Price <steven.price@arm.com>

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index f6e02d0392f4..3a795273e505 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -58,7 +58,7 @@ static int write_cmd(struct panfrost_device *pfdev, u32 as_nr, u32 cmd)
>  }
>  
>  static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
> -			u64 iova, size_t size)
> +			u64 iova, u64 size)
>  {
>  	u8 region_width;
>  	u64 region = iova & PAGE_MASK;
> @@ -78,7 +78,7 @@ static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
>  
>  
>  static int mmu_hw_do_operation_locked(struct panfrost_device *pfdev, int as_nr,
> -				      u64 iova, size_t size, u32 op)
> +				      u64 iova, u64 size, u32 op)
>  {
>  	if (as_nr < 0)
>  		return 0;
> @@ -95,7 +95,7 @@ static int mmu_hw_do_operation_locked(struct panfrost_device *pfdev, int as_nr,
>  
>  static int mmu_hw_do_operation(struct panfrost_device *pfdev,
>  			       struct panfrost_mmu *mmu,
> -			       u64 iova, size_t size, u32 op)
> +			       u64 iova, u64 size, u32 op)
>  {
>  	int ret;
>  
> @@ -112,7 +112,7 @@ static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_m
>  	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
>  	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
>  
> -	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0UL, AS_COMMAND_FLUSH_MEM);
> +	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
>  
>  	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), transtab & 0xffffffffUL);
>  	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), transtab >> 32);
> @@ -128,7 +128,7 @@ static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_m
>  
>  static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
>  {
> -	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0UL, AS_COMMAND_FLUSH_MEM);
> +	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
>  
>  	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), 0);
>  	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), 0);
> @@ -242,7 +242,7 @@ static size_t get_pgsize(u64 addr, size_t size)
>  
>  static void panfrost_mmu_flush_range(struct panfrost_device *pfdev,
>  				     struct panfrost_mmu *mmu,
> -				     u64 iova, size_t size)
> +				     u64 iova, u64 size)
>  {
>  	if (mmu->as < 0)
>  		return;
> 

