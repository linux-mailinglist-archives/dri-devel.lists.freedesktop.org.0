Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F42CBDAE2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 13:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7561510E458;
	Mon, 15 Dec 2025 12:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Fx+/VycQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8E910E452
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765800242;
 bh=eYOwTSgG8D6Vu2T3lV02MEYHN0uSxZWDnIDmBNfxmGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fx+/VycQNIjyQDOZTzAQag3fFUtFStbsDBGGugPaP5t1iTUzUCmJz7myFU9hzQAJb
 PcypJp1YmV48TvlPWee0Vjknlux/oypTgABm0TKJ25E1rX7UKb3WliCljByAkmGf+a
 o3w5ApDqUK6cmdI+3O3r3IJi4QwMGr7Xoy0ZPYFGczQnwrnc0jfu2mhq5hTfK5gklR
 76kTrD10EbjDq6BWqqRTERBFEUDxi86kOgucz4U19wuHksa8ar40UCU+Yg+tz8fr0D
 Bh2KH3k3awLHYgs+KaurtXQq1fKFL3AoiXAIaC17oc/8uqavnhQ7KoWZakOtjhPfrv
 Ln51vnyl7uyMw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B00117E11FB;
 Mon, 15 Dec 2025 13:04:02 +0100 (CET)
Date: Mon, 15 Dec 2025 13:03:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Paul Toadere
 <paul.toadere@arm.com>
Subject: Re: [PATCH v1 1/5] drm/panthor: Implement CS_FAULT propagation to
 userspace
Message-ID: <20251215130356.0e1a25ee@fedora>
In-Reply-To: <20251215115457.2137485-2-lukas.zapolskas@arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
 <20251215115457.2137485-2-lukas.zapolskas@arm.com>
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

On Mon, 15 Dec 2025 11:54:53 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> From: Paul Toadere <paul.toadere@arm.com>
> 
> Though faulted queues do not prevent further submission, the
> recoverable faults may have further consequences which are
> worth recording and providing to the user.
> 
> Signed-off-by: Paul Toadere <paul.toadere@arm.com>
> Co-developed-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 18 +++++++++++++++---
>  include/uapi/drm/panthor_drm.h          | 11 +++++++++--
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index a17b067a0439..eb8841beba39 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -569,6 +569,14 @@ struct panthor_group {
>  	/** @fatal_queues: Bitmask reflecting the queues that hit a fatal exception. */
>  	u32 fatal_queues;
>  
> +	/**
> +	 * @fault_queues: Bitmask reflecting the queues that hit a recoverable exception.
> +	 *
> +	 * This field is reset when the GROUP_GET_STATE ioctl is used to collect the fault
> +	 * information.
> +	 */
> +	u32 fault_queues;

s/fault_queues/faulty_queues/ ?

> +
>  	/** @tiler_oom: Mask of queues that have a tiler OOM event to process. */
>  	atomic_t tiler_oom;
>  
> @@ -1553,6 +1561,8 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
>  	if (group) {
>  		drm_warn(&ptdev->base, "CS_FAULT: pid=%d, comm=%s\n",
>  			 group->task_info.pid, group->task_info.comm);
> +
> +		group->fault_queues |= BIT(cs_id);
>  	}
>  
>  	drm_warn(&ptdev->base,
> @@ -3807,9 +3817,6 @@ int panthor_group_get_state(struct panthor_file *pfile,
>  	struct panthor_scheduler *sched = ptdev->scheduler;
>  	struct panthor_group *group;
>  
> -	if (get_state->pad)
> -		return -EINVAL;
> -
>  	group = group_from_handle(gpool, get_state->group_handle);
>  	if (!group)
>  		return -EINVAL;
> @@ -3825,6 +3832,11 @@ int panthor_group_get_state(struct panthor_file *pfile,
>  	}
>  	if (group->innocent)
>  		get_state->state |= DRM_PANTHOR_GROUP_STATE_INNOCENT;
> +	if (group->fault_queues) {
> +		get_state->state |= DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT;
> +		get_state->fault_queues = group->fault_queues;
> +		group->fault_queues = 0;
> +	}
>  	mutex_unlock(&sched->lock);
>  
>  	group_put(group);
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index e238c6264fa1..77262d2b9672 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -965,6 +965,13 @@ enum drm_panthor_group_state_flags {
>  	 * DRM_PANTHOR_GROUP_STATE_FATAL_FAULT is not.
>  	 */
>  	DRM_PANTHOR_GROUP_STATE_INNOCENT = 1 << 2,
> +
> +	/**
> +	 * @DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT: Group had recoverable faults.
> +	 *
> +	 * When a group ends up with this flag set, jobs can still be submitted to its queues.
> +	 */
> +	DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT = 1 << 3,
>  };
>  
>  /**
> @@ -986,8 +993,8 @@ struct drm_panthor_group_get_state {
>  	/** @fatal_queues: Bitmask of queues that faced fatal faults. */
>  	__u32 fatal_queues;
>  
> -	/** @pad: MBZ */
> -	__u32 pad;
> +	/** @fatal_queues: Bitmask of queues that faced fatal faults. */

s/fatal/recoverable/

> +	__u32 fault_queues;
>  };
>  
>  /**

