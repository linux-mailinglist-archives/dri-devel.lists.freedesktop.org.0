Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5A4441D0E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 16:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D806E1F8;
	Mon,  1 Nov 2021 14:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5826E1BB;
 Mon,  1 Nov 2021 14:50:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="231291778"
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; d="scan'208";a="231291778"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 07:50:49 -0700
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; d="scan'208";a="488678959"
Received: from lellis-mobl.ger.corp.intel.com (HELO [10.213.243.87])
 ([10.213.243.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 07:50:47 -0700
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915: Introduce refcounted sg-tables
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211101122444.114607-1-thomas.hellstrom@linux.intel.com>
 <e36fb04f-d652-cbb0-893d-57c32d834168@linux.intel.com>
 <9c4527a077fe7c98858e6312e134e45c15aa17d0.camel@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <03d35a4c-1702-8661-9c2c-e214ce75d3a8@linux.intel.com>
Date: Mon, 1 Nov 2021 14:50:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9c4527a077fe7c98858e6312e134e45c15aa17d0.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 01/11/2021 13:51, Thomas Hellström wrote:
> Hi, Tvrtko
> 
> On Mon, 2021-11-01 at 13:14 +0000, Tvrtko Ursulin wrote:
>>
>> On 01/11/2021 12:24, Thomas Hellström wrote:
>>> As we start to introduce asynchronous failsafe object migration,
>>> where we update the object state and then submit asynchronous
>>> commands we need to record what memory resources are actually used
>>> by various part of the command stream. Initially for three
>>> purposes:
>>>
>>> 1) Error capture.
>>> 2) Asynchronous migration error recovery.
>>> 3) Asynchronous vma bind.
>>
>> FWIW something like this may be interesting to me as well, although I
>> haven't looked much into details yet, for the purpose of allowing
>> delayed "put pages" via decoupling from the GEM bo.
>> Two questions after glancing over:
>>
>> 1)
>> I do wonder if abstracting "sgt" away from the name would make sense?
>> Like perhaps obj->mm.pages being the location of the new abstraction
>> so
>> naming it along the lines of i915_obj_pages or something.
> 
> Well it's not yet clear how this will end up. Really this should
> develop into something along the lines of "struct i915_async_obj", on

Whole gigantic object struct will be needed for async free or for 
something more than that?

> which the sg-list is a member only. Depending on how this turns out and
> if it remains an sg-list I think your suggestion makes sense, but is it
> something we can postpone for now?

...

> 
>>
>> 2)
>> And how come obj->mm.pages remains? Does it go away later in follow
>> up work?
> 
> For the non-ttm backends, it's not yet implemented, so once they are
> either moved to TTM or updated, we can completely replace obj-
>> mm.pages.

... sure, it's your project. I assume there is some time pressure then. 
I was just asking since it looked a bit outside of the usual patterns on 
a glance.

Oh one more question, how will it work for objects which migrate between 
system and local memory? Depending on current placement either 
obj->mm.pages or obj->mm.rsgt will be valid?

Regards,

Tvrtko
