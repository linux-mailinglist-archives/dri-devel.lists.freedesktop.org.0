Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6873B3608
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE146ECA7;
	Thu, 24 Jun 2021 18:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59D96EB21;
 Thu, 24 Jun 2021 08:43:06 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so3030334pjo.3; 
 Thu, 24 Jun 2021 01:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=yhvFMq52QAZ9Grg2JNZMftQHgs3RA/23cRzSXZS17k0=;
 b=gAOPVlMk/C7twisLQPwKCNWWewikvdh3rxAsE3ZtniqnTTajI/NMXYxiFGdNgFsAb5
 HygkoSZIJ35Gv0csn5ROrHrh88J/UJu+eQftLB0ieYLqxUsTshCjLCXS6gCtoawRaivr
 09ywa3Xbj5hpxhL9dwXklJBlZskMpYTiquDzecxyLb9cNgD5q6A07FqSvRwXDFm8rCjX
 BNwM+/+ntQwzLzmsj9QUq7rwCh6LY1EpIQpDwzEMVK8zxcfbTYEjGD1dfARZQBO2ATzQ
 bXhbvn6/C4gpLxmOLhsNYYF/nPrsfEvzkHwVbcZduLr1uAs8pjNAgfhm1dhPRaqpCZmK
 qi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=yhvFMq52QAZ9Grg2JNZMftQHgs3RA/23cRzSXZS17k0=;
 b=UUrg5nqr9uV6NFnZFCwXzXYwsaFlJzMDZQ0j5Sj36q6AjMdhj3l7zgvzff6Pesl9uC
 F5JqKKa5gDMoRYiJDfKkWrCI8VOzToWi7BzhhxuMwngAvg0t2m1JUhnn+FgVdXqDV668
 duG9bbCWVClG1ANSP87Ek7VB9Tq+ouKmmkXYZj89DyEWNkwlJ+2lC6V01PJps07XP90F
 ssNvR0zXGQcFMO0xofRETGURd1SzrXyv4xBy0Y4ecZm7UOJKU8fvj1WgAMctszdllF6y
 /I0/VdbPxoDjFBXSO/bcu+lFxZA1MdRTgKKfZPFs7iEgYJY5uUabKHA6z3TW2MLhQNvS
 FvqQ==
X-Gm-Message-State: AOAM531MegT2OD0R3EVagPhfT6sJYbbG21R/hhmVPqOunEReiktA2SgE
 RwoDTS4SNrN5eMESgr/xj5k=
X-Google-Smtp-Source: ABdhPJxPYtDJj0lFNs0Ok5TeYJmivmtsbDnnr/kiA2/ldwDSYWrbmF8IsiSMPIQHeLM0imoUnt26JQ==
X-Received: by 2002:a17:90b:793:: with SMTP id
 l19mr14007232pjz.111.1624524186360; 
 Thu, 24 Jun 2021 01:43:06 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id 23sm1841779pjw.28.2021.06.24.01.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 01:43:06 -0700 (PDT)
Date: Thu, 24 Jun 2021 18:43:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/6] KVM: x86/mmu: release audited pfns
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-2-stevensd@google.com>
In-Reply-To: <20210624035749.4054934-2-stevensd@google.com>
MIME-Version: 1.0
Message-Id: <1624524156.04etgk7zmz.astroid@bobo.none>
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

Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
> From: David Stevens <stevensd@chromium.org>

Changelog? This looks like a bug, should it have a Fixes: tag?

Thanks,
Nick

>=20
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  arch/x86/kvm/mmu/mmu_audit.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/x86/kvm/mmu/mmu_audit.c b/arch/x86/kvm/mmu/mmu_audit.c
> index cedc17b2f60e..97ff184084b4 100644
> --- a/arch/x86/kvm/mmu/mmu_audit.c
> +++ b/arch/x86/kvm/mmu/mmu_audit.c
> @@ -121,6 +121,8 @@ static void audit_mappings(struct kvm_vcpu *vcpu, u64=
 *sptep, int level)
>  		audit_printk(vcpu->kvm, "levels %d pfn %llx hpa %llx "
>  			     "ent %llxn", vcpu->arch.mmu->root_level, pfn,
>  			     hpa, *sptep);
> +
> +	kvm_release_pfn_clean(pfn);
>  }
> =20
>  static void inspect_spte_has_rmap(struct kvm *kvm, u64 *sptep)
> --=20
> 2.32.0.93.g670b81a890-goog
>=20
>=20
