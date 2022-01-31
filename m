Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE054A4932
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 15:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0D210E408;
	Mon, 31 Jan 2022 14:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E42110E408;
 Mon, 31 Jan 2022 14:19:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 72AFF1F43400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643638782;
 bh=zLq+h2tZmgDHu03aJieo+9a+SBgp6ZkVG1IliN7+T00=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HXQz65hCvY9bYz8XKigKybbauo1roR4Gpy6vWmZ0gg/JcIkQNIonWTYmzrvchsUh6
 vExlgOOLT7qrog05GTZA+nWclIkA8xtNVw5vbad/goid6fNpDQ3KFvfsiwjlKRCUQc
 4StIbeVfqOR2bSgmXUZi7Q2CDvI6N0A2zN5Q4ao5vA6gw/Qse/CMEKeVH4uxgDVkBA
 cGs1RePfA6WC5eJNMsrJVk4D+3LsF+qItYH/msK6Caz9yu4V/nafHBlVarOPhY8+Vg
 pC1rzQgfRVAJ19eGHWgQic9n08TVmouYfbUhxY/Jf0B6GHDs1UZe4kzCEJLjTHqk6u
 qWS4MLmDJDZoA==
Message-ID: <094b3a2d-0829-c34c-3a3d-e9639095f469@collabora.com>
Date: Mon, 31 Jan 2022 14:19:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v5 1/5] drm/i915: add needs_compact_pt flag
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220125193530.3272386-1-bob.beckett@collabora.com>
 <20220125193530.3272386-2-bob.beckett@collabora.com>
 <6d0a57e7-daf7-6436-e806-7cc8794c2d50@shipmail.org>
 <19bf8290-9308-b5c6-eb73-4020fa81aa66@collabora.com>
 <ce91e091-0df1-5c4d-a070-7b82d74d3f42@shipmail.org>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <ce91e091-0df1-5c4d-a070-7b82d74d3f42@shipmail.org>
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



On 27/01/2022 09:37, Thomas Hellström (Intel) wrote:
> 
> On 1/26/22 18:11, Robert Beckett wrote:
>>
>>
>> On 26/01/2022 13:49, Thomas Hellström (Intel) wrote:
>>>
>>> On 1/25/22 20:35, Robert Beckett wrote:
>>>> From: Ramalingam C <ramalingam.c@intel.com>
>>>>
>>>> Add a new platform flag, needs_compact_pt, to mark the requirement of
>>>> compact pt layout support for the ppGTT when using 64K GTT pages.
>>>>
>>>> With this flag has_64k_pages will only indicate requirement of 64K
>>>> GTT page sizes or larger for device local memory access.
>>>>
>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/i915_drv.h          | 10 +++++++---
>>>>   drivers/gpu/drm/i915/i915_pci.c          |  2 ++
>>>>   drivers/gpu/drm/i915/intel_device_info.h |  1 +
>>>>   3 files changed, 10 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>>>> b/drivers/gpu/drm/i915/i915_drv.h
>>>> index 44c1f98144b4..1258b7779705 100644
>>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>>> @@ -1512,12 +1512,16 @@ IS_SUBPLATFORM(const struct drm_i915_private 
>>>> *i915,
>>>>   /*
>>>>    * Set this flag, when platform requires 64K GTT page sizes or 
>>>> larger for
>>>> - * device local memory access. Also this flag implies that we 
>>>> require or
>>>> - * at least support the compact PT layout for the ppGTT when using 
>>>> the 64K
>>>> - * GTT pages.
>>>
>>> Why do we remove these comment lines?
>> Because HAS_64K_PAGES now means just 64K page, it no longer means also 
>> requires compact pt.
>> This is to support other products that will have 64K but not have the 
>> PDE non-sharing restriction in future.
>>
>> Those lines moved to the next change NEEDS_COMPACT_PT, which is now 
>> separate.
> 
> Yes, NEEDS_COMPACT_PT indicates that compact is *required* but does 
> "HAS_64K_PAGES" still mean compact is supported? That information is lost.
Not any more.
I discussed the ambiguity of the original wording with mauld on irc.
We came to the conclusion that HAS_64K_PAGES should mean just that, that 
the hw has support for 64K pages, and says nothing about compact-pt at all.

NEEDS_COMPACT_PT means that the hw has compact-pt support and the driver 
is required to use it as it is a hw limitation.

There will be other devices that can support compact-pt but do not 
mandate its use. In this case, the current code would not use them, but 
there is potential for some future opportunistic use of that in the 
driver if desired (currently expected to include accelerated 
move/clear). If any opportunistic use is added to the driver, a new flag 
can be added along with the code that uses it to indicate compact-pt 
availability that is not mandatory (HAS_COMPACT_PT most likely), but as 
there is no code requiring it currently it should not be added yet, and 
the comments left as this patch does.

> 
> /Thomas
> 
> 
