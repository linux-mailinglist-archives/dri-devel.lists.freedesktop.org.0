Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFFA155D06
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FE86EB0E;
	Fri,  7 Feb 2020 17:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCF66EB0E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 17:39:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id E1A16292B3E
Subject: Re: [PATCH] drm/panfrost: perfcnt: Reserve/use the AS attached to the
 perfcnt MMU context
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
References: <20200206141327.446127-1-boris.brezillon@collabora.com>
From: Antonio Caggiano <antonio.caggiano@collabora.com>
Message-ID: <006f68d9-a909-6804-57e7-2b543b3c5d15@collabora.com>
Date: Fri, 7 Feb 2020 18:39:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206141327.446127-1-boris.brezillon@collabora.com>
Content-Language: en-US
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
Cc: Icecream95 <ixn@keemail.me>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/20 15:13, Boris Brezillon wrote:
> We need to use the AS attached to the opened FD when dumping counters.
> 
> Reported-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Fixes: 7282f7645d06 ("drm/panfrost: Implement per FD address spaces")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

It works fine on RK3399.

Tested-by: Antonio Caggiano <antonio.caggiano@collabora.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_mmu.c     |  7 ++++++-
>   drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 11 ++++-------
>   2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 763cfca886a7..3107b0738e40 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -151,7 +151,12 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
>   	as = mmu->as;
>   	if (as >= 0) {
>   		int en = atomic_inc_return(&mmu->as_count);
> -		WARN_ON(en >= NUM_JOB_SLOTS);
> +
> +		/*
> +		 * AS can be retained by active jobs or a perfcnt context,
> +		 * hence the '+ 1' here.
> +		 */
> +		WARN_ON(en >= (NUM_JOB_SLOTS + 1));
>   
>   		list_move(&mmu->list, &pfdev->as_lru_list);
>   		goto out;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index 684820448be3..6913578d5aa7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -73,7 +73,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>   	struct panfrost_file_priv *user = file_priv->driver_priv;
>   	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
>   	struct drm_gem_shmem_object *bo;
> -	u32 cfg;
> +	u32 cfg, as;
>   	int ret;
>   
>   	if (user == perfcnt->user)
> @@ -126,12 +126,8 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>   
>   	perfcnt->user = user;
>   
> -	/*
> -	 * Always use address space 0 for now.
> -	 * FIXME: this needs to be updated when we start using different
> -	 * address space.
> -	 */
> -	cfg = GPU_PERFCNT_CFG_AS(0) |
> +	as = panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
> +	cfg = GPU_PERFCNT_CFG_AS(as) |
>   	      GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_MANUAL);
>   
>   	/*
> @@ -195,6 +191,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
>   	drm_gem_shmem_vunmap(&perfcnt->mapping->obj->base.base, perfcnt->buf);
>   	perfcnt->buf = NULL;
>   	panfrost_gem_close(&perfcnt->mapping->obj->base.base, file_priv);
> +	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
>   	panfrost_gem_mapping_put(perfcnt->mapping);
>   	perfcnt->mapping = NULL;
>   	pm_runtime_mark_last_busy(pfdev->dev);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
