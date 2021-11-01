Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76167441D7F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 16:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42436E4AD;
	Mon,  1 Nov 2021 15:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BBB6E4A5;
 Mon,  1 Nov 2021 15:39:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="211087381"
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800"; d="scan'208";a="211087381"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:09:31 -0700
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; d="scan'208";a="727384140"
Received: from unknown (HELO [10.249.254.21]) ([10.249.254.21])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:09:30 -0700
Message-ID: <637271ef-438c-66f0-588d-d5b6e2699c33@linux.intel.com>
Date: Mon, 1 Nov 2021 16:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915: Introduce refcounted sg-tables
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211101122444.114607-1-thomas.hellstrom@linux.intel.com>
 <e36fb04f-d652-cbb0-893d-57c32d834168@linux.intel.com>
 <9c4527a077fe7c98858e6312e134e45c15aa17d0.camel@linux.intel.com>
 <03d35a4c-1702-8661-9c2c-e214ce75d3a8@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <03d35a4c-1702-8661-9c2c-e214ce75d3a8@linux.intel.com>
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
Cc: matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/1/21 15:50, Tvrtko Ursulin wrote:
>
> On 01/11/2021 13:51, Thomas Hellström wrote:
>> Hi, Tvrtko
>>
>> On Mon, 2021-11-01 at 13:14 +0000, Tvrtko Ursulin wrote:
>>>
>>> On 01/11/2021 12:24, Thomas Hellström wrote:
>>>> As we start to introduce asynchronous failsafe object migration,
>>>> where we update the object state and then submit asynchronous
>>>> commands we need to record what memory resources are actually used
>>>> by various part of the command stream. Initially for three
>>>> purposes:
>>>>
>>>> 1) Error capture.
>>>> 2) Asynchronous migration error recovery.
>>>> 3) Asynchronous vma bind.
>>>
>>> FWIW something like this may be interesting to me as well, although I
>>> haven't looked much into details yet, for the purpose of allowing
>>> delayed "put pages" via decoupling from the GEM bo.
>>> Two questions after glancing over:
>>>
>>> 1)
>>> I do wonder if abstracting "sgt" away from the name would make sense?
>>> Like perhaps obj->mm.pages being the location of the new abstraction
>>> so
>>> naming it along the lines of i915_obj_pages or something.
>>
>> Well it's not yet clear how this will end up. Really this should
>> develop into something along the lines of "struct i915_async_obj", on
>
> Whole gigantic object struct will be needed for async free or for 
> something more than that?

I guess it depends on how an async free is supposed to work. For the 
async migration, the plan is that when you migrate, for example between 
LMEM and sys, we first unbind async and get a fence that signals when 
unbinding is complete.  The pages sg list will then be updated 
immediately to point to sys, then the old memory in the form of a struct 
ttm_resource will be freed when fences expire. It's on that ttm resource 
we ideally would want the sg-table to sit, but we avoid that ATM due to 
the awkward way those ttm resources were designed. But it's not a 
super-huge object.

>
>> which the sg-list is a member only. Depending on how this turns out and
>> if it remains an sg-list I think your suggestion makes sense, but is it
>> something we can postpone for now?
>
> ...
>
>>
>>>
>>> 2)
>>> And how come obj->mm.pages remains? Does it go away later in follow
>>> up work?
>>
>> For the non-ttm backends, it's not yet implemented, so once they are
>> either moved to TTM or updated, we can completely replace obj-
>>> mm.pages.
>
> ... sure, it's your project. I assume there is some time pressure then. 

Yes, initially.

> I was just asking since it looked a bit outside of the usual patterns 
> on a glance.
>
> Oh one more question, how will it work for objects which migrate 
> between system and local memory? Depending on current placement either 
> obj->mm.pages or obj->mm.rsgt will be valid?

The contract currently is that obj->mm.pages is *always* valid. 
Sometimes it points to the sg_table embedded in obj->mm.rsgt.

For anything that requires awareness of async migration, like upcoming 
vma resources and error capture, they also need to be aware of 
obj->mm.rsgt and handle refcounting accordingly. If it's NULL they can 
safely assume async migration is not happening.

/Thomas



>
> Regards,
>
> Tvrtko
