Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2BD3988DB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361176EC55;
	Wed,  2 Jun 2021 12:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FF86EC55
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 12:04:26 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id h24so3497831ejy.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 05:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LmBqwR2LBmBCFFgFblIc9CBZUvdDr0CehQMRUNWvfis=;
 b=G0qKbAfOVw/A+MwOHlbAly+CDJXMHzv0ScEgbSOG3/GZHrf5koNB0sWFzSoUqT25mR
 kd3hYpJyh4qb34FlMQ9a0BhXJCxb1zYxENlT7fMI9zgyvylIrp/cmuRt537gv0GqMK9G
 882QHcRgI0/tJCe2OOuBLk4Za75/tAbJSngmwk4vF1YAH+egKobVOiOqmpXi1JZs8Rg8
 vez+gRb+2UAoTuIUl2x6Y2RKVr2RJ/B7rmO6kleZoaqlQNScDVSRksJDQhs5prxl287U
 bLPUPAUOV7LqQVaKJefhQICoej7Kw9napio9IcPqfG7uQG8VPCz5m/9jbnUtiKDGB3ad
 XvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LmBqwR2LBmBCFFgFblIc9CBZUvdDr0CehQMRUNWvfis=;
 b=SSi6lswD7oh48FNc2FlOPzs1F++F4cOPJMUsErttAo+yuHcn2IaEup4emtbg7z8bZ3
 eis4EA1isLjHWGPs7QaK117z5P7AYpZEfcEX4qOyQ68H/5oKzaBKekcD7CF+Srxzrpx4
 PnE1qFIBI6nX/e8Pd3WGnA/AjRE74892nPFE4chDWpG9fk3Tcultlg0ZPu5/8htGhZH6
 tmHE/P0tjcPhlVbDlm2Kyxn1d4lYDxxY7770PBsGvrT/IP1EI+voHGGqRgIHg5oxxkXL
 4nTSIajOu8GGDJiOysLnr89x+rvnQTzuDDR5fydv3EEjvxenWsgyLfFWyxZSwomSjh4I
 vXjA==
X-Gm-Message-State: AOAM532fIYyhpVDw4CVahMD48XaOH3Hw4becyd6uP1Tj6hPt2rPePJT/
 NoEFHdGpMJXLlmoJYAgBvJMhqWJXW60=
X-Google-Smtp-Source: ABdhPJyKop57xqReJmk/Eq7n5HZlsUPJB6L50i4qJLKtbCEStvWRdSKhTDJ2KPoY3FgSaWFybTTS+Q==
X-Received: by 2002:a17:906:80ce:: with SMTP id
 a14mr33023384ejx.311.1622635465296; 
 Wed, 02 Jun 2021 05:04:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id v1sm5502368ejg.22.2021.06.02.05.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:04:24 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 daniel@ffwll.ch, jgg@ziepe.ca, thomas.hellstrom@linux.intel.com
References: <20210602083013.1561-1-christian.koenig@amd.com>
 <54c5dc94-b367-70dd-ca8f-afcbda7598c6@shipmail.org>
 <001df485-eed3-3638-0464-9a2ab67ac73f@gmail.com>
 <32d661ae-1eab-918d-cd98-40109e6073df@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <37a0336b-48d6-67bb-6a71-bba4daef6aa6@gmail.com>
Date: Wed, 2 Jun 2021 14:04:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <32d661ae-1eab-918d-cd98-40109e6073df@shipmail.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 02.06.21 um 13:24 schrieb Thomas Hellström (Intel):
> [SNIP]
>>>> @@ -576,14 +565,10 @@ static void ttm_bo_mmap_vma_setup(struct 
>>>> ttm_buffer_object *bo, struct vm_area_s
>>>>         vma->vm_private_data = bo;
>>>>   -    /*
>>>> -     * We'd like to use VM_PFNMAP on shared mappings, where
>>>> -     * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
>>>> -     * but for some reason VM_PFNMAP + x86 PAT + write-combine is 
>>>> very
>>>> -     * bad for performance. Until that has been sorted out, use
>>>> -     * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
>>>> +    /* Enforce VM_SHARED here since no driver backend actually 
>>>> supports COW
>>>> +     * on TTM buffer object mappings.
>>>
>>> I think by default all TTM drivers support COW mappings in the sense 
>>> that written data never makes it to the bo but stays in anonymous 
>>> pages, although I can't find a single usecase. So comment should be 
>>> changed to state that they are useless for us and that we can't 
>>> support COW mappings with VM_PFNMAP.
>>
>> Well the problem I see with that is that it only works as long as the 
>> BO is in system memory. When it then suddenly migrates to VRAM 
>> everybody sees the same content again and the COW pages are dropped. 
>> That is really inconsistent and I can't see why we would want to do 
>> that.
> Hmm, yes, that's actually a bug in drm_vma_manager().

Hui? How is that related to drm_vma_manager() ?

>>
>> Additionally to that when you allow COW mappings you need to make 
>> sure your COWed pages have the right caching attribute and that the 
>> reference count is initialized and taken into account properly. Not 
>> driver actually gets that right at the moment.
>
> I was under the impression that COW'ed pages were handled 
> transparently by the vm, you'd always get cached properly refcounted 
> COW'ed pages but anyway since we're going to ditch support for them, 
> doesn't really matter.

Yeah, but I would have expected that the new COWed page should have the 
same caching attributes as the old one and that is not really the case.

>
>>
>>>
>>>>        */
>>>> -    vma->vm_flags |= VM_MIXEDMAP;
>>>> +    vma->vm_flags |= VM_PFNMAP | VM_SHARED;
>>>
>>> Hmm, shouldn't we refuse COW mappings instead, like my old patch on 
>>> this subject did? In theory someone could be setting up what she 
>>> thinks is a private mapping to a shared buffer object, and write 
>>> sensitive data to it, which will immediately leak. It's a simple 
>>> check, could open-code if necessary.
>>
>> Yeah, though about that as well. Rejecting things would mean we 
>> potentially break userspace which just happened to work by coincident 
>> previously. Not totally evil, but not nice either.
>>
>> How about we do a WARN_ON_ONCE(!(vma->vm_flags & VM_SHARED)); instead?
>
> Umm, yes but that wouldn't notify the user, and would be triggerable 
> from user-space. But you can also set up legal non-COW mappings 
> without the VM_SHARED flag, IIRC, see is_cow_mapping(). I think when 
> this was up for discussion last time we arrived in a 
> vma_is_cow_mapping() utility...

Well userspace could trigger that only once, so no spamming of the log 
can be expected here. And extra warnings in the logs are usually 
reported by people rather quickly.

Christian.

>
> /Thomas
>
>

