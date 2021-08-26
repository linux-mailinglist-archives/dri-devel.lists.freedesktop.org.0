Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82303F83E6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 10:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D0B6E544;
	Thu, 26 Aug 2021 08:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0F71F6E544
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 08:46:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72C5BD6E;
 Thu, 26 Aug 2021 01:46:37 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CCC43F5A1;
 Thu, 26 Aug 2021 01:46:36 -0700 (PDT)
Subject: Re: [PATCH v2] drm/panfrost: Use upper/lower_32_bits helpers
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20210825153348.4980-1-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <7e46bb25-58c9-07a0-e33d-643b9a8bebd0@arm.com>
Date: Thu, 26 Aug 2021 09:46:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825153348.4980-1-alyssa.rosenzweig@collabora.com>
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

On 25/08/2021 16:33, Alyssa Rosenzweig wrote:
> Use upper_32_bits/lower_32_bits helpers instead of open-coding them.
> This is easier to scan quickly compared to bitwise manipulation, and it
> is pleasingly symmetric. I noticed this when debugging lock_region,
> which had a particularly "creative" way of writing upper_32_bits.
> 
> v2: Use helpers for one more call site and add review tag (Steven).
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org> (v1)
> Reviewed-by: Steven Price <steven.price@arm.com>

Pushed to drm-misc-next

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c     |  8 ++++----
>  drivers/gpu/drm/panfrost/panfrost_mmu.c     | 12 ++++++------
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  4 ++--
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 71a72fb50e6b..763b7abfc88e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -137,8 +137,8 @@ static void panfrost_job_write_affinity(struct panfrost_device *pfdev,
>  	 */
>  	affinity = pfdev->features.shader_present;
>  
> -	job_write(pfdev, JS_AFFINITY_NEXT_LO(js), affinity & 0xFFFFFFFF);
> -	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), affinity >> 32);
> +	job_write(pfdev, JS_AFFINITY_NEXT_LO(js), lower_32_bits(affinity));
> +	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), upper_32_bits(affinity));
>  }
>  
>  static u32
> @@ -203,8 +203,8 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  
>  	cfg = panfrost_mmu_as_get(pfdev, job->file_priv->mmu);
>  
> -	job_write(pfdev, JS_HEAD_NEXT_LO(js), jc_head & 0xFFFFFFFF);
> -	job_write(pfdev, JS_HEAD_NEXT_HI(js), jc_head >> 32);
> +	job_write(pfdev, JS_HEAD_NEXT_LO(js), lower_32_bits(jc_head));
> +	job_write(pfdev, JS_HEAD_NEXT_HI(js), upper_32_bits(jc_head));
>  
>  	panfrost_job_write_affinity(pfdev, job->requirements, js);
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 0da5b3100ab1..c3fbe0ad9090 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -80,8 +80,8 @@ static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
>  	region |= region_width;
>  
>  	/* Lock the region that needs to be updated */
> -	mmu_write(pfdev, AS_LOCKADDR_LO(as_nr), region & 0xFFFFFFFFUL);
> -	mmu_write(pfdev, AS_LOCKADDR_HI(as_nr), (region >> 32) & 0xFFFFFFFFUL);
> +	mmu_write(pfdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
> +	mmu_write(pfdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
>  	write_cmd(pfdev, as_nr, AS_COMMAND_LOCK);
>  }
>  
> @@ -123,14 +123,14 @@ static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_m
>  
>  	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0UL, AS_COMMAND_FLUSH_MEM);
>  
> -	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), transtab & 0xffffffffUL);
> -	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), transtab >> 32);
> +	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
> +	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
>  
>  	/* Need to revisit mem attrs.
>  	 * NC is the default, Mali driver is inner WT.
>  	 */
> -	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), memattr & 0xffffffffUL);
> -	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), memattr >> 32);
> +	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
> +	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
>  
>  	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index 5ab03d605f57..e116a4d9b8e5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -51,8 +51,8 @@ static int panfrost_perfcnt_dump_locked(struct panfrost_device *pfdev)
>  
>  	reinit_completion(&pfdev->perfcnt->dump_comp);
>  	gpuva = pfdev->perfcnt->mapping->mmnode.start << PAGE_SHIFT;
> -	gpu_write(pfdev, GPU_PERFCNT_BASE_LO, gpuva);
> -	gpu_write(pfdev, GPU_PERFCNT_BASE_HI, gpuva >> 32);
> +	gpu_write(pfdev, GPU_PERFCNT_BASE_LO, lower_32_bits(gpuva));
> +	gpu_write(pfdev, GPU_PERFCNT_BASE_HI, upper_32_bits(gpuva));
>  	gpu_write(pfdev, GPU_INT_CLEAR,
>  		  GPU_IRQ_CLEAN_CACHES_COMPLETED |
>  		  GPU_IRQ_PERFCNT_SAMPLE_COMPLETED);
> 

