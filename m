Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD083B3E3C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 10:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11EC6ECE9;
	Fri, 25 Jun 2021 08:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBFC6ECE4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624608447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WsuZzmc69l3ui1BgglnMF86Cw0fADvcr/OA+7H4A20w=;
 b=jK0/NpFVp4oMevRWYSWRsakDd42UE7hcTrOSylVlUYAqVgsIs2eTQFyCFvYaWOH9l1dgJX
 mI7hL8T9her949OZD1uxufDCANXBHrAxm9IEBE7IonhGDYPdzNzgM7FXtZFO9w0a6oyyFP
 5LtcrHhGQfQ6TBgTfUyWYAOPQ16cXJA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-YTjPS1MuNyqsQJR_PKffDg-1; Fri, 25 Jun 2021 04:07:25 -0400
X-MC-Unique: YTjPS1MuNyqsQJR_PKffDg-1
Received: by mail-ed1-f69.google.com with SMTP id
 j15-20020a05640211cfb0290394f9de5750so4174069edw.16
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 01:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WsuZzmc69l3ui1BgglnMF86Cw0fADvcr/OA+7H4A20w=;
 b=FVJzTa26kkS55tQ8SFKPvVCshVcKiispCPpp20a82nauiUbdi3JZYmqSL3ixld3JA1
 7j3b88KcguNj08sEE3rLF6zuHgEmOcJj6EtD5XLFX9arcTNVbBfxs2TPe0h4+pVZXB6a
 Uf7fxWcz0UaQgu/1Jtyjv+lRU3NHqUIa5w+7bop6LSsrYPSFlzXAhDBNJT+oLIz57MNU
 aSwUf3AM/mqxesu8cv8uVILUsTjEfPNZ/wmLwcYGt3iF//XH72SbQ+PL7EozPqNOXGnY
 GqkKPoFKRWiw6vWFj5ueFeafR17EnBGXtPFabWuBY942a6I0GTBKmSgZhYVXYedbUPRY
 KQ+A==
X-Gm-Message-State: AOAM530uwBjUpKNVvj4SJYa37+sVYjLIrmOwwhTDiGshkfi/B0fGBVJf
 wtQ6MAZ6baJZe8xTzDE8SdeXx7izFCozg8bevOv8FDoEpv7+5V6XvJy8K2lcLudUzalVO/w4XoE
 mN742UTraLIYQa6zm5lLR0oTuxrxzQJ0DhzivzwMZ0fza2DEApNdeJI8iWC6tRB75N/ZvXBYitS
 TUVITq
X-Received: by 2002:a17:907:96a8:: with SMTP id
 hd40mr9411683ejc.546.1624608444069; 
 Fri, 25 Jun 2021 01:07:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVB3z+OXWUecb9ahGrJESZcqrbKx9pnQ6XoxJ6GZ25cMxxTZOEeAuP3MqM1WxvBDGMvZ/qcw==
X-Received: by 2002:a17:907:96a8:: with SMTP id
 hd40mr9411623ejc.546.1624608443667; 
 Fri, 25 Jun 2021 01:07:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cf3sm1879380edb.39.2021.06.25.01.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:07:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] KVM: do not allow mapping valid but non-refcounted
 pages
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 David Stevens <stevensd@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Nick Piggin <npiggin@gmail.com>
References: <20210625073616.2184426-1-stevensd@google.com>
 <20210625073616.2184426-2-stevensd@google.com>
 <183b71c1-6bb0-8d05-e2ce-e452253259a8@de.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5e865b84-7b8f-bd2d-5e74-f46b257ad858@redhat.com>
Date: Fri, 25 Jun 2021 10:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <183b71c1-6bb0-8d05-e2ce-e452253259a8@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: kvm-ppc@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 Zhi Wang <zhi.a.wang@intel.com>, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/06/21 09:58, Christian Borntraeger wrote:
> 
> 
> On 25.06.21 09:36, David Stevens wrote:
>> From: Nicholas Piggin <npiggin@gmail.com>
>>
>> It's possible to create a region which maps valid but non-refcounted
>> pages (e.g., tail pages of non-compound higher order allocations). These
>> host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
>> of APIs, which take a reference to the page, which takes it from 0 to 1.
>> When the reference is dropped, this will free the page incorrectly.
>>
>> Fix this by only taking a reference on the page if it was non-zero,
>> which indicates it is participating in normal refcounting (and can be
>> released with put_page).
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> I guess this would be the small fix for stable? Do we want to add that cc?
> 
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

Yes, this one is going to Linus today.  The rest is for 5.15.

Paolo

>> ---
>>   virt/kvm/kvm_main.c | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index 3dcc2abbfc60..f7445c3bcd90 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -2175,6 +2175,13 @@ static bool vma_is_valid(struct vm_area_struct 
>> *vma, bool write_fault)
>>       return true;
>>   }
>>
>> +static int kvm_try_get_pfn(kvm_pfn_t pfn)
>> +{
>> +    if (kvm_is_reserved_pfn(pfn))
>> +        return 1;
>> +    return get_page_unless_zero(pfn_to_page(pfn));
>> +}
>> +
>>   static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>>                      unsigned long addr, bool *async,
>>                      bool write_fault, bool *writable,
>> @@ -2224,13 +2231,21 @@ static int hva_to_pfn_remapped(struct 
>> vm_area_struct *vma,
>>        * Whoever called remap_pfn_range is also going to call e.g.
>>        * unmap_mapping_range before the underlying pages are freed,
>>        * causing a call to our MMU notifier.
>> +     *
>> +     * Certain IO or PFNMAP mappings can be backed with valid
>> +     * struct pages, but be allocated without refcounting e.g.,
>> +     * tail pages of non-compound higher order allocations, which
>> +     * would then underflow the refcount when the caller does the
>> +     * required put_page. Don't allow those pages here.
>>        */
>> -    kvm_get_pfn(pfn);
>> +    if (!kvm_try_get_pfn(pfn))
>> +        r = -EFAULT;
>>
>>   out:
>>       pte_unmap_unlock(ptep, ptl);
>>       *p_pfn = pfn;
>> -    return 0;
>> +
>> +    return r;
>>   }
>>
>>   /*
>>
> 

