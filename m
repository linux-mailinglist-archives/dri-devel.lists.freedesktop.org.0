Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0075A65F9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 16:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6E410E09F;
	Tue, 30 Aug 2022 14:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F3E10E04D;
 Tue, 30 Aug 2022 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661868793; x=1693404793;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5X5A3wnuI3GtBLL7NFXQrROshZkBjGw+96X4biE8qj8=;
 b=NAMDIWuHllWaKN+N7iBDEVw0VVQmXLfiymSeG9CkJb2FcCIPEMt20OhG
 MbmTDtECy9KsODZ26S1NdkHE8vcIewxF7ttoa2HitgWJV6D4SvyAYtYat
 qidAiB/jloSw+5GTjBA48h/FMtaETvv1GxKw/hWisI0279gjqx2gMoO9Y
 eVabueaQ2g+b/qRPAf7GZxZ562c2q+DD4RdAW6vKB15nux5xiVwv0OKGV
 pChnoBhgl+QydxQLCosAbaoZwDltEh3CCfjlmCyOWCOt48j7yOpIFMAzL
 3uFQHHNtvSA6CYe1AEELseuxqTxIIlSMLNHkX+3bgTcU0WKzqYPGJL4HQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="321311983"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; d="scan'208";a="321311983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 07:13:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; d="scan'208";a="641389578"
Received: from mkeane-mobl.ger.corp.intel.com (HELO [10.213.199.160])
 ([10.213.199.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 07:13:10 -0700
Message-ID: <4640af66-920f-bae0-9b21-240d198f885a@linux.intel.com>
Date: Tue, 30 Aug 2022 15:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: clear stalled request after a
 reset
Content-Language: en-US
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220811210812.3239621-1-daniele.ceraolospurio@intel.com>
 <bd3abbb2-f3e8-b143-a19d-2cbf9463f7b3@linux.intel.com>
 <c36cf67c-c32f-4883-b56e-9e5322720431@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c36cf67c-c32f-4883-b56e-9e5322720431@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/08/2022 16:31, Ceraolo Spurio, Daniele wrote:
> On 8/12/2022 12:29 AM, Tvrtko Ursulin wrote:
>>
>> On 11/08/2022 22:08, Daniele Ceraolo Spurio wrote:
>>> If the GuC CTs are full and we need to stall the request submission
>>> while waiting for space, we save the stalled request and where the stall
>>> occurred; when the CTs have space again we pick up the request 
>>> submission
>>> from where we left off.
>>
>> How serious is it? Statement always was CT buffers can never get full 
>> outside the pathological IGT test cases. So I am wondering if this is 
>> in the category of fix for correctness or actually the CT buffers can 
>> get full in normal use so it is imperative to fix.
> 
> The CT buffers being full is indeed something that is normally only 
> observed with IGTs that hammer the submission path, but it is still 
> something that a user can do so IMO we do have to fix it. However, the 
> bug is still extremely unlikely to happen out in the wild as it needs 2 
> relatively rare things to happen:
> 
> - We need to hit the pathological case of the GuC CTs being full and the 
> stall kicking in
> - Something needs to go wrong and escalated to a full GT reset
> 
> The bug report that triggered my investigation into this came from what 
> look like faulty HW: the HW seems to suddenly just stop with no errors 
> anywhere, which leads to the buffers filling up because the GuC is no 
> longer processing them, followed by a GT reset as we try to recover the 
> HW. To replicate this locally I had to add a debugfs to kill the GuC in 
> the middle of the test to simulate this "HW silently dies" scenario.

Ack. Given the activity around pin/unpin performance issues I was 
briefly worried this is another one which was "upgraded" from only IGT 
to something in the real world after all. Thanks for confirming that is 
not the case.

Regards,

Tvrtko

> 
> Daniele
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> If a full GT reset occurs, the state of all contexts is cleared and all
>>> non-guilty requests are unsubmitted, therefore we need to restart the
>>> stalled request submission from scratch. To make sure that we do so,
>>> clear the saved request after a reset.
>>>
>>> Fixes note: the patch that introduced the bug is in 5.15, but no
>>> officially supported platform had GuC submission enabled by default
>>> in that kernel, so the backport to that particular version (and only
>>> that one) can potentially be skipped.
>>>
>>> Fixes: 925dc1cf58ed ("drm/i915/guc: Implement GuC submission tasklet")
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> Cc: <stable@vger.kernel.org> # v5.15+
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 0d17da77e787..0d56b615bf78 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -4002,6 +4002,13 @@ static inline void guc_init_lrc_mapping(struct 
>>> intel_guc *guc)
>>>       /* make sure all descriptors are clean... */
>>>       xa_destroy(&guc->context_lookup);
>>>   +    /*
>>> +     * A reset might have occurred while we had a pending stalled 
>>> request,
>>> +     * so make sure we clean that up.
>>> +     */
>>> +    guc->stalled_request = NULL;
>>> +    guc->submission_stall_reason = STALL_NONE;
>>> +
>>>       /*
>>>        * Some contexts might have been pinned before we enabled GuC
>>>        * submission, so we need to add them to the GuC bookeeping.
> 
