Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB235252DA
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 18:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527C31129E6;
	Thu, 12 May 2022 16:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592CC10FFC0;
 Thu, 12 May 2022 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652373732; x=1683909732;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jCAWUPcGy3QX9OvjDrXfGEMvdus6MKvGcYde3Vn+2zI=;
 b=RzZMLMDxNMAF/zX/MtwzGKJcJZcUmnqniBoA78m6K+VUpbqrs7pugn26
 QBST9YK/UncdWmxAcWtwHOEBn8++bAQzviLiMfYwNvFgRF4B422EmMC/z
 2xW1BxvXaF2wgPiRIcllBmU4O3v4Wk+jITMb4qEo4MzIx2208bRigqW7h
 wpU/0TvFib6Y8Y335J3cIrHLxdajh7PN0DVJq+Gr7dFeo6fPDTjdxMpcU
 1PXJgWWuajQVNLZnqHPHV41trMFBdBlfwpeNy1Nw3Fjy6fpAV8eC+0vi+
 5RWsIm2Gu8ebvntF8k2fgIRMXWvDrywBMRyH1z+aOfdeeWD7v0moJq+gP w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="295305555"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; d="scan'208";a="295305555"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 09:14:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; d="scan'208";a="739748041"
Received: from ianmurph-mobl.ger.corp.intel.com (HELO [10.252.2.2])
 ([10.252.2.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 09:14:30 -0700
Message-ID: <cd0010ce-0f90-678c-364e-cf39238a21bd@intel.com>
Date: Thu, 12 May 2022 17:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/i915: Use i915_gem_object_ggtt_pin_ww for reloc_iomap
Content-Language: en-GB
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220511115219.46507-1-maarten.lankhorst@linux.intel.com>
 <3dbe7c30-dfef-0cde-b9cb-2ffdcb460113@intel.com>
 <66e2bfe6-6053-9728-63ee-e4aad5a0f631@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <66e2bfe6-6053-9728-63ee-e4aad5a0f631@linux.intel.com>
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
Cc: =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2022 19:38, Maarten Lankhorst wrote:
> Op 11-05-2022 om 20:23 schreef Matthew Auld:
>> On 11/05/2022 12:52, Maarten Lankhorst wrote:
>>> Instead of its own path, use the common path when it doesn't result
>>> in evicting any vma. This fixes the case where we don't wait for
>>> binding.
>>>
>>
>> https://gitlab.freedesktop.org/drm/intel/-/issues/5806
>>
>> If I'm reading that correctly waiting for the bind doesn't seem to help?
> 
> I suspect the actual pinning there might do some stuff that we are not doing.
> 
> It was working before the change, and manually calling pin caused the failure, so I reverted it back to what was working before. It was specifically the manual pin code that was failing.
> 
> I can change the commit message if it helps.

Hmm strange. With the commit message updated,
Acked-by: Matthew Auld <matthew.auld@intel.com>

> 
> ~Maarten
> 
>>> Fixes: b5cfe6f7a6e1 ("drm/i915: Remove short-term pins from execbuf, v6.")
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Reported-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
>>> Tested-by: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 6 ++----
>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> index 498b458fd784..919d01082909 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> @@ -1262,14 +1262,12 @@ static void *reloc_iomap(struct i915_vma *batch,
>>>             * Only attempt to pin the batch buffer to ggtt if the current batch
>>>             * is not inside ggtt, or the batch buffer is not misplaced.
>>>             */
>>> -        if (!i915_is_ggtt(batch->vm)) {
>>> +        if (!i915_is_ggtt(batch->vm) ||
>>> +            !i915_vma_misplaced(batch, 0, 0, PIN_MAPPABLE)) {
>>>                vma = i915_gem_object_ggtt_pin_ww(obj, &eb->ww, NULL, 0, 0,
>>>                                  PIN_MAPPABLE |
>>>                                  PIN_NONBLOCK /* NOWARN */ |
>>>                                  PIN_NOEVICT);
>>> -        } else if (i915_vma_is_map_and_fenceable(batch)) {
>>> -            __i915_vma_pin(batch);
>>> -            vma = batch;
>>>            }
>>>              if (vma == ERR_PTR(-EDEADLK))
> 
> 
