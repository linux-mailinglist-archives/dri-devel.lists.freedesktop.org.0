Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB493345A69
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C60E6E86B;
	Tue, 23 Mar 2021 09:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA46D6E86C;
 Tue, 23 Mar 2021 09:09:54 +0000 (UTC)
IronPort-SDR: c11YDOCoTP1WST6+d4t6QhLnwAJMvQrebGD1daXSR7MIYLsibWOeZFx2iZz84GkG2Pg4tPjnaG
 cxmoX+f3pMuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="177564724"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="177564724"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:09:54 -0700
IronPort-SDR: LxXfl8eSWOyBuYPQE9YXxvR80ON34n0R1l1BAkL8nElV21ZZrMchSQBN4KLL5MTBegGB27/dJe
 njDoef8wySlg==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="452066473"
Received: from fbogue-mobl1.ger.corp.intel.com (HELO [10.213.247.160])
 ([10.213.247.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:09:53 -0700
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915: Restrict sentinel requests
 further
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210318170419.2107512-1-tvrtko.ursulin@linux.intel.com>
 <20210318170419.2107512-3-tvrtko.ursulin@linux.intel.com>
 <CAM0jSHMDqo6tJrwSt3V_nbb5h8QYi-co6c3CxCri=q+xDE1CSw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <51256d88-d643-360a-5a49-25d0a43ebd77@linux.intel.com>
Date: Tue, 23 Mar 2021 09:09:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHMDqo6tJrwSt3V_nbb5h8QYi-co6c3CxCri=q+xDE1CSw@mail.gmail.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/03/2021 17:12, Matthew Auld wrote:
> On Thu, 18 Mar 2021 at 17:04, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Disallow sentinel requests follow previous sentinels to make request
>> cancellation work better when faced with a chain of requests which have
>> all been marked as in error.
> 
> Could you elaborate some more on why this makes request cancellation
> work better?

For cases where we end up with a stream of cancelled requests, it turns 
of request coalescing for them, so they each to get individually skipped 
by the execlists_schedule_in (which is called per ELSP port, not per 
request).

I will improve the commit message.

Regards,

Tvrtko

>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index 4c2acb5a6c0a..4b870eca9693 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -896,7 +896,7 @@ static bool can_merge_rq(const struct i915_request *prev,
>>          if (__i915_request_is_complete(next))
>>                  return true;
>>
>> -       if (unlikely((i915_request_flags(prev) ^ i915_request_flags(next)) &
>> +       if (unlikely((i915_request_flags(prev) | i915_request_flags(next)) &
>>                       (BIT(I915_FENCE_FLAG_NOPREEMPT) |
>>                        BIT(I915_FENCE_FLAG_SENTINEL))))
>>                  return false;
>> --
>> 2.27.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
