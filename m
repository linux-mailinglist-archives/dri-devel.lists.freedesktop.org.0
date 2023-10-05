Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA007B9D58
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 15:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FF810E146;
	Thu,  5 Oct 2023 13:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9869C10E146;
 Thu,  5 Oct 2023 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696512872; x=1728048872;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7sH4taq51gnUgU33SYjxXyi6i7WNfD6icBOCmBsE4hI=;
 b=AVcF2jORjOrVsH+CP8bc4TPaHuv0D4+SOCs986N6GNzyqLOELlCJMPyO
 no8PfpYms9nPfurfRkYSFZ5NVgNqhVhHL9IW9rcndlP29pEL3Jk8ukC5N
 LWdAupVVjTbVQ8pCIbgjQOF6mm+j2HmyjB8t8yd+IZX+hnIXjUT2y7zFY
 YiZqcPI2EBe8gVaJkqp775sqXVP4hlzhryKdhHS3tBYvfsKCtqZiPiPZ4
 y0gy6nHNeduC2Hpc+s5yw2yu434IiOiFfJn+0en7wI+soUsWWi5KnJ6l4
 xjqIi4GfRrRg/aIp0VzPHMrBX25m/dh0/t7WM+Ke8VM+DnPFa0XH2JrKg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382365966"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="382365966"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 06:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817568417"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="817568417"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO [10.249.254.40])
 ([10.249.254.40])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 06:23:09 -0700
Message-ID: <36c49bc6-fdb0-16b5-1428-23cf513c85fc@linux.intel.com>
Date: Thu, 5 Oct 2023 15:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: bulk_move in ttm_resource manager
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Zeng, Oak" <oak.zeng@intel.com>
References: <SA1PR11MB69918FBD6B32447AEB6E0F6A92CBA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <d29ad7b31b39e95280cc96ad93613967467721bb.camel@linux.intel.com>
 <a657c5d1-e5ef-446b-9481-c55f2c59c20b@amd.com>
 <fbc3e29ed30e327f6702750a1e4c6a2529fa2f33.camel@linux.intel.com>
 <c1f9e3a1-ac73-4758-b358-a6148b3853e3@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <c1f9e3a1-ac73-4758-b358-a6148b3853e3@amd.com>
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/5/23 12:44, Christian König wrote:
> Am 05.10.23 um 10:36 schrieb Thomas Hellström:
>> On Wed, 2023-10-04 at 14:44 +0200, Christian König wrote:
>>> Am 04.10.23 um 09:17 schrieb Thomas Hellström:
>>>> On Wed, 2023-10-04 at 03:52 +0000, Zeng, Oak wrote:
>>>>> Hi Christian,
>>>>>    As a follow up to this thread:
>>>>> https://www.spinics.net/lists/dri-devel/msg410740.html, I started
>>>>> the
>>>>> work of moving the lru out of ttm_resource_manager and make it a
>>>>> common library for both ttm and svm. While look into the details
>>>>> of
>>>>> the bulk_move in ttm resource manager, I found a potential
>>>>> problem:
>>>>>    For simplicity, let’s say we only have one memory type and one
>>>>> priority, so ttm resource manager only maintains one global lru
>>>>> list.
>>>>> Let’s say this list has 10 nodes, node1 to node10.
>>>>>    But the lru_bulk_move is per vm. Let’s say vm1 has a bulk_move
>>>>> covering node range [node4, node7] and vm2 has a bulk_move
>>>>> covering
>>>>> node range [node6, node9]. Notice those two range has an overlap.
>>>>> Since two vm can simultaneously add nodes to lru, I think this
>>>>> scenario can happen.
>>> That can't happen. See what ttm_resource_move_to_lru_tail() does when
>>> the BO has a bulk move associated with it.
>>>
>>>>>    Now if we perform a bulk move for vm1, moving [node4, node7] to
>>>>> the
>>>>> tail of the lru list. The lru after this bulk move will be:
>>>>> node1,
>>>>> node2, node3,node8,node9, node10, node4, node5, node6, node7. Now
>>>>> notice that for vm2’s bulk_move, the first pointer  (pointing to
>>>>> node6) is actually after the last pointer (pointing to node9),
>>>>> which
>>>>> doesn’t make sense.
>>>>>    Is this a real problem? As I understand it, with this issue, we
>>>>> only
>>>>> mess up the lru list order, but there won’t be any functional
>>>>> problem. If it is a real problem, should we make the bulk_move
>>>>> global
>>>>> instead of per vm based?
>>>>>    Thanks,
>>>>> Oak
>>>> FWIW I have a patch set that converts the TTM bulk move code to
>>>> using
>>>> sublists; a list item is either a resource or a sublist, and when
>>>> performing a bulk move essentially the sublist is moved. Bumping
>>>> resource LRU within a VM would touch only the sublist.
>>> That sounds like my very first attempt at bulk moves which we
>>> abandoned
>>> for various reasons.
>>>
>>> That's easily >5years ago, but the history of that should still be on
>>> the mailing list if I'm not completely mistaken.
>> This here?
>>
>> https://lists.freedesktop.org/archives/amd-gfx/2018-August/025016.html
>>
>> No, in that case it's very different. Or is it an even earlier version?
>
> No, that was even earlier. Basically the first version I discussed 
> with Chunming.
>
> The issue was simple that when you have a hierarchically LRU you also 
> need a multi layer cursor and make sure that you have a single lock 
> for everything.
>
> This is multi layer cursor is complicated to implement and contradicts 
> the idea that we want to walk the LRU with anchors and dropping locks 
> in between (not that we ever implemented that, but it would still be 
> nice to have).
>
Yes, that's sort of what I was trying to implement, although rather list 
permutating so that list items already iterated over end up last in some 
sense. And indeed the iterator gets slightly more complicated, but not 
much really.

> In general when you use some hierarchical LRU you just move the 
> complexity from the insert function to the walk function. And I don't 
> think we would win much with that.

There's also a gain in list_move() simplicity and maintainability, since 
the bulk pos last-and-first become self-adjusting..

But anyway, this is currently on lower priority, so if / when I come up 
with something I'll send anything that changes bulk lru structures last 
so it can be left out if needed.

Thanks,

Thomas


>
> Regards,
> Christian.
>
>>
>> /Thomas
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> Currently functionality and TTM API is essentially the same but
>>>> when
>>>> experimenting with LRU traversal for exhaustive WW-locking eviction
>>>> this concept was easier to use. Also hopefully this would reduce
>>>> fragility and improve understanding since a scenario like the above
>>>> could really never happen...
>>>>
>>>> Let me know if I should send it out as an RFC.
>>>>
>>>> Code is here:
>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/351/commits 
>>>>
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>
>>>>
>>>>
>
