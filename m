Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B15422246
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 11:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D7C6EB43;
	Tue,  5 Oct 2021 09:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D9C6EB34;
 Tue,  5 Oct 2021 09:26:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="286574212"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="286574212"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 02:26:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="438629351"
Received: from tbarret1-mobl.ger.corp.intel.com (HELO [10.213.238.194])
 ([10.213.238.194])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 02:26:00 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix bug in user proto-context
 creation that leaked contexts
To: Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jason@jlekstrand.net, Daniel Vetter <daniel@ffwll.ch>
References: <20210922194333.8956-1-matthew.brost@intel.com>
 <ecb916eb-7755-2c19-4f4f-389580f9acd6@linux.intel.com>
 <20211001154859.GA5892@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <3ce7b650-ef10-66e1-1370-99b0522909d4@linux.intel.com>
Date: Tue, 5 Oct 2021 10:25:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001154859.GA5892@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/10/2021 16:48, Matthew Brost wrote:
> On Fri, Oct 01, 2021 at 09:40:19AM +0100, Tvrtko Ursulin wrote:
>>
>> + Daniel as reviewer and maybe merge, avoid falling through cracks at least.
>>
> 
> Ty, working on push rights myself.

I ended up pushing it myself to avoid having a potential crash in the 
driver for too long. Hope people will not mind.

Regards,

Tvrtko

>> On 22/09/2021 20:43, Matthew Brost wrote:
>>> Set number of engines before attempting to create contexts so the
>>> function free_engines can clean up properly. Also check return of
>>> alloc_engines for NULL.
>>>
>>> v2:
>>>    (Tvrtko)
>>>     - Send as stand alone patch
>>>    (John Harrison)
>>>     - Check for alloc_engines returning NULL
>>>
>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Cc: <stable@vger.kernel.org>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> index c2ab0e22db0a..9627c7aac6a3 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> @@ -898,6 +898,11 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>    	unsigned int n;
>>>    	e = alloc_engines(num_engines);
>>> +	if (!e) {
>>> +		return ERR_PTR(-ENOMEM);
>>> +	}
>>
>> Ideally remove the braces and respin.
>>
> 
> Yep, checkpatch didn't like this. Will respin.
>   
>>> +	e->num_engines = num_engines;
>>
>> Theoretically you could have put it next to "e->engines[n] = ce" assignment
>> so the pattern is the same as in default_engines(). Kind of makes more sense
>> that the number is not set before anything is created, but as it doesn't
>> really matter since free_engines handles sparse arrays so there is argument
>> to have a simpler single assignment as well.
>>
> 
> I like a single assignment, let's not overthink this.
>   
>>> +
>>>    	for (n = 0; n < num_engines; n++) {
>>>    		struct intel_context *ce;
>>>    		int ret;
>>> @@ -931,7 +936,6 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>    			goto free_engines;
>>>    		}
>>>    	}
>>> -	e->num_engines = num_engines;
>>>    	return e;
>>>
>>
>> Fix looks good to me. I did not want to butt in but since more than a week
>> has passed without it getting noticed:
>>
> 
> Again, ty.
> 
> Matt
> 
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Regards,
>>
>> Tvrtko
