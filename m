Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHQbMrSjcGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:00:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB3854D17
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F43B10E734;
	Wed, 21 Jan 2026 10:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEImx2ue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5B210E72F;
 Wed, 21 Jan 2026 10:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768989615; x=1800525615;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wpVhcqegH84vgpSd/7Z8b3/XFcMb+4orma0aWUeifO0=;
 b=KEImx2ueMtWAoSyMgn+g16X2uUma4BUGs3eP0Xx/b0XuW5f+UEd6evNj
 WAV5Rq3xihYJOw5KwhuhKUtJqE3Wj+WglJ6DJei4qrpudLD1uCoV/zygL
 ez2oAyoKVJeHRKZ5SVOcX6aBi3w+GcTgTbjBl3+6WKeF8av0oCjdrF0Y+
 9f5TqOuSUBAyB1yC7HsGZEIgBi3k82gP5eE1wlaHr06XCV3oeKVI3FDZR
 pDK1G9EmP60DpDrs4SE7P9Fa0duEhlp1MMGPH0YFUBHnp/gB3A6HmGsSl
 p7l+uzTkRyjBsbCht3IJsm4qV7vcL8rv5UHlTf/BcpX58xV389DeY+XGm g==;
X-CSE-ConnectionGUID: lbq3TDAsQgiMWvQ5XBlcNA==
X-CSE-MsgGUID: Ixto/28LQ5iEN5KhxwQ3UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74065617"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="74065617"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 02:00:14 -0800
X-CSE-ConnectionGUID: +KLZcQ2GTdqI+x2MkaVhiw==
X-CSE-MsgGUID: i0xCllZLQqeoIwGwqrl1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206466917"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 02:00:13 -0800
Message-ID: <8673cd9b-7140-4209-9d44-bbf3508cc266@intel.com>
Date: Wed, 21 Jan 2026 10:00:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/buddy: Prevent BUG_ON by validating rounded
 allocation
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20260108113227.2101872-4-sanjay.kumar.yadav@intel.com>
 <20260108113227.2101872-5-sanjay.kumar.yadav@intel.com>
 <654f40ab-8402-4bb1-88ff-742572a1b251@intel.com>
 <0b5fa253-1c2d-45ae-a6bd-0373e27af64c@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <0b5fa253-1c2d-45ae-a6bd-0373e27af64c@amd.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gitlab.freedesktop.org:url,amd.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[matthew.auld@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 9FB3854D17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/01/2026 06:36, Arunpravin Paneer Selvam wrote:
> 
> On 20/01/26 16:11, Matthew Auld wrote:
>> On 08/01/2026 11:32, Sanjay Yadav wrote:
>>> When DRM_BUDDY_CONTIGUOUS_ALLOCATION is set, the requested size is
>>> rounded up to the next power-of-two via roundup_pow_of_two().
>>> Similarly, for non-contiguous allocations with large min_block_size,
>>> the size is aligned up via round_up(). Both operations can produce a
>>> rounded size that exceeds mm->size, which later triggers
>>> BUG_ON(order > mm->max_order).
>>>
>>> Example scenarios:
>>> - 9G CONTIGUOUS allocation on 10G VRAM memory:
>>>    roundup_pow_of_two(9G) = 16G > 10G
>>> - 9G allocation with 8G min_block_size on 10G VRAM memory:
>>>    round_up(9G, 8G) = 16G > 10G
>>>
>>> Fix this by checking the rounded size against mm->size. For
>>> non-contiguous or range allocations where size > mm->size is invalid,
>>> return -EINVAL immediately. For contiguous allocations without range
>>> restrictions, allow the request to fall through to the existing
>>> __alloc_contig_try_harder() fallback.
>>>
>>> This ensures invalid user input returns an error or uses the fallback
>>> path instead of hitting BUG_ON.
>>>
>>> v2: (Matt A)
>>> - Add Fixes, Cc stable, and Closes tags for context
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6712
>>> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
>>> Cc: <stable@vger.kernel.org> # v6.7+
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>
>> Arun/Christian, when you get a chance could you also merge these two 
>> please?
> 
> I have merged these 2 patches as well.

Thanks.

> 
> Regards,
> 
> Arun.
> 
>>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 2f279b46bd2c..5141348fc6c9 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -1155,6 +1155,15 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>       order = fls(pages) - 1;
>>>       min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
>>>   +    if (order > mm->max_order || size > mm->size) {
>>> +        if ((flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) &&
>>> +            !(flags & DRM_BUDDY_RANGE_ALLOCATION))
>>> +            return __alloc_contig_try_harder(mm, original_size,
>>> +                             original_min_size, blocks);
>>> +
>>> +        return -EINVAL;
>>> +    }
>>> +
>>>       do {
>>>           order = min(order, (unsigned int)fls(pages) - 1);
>>>           BUG_ON(order > mm->max_order);
>>

