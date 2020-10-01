Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCC280227
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 17:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B276E21B;
	Thu,  1 Oct 2020 15:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C9216E218
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 15:07:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09EFCD6E;
 Thu,  1 Oct 2020 08:07:20 -0700 (PDT)
Received: from [192.168.1.79] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6DD53F70D;
 Thu,  1 Oct 2020 08:07:18 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: Avoid infinite waits in the
 drm_sched_entity_destroy() path
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20201001141253.1066836-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <f45dcc43-1e6d-6e42-95e8-075fa5447357@arm.com>
Date: Thu, 1 Oct 2020 16:07:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001141253.1066836-1-boris.brezillon@collabora.com>
Content-Language: en-GB
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
Cc: Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/10/2020 15:12, Boris Brezillon wrote:
> If we don't initialize the entity to idle and the entity is never
> scheduled before being destroyed we end up with an infinite wait in the
> destroy path.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

This seems reasonable to me - it looks like in theory if you very 
quickly open, submit a job and close you could trigger this (i.e. if 
drm_sched_main() never actually enters the while loop).

You should CC some other folk as this doesn't just affect Panfrost.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> This is something I noticed while debugging another issue on panfrost
> causing the scheduler to be in a weird state where new entities were no
> longer scheduled. This was causing all userspace threads trying to close
> their DRM fd to be blocked in kernel space waiting for this "entity is
> idle" event. I don't know if that fix is legitimate (now that we fixed
> the other bug we don't seem to end up in that state anymore), but I
> thought I'd share it anyway.
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 146380118962..f8ec277a6aa8 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -73,6 +73,9 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   
>   	init_completion(&entity->entity_idle);
>   
> +	/* We start in an idle state. */
> +	complete(&entity->entity_idle);
> +
>   	spin_lock_init(&entity->rq_lock);
>   	spsc_queue_init(&entity->job_queue);
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
