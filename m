Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226C94A49C0
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 15:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9472D10E288;
	Mon, 31 Jan 2022 14:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EEF10E281;
 Mon, 31 Jan 2022 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643641112; x=1675177112;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BxH+tZ/fu2IEVr/ao5807gbpeXmiy9cIQ6HmY7vsj8A=;
 b=h/lKA8rwBqH9QijjbZk6acVqASFgEs+U/ue3KPsvQJZX/NYkeiV7mrG9
 dr56FjyJNOlCLYo72N9hr6hvin821+YlsRFMZSPhDFTPcIRJjCjC53RtA
 AWWcKvBnleA5XlBYhmS8j/Ntc4RKP8EossvwD65GkRq4t6V/5VfUH8VXB
 Q46Kuyd9rZuMZNZyLwDh4TuaYLmJ1Nl0SI/HPO+mYt8DGDZ+kwmlFLraF
 5iQGb6qSNFSK17lNxQ3zfvkveKhf/IaXrVU4B5V++xa/Ttchx9T3gqEah
 DUE9MRtPpo8mGFXXh+FKAKlqMpNbFOXdzMSoAVN6jtUdiOrTcVKMzxKFd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="245068273"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="245068273"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 06:58:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="626388374"
Received: from yeidelbe-mobl1.ger.corp.intel.com (HELO [10.249.254.103])
 ([10.249.254.103])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 06:58:29 -0800
Message-ID: <8ecf5706-84c2-2e30-9ee3-0f428ed95961@linux.intel.com>
Date: Mon, 31 Jan 2022 15:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v5 1/5] drm/i915: add needs_compact_pt flag
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
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
 <094b3a2d-0829-c34c-3a3d-e9639095f469@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <094b3a2d-0829-c34c-3a3d-e9639095f469@collabora.com>
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


On 1/31/22 15:19, Robert Beckett wrote:
>
>
> On 27/01/2022 09:37, Thomas Hellström (Intel) wrote:
>>
>> On 1/26/22 18:11, Robert Beckett wrote:
>>>
>>>
>>> On 26/01/2022 13:49, Thomas Hellström (Intel) wrote:
>>>>
>>>> On 1/25/22 20:35, Robert Beckett wrote:
>>>>> From: Ramalingam C <ramalingam.c@intel.com>
>>>>>
>>>>> Add a new platform flag, needs_compact_pt, to mark the requirement of
>>>>> compact pt layout support for the ppGTT when using 64K GTT pages.
>>>>>
>>>>> With this flag has_64k_pages will only indicate requirement of 64K
>>>>> GTT page sizes or larger for device local memory access.
>>>>>
>>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/i915_drv.h          | 10 +++++++---
>>>>>   drivers/gpu/drm/i915/i915_pci.c          |  2 ++
>>>>>   drivers/gpu/drm/i915/intel_device_info.h |  1 +
>>>>>   3 files changed, 10 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>>>>> b/drivers/gpu/drm/i915/i915_drv.h
>>>>> index 44c1f98144b4..1258b7779705 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>>>> @@ -1512,12 +1512,16 @@ IS_SUBPLATFORM(const struct 
>>>>> drm_i915_private *i915,
>>>>>   /*
>>>>>    * Set this flag, when platform requires 64K GTT page sizes or 
>>>>> larger for
>>>>> - * device local memory access. Also this flag implies that we 
>>>>> require or
>>>>> - * at least support the compact PT layout for the ppGTT when 
>>>>> using the 64K
>>>>> - * GTT pages.
>>>>
>>>> Why do we remove these comment lines?
>>> Because HAS_64K_PAGES now means just 64K page, it no longer means 
>>> also requires compact pt.
>>> This is to support other products that will have 64K but not have 
>>> the PDE non-sharing restriction in future.
>>>
>>> Those lines moved to the next change NEEDS_COMPACT_PT, which is now 
>>> separate.
>>
>> Yes, NEEDS_COMPACT_PT indicates that compact is *required* but does 
>> "HAS_64K_PAGES" still mean compact is supported? That information is 
>> lost.
> Not any more.
> I discussed the ambiguity of the original wording with mauld on irc.
> We came to the conclusion that HAS_64K_PAGES should mean just that, 
> that the hw has support for 64K pages, and says nothing about 
> compact-pt at all.
>
> NEEDS_COMPACT_PT means that the hw has compact-pt support and the 
> driver is required to use it as it is a hw limitation.
>
> There will be other devices that can support compact-pt but do not 
> mandate its use. In this case, the current code would not use them, 
> but there is potential for some future opportunistic use of that in 
> the driver if desired (currently expected to include accelerated 
> move/clear). If any opportunistic use is added to the driver, a new 
> flag can be added along with the code that uses it to indicate 
> compact-pt availability that is not mandatory (HAS_COMPACT_PT most 
> likely), but as there is no code requiring it currently it should not 
> be added yet, and the comments left as this patch does.
>
Ok, Thanks for the clarification.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



>>
>> /Thomas
>>
>>
