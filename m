Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9273CB40B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 10:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E076F6E93D;
	Fri, 16 Jul 2021 08:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2346E93C;
 Fri, 16 Jul 2021 08:21:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="210744520"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="210744520"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 01:21:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="431129829"
Received: from kjmurthy-mobl.ger.corp.intel.com (HELO [10.213.193.231])
 ([10.213.193.231])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 01:21:00 -0700
Subject: Re: [PATCH 3/4] drm/i915/userptr: Probe existence of backing struct
 pages upon creation
To: Kenneth Graunke <kenneth@whitecape.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <YPAW9f/2oJV4UNnB@phenom.ffwll.local>
 <2098303d-5b94-d9ff-7bd4-a7ba197a7431@linux.intel.com>
 <2516720.Dzi6zm1QmA@mizzik>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <567d0dbb-65eb-b3e6-4fd8-eaf9aadda96d@linux.intel.com>
Date: Fri, 16 Jul 2021 09:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2516720.Dzi6zm1QmA@mizzik>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/07/2021 19:21, Kenneth Graunke wrote:
> On Thursday, July 15, 2021 4:27:44 AM PDT Tvrtko Ursulin wrote:
>>
>> On 15/07/2021 12:07, Daniel Vetter wrote:
>>> On Thu, Jul 15, 2021 at 11:33:10AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 15/07/2021 11:15, Matthew Auld wrote:
>>>>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>>>>
>>>>> Jason Ekstrand requested a more efficient method than userptr+set-domain
>>>>> to determine if the userptr object was backed by a complete set of pages
>>>>> upon creation. To be more efficient than simply populating the userptr
>>>>> using get_user_pages() (as done by the call to set-domain or execbuf),
>>>>> we can walk the tree of vm_area_struct and check for gaps or vma not
>>>>> backed by struct page (VM_PFNMAP). The question is how to handle
>>>>> VM_MIXEDMAP which may be either struct page or pfn backed...
>>>>>
>>>>> With discrete are going to drop support for set_domain(), so offering a
>>>>> way to probe the pages, without having to resort to dummy batches has
>>>>> been requested.
>>>>>
>>>>> v2:
>>>>> - add new query param for the PROPBE flag, so userspace can easily
>>>>>      check if the kernel supports it(Jason).
>>>>> - use mmap_read_{lock, unlock}.
>>>>> - add some kernel-doc.
>>>>
>>>> 1)
>>>>
>>>> I think probing is too weak to be offered as part of the uapi. What probes
>>>> successfully at create time might not be there anymore at usage time. So if
>>>> the pointer is not trusted at one point, why should it be at a later stage?
>>>>
>>>> Only thing which works for me is populate (so get_pages) at create time. But
>>>> again with no guarantees they are still there at use time clearly
>>>> documented.
>>>
>>> Populate is exactly as racy as probe. We don't support pinned userptr
>>> anymore.
>>
>> Yes, wrote so myself - "..again with no guarantees they are still there
>> at use time..".
>>
>> Perhaps I don't understand what problem is probe supposed to solve. It
>> doesn't deal 1:1 with set_domain removal since that one actually did
>> get_pages so that would be populate. But fact remains regardless that if
>> userspace is given a pointer it doesn't trust, _and_ wants the check it
>> for this reason or that, then probe solves nothing. Unless there is
>> actually at minimum some protocol to reply to whoever sent the pointer
>> like "not that pointer please".
> 
> That's exactly the point.  GL_AMD_pinned_memory requires us the OpenGL
> implementation to return an error for "not that pointer, please", at the
> time when said pointer is supplied - not at first use.
> 
> Sure, there can be reasons why it might seem fine up front, and not work
> later.  But an early check of "just no, you're doing it totally wrong"
> at the right moment can be helpful for application developers.  While it
> shouldn't really happen, if it ever did, it would be a lot more obvious
> to debug than "much later on, when something randomly flushed the GPU
> commands we were building, something went wrong, and we don't know why."

Ack, thanks for the clarification. For this limited use case I agree probe works.

Regards,

Tvrtko

P.S. I made a mistake (?) of looking at the GL_AMD_pinned_memory spec:

"""

     3) Can the application free the memory?

         RESOLVED: YES. However, the underlying buffer object should
         have been deleted from the OpenGL to prevent any access by
         the GPU, or the result is undefined, including program or even system
         termination.
"""

Scary stuff that spec of userspace level API would allow such kernel bugs!

