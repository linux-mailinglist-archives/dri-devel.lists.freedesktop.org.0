Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0943B35FD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B3D6EC97;
	Thu, 24 Jun 2021 18:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027AE6EAAA;
 Thu, 24 Jun 2021 10:43:35 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id x22so2726573pll.11;
 Thu, 24 Jun 2021 03:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Ntmvbr4Rsn/lopxAADIIDgcNErNmU/zbadQcByBiYK4=;
 b=Uzc43caEhY2Ti31+lpHHW0AZ5sLCVj6W+n4t/ez5IgVzQkVZOibK2DIWQ0+CAuzt9U
 PpuIA4kDsyK3chDvHhxE+YawXhAPb2eWGecCvYilJeif5bW1AWaPBDm7W4vYjxTYq4eX
 vsAbVyUYfQJDK46zRrnjfoRU3RdSuUfndWfij+20vPjPzE9a8Ky+gzwBiWuGHYujrH97
 b1g8G9j+MqQ6oKRgvSqRRvZdf9oww+7IytooiBQtjKLAdCQfMAXpO/dc/FMWyHkr12JS
 ZqabhMCopqc94H8G+WPpptqvIqeO4Wfi2qlPKFQXomh5RWpLJ4WGRgIbJ4SL7OebaZ9b
 Cu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Ntmvbr4Rsn/lopxAADIIDgcNErNmU/zbadQcByBiYK4=;
 b=i7lHDa8Ur67n4na+tYB2JCOOIf77AaqawIsOGHKgKbE9w8+58Jf6tcVtY+bWkuzvNn
 AFWJj63ss9syD/bYQW3V4eLiyagFCaqCt+PyaRy2h1znF6DhV0lwv8zcntRyfJKs7cLK
 Y+N3xsLRQxVUgi2Wh/PhpeD2VORZVAKI/tgHeer/hckhp02IKUdPbz5eh/dwQEXunTDC
 xjtj67a7O84/xCsGCB5v9rywdqIL1zXmy0uWvuwZAieEJtSUfC9OkKj8tawZ8NQNLrSc
 DzJeZ2kisjY+6Lww6Syg/KlvogBmksuFE09W8YdhvpXPBleCAuAlmaf1iNRYBH4nmGhr
 IhAg==
X-Gm-Message-State: AOAM530RReXkHPEreAXVfgUzUlut6brZPBSmGMw0aIfELupr10b8OekT
 vgPnWMWHiJa8c4+6Q3wxMno=
X-Google-Smtp-Source: ABdhPJwSbcPeLeFEknq5SPs1K9/7wAZ9//Y8XUJsBm0HOgxDXNJ+d8W1kIX2/TWCimMS0wf9W28w6Q==
X-Received: by 2002:a17:90a:ce87:: with SMTP id
 g7mr14492750pju.189.1624531415692; 
 Thu, 24 Jun 2021 03:43:35 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id n12sm2540624pfu.5.2021.06.24.03.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 03:43:35 -0700 (PDT)
Date: Thu, 24 Jun 2021 20:43:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/6] KVM: x86/mmu: avoid struct page in MMU
To: Marc Zyngier <maz@kernel.org>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-4-stevensd@google.com>
 <1624524744.2sr7o7ix86.astroid@bobo.none> <87mtrfinks.wl-maz@kernel.org>
In-Reply-To: <87mtrfinks.wl-maz@kernel.org>
MIME-Version: 1.0
Message-Id: <1624531381.4bht02wxsj.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Jun 2021 18:47:09 +0000
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@ozlabs.org>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, intel-gvt-dev@lists.freedesktop.org,
 Joerg Roedel <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 intel-gfx@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, David Stevens <stevensd@chromium.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Excerpts from Marc Zyngier's message of June 24, 2021 8:06 pm:
> On Thu, 24 Jun 2021 09:58:00 +0100,
> Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>> Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
>> > From: David Stevens <stevensd@chromium.org>
>> >  out_unlock:
>> >  	if (is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa))
>> >  		read_unlock(&vcpu->kvm->mmu_lock);
>> >  	else
>> >  		write_unlock(&vcpu->kvm->mmu_lock);
>> > -	kvm_release_pfn_clean(pfn);
>> > +	if (pfnpg.page)
>> > +		put_page(pfnpg.page);
>> >  	return r;
>> >  }
>>=20
>> How about
>>=20
>>   kvm_release_pfn_page_clean(pfnpg);
>=20
> I'm not sure. I always found kvm_release_pfn_clean() ugly, because it
> doesn't mark the page 'clean'. I find put_page() more correct.
>=20
> Something like 'kvm_put_pfn_page()' would make more sense, but I'm so
> bad at naming things that I could just as well call it 'bob()'.

That seems like a fine name to me. A little better than bob.

Thanks,
Nick
