Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A90FE41D806
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 12:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A206EB6F;
	Thu, 30 Sep 2021 10:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6285D6EB6D;
 Thu, 30 Sep 2021 10:45:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="205308281"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="205308281"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 03:45:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="479847328"
Received: from rmuntslx-mobl1.ger.corp.intel.com (HELO [10.252.37.149])
 ([10.252.37.149])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 03:45:33 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add ww context to intel_dpt_pin, v2.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>
References: <20210929085950.3063191-1-maarten.lankhorst@linux.intel.com>
 <07332ad2-5a4d-90bc-47b0-069d292ccdad@shipmail.org>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <02d85667-3ba3-cc95-dc2f-81608b952a84@linux.intel.com>
Date: Thu, 30 Sep 2021 12:45:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <07332ad2-5a4d-90bc-47b0-069d292ccdad@shipmail.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 29-09-2021 om 16:50 schreef Thomas Hellström (Intel):
>
> On 9/29/21 10:59, Maarten Lankhorst wrote:
>> Ensure i915_vma_pin_iomap and vma_unpin are done with dpt->obj lock held.
>>
>> I don't think there's much of a point in merging intel_dpt_pin() with
>> intel_pin_fb_obj_dpt(), they touch different objects.
>>
>> Changes since v1:
>> - Fix using the wrong pointer to retrieve error code (Julia)
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
>
> LGTM.
>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dpt.c | 40 +++++++++++++++---------
>>   1 file changed, 25 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
>> index de62bd77b15e..8f7b1f7534a4 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>> @@ -121,32 +121,42 @@ struct i915_vma *intel_dpt_pin(struct i915_address_space *vm)
>>       intel_wakeref_t wakeref;
>>       struct i915_vma *vma;
>>       void __iomem *iomem;
>> +    struct i915_gem_ww_ctx ww;
>> +    int err;
>>         wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>>       atomic_inc(&i915->gpu_error.pending_fb_pin);
>>   -    vma = i915_gem_object_ggtt_pin(dpt->obj, NULL, 0, 4096,
>> -                       HAS_LMEM(i915) ? 0 : PIN_MAPPABLE);
>> -    if (IS_ERR(vma))
>> -        goto err;
>> +    for_i915_gem_ww(&ww, err, true) {
>> +        err = i915_gem_object_lock(dpt->obj, &ww);
>> +        if (err)
>> +            continue;
>>   -    iomem = i915_vma_pin_iomap(vma);
>> -    i915_vma_unpin(vma);
>> -    if (IS_ERR(iomem)) {
>> -        vma = ERR_CAST(iomem);
>> -        goto err;
>> -    }
>> +        vma = i915_gem_object_ggtt_pin_ww(dpt->obj, &ww, NULL, 0, 4096,
>> +                          HAS_LMEM(i915) ? 0 : PIN_MAPPABLE);
>> +        if (IS_ERR(vma)) {
>> +            err = PTR_ERR(vma);
>> +            continue;
>> +        }
>> +
>> +        iomem = i915_vma_pin_iomap(vma);
>> +        i915_vma_unpin(vma);
>>   -    dpt->vma = vma;
>> -    dpt->iomem = iomem;
>> +        if (IS_ERR(iomem)) {
>> +            err = PTR_ERR(iomem);
>> +            continue;
>> +        }
>>   -    i915_vma_get(vma);
>> +        dpt->vma = vma;
>> +        dpt->iomem = iomem;
>> +
>> +        i915_vma_get(vma);
>> +    }
>>   -err:
>>       atomic_dec(&i915->gpu_error.pending_fb_pin);
>>       intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>>   -    return vma;
>> +    return err ? ERR_PTR(err) : vma;
>>   }
>>     void intel_dpt_unpin(struct i915_address_space *vm)

Thanks, pushed

