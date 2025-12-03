Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC1FC9E446
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E529710E754;
	Wed,  3 Dec 2025 08:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SSDW05lA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D414210E754
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764751265;
 bh=6gTuGhZDLkFh7ZSvz2w/jiQ0tRF82fhRTaidi20+ySE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SSDW05lAMS8UGN+1jd1tK2DzEc0gE4yriMdoMya5CG7z7Nz/cGPIvD9qLPWmVWfW7
 LaDV9DkzkQ/ZmW5okUCti3QBdfiQNSq2VnjHG7zjabTegtOcRiw+k/AXWg1URhbs6G
 zqoT3nB/yUWudiDMIfki3SA7wvlLMuZgF35ob3EggzTu0C/tnPE/S5bZw/Cg2pG63c
 yoNHuWqqQ+ohEZqaLcHm48n/QllTWTXFNb9zx9/wiMBeuro7y7YucHT4W9ISjMxmak
 eIBD43mQIWu/x8FeJJbi8oKUGG/dt7t7dIBKJHgRadIgAFOrW+oA2UJV/0fPLXyL8i
 Dib2FjV+i5Y0g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B5F3C17E10E7;
 Wed,  3 Dec 2025 09:41:04 +0100 (CET)
Date: Wed, 3 Dec 2025 09:41:00 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Grant Likely
 <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ashley.smith@collabora.com
Subject: Re: [PATCH v2] drm/panthor: fix queue_reset_timeout_locked
Message-ID: <20251203094100.5b07fc0b@fedora>
In-Reply-To: <20251202213102.3197965-1-olvaffe@gmail.com>
References: <20251202213102.3197965-1-olvaffe@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue,  2 Dec 2025 13:31:02 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> queue_check_job_completion calls queue_reset_timeout_locked to reset the
> timeout when progress is made. We want the reset to happen when the
> timeout is running, not when it is suspended.
> 
> Fixes: 345c5b7cc0f85 ("drm/panthor: Make the timeout per-queue instead of per-job")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> ---
> v2: reset queue->timeout.remaining when suspended (Boris)
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 26 +++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 389d508b3848e..95ae42168ce18 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1052,18 +1052,6 @@ group_is_idle(struct panthor_group *group)
>  	return hweight32(inactive_queues) == group->queue_count;
>  }
>  
> -static void
> -queue_reset_timeout_locked(struct panthor_queue *queue)
> -{
> -	lockdep_assert_held(&queue->fence_ctx.lock);
> -
> -	if (queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT) {
> -		mod_delayed_work(queue->scheduler.timeout_wq,
> -				 &queue->timeout.work,
> -				 msecs_to_jiffies(JOB_TIMEOUT_MS));
> -	}
> -}
> -
>  static bool
>  group_can_run(struct panthor_group *group)
>  {
> @@ -1080,6 +1068,20 @@ queue_timeout_is_suspended(struct panthor_queue *queue)
>  	return queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT;
>  }
>  
> +static void
> +queue_reset_timeout_locked(struct panthor_queue *queue)
> +{
> +	lockdep_assert_held(&queue->fence_ctx.lock);
> +
> +	if (queue_timeout_is_suspended(queue)) {
> +		queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
> +	} else {
> +		mod_delayed_work(queue->scheduler.timeout_wq,
> +				 &queue->timeout.work,
> +				 msecs_to_jiffies(JOB_TIMEOUT_MS));
> +	}
> +}
> +
>  static void
>  queue_suspend_timeout_locked(struct panthor_queue *queue)
>  {

