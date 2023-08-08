Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A23773835
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 08:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040D410E3A6;
	Tue,  8 Aug 2023 06:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F10810E3A6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 06:33:12 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6873f64a290so1465075b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 23:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691476392; x=1692081192;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m1STCrinczuq8FuoUgLs8N4vldOealvmees85dm6MPY=;
 b=DHsGX8t2DlnQTZ3P5OI9n7d2eKbW76xN4tTGVVJSGRA1IM8FeS8yeKRc7hPuylIUq6
 Vn6fFj0Cv1x6zxvq6HdiZeD3sss54GzeWb8hF97LFXrHomN7WJ9YcJ4yAlUPs8k8HgNL
 jvDOSB+a6LFcWjcXHBVF7wtFqF14I5u1bMgCHhYO6BYyHXF5r6kcqyvIScTKejNj9azo
 Dlxz0pBdKdmaGIcMiIhQ+2FswwrIXK2CIvDeChsrdQ0sCkYtUwWfiT2WKOfkpBIAGKTy
 jKW26xAUSVtB349qP1v3gjKBFhibzKHRUcGcdDNMBlsrboMdDTLiQvbJMlgqGN2hazF3
 /EiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691476392; x=1692081192;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m1STCrinczuq8FuoUgLs8N4vldOealvmees85dm6MPY=;
 b=HUyDauLXF1xzX6hkHug9opBHIZ0v0ghhTt/YpuiWGCugN401oy65q2Nx5ee94SH65Q
 yh8JiEU5acnH8i3+HTiKMexw8RPZ82pi5aDTqUUTFIToyXuSH+BPm+CM1wwMNRzhN/P7
 vVPm7QzMfWEvHP2LzR0M8FnIvLK5WAQNvmeTqO1eMcJr//EGbPog2HTOFEnZ7WZllS3R
 qkRU4Fn9DSR5i79wg7oaE58v700Sf7EX2fODcjXWp9Vf7rqcnfFPMhEPzM03s8h3fq56
 EClF/n+eL05P63kw2ndJVSkF0zJ1c+SToHj3wbD8uK5b5ObGY0qmsu2Lk4oKK/nHr87x
 6L1g==
X-Gm-Message-State: ABy/qLZaAhanvFnUooxwjIUHSNCHeA8bZWNlqTnTSsj1RJr/61GEA3L8
 eK5IJm2mjW//k0wPJZim1oW5aw==
X-Google-Smtp-Source: APBJJlEAHd7r+M3vyCUQDMAxEjMveuzSqb/Q6wUuSUNAB0Ns9zs1qKL/YECIY4J9DtcJjA3HpA/s7A==
X-Received: by 2002:a05:6a21:998c:b0:13d:1ebf:5dfc with SMTP id
 ve12-20020a056a21998c00b0013d1ebf5dfcmr38062815pzb.5.1691476391828; 
 Mon, 07 Aug 2023 23:33:11 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 ff12-20020a056a002f4c00b0067f2f7eccdcsm7204570pfb.193.2023.08.07.23.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 23:33:11 -0700 (PDT)
Message-ID: <0e7b16ce-19f9-0c70-4a94-f05cbfee613a@bytedance.com>
Date: Tue, 8 Aug 2023 14:32:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 44/48] mm: shrinker: add a secondary array for
 shrinker_info::{map, nr_deferred}
To: Dave Chinner <david@fromorbit.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-45-zhengqi.arch@bytedance.com>
 <ZNGkcp3Dh8hOiFpk@dread.disaster.area>
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZNGkcp3Dh8hOiFpk@dread.disaster.area>
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 simon.horman@corigine.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, Muchun Song <songmuchun@bytedance.com>,
 yujie.liu@intel.com, vbabka@suse.cz, linux-raid@vger.kernel.org,
 brauner@kernel.org, tytso@mit.edu, gregkh@linuxfoundation.org,
 muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On 2023/8/8 10:12, Dave Chinner wrote:
> On Mon, Aug 07, 2023 at 07:09:32PM +0800, Qi Zheng wrote:
>> Currently, we maintain two linear arrays per node per memcg, which are
>> shrinker_info::map and shrinker_info::nr_deferred. And we need to resize
>> them when the shrinker_nr_max is exceeded, that is, allocate a new array,
>> and then copy the old array to the new array, and finally free the old
>> array by RCU.
>>
>> For shrinker_info::map, we do set_bit() under the RCU lock, so we may set
>> the value into the old map which is about to be freed. This may cause the
>> value set to be lost. The current solution is not to copy the old map when
>> resizing, but to set all the corresponding bits in the new map to 1. This
>> solves the data loss problem, but bring the overhead of more pointless
>> loops while doing memcg slab shrink.
>>
>> For shrinker_info::nr_deferred, we will only modify it under the read lock
>> of shrinker_rwsem, so it will not run concurrently with the resizing. But
>> after we make memcg slab shrink lockless, there will be the same data loss
>> problem as shrinker_info::map, and we can't work around it like the map.
>>
>> For such resizable arrays, the most straightforward idea is to change it
>> to xarray, like we did for list_lru [1]. We need to do xa_store() in the
>> list_lru_add()-->set_shrinker_bit(), but this will cause memory
>> allocation, and the list_lru_add() doesn't accept failure. A possible
>> solution is to pre-allocate, but the location of pre-allocation is not
>> well determined.
> 
> So you implemented a two level array that preallocates leaf
> nodes to work around it? It's remarkable complex for what it does,

Yes, here I have implemented a two level array like the following:

+---------------+--------+--------+-----+
| shrinker_info | unit 0 | unit 1 | ... | (secondary array)
+---------------+--------+--------+-----+
                      ^
                      |
                 +---------------+-----+
                 | nr_deferred[] | map | (leaf array)
                 +---------------+-----+
                 (shrinker_info_unit)

The leaf array is never freed unless the memcg is destroyed. The
secondary array will be resized every time the shrinker id exceeds
shrinker_nr_max.

> I can't help but think a radix tree using a special holder for
> nr_deferred values of zero would end up being simpler...

I tried. If the shrinker uses list_lru, then we can preallocate
xa node where list_lru_one is pre-allocated. But for other types of
shrinkers, the location of pre-allocation is not easy to determine
(Such as deferred_split_shrinker). And we can't force all memcg aware
shrinkers to use list_lru, so I gave up using xarray and implemented the 
above two-level array.

> 
>> Therefore, this commit chooses to introduce a secondary array for
>> shrinker_info::{map, nr_deferred}, so that we only need to copy this
>> secondary array every time the size is resized. Then even if we get the
>> old secondary array under the RCU lock, the found map and nr_deferred are
>> also true, so no data is lost.
> 
> I don't understand what you are trying to describe here. If we get
> the old array, then don't we get either a stale nr_deferred value,
> or the update we do gets lost because the next shrinker lookup will
> find the new array and os the deferred value stored to the old one
> is never seen again?

As shown above, the leaf array will not be freed when shrinker_info is
expanded, so the shrinker_info_unit can be indexed from both the old
and the new shrinker_info->unit[x]. So the updated nr_deferred and map
will not be lost.

> 
>>
>> [1]. https://lore.kernel.org/all/20220228122126.37293-13-songmuchun@bytedance.com/
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
>> ---
> .....
>> diff --git a/mm/shrinker.c b/mm/shrinker.c
>> index a27779ed3798..1911c06b8af5 100644
>> --- a/mm/shrinker.c
>> +++ b/mm/shrinker.c
>> @@ -12,15 +12,50 @@ DECLARE_RWSEM(shrinker_rwsem);
>>   #ifdef CONFIG_MEMCG
>>   static int shrinker_nr_max;
>>   
>> -/* The shrinker_info is expanded in a batch of BITS_PER_LONG */
>> -static inline int shrinker_map_size(int nr_items)
>> +static inline int shrinker_unit_size(int nr_items)
>>   {
>> -	return (DIV_ROUND_UP(nr_items, BITS_PER_LONG) * sizeof(unsigned long));
>> +	return (DIV_ROUND_UP(nr_items, SHRINKER_UNIT_BITS) * sizeof(struct shrinker_info_unit *));
>>   }
>>   
>> -static inline int shrinker_defer_size(int nr_items)
>> +static inline void shrinker_unit_free(struct shrinker_info *info, int start)
>>   {
>> -	return (round_up(nr_items, BITS_PER_LONG) * sizeof(atomic_long_t));
>> +	struct shrinker_info_unit **unit;
>> +	int nr, i;
>> +
>> +	if (!info)
>> +		return;
>> +
>> +	unit = info->unit;
>> +	nr = DIV_ROUND_UP(info->map_nr_max, SHRINKER_UNIT_BITS);
>> +
>> +	for (i = start; i < nr; i++) {
>> +		if (!unit[i])
>> +			break;
>> +
>> +		kvfree(unit[i]);
>> +		unit[i] = NULL;
>> +	}
>> +}
>> +
>> +static inline int shrinker_unit_alloc(struct shrinker_info *new,
>> +				       struct shrinker_info *old, int nid)
>> +{
>> +	struct shrinker_info_unit *unit;
>> +	int nr = DIV_ROUND_UP(new->map_nr_max, SHRINKER_UNIT_BITS);
>> +	int start = old ? DIV_ROUND_UP(old->map_nr_max, SHRINKER_UNIT_BITS) : 0;
>> +	int i;
>> +
>> +	for (i = start; i < nr; i++) {
>> +		unit = kvzalloc_node(sizeof(*unit), GFP_KERNEL, nid);
> 
> A unit is 576 bytes. Why is this using kvzalloc_node()?

Ah, will use kzalloc_node() in the next version.

> 
>> +		if (!unit) {
>> +			shrinker_unit_free(new, start);
>> +			return -ENOMEM;
>> +		}
>> +
>> +		new->unit[i] = unit;
>> +	}
>> +
>> +	return 0;
>>   }
>>   
>>   void free_shrinker_info(struct mem_cgroup *memcg)
>> @@ -32,6 +67,7 @@ void free_shrinker_info(struct mem_cgroup *memcg)
>>   	for_each_node(nid) {
>>   		pn = memcg->nodeinfo[nid];
>>   		info = rcu_dereference_protected(pn->shrinker_info, true);
>> +		shrinker_unit_free(info, 0);
>>   		kvfree(info);
>>   		rcu_assign_pointer(pn->shrinker_info, NULL);
>>   	}
> 
> Why is this safe? The info and maps are looked up by RCU, so why is
> freeing them without a RCU grace period expiring safe?

The free_shrinker_info() will be called in alloc_shrinker_info() and
mem_cgroup_css_free().

In alloc_shrinker_info(), it will only be called in the error path, so
shrinker_info_unit and shrinker_info can be safely freed.

In mem_cgroup_css_free(), when we get here, the traversal of this memcg
has ended and will not be found again. That is to say, the corresponding
shrink_slab() is also over, so shrinker_info_unit and shrinker_info can
also be safely freed here.

> 
> Yes, it was safe to do this when it was all under a semaphore, but
> now the lookup and use is under RCU, so this freeing isn't
> serialised against lookups anymore...
> 
> 
>> @@ -40,28 +76,27 @@ void free_shrinker_info(struct mem_cgroup *memcg)
>>   int alloc_shrinker_info(struct mem_cgroup *memcg)
>>   {
>>   	struct shrinker_info *info;
>> -	int nid, size, ret = 0;
>> -	int map_size, defer_size = 0;
>> +	int nid, ret = 0;
>> +	int array_size = 0;
>>   
>>   	down_write(&shrinker_rwsem);
>> -	map_size = shrinker_map_size(shrinker_nr_max);
>> -	defer_size = shrinker_defer_size(shrinker_nr_max);
>> -	size = map_size + defer_size;
>> +	array_size = shrinker_unit_size(shrinker_nr_max);
>>   	for_each_node(nid) {
>> -		info = kvzalloc_node(sizeof(*info) + size, GFP_KERNEL, nid);
>> -		if (!info) {
>> -			free_shrinker_info(memcg);
>> -			ret = -ENOMEM;
>> -			break;
>> -		}
>> -		info->nr_deferred = (atomic_long_t *)(info + 1);
>> -		info->map = (void *)info->nr_deferred + defer_size;
>> +		info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
>> +		if (!info)
>> +			goto err;
>>   		info->map_nr_max = shrinker_nr_max;
>> +		if (shrinker_unit_alloc(info, NULL, nid))
>> +			goto err;
> 
> That's going to now do a lot of small memory allocation when we have
> lots of shrinkers active....
> 
>> @@ -150,17 +175,34 @@ static int expand_shrinker_info(int new_id)
>>   	return ret;
>>   }
>>   
>> +static inline int shriner_id_to_index(int shrinker_id)
> 
> shrinker_id_to_index

Will fix.

> 
>> +{
>> +	return shrinker_id / SHRINKER_UNIT_BITS;
>> +}
>> +
>> +static inline int shriner_id_to_offset(int shrinker_id)
> 
> shrinker_id_to_offset

Will fix.

> 
>> +{
>> +	return shrinker_id % SHRINKER_UNIT_BITS;
>> +}
> 
> ....
>> @@ -209,26 +251,31 @@ static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
>>   				   struct mem_cgroup *memcg)
>>   {
>>   	struct shrinker_info *info;
>> +	struct shrinker_info_unit *unit;
>>   
>>   	info = shrinker_info_protected(memcg, nid);
>> -	return atomic_long_xchg(&info->nr_deferred[shrinker->id], 0);
>> +	unit = info->unit[shriner_id_to_index(shrinker->id)];
>> +	return atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
>>   }
>>   
>>   static long add_nr_deferred_memcg(long nr, int nid, struct shrinker *shrinker,
>>   				  struct mem_cgroup *memcg)
>>   {
>>   	struct shrinker_info *info;
>> +	struct shrinker_info_unit *unit;
>>   
>>   	info = shrinker_info_protected(memcg, nid);
>> -	return atomic_long_add_return(nr, &info->nr_deferred[shrinker->id]);
>> +	unit = info->unit[shriner_id_to_index(shrinker->id)];
>> +	return atomic_long_add_return(nr, &unit->nr_deferred[shriner_id_to_offset(shrinker->id)]);
>>   }
>>   
>>   void reparent_shrinker_deferred(struct mem_cgroup *memcg)
>>   {
>> -	int i, nid;
>> +	int nid, index, offset;
>>   	long nr;
>>   	struct mem_cgroup *parent;
>>   	struct shrinker_info *child_info, *parent_info;
>> +	struct shrinker_info_unit *child_unit, *parent_unit;
>>   
>>   	parent = parent_mem_cgroup(memcg);
>>   	if (!parent)
>> @@ -239,9 +286,13 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
>>   	for_each_node(nid) {
>>   		child_info = shrinker_info_protected(memcg, nid);
>>   		parent_info = shrinker_info_protected(parent, nid);
>> -		for (i = 0; i < child_info->map_nr_max; i++) {
>> -			nr = atomic_long_read(&child_info->nr_deferred[i]);
>> -			atomic_long_add(nr, &parent_info->nr_deferred[i]);
>> +		for (index = 0; index < shriner_id_to_index(child_info->map_nr_max); index++) {
>> +			child_unit = child_info->unit[index];
>> +			parent_unit = parent_info->unit[index];
>> +			for (offset = 0; offset < SHRINKER_UNIT_BITS; offset++) {
>> +				nr = atomic_long_read(&child_unit->nr_deferred[offset]);
>> +				atomic_long_add(nr, &parent_unit->nr_deferred[offset]);
>> +			}
>>   		}
>>   	}
>>   	up_read(&shrinker_rwsem);
>> @@ -407,7 +458,7 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   {
>>   	struct shrinker_info *info;
>>   	unsigned long ret, freed = 0;
>> -	int i;
>> +	int offset, index = 0;
>>   
>>   	if (!mem_cgroup_online(memcg))
>>   		return 0;
>> @@ -419,56 +470,63 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   	if (unlikely(!info))
>>   		goto unlock;
>>   
>> -	for_each_set_bit(i, info->map, info->map_nr_max) {
>> -		struct shrink_control sc = {
>> -			.gfp_mask = gfp_mask,
>> -			.nid = nid,
>> -			.memcg = memcg,
>> -		};
>> -		struct shrinker *shrinker;
>> +	for (; index < shriner_id_to_index(info->map_nr_max); index++) {
>> +		struct shrinker_info_unit *unit;
> 
> This adds another layer of indent to shrink_slab_memcg(). Please
> factor it first so that the code ends up being readable. Doing that
> first as a separate patch will also make the actual algorithm
> changes in this patch be much more obvious - this huge hunk of
> diff is pretty much impossible to review...

OK, I will send this patch together with PATCH v4 01/02/03/43 as
a single cleanup patchset.

Thanks,
Qi

> 
> -Dave.
