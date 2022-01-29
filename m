Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7947C4A2E4D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 12:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8367610E872;
	Sat, 29 Jan 2022 11:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4A889D02;
 Sat, 29 Jan 2022 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643456331; x=1674992331;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=a2E+q/xIh4DH4VKtSyhc+z5LhZFfi8UMroB/a8yuoxo=;
 b=mX/GyH/fMwez61ErRGZHE0pTr1WVDBErgJB25pEg/gvVd3V5ir/aftof
 w4fb6u9m5XVFoQnrw87CocFmTQWceoogi81tyB5ft+2wwI9VOdsbdR/1a
 5+ey0u+yD9DGXXyZkMpYhYGegNn4/d4sa+vxtLx3pYu8lXR7AxaKuXL0m
 xeHXJ5zU3AbY3fevxjaPgR2DSb7RLCseeD2XdQY6bh6vwb4CtZ0fgb2Ya
 qkkENCW200rHEnYshxLdE4s1ZO+vGQv1KTPxz+p208aLc0uKkQW/DJEkp
 EpD1viFNL495RxmJaVFlbR67M85mGPI4gLYbtc3GLpQDjfKlYBu7mlmU5 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="310575627"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="310575627"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 03:38:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="675325768"
Received: from ianwarx-mobl.ger.corp.intel.com (HELO [10.249.254.225])
 ([10.249.254.225])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 03:38:49 -0800
Message-ID: <40699381-054d-994d-938c-7b43af59678e@linux.intel.com>
Date: Sat, 29 Jan 2022 12:38:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix a race between vma / object
 destruction and unbinding
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220127115622.302970-1-thomas.hellstrom@linux.intel.com>
 <8ca7bd99-06a7-3142-c375-1bf93cb23287@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <8ca7bd99-06a7-3142-c375-1bf93cb23287@linux.intel.com>
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


On 1/28/22 23:32, Tvrtko Ursulin wrote:
>
> On 27/01/2022 11:56, Thomas Hellström wrote:
>> The vma destruction code was using an unlocked advisory check for
>> drm_mm_node_allocated() to avoid racing with eviction code unbinding
>> the vma.
>>
>> This is very fragile and prohibits the dereference of non-refcounted
>> pointers of dying vmas after a call to __i915_vma_unbind(). It also
>> prohibits the dereference of vma->obj of refcounted pointers of
>> dying vmas after a call to __i915_vma_unbind(), since even if a
>> refcount is held on the vma, that won't guarantee that its backing
>> object doesn't get destroyed.
>>
>> So introduce an unbind under the vm mutex at object destroy time,
>> removing all weak references of the vma and its object from the
>> object vma list and from the vm bound list.
>
> Maarten suggested this fixes an oops like seen in 
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_22133/shard-snb6/igt@gem_softpin@softpin.html. 
> If that is so, what would be the Fixes: tag to put here? Although it 
> is too late now so hopefully bug was introduced in something yet 
> unreleased.

Yes, should've had a fixes tag here. Luckily it fixes a very recent 
commit, which shouldn't have had time to be released yet.

>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 1a9e1f940a7d..e03e362d320b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -280,6 +280,12 @@ void __i915_gem_object_pages_fini(struct 
>> drm_i915_gem_object *obj)
>>               GEM_BUG_ON(vma->obj != obj);
>>               spin_unlock(&obj->vma.lock);
>>   +            /* Verify that the vma is unbound under the vm mutex. */
>> +            mutex_lock(&vma->vm->mutex);
>> +            atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>> +            __i915_vma_unbind(vma);
>> +            mutex_unlock(&vma->vm->mutex);
>
> Hm I am not up to speed with the latest design, but how does the verb 
> verify and absence of conditionals reconcile here? Does the comment 
> need improving?

Yes. Ensure would have been better here. There is some rework of the vma 
destruction still needed, though so I'll update or remove the comment 
with those patches.

Thanks,

Thomas



>
> Regards,
>
> Tvrtko
>
>> +
>>               __i915_vma_put(vma);
>>                 spin_lock(&obj->vma.lock);
>>
