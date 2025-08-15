Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274C4B27D7E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 11:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B60510E8DA;
	Fri, 15 Aug 2025 09:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E31D110E8DA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 09:50:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49C3F1655;
 Fri, 15 Aug 2025 02:50:24 -0700 (PDT)
Received: from [10.1.29.14] (e122027.cambridge.arm.com [10.1.29.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1484E3F63F;
 Fri, 15 Aug 2025 02:50:29 -0700 (PDT)
Message-ID: <f7ea81af-398f-4a58-8193-1681ebafa678@arm.com>
Date: Fri, 15 Aug 2025 10:50:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/7] drm/panthor: Serialize GPU cache flush operations
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Dennis Tsiang <dennis.tsiang@arm.com>
References: <20250807162633.3666310-1-karunika.choo@arm.com>
 <20250807162633.3666310-6-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250807162633.3666310-6-karunika.choo@arm.com>
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

On 07/08/2025 17:26, Karunika Choo wrote:
> In certain scenarios, it is possible for multiple cache flushes to be
> requested before the previous one completes. This patch introduces the
> cache_flush_lock mutex to serialize these operations and ensure that
> any requested cache flushes are completed instead of dropped.
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Co-developed-by: Dennis Tsiang <dennis.tsiang@arm.com>
> Signed-off-by: Dennis Tsiang <dennis.tsiang@arm.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 5e2c3173ae27..db69449a5be0 100644
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
>  #define GPU_INTERRUPTS_MASK	\
> @@ -110,6 +113,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  
>  	spin_lock_init(&gpu->reqs_lock);
>  	init_waitqueue_head(&gpu->reqs_acked);
> +	mutex_init(&gpu->cache_flush_lock);
>  	ptdev->gpu = gpu;
>  
>  	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
> @@ -258,6 +262,9 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
>  	bool timedout = false;
>  	unsigned long flags;
>  
> +	/* Serialize cache flush operations. */
> +	guard(mutex)(&ptdev->gpu->cache_flush_lock);
> +
>  	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
>  	if (!drm_WARN_ON(&ptdev->base,
>  			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {

