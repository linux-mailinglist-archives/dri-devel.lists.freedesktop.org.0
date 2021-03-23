Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B9B345AEE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE23B6E29D;
	Tue, 23 Mar 2021 09:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961C16E29D;
 Tue, 23 Mar 2021 09:35:38 +0000 (UTC)
IronPort-SDR: AoXK3TfFqr5muGFvDSzWwfATiKTFC9TAEAOdnCsXU0nee35ta2v3KwJlEZYA/z+Uxsm4fk9U3T
 zYBz5/EV8nlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="190537369"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="190537369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:35:37 -0700
IronPort-SDR: v5eOijKw1td8m8aT4eR99p8DYFKLyQWpA1iom0snynDvPd+ScTa0R3a075Ed2U4Z29jQToERPJ
 +WKtbID0ibVw==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="452073477"
Received: from fbogue-mobl1.ger.corp.intel.com (HELO [10.213.247.160])
 ([10.213.247.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:35:36 -0700
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Implement SINGLE_TIMELINE with
 a syncobj
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-5-jason@jlekstrand.net>
 <b462561b-6340-fdf3-6b1a-e0370bfe090c@linux.intel.com>
 <CAOFGe97y67n4EPb6745QsJdz=ERMn3K-gsLR8Qjmemp92nwMoQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <963d089f-a08a-c3e7-4497-6f7d27b18520@linux.intel.com>
Date: Tue, 23 Mar 2021 09:35:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAOFGe97y67n4EPb6745QsJdz=ERMn3K-gsLR8Qjmemp92nwMoQ@mail.gmail.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/03/2021 16:10, Jason Ekstrand wrote:
> On Mon, Mar 22, 2021 at 7:28 AM Tvrtko Ursulin

[snip]

>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> index 96403130a373d..2c56796f6a71b 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> @@ -3295,6 +3295,15 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>>>                goto err_vma;
>>>        }
>>>
>>> +     if (eb.gem_context->syncobj) {
>>> +             struct dma_fence *fence;
>>> +
>>> +             fence = drm_syncobj_fence_get(eb.gem_context->syncobj);
>>
>> Who drops this reference?
> 
> i915_request_await_dma_fence() below consumes a reference.

Not sure, please check on difference wrt input fence handling.

>>> +             err = i915_request_await_dma_fence(eb.request, fence);
>>> +             if (err)
>>> +                     goto err_ext;
>>> +     }
>>> +
>>>        if (in_fence) {
>>>                if (args->flags & I915_EXEC_FENCE_SUBMIT)
>>>                        err = i915_request_await_execution(eb.request,
>>> @@ -3351,6 +3360,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>>>                        fput(out_fence->file);
>>>                }
>>>        }
>>> +
>>> +     if (eb.gem_context->syncobj) {
>>> +             drm_syncobj_replace_fence(eb.gem_context->syncobj,
>>> +                                       &eb.request->fence);
>>> +     }
>>> +
>>>        i915_request_put(eb.request);
>>>
>>>    err_vma:
>>>
>>
>> So essentially moving the synchronisation to top level which is extra
>> work, but given limited and questionable usage of the uapi may be
>> acceptable. Need full picture on motivation to understand.
> 
> For one thing, the GuC scheduler doesn't natively have a concept of
> "timelines" which can be shared like this.  To work with the GuC

Confused - neither does execlists. It is handled in common layer in 
i915. GuC scheduler has the same concept of one hw context is one 
timeline because that is the hw concept and not backend specific.

> scheduler as currently proposed in DII, they've asked the media driver
> to stop using this flag in favor of passing a sync file from batch to
> batch.  If we want to slide GuC scheduling in smoothly, we've got to
> keep it working.  This means either making timelines a concept there
> or doing an emulation like this.

Hm not aware and don't see that GuC backend can't or doesn't implement 
this. Perhaps this would be best discussed once GuC patches are posted.

>> Semantics are also not 1:1 since dma fence context will be different.
> 
> Could you elaborate?

Exported dma fence context as an "timeline" id will be single with the 
current patch and multiple contexts with this implementation.

Daniel also raised another difference caused by lack of serialisation 
due multiple tl->mutex here.

I don't think this is important, it was never part of a contract what 
happens with racing execbufs, but it is definitely required covering 
both topics in the commit message.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
