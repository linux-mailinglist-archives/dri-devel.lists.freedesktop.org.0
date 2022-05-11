Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12080523CB0
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 20:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841B010EAB5;
	Wed, 11 May 2022 18:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557C410E858;
 Wed, 11 May 2022 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652294330; x=1683830330;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8kZEn1h34p1KRU95kEkMZDdWHm7OgHXCdGnySUBSJoE=;
 b=DyJnc+Kp4Ee9SOL8agaxOW2AK9hSHUEI0i/tLO6UoBPF+P9Yog1JHfZg
 kwVYzYDfq5hyhWNXLTSS691XYj1mi+XCNvdQuwzHfUBr0j7qeJ4hSlYL4
 dG7/NhaGDSVywyiBlSVMQBLkfmev4YS28n6rqRUn+dRTEl7pZADy2aHaD
 13YgceDtO0guEB87QMN54xJx4xrcwnK53nTEsudDfKohebQk1yQ82UvJh
 pfArK8UDO1zKUOD4osNlvDMKFOIEwao0rmbZLKoCmP68VJVDpew5fnXr8
 S5Hh7MneUCCCh8Whe+UvJNLCHsEJQTaDa/cXFjSwhd1YGLgClIxQ9CVSu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="356207853"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="356207853"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 11:38:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="566309715"
Received: from akulalak-mobl.gar.corp.intel.com (HELO [10.252.35.177])
 ([10.252.35.177])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 11:38:25 -0700
Message-ID: <66e2bfe6-6053-9728-63ee-e4aad5a0f631@linux.intel.com>
Date: Wed, 11 May 2022 20:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/i915: Use i915_gem_object_ggtt_pin_ww for reloc_iomap
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220511115219.46507-1-maarten.lankhorst@linux.intel.com>
 <3dbe7c30-dfef-0cde-b9cb-2ffdcb460113@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <3dbe7c30-dfef-0cde-b9cb-2ffdcb460113@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 11-05-2022 om 20:23 schreef Matthew Auld:
> On 11/05/2022 12:52, Maarten Lankhorst wrote:
>> Instead of its own path, use the common path when it doesn't result
>> in evicting any vma. This fixes the case where we don't wait for
>> binding.
>>
>
> https://gitlab.freedesktop.org/drm/intel/-/issues/5806
>
> If I'm reading that correctly waiting for the bind doesn't seem to help?

I suspect the actual pinning there might do some stuff that we are not doing.

It was working before the change, and manually calling pin caused the failure, so I reverted it back to what was working before. It was specifically the manual pin code that was failing.

I can change the commit message if it helps.

~Maarten

>> Fixes: b5cfe6f7a6e1 ("drm/i915: Remove short-term pins from execbuf, v6.")
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Reported-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
>> Tested-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 498b458fd784..919d01082909 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -1262,14 +1262,12 @@ static void *reloc_iomap(struct i915_vma *batch,
>>            * Only attempt to pin the batch buffer to ggtt if the current batch
>>            * is not inside ggtt, or the batch buffer is not misplaced.
>>            */
>> -        if (!i915_is_ggtt(batch->vm)) {
>> +        if (!i915_is_ggtt(batch->vm) ||
>> +            !i915_vma_misplaced(batch, 0, 0, PIN_MAPPABLE)) {
>>               vma = i915_gem_object_ggtt_pin_ww(obj, &eb->ww, NULL, 0, 0,
>>                                 PIN_MAPPABLE |
>>                                 PIN_NONBLOCK /* NOWARN */ |
>>                                 PIN_NOEVICT);
>> -        } else if (i915_vma_is_map_and_fenceable(batch)) {
>> -            __i915_vma_pin(batch);
>> -            vma = batch;
>>           }
>>             if (vma == ERR_PTR(-EDEADLK))


