Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC162C824B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A095389CF8;
	Mon, 30 Nov 2020 10:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD2289CF8;
 Mon, 30 Nov 2020 10:36:52 +0000 (UTC)
IronPort-SDR: o8NpDkCZd3DzGFgWtXiJarOsV8xiIoeL3oARVmSv+xEO3yPMHbX6M2tQdujA+FLtjjtIS8SUgp
 ZzWtyDBwODnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="160386000"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="160386000"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 02:36:50 -0800
IronPort-SDR: 3Oq2z9eo+GPn0GeAr9vThEeAk+CuRu3Eq1bMpGDJMtpwrFdNFTQqkFGiQg4r3Ca6DrbuijJSyb
 9MZ8e2jGGbZA==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="480605490"
Received: from mdubovsk-mobl1.ger.corp.intel.com (HELO [10.254.157.9])
 ([10.254.157.9])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 02:36:48 -0800
Subject: Re: [Intel-gfx] [RFC PATCH 157/162] drm/i915: Improve accuracy of
 eviction stats
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-158-matthew.auld@intel.com>
 <160648802888.2925.2681758176898405257@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f66fed08-e57a-0dbe-2a0f-be865f207647@linux.intel.com>
Date: Mon, 30 Nov 2020 10:36:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160648802888.2925.2681758176898405257@build.alporthouse.com>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/11/2020 14:40, Chris Wilson wrote:
> Quoting Matthew Auld (2020-11-27 12:07:13)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Current code uses jiffie time to do the accounting and then does:
>>
>>    diff = jiffies - start;
>>    msec = diff * 1000 / HZ;
>>    ...
>>    atomic_long_add(msec, &i915->time_swap_out_ms);
>>
>> If we assume jiffie can be as non-granular as 10ms and that the current
>> accounting records all evictions faster than one jiffie as infinite speed,
>> we can end up over-estimating the reported eviction throughput.
>>
>> Fix this by accumulating ktime_t and only dividing to more user friendly
>> granularity at presentation time (debugfs read).
>>
>> At the same time consolidate the code a bit and convert from multiple
>> atomics to single seqlock per stat.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: CQ Tang <cq.tang@intel.com>
>> Cc: Sudeep Dutt <sudeep.dutt@intel.com>
>> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> 
> A lot of effort to fix up patches after the fact, might as well make it
> a real PMU interface.

It did cross my mind and should be easy to add on top if deemed useful 
or interesting.

More importantly, it is okay with me to incorporate this patch into the 
earlier one(s) which first added statistics.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
