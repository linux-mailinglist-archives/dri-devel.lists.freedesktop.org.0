Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5B4BD9B7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 13:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F4A10E32B;
	Mon, 21 Feb 2022 12:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DE410E2FA;
 Mon, 21 Feb 2022 12:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645447190; x=1676983190;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Bj3BVNKy7d7EJflNQE81smjLOfodSdP2to4KIfcWOZA=;
 b=QHtFcZ4VoglJcAru8cux3EvxsPCeWC/u7+JAQyID91peGxHGy0dlOx5m
 Xjzumno7txW7OpSMIqdSgioYkT5m0J1sr+lxUFPyRR8KiSeAaoXi7yaR3
 /zpj1t1vv+sN0+2vfRNmtNHc0MMCB28A5VdBRTtgy6Z0CSpdv6+uDITA9
 mUHG/jQRqwQ0YuxKLSRHlh1DnmxaECD0aF+/8Qm0OQMPgRlQ7XLSbNzc2
 v/OFJ9j1iR21l8gHCLV5nwbGXvmyxYdtd3Yuhg//gkkJlszuNPzulO+22
 oUHFxGmqm4xGhpz/AEzGTumJTJZhtueP28OC69oPzPgpA96qnbndRjJ3n A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="251450146"
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="251450146"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 04:39:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="531843379"
Received: from mkilleen-mobl1.ger.corp.intel.com (HELO [10.213.218.216])
 ([10.213.218.216])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 04:39:49 -0800
Message-ID: <242fada2-dc13-c272-787a-3a0cd4efd52b@linux.intel.com>
Date: Mon, 21 Feb 2022 12:39:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] drm/mm: Ensure that the entry is not NULL before
 extracting rb_node
Content-Language: en-US
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20220217075014.922605-1-vivek.kasireddy@intel.com>
 <20220217075014.922605-2-vivek.kasireddy@intel.com>
 <a37a0c45-615e-e731-e124-7db18bc06e1f@linux.intel.com>
 <20f0acb8260a4f18aeadbcc73847e06f@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20f0acb8260a4f18aeadbcc73847e06f@intel.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/02/2022 03:47, Kasireddy, Vivek wrote:
> Hi Tvrtko,
> 
>>
>> On 17/02/2022 07:50, Vivek Kasireddy wrote:
>>> While looking for next holes suitable for an allocation, although,
>>> it is highly unlikely, make sure that the DECLARE_NEXT_HOLE_ADDR
>>> macro is using a valid node before it extracts the rb_node from it.
>>
>> Was the need for this just a consequence of insufficient locking in the
>> i915 patch?
> [Kasireddy, Vivek] Partly, yes; but I figured since we are anyway doing
> if (!entry || ..), it makes sense to dereference entry and extract the rb_node
> after this check.

Unless I am blind I don't see that it makes a difference. 
"&entry->rb_hole_addr" is taking an address of, which works "fine" is 
entry is NULL. And does not get past the !entry check for the actual 
de-reference via RB_EMPTY_NODE. With your patch you move that after the 
!entry check but still have it in the RB_EMPTY_NODE macro. Again, unless 
I am blind, I think just drop this patch.

Regards,

Tvrtko


> Thanks,
> Vivek
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_mm.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
>>> index 8257f9d4f619..499d8874e4ed 100644
>>> --- a/drivers/gpu/drm/drm_mm.c
>>> +++ b/drivers/gpu/drm/drm_mm.c
>>> @@ -389,11 +389,12 @@ first_hole(struct drm_mm *mm,
>>>    #define DECLARE_NEXT_HOLE_ADDR(name, first, last)			\
>>>    static struct drm_mm_node *name(struct drm_mm_node *entry, u64 size)	\
>>>    {									\
>>> -	struct rb_node *parent, *node = &entry->rb_hole_addr;		\
>>> +	struct rb_node *parent, *node;					\
>>>    									\
>>> -	if (!entry || RB_EMPTY_NODE(node))				\
>>> +	if (!entry || RB_EMPTY_NODE(&entry->rb_hole_addr))		\
>>>    		return NULL;						\
>>>    									\
>>> +	node = &entry->rb_hole_addr;					\
>>>    	if (usable_hole_addr(node->first, size)) {			\
>>>    		node = node->first;					\
>>>    		while (usable_hole_addr(node->last, size))		\
