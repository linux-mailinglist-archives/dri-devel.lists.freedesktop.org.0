Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71023B3614
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B98B6ECB6;
	Thu, 24 Jun 2021 18:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FBC6EAA3;
 Thu, 24 Jun 2021 10:42:14 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id w71so4811341pfd.4;
 Thu, 24 Jun 2021 03:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=NfjdhOW72m4TGpvzWGEQF11KzSsneVbaVBvFK0bGPzo=;
 b=Kt+9hz5Z8hf17MTaP2NEbCNsixEB/2vtcneDIWMxInZE3wFpBTCY4arVW85yk4tRHF
 qWXnzq5TbY8JfmQrKqxmZnou8HmT8i1seCjd1BlC3DaEQNjDAwV+HQjRqrh2wSC5wL59
 gRrb2rxjfZldQEn+6eMb0tmL7unUZmTBjbxFxwf6fUug4isZHK1CcpQ0getq8GAd87FC
 3RcDqKD/Mv0yWnn2UAF2jMZ1K/PXC5Gqwy+wDcve3LXPzWTqm+dcHR3tVukvmCrbGHtj
 N0va4eRcYEBOnrKc/XVLBME0xL1myho/N5KENcJl2Jx0DUZHv582U2/2wqKp+nzNi87p
 llKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NfjdhOW72m4TGpvzWGEQF11KzSsneVbaVBvFK0bGPzo=;
 b=DugyRKsRI0KwQVe9DEP3Q/5/QNhvty2IMbG/EUHIaVcmSe30qVlLomGOzZ+qyxxa23
 pdJplGgSHM9tumr6R8YwLG1k5GiOBFnFmuxnxfOi86g/l0DXV2K08D2Xd9uxRvN8oYJx
 gQSXAHAb3u/DEZdCxKfaG9KctlUngtg6JxdQH7lz95df4GmlB0YIqwcOzqlvU+Lp5V3d
 WNZBtT6rAJP3FhTa9BisnA4c5OgjYW+LmmeNIB/Qvlf8FHT3rnsGE+mqbJOoMdhE2Ixe
 twVoZIiwDnkKc5ni4cs3do7vezcKrYyWhSokqcF2xroO6LCrn82cNXBKmvPddWwKS2OW
 6cow==
X-Gm-Message-State: AOAM531LoJ8W15B5dlyuSX+3NfV1dEuWNeUl8SbLs0rvRe32+S42M5CV
 oSLrZSNH0P7lA7kySv9sM4Q=
X-Google-Smtp-Source: ABdhPJx+bbBfj2pzk/mB2ERG+jW9T31gVCsxpF6k7D325eLHwjfeRucb+BobnHJ3y5XGrFTWG6Ebcw==
X-Received: by 2002:a63:586:: with SMTP id 128mr4140080pgf.366.1624531334522; 
 Thu, 24 Jun 2021 03:42:14 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id i8sm2522609pfq.165.2021.06.24.03.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 03:42:14 -0700 (PDT)
Date: Thu, 24 Jun 2021 20:42:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/6] KVM: mmu: also return page from gfn_to_pfn
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-3-stevensd@google.com>
 <1624524331.zsin3qejl9.astroid@bobo.none>
 <201b68a7-10ea-d656-0c1e-5511b1f22674@redhat.com>
 <1624528342.s2ezcyp90x.astroid@bobo.none>
 <1624529635.75a1ann91v.astroid@bobo.none>
 <fc2a88ed-6a98-857d-bb1f-73260b01ac30@redhat.com>
In-Reply-To: <fc2a88ed-6a98-857d-bb1f-73260b01ac30@redhat.com>
MIME-Version: 1.0
Message-Id: <1624531085.fax3fcqpgc.astroid@bobo.none>
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

Excerpts from Paolo Bonzini's message of June 24, 2021 8:21 pm:
> On 24/06/21 12:17, Nicholas Piggin wrote:
>>> If all callers were updated that is one thing, but from the changelog
>>> it sounds like that would not happen and there would be some gfn_to_pfn
>>> users left over.
>>>
>>> But yes in the end you would either need to make gfn_to_pfn never retur=
n
>>> a page found via follow_pte, or change all callers to the new way. If
>>> the plan is for the latter then I guess that's fine.
>>
>> Actually in that case anyway I don't see the need -- the existence of
>> gfn_to_pfn is enough to know it might be buggy. It can just as easily
>> be grepped for as kvm_pfn_page_unwrap.
>=20
> Sure, but that would leave us with longer function names=20
> (gfn_to_pfn_page* instead of gfn_to_pfn*).  So the "safe" use is the one=20
> that looks worse and the unsafe use is the one that looks safe.

The churn isn't justified because of function name length. Choose g2pp()=20
if you want a non-descriptive but short name.

The existing name isn't good anyway because it not only looks up a pfn=20
but also a page, and more importantly it gets a ref on the page. The
name should be changed if you introduce a new API.

>> And are gfn_to_page cases also
>> vulernable to the same issue?
>=20
> No, they're just broken for the VM_IO|VM_PFNMAP case.

No they aren't vulnerable, or they are vunlerable but also broken in=20
other cases?

Thanks,
Nick
