Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9496992FA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DBF10ED38;
	Thu, 16 Feb 2023 11:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9509510ED2E;
 Thu, 16 Feb 2023 11:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676546353; x=1708082353;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Sm0QxvOk1DFvxa2ZYw2BmUCx3+7y7BguZyWw01wM+kg=;
 b=VM9+fJ2wlC1YW+N6FU3NL7L/uYNUlnSrbqF3A970T3O6qkAkgluPW4Lj
 +1TcrWazHjFC0kyC8PT+3E3p3EoeT4O2jqzAvj0QbPgA9N5SVDTJJ4pav
 HjL1dnugOq0mgUFbSKTV+2q6y/oHhsGta1+pzaZzzBY3NK0tbBPEEJwFq
 yf7+tkuWv4Cxq8jwXKRUjgWG6oDNqlwUqVOtnjd3EcJSUnokn+5wnI6or
 /4dLlHmWBl/C+H2YUgb7wZQVTvG1P+e581wouV9aMqAhBZXUPtatsPXBr
 cHEOiaWIjbl8A0YBsl4a9HfG3VzkQEBTFkQU0X4ikdpT8TNFKmIMkoNs/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="396333943"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="396333943"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 03:19:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758897405"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="758897405"
Received: from murrayal-mobl.ger.corp.intel.com (HELO [10.213.229.164])
 ([10.213.229.164])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 03:19:11 -0800
Message-ID: <2a70e80c-d683-f9af-93fd-9f81d5028825@linux.intel.com>
Date: Thu, 16 Feb 2023 11:19:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/02/2023 19:14, Rob Clark wrote:
> On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> In i915 we have this concept of "wait boosting" where we give a priority boost
>> for instance to fences which are actively waited upon from userspace. This has
>> it's pros and cons and can certainly be discussed at lenght. However fact is
>> some workloads really like it.
>>
>> Problem is that with the arrival of drm syncobj and a new userspace waiting
>> entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
>> this mini series really (really) quickly to see if some discussion can be had.
>>
>> It adds a concept of "wait count" to dma fence, which is incremented for every
>> explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
>> dma_fence_add_callback but from explicit/userspace wait paths).
> 
> I was thinking about a similar thing, but in the context of dma_fence
> (or rather sync_file) fd poll()ing.  How does the kernel differentiate
> between "housekeeping" poll()ers that don't want to trigger boost but
> simply know when to do cleanup, and waiters who are waiting with some
> urgency.  I think we could use EPOLLPRI for this purpose.

Sounds plausible to allow distinguishing the two.

I wasn't aware one can set POLLPRI in pollfd.events but it appears it could be allowed:

/* Event types that can be polled for.  These bits may be set in `events'
    to indicate the interesting event types; they will appear in `revents'
    to indicate the status of the file descriptor.  */
#define POLLIN          0x001           /* There is data to read.  */
#define POLLPRI         0x002           /* There is urgent data to read.  */
#define POLLOUT         0x004           /* Writing now will not block.  */

> Not sure how that translates to waits via the syncobj.  But I think we
> want to let userspace give some hint about urgent vs housekeeping
> waits.

Probably DRM_SYNCOBJ_WAIT_FLAGS_<something>.

Both look easy additions on top of my series. It would be just a matter of dma_fence_add_callback vs dma_fence_add_wait_callback based on flags, as that's how I called the "explicit userspace wait" one.

It would require userspace changes to make use of it but that is probably okay, or even preferable, since it makes the thing less of a heuristic. What I don't know however is how feasible is to wire it up with say OpenCL, OpenGL or Vulkan, to allow application writers distinguish between house keeping vs performance sensitive waits.

> Also, on a related topic: https://lwn.net/Articles/868468/

Right, I missed that one.

One thing to mention is that my motivation here wasn't strictly waits relating to frame presentation but clvk workloads which constantly move between the CPU and GPU. Even outside the compute domain, I think this is a workload characteristic where waitboost in general helps. The concept of deadline could still be used I guess, just setting it for some artificially early value, when the actual time does not exist. But scanning that discussion seems the proposal got bogged down in interactions between mode setting and stuff?

Regards,

Tvrtko
