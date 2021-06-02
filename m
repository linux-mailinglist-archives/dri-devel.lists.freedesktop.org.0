Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D96F639889B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 13:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AD66EB85;
	Wed,  2 Jun 2021 11:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 31C986EB85
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 11:50:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFE666D;
 Wed,  2 Jun 2021 04:50:34 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E83273F719;
 Wed,  2 Jun 2021 04:50:33 -0700 (PDT)
Subject: Re: [PATCH 3/4] drm/panfrost: Add permon acquire/release helpers
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
 <20210527203804.12914-4-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <5d00a41d-b79c-14af-485b-e689f926ae2c@arm.com>
Date: Wed, 2 Jun 2021 12:50:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527203804.12914-4-alyssa.rosenzweig@collabora.com>
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
Cc: airlied@linux.ie, tomeu.vizoso@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/05/2021 21:38, alyssa.rosenzweig@collabora.com wrote:
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> Wrap the underlying CYCLE_COUNT_START/STOP commands in a safe interface
> that ensures the commands are only issued where required by guarding
> behind an atomic counter. In particular, we need to be careful about
> races between multiple in-flight jobs, where only some require cycle
> counts.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  3 +++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 20 ++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.h    |  3 +++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 597cf1459..8a89aa274 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -117,6 +117,9 @@ struct panfrost_device {
>  	struct shrinker shrinker;
>  
>  	struct panfrost_devfreq pfdevfreq;
> +
> +	/* Number of active jobs requiring performance monitoring */
> +	atomic_t permon_pending;

If the JD_REQ name is going to be changed then this should be renamed to
be consistent.

>  };
>  
>  struct panfrost_mmu {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 2aae636f1..acacceb15 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -399,3 +399,23 @@ u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev)
>  
>  	return 0;
>  }
> +
> +void panfrost_acquire_permon(struct panfrost_device *pfdev)
> +{
> +	/* If another in-flight job enabled permon, we don't have to */
> +	if (atomic_inc_return(&pfdev->permon_pending) > 1)
> +		return;
> +
> +	/* Otherwise, we're the first user */
> +	gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_START);
> +}

NIT: The check of atomic_inc_return() is usually of the style '== 1', i.e.:

	/* Only enable permon, if we're the first user */
	if (atomic_inc_return(&pfdev->permon_pending) == 1)
		gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_START);

> +
> +void panfrost_release_permon(struct panfrost_device *pfdev)
> +{
> +	/* If another in-flight job needs permon, keep it active */
> +	if (atomic_dec_return(&pfdev->permon_pending) > 0)
> +		return;
> +
> +	/* Otherwise, we're the last user */
> +	gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_STOP);
> +}

NIT: Similarly for disabling the usual style is '== 0'

Thanks,

Steve

> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> index 468c51e7e..01a91af09 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> @@ -18,4 +18,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev);
>  
>  void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
>  
> +void panfrost_acquire_permon(struct panfrost_device *pfdev);
> +void panfrost_release_permon(struct panfrost_device *pfdev);
> +
>  #endif
> 

