Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 509CF75AC75
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AA110E5A9;
	Thu, 20 Jul 2023 10:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D8D10E5A9;
 Thu, 20 Jul 2023 10:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689850518; x=1721386518;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1nzPh2ldW7JFgjNWEhtnVlvHO52nCzC4d7AFlh05n7E=;
 b=cVnn+wmexiQEqOxlofbZGplFs6GulSrxjEtfvEJFbDlqGRKE537h5wSj
 yzaVbv9aIfs2grPxKeOYq+JVUuPXiTZQIxBwISyi5a/zpQ/Y56HcjoLyI
 uprlf2rKQalk9JBctkKiSB8CljYKZPwRhHXVniiEDr70Upz5EIZpTi6/3
 zxqJXctyHggP7ToyltD+VsHwVl0g99nHZ/RSS93Wu1jkUbdQ1cwR2XJv7
 EcAA7wZTZ/5MZ1dhOJ1HX31ZyYfSVUeFInLKQY+8zxW9WzEu/hUVyUwqG
 b2keXxaMj/cWpoWzBHMrBw3h109zoglbBsjXM+zyPf2X8BEt9sZDSd096 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397574323"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="397574323"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 03:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="727644776"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="727644776"
Received: from ctuohy-mobl1.ger.corp.intel.com (HELO [10.213.193.21])
 ([10.213.193.21])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 03:55:13 -0700
Message-ID: <95de5c1e-f03b-8fb7-b5ef-59ac7ca82f31@linux.intel.com>
Date: Thu, 20 Jul 2023 11:55:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v5 00/17] DRM cgroup controller with scheduling control and
 memory stats
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <CABdmKX1PUF+X897ZMOr0RNiYdoiL_2NkcSt+Eh55BfW-05LopQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CABdmKX1PUF+X897ZMOr0RNiYdoiL_2NkcSt+Eh55BfW-05LopQ@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 19/07/2023 21:31, T.J. Mercier wrote:
> On Wed, Jul 12, 2023 at 4:47 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>    drm.memory.stat
>>          A nested file containing cumulative memory statistics for the whole
>>          sub-hierarchy, broken down into separate GPUs and separate memory
>>          regions supported by the latter.
>>
>>          For example::
>>
>>            $ cat drm.memory.stat
>>            card0 region=system total=12898304 shared=0 active=0 resident=12111872 purgeable=167936
>>            card0 region=stolen-system total=0 shared=0 active=0 resident=0 purgeable=0
>>
>>          Card designation corresponds to the DRM device names and multiple line
>>          entries can be present per card.
>>
>>          Memory region names should be expected to be driver specific with the
>>          exception of 'system' which is standardised and applicable for GPUs
>>          which can operate on system memory buffers.
>>
>>          Sub-keys 'resident' and 'purgeable' are optional.
>>
>>          Per category region usage is reported in bytes.
>>
>>   * Feedback from people interested in drm.active_us and drm.memory.stat is
>>     required to understand the use cases and their usefulness (of the fields).
>>
>>     Memory stats are something which was easy to add to my series, since I was
>>     already working on the fdinfo memory stats patches, but the question is how
>>     useful it is.
>>
> Hi Tvrtko,
> 
> I think this style of driver-defined categories for reporting of
> memory could potentially allow us to eliminate the GPU memory tracking
> tracepoint used on Android (gpu_mem_total). This would involve reading
> drm.memory.stat at the root cgroup (I see it's currently disabled on

I can put it available under root too, don't think there is any 
technical reason to not have it. In fact, now that I look at it again, 
memory.stat is present on root so that would align with my general 
guideline to keep the two as similar as possible.

> the root), which means traversing the whole cgroup tree under the
> cgroup lock to generate the values on-demand. This would be done
> rarely, but I still wonder what the cost of that would turn out to be.

Yeah that's ugly. I could eliminate cgroup_lock by being a bit smarter. 
Just didn't think it worth it for the RFC.

Basically to account memory stats for any sub-tree I need the equivalent 
one struct drm_memory_stats per DRM device present in the hierarchy. So 
I could pre-allocate a few and restart if run out of spares, or 
something. They are really small so pre-allocating a good number, based 
on past state or something, should would good enough. Or even total 
number of DRM devices in a system as a pessimistic and safe option for 
most reasonable deployments.

> The drm_memory_stats categories in the output don't seem like a big
> value-add for this use-case, but no real objection to them being

You mean the fact there are different categories is not a value add for 
your use case because you would only use one?

The idea was to align 1:1 with DRM memory stats fdinfo and somewhat 
emulate how memory.stat also offers a breakdown.

> there. I know it's called the DRM cgroup controller, but it'd be nice
> if there were a way to make the mem tracking part work for any driver
> that wishes to participate as many of our devices don't use a DRM
> driver. But making that work doesn't look like it would fit very

Ah that would be a challenge indeed to which I don't have any answers 
right now.

Hm if you have a DRM device somewhere in the chain memory stats would 
still show up. Like if you had a dma-buf producer which is not a DRM 
driver, but then that buffer was imported by a DRM driver, it would show 
up in a cgroup. Or vice-versa. But if there aren't any in the whole 
chain then it would not.

> cleanly into this controller, so I'll just shut up now.

Not all all, good feedback!

Regards,

Tvrtko
