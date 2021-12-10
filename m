Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2A46FCE6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A922D10E22D;
	Fri, 10 Dec 2021 08:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECA410E236;
 Fri, 10 Dec 2021 08:41:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="238531006"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="238531006"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 00:41:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="463596625"
Received: from kbinis1x-mobl2.gar.corp.intel.com (HELO [10.209.148.127])
 ([10.209.148.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 00:41:23 -0800
Message-ID: <439fb357-cdda-2996-bb63-eaf41a7fe4d1@linux.intel.com>
Date: Fri, 10 Dec 2021 08:41:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Use correct context lock when
 callig clr_context_registered
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20211209184814.21125-1-matthew.brost@intel.com>
 <d1fb9875-4af7-301e-cd83-9aeb7e8a5b52@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <d1fb9875-4af7-301e-cd83-9aeb7e8a5b52@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/12/2021 19:14, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/9/2021 10:48 AM, Matthew Brost wrote:
>> s/ce/cn/ when grabbing guc_state.lock before calling
>> clr_context_registered.
>>
>> Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: <stable@vger.kernel.org>

I think Cc: stable is not needed here:

$ git tag --contains 0f7976506de61
drm-intel-fixes-2021-11-18
drm-intel-gt-next-2021-10-08
drm-intel-gt-next-2021-10-21
drm-intel-gt-next-2021-11-22
drm-intel-next-2021-10-15
drm-intel-next-fixes-2021-11-09
v5.16-rc1
v5.16-rc2
v5.16-rc3
v5.16-rc4

So still can hit 5.16 via fixes. Rodrigo, did I get this right and you 
will be able to pick it up next week or so?

> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> I'm assuming we didn't see any splat from the lockdep assert in 
> clr_context_registered in our CI runs because we never hit this case as 
> it requires 64k+ contexts. Maybe we can add a selftest to purposely 
> exercise this path? Not a blocker for merging this fix.

Was the bug found by inspection or reported?

Given the buggy function is called steal_guc_id, so if the implication 
is there is no testing for guc id stealing, then it indeed please add 
some coverage ASAP.

Regards,

Tvrtko

> 
> Daniele
> 
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 1f9d4fde421f..9b7b4f4e0d91 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1937,9 +1937,9 @@ static int steal_guc_id(struct intel_guc *guc, 
>> struct intel_context *ce)
>>           list_del_init(&cn->guc_id.link);
>>           ce->guc_id = cn->guc_id;
>> -        spin_lock(&ce->guc_state.lock);
>> +        spin_lock(&cn->guc_state.lock);
>>           clr_context_registered(cn);
>> -        spin_unlock(&ce->guc_state.lock);
>> +        spin_unlock(&cn->guc_state.lock);
>>           set_context_guc_id_invalid(cn);
> 
