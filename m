Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB4763337
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 12:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08DF10E1D2;
	Wed, 26 Jul 2023 10:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9EB10E1D2;
 Wed, 26 Jul 2023 10:14:30 +0000 (UTC)
Message-ID: <ea64d7bf-c01b-f4ad-a36b-f77e2c2ea931@linux.intel.com>
Date: Wed, 26 Jul 2023 12:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 16/17] cgroup/drm: Expose memory stats
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-17-tvrtko.ursulin@linux.intel.com>
 <ZLsFBHqCQdPHoZVw@slm.duckdns.org>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZLsFBHqCQdPHoZVw@slm.duckdns.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
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

On 2023-07-22 00:21, Tejun Heo wrote:
> On Wed, Jul 12, 2023 at 12:46:04PM +0100, Tvrtko Ursulin wrote:
>>    $ cat drm.memory.stat
>>    card0 region=system total=12898304 shared=0 active=0 resident=12111872 purgeable=167936
>>    card0 region=stolen-system total=0 shared=0 active=0 resident=0 purgeable=0
>>
>> Data is generated on demand for simplicty of implementation ie. no running
>> totals are kept or accounted during migrations and such. Various
>> optimisations such as cheaper collection of data are possible but
>> deliberately left out for now.
>>
>> Overall, the feature is deemed to be useful to container orchestration
>> software (and manual management).
>>
>> Limits, either soft or hard, are not envisaged to be implemented on top of
>> this approach due on demand nature of collecting the stats.
> 
> So, yeah, if you want to add memory controls, we better think through how
> the fd ownership migration should work.
I've taken a look at the series, since I have been working on cgroup 
memory eviction.

The scheduling stuff will work for i915, since it has a purely software 
execlist scheduler, but I don't think it will work for GuC (firmware) 
scheduling or other drivers that use the generic drm scheduler.

For something like this,  you would probably want it to work inside the 
drm scheduler first. Presumably, this can be done by setting a weight on 
each runqueue, and perhaps adding a callback to update one for a running 
queue. Calculating the weights hierarchically might be fun..

I have taken a look at how the rest of cgroup controllers change 
ownership when moved to a different cgroup, and the answer was: not at 
all. If we attempt to create the scheduler controls only on the first 
time the fd is used, you could probably get rid of all the tracking.
This can be done very easily with the drm scheduler.

WRT memory, I think the consensus is to track system memory like normal 
memory. Stolen memory doesn't need to be tracked. It's kernel only 
memory, used for internal bookkeeping  only.

The only time userspace can directly manipulate stolen memory, is by 
mapping the pinned initial framebuffer to its own address space. The 
only allocation it can do is when a framebuffer is displayed, and 
framebuffer compression creates some stolen memory. Userspace is not
aware of this though, and has no way to manipulate those contents.

Cheers,
~Maarten
