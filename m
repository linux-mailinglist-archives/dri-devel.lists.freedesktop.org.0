Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0105867D3A4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 18:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A8310E967;
	Thu, 26 Jan 2023 17:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FF710E967;
 Thu, 26 Jan 2023 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674755852; x=1706291852;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BQUEAqzlE148mAgRStfAJ82IWpXoVVw/1OpuqObioe4=;
 b=TAQN5QeOL7/ZrO05zNWqOixYV7twfDzKM6tBjrsCqkfbtCkbVEEr2NBs
 +Z+4xwOmynU+A5d9tvUJzNRTFUoWINk6s/qINffm9M6brLmnS588mzLav
 C569M4HYY8MO/KyUvqc/7w92gBkYgYK/W342uDgVJBPmEhOX4J48KTIRB
 Sl/nwKss+xTkyRo8PHFGXQjzCDUdbmPA7Tx5/BLLKJB+t2eKPe08cyusB
 EMJVxZalzEXGl5l2OyEW6E6PgzlSQJ+aNXbLl+UsNsGmpRMbDeVZpcgxw
 6XKt4UxWv2Ua+MvqxdaUEaAN0mQlS09orIZiqiCXH67rFg08eCrjpoha3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="326917869"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="326917869"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 09:57:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="695203757"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="695203757"
Received: from kbrennan-mobl.ger.corp.intel.com (HELO [10.213.233.58])
 ([10.213.233.58])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 09:57:26 -0800
Message-ID: <b8a0872c-fe86-b174-ca3b-0fc04a98e224@linux.intel.com>
Date: Thu, 26 Jan 2023 17:57:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v3 00/12] DRM scheduling cgroup controller
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=c3=bd?=
 <mkoutny@suse.com>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
 <20230123154239.GA24348@blackbody.suse.cz>
 <371f3ce5-3468-b91d-d688-7e89499ff347@linux.intel.com>
 <20230126130050.GA22442@blackbody.suse.cz> <Y9KyiCPYj2Mzym3Z@slm.duckdns.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y9KyiCPYj2Mzym3Z@slm.duckdns.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

(Two replies in one, hope you will manage to navigate it.)

On 26/01/2023 17:04, Tejun Heo wrote:
> Hello,
> 
> On Thu, Jan 26, 2023 at 02:00:50PM +0100, Michal Koutný wrote:
>> On Wed, Jan 25, 2023 at 06:11:35PM +0000, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>> I don't immediately see how you envisage the half-userspace implementation
>>> would look like in terms of what functionality/new APIs would be provided by
>>> the kernel?
>>
>> Output:
>> 	drm.stat (with consumed time(s))
>>
>> Input:
>> 	drm.throttle (alternatives)
>> 	- a) writing 0,1 (in rough analogy to your proposed
>> 	     notifications)
>> 	- b) writing duration (in loose analogy to memory.reclaim)
>> 	     - for how long GPU work should be backed off
>>
>> An userspace agent sitting between these two and it'd do the measurement
>> and calculation depending on given policies (weighting, throttling) and
>> apply respective controls.

Right, I wouldn't recommend drm.throttle as ABI since my idea is to 
enable drivers to do as good job as they individually can. Eg. some may 
be able to be much smarter than simple throttling, or some may start of 
simpler and later gain a better implementation. Some may even have 
differing capability or granularity depending on the GPU model they are 
driving, like in the case of i915.

So even if the RFC shows just a simple i915 implementation, the 
controller itself shouldn't prevent a smarter approach (via exposed 
ABI). And neither this simple i915 implementation works equally well for 
all supported GPU generations! This will be a theme common for many DRM 
drivers.

Secondly, doing this in userspace would require the ability to get some 
sort of an atomic snapshot of the whole tree hierarchy to account for 
changes in layout of the tree and task migrations. Or some retry logic 
with some added ABI fields to enable it.

Even then I think the only thing we would be able to move to userspace 
is the tree-walking logic and that sounds like not that much kernel code 
saved to trade for increased inefficiency.

>> (In resemblance of e.g. https://denji.github.io/cpulimit/)
> 
> Yeah, things like this can be done from userspace but if we're gonna build
> the infrastructure to allow that in gpu drivers and so on, I don't see why
> we wouldn't add a generic in-kernel control layer if we can implement a
> proper weight based control. We can of course also expose .max style
> interface to allow userspace to do whatever they wanna do with it.

Yes agreed, and to re-stress out, the ABI as proposed does not preclude 
changing from scanning to charging or whatever. The idea was for it to 
be compatible in concept with the CPU controller and also avoid baking 
in the controlling method to individual drivers.

>>> Problem there is to find a suitable point to charge at. If for a moment we
>>> limit the discussion to i915, out of the box we could having charging
>>> happening at several thousand times per second to effectively never. This is
>>> to illustrate the GPU context execution dynamics which range from many small
>>> packets of work to multi-minute, or longer. For the latter to be accounted
>>> for we'd still need some periodic scanning, which would then perhaps go per
>>> driver. For the former we'd have thousands of needless updates per second.
>>>
>>> Hence my thinking was to pay both the cost of accounting and collecting the
>>> usage data once per actionable event, where the latter is controlled by some
>>> reasonable scanning period/frequency.
>>>
>>> In addition to that, a few DRM drivers already support GPU usage querying
>>> via fdinfo, so that being externally triggered, it is next to trivial to
>>> wire all those DRM drivers into such common DRM cgroup controller framework.
>>> All that every driver needs to implement on top is the "over budget"
>>> callback.
>>
>> I'd also like show comparison with CPU accounting and controller.
>> There is tick-based (~sampling) measurement of various components of CPU
>> time (task_group_account_field()). But the actual schedulling (weights)
>> or throttling is based on precise accounting (update_curr()).
>>
>> So, if the goal is to have precise and guaranteed limits, it shouldn't
>> (cannot) be based on sampling. OTOH, if it must be sampling based due to
>> variability of the device landscape, it could be advisory mechanism with
>> the userspace component.

I don't think precise and guaranteed limits are feasible given the 
heterogeneous nature of DRM driver capabilities, but I also don't think 
sticking an userspace component in the middle is the way to go.

> As for the specific control mechanism, yeah, charge based interface would be
> more conventional and my suspicion is that transposing the current
> implementation that way likely isn't too difficult. It just pushes "am I
> over the limit?" decisions to the specific drivers with the core layer
> telling them how much under/over budget they are. I'm curious what other 

As I have tried to explain in my previous reply, I don't think real time 
charging is feasible. Because frequency of charging events can both be 
too high and too low. Too high that it doesn't bring value apart from 
increased processing times, where it is not useful to send out 
notification at the same rate, and too low in the sense that some sort 
of periodic query would then be needed in every driver implementation to 
enable all classes of GPU clients to be properly handled.

I just don't see any positives to the charging approach in the DRM 
landscape, but for sure see some negatives. (If we ignore the positive 
of it being a more typical approach, but then I think that is not enough 
to outweigh the negatives.)

gpu
> driver folks think about the current RFC tho. Is at least AMD on board with
> the approach?

Yes I am keenly awaiting comments from the DRM colleagues as well.

Regards,

Tvrtko

P.S. Note that Michal's idea to simplify client tracking is on my TODO 
list. If that works out some patches, the series itself actually, would 
become even simpler.
