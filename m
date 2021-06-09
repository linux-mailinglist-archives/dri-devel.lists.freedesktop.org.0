Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AE23A1521
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 15:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A466E14B;
	Wed,  9 Jun 2021 13:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606C16E05A;
 Wed,  9 Jun 2021 13:08:52 +0000 (UTC)
IronPort-SDR: S/MNObBbceaZ8bgjV6d67IpVTHt04U1UvqLIAik+18UbgruYq/nSS7pIfzaZ0giGFYVH/DGxW7
 YoAneCzprbQw==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="192382727"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="192382727"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 06:08:36 -0700
IronPort-SDR: xXglEx2f/6uwO5YpV3F+wmccuJ9SYxNegOXEBnf5xs3ERK8DOKqNAo5mK98H1YRLbMURWS7ZDn
 qKmOnr7D8xPA==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="440837614"
Received: from hkrasnod-mobl1.ger.corp.intel.com (HELO [10.249.254.21])
 ([10.249.254.21])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 06:08:35 -0700
Subject: Re: [Intel-gfx] [PATCH v2 0/9] Prereqs for TTM accelerated migration
To: Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
 <YMCqm48rZIKLYk/s@phenom.ffwll.local>
 <9f38fc28-15fb-2736-ba01-503821fdbe54@linux.intel.com>
 <4d570a5b-0ea7-71ab-5082-e67f0cd668a7@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <1cd6b04d-8928-14b3-a63d-c9ac2e81fcca@linux.intel.com>
Date: Wed, 9 Jun 2021 15:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4d570a5b-0ea7-71ab-5082-e67f0cd668a7@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/9/21 2:20 PM, Matthew Auld wrote:
> On 09/06/2021 13:16, Thomas Hellström wrote:
>>
>> On 6/9/21 1:48 PM, Daniel Vetter wrote:
>>> On Wed, Jun 09, 2021 at 08:34:27AM +0200, Thomas Hellström wrote:
>>>> A couple of patches from Chris which implement pipelined migration and
>>>> clears by atomically writing the PTEs in place before performing the
>>>> actual blit.
>>>>
>>>> Some ww utilities mainly for the accompanying selftests added by 
>>>> Thomas,
>>>> as well as modified the above patches for ww locking- and lmem 
>>>> support.
>>>>
>>>> The actual hook up to the i915 ttm backend is being worked on and not
>>>> included yet, so this is considered to be an early review opportunity.
>>>>
>>>> v2:
>>>> - A couple of minor style fixes pointed out by Matthew Auld
>>>> - Export and use intel_engine_destroy_pinned_context() to address a
>>>> ls   CI warning / failure.
>>> Just to check my understanding of the plan: These are the new windowed
>>> clear/blt functions which we plan to use everywhere, because less nasty
>>> locking implications? And the clear/blt we currently have in 
>>> upstream will
>>> be replaced?
>>
>> Yes. These are for LMEM clearing and migration. It looks to me like 
>> the other ones we have in upstream are actually unused except for 
>> selftests. We're actually using CPU clearing for now.
>>
>>>
>>> If so would be nice if this patch set includes that replacement work (I
>>> think right now all we have is the clear for lmem), including 
>>> updating of
>>> selftests and stuff like that. Just to avoid having two ways to do the
>>> same thing in the driver.
>>
>> OK, I'll have a look at stripping the existing code. If we need it 
>> moving forward, we can always re-add.
>
> Some low hanging fruit would be all the client_blt stuff which can for 
> sure be deleted now.

What has the client_blt stuff been used for?

In any case, I need 25 commits for commit access to be granted.

/Thomas


