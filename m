Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0052C461570
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B1D6E885;
	Mon, 29 Nov 2021 12:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB256E885;
 Mon, 29 Nov 2021 12:46:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="216654673"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="216654673"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 04:46:18 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="499317211"
Received: from epaglier-mobl.amr.corp.intel.com (HELO [10.249.36.141])
 ([10.249.36.141])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 04:46:17 -0800
Message-ID: <1dc1f811-63c6-df6e-ad5b-c2b47614096e@linux.intel.com>
Date: Mon, 29 Nov 2021 13:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH 14/28] drm/i915: Take object lock in
 i915_ggtt_pin if ww is not set
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-14-maarten.lankhorst@linux.intel.com>
 <CAM0jSHMUZwzWQxyECrO7Ak9O3P_UmCFjUqQHMHOezKrY4ZzuYQ@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAM0jSHMUZwzWQxyECrO7Ak9O3P_UmCFjUqQHMHOezKrY4ZzuYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21-10-2021 19:39, Matthew Auld wrote:
> On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> i915_vma_wait_for_bind needs the vma lock held, fix the caller.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_vma.c | 40 +++++++++++++++++++++++----------
>>  1 file changed, 28 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index bacc8d68e495..2877dcd62acb 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -1348,23 +1348,15 @@ static void flush_idle_contexts(struct intel_gt *gt)
>>         intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>  }
>>
>> -int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>> -                 u32 align, unsigned int flags)
>> +static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>> +                          u32 align, unsigned int flags)
>>  {
>>         struct i915_address_space *vm = vma->vm;
>>         int err;
>>
>> -       GEM_BUG_ON(!i915_vma_is_ggtt(vma));
>> -
>> -#ifdef CONFIG_LOCKDEP
>> -       WARN_ON(!ww && dma_resv_held(vma->obj->base.resv));
>> -#endif
>> -
>>         do {
>> -               if (ww)
>> -                       err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
>> -               else
>> -                       err = i915_vma_pin(vma, 0, align, flags | PIN_GLOBAL);
>> +               err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
>> +
>>                 if (err != -ENOSPC) {
>>                         if (!err) {
>>                                 err = i915_vma_wait_for_bind(vma);
>> @@ -1383,6 +1375,30 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>         } while (1);
>>  }
>>
>> +int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>> +                 u32 align, unsigned int flags)
>> +{
>> +       struct i915_gem_ww_ctx _ww;
>> +       int err;
>> +
>> +       GEM_BUG_ON(!i915_vma_is_ggtt(vma));
>> +
>> +       if (ww)
>> +               return __i915_ggtt_pin(vma, ww, align, flags);
>> +
>> +#ifdef CONFIG_LOCKDEP
>> +       WARN_ON(dma_resv_held(vma->obj->base.resv));
> Hmm, so this can't trigger, say if shrinker grabs the lock, or some
> other concurrent user?

No, it checks internally in lockdep that the current task doesn't hold the lock. Others can lock just fine.

dma_resv_is_locked() would check if anyone locked it. :)

~Maarten

