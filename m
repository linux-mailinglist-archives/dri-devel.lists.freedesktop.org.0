Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2284F3B2E66
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298436EB65;
	Thu, 24 Jun 2021 12:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3956EB65
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624536037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avGojGcO92NTULuhKarR1IMbTxAu/KipAq8BEw7I0Ko=;
 b=GN7OeQoEYRzW+TRThpAB2aA+eEPvAIA2uyr4AKeIw/cyd2VX8S+09v6uK3rBNTuTXUeXgo
 xCSTj/Hl9oE2NhHKOrr2t3QzRIlB43S/303VoNn4rmkTHJoy843i4hf4bQYWgiTUe/Px0a
 q7nH1CmwwVlXJ9+LNF+tWz5Rfw1zTT4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-8NAjpo6aPMO2zLhR_94P7Q-1; Thu, 24 Jun 2021 08:00:31 -0400
X-MC-Unique: 8NAjpo6aPMO2zLhR_94P7Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so548647wmj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 05:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=avGojGcO92NTULuhKarR1IMbTxAu/KipAq8BEw7I0Ko=;
 b=d4aPpJnYzI8bFajnLz3dq3BjkFknw6Sp2Len0Y/KyGl+LweqlrjfCmhwvph5BYIU6C
 XPPG3DYh4ux1wewbv4cwunZSn4iewsUBIRBSKshqj9c1xjMddgVHD4XUL3uVPqUCZvT6
 b3aR6cuW50jNabJnJu6ZoMz93UfvZxB0TegLFgWksLynm5SPzZ+P5NqgVE3e2u2FD0w0
 cH4zQfOxTOcWnNEkdkXoeOXgOsFMelrScCI0rx07n61kkK5HEikuusmJtR8Ux78kjoAU
 AEznfup6gciaPg557DSyGgEZur8HfsVI9aIUcij3C+gtJGUnO/m3Ps+cVVQJRy7yq+D+
 i5Qg==
X-Gm-Message-State: AOAM533P+AvshKUKGX/8t8kWznMhLUN07dq7o5nzHmrl1BiWp+n+Rpqz
 OUli+O4B7IE7fTWQ6LVpGjSM1CaKEK91mkjw+MLOlYNF2w0sxHN/0tt8Xan9g2bfnGRT9FpqC9y
 DS+WhwJDnfVCWhSGRywz+qPYiLYKa
X-Received: by 2002:a1c:f215:: with SMTP id s21mr3879330wmc.179.1624536030069; 
 Thu, 24 Jun 2021 05:00:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXFCnAp+BCIAB50GwF3Py3d9h4g0enz3/eZSVNkNtDC1Z07h1ecnwnq+OHmfePVB6B9P4IuQ==
X-Received: by 2002:a1c:f215:: with SMTP id s21mr3879281wmc.179.1624536029808; 
 Thu, 24 Jun 2021 05:00:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm3074141wrp.53.2021.06.24.05.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 05:00:29 -0700 (PDT)
To: Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, David Stevens <stevensd@chromium.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <1624530624.8jff1f4u11.astroid@bobo.none>
 <1624534759.nj0ylor2eh.astroid@bobo.none>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64 MMU
Message-ID: <d06a8a55-bb9d-a6ef-21bb-0633b99a50d1@redhat.com>
Date: Thu, 24 Jun 2021 14:00:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1624534759.nj0ylor2eh.astroid@bobo.none>
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

On 24/06/21 13:42, Nicholas Piggin wrote:
> +static int kvm_try_get_pfn(kvm_pfn_t pfn)
> +{
> +	if (kvm_is_reserved_pfn(pfn))
> +		return 1;

So !pfn_valid would always return true.  Yeah, this should work and is 
certainly appealing!

Paolo


> +	return get_page_unless_zero(pfn_to_page(pfn));
> +}
> +
>   static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>   			       unsigned long addr, bool *async,
>   			       bool write_fault, bool *writable,
> @@ -2104,13 +2111,21 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>   	 * Whoever called remap_pfn_range is also going to call e.g.
>   	 * unmap_mapping_range before the underlying pages are freed,
>   	 * causing a call to our MMU notifier.
> +	 *
> +	 * Certain IO or PFNMAP mappings can be backed with valid
> +	 * struct pages, but be allocated without refcounting e.g.,
> +	 * tail pages of non-compound higher order allocations, which
> +	 * would then underflow the refcount when the caller does the
> +	 * required put_page. Don't allow those pages here.
>   	 */
> -	kvm_get_pfn(pfn);
> +	if (!kvm_try_get_pfn(pfn))
> +		r = -EFAULT;
>   
>   out:
>   	pte_unmap_unlock(ptep, ptl);
>   	*p_pfn = pfn;
> -	return 0;
> +
> +	return r;
>   }
>   
>   /*
> 

