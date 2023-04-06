Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4516D9270
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 11:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923CB10E08B;
	Thu,  6 Apr 2023 09:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3477210E08B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 09:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id C05E542494;
 Thu,  6 Apr 2023 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1680772508;
 bh=r6QAApmFMXAdCdgmAyhMS45Oy+VssbcgRzqJ53SBDRI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Pk9vO6rDodk/l13WtBwwjNtIsGaY8mnjvwnU3vGDKmwgiTOL35AsH/oVV/FUuho9B
 +xj12USiFoOD6wXq4SeANC/+55xdP4zmXmUc8BZU1hcTYysfL4Ah3ISTEPV+7ewoT2
 tJQmj34PAWig7LmmsYoWlKLhcCqRRbRyK/Ejn21MnIZKxd2FgggeKYW+KhtfoZzhTb
 G7ZQEEfJ3KBUowfebMGuZ5pApei7w3FgdSPMtCkEa2ANtXaqUAgXlXDw5Q6avSgNq6
 051fbK+MwRVhqVpwDwlpSdB8uCg4rOFWQgpiBo1Z0yVfVXx/TbXitcDnVyfjIzQd1D
 r181/CGXWNleA==
Message-ID: <df226249-734e-cb9e-8bc0-1eff625277e0@asahilina.net>
Date: Thu, 6 Apr 2023 18:15:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20230406-scheduler-uaf-1-v1-1-8e5662269d25@asahilina.net>
 <6b3433ee-0712-f789-51ee-3047ead9bb79@amd.com>
 <cfbaceae-6d40-a8b3-e449-6473be234d2d@asahilina.net>
 <180bd178-e3c0-85e3-785e-fc8a216cf65e@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <180bd178-e3c0-85e3-785e-fc8a216cf65e@amd.com>
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
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2023 18.06, Christian König wrote:
> Am 06.04.23 um 10:49 schrieb Asahi Lina:
>> On 06/04/2023 17.29, Christian König wrote:
>>> Am 05.04.23 um 18:34 schrieb Asahi Lina:
>>>> A signaled scheduler fence can outlive its scheduler, since fences are
>>>> independently reference counted.
>>>
>>> Well that is actually not correct. Schedulers are supposed to stay
>>> around until the hw they have been driving is no longer present.
>>
>> But the fences can outlive that. You can GPU render into an imported
>> buffer, which attaches a fence to it. Then the GPU goes away but the
>> fence is still attached to the buffer. Then you oops when you cat that
>> debugfs file...
> 
> No, exactly that's the point you wouldn't ops.
> 
>>
>> My use case does this way more often (since schedulers are tied to
>> UAPI objects), which is how I found this, but as far as I can tell
>> this is already broken for all drivers on unplug/unbind/anything else
>> that would destroy the schedulers with fences potentially referenced
>> on separate scanout devices or at any other DMA-BUF consumer.
> 
> Even if a GPU is hot plugged the data structures for it should only go
> away with the last reference, since the scheduler fence is referencing
> the hw fence and the hw fence in turn is referencing the driver this
> shouldn't happen.

So those fences can potentially keep half the driver data structures 
alive just for existing in a signaled state? That doesn't seem sensible 
(and it definitely doesn't work for our use case where schedulers can be 
created and destroyed freely, it could lead to way too much junk 
sticking around in memory).

>>
>>> E.g. the reference was scheduler_fence->hw_fence->driver->scheduler.
>>
>> It's up to drivers not to mess that up, since the HW fence has the
>> same requirements that it can outlive other driver objects, just like
>> any other fence. That's not something the scheduler has to be
>> concerned with, it's a driver correctness issue.
>>
>> Of course, in C you have to get it right yourself, while with correct
>> Rust abstractions will cause your code to fail to compile if you do it
>> wrong ^^
>>
>> In my particular case, the hw_fence is a very dumb object that has no
>> references to anything, only an ID and a pending op count. Jobs hold
>> references to it and decrement it until it signals, not the other way
>> around. So that object can live forever regardless of whether the rest
>> of the device is gone.
> 
> That is then certainly a bug. This won't work that way, and the timelime
> name is just the tip of the iceberg here.
> 
> The fence reference count needs to keep both the scheduler and driver
> alive. Otherwise you could for example unload the module and immediately
> ops because your fence_ops go away.

Yes, I realized the module issue after writing the email. But that's the 
*only* thing it needs to hold a reference to! Which is much more 
sensible than keeping a huge chunk of UAPI-adjacent data structures 
alive for a signaled fence that for all we know might stick around 
forever attached to some buffer.

>>> Your use case is now completely different to that and this won't work
>>> any more.
>>>
>>> This here might just be the first case where that breaks.
>>
>> This bug already exists, it's just a lot rarer for existing use
>> cases... but either way Xe is doing the same thing I am, so I'm not
>> the only one here either.
> 
> No it doesn't. You just have implemented the references differently than
> they are supposed to be.
> 
> Fixing this one occasion here would mitigate that immediate ops, but
> doesn't fix the fundamental problem.

Honestly, at this point I'm starting to doubt whether we want to use 
drm_scheduler at all, because it clearly wasn't designed for our use 
case and every time I try to fix something your answer has been "you're 
using it wrong", and at the same time the practically nonexistent 
documentation makes it impossible to know how it was actually designed 
to be used.

~~ Lina

