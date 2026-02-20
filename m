Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHhjM6aemGnJKAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:49:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE40169D6A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0250E10E171;
	Fri, 20 Feb 2026 17:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="o4Hueqg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90A210E171;
 Fri, 20 Feb 2026 17:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1771609760;
 bh=BNOuFt+bAihWbuFxBcEpxQ1sdEuqVjX6Gs2aH0ASIlA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o4Hueqg+rQqRbpOtPVxUxY9fOlAwj2CaI8EvG37K+SSJZrtBsBC9RSC3BBWVgNSYA
 Zq/VM0xAXZ1K+bjgCimjNNW70YC5mq+UiwKmkVPjXkaLCezZX2aTb23Fh/7XWpJtlo
 XMsdCh93SPJzowoFN5vSIaOuMMMd6pVO9xmzHYzV85vrASo5oaRJNdPkoMkoXMS/oT
 C49yu9hsHjmtOOeWCEgrLogunY7KaOlywlN52q3ewMjxXDu2eawg+FnlsmWXshDVQ3
 i2IbHY7hP24BiIsfXTw/nBdu6WOjXJaRgRG+rMitoiW3U54FMAPY4R0kImjdJPYzhN
 vyw8ZP+ZQtsJQ==
Message-ID: <53cbab1c-846d-4be5-96b9-df7c864fa5c7@lankhorst.se>
Date: Fri, 20 Feb 2026 18:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] drm/sa: Split drm_suballoc_new() into SA alloc and
 init helpers
To: Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20260220055519.2485681-5-satyanarayana.k.v.p@intel.com>
 <20260220055519.2485681-6-satyanarayana.k.v.p@intel.com>
 <aZf7616z7z0MOykV@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <aZf7616z7z0MOykV@lstrano-desk.jf.intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lankhorst.se:mid,lankhorst.se:dkim,lankhorst.se:email,intel.com:email,amd.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[lankhorst.se:+]
X-Rspamd-Queue-Id: 3DE40169D6A
X-Rspamd-Action: no action

Hey,

This looks better.

Can be merged through drm-xe, as it's the only user of the new functions if you want.

Acked-by: Maarten Lankhorst <dev@lankhorst.se>

Den 2026-02-20 kl. 07:15, skrev Matthew Brost:
> On Fri, Feb 20, 2026 at 05:55:21AM +0000, Satyanarayana K V P wrote:
>> drm_suballoc_new() currently both allocates the SA object using kmalloc()
>> and searches for a suitable hole in the sub-allocator for the requested
>> size. If SA allocation is done by holding sub-allocator mutex, this design
>> can lead to reclaim safety issues.
>>
>> By splitting the kmalloc() step outside of the critical section, we allow
>> the memory allocation to use GFP_KERNEL (reclaim-safe) while ensuring that
>> the initialization step that holds reclaim-tainted locks (sub-allocator
>> mutex) operates in a reclaim-unsafe context with pre-allocated memory.
>>
>> This separation prevents potential deadlocks where memory reclaim could
>> attempt to acquire locks that are already held during the sub-allocator
>> operations.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>> ---
>> V7 -> V8:
>> - Add missing sa->manager=NULL in the error flow in drm_suballoc_insert()
>> (Matt)
>>
>> V6 -> V7:
>> - Dropped R-B to review again with the new changes.
>> - Dropped drm_suballoc_release() which was introduced in this patch.
>> (Maarten).
>>
>> V5 -> V6:
>> - Renamed drm_suballoc_init() to drm_suballoc_insert() (Maarten).
>>
>> V4 -> V5:
>> - None.
>>
>> V3 -> V4:
>> - None.
>>
>> V2 -> V3:
>> - Updated commit message (Matt, Thomas & Christian).
>> - Removed timeout logic from drm_suballoc_init(). (Thomas & Christian).
>>
>> V1 -> V2:
>> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
>> drm_suballoc_init() (Thomas).
>> ---
>>  drivers/gpu/drm/drm_suballoc.c | 106 ++++++++++++++++++++++++++-------
>>  include/drm/drm_suballoc.h     |   6 ++
>>  2 files changed, 92 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
>> index 879ea33dbbc4..dc9bef3c0419 100644
>> --- a/drivers/gpu/drm/drm_suballoc.c
>> +++ b/drivers/gpu/drm/drm_suballoc.c
>> @@ -293,45 +293,66 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
>>  }
>>  
>>  /**
>> - * drm_suballoc_new() - Make a suballocation.
>> + * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
>> + * @gfp: gfp flags used for memory allocation.
>> + *
>> + * Allocate memory for an uninitialized suballoc object. Intended usage is
>> + * allocate memory for suballoc object outside of a reclaim tainted context
>> + * and then be initialized at a later time in a reclaim tainted context.
>> + *
>> + * @drm_suballoc_free() should be used to release the memory if returned
>> + * suballoc object is in uninitialized state.
>> + *
>> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
>> + */
>> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
>> +{
>> +	struct drm_suballoc *sa;
>> +
>> +	sa = kmalloc(sizeof(*sa), gfp);
>> +	if (!sa)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	sa->manager = NULL;
>> +
>> +	return sa;
>> +}
>> +EXPORT_SYMBOL(drm_suballoc_alloc);
>> +
>> +/**
>> + * drm_suballoc_insert() - Initialize a suballocation and insert a hole.
>>   * @sa_manager: pointer to the sa_manager
>> + * @sa: The struct drm_suballoc.
>>   * @size: number of bytes we want to suballocate.
>> - * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
>> - *       the argument is provided for suballocations from reclaim context or
>> - *       where the caller wants to avoid pipelining rather than wait for
>> - *       reclaim.
>>   * @intr: Whether to perform waits interruptible. This should typically
>>   *        always be true, unless the caller needs to propagate a
>>   *        non-interruptible context from above layers.
>>   * @align: Alignment. Must not exceed the default manager alignment.
>>   *         If @align is zero, then the manager alignment is used.
>>   *
>> - * Try to make a suballocation of size @size, which will be rounded
>> - * up to the alignment specified in specified in drm_suballoc_manager_init().
>> + * Try to make a suballocation on a pre-allocated suballoc object of size @size,
>> + * which will be rounded up to the alignment specified in specified in
>> + * drm_suballoc_manager_init().
>>   *
>> - * Return: a new suballocated bo, or an ERR_PTR.
>> + * Return: zero on success, errno on failure.
>>   */
>> -struct drm_suballoc *
>> -drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>> -		 gfp_t gfp, bool intr, size_t align)
>> +int drm_suballoc_insert(struct drm_suballoc_manager *sa_manager,
>> +			struct drm_suballoc *sa, size_t size,
>> +			bool intr, size_t align)
>>  {
>>  	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
>>  	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
>>  	unsigned int count;
>>  	int i, r;
>> -	struct drm_suballoc *sa;
>>  
>>  	if (WARN_ON_ONCE(align > sa_manager->align))
>> -		return ERR_PTR(-EINVAL);
>> +		return -EINVAL;
>>  	if (WARN_ON_ONCE(size > sa_manager->size || !size))
>> -		return ERR_PTR(-EINVAL);
>> +		return -EINVAL;
>>  
>>  	if (!align)
>>  		align = sa_manager->align;
>>  
>> -	sa = kmalloc(sizeof(*sa), gfp);
>> -	if (!sa)
>> -		return ERR_PTR(-ENOMEM);
>>  	sa->manager = sa_manager;
>>  	sa->fence = NULL;
>>  	INIT_LIST_HEAD(&sa->olist);
>> @@ -348,7 +369,7 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>>  			if (drm_suballoc_try_alloc(sa_manager, sa,
>>  						   size, align)) {
>>  				spin_unlock(&sa_manager->wq.lock);
>> -				return sa;
>> +				return 0;
>>  			}
>>  
>>  			/* see if we can skip over some allocations */
>> @@ -385,8 +406,48 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>>  	} while (!r);
>>  
>>  	spin_unlock(&sa_manager->wq.lock);
>> -	kfree(sa);
>> -	return ERR_PTR(r);
>> +	sa->manager = NULL;
>> +	return r;
>> +}
>> +EXPORT_SYMBOL(drm_suballoc_insert);
>> +
>> +/**
>> + * drm_suballoc_new() - Make a suballocation.
>> + * @sa_manager: pointer to the sa_manager
>> + * @size: number of bytes we want to suballocate.
>> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
>> + *       the argument is provided for suballocations from reclaim context or
>> + *       where the caller wants to avoid pipelining rather than wait for
>> + *       reclaim.
>> + * @intr: Whether to perform waits interruptible. This should typically
>> + *        always be true, unless the caller needs to propagate a
>> + *        non-interruptible context from above layers.
>> + * @align: Alignment. Must not exceed the default manager alignment.
>> + *         If @align is zero, then the manager alignment is used.
>> + *
>> + * Try to make a suballocation of size @size, which will be rounded
>> + * up to the alignment specified in specified in drm_suballoc_manager_init().
>> + *
>> + * Return: a new suballocated bo, or an ERR_PTR.
>> + */
>> +struct drm_suballoc *
>> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>> +		 gfp_t gfp, bool intr, size_t align)
>> +{
>> +	struct drm_suballoc *sa;
>> +	int err;
>> +
>> +	sa = drm_suballoc_alloc(gfp);
>> +	if (IS_ERR(sa))
>> +		return sa;
>> +
>> +	err = drm_suballoc_insert(sa_manager, sa, size, intr, align);
>> +	if (err) {
>> +		drm_suballoc_free(sa, NULL);
>> +		return ERR_PTR(err);
>> +	}
>> +
>> +	return sa;
>>  }
>>  EXPORT_SYMBOL(drm_suballoc_new);
>>  
>> @@ -405,6 +466,11 @@ void drm_suballoc_free(struct drm_suballoc *suballoc,
>>  	if (!suballoc)
>>  		return;
>>  
>> +	if (!suballoc->manager) {
>> +		kfree(suballoc);
>> +		return;
>> +	}
>> +
>>  	sa_manager = suballoc->manager;
>>  
>>  	spin_lock(&sa_manager->wq.lock);
>> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
>> index 7ba72a81a808..29befdda35d2 100644
>> --- a/include/drm/drm_suballoc.h
>> +++ b/include/drm/drm_suballoc.h
>> @@ -53,6 +53,12 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
>>  
>>  void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
>>  
>> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
>> +
>> +int drm_suballoc_insert(struct drm_suballoc_manager *sa_manager,
>> +			struct drm_suballoc *sa, size_t size, bool intr,
>> +			size_t align);
>> +
>>  struct drm_suballoc *
>>  drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>>  		 gfp_t gfp, bool intr, size_t align);
>> -- 
>> 2.43.0
>>

