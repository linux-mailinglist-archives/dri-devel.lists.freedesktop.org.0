Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E2F56BA9F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B83D113BFF;
	Fri,  8 Jul 2022 13:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279E7113BFD;
 Fri,  8 Jul 2022 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657286841; x=1688822841;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=l9IHZQoctXuefILwa08DrWHT1twoVyGQpEM+ac2JZDQ=;
 b=igIUkT41LAM3Toe3aLWTvLa+rv1MgVzLzdRuPtZejB6Qv++oVMO4npHN
 K2vjrC7zEmfEC4tXNsV8Mp+tzUkw6+/Wnxvldgt5j4hzoCbNyfFRRYZlY
 gPAw1NpT4n1dVZSL+v4VGx9mw7uSyUoiKskf5JIN/H8smoYt2MLimGI7U
 UiWjL25SHoD2QlrbYgmC4GDfpZ2VT6ObJzinBresVL62H+hwqRQ4vN+/t
 L4C39bMQZL9ye7S2wew/P5/Yz8Yj60Z7nalLNA4E40klfpQtrnGtSQGn4
 uNYuV1zHX84lP/b5vzf14uJ2izN0rLow/oxJFlfXhVq6QdjmxzzTh5pUJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285020654"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="285020654"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 06:27:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="661771827"
Received: from cmchugh-mobl.ger.corp.intel.com (HELO [10.213.229.21])
 ([10.213.229.21])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 06:27:16 -0700
Message-ID: <68231920-8eef-1e10-df40-ac8cd0dd0802@intel.com>
Date: Fri, 8 Jul 2022 14:27:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v10 04/11] drm/i915/gem: selftest should not attempt mmap
 of private regions
Content-Language: en-GB
To: Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220707200230.1657555-1-bob.beckett@collabora.com>
 <20220707200230.1657555-5-bob.beckett@collabora.com>
 <6e387f90-dce3-486d-83e9-26a975777265@intel.com>
 <08d33248-be80-15ab-d245-a6e23fe55423@collabora.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <08d33248-be80-15ab-d245-a6e23fe55423@collabora.com>
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

On 08/07/2022 14:22, Robert Beckett wrote:
> 
> 
> On 08/07/2022 08:53, Matthew Auld wrote:
>> On 07/07/2022 21:02, Robert Beckett wrote:
>>> During testing make can_mmap consider whether the region is private.
>>
>> Do we still need this with: 938d2fd17d17 ("drm/i915/selftests: skip 
>> the mman tests for stolen") ?
> 
> huh, I guess not. That wasn't in my tree. I guess I should rebase.
> 
> Looking at it, my patch would have been preferable initially I think. 
> Each location of the additional checks in that patch first call 
> cam_mmap(), which I think is the most appropriate place to make the 
> decision.

It fails at the object_create() I think (on small-BAR I mean), which is 
before we can call can_mmap(), passing in the object.

> 
> I could do a replacement patch that reverts that one if preferred, or we 
> can leave it as is and I will drop this patch.
> 
> 
>>
>>>
>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c 
>>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>> index 5bc93a1ce3e3..76181e28c75e 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>> @@ -869,6 +869,9 @@ static bool can_mmap(struct drm_i915_gem_object 
>>> *obj, enum i915_mmap_type type)
>>>       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>>       bool no_map;
>>> +    if (obj->mm.region && obj->mm.region->private)
>>> +        return false;
>>> +
>>>       if (obj->ops->mmap_offset)
>>>           return type == I915_MMAP_TYPE_FIXED;
>>>       else if (type == I915_MMAP_TYPE_FIXED)
