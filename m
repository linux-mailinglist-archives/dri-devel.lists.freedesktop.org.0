Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02539BFA7DF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 09:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3409D10E6CC;
	Wed, 22 Oct 2025 07:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="X/e4Yd8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4713510E6C9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qBPPrGjT8YjeRj+4gw66VAsO2oG7+WPqHJ1JsvWkV3c=; b=X/e4Yd8G4wX14S0SFmYh0cA6rw
 3O0Kx9GPQLUDpdcwA/9rWkEK70E9mbJImFmRLN1+NqsZ5/Q1+ntjiZskg3LYtHb6sTaFqIvvhjEOr
 DKag0PzF2EjVmdW1D8KENU7BOs5P9DheO8LDWj/9qCZxSrmm2GYvdBr15JgxliAsKE278vWIOmZXz
 3KbdaLDy3NKQl6250ZJGJkZXggGKhqU3lYxBEA+valFgRG9a5lZhkbcoqfvknbfzjcQ+T5cm0OOA7
 gs/tXPbgCN2fe2UVW20oYXgiiAqewy77/86ndJo3OsBwXbKHDOfJ1gF5ukPMXB4Av4uBHQ+JJOL3f
 Edq2eOTA==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vBT4w-00CseB-6l; Wed, 22 Oct 2025 09:16:14 +0200
Message-ID: <26eef700-7997-42e5-b0b9-c03361e05814@igalia.com>
Date: Wed, 22 Oct 2025 08:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix race in drm_sched_entity_select_rq()
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, stable@vger.kernel.org
References: <20251022063402.87318-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20251022063402.87318-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 22/10/2025 07:34, Philipp Stanner wrote:
> In a past bug fix it was forgotten that entity access must be protected
> by the entity lock. That's a data race and potentially UB.
> 
> Move the spin_unlock() to the appropriate position.
> 
> Cc: stable@vger.kernel.org # v5.13+
> Fixes: ac4eb83ab255 ("drm/sched: select new rq even if there is only one v3")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 5a4697f636f2..aa222166de58 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -552,10 +552,11 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   		drm_sched_rq_remove_entity(entity->rq, entity);
>   		entity->rq = rq;
>   	}
> -	spin_unlock(&entity->lock);
>   
>   	if (entity->num_sched_list == 1)
>   		entity->sched_list = NULL;
> +
> +	spin_unlock(&entity->lock);
>   }
>   
>   /**

Agreed, unlock at the end is correct.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Luckily only amdgpu calls drm_sched_entity_modify_sched(), and I am not 
sure if with hypothetical multi-threaded submit it could be possible to 
hit it or not.

One thread would have to clear the sched_list, while another would have 
to have passed the !sched_list at the beginning of the function, and the 
job_queue count and last_scheduled completed guards. Which would mean 
job has to get completed between the unlock and clearing the pointer.

Also, take a look at this when you can please:

https://lore.kernel.org/dri-devel/20240719094730.55301-1-tursulin@igalia.com/

This would also have fixed this issue by removing clearing of 
entity->sched_list. Latter being just a hack to work around the issue of 
confused container ownership rules.

Regards,

Tvrtko

