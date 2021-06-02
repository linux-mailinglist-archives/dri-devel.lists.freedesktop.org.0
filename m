Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCA9399368
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 21:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013C06EE0E;
	Wed,  2 Jun 2021 19:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A7A6EE0E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 19:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7F3BD3FF3E;
 Wed,  2 Jun 2021 21:20:23 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="g3WjQkqo";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.717
X-Spam-Level: 
X-Spam-Status: No, score=-2.717 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.618,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tyjH8yeM7kf; Wed,  2 Jun 2021 21:20:22 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id F0E6C3FF2E;
 Wed,  2 Jun 2021 21:20:20 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.55.54.42])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2CF2736016C;
 Wed,  2 Jun 2021 21:20:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622661620; bh=hKnoweJXn/tksu72PrCS6rpPpP/4N8+krGmWSBbwU7Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=g3WjQkqoHNmiYWAXkx6XGGDO4MHCluKJb0lcqBz6Y21jRtCjr8th71k28h+Gfhxt5
 6VoO7AxHyAGQxRmxtZTNZmaxQSQH870hAknBj5eSkbagns36qEqLCfDT4OYQdKBhRm
 +e7aW/4sjXrBfihvLwTK8mUxil18eobHvRBXQ9Wk=
Subject: Re: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210602083013.1561-1-christian.koenig@amd.com>
 <54c5dc94-b367-70dd-ca8f-afcbda7598c6@shipmail.org>
 <001df485-eed3-3638-0464-9a2ab67ac73f@gmail.com>
 <32d661ae-1eab-918d-cd98-40109e6073df@shipmail.org>
 <37a0336b-48d6-67bb-6a71-bba4daef6aa6@gmail.com>
 <eac33818-b266-e973-f811-ba2ffbcd0a2f@linux.intel.com>
 <YLfPk+7NHrc3I9MQ@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <8473075c-8360-8735-706b-2742bd5538b1@shipmail.org>
Date: Wed, 2 Jun 2021 21:20:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLfPk+7NHrc3I9MQ@phenom.ffwll.local>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, jgg@ziepe.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/2/21 8:36 PM, Daniel Vetter wrote:
> On Wed, Jun 02, 2021 at 02:21:17PM +0200, Thomas Hellström wrote:
>> On 6/2/21 2:04 PM, Christian König wrote:
>>>
>>> Am 02.06.21 um 13:24 schrieb Thomas Hellström (Intel):
>>>> [SNIP]
>>>>>>> @@ -576,14 +565,10 @@ static void
>>>>>>> ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo,
>>>>>>> struct vm_area_s
>>>>>>>          vma->vm_private_data = bo;
>>>>>>>    -    /*
>>>>>>> -     * We'd like to use VM_PFNMAP on shared mappings, where
>>>>>>> -     * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
>>>>>>> -     * but for some reason VM_PFNMAP + x86 PAT +
>>>>>>> write-combine is very
>>>>>>> -     * bad for performance. Until that has been sorted out, use
>>>>>>> -     * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
>>>>>>> +    /* Enforce VM_SHARED here since no driver backend
>>>>>>> actually supports COW
>>>>>>> +     * on TTM buffer object mappings.
>>>>>> I think by default all TTM drivers support COW mappings in
>>>>>> the sense that written data never makes it to the bo but
>>>>>> stays in anonymous pages, although I can't find a single
>>>>>> usecase. So comment should be changed to state that they are
>>>>>> useless for us and that we can't support COW mappings with
>>>>>> VM_PFNMAP.
>>>>> Well the problem I see with that is that it only works as long
>>>>> as the BO is in system memory. When it then suddenly migrates to
>>>>> VRAM everybody sees the same content again and the COW pages are
>>>>> dropped. That is really inconsistent and I can't see why we
>>>>> would want to do that.
>>>> Hmm, yes, that's actually a bug in drm_vma_manager().
>>> Hui? How is that related to drm_vma_manager() ?
>>>
>> Last argument of "unmap_mapping_range()" is "even_cows".
>>>>> Additionally to that when you allow COW mappings you need to
>>>>> make sure your COWed pages have the right caching attribute and
>>>>> that the reference count is initialized and taken into account
>>>>> properly. Not driver actually gets that right at the moment.
>>>> I was under the impression that COW'ed pages were handled
>>>> transparently by the vm, you'd always get cached properly refcounted
>>>> COW'ed pages but anyway since we're going to ditch support for them,
>>>> doesn't really matter.
>>> Yeah, but I would have expected that the new COWed page should have the
>>> same caching attributes as the old one and that is not really the case.
>>>
>>>>>>>         */
>>>>>>> -    vma->vm_flags |= VM_MIXEDMAP;
>>>>>>> +    vma->vm_flags |= VM_PFNMAP | VM_SHARED;
>>>>>> Hmm, shouldn't we refuse COW mappings instead, like my old
>>>>>> patch on this subject did? In theory someone could be
>>>>>> setting up what she thinks is a private mapping to a shared
>>>>>> buffer object, and write sensitive data to it, which will
>>>>>> immediately leak. It's a simple check, could open-code if
>>>>>> necessary.
>>>>> Yeah, though about that as well. Rejecting things would mean we
>>>>> potentially break userspace which just happened to work by
>>>>> coincident previously. Not totally evil, but not nice either.
>>>>>
>>>>> How about we do a WARN_ON_ONCE(!(vma->vm_flags & VM_SHARED)); instead?
>>>> Umm, yes but that wouldn't notify the user, and would be triggerable
>>>> from user-space. But you can also set up legal non-COW mappings
>>>> without the VM_SHARED flag, IIRC, see is_cow_mapping(). I think when
>>>> this was up for discussion last time we arrived in a
>>>> vma_is_cow_mapping() utility...
>>> Well userspace could trigger that only once, so no spamming of the log
>>> can be expected here. And extra warnings in the logs are usually
>>> reported by people rather quickly.
>> OK, I'm mostly worried about adding a security flaw that we know about from
>> the start.
> VM_SHARED is already cleared in vma_set_page_prot() due to the VM_PFNMAP
> check in vma_wants_writenotify.
Yes, but that's only on a local variable to get a write-protected prot. 
vmwgfx does the same for its dirty-tracking. Here we're debating setting 
VM_SHARED on a private mapping.
>
> I'm honestly not sure whether userspace then even can notice this or
> anything, so might be worth a quick testcase.

The net result is that in the very unlikely case the user requested a 
private GPU mapping to write secret data into, That secret data is no 
longer secret. And, for example in the case of AMD's SEV encryption that 
data would have been encrypted in an anonymous page with COW mappings, 
but not so if we add VM_SHARED, then it will be unencrypted in in GPU 
pages. Then I think it's better to refuse COW mappings in mmap:

if (is_cow_mapping(vma->vm_flags))
    return -EINVAL;

This will still allow private read-only mappings which is OK. And if 
someone was actually relying on private COW'd GPU mappings, we'd only 
break the code slightly more...

/Thomas


>
> Even if I'm wrong here we shouldn't allow cow mappings of gem_bo, that
> just seems too nasty with all the side-effects.
Completely agree.
> -Daniel
>
>> /Thomas
>>
>>
>>> Christian.
>>>
>>>> /Thomas
>>>>
>>>>
