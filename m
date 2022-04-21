Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456D85096D2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 07:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7C210F359;
	Thu, 21 Apr 2022 05:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6934010F352
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650518811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09wIP+Ezh+boJlEnNU0DFCx3hEkdvqLMQ0cz6cNAjsc=;
 b=UwCqGx/4HgRXjTO9wj37Ge2+fddLxbfcC8AdG9fzFRN5y9r6VF+xZpMbJtp4+ScLSXhTTs
 EmjXomi2egGm37ql8u1P+/Dz0JdlQCmWJwPjrxV/CSG8eWJ2qAq05drqOHZ8OLK6bPwVA4
 TujYOu8JmM+V4znjPdPuFphGtgFahTc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37--1U9P576OECVU_d2kZEZSA-1; Thu, 21 Apr 2022 01:26:46 -0400
X-MC-Unique: -1U9P576OECVU_d2kZEZSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06FE480005D;
 Thu, 21 Apr 2022 05:26:45 +0000 (UTC)
Received: from starship (unknown [10.40.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 649EC40D0168;
 Thu, 21 Apr 2022 05:26:39 +0000 (UTC)
Message-ID: <b622882b4fbcacdeb09e4112251aeeab48059ded.camel@redhat.com>
Subject: Re: [RFC PATCH v2 04/10] KVM: x86: mmu: tweak fast path for
 emulation of access to nested NPT pages
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Date: Thu, 21 Apr 2022 08:26:38 +0300
In-Reply-To: <20220421051244.187733-5-mlevitsk@redhat.com>
References: <20220421051244.187733-1-mlevitsk@redhat.com>
 <20220421051244.187733-5-mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: Wanpeng Li <wanpengli@tencent.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-04-21 at 08:12 +0300, Maxim Levitsky wrote:
> ---
>  arch/x86/kvm/mmu/mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 23f895d439cf5..b63398dfdac3b 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -5315,8 +5315,8 @@ int kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 error_code,
>  	 */
>  	if (vcpu->arch.mmu->root_role.direct &&
>  	    (error_code & PFERR_NESTED_GUEST_PAGE) == PFERR_NESTED_GUEST_PAGE) {
> -		kvm_mmu_unprotect_page(vcpu->kvm, gpa_to_gfn(cr2_or_gpa));
> -		return 1;
> +		if (kvm_mmu_unprotect_page(vcpu->kvm, gpa_to_gfn(cr2_or_gpa)))
> +			return 1;
>  	}
>  
>  	/*

I forgot to add commit description here:

If non leaf mmu page is write tracked externally for some reason,
which can in theory happen if it was used for nested avic physid page
before, then this code will enter an endless loop of page faults because
unprotecting the page will not remove write tracking, nor will the
write tracker callback be called.

Fix this by only invoking the fast patch if we succeeded in zapping the
mmu page.

Fixes: 147277540bbc5 ("kvm: svm: Add support for additional SVM NPF error codes")
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>

--

In theory, KVMGT also does external write tracking so in theory this issue can happen today,
but it is highly unlikely.

Best regards,
	Maxim Levitsk

