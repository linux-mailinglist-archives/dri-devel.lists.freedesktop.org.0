Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321265624A1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4658E112963;
	Thu, 30 Jun 2022 20:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A1B112963
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656622566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cs91WyVesi99NqFGAEv3+PryqGuZwEkmE4TutiLYwN4=;
 b=G7c17tFl4MFR8c/zubBPh7YAMUjWbjikbt7B+qkHhNtD2MbojHcBa8Lk+b901XouQYfMQ+
 H1ZtU+wFOtsjn9mjhSBdtfD2vJz2CcydHTe8Fx5ciwFzyzL8zt36dOF21xRL8uAlOlnIHE
 O2cBLEsq42Lx45OrIV8blUscU6cQTgY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-joQLvI8-MsO95bRUEZc5CQ-1; Thu, 30 Jun 2022 16:56:05 -0400
X-MC-Unique: joQLvI8-MsO95bRUEZc5CQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n35-20020a05600c3ba300b003a02d7bd5caso243560wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 13:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=cs91WyVesi99NqFGAEv3+PryqGuZwEkmE4TutiLYwN4=;
 b=i8SmZXFqZhbz+R0kbTMuHVMMO2BnwWrE+4o90MPqqf2T+0hJUpEUQ07JQwvnPFGjQ6
 MEkEc+5jXPbZ3YyafDKm3NYyo+nC4ib0lkZRaR0RLqhlhUJRJVNO2D0BCxkg61JbhZzv
 gBtIBlagjirKoSvTPzZfqYgUKVRjQ+Ri7ckNh9VAN59FO1tuNILyojCK3Xocberhqbna
 oyEWMQiDqGz2d/PuENR6ef89GAFs69m3AUqeBfut2y4vfM+r28/9RTZdUGDEsanCMJnA
 RndNu/Akc4aHz4go7FpqnIQ9n6E93+hSv9zQNN/RAZY//YpiloVCctuFrPJ1CVpovuPP
 QtpQ==
X-Gm-Message-State: AJIora8Lx+xOPxZ+AvS0N68XP2Iwt5c3WWxSIVYC7hYhkYWI23KEizEV
 PcVwhYjXuYbKr+Z69w0QB5PAjCANU/BkhXsZAA8SwqPF4thnTrnoIE1EyT0zynXkBfFz8Ei9Ytd
 wy6cUStJASw90DoPhbdveeJnFjPdT
X-Received: by 2002:a05:600c:22d0:b0:3a0:3bb9:3936 with SMTP id
 16-20020a05600c22d000b003a03bb93936mr14637974wmg.137.1656622563847; 
 Thu, 30 Jun 2022 13:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ulPmxkj72HO5yHWbkMgKLlGDzSAl2x3/KwnxpkCAD53J5CgIe7BBJs8xjCIGOLRUODCIR27Q==
X-Received: by 2002:a05:600c:22d0:b0:3a0:3bb9:3936 with SMTP id
 16-20020a05600c22d000b003a03bb93936mr14637943wmg.137.1656622563542; 
 Thu, 30 Jun 2022 13:56:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:7f00:214b:cffb:c693:2b71?
 (p200300cbc7087f00214bcffbc6932b71.dip0.t-ipconnect.de.
 [2003:cb:c708:7f00:214b:cffb:c693:2b71])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c064300b0039c8a22554bsm7666219wmm.27.2022.06.30.13.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 13:56:02 -0700 (PDT)
Message-ID: <24577304-15ea-0c9c-9b73-946143bf2726@redhat.com>
Date: Thu, 30 Jun 2022 22:56:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Alistair Popple <apopple@nvidia.com>
References: <20220629035426.20013-1-alex.sierra@amd.com>
 <20220629035426.20013-5-alex.sierra@amd.com>
 <956b1c51-b8f1-0480-81ca-5d03b45110f7@redhat.com>
 <878rpe73t3.fsf@nvdebian.thelocal>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 04/14] mm: add device coherent vma selection for memory
 migration
In-Reply-To: <878rpe73t3.fsf@nvdebian.thelocal>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.06.22 13:44, Alistair Popple wrote:
> 
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 29.06.22 05:54, Alex Sierra wrote:
>>> This case is used to migrate pages from device memory, back to system
>>> memory. Device coherent type memory is cache coherent from device and CPU
>>> point of view.
>>>
>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Reviewed-by: Alistair Poppple <apopple@nvidia.com>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>
>>
>> I'm not too familiar with this code, please excuse my naive questions:
>>
>>> @@ -148,15 +148,21 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>  			if (is_writable_device_private_entry(entry))
>>>  				mpfn |= MIGRATE_PFN_WRITE;
>>>  		} else {
>>> -			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
>>> -				goto next;
>>
>> Why not exclude MIGRATE_VMA_SELECT_DEVICE_PRIVATE here? IIRC that would
>> have happened before this change.
> 
> I might be missing something as I don't quite follow - this path is for
> normal system pages so we only want to skip selecting them if
> MIGRATE_VMA_SELECT_SYSTEM or MIGRATE_VMA_SELECT_DEVICE_COHERENT aren't
> set.
> 
> Note that MIGRATE_VMA_SELECT_DEVICE_PRIVATE doesn't apply here because
> we already know it's not a device private page by virtue of
> pte_present(pte) == True.

Ah, stupid me, pte_present(pte) is the key.

> 
>>>  			pfn = pte_pfn(pte);
>>> -			if (is_zero_pfn(pfn)) {
>>> +			if (is_zero_pfn(pfn) &&
>>> +			    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
>>>  				mpfn = MIGRATE_PFN_MIGRATE;
>>>  				migrate->cpages++;
>>>  				goto next;
>>>  			}
>>>  			page = vm_normal_page(migrate->vma, addr, pte);
>>> +			if (page && !is_zone_device_page(page) &&
>>
>> I'm wondering if that check logically belongs into patch #2.
> 
> I don't think so as it would break functionality until the below
> conditionals are added - we explicitly don't want to skip
> is_zone_device_page(page) == False here because that is the pages we are
> trying to select.
> 
> You could add in this:
> 
>>> +			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> 
> But then in patch 2 we know this can never be true because we've already
> checked for !MIGRATE_VMA_SELECT_SYSTEM there.


Ah, okay, thanks

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

