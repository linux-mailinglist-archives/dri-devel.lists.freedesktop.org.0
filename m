Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA9344742
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586BB89EFF;
	Mon, 22 Mar 2021 14:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5582689EFF;
 Mon, 22 Mar 2021 14:33:10 +0000 (UTC)
IronPort-SDR: b84OuWgQDU4x8xACFO0ApLxz5+DLB0t/xhR2Fn0sudkk/aIC39iqEEd467uuKHvgF4BE3PO7V5
 kkCsLWR7eOhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="251636829"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="251636829"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 07:33:01 -0700
IronPort-SDR: O0CZwoxPwcFsO6sONw19ICnikCIlGoyQg0IA2AnGlmcoFtscxWXoU3t2F2W2GDN2yg81MsSvTL
 p3+/cJVHzGZA==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="407854388"
Received: from rgkirwan-mobl.ger.corp.intel.com (HELO [10.213.212.156])
 ([10.213.212.156])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 07:33:00 -0700
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Drop the CONTEXT_CLONE API
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-4-jason@jlekstrand.net>
 <7918db68-835c-b416-6187-1e62892ce5ed@linux.intel.com>
 <YFilKSbKYd+0HbCn@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <d83162e2-4b9e-c7e9-5324-6612bb9561d6@linux.intel.com>
Date: Mon, 22 Mar 2021 14:32:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFilKSbKYd+0HbCn@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/03/2021 14:09, Daniel Vetter wrote:
> On Mon, Mar 22, 2021 at 11:22:01AM +0000, Tvrtko Ursulin wrote:
>>
>> On 19/03/2021 22:38, Jason Ekstrand wrote:
>>> This API allows one context to grab bits out of another context upon
>>> creation.  It can be used as a short-cut for setparam(getparam()) for
>>> things like I915_CONTEXT_PARAM_VM.  However, it's never been used by any
>>> real userspace.  It's used by a few IGT tests and that's it.  Since it
>>> doesn't add any real value (most of the stuff you can CLONE you can copy
>>> in other ways), drop it.
>>
>> No complaints to remove if it ended up unused outside IGT. Latter is a _big_
>> problem though, since it is much more that a few IGT tests. So I really
>> think there really needs to be an evaluation and a plan for that (we don't
>> want to lose 50% of the coverage over night).
>>
>>> There is one thing that this API allows you to clone which you cannot
>>> clone via getparam/setparam: timelines.  However, timelines are an
>>> implementation detail of i915 and not really something that needs to be
>>
>> Not really true timelines are i915 implementation detail. They are in fact a
>> dma-fence context:seqno concept, nothing more that than. I think you are
>> probably confusing struct intel_timeline with the timeline wording in the
>> uapi. Former is i915 implementation detail, but context:seqno are truly
>> userspace timelines.
> 
> I think you're both saying the same thing and talking a bit past each
> another.
> 
> Yes the timeline is just a string of dma_fence, that's correct. Now
> usually if you submit batches with execbuf, we have 3 ways to synchronize
> concurrent submission: implicit sync, sync_file and drm_syncob. They all
> map to different needs in different protocols/render apis.
> 
> Now in one additional case the kernel makes sure that batchbuffers are
> ordered, and that's when you submit them to the same hw ctx. Because
> there's only 1 hw context and you really can't have batchbuffers run on
> that single hw context out of order. That's what the timeline object we
> talk about here is. But that largely is an internal implementation detail,
> which happens to also use most/all the same infrastructure as the
> dma_fence uapi pieces above.
> 
> Now the internal implementation detail leaking here is that we exposed
> this to userspace, without there being any need for this. What Jason
> implements with syncobj in the next patch is essentially what userspace
> should have been using for cross-engine sync. media userspace doesn't care
> about interop with winsys/client apis, so they equally could have used
> implicit sync or sync_file here (which I think is the solution now for the
> new uapi prepped internally), since they all are about equally powerful
> for stringing batchbuffers together.

Are you saying we exposed a single timeline of execution per hw context 
via the single timeline flag?!

Timelines of execution were always exposed. Any "engine" (ring 
previously) in I915_EXEC_RING_MASK was a single timeline of execution. 
It is completely the same with engine map engines, which are also 
different indices into I915_EXEC_RING_MASK space.

Userspace was aware of these timelines forever as well. Media was 
creating multiple contexts to have multiple timelines (so parallelism). 
Everyone knew that engine-hopping submissions needs to be either 
implicitly or explicitly synchronised, etc.

So I really don't see that we have leaked timelines as a concept *now*. 
What the patch has exposed to userspace is a new way to sync between 
timelines and nothing more.

Regards,

Tvrtko

> So I do think the assessment is accurate, albeit a bit on the terse side.
> Maybe we could quote just the entire thing here in the commit message.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
