Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5805019F7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 19:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D468210E021;
	Thu, 14 Apr 2022 17:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAFF10E140;
 Thu, 14 Apr 2022 17:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id B79D21F47BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649956990;
 bh=D3Guilrkks6V/1hTwTRFRrqejHfbyPr22LWaBmWvToo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KhEWKrc5jpdpnlEan/SJ5+kGF26hEhzLFsX6DVMxJLGi7R7KpgAMDEYPQJotCaaWo
 uIjlI/MD0FDOyWmglK4Bi4Hy59l9zTdy1cPQZn9lA3euRlaRBBBQAzcuwPj+uUCCdw
 S3wAiqfaQoVYB0G2jzHVZ5llQJCLsva2bCHU/uetz5eis8/YZpOl0FiBd0Mxtdzd8G
 OTfzlMLHdHKlP/rKTgpr7UjcAZ+ni5VCtJPpJ+EjFEjRotb/AiwQHPMa0iVx0F1RsS
 /xWFCgcHZJa9aqNb64gZra/RxZ0455Ef4v8X+NMJyPmLSPY+4iPrhdDBnJXDBP2c7x
 ZrF4tqzg5GgHw==
Message-ID: <2f71160e-01cc-40a5-4661-b998b3acd153@collabora.com>
Date: Thu, 14 Apr 2022 18:29:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/5] drm/i915: stolen memory use ttm backend
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220412193817.2098308-1-bob.beckett@collabora.com>
 <20220412193817.2098308-6-bob.beckett@collabora.com>
 <94ddf51a-90ae-dee8-5d6a-45ee2cd1e584@linux.intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <94ddf51a-90ae-dee8-5d6a-45ee2cd1e584@linux.intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/04/2022 15:41, Thomas Hellström wrote:
> Hi,
> 
> 
> On 4/12/22 21:38, Robert Beckett wrote:
>> +struct ttm_resource *
>> +i915_gem_stolen_reserve_range(struct drm_i915_private *i915,
>> +                  resource_size_t size,
>> +                  u64 start, u64 end)
>>   {
>> -    int ret;
>> +    struct intel_memory_region *mem = i915->mm.stolen_region;
>> -    if (!drm_mm_initialized(&i915->mm.stolen))
>> -        return -ENODEV;
>> -
>> -    /* WaSkipStolenMemoryFirstPage:bdw+ */
>> -    if (GRAPHICS_VER(i915) >= 8 && start < 4096)
>> -        start = 4096;
> 
> Did we lose this Workaround?

woops, looks like we did. Nice catch.
I'll add a reservation at start of day if wa is needed when I issue v4.

> 
> Need to continue reviewing this patchnext week.
> 
> 
> Thx,
> 
> Thomas
> 
> 
> 
> 
>> -
>> -    mutex_lock(&i915->mm.stolen_lock);
>> -    ret = drm_mm_insert_node_in_range(&i915->mm.stolen, node,
>> -                      size, alignment, 0,
>> -                      start, end, DRM_MM_INSERT_BEST);
>> -    mutex_unlock(&i915->mm.stolen_lock);
>> +    if (!mem)
>> +        return ERR_PTR(-ENODEV);
>> +    return intel_region_ttm_resource_alloc(mem, size, start, end, 
>> I915_BO_ALLOC_CONTIGUOUS);
>> +}
>> -
