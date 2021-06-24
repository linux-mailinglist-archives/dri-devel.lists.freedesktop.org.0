Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CA43B2C59
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 12:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F4E6EB4F;
	Thu, 24 Jun 2021 10:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98036EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624530067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oKXkBJKG47HF5zZ+T34yALxUp2DCGSnnk7HiRaaGJBk=;
 b=OyOYIhkFlD72RXa4ApycBznJ8h/A4rxQkZYFz4zqo5MtkH1geetKyPWMfBX0ch0jh7q3Lg
 qnz7zGgvlyQUIzPbypEimxNaD0+gpIcj0/R+UxQuP9AGOacLVchr1yQsGXdxC66zyvRmgz
 DHDojJLPq7Dlhzp9U4RjDK0rp/NxRo4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-vb2qiS4sMCC6Qfd7zF8Tfw-1; Thu, 24 Jun 2021 06:21:05 -0400
X-MC-Unique: vb2qiS4sMCC6Qfd7zF8Tfw-1
Received: by mail-ed1-f72.google.com with SMTP id
 g13-20020a056402090db02903935a4cb74fso3098293edz.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 03:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oKXkBJKG47HF5zZ+T34yALxUp2DCGSnnk7HiRaaGJBk=;
 b=X8QYjncyNu6r0SiF5FhAKnWfCG1ZduGoUppiQu5F5LVSONp2NUC+FT3lDzSWB9bMqW
 JhUC4beOsnrGqcWV2fJs5bYAYfASIu2gdMX+TNA8oCDDyBLprJvgqRpZQkqGmLkJfQzE
 Lb/gk1w1zLBopbgfxw4wdKqEUqIc3q7uR6p7JCRn+ADCQkhB7Z8eTbhdgGYuVs4VlZDH
 Vsfyn1bvDMJ5ZOfNte3thiK5Jgj/eZIV6lQ+++PNGLXT4fGHaYuT0laGBPnCj7ONNzjV
 GSphmCEalg3fwjJeF766lnW7pt8ZwID/UwCY01roQzBy1sGvEKwetn1m0OKSP0KYd/Y5
 pAIg==
X-Gm-Message-State: AOAM5325zyxS6ABTdYQcgXRjjoGpzdVWvM26JLLBPbdo4DDhTy67CNm4
 Dbcx0i8wtni+fvF164Ox0cv6wVeEPcrK5Uv7gW5Jc2/bJxFnHuWYLbttQf8aVOud4W6m8Z9Hw3D
 U8sdEkbePXof77+82DnRj5f+JQL0D
X-Received: by 2002:a05:6402:220d:: with SMTP id
 cq13mr6001629edb.214.1624530064584; 
 Thu, 24 Jun 2021 03:21:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs51nnE9ArY9tBUvtcT3K4P6rQ2AL9pfX67ccTlvEZ5+BaJldlaSdGdhR+tmPYnfTJgtakmA==
X-Received: by 2002:a05:6402:220d:: with SMTP id
 cq13mr6001609edb.214.1624530064420; 
 Thu, 24 Jun 2021 03:21:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e7sm493571ejm.93.2021.06.24.03.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 03:21:03 -0700 (PDT)
Subject: Re: [PATCH 2/6] KVM: mmu: also return page from gfn_to_pfn
To: Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, David Stevens <stevensd@chromium.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-3-stevensd@google.com>
 <1624524331.zsin3qejl9.astroid@bobo.none>
 <201b68a7-10ea-d656-0c1e-5511b1f22674@redhat.com>
 <1624528342.s2ezcyp90x.astroid@bobo.none>
 <1624529635.75a1ann91v.astroid@bobo.none>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fc2a88ed-6a98-857d-bb1f-73260b01ac30@redhat.com>
Date: Thu, 24 Jun 2021 12:21:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1624529635.75a1ann91v.astroid@bobo.none>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 kvm-ppc@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/21 12:17, Nicholas Piggin wrote:
>> If all callers were updated that is one thing, but from the changelog
>> it sounds like that would not happen and there would be some gfn_to_pfn
>> users left over.
>>
>> But yes in the end you would either need to make gfn_to_pfn never return
>> a page found via follow_pte, or change all callers to the new way. If
>> the plan is for the latter then I guess that's fine.
>
> Actually in that case anyway I don't see the need -- the existence of
> gfn_to_pfn is enough to know it might be buggy. It can just as easily
> be grepped for as kvm_pfn_page_unwrap.

Sure, but that would leave us with longer function names 
(gfn_to_pfn_page* instead of gfn_to_pfn*).  So the "safe" use is the one 
that looks worse and the unsafe use is the one that looks safe.

> And are gfn_to_page cases also
> vulernable to the same issue?

No, they're just broken for the VM_IO|VM_PFNMAP case.

Paolo

> So I think it could be marked deprecated or something if not everything
> will be converted in the one series, and don't need to touch all that
> arch code with this patch.

