Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFDCB996F1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 12:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BCC10E6E7;
	Wed, 24 Sep 2025 10:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 84F9510E6E8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 10:31:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E824C106F;
 Wed, 24 Sep 2025 03:31:17 -0700 (PDT)
Received: from [10.1.32.53] (e122027.cambridge.arm.com [10.1.32.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0077E3F66E;
 Wed, 24 Sep 2025 03:31:23 -0700 (PDT)
Message-ID: <30f56d2a-941c-4876-90e6-c7054b51ec10@arm.com>
Date: Wed, 24 Sep 2025 11:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Defer scheduler entitiy destruction to queue
 release
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>
References: <20250919164436.531930-1-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250919164436.531930-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 19/09/2025 17:43, Adrián Larumbe wrote:
> Commit de8548813824 ("drm/panthor: Add the scheduler logical block")
> handled destruction of a group's queues' drm scheduler entities early
> into the group destruction procedure.
> 
> However, that races with the group submit ioctl, because by the time
> entities are destroyed (through the group destroy ioctl), the submission
> procedure might've already obtained a group handle, and therefore the
> ability to push jobs into entities. This is met with a DRM error message
> within the drm scheduler core as a situation that should never occur.
> 
> Fix by deferring drm scheduler entity destruction to queue release time.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Looks good - I can't figure out why we had the early destruction, this
is more simple and safer.

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 0cc9055f4ee5..f5e01cb16cfc 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -898,8 +898,7 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
>  	if (IS_ERR_OR_NULL(queue))
>  		return;
>  
> -	if (queue->entity.fence_context)
> -		drm_sched_entity_destroy(&queue->entity);
> +	drm_sched_entity_destroy(&queue->entity);
>  
>  	if (queue->scheduler.ops)
>  		drm_sched_fini(&queue->scheduler);
> @@ -3609,11 +3608,6 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
>  	if (!group)
>  		return -EINVAL;
>  
> -	for (u32 i = 0; i < group->queue_count; i++) {
> -		if (group->queues[i])
> -			drm_sched_entity_destroy(&group->queues[i]->entity);
> -	}
> -
>  	mutex_lock(&sched->reset.lock);
>  	mutex_lock(&sched->lock);
>  	group->destroyed = true;

