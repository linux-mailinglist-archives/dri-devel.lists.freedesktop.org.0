Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90383918E8
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0935C6E4BB;
	Wed, 26 May 2021 13:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5EE6E4BB;
 Wed, 26 May 2021 13:32:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so525376wmf.1; 
 Wed, 26 May 2021 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YlBMJFk9IU7XFpKBGAdwLecZ23BlfUXVTyQ5htgnqds=;
 b=gHerwUijsmKZTx4DCmhcXuTnIFvyweNastBkn9ZahCah3iPkN6qssuhEnZPYikpTXk
 RX22AZNSYo0f9LnQxB+tGHPW7EicBzlz0paibGwJqll459D9GranIBqGDnHUX0cYZncx
 nZpVupWUHabYgH0UBi7gLLfMRyGCyvETRi0K2w2FEUMDDLvwMI7s21+tKrDI9eeUQ+bu
 q2ZJ+Vwea2gEB1SOlH0SoO6nRY0IUHfDLbHJpOg0chTfNAgj+6bpACfIzjyNl9xXIZ9w
 XkKPZvSXQik3WBxDBewoVhH93liltdQM/tFv8G3wAqtIEZXhH07TJdL3qZYWortdJcxX
 E2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YlBMJFk9IU7XFpKBGAdwLecZ23BlfUXVTyQ5htgnqds=;
 b=mh3+a7JahGQdJ4xiMGl4uSvsoI6yKjf93X+o1G7GbOtB0Ap0KVjEiZwHzJWdqkbZO1
 1OFJFWO/3JqJ4cI0pb9dkDECnvCXq+0Z9Ah3FR0C6TYqJlHFhT9KQgFfsbxGcL9fKqw5
 1/YyIaN3jBWnASJRL98Vsmt2LqUMNFeuM4YymvRuXbkzQEOooTeWZIgXZZGf4EjNHrT4
 ON3orr26NS7i6Hl62migD4qgTmX169uJdFaYc7Z3UQIf/Wr+lw6vskC+rxQ6KhfgpLDL
 /sZsQOWBDkoIs9cENIAg7NMG0oWTk0qbNjGwTlOo4skNSnE5Jqx0WP5JpEmvgm5wzalq
 omAw==
X-Gm-Message-State: AOAM532lTkM5UhuTC9hlHU3o3j7YLmCn+Wu6yArqhzdJk0I8Mo7TqQy8
 hyVs8aHqP2NifI9furh7fZ0=
X-Google-Smtp-Source: ABdhPJyaNjBH9aRtWN83y51VC2QaShd89a7j4j98DGf1DzeCXlHUlJkhEhO3F6fRhbwIb39lhclevg==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr3577903wmi.153.1622035972705; 
 Wed, 26 May 2021 06:32:52 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:1950:35e:cae9:5bed?
 ([2a02:908:1252:fb60:1950:35e:cae9:5bed])
 by smtp.gmail.com with ESMTPSA id x24sm6561252wmi.13.2021.05.26.06.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 06:32:52 -0700 (PDT)
Subject: Re: [Mesa-dev] [PATCH 01/11] drm/amdgpu: Comply with implicit fencing
 rules
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
 <YKfFqrlLrikGMn4K@phenom.ffwll.local>
 <CAP+8YyG0o58dQt_tvnJ2ESbeqo02xxvFdifpMwnhz2VYNk8HUw@mail.gmail.com>
 <YKfOymXrB7O4cYVb@phenom.ffwll.local>
 <31467363-e936-879b-8b0d-5a2a92644221@gmail.com>
 <CAKMK7uFswfc96hS40uc0Lug=doYAcf-yC-eu96iWqNJnM65MJQ@mail.gmail.com>
 <ae13093e-c364-7b90-1f91-39de42594cd6@amd.com>
 <YKz2KVppVoYMxB5u@phenom.ffwll.local>
 <312b183f-8eb2-d9e2-24ad-b429b74c886c@gmail.com>
 <CAKMK7uG-JYieYvnc0R-FXJJDrCZfypvstYw2NrLPRt+J9=oe1g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fe633922-53a4-2409-8697-d815650c65ac@gmail.com>
Date: Wed, 26 May 2021 15:32:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG-JYieYvnc0R-FXJJDrCZfypvstYw2NrLPRt+J9=oe1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.05.21 um 17:23 schrieb Daniel Vetter:
> On Tue, May 25, 2021 at 5:05 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hi Daniel,
>>
>> Am 25.05.21 um 15:05 schrieb Daniel Vetter:
>>> Hi Christian,
>>>
>>> On Sat, May 22, 2021 at 10:30:19AM +0200, Christian König wrote:
>>>> Am 21.05.21 um 20:31 schrieb Daniel Vetter:
>>>> This works by adding the fence of the last eviction DMA operation to BOs
>>>> when their backing store is newly allocated. That's what the
>>>> ttm_bo_add_move_fence() function you stumbled over is good for: https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/gpu/drm/ttm/ttm_bo.c#L692
>>>>
>>>> Now the problem is it is possible that the application is terminated before
>>>> it can complete it's command submission. But since resource management only
>>>> waits for the shared fences when there are some there is a chance that we
>>>> free up memory while it is still in use.
>>> Hm where is this code? Would help in my audit that I wanted to do this
>>> week? If you look at most other places like
>>> drm_gem_fence_array_add_implicit() I mentioned earlier, then we don't
>>> treat the shared fences special and always also include the exclusive one.
>> See amdgpu_gem_object_close():
>>
>> ...
>>           fence = dma_resv_get_excl(bo->tbo.base.resv);
>>           if (fence) {
>>                   amdgpu_bo_fence(bo, fence, true);
>>                   fence = NULL;
>>           }
>> ...
>>
>> We explicitly added that because resource management of some other
>> driver was going totally bananas without that.
>>
>> But I'm not sure which one that was. Maybe dig a bit in the git and
>> mailing history of that.
> Hm I looked and it's
>
> commit 82c416b13cb7d22b96ec0888b296a48dff8a09eb
> Author: Christian König <christian.koenig@amd.com>
> Date:   Thu Mar 12 12:03:34 2020 +0100
>
>     drm/amdgpu: fix and cleanup amdgpu_gem_object_close v4
>
> That sounded more like amdgpu itself needing this, not another driver?

No, that patch was just a follow up moving the functionality around.

> But looking at amdgpu_vm_bo_update_mapping() it seems to pick the
> right fencing mode for gpu pte clearing, so I'm really not sure what
> the bug was that you worked around here?The implementation boils down
> to amdgpu_sync_resv() which syncs for the exclusive fence, always. And
> there's nothing else that I could find in public history at least, no
> references to bug reports or anything. I think you need to dig
> internally, because as-is I'm not seeing the problem here.
>
> Or am I missing something here?

See the code here for example: 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nouveau_fence.c#L361

Nouveau assumes that when a shared fence is present it doesn't need to 
wait for the exclusive one because the shared are always supposed to 
finish after the exclusive one.

But for page table unmap fences that isn't true and we ran into a really 
nasty and hard to reproduce bug because of this.

I think it would be much more defensive if we could say that we always 
wait for the exclusive fence and fix the use case in nouveau and double 
check if somebody else does stuff like that as well.

Christian.

> -Daniel

