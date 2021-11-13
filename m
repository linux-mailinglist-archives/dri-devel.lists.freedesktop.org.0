Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEA444F2BE
	for <lists+dri-devel@lfdr.de>; Sat, 13 Nov 2021 12:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2226FB3F;
	Sat, 13 Nov 2021 11:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331C06FB3F
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 11:26:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10166"; a="233200857"
X-IronPort-AV: E=Sophos;i="5.87,231,1631602800"; d="scan'208";a="233200857"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2021 03:26:05 -0800
X-IronPort-AV: E=Sophos;i="5.87,231,1631602800"; d="scan'208";a="535038441"
Received: from jpajarin-mobl.ger.corp.intel.com (HELO [10.249.254.101])
 ([10.249.254.101])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2021 03:26:04 -0800
Message-ID: <48dbcca4-a47b-28c5-9163-5a1e8960639e@linux.intel.com>
Date: Sat, 13 Nov 2021 12:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
 <20211110145034.487512-1-zackr@vmware.com>
 <61aa563096a20dca80b4cc48037998b932c2e4fc.camel@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <61aa563096a20dca80b4cc48037998b932c2e4fc.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Zack,

On 11/11/21 17:44, Zack Rusin wrote:
> On Wed, 2021-11-10 at 09:50 -0500, Zack Rusin wrote:
>> TTM takes full control over TTM_PL_SYSTEM placed buffers. This makes
>> driver internal usage of TTM_PL_SYSTEM prone to errors because it
>> requires the drivers to manually handle all interactions between TTM
>> which can swap out those buffers whenever it thinks it's the right
>> thing to do and driver.
>>
>> CPU buffers which need to be fenced and shared with accelerators
>> should
>> be placed in driver specific placements that can explicitly handle
>> CPU/accelerator buffer fencing.
>> Currently, apart, from things silently failing nothing is enforcing
>> that requirement which means that it's easy for drivers and new
>> developers to get this wrong. To avoid the confusion we can document
>> this requirement and clarify the solution.
>>
>> This came up during a discussion on dri-devel:
>> https://lore.kernel.org/dri-devel/232f45e9-8748-1243-09bf-56763e6668b3@amd.com

I took a slightly deeper look into this. I think we need to formalize 
this a bit more to understand pros and cons and what the restrictions 
are really all about. Anybody looking at the prevous discussion will 
mostly see arguments similar to "this is stupid and difficult" and "it 
has always been this way" which are not really constructive.

First disregarding all accounting stuff, I think this all boils down to 
TTM_PL_SYSTEM having three distinct states:
1) POPULATED
2) LIMBO (Or whatever we want to call it. No pages present)
3) SWAPPED.

The ttm_bo_move_memcpy() helper understands these, and any standalone 
driver implementation of the move() callback _currently_ needs to 
understand these as well, unless using the ttm_bo_move_memcpy() helper.

Now using a bounce domain to proxy SYSTEM means that the driver can 
forget about the SWAPPED state, it's automatically handled by the move 
setup code. However, another pitfall is LIMBO, in that if when you move 
from SYSTEM/LIMBO to your bounce domain, the BO will be populated. So 
any naive accelerated move() implementation creating a 1GB BO in fixed 
memory, like VRAM, will needlessly allocate and free 1GB of system 
memory in the process instead of just performing a clear operation. 
Looks like amdgpu suffers from this?

I think what is really needed is either

a) A TTM helper that helps move callback implementations resolve the 
issues populating system from LIMBO or SWAP, and then also formalize 
driver notification for swapping. At a minimum, I think the 
swap_notify() callback needs to be able to return a late error.

b) Make LIMBO and SWAPPED distinct memory regions. (I think I'd vote for 
this without looking into it in detail).

In both these cases, we should really make SYSTEM bindable by GPU, 
otherwise we'd just be trading one pitfall for another related without 
really resolving the root problem.

As for fencing not being supported by SYSTEM, I'm not sure why we don't 
want this, because it would for example prohibit async 
ttm_move_memcpy(), and also, async unbinding of ttm_tt memory like MOB 
on vmgfx. (I think it's still sync).

There might be an accounting issue related to this as well, but I guess 
Christian would need to chime in on this. If so, I think it needs to be 
well understood and documented (in TTM, not in AMD drivers).

Thanks,

/Thomas


>
> Polite and gentle ping on that one. Are we ok with the wording here?
>
> z
