Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE63F3B3A24
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 02:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272B16E075;
	Fri, 25 Jun 2021 00:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A146E05A;
 Fri, 25 Jun 2021 00:20:37 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id c5so6618840pfv.8;
 Thu, 24 Jun 2021 17:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=QS1Ns1WqNL5is+0vi/ZTUFuxlVcqVbsqm8g6SHrti5w=;
 b=esFkhH15NMc8wS4V/cwcupYK/DM+pO31de2/rn7330Vbdh9CSH9nvb+7DxAuWpBq5q
 I7HhRjIAf3sfraAsSUg5Y3qXSa9eVE9+YVQ00KJALtXy9kkDyH52E89nrtf01dGKriH8
 b00IMLN+V/HOLpi8TtU0LZ1hk9cAx0kkRlMaPdbbDzt+jClVFu+NXDMdkVwZY7xsN+Pb
 tP4yZoVaJBNxRaG8tctEZTIYWsIItqZBewSg9WSZ8LdCnbR+ioG4SZD7hACLKDcVik91
 hFNd/jFL7BVxEVmattHQ7LktCFlqiNNlX/MEUpDQB/QeQIQwm0YNoc++AkYkd7w7Rqkx
 Ypjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=QS1Ns1WqNL5is+0vi/ZTUFuxlVcqVbsqm8g6SHrti5w=;
 b=X0mCP/yvu7sDFRPIZIWc0nlg8J08blgc7dkp+cRsYhcXOOoww75T4NZKRvasz7vXHa
 6eoNzesMTVZg3xZge3JHQoM/ueSvv5W+mh/U7gjoorHNeR5p4pchiGYd/dAOOtVMR4Mj
 eCYLRp0xKoRDyjwaINDmgzGl7PUNGaJUrxiTfkKF1OtyKsTbLa8tWtXVuJMAGXwDOyL1
 csOHep3ox4gGWZd3hx26jL0m4KIEsBTggYnOBm1AAvPtXoFaVGUx8qqpm/hrjeHvItxg
 xqfSmx4f2OM/ABIn+PN+8CC98VoHGVLqDSPa7rzriom/RKvnry53GUg5xooxJ0MVKrTr
 0/Ng==
X-Gm-Message-State: AOAM530/B8LcLoWaWGsZwqp4B+iIo/32/JOIjHGAq7+xcnPC4GAF0ZMv
 2H5IIrfr3tDEnkIcS1jHQkU=
X-Google-Smtp-Source: ABdhPJxQU7+bPuGhEylfTnovn9GkVLr4KlmlOjHYTX0Un3AOHd4dWxP2gfr/obThDIjB30qffkhRJQ==
X-Received: by 2002:a62:2fc1:0:b029:305:fd1e:e3f4 with SMTP id
 v184-20020a622fc10000b0290305fd1ee3f4mr4774381pfv.17.1624580437511; 
 Thu, 24 Jun 2021 17:20:37 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id z18sm3630623pfe.214.2021.06.24.17.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 17:20:37 -0700 (PDT)
Date: Fri, 25 Jun 2021 10:20:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64 MMU
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <1624530624.8jff1f4u11.astroid@bobo.none>
 <1624534759.nj0ylor2eh.astroid@bobo.none>
 <0d3a699a-15eb-9f1b-0735-79d14736f38c@redhat.com>
 <1624539354.6zggpdrdbw.astroid@bobo.none>
 <81d99029-ec40-19c5-5647-20607d78dab0@redhat.com>
In-Reply-To: <81d99029-ec40-19c5-5647-20607d78dab0@redhat.com>
MIME-Version: 1.0
Message-Id: <1624580015.hf7udh0vc3.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
 David Stevens <stevensd@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Morse <james.morse@arm.com>, kvm-ppc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Excerpts from Paolo Bonzini's message of June 25, 2021 1:35 am:
> On 24/06/21 14:57, Nicholas Piggin wrote:
>> KVM: Fix page ref underflow for regions with valid but non-refcounted pa=
ges
>=20
> It doesn't really fix the underflow, it disallows mapping them in the=20
> first place.  Since in principle things can break, I'd rather be=20
> explicit, so let's go with "KVM: do not allow mapping valid but=20
> non-reference-counted pages".
>=20
>> It's possible to create a region which maps valid but non-refcounted
>> pages (e.g., tail pages of non-compound higher order allocations). These
>> host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
>> of APIs, which take a reference to the page, which takes it from 0 to 1.
>> When the reference is dropped, this will free the page incorrectly.
>>=20
>> Fix this by only taking a reference on the page if it was non-zero,
>=20
> s/on the page/on valid pages/ (makes clear that invalid pages are fine=20
> without refcounting).

That seems okay, you can adjust the title or changelog as you like.

> Thank you *so* much, I'm awful at Linux mm.

Glad to help. Easy to see why you were taking this approach because the=20
API really does need to be improved and even a pretty intwined with mm=20
subsystem like KVM shouldn't _really_ be doing this kind of trick (and
it should go away when old API is removed).

Thanks,
Nick
