Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E623376554A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 15:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5565A10E586;
	Thu, 27 Jul 2023 13:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F39810E581;
 Thu, 27 Jul 2023 13:43:03 +0000 (UTC)
Message-ID: <05178cf3-df1c-80a7-12ad-816fafbc2df7@linux.intel.com>
Date: Thu, 27 Jul 2023 15:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 16/17] cgroup/drm: Expose memory stats
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-17-tvrtko.ursulin@linux.intel.com>
 <ZLsFBHqCQdPHoZVw@slm.duckdns.org>
 <ea64d7bf-c01b-f4ad-a36b-f77e2c2ea931@linux.intel.com>
 <ZMF3rLioJK9QJ0yj@slm.duckdns.org>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZMF3rLioJK9QJ0yj@slm.duckdns.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On 2023-07-26 21:44, Tejun Heo wrote:
> Hello,
> 
> On Wed, Jul 26, 2023 at 12:14:24PM +0200, Maarten Lankhorst wrote:
>>> So, yeah, if you want to add memory controls, we better think through how
>>> the fd ownership migration should work.
>>
>> I've taken a look at the series, since I have been working on cgroup memory
>> eviction.
>>
>> The scheduling stuff will work for i915, since it has a purely software
>> execlist scheduler, but I don't think it will work for GuC (firmware)
>> scheduling or other drivers that use the generic drm scheduler.
>>
>> For something like this,  you would probably want it to work inside the drm
>> scheduler first. Presumably, this can be done by setting a weight on each
>> runqueue, and perhaps adding a callback to update one for a running queue.
>> Calculating the weights hierarchically might be fun..
> 
> I don't have any idea on this front. The basic idea of making high level
> distribution decisions in core code and letting individual drivers enforce
> that in a way which fits them the best makes sense to me but I don't know
> enough to have an opinion here.
> 
>> I have taken a look at how the rest of cgroup controllers change ownership
>> when moved to a different cgroup, and the answer was: not at all. If we
> 
> For persistent resources, that's the general rule. Whoever instantiates a
> resource gets to own it until the resource gets freed. There is an exception
> with the pid controller and there are discussions around whether we want
> some sort of migration behavior with memcg but yes by and large instantiator
> being the owner is the general model cgroup follows.
> 
>> attempt to create the scheduler controls only on the first time the fd is
>> used, you could probably get rid of all the tracking.
>> This can be done very easily with the drm scheduler.
>>
>> WRT memory, I think the consensus is to track system memory like normal
>> memory. Stolen memory doesn't need to be tracked. It's kernel only memory,
>> used for internal bookkeeping  only.
>>
>> The only time userspace can directly manipulate stolen memory, is by mapping
>> the pinned initial framebuffer to its own address space. The only allocation
>> it can do is when a framebuffer is displayed, and framebuffer compression
>> creates some stolen memory. Userspace is not
>> aware of this though, and has no way to manipulate those contents.
> 
> So, my dumb understanding:
> 
> * Ownership of an fd can be established on the first ioctl call and doesn't
>    need to be migrated afterwards. There are no persistent resources to
>    migration on the first call.
> 
> * Memory then can be tracked in a similar way to memcg. Memory gets charged
>    to the initial instantiator and doesn't need to be moved around
>    afterwards. There may be some discrepancies around stolen memory but the
>    magnitude of inaccuracy introduced that way is limited and bound and can
>    be safely ignored.
> 
> Is that correct?

Hey,

Yeah mostly, I think we can stop tracking stolen memory. I stopped doing 
that for Xe, there is literally nothing to control for userspace in there.

Cheers,
Maarten
