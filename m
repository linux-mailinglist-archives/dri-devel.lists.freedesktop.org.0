Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224819BEF3F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 14:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05B310E6E9;
	Wed,  6 Nov 2024 13:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D451710E6E9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 13:40:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44AA4497;
 Wed,  6 Nov 2024 05:40:55 -0800 (PST)
Received: from [10.57.91.71] (unknown [10.57.91.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48F823F66E;
 Wed,  6 Nov 2024 05:40:23 -0800 (PST)
Message-ID: <63b14dd5-2049-40e7-b19e-9392efc53ef2@arm.com>
Date: Wed, 6 Nov 2024 13:40:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Lock XArray when getting entries for heap
 and VM
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>
References: <20241106120748.290697-1-liviu.dudau@arm.com>
 <20d75e2c-c5a5-48c3-ac99-a9e15f19b872@arm.com>
 <20241106143402.4bbaea96@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241106143402.4bbaea96@collabora.com>
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

On 06/11/2024 13:34, Boris Brezillon wrote:
> On Wed, 6 Nov 2024 13:17:29 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 06/11/2024 12:07, Liviu Dudau wrote:
>>> Similar to cac075706f29 ("drm/panthor: Fix race when converting
>>> group handle to group object") we need to use the XArray's internal
>>> locking when retrieving a pointer from there for heap and vm.
>>>
>>> Reported-by: Jann Horn <jannh@google.com>
>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: Steven Price <steven.price@arm.com>
>>> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_heap.c | 15 +++++++++++++--
>>>  drivers/gpu/drm/panthor/panthor_mmu.c  |  2 ++
>>>  2 files changed, 15 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
>>> index 3796a9eb22af2..fe0bcb6837f74 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_heap.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
>>> @@ -351,6 +351,17 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
>>>  	return ret;
>>>  }
>>>  
>>> +static struct panthor_heap *panthor_heap_from_id(struct pathor_heap_pool *pool, u32 id)
>>> +{
>>> +	struct panthor_heap *heap;
>>> +
>>> +	xa_lock(&pool->xa);
>>> +	heap = xa_load(&pool->xa, id);
>>> +	xa_unlock(&pool->va);
>>> +
>>> +	return heap;
>>> +}  
>>
>> This locking doesn't actually achieve anything - XArray already deals
>> with the concurrency (with RCU), and if we're doing nothing more than an
>> xa_load() then we don't need (extra) locking (unless using the __
>> prefixed functions).
>>
>> And, as Boris has pointed out, pool->lock is held. As you mention in
>> your email the missing bit might be panthor_heap_pool_release() - if
>> it's not holding a lock then the heap could be freed immediately after
>> panthor_heap_from_id() returns (even with the above change).
> 
> Hm, if we call panthor_heap_from_id(), that means we have a heap pool to
> pass, and incidentally, we're supposed to hold a ref on this pool. So I
> don't really see how the heap pool can go away, unless someone messed
> up with the refcounting in the meantime.

No I'm not sure how it could happen... ;) Hence the "might" - I'd
assumed Liviu had a good reason for thinking there might be a
race/missing ref.

Really it's panthor_heap_destroy_locked() that we need to consider
racing with - as that can remove (and free) an entry from the XArray. It
might be worth putting an lockdep annotation in there to check that the
lock is indeed held. But the code currently looks correct.

Steve

>>
>> Steve
>>
>>> +
>>>  /**
>>>   * panthor_heap_return_chunk() - Return an unused heap chunk
>>>   * @pool: The pool this heap belongs to.
>>> @@ -375,7 +386,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
>>>  		return -EINVAL;
>>>  
>>>  	down_read(&pool->lock);
>>> -	heap = xa_load(&pool->xa, heap_id);
>>> +	heap = panthor_heap_from_id(pool, heap_id);
>>>  	if (!heap) {
>>>  		ret = -EINVAL;
>>>  		goto out_unlock;
>>> @@ -438,7 +449,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
>>>  		return -EINVAL;
>>>  
>>>  	down_read(&pool->lock);
>>> -	heap = xa_load(&pool->xa, heap_id);
>>> +	heap = panthor_heap_from_id(pool, heap_id);
>>>  	if (!heap) {
>>>  		ret = -EINVAL;
>>>  		goto out_unlock;
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> index 8ca85526491e6..8b5cda9d21768 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> @@ -1580,7 +1580,9 @@ panthor_vm_pool_get_vm(struct panthor_vm_pool *pool, u32 handle)
>>>  {
>>>  	struct panthor_vm *vm;
>>>  
>>> +	xa_lock(&pool->xa);
>>>  	vm = panthor_vm_get(xa_load(&pool->xa, handle));
>>> +	xa_unlock(&pool->va);
>>>  
>>>  	return vm;
>>>  }  
>>
> 

