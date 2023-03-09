Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D117F6B25CD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 14:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED3710E17F;
	Thu,  9 Mar 2023 13:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE6F10E17F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 13:48:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 0EE6F42037;
 Thu,  9 Mar 2023 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678369725;
 bh=AE3z/Hbuidfh0VnEdFu5MrRvC3cGbJJCXqEsPKkKv1I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KTG/4UqJc8WfavSUh7tqLucA9Wp0OzX4DyjTmJUOp0sRWjLxntOHlni3Y7XaywGDd
 hU4uXroyp55O6O1tp6qYAIxz+d8FeMIxLBPltCQDvMDCPDO11JEXrxE97V9VaoDS2N
 JXflI7UOyImooOYtVzFxbWaF3BGr5UNDZFXoGWpcURhEzBPFGOXzZstYOndJg7wJu9
 o3zByU3WOc1Ihx4z7svazX+2gQOlWDYn5sacZcA4MLiiP9AsOfzTjfi7Bd36YumoOJ
 6aVufEmspdikuXAb6yavwZ2tJ5pzEC4mrfqcvUBqMQeJM0LXdYFW523hFD7GDmEmuG
 dd2HP9y7U3aBw==
Message-ID: <e517dc90-0289-7339-e36e-54ba2635ed1f@asahilina.net>
Date: Thu, 9 Mar 2023 22:48:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
 <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
 <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
 <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
 <e18500b5-21a0-77fd-8434-86258cefce5a@amd.com>
 <8696d00a-c642-b080-c19a-b0e619e4b585@asahilina.net>
 <5f0814a3-4be3-a609-d3b3-dd51a4f459a1@amd.com>
 <9403e89d-a78f-8abd-2869-20da23d89475@asahilina.net>
 <ac92cea6-89e7-6147-a8fb-8b76e89cdcb6@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <ac92cea6-89e7-6147-a8fb-8b76e89cdcb6@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 20.47, Christian König wrote:
> Am 09.03.23 um 10:43 schrieb Asahi Lina:
>> On 09/03/2023 17.42, Christian König wrote:
>>> Am 08.03.23 um 20:37 schrieb Asahi Lina:
>>>> On 09/03/2023 03.12, Christian König wrote:
>>>>> Am 08.03.23 um 18:32 schrieb Asahi Lina:
>>>>>> [SNIP]
>>>>>> Yes but... none of this cleans up jobs that are already submitted by the
>>>>>> scheduler and in its pending list, with registered completion callbacks,
>>>>>> which were already popped off of the entities.
>>>>>>
>>>>>> *That* is the problem this patch fixes!
>>>>> Ah! Yes that makes more sense now.
>>>>>
>>>>>>> We could add a warning when users of this API doesn't do this
>>>>>>> correctly, but cleaning up incorrect API use is clearly something we
>>>>>>> don't want here.
>>>>>> It is the job of the Rust abstractions to make incorrect API use that
>>>>>> leads to memory unsafety impossible. So even if you don't want that in
>>>>>> C, it's my job to do that for Rust... and right now, I just can't
>>>>>> because drm_sched doesn't provide an API that can be safely wrapped
>>>>>> without weird bits of babysitting functionality on top (like tracking
>>>>>> jobs outside or awkwardly making jobs hold a reference to the scheduler
>>>>>> and defer dropping it to another thread).
>>>>> Yeah, that was discussed before but rejected.
>>>>>
>>>>> The argument was that upper layer needs to wait for the hw to become
>>>>> idle before the scheduler can be destroyed anyway.
>>>> Unfortunately, that's not a requirement you can encode in the Rust type
>>>> system easily as far as I know, and Rust safety rules mean we need to
>>>> make it safe even if the upper layer doesn't do this... (or else we have
>>>> to mark the entire drm_sched abstraction unsafe, but that would be a pity).
>>> Yeah, that should really not be something we should do.
>>>
>>> But you could make the scheduler depend on your fw context object, don't
>>> you?
>> Yes, and that would fix the problem for this driver, but it wouldn't
>> make the abstraction safe. The thing is we have to make it *impossible*
>> to misuse drm_sched in such a way that it crashes, at the Rust
>> abstraction level. If we start depending on the driver following rules
>> like that, that means the drm_sched abstraction has to be marked unsafe.
>>
>>> Detaching the scheduler from the underlying hw fences is certainly
>>> possible, but we removed that functionality because some people people
>>> tried to force push some Windows recovery module into Linux. We are in
>>> the process of reverting that and cleaning things up once more, but that
>>> will take a while.
>> Okay, but I don't see why that should block the Rust abstractions...
> 
> Because even with removing the fence callback this is inherently unsafe.
> 
> You not only need to remove the callback, but also make sure that no 
> parallel timeout handling is running.

If by that you mean that the timeout handling functions aren't being
called by the driver, then that's implied. If the scheduler is being
dropped, by definition there are no references left to call into the
scheduler directly from the Rust side. So we only need to worry about
what drm_sched itself does.

Right now the cleanup function tears down the timeout work at the end,
but it probably makes sense to do it at the start? Then if we do that
and stop the kthread, we can be really sure nothing else is accessing
the scheduler and we can clean up without taking any locks:

Roughly:

void drm_sched_fini(struct drm_gpu_scheduler *sched)
{
    sched->ready = false; /* Should probably do this first? */
    kthread_stop(sched->thread);
    cancel_delayed_work_sync(&sched->work_tdr);

    /* Clean up the pending_list here */
}

I'm also not sure what the rest of the drm_sched_fini() function is
doing right now. It's going through all entities and removing them, and
then wakes up entities stuck in drm_sched_entity_flush()... but didn't
we just agree that the API requires users to tear down entities before
tearing down the scheduler anyway?

~~ Lina
