Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCB649D098
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 18:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3861910E22C;
	Wed, 26 Jan 2022 17:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF5F10E43B;
 Wed, 26 Jan 2022 17:21:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 73D001F44B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643217713;
 bh=a2EttWk/EvkJEucz64EmoVP3sbrDjOfns3KUuviWjqI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Obr630MxwR+xpy71rvzSSru0IhT0L1X7Iom/BKuDfl3xPpvFzRwIBKdhnLf1iyNCh
 rJ+AAP36C61mR3MJnzRPkbW+4X3Npnau6Wwd6juH42uUBddMIZFXVEfvr/q+hRSv8t
 z94rXeh78bR+Bh+ftU/ZAOw19rtvZQpIi7ucwGBO/6JYHsBQ+keOtD6TM1P9enGVec
 Qe2EWANtBdxH2CpjAGVKQR+H1veHXhJl2XxgiQcJtYMo9dPHNkgBrdjANaXDOGFccL
 gQKt++7cO1vU7KzmcWKIeDb2ljkLzQVbDASOThjPbtzXiYTXrIuY2ep9OEavTkDTCc
 EscTw9O3y2Ieg==
Message-ID: <b49d0645-9df0-55d7-3fdb-630befec7656@collabora.com>
Date: Wed, 26 Jan 2022 17:21:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v5 2/5] drm/i915: enforce min GTT alignment
 for discrete cards
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220125193530.3272386-1-bob.beckett@collabora.com>
 <20220125193530.3272386-3-bob.beckett@collabora.com>
 <9f011e69-2d6d-d6a1-db78-d4a061b4ef2c@shipmail.org>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <9f011e69-2d6d-d6a1-db78-d4a061b4ef2c@shipmail.org>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/01/2022 15:45, Thomas Hellström (Intel) wrote:
> 
> On 1/25/22 20:35, Robert Beckett wrote:
>> From: Matthew Auld <matthew.auld@intel.com>
>>
>> For local-memory objects we need to align the GTT addresses
>> to 64K, both for the ppgtt and ggtt.
>>
>> We need to support vm->min_alignment > 4K, depending
>> on the vm itself and the type of object we are inserting.
>> With this in mind update the GTT selftests to take this
>> into account.
>>
>> For compact-pt we further align and pad lmem object GTT addresses
>> to 2MB to ensure PDEs contain consistent page sizes as
>> required by the HW.
>>
>> v3:
>>     * use needs_compact_pt flag to discriminate between
>>       64K and 64K with compact-pt
>>     * add i915_vm_obj_min_alignment
>>     * use i915_vm_obj_min_alignment to round up vma reservation
>>       if compact-pt instead of hard coding
>> v5:
>>     * fix i915_vm_obj_min_alignment for internal objects which
>>       have no memory region
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   .../i915/gem/selftests/i915_gem_client_blt.c  | 23 +++--
>>   drivers/gpu/drm/i915/gt/intel_gtt.c           | 12 +++
>>   drivers/gpu/drm/i915/gt/intel_gtt.h           | 18 ++++
>>   drivers/gpu/drm/i915/i915_vma.c               |  9 ++
>>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 96 ++++++++++++-------
>>   5 files changed, 117 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c 
>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
>> index c8ff8bf0986d..f0bfce53258f 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
>> @@ -39,6 +39,7 @@ struct tiled_blits {
>>       struct blit_buffer scratch;
>>       struct i915_vma *batch;
>>       u64 hole;
>> +    u64 align;
>>       u32 width;
>>       u32 height;
>>   };
>> @@ -410,14 +411,21 @@ tiled_blits_create(struct intel_engine_cs 
>> *engine, struct rnd_state *prng)
>>           goto err_free;
>>       }
>> -    hole_size = 2 * PAGE_ALIGN(WIDTH * HEIGHT * 4);
>> +    t->align = I915_GTT_PAGE_SIZE_2M; /* XXX worst case, derive from 
>> vm! */
>> +    t->align = max(t->align,
>> +               i915_vm_min_alignment(t->ce->vm, INTEL_MEMORY_LOCAL));
>> +    t->align = max(t->align,
>> +               i915_vm_min_alignment(t->ce->vm, INTEL_MEMORY_SYSTEM));
> 
> Don't we always end up with 2M here, regardless of the vm restrictions?
agreed. I will drop the 2M worst case.
> 
> 
