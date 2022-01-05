Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064024853DB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 14:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7F610F3B1;
	Wed,  5 Jan 2022 13:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4462210F3B0;
 Wed,  5 Jan 2022 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641390943; x=1672926943;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=tp2NHll9mLQSop0C6P88+KDsutFmd5ql7LKxOWgh0Ig=;
 b=QTYOmkiHKc3BpqYlya4kKrRr+f2pvQaPqtGqM/u+Bi//e8Zpn0x28F0l
 BEKgUsYw8gtHgSqGZekdUxxiH9f8pfYRenZX44QQVJPk/VN9YQ03WnnOw
 QLZIGB2Jd5Mypjcn0Sh8FKy9Hf6nBnoBy4b6G7j1iOMVxfhfgXGRxLVYW
 MpRUWDWlP1JnBZjzfK7Qm5Nhw1qcLej/TqWypdhfYwcn8ShouFHPeAVcb
 xRF8UFLKmiiA/+NwLRA1cERMwioVnHkIN8UHWmxBLoHDwDXqwzHBHYR72
 i22B2GIpYz+t/6TXhvKKFlKbBFwGeYvYr5T5w6gMCNGXannYbp1sNx6Nn A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242399368"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="242399368"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 05:44:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="556527898"
Received: from fhoeg-mobl1.ger.corp.intel.com (HELO [10.249.254.213])
 ([10.249.254.213])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 05:44:20 -0800
Message-ID: <8ea33d30-7765-4c2a-8e19-a99e993d8b33@linux.intel.com>
Date: Wed, 5 Jan 2022 14:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as
 argument for gtt binding / unbinding
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Bloomfield, Jon" <jon.bloomfield@intel.com>,
 "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Wilson, Chris P" <chris.p.wilson@intel.com>
References: <20220103115947.92688-1-thomas.hellstrom@linux.intel.com>
 <20220103115947.92688-3-thomas.hellstrom@linux.intel.com>
 <BN6PR11MB1633E8200E7999D439707F2392499@BN6PR11MB1633.namprd11.prod.outlook.com>
 <c501276b-58f4-9764-30d2-5da2ae00e7e9@linux.intel.com>
 <BN6PR11MB1633BB7DDA0486B79F6B6C2492499@BN6PR11MB1633.namprd11.prod.outlook.com>
 <f31472df-3239-5903-ea3c-60fd58b4e1d8@linux.intel.com>
 <BN6PR11MB1633C76CD53EFBBCFA843C8F924A9@BN6PR11MB1633.namprd11.prod.outlook.com>
 <b00e0f20-4398-f97d-5343-88f32828c468@linux.intel.com>
In-Reply-To: <b00e0f20-4398-f97d-5343-88f32828c468@linux.intel.com>
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/4/22 17:07, Thomas Hellström wrote:
> Hi, Oak,
>
> On 1/4/22 16:35, Zeng, Oak wrote:
>>
>> Regards,
>> Oak
>>
>>> -----Original Message-----
>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Sent: January 4, 2022 3:29 AM
>>> To: Zeng, Oak <oak.zeng@intel.com>; intel-gfx@lists.freedesktop.org; 
>>> dri-devel@lists.freedesktop.org
>>> Cc: Auld, Matthew <matthew.auld@intel.com>
>>> Subject: Re: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma 
>>> resource as argument for gtt binding / unbinding
>>>
>>> Hi, Oak.
>>>
>>> On 1/4/22 00:08, Zeng, Oak wrote:
>>>> Regards,
>>>> Oak
>>> Looks like your emails always start with "Regards, Oak". a 
>>> misconfiguration?
>> My mail client (outlook) is set to automatically add a regards, when 
>> I compose new mail or reply email. Not a big problem 😊
>>
>>>
>>>>> -----Original Message-----
>>>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Sent: January 3, 2022 1:58 PM
>>>>> To: Zeng, Oak <oak.zeng@intel.com>; 
>>>>> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>>> Cc: Auld, Matthew <matthew.auld@intel.com>
>>>>> Subject: Re: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma 
>>>>> resource as argument for gtt binding / unbinding
>>>>>
>>>>> Hi, Oak.
>>>>>
>>>>> On 1/3/22 19:17, Zeng, Oak wrote:
>>>>>> Regards,
>>>>>> Oak
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On 
>>>>>>> Behalf Of Thomas Hellström
>>>>>>> Sent: January 3, 2022 7:00 AM
>>>>>>> To: intel-gfx@lists.freedesktop.org; 
>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Auld, 
>>>>>>> Matthew <matthew.auld@intel.com>
>>>>>>> Subject: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma 
>>>>>>> resource as argument for gtt binding / unbinding
>>>>>>>
>>>>>>> When introducing asynchronous unbinding, the vma itself may no 
>>>>>>> longer
>>>>>>> be alive when the actual binding or unbinding takes place.
>>>>>> Can we take an extra reference counter of the vma to keep the vma 
>>>>>> alive, until the actual binding/unbinding takes place?
>>>>> The point here is that that's not needed, and should be avoided.
>>>> Can you explain more why "keeping vma alive until unbinding takes 
>>>> place" should be avoided?
>>>>
>>>> As I understand it, your series introduce asynchronized unbinding. 
>>>> But since vma might be no longer alive at the time of unbinding.
>>> To overcome this difficulty, you introduce a vma resource structure 
>>> and you guarantee vma resource is alive at bind/unbind time. So
>>> you can use vma resource for the bind/unbind operation. My question 
>>> is, can we achieve the asynchronized unbinding still using vma
>>> structure by keeping vma structure alive ( by ref count it). This 
>>> way the change should be much smaller (compared to this series). Why
>>> it is harmful to keep the vma alive? Maybe you have other reasons to 
>>> introduce vma resource that I don't see.
>>>
>>> When we allow asynchronous unbinding, it's allowed to immediately 
>>> rebind
>>> the vma, possibly into the same gpu virtual address, but with different
>>> pages. And when doing that we don't want to block waiting for the 
>>> unbind
>>> to execute.
>> Imagine this sequence:
>>
>> 1. Virtual address a1 is bound to physical page p1
>> 2. Unbind a1 from p1, asynchronous so actual unbind not happen yet
>> 3. bind a1 to physical page p2, page table is changed, now a1 
>> pointing to p2 in page table.
>> 4. #2 now take place now - since in page table, a1 points to p2 now, 
>> does a1 point to scratch page after #4?
>
> Here, 3) will also become async, awaiting any pending unbinds in the 
> address range provided to 3), in particular, the bind in 3) will await 
> 4). See i915_vma_resource_bind_dep_await(), and the discussion on 
> whether or not to use an interval tree for this at the start of 
> i915_vma_resource.c
>
>> In fact, we could allow a large number of outstanding binds
>>> and unbinds for a vma, which makes the vma structure unsuitable to 
>>> track
>>> this, since there will no longer be a single mapping between a set of
>>> active pages and a vma, or a virtual gpu range and a vma.
>> I agree that if pages - vma - virtual gpu range is not 1:1:1 mapping, 
>> we need introduce a finer-grained vma resource to for the non-1:1 
>> mapping. I also understand the asynchronous unbinding utilize the 
>> virtual address space more effectively. But my feeling is that this 
>> non-1:1 mapping makes our program hard to understand and maintain. 
>> Since this non- 1:1 mapping is introduced by asynchronous 
>> binding/unbinding, maybe the real question here is, is it really 
>> benefit to introduce asynchronous unbinding?
>
> That's a relevant question, which I've asked myself a couple of times. 
> Async unbinding has complicated things like error capture and indeed 
> complicates the understanding of the binding process as well.
>
> The main gain is that we avoid a sync point at LMEM eviction, enabling 
> us to pipeline eviction, moving forward it may also find use in the 
> shrinker and for user-space prematurely wanting to re-use softpin 
> addresses.
>
> /Thomas
>
>>
>> I am still not familiar enough to the codes. I suggest other experts 
>> to take a look also. @Bloomfield, Jon @Vetter, Daniel @Wilson, Chris P.

It might make sense here to point out as well that the direction from 
the arch team is towards moving towards gpu-writes of page-table entries 
for binding and unbinding, also keeping small PCI bars in mind, which 
will more or less force us to allow async unbinding for maintained 
performance.

/Thomas


>>
>> Regards,
>> Oak
>>> Thanks,
>>>
>>> /Thomas
>>>
>>>> Regards,
>>>> Oak
>>>>
>>>>    If the
>>>>> vma is no longer alive, that means nobody uses it anymore, but the 
>>>>> GPU
>>>>> may still have work in the pipe that references the GPU virtual 
>>>>> address.
>>>>>
>>>>> /Thomas.
>>>>>
