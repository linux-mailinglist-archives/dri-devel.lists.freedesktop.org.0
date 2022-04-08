Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B34F92EC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A70B10EF14;
	Fri,  8 Apr 2022 10:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FEF10EF02;
 Fri,  8 Apr 2022 10:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649413764; x=1680949764;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mOI8r0Rqr6JNRC8p9cFhY+wm2LO3eHxeN4SAQSB9wv4=;
 b=kIZygV1LBoeNduhw2gVJVAeHFitBDnEClnRpY/VnK3NrQ52ArLHxhH9h
 q4rot24tseUBAIvQ6PUKqemCtc1h0Nv0h++YQgvye+fFTMrChssJEWTPh
 edU6Imne6m1/ZsD7nr9OLZTaNH1/amxfgqs+1fyZnCQZFxtJwX9yqd2Bq
 LEM+kRRKezYayY81Gm6BBUXNN6GuIThbydR9o2xTAya09KfOQP0fbMpe2
 qMyt2+vjieVQ0ciM5bFh5qkR82G3ItkK5sFT8ujvreZHnkY4h0Y+8RcVR
 NSrK7dZXUR+a/bMFcTsJPjsNGzuwpryJ2hDO7K0bEq+RnrXYia9MRLtIm w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="259160797"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="259160797"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 03:29:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="571443207"
Received: from ddobson-mobl.ger.corp.intel.com (HELO [10.213.224.220])
 ([10.213.224.220])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 03:29:22 -0700
Message-ID: <b03c8d96-26d2-9ef9-1589-f47dd529146e@linux.intel.com>
Date: Fri, 8 Apr 2022 11:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] drm/i915: Inherit submitter nice when scheduling
 requests
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>
References: <20220407151627.3387655-1-tvrtko.ursulin@linux.intel.com>
 <20220407151627.3387655-2-tvrtko.ursulin@linux.intel.com>
 <Yk/rHyGrOlrkDtdR@phenom.ffwll.local>
 <b9fd2365-9412-b496-6e41-757d6d5d0f0c@linux.intel.com>
 <CAPM=9tyJTMBidxLip9XkJjYPNr5s7=oQqLYo9++UtHEemR9DQQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAPM=9tyJTMBidxLip9XkJjYPNr5s7=oQqLYo9++UtHEemR9DQQ@mail.gmail.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/04/2022 10:50, Dave Airlie wrote:
> On Fri, 8 Apr 2022 at 18:25, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 08/04/2022 08:58, Daniel Vetter wrote:
>>> On Thu, Apr 07, 2022 at 04:16:27PM +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Inherit submitter nice at point of request submission to account for long
>>>> running processes getting either externally or self re-niced.
>>>>
>>>> This accounts for the current processing landscape where computational
>>>> pipelines are composed of CPU and GPU parts working in tandem.
>>>>
>>>> Nice value will only apply to requests which originate from user contexts
>>>> and have default context priority. This is to avoid disturbing any
>>>> application made choices of low and high (batch processing and latency
>>>> sensitive compositing). In this case nice value adjusts the effective
>>>> priority in the narrow band of -19 to +20 around
>>>> I915_CONTEXT_DEFAULT_PRIORITY.
>>>>
>>>> This means that userspace using the context priority uapi directly has a
>>>> wider range of possible adjustments (in practice that only applies to
>>>> execlists platforms - with GuC there are only three priority buckets), but
>>>> in all cases nice adjustment has the expected effect: positive nice
>>>> lowering the scheduling priority and negative nice raising it.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> I don't think adding any more fancy features to i915-scheduler makes
>>> sense, at least not before we've cut over to drm/sched.
>>
>> Why do you think so?
>>
>> Drm/sched has at least low/normal/high priority and surely we will keep
>> the i915 context priority ABI.
>>
>> Then this patch is not touching the i915 scheduler at all, neither it is
>> fancy.
>>
>> The cover letter explains how it implements the same approach as the IO
>> scheduler. And it explains the reasoning and benefits. Provides an user
>> experience benefit today, which can easily be preserved.
> 
> won't this cause uAPI divergence between execlists and GuC, like if
> something nices to -15 or -18 with execlists and the same with GuC it
> won't get the same sort of result will it?

Not sure what you consider new ABI divergence but the general problem 
space of execlists vs GuC priority handling is not related to this patch.

Existing GEM context ABI has -1023 - +1023 for user priorities while GuC 
maps that to low/normal/high only. I915_CONTEXT_DEFAULT_PRIORITY is zero 
which maps to GuC normal. Negatives map to GuC low and positives to 
high. Drm/sched is I understand similar or the same.

So any userspace using the existing uapi can already observe differences 
between GuC and execlists. With your example of -15 vs -18 I mean.

I don't think anyone considered that a problem because execution order 
based on priority is not a hard guarantee. Neither is proportionality of 
timeslicing. Otherwise GuC would already be breaking the ABI.

With this patch it simply allows external control - whereas before only 
applications could change their priorities, now users can influence the 
priority of the ones which did not bother to set a non-default priority.

In the case of GuC if user says "nice 10 churn-my-dataset-on-gpu && 
run-my-game", former part get low prio, latter gets normal. I don't see 
any issues there. Same as if the "churn-my-dataset-on-gpu" command 
implemented a command line switch which passed context priority to i915 
via the existing GEM context param ioctl.

I've described the exact experiments in both modes in the cover letter 
which shows it works. (Ignoring the GuC scheduling quirk where 
apparently low-vs-normal timeslices worse than normal-vs-high).

Regards,

Tvrtko
