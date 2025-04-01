Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02ABA77E60
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 16:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF7D10E5C1;
	Tue,  1 Apr 2025 14:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Vt60qDLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA5710E5FD;
 Tue,  1 Apr 2025 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dz4AjBZl0FeY67rC7WIKCKabLEHdUSe+H9IOtc9JH2s=; b=Vt60qDLKSAn1NOAbU28KBaJ8e8
 MvR9A/Qqpv0c1V8s4hTpsmsO+1fDszm0aXEoOyFV58b0ha97OU0oenzbKU1Y+nEi8tDPpFpE1wZqO
 8QXLwy/cBeOsPZWi5m61WoPmERo1PAwCsTJ/XkLzy32xQw+DQV8GK0IA5v4efm7fwZ40TMg86bJrn
 HF9NARq/mwuOnVlCl3zQ32OYt+DsQiXB9AEKSuJ6XIQlKbVK9JKvB55/khqE50uI7O8o7GRIrx7dk
 M0W0vKLeujpvBx6nsymG9uRUnVC06s7Gc6Okoqj1bQ3zNhKGvzT/5dvEmKYtK5qoyx3IDZ7E11Ivf
 Pxoym+1w==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tzd5a-009r7m-Oj; Tue, 01 Apr 2025 16:59:42 +0200
Message-ID: <030635b9-d491-4e54-92dc-072e35b47e64@igalia.com>
Date: Tue, 1 Apr 2025 15:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 04/14] drm/sched: Clarify locked section in
 drm_sched_rq_select_entity_fifo
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
 <20250331201705.60663-5-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250331201705.60663-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 31/03/2025 21:16, Tvrtko Ursulin wrote:
> Rq->lock only protects the tree walk so lets move the rest out.

I retract this one, reinit_completion has to be in the locked section 
too. Next posting will be rebased accordingly but I will hold off 
sending it out until more comments are received.

Regards,

Tvrtko

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 31 ++++++++++++++------------
>   1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f593b88ab02c..357133e6d4d0 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -326,29 +326,32 @@ static struct drm_sched_entity *
>   drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>   				struct drm_sched_rq *rq)
>   {
> +	struct drm_sched_entity *entity = NULL;
>   	struct rb_node *rb;
>   
>   	spin_lock(&rq->lock);
>   	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> -		struct drm_sched_entity *entity;
> -
>   		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> -		if (drm_sched_entity_is_ready(entity)) {
> -			/* If we can't queue yet, preserve the current entity in
> -			 * terms of fairness.
> -			 */
> -			if (!drm_sched_can_queue(sched, entity)) {
> -				spin_unlock(&rq->lock);
> -				return ERR_PTR(-ENOSPC);
> -			}
> -
> -			reinit_completion(&entity->entity_idle);
> +		if (drm_sched_entity_is_ready(entity))
>   			break;
> -		}
> +		else
> +			entity = NULL;
>   	}
>   	spin_unlock(&rq->lock);
>   
> -	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> +	if (!entity)
> +		return NULL;
> +
> +	/*
> +	 * If scheduler cannot take more jobs signal the caller to not consider
> +	 * lower priority queues.
> +	 */
> +	if (!drm_sched_can_queue(sched, entity))
> +		return ERR_PTR(-ENOSPC);
> +
> +	reinit_completion(&entity->entity_idle);
> +
> +	return entity;
>   }
>   
>   /**

