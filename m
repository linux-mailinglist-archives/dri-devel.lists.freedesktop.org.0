Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEED397949
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 19:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E216EA93;
	Tue,  1 Jun 2021 17:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8904E6EA93;
 Tue,  1 Jun 2021 17:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 8A49520201D;
 Tue,  1 Jun 2021 19:39:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ZCJOoid1ilKL; Tue,  1 Jun 2021 19:39:40 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 55B2720201A;
 Tue,  1 Jun 2021 19:39:40 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1lo8Md-001rwG-Bf; Tue, 01 Jun 2021 19:39:39 +0200
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <1945baa6-95d4-3f59-0c0e-01ae65033018@daenzer.net>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
Message-ID: <f83f3ebc-1a72-e719-bc29-22d4302b7769@daenzer.net>
Date: Tue, 1 Jun 2021 19:39:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1945baa6-95d4-3f59-0c0e-01ae65033018@daenzer.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
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

On 2021-06-01 3:18 p.m., Michel Dänzer wrote:
> On 2021-06-01 2:10 p.m., Christian König wrote:
>> Am 01.06.21 um 12:49 schrieb Michel Dänzer:
>>> On 2021-06-01 12:21 p.m., Christian König wrote:
>>>> Am 01.06.21 um 11:02 schrieb Michel Dänzer:
>>>>> On 2021-05-27 11:51 p.m., Marek Olšák wrote:
>>>>>> 3) Compositors (and other privileged processes, and display flipping) can't trust imported/exported fences. They need a timeout recovery mechanism from the beginning, and the following are some possible solutions to timeouts:
>>>>>>
>>>>>> a) use a CPU wait with a small absolute timeout, and display the previous content on timeout
>>>>>> b) use a GPU wait with a small absolute timeout, and conditional rendering will choose between the latest content (if signalled) and previous content (if timed out)
>>>>>>
>>>>>> The result would be that the desktop can run close to 60 fps even if an app runs at 1 fps.
>>>>> FWIW, this is working with
>>>>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 , even with implicit sync (on current Intel GPUs; amdgpu/radeonsi would need to provide the same dma-buf poll semantics as other drivers and high priority GFX contexts via EGL_IMG_context_priority which can preempt lower priority ones).
>>>> Yeah, that is really nice to have.
>>>>
>>>> One question is if you wait on the CPU or the GPU for the new surface to become available?
>>> It's based on polling dma-buf fds, i.e. CPU.
>>>
>>>> The former is a bit bad for latency and power management.
>>> There isn't a choice for Wayland compositors in general, since there can be arbitrary other state which needs to be applied atomically together with the new buffer. (Though in theory, a compositor might get fancy and special-case surface commits which can be handled by waiting on the GPU)
>>>
>>> Latency is largely a matter of scheduling in the compositor. The latency incurred by the compositor shouldn't have to be more than single-digit milliseconds. (I've seen total latency from when the client starts processing a (static) frame to when it starts being scanned out as low as ~6 ms with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620, lower than typical with Xorg)
>>
>> Well let me describe it like this:
>>
>> We have an use cases for 144 Hz guaranteed refresh rate. That essentially means that the client application needs to be able to spit out one frame/window content every ~6.9ms. That's tough, but doable.
>>
>> When you now add 6ms latency in the compositor that means the client application has only .9ms left for it's frame which is basically impossible to do.
> 
> You misunderstood me. 6 ms is the lowest possible end-to-end latency from client to scanout, but the client can start as early as it wants/needs to. It's a trade-off between latency and the risk of missing a scanout cycle.

Note that what I wrote above is about the case where the compositor needs to draw its own frame sampling from the client buffer. If your concern is about a fullscreen application for which the compositor can directly use the application buffers for scanout, it should be possible in theory to get the latency incurred by the compositor down to ~1 ms.

If that's too much[0], it could be improved further by adding atomic KMS API to replace a pending page flip with another one. Then the compositor could just directly submit a flip as soon as a new buffer becomes ready (or even as soon as the client submits it to the compositor, depending on how exactly the new KMS API works). Then the minimum latency should be mostly up to the kernel driver / HW.

Another possibility would be for the application to use KMS directly, e.g. via a DRM lease. That might still require the same new API to get the flip submission latency significantly below 1 ms though.


[0] Though I'm not sure how to reconcile that with "spitting out one frame every ~6.9ms is tough", as that means the theoretical minimum total client→scanout latency is ~7 ms (and missing a scanout cycle ~doubles the latency).

-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
