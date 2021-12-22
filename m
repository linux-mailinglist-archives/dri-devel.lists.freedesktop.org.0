Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB1747D7E8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08C110E27B;
	Wed, 22 Dec 2021 19:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E618A10E226;
 Wed, 22 Dec 2021 19:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 37FFC3F598;
 Wed, 22 Dec 2021 20:43:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.662
X-Spam-Level: 
X-Spam-Status: No, score=-2.662 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.563,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbRFFNYW0Atd; Wed, 22 Dec 2021 20:43:42 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id BFE343F586;
 Wed, 22 Dec 2021 20:43:24 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.198.151.52])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 30300362832;
 Wed, 22 Dec 2021 20:43:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1640202204; bh=LBqZR+hgmNSLdCriux7Yi0RI90+wM0z7yEvOB61JdyY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P885toWAuXQaFxf+MDFpV9XCH/0y5UdSTSP3/B7qb6IsoRgWXdls/RKy5hbXkcuxy
 Cw4m1O+Ha1BYUaVnIO+/anO21TrB6uo5RBPY0SYjcqxyyPTb2Y+LnBDaVw2T+XZX5U
 j2vonU7Xok3cG//pDUqhZXNM8VoVeJAG/pt+FWo4=
Message-ID: <0068b80d-1b6b-6ec7-6b06-0a309626312c@shipmail.org>
Date: Wed, 22 Dec 2021 20:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use trylock instead of blocking
 lock for __i915_gem_free_objects.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20211222155622.2960379-1-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20211222155622.2960379-1-maarten.lankhorst@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/22/21 16:56, Maarten Lankhorst wrote:
> Convert free_work into delayed_work, similar to ttm to allow converting the
> blocking lock in __i915_gem_free_objects to a trylock.
>
> Unlike ttm, the object should already be idle, as it's kept alive
> by a reference through struct i915_vma->active, which is dropped
> after all vma's are idle.
>
> Because of this, we can use a no wait by default, or when the lock
> is contested, we use ttm's 10 ms.
>
> The trylock should only fail when the object is sharing it's resv with
> other objects, and typically objects are not kept locked for a long
> time, so we can safely retry on failure.
>
> Fixes: be7612fd6665 ("drm/i915: Require object lock when freeing pages during destruction")
> Testcase: igt/gem_exec_alignment/pi*
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 14 ++++++++++----
>   drivers/gpu/drm/i915/i915_drv.h            |  4 ++--
>   2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 39cd563544a5..d87b508b59b1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -331,7 +331,13 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
>   			continue;
>   		}
>   
> -		i915_gem_object_lock(obj, NULL);
> +		if (!i915_gem_object_trylock(obj, NULL)) {
> +			/* busy, toss it back to the pile */
> +			if (llist_add(&obj->freed, &i915->mm.free_list))
> +				queue_delayed_work(i915->wq, &i915->mm.free_work, msecs_to_jiffies(10));

i915->wq is ordered. From what I can tell, with queue_delayed_work(), 
the work doesn't get inserted into the queue order until the delay 
expires, right? So we don't unnecessarily hold up other objects getting 
freed?

> +			continue;
> +		}
> +
>   		__i915_gem_object_pages_fini(obj);
>   		i915_gem_object_unlock(obj);
>   		__i915_gem_free_object(obj);
> @@ -353,7 +359,7 @@ void i915_gem_flush_free_objects(struct drm_i915_private *i915)
>   static void __i915_gem_free_work(struct work_struct *work)
>   {
>   	struct drm_i915_private *i915 =
> -		container_of(work, struct drm_i915_private, mm.free_work);
> +		container_of(work, struct drm_i915_private, mm.free_work.work);
>   
>   	i915_gem_flush_free_objects(i915);
>   }
> @@ -385,7 +391,7 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
>   	 */
>   
>   	if (llist_add(&obj->freed, &i915->mm.free_list))
> -		queue_work(i915->wq, &i915->mm.free_work);
> +		queue_delayed_work(i915->wq, &i915->mm.free_work, 0);
>   }
>   
>   void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
> @@ -710,7 +716,7 @@ bool i915_gem_object_placement_possible(struct drm_i915_gem_object *obj,
>   
>   void i915_gem_init__objects(struct drm_i915_private *i915)
>   {
> -	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
> +	INIT_DELAYED_WORK(&i915->mm.free_work, __i915_gem_free_work);
>   }
>   
>   void i915_objects_module_exit(void)
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index c8fddb7e61c9..beeb42a14aae 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -465,7 +465,7 @@ struct i915_gem_mm {
>   	 * List of objects which are pending destruction.
>   	 */
>   	struct llist_head free_list;
> -	struct work_struct free_work;
> +	struct delayed_work free_work;
>   	/**
>   	 * Count of objects pending destructions. Used to skip needlessly
>   	 * waiting on an RCU barrier if no objects are waiting to be freed.
> @@ -1625,7 +1625,7 @@ static inline void i915_gem_drain_freed_objects(struct drm_i915_private *i915)
>   	 * armed the work again.
>   	 */
>   	while (atomic_read(&i915->mm.free_count)) {
> -		flush_work(&i915->mm.free_work);
> +		flush_delayed_work(&i915->mm.free_work);
>   		flush_delayed_work(&i915->bdev.wq);
>   		rcu_barrier();
>   	}

Otherwise LGTM.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>




