Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629123B3604
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0596ECA3;
	Thu, 24 Jun 2021 18:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25FB6EB21;
 Thu, 24 Jun 2021 08:52:12 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so3057288pjn.1; 
 Thu, 24 Jun 2021 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=9iS9TDXjHYeeO4p1tZR6e76NZxX4UTo0tHhJ02Bmyuc=;
 b=mEGHBnjuh74WaoNyT1eKb/VOfvVFvX3kwUneJ5AncMO10vay7V/YPF/SG5j7p8iYH1
 7gxNCDvNzDqb55aG0xXgAC1RA62Wj+bbizWaJDKEr0nn3qnuj2jXLdTdeiyFZgIkzbU6
 eUXYZQk6B3lHcCn/C7rK9Hfy2ewbGQ+QcUAXV5aikZlnmoVPOh+oFpMVHi12RR/PQruY
 Y7ojicHYDpa1rl6bybFrRzQg1WLQ4vvo9pySUIlXsW7HorWi3IZfqYmc1PUso5nJwGuX
 l372R3hUka0ng8Md0fedsRzdAZ1LxWh9MkI+AQUHTjtMJyFheflEYDzQL0UNZQwWosBs
 cQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9iS9TDXjHYeeO4p1tZR6e76NZxX4UTo0tHhJ02Bmyuc=;
 b=NVQEAR6gS0yMvZEkOAfgIH7klCMhBXWGGfsfE7oy1Y0AK7Kshr6GJTpy6g/oPIUake
 IFkpkb+a7o8QywAmYqGAj4Gu+406yaqSyCK9e8tur13EpspL7AjrrzP2IyMQqFEEyiTf
 fBQPNjYVDyekVN0BDT9BeC6ghpLCDyeljaQzA3ghxqgSfxk7Zc2xLHCYDodiMoH7JIH7
 q38mcGkaRW2ESIAqRqXPuPwdHu/yqFxPIu5dphN/lNCttAL7JkIqcv83RaxKDtdNyxaw
 i3LeYHfBIo0agicw8w384jQERGZd+22CQ+SkIveaeZyrZwdNdak4WXVBDHCEyE6W2u9/
 9mNA==
X-Gm-Message-State: AOAM533EfIxBRfpfeaMqm8cNuxPImlGZ9+8afOLKdVhMuh57M9FkkALJ
 kAeBfQ0G5KyHE2bf7Si4tTHvbQ+70Os=
X-Google-Smtp-Source: ABdhPJxZDp/SyGeLqZPtuw/I81jZ765tjN1eiDWxfb5Gw8s0EqtrDghio6LIVydktk8tQn/Q5HNfVQ==
X-Received: by 2002:a17:90a:6fc1:: with SMTP id
 e59mr4396347pjk.37.1624524732566; 
 Thu, 24 Jun 2021 01:52:12 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id c5sm2109274pfv.47.2021.06.24.01.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 01:52:12 -0700 (PDT)
Date: Thu, 24 Jun 2021 18:52:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/6] KVM: mmu: also return page from gfn_to_pfn
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-3-stevensd@google.com>
In-Reply-To: <20210624035749.4054934-3-stevensd@google.com>
MIME-Version: 1.0
Message-Id: <1624524331.zsin3qejl9.astroid@bobo.none>
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
>=20
> Return a struct kvm_pfn_page containing both a pfn and an optional
> struct page from the gfn_to_pfn family of functions. This differentiates
> the gup and follow_fault_pfn cases, which allows callers that only need
> a pfn to avoid touching the page struct in the latter case. For callers
> that need a struct page, introduce a helper function that unwraps a
> struct kvm_pfn_page into a struct page. This helper makes the call to
> kvm_get_pfn which had previously been in hva_to_pfn_remapped.
>=20
> For now, wrap all calls to gfn_to_pfn functions in the new helper
> function. Callers which don't need the page struct will be updated in
> follow-up patches.

Hmm. You mean callers that do need the page will be updated? Normally=20
if there will be leftover users that don't need the struct page then
you would go the other way and keep the old call the same, and add a new
one (gfn_to_pfn_page) just for those that need it.

Most kernel code I look at passes back multiple values by updating=20
pointers to struct or variables rather than returning a struct, I=20
suppose that's not really a big deal and a matter of taste.

Thanks,
Nick

