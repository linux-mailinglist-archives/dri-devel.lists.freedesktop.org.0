Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE7C9C889
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 19:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A94210E694;
	Tue,  2 Dec 2025 18:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Qi1+8Frj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F9810E185
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 18:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764698730;
 bh=negGW9YX3ckxRoRWpkxjiL+aEvsUq0fFnBmXBuNC3jE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qi1+8FrjxlMHZT4xvS5R+7YMW6nSM8HOu1orcoiMar4cLVLcwUfIgfSXnEUak0WUb
 A8mngMP4Xpj3ZsgXwwYKScJVyzPeO8v+f58CFO13AXNU6IFUPNJMW31zPznlSP1cS7
 dMMm2SCK5UXrQIrg3DZM0ZLb8qNU7z3MnbJ9YS3s6Vfpqj3BoNXlfBYYs3vhbgeMdD
 aWSmyZAa2NAGO0E1rpoQbiWTbvl1Y5ZxHBAMcXq223vaKiC16YYxsC4ecNMQXRg6p3
 GzHjPJ3MsqXc7lR9e+tezg7jrIZwG3xp/KyKy0BgR6H8kLvf1Gte6GO8L1IJ7Z1adC
 DhjSI43x+xwjA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 60CDC17E114C;
 Tue,  2 Dec 2025 19:05:30 +0100 (CET)
Date: Tue, 2 Dec 2025 19:05:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Grant Likely
 <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ashley.smith@collabora.com
Subject: Re: [PATCH] drm/panthor: fix queue_reset_timeout_locked
Message-ID: <20251202190525.60973e38@fedora>
In-Reply-To: <20251202174028.1600218-1-olvaffe@gmail.com>
References: <20251202174028.1600218-1-olvaffe@gmail.com>
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

On Tue,  2 Dec 2025 09:40:28 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> queue_check_job_completion calls queue_reset_timeout_locked to reset the
> timeout when progress is made. We want the reset to happen when the
> timeout is running, not when it is suspended.
> 
> Fixes: 345c5b7cc0f85 ("drm/panthor: Make the timeout per-queue instead of per-job")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 389d508b3848e..47e81fc45fb56 100644
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
> @@ -1080,6 +1068,18 @@ queue_timeout_is_suspended(struct panthor_queue *queue)
>  	return queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT;
>  }
>  
> +static void
> +queue_reset_timeout_locked(struct panthor_queue *queue)
> +{
> +	lockdep_assert_held(&queue->fence_ctx.lock);
> +
> +	if (!queue_timeout_is_suspended(queue)) {
> +		mod_delayed_work(queue->scheduler.timeout_wq,
> +				 &queue->timeout.work,
> +				 msecs_to_jiffies(JOB_TIMEOUT_MS));
> +	}

Oops. If queue_reset_timeout_locked() is called in a context where the
timeout is suspended, shouldn't we adjust the remaining value?

static void
queue_reset_timeout_locked(struct panthor_queue *queue)
{
        lockdep_assert_held(&queue->fence_ctx.lock);

        if (queue_timeout_is_suspended(queue)) { 
                queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
	} else {
                mod_delayed_work(queue->scheduler.timeout_wq,
                                 &queue->timeout.work,
                                 msecs_to_jiffies(JOB_TIMEOUT_MS));
        }
}


> +}
> +
>  static void
>  queue_suspend_timeout_locked(struct panthor_queue *queue)
>  {

