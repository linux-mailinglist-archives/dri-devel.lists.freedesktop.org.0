Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477B967E713
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 14:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5219F10E485;
	Fri, 27 Jan 2023 13:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6932410E0BC;
 Fri, 27 Jan 2023 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674827455; x=1706363455;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ssj3B8e8skHTVBIpV4x8AC0AZSa8szTkYCtA0AUVYFU=;
 b=JPHEDEgUWRyuxhxZdeq82ROlgaazijhIaDosKGNE+qG0odD3VFj4YWOR
 oo7jI6PA6k3AmOq0aVmL9XoR83E9pprflbDGyTh5z571pbj/XjItqUHMQ
 GIZrcQLEMhm24GbqixLaXx8+fm6iuxOtzLHvfcOYB8lQV5XNAX2knFsAy
 TL7IPXPlBawW0M2ATxr2QICJZ0f4k6UWVzF6fD8+pChB6FzZQc5EZeX72
 gTKmoTR7eg4/eOAkBStPGY8Ynho3SUl5X1XLTgIp9KbiGkN5tK1qC2Pz1
 LzH6OAmuvyWnt2Lg+rfJiGoGVF0+yHJqrWMMeLGohaHe6pVLs0bhi3nwx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="325760648"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="325760648"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 05:50:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="656600167"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="656600167"
Received: from jgeary-mobl1.ger.corp.intel.com (HELO [10.213.233.162])
 ([10.213.233.162])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 05:50:51 -0800
Message-ID: <314aff2e-c1be-61b1-d764-330f1c276f92@linux.intel.com>
Date: Fri, 27 Jan 2023 13:50:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid potential vm use-after-free
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230119173321.2825472-1-robdclark@gmail.com>
 <f24be4ca-edde-819a-5bcc-070e0d2e23d1@linux.intel.com>
 <CAM0jSHMwbUHu4kH-Y7F956+Us=TiQLJm_7y+1JbGNDaD-2J8pA@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAM0jSHMwbUHu4kH-Y7F956+Us=TiQLJm_7y+1JbGNDaD-2J8pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 katrinzhou <katrinzhou@tencent.com>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/01/2023 13:10, Matthew Auld wrote:
> On Mon, 23 Jan 2023 at 16:57, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> + some more people based on e1a7ab4fca0c
>>
>> On 19/01/2023 17:32, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Adding the vm to the vm_xa table makes it visible to userspace, which
>>> could try to race with us to close the vm.  So we need to take our extra
>>> reference before putting it in the table.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>> Note, you could list commit e1a7ab4fca0c ("drm/i915: Remove the vm open
>>> count") as the "fixed" commit, but really the issue seems to go back
>>> much further (with the fix needing some backporting in the process).
>>
>> It would probably be rather essential to identify the correct Fixes: tag.
>>
>> Since Thomas, Matt and Niranjana you were directly involved in the patch
>> which changed significantly how this works, perhaps there is something
>> still somewhat easily retrievable from your memory lanes to help with this?
> 
> Sorry for the delay. Fix looks good to me,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> Looking at the git history, the fixes tag I think needs to be:
> 
> Fixes: 9ec8795e7d91 ("drm/i915: Drop __rcu from gem_context->vm")
> Cc: <stable@vger.kernel.org> # v5.16+

As discussed offline this looks correct to me too. Thanks for looking 
into it!

Since the CI was green I have now merged the patch. Thanks for the fix Rob!

Regards,

Tvrtko

P.S. Backport to kernels which do not contain e1a7ab4fca0c ("drm/i915: 
Remove the vm open count"), so 5.16 to 5.18, will require a slightly 
different patch as Matt has also mentioned offline.

> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c | 14 +++++++++++---
>>>    1 file changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> index 6250de9b9196..e4b78ab4773b 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> @@ -1861,11 +1861,19 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
>>>        vm = ctx->vm;
>>>        GEM_BUG_ON(!vm);
>>>
>>> +     /*
>>> +      * Get a reference for the allocated handle.  Once the handle is
>>> +      * visible in the vm_xa table, userspace could try to close it
>>> +      * from under our feet, so we need to hold the extra reference
>>> +      * first.
>>> +      */
>>> +     i915_vm_get(vm);
>>> +
>>>        err = xa_alloc(&file_priv->vm_xa, &id, vm, xa_limit_32b, GFP_KERNEL);
>>> -     if (err)
>>> +     if (err) {
>>> +             i915_vm_put(vm);
>>>                return err;
>>> -
>>> -     i915_vm_get(vm);
>>> +     }
>>>
>>>        GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
>>>        args->value = id;
