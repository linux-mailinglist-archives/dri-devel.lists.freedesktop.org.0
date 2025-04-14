Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427BEA8874B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 17:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC0610E616;
	Mon, 14 Apr 2025 15:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3F2210E616;
 Mon, 14 Apr 2025 15:34:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E17391007;
 Mon, 14 Apr 2025 08:34:39 -0700 (PDT)
Received: from [10.57.87.24] (unknown [10.57.87.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C29873F66E;
 Mon, 14 Apr 2025 08:34:37 -0700 (PDT)
Message-ID: <1b9b8795-5f5c-4831-ad6b-29b88f21b621@arm.com>
Date: Mon, 14 Apr 2025 16:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
 <20250411103837.753cd92e@collabora.com>
 <9fd6fb8c-7dbb-467d-a759-eec852e1f006@amd.com>
 <20250411140254.042f9862@collabora.com>
 <73a28f35-9576-4089-8976-07cd1aa64432@amd.com>
 <20250411150056.62cb7042@collabora.com>
 <c15cef68-bab5-4e09-89ae-52266ab1e4dd@amd.com>
 <20250411163902.1d0db9da@collabora.com>
 <20250414144714.6372738b@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250414144714.6372738b@collabora.com>
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

On 14/04/2025 13:47, Boris Brezillon wrote:
> On Fri, 11 Apr 2025 16:39:02 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Fri, 11 Apr 2025 15:13:26 +0200
>> Christian König <christian.koenig@amd.com> wrote:
>>
>>>>    
>>>>> Background is that you don't get a crash, nor error message, nor
>>>>> anything indicating what is happening.    
>>>> The job times out at some point, but we might get stuck in the fault
>>>> handler waiting for memory, which is pretty close to a deadlock, I
>>>> suspect.    
>>>
>>> I don't know those drivers that well, but at least for amdgpu the
>>> problem would be that the timeout handling would need to grab some of
>>> the locks the memory management is holding waiting for the timeout
>>> handling to do something....
>>>
>>> So that basically perfectly closes the circle. With a bit of lock you
>>> get a message after some time that the kernel is stuck, but since
>>> that are all sleeping locks I strongly doubt so.
>>>
>>> As immediately action please provide patches which changes those
>>> GFP_KERNEL into GFP_NOWAIT.  
>>
>> Sure, I can do that.
> 
> Hm, I might have been too prompt at claiming this was doable. In
> practice, doing that might regress Lima and Panfrost in situations
> where trying harder than GFP_NOWAIT would free up some memory. Not
> saying this was right to use GFP_KERNEL in the first place, but some
> expectations were set by this original mistake, so I'll probably need
> Lima developers to vouch in for this change after they've done some
> testing on a system under high memory pressure, and I'd need to do the
> same kind of testing for Panfrost and ask Steve if he's okay with that
> too.

It's a tricky one. The ideal would be to teach user space how to recover
from the memory allocation failure (even on older GPUs it's still in
theory possible to break up the work and do incremental rendering). But
that ship sailed long ago so this would be a regression.

I did consider GFP_ATOMIC as an option, but really we shouldn't be
accessing "memory reserves" in such a situation.

For background: In the "kbase" driver (Linux kernel driver for the
closed source user space 'DDK' driver for Midgard/Bifrost GPUs) we had a
"JIT memory allocator". The idea here was that if you have multiple
renderings in flight you can attempt to share the tiler heap memory
between them. So in this case when we can't allocate more memory and we
know there's another tiler heap which is going to be freed by a fragment
job that's already running, we can block knowing the memory is going to
become available.

It was designed to do the same thing as CSF's incremental rendering -
allow us to opportunistically allocate memory but not fail the rendering
if it wasn't available.

But it was a nightmare to have any confidence of it being deadlock free
and the implementation was frankly terrible - which is ultimately why
CSF GPU's have this ability in hardware to perform incremental rendering
without failing the job. But effectively this approach requires
allocating just enough memory for one complete tiler heap while ensuring
forward progress and opportunistically allowing extra memory to give a
performance boost.

TLDR; I think we should try switching to GFP_NOWAIT in Panfrost and do
some testing with memory pressure. It might be acceptable (and an
occasional job failure is better than an occasional lock up). If it
turns out it's too easy to trigger job failures like this then we'll
need to rethink.

> For Panthor, I'm less worried, because we have the incremental rendering
> fallback, and assuming GFP_NOWAIT tries hard enough to reclaim
> low-hanging fruits, the perfs shouldn't suffer much more than they
> would today with GFP_KERNEL allocations potentially delaying tiling
> operations longer than would have been with a primitive flush.

Yes for Panthor I think the approach is obvious - I believe GFP_NOWAIT
should trigger background reclaim, so over the course of a few frames it
should make the memory available (assuming there is sufficient 'free'
memory). Indeed it might even give a performance boost if it stops us
getting blocked in direct reclaim.

Thanks,
Steve

