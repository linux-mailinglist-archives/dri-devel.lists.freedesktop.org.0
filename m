Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D61EB16FED
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 12:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888A810E78D;
	Thu, 31 Jul 2025 10:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 82A1710E77D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 10:57:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3836B1D13;
 Thu, 31 Jul 2025 03:57:15 -0700 (PDT)
Received: from [10.1.27.30] (e122027.cambridge.arm.com [10.1.27.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2AFB3F66E;
 Thu, 31 Jul 2025 03:57:20 -0700 (PDT)
Message-ID: <63c7d33d-c475-448e-a928-570c6efe2387@arm.com>
Date: Thu, 31 Jul 2025 11:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/panthor: Serialize GPU cache flush operations
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Dennis Tsiang <dennis.tsiang@arm.com>
References: <20250730174338.1650212-1-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250730174338.1650212-1-karunika.choo@arm.com>
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

On 30/07/2025 18:43, Karunika Choo wrote:
> In certain scenarios, it is possible for multiple cache flushes to be
> requested before the previous one completes. This patch introduces the
> cache_flush_lock mutex to serialize these operations and ensure that
> any requested cache flushes are completed instead of dropped.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> Co-developed-by: Dennis Tsiang <dennis.tsiang@arm.com>

A Co-Developed-By needs to have a signed-off-by too[1]

[1]
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

But I also don't understand how this is happening. The only caller to
panthor_gpu_flush_caches() is in panthor_sched_suspend() and that is
holding the sched->lock mutex.

Steve

> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index cb7a335e07d7..030409371037 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -35,6 +35,9 @@ struct panthor_gpu {
>  
>  	/** @reqs_acked: GPU request wait queue. */
>  	wait_queue_head_t reqs_acked;
> +
> +	/** @cache_flush_lock: Lock to serialize cache flushes */
> +	struct mutex cache_flush_lock;
>  };
>  
>  /**
> @@ -204,6 +207,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  
>  	spin_lock_init(&gpu->reqs_lock);
>  	init_waitqueue_head(&gpu->reqs_acked);
> +	mutex_init(&gpu->cache_flush_lock);
>  	ptdev->gpu = gpu;
>  	panthor_gpu_init_info(ptdev);
>  
> @@ -353,6 +357,9 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
>  	bool timedout = false;
>  	unsigned long flags;
>  
> +	/* Serialize cache flush operations. */
> +	guard(mutex)(&ptdev->gpu->cache_flush_lock);
> +
>  	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
>  	if (!drm_WARN_ON(&ptdev->base,
>  			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {

