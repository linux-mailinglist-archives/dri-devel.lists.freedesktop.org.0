Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 182883B360D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EBC6ECB0;
	Thu, 24 Jun 2021 18:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948FA6EB1F;
 Thu, 24 Jun 2021 08:58:06 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id t32so4604338pfg.2;
 Thu, 24 Jun 2021 01:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tKGKGI76BKfQVO8CY1clLxpyySv3vaB3aNh7NWcPhFU=;
 b=hr3gPiWSs1kzsoT0RN4D0/9u1oAQb1rzWVWLp59xVCkmpZThGbP8ZZHdbz3ZoRByYE
 Q+bBx6g9vlzubm3xmDqrFRZB2+oF9y38fRVeD/lgeXJbzeuitriXAAYQ0N8Gc/HydmS9
 h/5/U9gCncS2FPi6hlzNOXRrtw9yomYF3Wegfa7y5BMTxxqMjVRS/4Rtc+vsfYrwyiXs
 LyEAUsbj+aFGjgwEVS9b0hjW6sOv/s+/X+xMkec2Brf1nwlIC4mUivbzM9KBmc/1CmOo
 TCEnNnCh1Rmp7Wm6gBzXbz6S+8yTRr+T+rSaRDpuwEYfFxSOn4uIuwntNiH62vmZwJdo
 +iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tKGKGI76BKfQVO8CY1clLxpyySv3vaB3aNh7NWcPhFU=;
 b=IUfUW0z2hL0+awiiMm+BAFW0tuf+AeA38iKv685Bdr1u+t1jPHPewXOHS3YNnC+MRa
 9uZineVFkpZMdwvkeOGnkXCm3TiQYbc/BYbp0Mr3UI1FyfbhU4ULvhvyBfklqZEeo0mI
 HsF/3UDbbU4yMiRwPQ3A3qTzWMJQFyKA5i0tnmgGBzoqkrmC00xCBELqZDrr0jmczh92
 xvWbw8m6eO80wQ8h6UFy2BvLGT703iaeWYGkGB9cnWmG/3Kxj25AKf6xLpiUw0h8xGXh
 92xmp6ClMVxqVDiYgnj7GLs8wuXLJI6if3bTmIFnFSTxlxT9Ebd6cfTqzhUR8zAl9oBB
 uJHg==
X-Gm-Message-State: AOAM532Dv5mM54p9eOthC2uRejp2L8vQvDYqTLbS4v697h6kwfAp/pYv
 1vWL4jLaaP6A9YYPFQ5d+SI=
X-Google-Smtp-Source: ABdhPJw6tjizzTpMBwm3ffTzeTydtLNTRDVWzEX8o5A/u6n7JmgIJ0z9ctLYNOtrV24IDSrsfT+37Q==
X-Received: by 2002:a63:4e4c:: with SMTP id o12mr3895360pgl.95.1624525086186; 
 Thu, 24 Jun 2021 01:58:06 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id u12sm2003479pjc.0.2021.06.24.01.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 01:58:05 -0700 (PDT)
Date: Thu, 24 Jun 2021 18:58:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/6] KVM: x86/mmu: avoid struct page in MMU
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-4-stevensd@google.com>
In-Reply-To: <20210624035749.4054934-4-stevensd@google.com>
MIME-Version: 1.0
Message-Id: <1624524744.2sr7o7ix86.astroid@bobo.none>
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
>  out_unlock:
>  	if (is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa))
>  		read_unlock(&vcpu->kvm->mmu_lock);
>  	else
>  		write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(pfn);
> +	if (pfnpg.page)
> +		put_page(pfnpg.page);
>  	return r;
>  }

How about

  kvm_release_pfn_page_clean(pfnpg);

Thanks,
Nick
