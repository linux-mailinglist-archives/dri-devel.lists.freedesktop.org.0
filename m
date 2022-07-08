Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B13856BACE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D832113C46;
	Fri,  8 Jul 2022 13:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B85113C41;
 Fri,  8 Jul 2022 13:31:48 +0000 (UTC)
Received: from [192.168.178.53] (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E7B9966019BD;
 Fri,  8 Jul 2022 14:31:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657287107;
 bh=9aqKBEmL0mePVbm0H5VgD1JSnIfv5pf2hncBFPn3xBc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R0CLTGeYI4w4Tf9rZXPEZvkC2OGM7L1krC9voBm79jzgDd3rImBOZZhjpBn8cMkM3
 LZ78QLZTevWRBvNKLbMZIWmc3eIF9059xfwnR8IwKsPrWmhmZQY6uPsXEnDpG/kgFN
 F3qo/6O0n4njt5VADrPuLpnJUP/UB+gfiCUi7OMY8y6Kquipv3jSP2iuNFB7SzkMqr
 TnLZZFVo1fALcrAFRk/yhCjKOZYq58vwcb4nfhuclyMlEhTSzD9scWfcUxP+V4rvXw
 PEBV+Ye/ZfIz7bvOoiE9zKEy0mZdUrI7l/HwSKNhwRAekDqa70cZR0kls26d37TQSn
 M8d60n/WXHwSA==
Message-ID: <9546dda7-48ec-58fe-d464-53338948b0d3@collabora.com>
Date: Fri, 8 Jul 2022 14:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v10 04/11] drm/i915/gem: selftest should not attempt mmap
 of private regions
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220707200230.1657555-1-bob.beckett@collabora.com>
 <20220707200230.1657555-5-bob.beckett@collabora.com>
 <6e387f90-dce3-486d-83e9-26a975777265@intel.com>
 <08d33248-be80-15ab-d245-a6e23fe55423@collabora.com>
 <68231920-8eef-1e10-df40-ac8cd0dd0802@intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <68231920-8eef-1e10-df40-ac8cd0dd0802@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/07/2022 14:27, Matthew Auld wrote:
> On 08/07/2022 14:22, Robert Beckett wrote:
>>
>>
>> On 08/07/2022 08:53, Matthew Auld wrote:
>>> On 07/07/2022 21:02, Robert Beckett wrote:
>>>> During testing make can_mmap consider whether the region is private.
>>>
>>> Do we still need this with: 938d2fd17d17 ("drm/i915/selftests: skip 
>>> the mman tests for stolen") ?
>>
>> huh, I guess not. That wasn't in my tree. I guess I should rebase.
>>
>> Looking at it, my patch would have been preferable initially I think. 
>> Each location of the additional checks in that patch first call 
>> cam_mmap(), which I think is the most appropriate place to make the 
>> decision.
> 
> It fails at the object_create() I think (on small-BAR I mean), which is 
> before we can call can_mmap(), passing in the object.

ah, okay. That makes sense to keep as is then.
I'll drop this patch.
Thanks.

> 
>>
>> I could do a replacement patch that reverts that one if preferred, or 
>> we can leave it as is and I will drop this patch.
>>
>>
>>>
>>>>
>>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c 
>>>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>>> index 5bc93a1ce3e3..76181e28c75e 100644
>>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>>> @@ -869,6 +869,9 @@ static bool can_mmap(struct drm_i915_gem_object 
>>>> *obj, enum i915_mmap_type type)
>>>>       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>>>       bool no_map;
>>>> +    if (obj->mm.region && obj->mm.region->private)
>>>> +        return false;
>>>> +
>>>>       if (obj->ops->mmap_offset)
>>>>           return type == I915_MMAP_TYPE_FIXED;
>>>>       else if (type == I915_MMAP_TYPE_FIXED)
