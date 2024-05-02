Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033CE8B9C3C
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 16:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448DB112149;
	Thu,  2 May 2024 14:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDB0D11217B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 14:26:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3010D2F4;
 Thu,  2 May 2024 07:27:24 -0700 (PDT)
Received: from [10.1.36.41] (e122027.cambridge.arm.com [10.1.36.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C8EB3F73F;
 Thu,  2 May 2024 07:26:57 -0700 (PDT)
Message-ID: <39c22cd8-8638-45ea-8450-87a7ad13568f@arm.com>
Date: Thu, 2 May 2024 15:26:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/panthor: Fix an off-by-one in the heap context
 retrieval logic
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Eric Smith <eric.smith@collabora.com>
References: <20240430112852.486424-1-boris.brezillon@collabora.com>
 <20240430112852.486424-5-boris.brezillon@collabora.com>
 <791a81bf-323c-40dc-ab51-2d909adcb90b@arm.com>
 <20240502161503.00f4e3c9@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240502161503.00f4e3c9@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/05/2024 15:15, Boris Brezillon wrote:
> On Thu, 2 May 2024 15:03:51 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 30/04/2024 12:28, Boris Brezillon wrote:
>>> ID 0 is reserved to encode 'no-tiler-heap', the heap ID range is
>>> [1:MAX_HEAPS_PER_POOL], which we occasionally need to turn into an index
>>> in the [0:MAX_HEAPS_PER_POOL-1] when we want to access the context object.  
>>
>> This might be a silly question, but do we need ID 0 to be
>> "no-tiler-heap"? Would it be easier to e.g. use a negative number for
>> that situation and avoid all the off-by-one problems?
>>
>> I'm struggling to find the code which needs the 0 value to be special -
>> where is it exactly that we encode this "no-tiler-heap" value?
> 
> Hm, I thought we were passing the heap handle to the group creation
> ioctl, but heap queue/heap association is actually done through a CS
> instruction, so I guess you have a point. The only thing that makes a
> bit hesitant is that handle=0 is reserved for all other kind of handles
> we return, and I think I'd prefer to keep it the same for heap handles.
> 
> This being said, we could do the `+- 1` in
> panthor_ioctl_tiler_heap_{create,destroy}() to keep things simple in
> panthor_heap.c.

The heap handles returned to user space have the upper 16 bits encoding
the VM ID - so hopefully no one is doing anything crazy and splitting it
up to treat the lower part specially. And (unless I'm mistaken) the VM
IDs start from 1 so we'd still not have IDs of 0. So I don't think we
need the +- 1 part anywhere for tiler heaps.

I'd certainly consider it a user space bug to treat the handles as
anything other than opaque. Really user space shouldn't be treating 0 as
special either: the uAPI doesn't say it's not valid. But I'd be open to
updating the uAPI to say 0 is invalid if there's some desire for that.

Steve

