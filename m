Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DBC6AC5D5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 16:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B58B10E25A;
	Mon,  6 Mar 2023 15:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EE110E163
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678117604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HnRnJzVkQ05cIBfaW/UIWxfgz32C3WXvJ7LIg8LN0Ks=;
 b=DT06uiUh2jnGtnGg5uXpRHcWYOTkeI3B3ITr942wjydUh7TQr0mUYIrTbjfGGQeyifhPUC
 5zdbxbFALnvX9bOl0kvYlTxwAFsWiHzEmQij6A5KyTwRZu5NQN8g6te1gGlqHHbY2U3AHr
 eQCk3ijiYljXrWq6Pg0uAAW6SbgWaKg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-jkDV2i5zO1qpN8QmOnrDPg-1; Mon, 06 Mar 2023 10:46:43 -0500
X-MC-Unique: jkDV2i5zO1qpN8QmOnrDPg-1
Received: by mail-ed1-f71.google.com with SMTP id
 g2-20020a056402320200b004e98d45ee7dso2666213eda.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 07:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117602;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HnRnJzVkQ05cIBfaW/UIWxfgz32C3WXvJ7LIg8LN0Ks=;
 b=xGjVecdSK9PVEtkpAH+SaDOAF5NJx+/XqTFvl2t95zwAkU1mIzVBtJieeutP/FM03r
 f1wZIiHpFUbaTCAFFyw81xvFgfklFxvSZTbcdr3TI0D+RS0uaebQVHSdKzq8k5X8h4aF
 Okqd/jm/mbDIXRE24FToLmnqAZpXI1usr+/mXKeh+8/TyOIHYXSBwmBgNN7xxu8Q0oDk
 4UaWZVUXxoQ3/ee/I/EaUFUDlcKtSvrxWzMnN3kJSsNeFQ8GDq7cmp9+hoZZsTH1netg
 rA9+AnqZiZ/5fsK/lwmoTQfxl+cX1ObRIMX6PNXSgc7iDDeKva+OP/fRCpDrckx5C6zn
 WGCQ==
X-Gm-Message-State: AO0yUKXXmFMZA8bvyevIm4vTA/IhmBYaqFpXhdFeIJtb/9uvflw/HWOD
 UJcb8UVvWaxlLRwKWRwlD2uqbKx9DSvKO538nGkoHv6pz/9S5cM4HQsSWsWW5oS41iJ5OnoGAtE
 EF7JlCGygYL8jMQWaaQGDbGOb+fZW
X-Received: by 2002:a17:907:9484:b0:886:7eae:26c4 with SMTP id
 dm4-20020a170907948400b008867eae26c4mr14437827ejc.5.1678117601817; 
 Mon, 06 Mar 2023 07:46:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/2ddl8EU3rqQtMdbt4EZqi8jX/47toLcTtvhHsfv/bif2UoFZYVciZw7WK6Z4T7es63iiZNg==
X-Received: by 2002:a17:907:9484:b0:886:7eae:26c4 with SMTP id
 dm4-20020a170907948400b008867eae26c4mr14437780ejc.5.1678117601395; 
 Mon, 06 Mar 2023 07:46:41 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a170906b09600b008d9ddd2da88sm4723069ejy.6.2023.03.06.07.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:46:40 -0800 (PST)
Message-ID: <87be9261-1206-75db-6aeb-27abe6e05821@redhat.com>
Date: Mon, 6 Mar 2023 16:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <20230221182050.day6z5ge2e3dxerv@revolver>
 <ce3ee7f2-e8a3-80eb-9bca-cd465f7f332e@redhat.com>
 <20230223190941.bkkloowmvqjiu6d7@revolver>
 <0868bbeb-11b4-b832-a601-f289278e3e76@redhat.com>
 <20230302023829.kcxyukt7guacr7xg@revolver>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230302023829.kcxyukt7guacr7xg@revolver>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 3/2/23 03:38, Liam R. Howlett wrote:
> * Danilo Krummrich <dakr@redhat.com> [230227 08:17]:
> 
> ...
>>>> Would this variant be significantly more efficient?
>>>
>>> Well, what you are doing is walking the tree to see if there's anything
>>> there... then re-walking the tree to store it.  So, yes, it's much more
>>> efficient..  However, writing is heavier.  How much of the time is spent
>>> walking vs writing depends on the size of the tree, but it's rather easy
>>> to do this in a single walk of the tree so why wouldn't you?
>>
>> I will, I was just curious about how much of an impact it has.
>>
>>>
>>>>
>>>> Also, would this also work while already walking the tree?
>>>
>>> Yes, to an extent.  If you are at the correct location in the tree, you
>>> can write to that location.  If you are not in the correct location and
>>> try to write to the tree then things will go poorly..  In this scenario,
>>> we are very much walking the tree and writing to it in two steps.
>>>
>>>>
>>>> To remove an entry while walking the tree I have a separate function
>>>> drm_gpuva_iter_remove(). Would I need something similar for inserting
>>>> entries?
>>>
>>> I saw that.  Your remove function uses the erase operation which is
>>> implemented as a walk to that location and a store of a null over the
>>> range that is returned.  You do not need a function to insert an entry
>>> if the maple state is at the correct location, and that doesn't just
>>> mean setting mas.index/mas.last to the correct value.  There is a node &
>>> offset saved in the maple state that needs to be in the correct
>>> location.  If you store to that node then the node may be replaced, so
>>> other iterators that you have may become stale, but the one you used
>>> execute the store operation will now point to the new node with the new
>>> entry.
>>>
>>>>
>>>> I already provided this example in a separate mail thread, but it may makes
>>>> sense to move this to the mailing list:
>>>>
>>>> In __drm_gpuva_sm_map() we're iterating a given range of the tree, where the
>>>> given range is the size of the newly requested mapping. __drm_gpuva_sm_map()
>>>> invokes a callback for each sub-operation that needs to be taken in order to
>>>> fulfill this mapping request. In most cases such a callback just creates a
>>>> drm_gpuva_op object and stores it in a list.
>>>>
>>>> However, drivers can also implement the callback, such that they directly
>>>> execute this operation within the callback.
>>>>
>>>> Let's have a look at the following example:
>>>>
>>>>        0     a     2
>>>> old: |-----------|       (bo_offset=n)
>>>>
>>>>              1     b     3
>>>> req:       |-----------| (bo_offset=m)
>>>>
>>>>        0  a' 1     b     3
>>>> new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
>>>>
>>>> This would result in the following operations.
>>>>
>>>> __drm_gpuva_sm_map() finds entry "a" and calls back into the driver
>>>> suggesting to re-map "a" with the new size. The driver removes entry "a"
>>>> from the tree and adds "a'"
>>>
>>> What you have here won't work.  The driver will cause your iterators
>>> maple state to point to memory that is freed.  You will either need to
>>> pass through your iterator so that the modifications can occur with that
>>> maple state so it remains valid, or you will need to invalidate the
>>> iterator on every modification by the driver.
>>>
>>> I'm sure the first idea you have will be to invalidate the iterator, but
>>> that is probably not the way to proceed.  Even ignoring the unclear
>>> locking of two maple states trying to modify the tree, this is rather
>>> inefficient - each invalidation means a re-walk of the tree.  You may as
>>> well not use an iterator in this case.
>>>
>>> Depending on how/when the lookups occur, you could still iterate over
>>> the tree and let the driver modify the ending of "a", but leave the tree
>>> alone and just store b over whatever - but the failure scenarios may
>>> cause you grief.
>>>
>>> If you pass the iterator through, then you can just use it to do your
>>> writes and keep iterating as if nothing changed.
>>
>> Passing through the iterater clearly seems to be the way to go.
>>
>> I assume that if the entry to insert isn't at the location of the iterator
>> (as in the following example) we can just keep walking to this location my
>> changing the index of the mas and calling mas_walk()?
> 
> no.  You have to mas_set() to the value and walk from the top of the
> tree.  mas_walk() walks down, not from side to side - well, it does go
> forward within a node (increasing offset), but if you hit the node limit
> then you have gotten yourself in trouble.
> 
>> This would also imply
>> that the "outer" tree walk continues after the entry we just inserted,
>> right?
> 
> I don't understand the "outer" tree walk statement.

I think I could have phrased this better. I just mean "my" iterator 
walking each tree entry rather than an internal tree walk, as it happens 
in e.g. mas_walk() or mas_find().

> 
>>
>>             1     a     3
>> old:       |-----------| (bo_offset=n)
>>
>>       0     b     2
>> req: |-----------|       (bo_offset=m)
>>
>>       0     b     2  a' 3
>> new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
>>
>> Again, after finding "a", we want to remove it and insert "a'" instead.
> 
> Ah, so you could walk to 0, see that it's NULL from 0 - 1, call
> mas_next() and get "a" from 1 - 3, write "a'" from 2 - 3:
> 
>          0     1  a   2  a' 3
> broken: |-----|------|-----| (a is broken in this 1/2 step)
> 
> mas_set_range(&mas, 0, 2); /* Resets the tree location to MAS_START */
> mas_store(&mas, b);
>          0     b     2  a' 3
> new:    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> 
> 
> You can *probably* also get away with this:
> 
> walk to 0, see that it's NULL from 0 - 1, call mas_next() and get "a"
> from 1 - 3, write "a'" from 2 - 3:
> 
>          0     1  a   2  a' 3
> broken: |-----|------|-----| (a is broken in this 1/2 step)
> 
> mas_prev(&mas, 0); /* Looking at broken a from 1-2.
> mas_store(&mas, NULL); /* NULL is expanded on write to 0-2.
>              0    NULL   2  a' 3
> broken':    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> 
> mas_store(&mas, b);
>          0     b     2  a' 3
> new:    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> 
> You may want to iterate backwards and do the writes as you go until you
> have enough room.. it really depends how you want to go about doing
> things.

I see, again thanks for explaining.

I think I would prefer to either (1) have generic insert() function with 
a similar behavior as when iterating through a list or (2) have a 
function dedicated to the "split" use case.

1) When iterating the tree inserting entries at arbitrary locations 
should not influence the next iteration step. Unless the new entry 
really is the next entry, but that'd be optional. I don't see a use case 
for that.

2) Similar to how you broke it down above I could imagine a function 
dedicated to the split operation. This would be similar to what you 
mention for mmap below. However, it wouldn't be a single operation.

The GPUVA manager provides sub-operations to the driver for a single 
mapping request. Those can be an arbitrary amount of unmaps (for 
mappings "in the way", as you say below), one or two remaps (for splits 
at the beginning or end or both) and exactly one map (which is the last 
sub-operation adding the newly requested mapping).

Remaps consist out of the mapping to unmap and one or two new mappings 
to map. The only case where a remap sub-op has two new mappings to map 
is when the newly requested mapping is enclosed by a single existing 
mapping. If we overlap a mapping at the beginning and another one at the 
end this would be two separate remap sub-ops. Of course, between the two 
remaps there could be an arbitrary amount of unmap sub-ops.

Unmap sub-ops are simple, I just need to remove a single entry in the 
tree. drm_gpuva_iter_remove() should be fine for that.

For remap sub-ops, I would need a function that removes an entry and 
then adds one or two new entries within the range of the removed one. 
The next loop iteration should then continue at the entry (is any) after 
the range of the removed one.

However, I'm unsure how to implement this. Would I need to just do a 
mas_store() of the new entry/entries (since the nodes should already be 
allocated) and then clean up the nodes that are left with mas_erase()?

Let's say there is an entry A = [0 - 5] and I want to replace it with B 
= [0 - 1] and C = [4 - 5].

Could I just store B and C and then somehow clean up the range [2 - 3]?

Maybe 1) would be the most flexible way, however, if 2) can be 
implemented more efficiently that's perfectly fine too.

> 
>>
>>>
>>>>
>>>> __drm_gpuva_sm_map(), ideally, continues the loop searching for nodes
>>>> starting from the end of "a" (which is 2) till the end of the requested
>>>> mapping "b" (which is 3). Since it doesn't find any other mapping within
>>>> this range it calls back into the driver suggesting to finally map "b".
>>>>
>>>> If there would have been another mapping between 2 and 3 it would have
>>>> called back into the driver asking to unmap this mapping beforehand.
>>>>
>>>> So, it boils down to re-mapping as described at the beginning (and
>>>> analogously at the end) of a new mapping range and removing of entries that
>>>> are enclosed by the new mapping range.
>>>
>>> I assume the unmapped area is no longer needed, and the 're-map' is
>>> really a removal of information?  Otherwise I'd suggest searching for a
>>> gap which fits your request.  What you have here is a lot like
>>> "MAP_FIXED" vs top-down/bottom-up search in the VMA code, this seems to
>>> be like your __drm_gpuva_sm_map() and the drm mm range allocator with
>>> DRM_MM_INSERT_LOW, and DRM_MM_INSERT_HIGH.
>>>
>>> Why can these split/unmappings fail?  Is it because they are still
>>> needed?
>>>
>>
>> You mean the check before the mas_*() operations in drm_gpuva_insert()?
> 
> Yes, the callbacks.
> 
>>
>> Removing entries should never fail, inserting entries should fail when the
>> caller tries to store to an area outside of the VA space (it doesn't
>> necessarily span the whole 64-bit space), a kernel reserved area of the VA
>> space, is not in any pre-allocated range of the VA space (if regions are
>> enabled) or an entry already exists at that location.
> 
> In the mmap code, I have to deal with splitting the start/end VMA and
> removing any VMAs in the way.  I do this by making a 'detached' tree
> that is dealt with later, then just overwriting the area with one
> mas_store() operation.  Would something like that work for you?

I think this is pretty much the same thing I want to do, hence this 
should work. However, this would require more state keeping for the 
whole iteration, I guess. Drivers shouldn't know how the GPUVA manager 
keeps track of mappings internally (and hence they shouldn't know about 
the maple tree). If I could get away with something similar to what I 
wrote above, I think I'd probably not add this extra complexity, unless 
there are relevant performance reasons to do so.

> 
>>
>>>>
>>>>>> +	if (unlikely(ret))
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	va->mgr = mgr;
>>>>>> +	va->region = reg;
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_gpuva_insert);
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_gpuva_remove - remove a &drm_gpuva
>>>>>> + * @va: the &drm_gpuva to remove
>>>>>> + *
>>>>>> + * This removes the given &va from the underlaying tree.
>>>>>> + */
>>>>>> +void
>>>>>> +drm_gpuva_remove(struct drm_gpuva *va)
>>>>>> +{
>>>>>> +	MA_STATE(mas, &va->mgr->va_mt, va->va.addr, 0);
>>>>>> +
>>>>>> +	mas_erase(&mas);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_gpuva_remove);
>>>>>> +
>>>>> ...
>>>>>
>>>>>> +/**
>>>>>> + * drm_gpuva_find_first - find the first &drm_gpuva in the given range
>>>>>> + * @mgr: the &drm_gpuva_manager to search in
>>>>>> + * @addr: the &drm_gpuvas address
>>>>>> + * @range: the &drm_gpuvas range
>>>>>> + *
>>>>>> + * Returns: the first &drm_gpuva within the given range
>>>>>> + */
>>>>>> +struct drm_gpuva *
>>>>>> +drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
>>>>>> +		     u64 addr, u64 range)
>>>>>> +{
>>>>>> +	MA_STATE(mas, &mgr->va_mt, addr, 0);
>>>>>> +
>>>>>> +	return mas_find(&mas, addr + range - 1);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_gpuva_find_first);
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_gpuva_find - find a &drm_gpuva
>>>>>> + * @mgr: the &drm_gpuva_manager to search in
>>>>>> + * @addr: the &drm_gpuvas address
>>>>>> + * @range: the &drm_gpuvas range
>>>>>> + *
>>>>>> + * Returns: the &drm_gpuva at a given &addr and with a given &range
>>>>>
>>>>> Note that mas_find() will continue upwards in the address space if there
>>>>> isn't anything at @addr.  This means that &drm_gpuva may not be at
>>>>> &addr.  If you want to check just at &addr, use mas_walk().
>>>>
>>>> Good catch. drm_gpuva_find() should then either also check for 'va->va.addr
>>>> == addr' as well or, alternatively, use mas_walk(). As above, any reason to
>>>> prefer mas_walk()?
> 
> I think I missed this question last time..
> 
> Internally, mas_find() is just a mas_walk() on the first call, then
> mas_next() for each call after that.  If, during the mas_walk(), there
> is no value at addr, it immediately calls mas_next() to get a value to
> return.  It will continue upwards until the limit is reached (addr +
> range - 1 in your case).
> 
> So if you only want to know if there is something at addr, then it's
> best to use mas_walk() and keep things a bit more efficient.  Then you
> can check mas.last for your end value.
> 
> If you do want the first VMA within the range passed in, then mas_find()
> is the function you want.
> 
>>>>
>>>>>
>>>>>> + */
>>>>>> +struct drm_gpuva *
>>>>>> +drm_gpuva_find(struct drm_gpuva_manager *mgr,
>>>>>> +	       u64 addr, u64 range)
>>>>>> +{
>>>>>> +	struct drm_gpuva *va;
>>>>>> +
>>>>>> +	va = drm_gpuva_find_first(mgr, addr, range);
>>>>>> +	if (!va)
>>>>>> +		goto out;
>>>>>> +
>>>>>> +	if (va->va.range != range)
>>>>>> +		goto out;
>>>>>> +
>>>>>> +	return va;
>>>>>> +
>>>>>> +out:
>>>>>> +	return NULL;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_gpuva_find);
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_gpuva_find_prev - find the &drm_gpuva before the given address
>>>>>> + * @mgr: the &drm_gpuva_manager to search in
>>>>>> + * @start: the given GPU VA's start address
>>>>>> + *
>>>>>> + * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
>>>>>> + *
>>>>>> + * Note that if there is any free space between the GPU VA mappings no mapping
>>>>>> + * is returned.
>>>>>> + *
>>>>>> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
>>>>>> + */
>>>>>> +struct drm_gpuva *
>>>>>> +drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
>>>>>
>>>>> find_prev() usually continues beyond 1 less than the address. I found
>>>>> this name confusing.
>>>>
>>>> Don't really get that, mind explaining?
>>>
>>> When I ask for the previous one in a list or tree, I think the one
>>> before.. but since you are limiting your search from start to start - 1,
>>> you may as well walk to start - 1 and see if one exists.
>>>
>>> Is that what you meant to do here?
>>
>> Yes, I want to know whether there is a previous entry which ends right
>> before the current entry, without a gap between the two.
>>
>>>
>>>>
>>>>> You may as well use mas_walk(), it would be faster.
>>>>
>>>> How would I use mas_walk() for that? If I understand it correctly,
>>>> mas_walk() requires me to know that start address, which I don't know for
>>>> the previous entry.
>>>
>>> mas_walk() walks to the value you specify and returns the entry at that
>>> address, not necessarily the start address, but any address in the
>>> range.
>>>
>>> If you have a tree and store A = [0x1000 - 0x2000] and set your maple
>>> state to walk to 0x1500, mas_walk() will return A, and the maple state
>>> will have mas.index = 0x1000 and mas.last = 0x2000.
>>>
>>> You have set the maple state to start at "start" and called
>>> mas_prev(&mas, start - 1).  start - 1 is the lower limit, so the
>>> internal implementation will walk to start then go to the previous entry
>>> until start - 1.. it will stop at start - 1 and return NULL if there
>>> isn't one there.
>>
>> Thanks for the clarification and all the other very helpful comments and
>> explanations!
>>
> 
> Always glad to help.  The more users the tree has, the more I can see
> where we may need to expand the interface to help others.
> 
> ...
> 

