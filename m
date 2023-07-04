Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A3B746811
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 05:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C3910E285;
	Tue,  4 Jul 2023 03:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C27610E285
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 03:45:28 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b7e0904a3aso5922915ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 20:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1688442328; x=1691034328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MFeBrddeuJ5VLdpmCCc9Ly4sKMWZlJ9dQaH0OIDXyXU=;
 b=j7xJWhzFM4GE3eR0BWlTsy0HOBZgoak2dvLTatqMXnZnLNlVtwEQEMD37hReh1XlxL
 r7hBjmyn6FTskoa4La7xZKdevvzdRYT77+N3epv4gV4kf7cq17ylBfxUBggc5e3s855p
 GBBkk0n7PQiIlJc4/4tEUrT3R4iVDw8hzgofihKHl2t9qpb1Wo/DBMbPRp1jN35Ysfyk
 NehRpBrYeu3yLN9/0Wq7Sp995UEH4u6Jpn1UiV9vGd2Ip0zNqgcG1X9kw2r/e/NkF6jp
 XN82IHgovy+BsnEHQ6hQjvSqng1pgoniLOJy363s3drrdrxX6tuIJ1PwqNuLdqN7Qt1x
 0hhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688442328; x=1691034328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MFeBrddeuJ5VLdpmCCc9Ly4sKMWZlJ9dQaH0OIDXyXU=;
 b=JnDXvLf3gY8pr9mGNoYfZBmQevH7yOApRqcbaiu/laYuxsPyu15VSA1hkFeOmCp9WM
 EejN1RiFjiPQyBKMtl/T9OAuytYHYi3FD/a89Bo56okSNNy+i2f6GiHzr7vGLCjlzu9c
 GBD8D+61bWVTYv63a4IAtrWZi+SuW9T3IO/W+17albJprkScmu0FsDJ4tiPeEWm2t/O9
 e+wkOXQWkYLssAumyqqbZx+WU4CP9UTEdX0rdm/a2YcF8Pefs9dRLqArbKqFnwwaj/xy
 m5J0GoaWya84QApsZeZdTtXDWXBgE+T+0jmR4rW5rb+InKJijjQH/k1OtlQaUCpUvMQP
 j1+g==
X-Gm-Message-State: ABy/qLZN430VTPlF3m8Ohl58p2zg2I2C6ArruSbQ6bCNmtJAm5JIt9r9
 3/vo30AGMQ+DWNXoOYt2EVFq+w==
X-Google-Smtp-Source: APBJJlF81QfMj+OzGuweGT/AC35DngvuObAYHLJM7qqWJeHFGWrQw9pznSu7LGwsdhDNw+giWeybWA==
X-Received: by 2002:a17:902:b20b:b0:1ae:4567:2737 with SMTP id
 t11-20020a170902b20b00b001ae45672737mr12710934plr.2.1688442328020; 
 Mon, 03 Jul 2023 20:45:28 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 az10-20020a170902a58a00b001b1866f7b5csm15891733plb.138.2023.07.03.20.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 20:45:27 -0700 (PDT)
Message-ID: <3efa68e0-b04f-5c11-4fe2-2db0784064fc@bytedance.com>
Date: Tue, 4 Jul 2023 11:45:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 24/29] mm: vmscan: make global slab shrink lockless
Content-Language: en-US
To: paulmck@kernel.org, Dave Chinner <david@fromorbit.com>
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-25-zhengqi.arch@bytedance.com>
 <cf0d9b12-6491-bf23-b464-9d01e5781203@suse.cz>
 <ZJU708VIyJ/3StAX@dread.disaster.area>
 <cc894c77-717a-4e9f-b649-48bab40e7c60@paulmck-laptop>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <cc894c77-717a-4e9f-b649-48bab40e7c60@paulmck-laptop>
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
Cc: linux-bcache@vger.kernel.org, linux-xfs@vger.kernel.org, brauner@kernel.org,
 tytso@mit.edu, djwong@kernel.org, intel-gfx@lists.freedesktop.org,
 roman.gushchin@linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 linux-btrfs@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/4 00:39, Paul E. McKenney wrote:
> On Fri, Jun 23, 2023 at 04:29:39PM +1000, Dave Chinner wrote:
>> On Thu, Jun 22, 2023 at 05:12:02PM +0200, Vlastimil Babka wrote:
>>> On 6/22/23 10:53, Qi Zheng wrote:
>>>> @@ -1067,33 +1068,27 @@ static unsigned long shrink_slab(gfp_t gfp_mask, int nid,
>>>>   	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
>>>>   		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
>>>>   
>>>> -	if (!down_read_trylock(&shrinker_rwsem))
>>>> -		goto out;
>>>> -
>>>> -	list_for_each_entry(shrinker, &shrinker_list, list) {
>>>> +	rcu_read_lock();
>>>> +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
>>>>   		struct shrink_control sc = {
>>>>   			.gfp_mask = gfp_mask,
>>>>   			.nid = nid,
>>>>   			.memcg = memcg,
>>>>   		};
>>>>   
>>>> +		if (!shrinker_try_get(shrinker))
>>>> +			continue;
>>>> +		rcu_read_unlock();
>>>
>>> I don't think you can do this unlock?
> 
> Sorry to be slow to respond here, this one fell through the cracks.
> And thank you to Qi for reminding me!
> 
> If you do this unlock, you had jolly well better nail down the current
> element (the one referenced by shrinker), for example, by acquiring an
> explicit reference count on the object.  And presumably this is exactly
> what shrinker_try_get() is doing.  And a look at your 24/29 confirms this,
> at least assuming that shrinker->refcount is set to zero before the call
> to synchronize_rcu() in free_module() *and* that synchronize_rcu() doesn't
> start until *after* shrinker_put() calls complete().  Plus, as always,
> the object must be removed from the list before the synchronize_rcu()
> starts.  (On these parts of the puzzle, I defer to those more familiar
> with this code path.  And I strongly suggest carefully commenting this
> type of action-at-a-distance design pattern.)

Yeah, I think I've done it like above. A more detailed timing diagram is
below.

> 
> Why is this important?  Because otherwise that object might be freed
> before you get to the call to rcu_read_lock() at the end of this loop.
> And if that happens, list_for_each_entry_rcu() will be walking the
> freelist, which is quite bad for the health and well-being of your kernel.
> 
> There are a few other ways to make this sort of thing work:
> 
> 1.	Defer the shrinker_put() to the beginning of the loop.
> 	You would need a flag initially set to zero, and then set to
> 	one just before (or just after) the rcu_read_lock() above.
> 	You would also need another shrinker_old pointer to track the
> 	old pointer.  Then at the top of the loop, if the flag is set,
> 	invoke shrinker_put() on shrinker_old.	This ensures that the
> 	previous shrinker structure stays around long enough to allow
> 	the loop to find the next shrinker structure in the list.
> 
> 	This approach is attractive when the removal code path
> 	can invoke shrinker_put() after the grace period ends.
> 
> 2.	Make shrinker_put() invoke call_rcu() when ->refcount reaches
> 	zero, and have the callback function free the object.  This of
> 	course requires adding an rcu_head structure to the shrinker
> 	structure, which might or might not be a reasonable course of
> 	action.  If adding that rcu_head is reasonable, this simplifies
> 	the logic quite a bit.
> 
> 3.	For the shrinker-structure-removal code path, remove the shrinker
> 	structure, then remove the initial count from ->refcount,
> 	and then keep doing grace periods until ->refcount is zero,
> 	then do one more.  Of course, if the result of removing the
> 	initial count was zero, then only a single additional grace
> 	period is required.
> 
> 	This would need to be carefully commented, as it is a bit
> 	unconventional.

Thanks for such a detailed addition!

> 
> There are probably many other ways, but just to give an idea of a few
> other ways to do this.
> 
>>>> +
>>>>   		ret = do_shrink_slab(&sc, shrinker, priority);
>>>>   		if (ret == SHRINK_EMPTY)
>>>>   			ret = 0;
>>>>   		freed += ret;
>>>> -		/*
>>>> -		 * Bail out if someone want to register a new shrinker to
>>>> -		 * prevent the registration from being stalled for long periods
>>>> -		 * by parallel ongoing shrinking.
>>>> -		 */
>>>> -		if (rwsem_is_contended(&shrinker_rwsem)) {
>>>> -			freed = freed ? : 1;
>>>> -			break;
>>>> -		}
>>>> -	}
>>>>   
>>>> -	up_read(&shrinker_rwsem);
>>>> -out:
>>>> +		rcu_read_lock();
>>>
>>> That new rcu_read_lock() won't help AFAIK, the whole
>>> list_for_each_entry_rcu() needs to be under the single rcu_read_lock() to be
>>> safe.
>>
>> Yeah, that's the pattern we've been taught and the one we can look
>> at and immediately say "this is safe".
>>
>> This is a different pattern, as has been explained bi Qi, and I
>> think it *might* be safe.
>>
>> *However.*
>>
>> Right now I don't have time to go through a novel RCU list iteration
>> pattern it one step at to determine the correctness of the
>> algorithm. I'm mostly worried about list manipulations that can
>> occur outside rcu_read_lock() section bleeding into the RCU
>> critical section because rcu_read_lock() by itself is not a memory
>> barrier.
>>
>> Maybe Paul has seen this pattern often enough he could simply tell
>> us what conditions it is safe in. But for me to work that out from
>> first principles? I just don't have the time to do that right now.
> 
> If the code does just the right sequence of things on the removal path
> (remove, decrement reference, wait for reference to go to zero, wait for
> grace period, free), then it would work.  If this is what is happening,
> I would argue for more comments.  ;-)

The order of the removal path is slightly different from this:

     shrink_slab                 unregister_shrinker
     ===========                 ===================
		
    shrinker_try_get()
    rcu_read_unlock()		
                                 1. decrement initial reference
				shrinker_put()
				2. wait for reference to go to zero
				wait_for_completion()
    rcu_read_lock()

    shrinker_put()
				3. remove the shrinker from list
				list_del_rcu()
                                 4. wait for grace period
				kfree_rcu()/synchronize_rcu()


    list_for_each_entry()

    shrinker_try_get()
    rcu_read_unlock()
				5. free the shrinker

So the order is: decrement reference, wait for reference to go to zero,
remove, wait for grace period, free.

I think this can work. And we can only do the *step 3* after we hold the
RCU read lock again, right? Please let me know if I missed something.

Thanks,
Qi

> 
> 							Thanx, Paul
> 
>>> IIUC this is why Dave in [4] suggests unifying shrink_slab() with
>>> shrink_slab_memcg(), as the latter doesn't iterate the list but uses IDR.
>>
>> Yes, I suggested the IDR route because radix tree lookups under RCU
>> with reference counted objects are a known safe pattern that we can
>> easily confirm is correct or not.  Hence I suggested the unification
>> + IDR route because it makes the life of reviewers so, so much
>> easier...
>>
>> Cheers,
>>
>> Dave.
>> -- 
>> Dave Chinner
>> david@fromorbit.com
