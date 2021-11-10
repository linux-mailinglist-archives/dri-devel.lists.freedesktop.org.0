Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3C44C029
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 12:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29666E043;
	Wed, 10 Nov 2021 11:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347706E043;
 Wed, 10 Nov 2021 11:34:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232497198"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="232497198"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 03:34:32 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="582686329"
Received: from dkeohane-mobl1.ger.corp.intel.com (HELO [10.213.222.153])
 ([10.213.222.153])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 03:34:30 -0800
Subject: Re: [PATCH] drm/i915: Skip error capture when wedged on init
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20211109122037.171128-1-tvrtko.ursulin@linux.intel.com>
 <CAM0jSHOyj3ydgn-bZwk69RfpZLcG03Td_kxowEoJ1fg5PO=W3A@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <42489a16-292d-7ba3-64e6-de79dfa3dfb4@linux.intel.com>
Date: Wed, 10 Nov 2021 11:34:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHOyj3ydgn-bZwk69RfpZLcG03Td_kxowEoJ1fg5PO=W3A@mail.gmail.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/11/2021 10:48, Matthew Auld wrote:
> On Tue, 9 Nov 2021 at 12:20, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Trying to capture uninitialised engines when we wedged on init ends in
>> tears. Skip that together with uC capture, since failure to initialise the
>> latter can actually be one of the reasons for wedging on init.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> This fixes the issue with missing GuC wedging the GPU and then blowing
> up when trying to use the driver?

Probably does not blow up when using the driver, but definitely does 
when accessing error state. Someone suggested it would instead be better 
to call i915_disable_error_state from wedge on init/fini, and I think 
indeed it would, so I plan to send v2 looking like that.

Regards,

Tvrtko

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
>> ---
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 2a2d7643b551..aa2b3aad9643 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1866,10 +1866,14 @@ i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>>                  }
>>
>>                  gt_record_info(error->gt);
>> -               gt_record_engines(error->gt, engine_mask, compress);
>>
>> -               if (INTEL_INFO(i915)->has_gt_uc)
>> -                       error->gt->uc = gt_record_uc(error->gt, compress);
>> +               if (!intel_gt_has_unrecoverable_error(gt)) {
>> +                       gt_record_engines(error->gt, engine_mask, compress);
>> +
>> +                       if (INTEL_INFO(i915)->has_gt_uc)
>> +                               error->gt->uc = gt_record_uc(error->gt,
>> +                                                            compress);
>> +               }
>>
>>                  i915_vma_capture_finish(error->gt, compress);
>>
>> --
>> 2.30.2
>>
