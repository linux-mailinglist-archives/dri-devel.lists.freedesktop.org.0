Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC11A6D985D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E84710E8A9;
	Thu,  6 Apr 2023 13:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3591810E65B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:36:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 2D18842553;
 Thu,  6 Apr 2023 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1680788208;
 bh=nWxGyCXdBGraibvzVGzPbEcsSVWskl7AnTnyd7R9wW4=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To;
 b=QXFMaR6uq8kBfJn6aAxNyW2tO87rQgjXIdlv00Gosef9lTKvtWEG4aNkJNZxnI2l3
 gc3JhDk1uPH/lnYRdsOsK18ORjApAZDKyJkHDrI1jUhKzJRP8IlNgXgVTz71kyUwss
 +eYKH945WsW6oS/OB+f2NWj48bVwgVmXYu4fmayqI4bgfqXdCrApo4drI2ZfHxYs0h
 ixUxX1L3+p7JIsP8bxb7oaFr2Fr8rIT07i+50NN8hpypKphZ+zw72XT9Boyw6WL+ns
 5ALfNahOX93lRau4khJ8paQW4GVpD5IeMh++NlCWOjiUrVdAULSqpREX9tfg4dQ3aC
 oLrRtHCkk/JcA==
Message-ID: <f9f5b35e-6a52-530e-aa44-c37132494546@asahilina.net>
Date: Thu, 6 Apr 2023 22:36:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230406-scheduler-uaf-1-v1-1-8e5662269d25@asahilina.net>
 <6b3433ee-0712-f789-51ee-3047ead9bb79@amd.com>
 <cfbaceae-6d40-a8b3-e449-6473be234d2d@asahilina.net>
 <180bd178-e3c0-85e3-785e-fc8a216cf65e@amd.com>
 <df226249-734e-cb9e-8bc0-1eff625277e0@asahilina.net>
 <4ea53272-6324-96e6-ab29-82bccb624683@asahilina.net>
 <ZC6Vh2gG91zXUKJW@phenom.ffwll.local>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <ZC6Vh2gG91zXUKJW@phenom.ffwll.local>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 asahi@lists.linux.dev,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2023 18.48, Daniel Vetter wrote:
> On Thu, Apr 06, 2023 at 06:27:27PM +0900, Asahi Lina wrote:
>> On 06/04/2023 18.15, Asahi Lina wrote:
>>> On 06/04/2023 18.06, Christian König wrote:
>>>> Am 06.04.23 um 10:49 schrieb Asahi Lina:
>>>>> On 06/04/2023 17.29, Christian König wrote:
>>>>>> Am 05.04.23 um 18:34 schrieb Asahi Lina:
>>>>>>> A signaled scheduler fence can outlive its scheduler, since fences are
>>>>>>> independently reference counted.
>>>>>>
>>>>>> Well that is actually not correct. Schedulers are supposed to stay
>>>>>> around until the hw they have been driving is no longer present.
>>>>>
>>>>> But the fences can outlive that. You can GPU render into an imported
>>>>> buffer, which attaches a fence to it. Then the GPU goes away but the
>>>>> fence is still attached to the buffer. Then you oops when you cat that
>>>>> debugfs file...
>>>>
>>>> No, exactly that's the point you wouldn't ops.
>>>>
>>>>>
>>>>> My use case does this way more often (since schedulers are tied to
>>>>> UAPI objects), which is how I found this, but as far as I can tell
>>>>> this is already broken for all drivers on unplug/unbind/anything else
>>>>> that would destroy the schedulers with fences potentially referenced
>>>>> on separate scanout devices or at any other DMA-BUF consumer.
>>>>
>>>> Even if a GPU is hot plugged the data structures for it should only go
>>>> away with the last reference, since the scheduler fence is referencing
>>>> the hw fence and the hw fence in turn is referencing the driver this
>>>> shouldn't happen.
>>>
>>> So those fences can potentially keep half the driver data structures
>>> alive just for existing in a signaled state? That doesn't seem sensible
>>> (and it definitely doesn't work for our use case where schedulers can be
>>> created and destroyed freely, it could lead to way too much junk
>>> sticking around in memory).
> 
> This is why the split betwen the hw fence and the public sched fence.
> Because once the hw fence stuff is sorted it should all be able to go
> away, without the public fence keeping everything alive.

That doesn't seem to be how it works though... as far as I can tell the 
public finished fence keeps the public scheduled fence alive, which 
keeps the hw fence alive.

If that is how it is supposed to work, then we're back at this being a 
simple UAF which is fixed by this patch (and then the fence code also 
needs to be fixed to actually drop the parent fence reference when it 
signals).

>> Also, requiring that the hw_fence keep the scheduler alive (which is
>> documented nowhere) is a completely ridiculous lifetime requirement and
>> layering violation across multiple subsystems. I have no idea how I'd make
>> Rust abstractions uphold that requirement safely without doing something
>> silly like having abstraction-specific hw_fence wrappers, and then you run
>> into deadlocks due to the scheduler potentially being dropped from the
>> job_done callback when the fence reference is dropped and just... no,
>> please. This is terrible. If you don't want me to fix it we'll have to find
>> another way because I can't work with this.
> 
> So generally the hw fence keeps the underlying gpu ctx alive, and the gpu
> context keeps the gpu vm alive. Pretty much has to, or your gpu starts
> executing stuff that's freed.

I do that using a different mechanism, since the way this GPU signals 
events doesn't map directly to fences, nor to the UAPI queue's (and 
therefore the DRM scheduler's hw fence's) idea of what job completion 
is. There's sort of a timeline mechanism instead, but the timelines are 
24 bits and wrap and there's a global set of 128 of them and multiple 
can be required for a single drm_scheduler job. Keeping queues alive 
(which then keep active jobs alive which keep whatever resources they 
require alive) happens at the level of those 128 event slots, as I call 
them, which hold a reference to whatever queue is assigned to them. Once 
those signal the queues walk through pending jobs until the signaled 
value, and that's where the hw fence gets signaled. After that the jobs 
that were just completed are freed (This is a sticky point right now due 
to possible deadlocks if done on the event thread. What I'm doing right 
now is a bit of a hack that works well enough in practice, but I want to 
refactor it to be cleaner once we have more Rust abstractions to work 
with...)

It might actually make sense to start moving some lifetimes into the 
hw_fence if we find we need to more tightly tie firmware lifetimes 
together (this is TBD, I'm still figuring out all the corner case 
rules), but that's only practical if the drm_sched fence doesn't hold up 
the entire hw_fence. For that to make sense the hw_fence needs to be 
able to go away soon after it signals.

This whole thing is pretty messy and I'm open to refactoring ideas, I 
just don't want to have to keep drm_sched instances lying around just 
because someone has a buffer reference with one of its fences 
installed... those potentially long-lived fences shouldn't keep anything 
more than small bits of driver-global state alive (ideally just the 
module itself).

> Now for fw scheduler gpu ctx isn't just drm_sched_entity, but also
> drm_scheduler. Plus whatever driver stuff you have lying around for a ctx.
> Plus ofc a reference to the vm, which might in turn keep a ton of gem_bo
> alive.

In this case I don't actually keep the user BOs alive (because that's a 
File level thing), and yes that does mean if you kill a process using 
the GPU chances are it's going to fault as all the userspace buffers 
disappear. But I do keep all the firmware and kernel-allocated objects 
and BOs around of course, those are the ones that have references from 
the pending job objects in one way or another (and which are critical to 
keep alive, as otherwise the firmware will crash). I don't keep the 
scheduler though, since that's just a higher-level thing to me, not 
something the GPU itself cares about. If userspace goes away and BOs are 
going away anyway, we might as well cancel all pending jobs and let any 
currently executing ones freewheel (that was one of my earlier patches) 
while allowing the scheduler to be torn down.

If we need to though, I can figure out some way to keep the BO 
mapping/etc state alive when the File goes away until jobs complete. 
It's just sort of academic because userspace is supposed to clean up 
after itself and wait for all jobs, and there's no way for the kernel to 
guarantee the GPU won't fault anyway, so a malicious userspace could 
always do the wrong thing...

> Still I'm not seeing where the fundamental issue is in this refcount
> scheme, or where it's silly? Mapping this all to Rust correctly is a
> challenge for sure, and also untangling the assumption that drm_scheduler
> is suddenly a lot more dynamic object (see my other reply), but
> fundamentally calling this all silly and terrible I don't understand ...

Christian is saying that the hw fence needs to keep a transitive 
reference to the scheduler. How do we enforce that? Fences are one 
abstraction, and the scheduler is another. We can't encode that a given 
generic Fence implementation contains a reference to a given scheduler 
in the type system.

Rust abstractions are easy to write for self-contained subsystems with 
clear lifetime rules for their components. They are hard to write for 
convoluted lifetime rules that span several modules (without built-in 
refcounting to deal with it), and it is exactly those kinds of designs 
that are error-prone to use and document, regardless of whether you're 
writing Rust or C. From what Christian says, drm_sched today has that 
kind of design and it is intentional.

Since we can't express complex lifetime relationships in the type system 
in a usable way, we have to use refcounting. So first, that means the 
DRM scheduler needs to be refcounted (it actually already is in my 
abstraction, due to the Entity reference). Next, since there's a 
cross-subsystem lifetime requirement, that means we can no longer accept 
arbitrary generic user fences returned to the drm_sched as a hw fence. 
Instead we need some kind of wrapper fence similar to what drm_sched 
itself does, or a special subtype leaking into the dma_fence 
abstraction, or an open coded proxy into the underlying user fence that 
isn't actually its own fence, or something.

Now your hw fence keeps a reference to the DRM scheduler, fine. Now what 
happens when a job completes? It signals the hw fence. The DRM scheduler 
thread/workqueue wakes up, signals the job complete fence, and frees the 
job including dropping its fence reference. What happens if nobody else 
is actually holding a reference to those fences? Freeing the job frees 
them too. Which frees the hw fence. What if that was the last reference 
to the DRM scheduler left? We free the DRM scheduler... from its own 
thread. Deadlock!

This is the exact same situation that led to my previous patch to 
directly kill jobs when you free the scheduler, because the alternative 
to keep memory safety was to have jobs hold a reference to the 
scheduler, and then you run into the same deadlock (with fewer steps 
because fences aren't involved). I tried it, it doesn't work.

Of course you could fix it with a sidecar "job freer" thread/workqueue 
or something on the abstraction side to get it out of that execution 
context... and now we're on the way to reimplementing half of the 
scheduler. In my experience, when you start having to add piles of 
functionality to ensure safety and provide a clean Rust API on top of 
the underlying C API, to the point where you're duplicating things the C 
implementation does in order to do them safely, that means the 
underlying C API is not good and you need to fix it instead...

So far, drm_sched has been the only component where I've run into 
this... repeatedly... across several footguns in the API... ;;

~~ Lina

