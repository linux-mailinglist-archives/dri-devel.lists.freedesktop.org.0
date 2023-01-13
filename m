Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B760D669265
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 10:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A11710E9CA;
	Fri, 13 Jan 2023 09:10:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DA5892FD;
 Fri, 13 Jan 2023 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673601028; x=1705137028;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fOr/1I3YrmbIYI4Sfb7dAxCfX7zx4hRXlIEK9Ij1POQ=;
 b=g6V7otvdRYSA0BjEUhK9fc5Ia83B+xFUvifCLRHHnzCYqFrLAbd5ycN1
 OdyTvydldWfAPzwfjhAT1eBCCFwMrN70peoF30yh4CwUchC4XgG9e2XNi
 gkZvfvloxyh8VmJ+EzySwIDd7kTpEMzojub3JIWPpfX6vhhmY3QnYocT5
 ApkI5YkB5ZrNOiuyeq0eFzDasyAUnD0GH3NRia3ljS827LP7YCokE40S+
 gORXS5vgFL9hIYxF7o0wEwvFq5DzdYx7FirbZyFhHSGyp3IKYcNw0NiYu
 D+kZApdIG5jgzNg4BxkcSO5seo405glDHOyv+v4MMqx+OjlD6JJ5NUUxJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="321648311"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="321648311"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:10:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="660144975"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="660144975"
Received: from skenned1-mobl.ger.corp.intel.com (HELO [10.213.196.186])
 ([10.213.196.186])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:10:24 -0800
Message-ID: <e532ffc2-09a5-126d-f4e4-e5e2a503a5fa@linux.intel.com>
Date: Fri, 13 Jan 2023 09:10:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915: Allow error capture of a
 pending request
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-3-John.C.Harrison@Intel.com>
 <dab002d8-75f7-d8b5-d0a0-a6a21ec724b0@linux.intel.com>
 <5a8be54d-9627-3d60-b6b0-22f3732e6962@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <5a8be54d-9627-3d60-b6b0-22f3732e6962@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/01/2023 20:46, John Harrison wrote:
> On 1/12/2023 02:06, Tvrtko Ursulin wrote:
>> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> A hang situation has been observed where the only requests on the
>>> context were either completed or not yet started according to the
>>> breaadcrumbs. However, the register state claimed a batch was (maybe)
>>> in progress. So, allow capture of the pending request on the grounds
>>> that this might be better than nothing.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_gpu_error.c | 8 +++-----
>>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>>> index bd2cf7d235df0..2e338a9667a4b 100644
>>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>> @@ -1628,11 +1628,9 @@ capture_engine(struct intel_engine_cs *engine,
>>>       if (ce) {
>>>           intel_engine_clear_hung_context(engine);
>>>           rq = intel_context_find_active_request(ce);
>>> -        if (rq && !i915_request_started(rq)) {
>>> -            drm_info(&engine->gt->i915->drm, "Got hung context on %s 
>>> with no active request!\n",
>>> -                 engine->name);
>>> -            rq = NULL;
>>> -        }
>>> +        if (rq && !i915_request_started(rq))
>>> +            drm_info(&engine->gt->i915->drm, "Confused - active 
>>> request not yet started: %lld:%lld, ce = 0x%04X/%s!\n",
>>> +                 rq->fence.context, rq->fence.seqno, ce->guc_id.id, 
>>> engine->name);
>>
>> Ah you change active to started in this patch! :)
> Yeah, I'm wanting to keep these two patches separate. This one is a more 
> questionable change in actual behaviour. The previous patch just allows 
> capturing the context when the request has been rejected. Whereas this 
> one changes the request acceptance criteria. With the potential to start 
> blaming innocent requests. It seems plausible to me, especially with the 
> warning message. We know the context owning the request is guilty so why 
> wouldn't we blame that request just because the tracking is off (maybe 
> due to some driver bug). But I could see someone objecting on grounds of 
> being super strict about who/what gets blamed for a hang and either 
> nacks or maybe wants this change reverted some time later.
> 
>>
>> I suggest no "ce" in user visible messages and maybe stick with the 
>> convention grep suggest is already established:
>>
>> "Hung context with active request %lld:%lld [0x%04X] not started!"
>>
> Are you also meaning to drop the engine name? I think it is important to 
> keep the '%s' in there somewhere.

No sorry, just an oversight.

"Hung context on %s with active request %lld:%lld [0x%04X] not started!"

Doesn't have to be exactly that, only trying to illustrate what style 
looks better to me when user facing - not mentioning confusing and fewer 
special characters.

Regards,

Tvrtko

> 
> John.
> 
> 
>> Regards,
>>
>> Tvrtko
>>
>>>       } else {
>>>           /*
>>>            * Getting here with GuC enabled means it is a forced error 
>>> capture
> 
