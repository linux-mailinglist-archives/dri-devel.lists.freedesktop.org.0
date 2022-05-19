Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3C252DA5B
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 18:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DB7113168;
	Thu, 19 May 2022 16:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C713C113E42
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 16:37:49 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id x12so5539987pgj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F28DbulQ0jEkQGLikm8EqDCBfoSZOeUw515EvhneCFA=;
 b=mIZhrXQ4iFDgPsYFsZ60+OFftLbzg2tZW+uB4Ooe2VBWkW8cBXZysVagXo2RHoj2JB
 lB5PsP+r0vtw5PFYL7B5Y3KWrKTQz5GQdLa12HpSuDW1l8BJQScklN/B+swR9iP2becL
 eRKAYpFxwRMcG0SHKNoGGPgJxYRV9lyd62T7ErM9+iqtrSjZUFBFRxMcnzUY3VZ88IEl
 dM/9ug6NofL/hobVN6loSHRaQ19j9XqB1sHW50BI4yWVP3eobgOMPogH4GixJA/neC7R
 4W7l6Z6XIGmCOCHUYVm1JJfgNgrAyb903+W2X5UumWnHyOF6RUtPiBKwafzpWnNSbDqk
 JieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F28DbulQ0jEkQGLikm8EqDCBfoSZOeUw515EvhneCFA=;
 b=XjU8oOmAK30fEEVLxEPeU6IjgqGOq7B2bi2aMLGBjxt/FB+CCJLH1B/PJ7PoTfzmCf
 fJ9/l/pxJqT1nbnn3sv4m3+KcYy3sMM0FhWhNEwSGnPfRDG0b45DLb2kBYXFnuxScXtG
 aDovn3MuteDeqvNmLyksngKuXcHqXq5TQBXerDW8Vry8/VjElZ8gDLebk5qFlNybs9e1
 rjbP0GN688Qh1ZJXYFn2RAa26yLFJ8/E8kDzz+ynPqHAXQy0f44MntqUrsxwgGFYVBJ3
 Tossc82xXh/CTEkdXGZIso2T8SXHtNjQM3qjXoVzkGFWExcXgSPTW5u4x/Bjp6CnGPU2
 QrGw==
X-Gm-Message-State: AOAM533CYpYeyN86MjcnYpuaHOUCDPOB0Mzcgrpox96Zv9PUrbaFVdWE
 C3VbGxyeiRVJx/hpVu9cUIEXgw==
X-Google-Smtp-Source: ABdhPJx1nKZBsvM/1s0Knp+K6VPSacbbVwoq4r4yMLooMeqC6xBtrejZP6toBWYuM4j+VwQpyBM+WQ==
X-Received: by 2002:a63:d611:0:b0:3c6:afdf:819b with SMTP id
 q17-20020a63d611000000b003c6afdf819bmr4622740pgg.513.1652978269170; 
 Thu, 19 May 2022 09:37:49 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 p6-20020a170902780600b0015e8d4eb24dsm4023212pll.151.2022.05.19.09.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:37:48 -0700 (PDT)
Date: Thu, 19 May 2022 16:37:44 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 04/19] KVM: x86: mmu: allow to enable write
 tracking externally
Message-ID: <YoZyWOh4NPA0uN5J@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-5-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427200314.276673-5-mlevitsk@redhat.com>
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> @@ -5753,6 +5752,10 @@ int kvm_mmu_init_vm(struct kvm *kvm)
>  	node->track_write = kvm_mmu_pte_write;
>  	node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
>  	kvm_page_track_register_notifier(kvm, node);

Can you add a patch to move this call to kvm_page_track_register_notifier() into
mmu_enable_write_tracking(), and simultaneously add a WARN in the register path
that page tracking is enabled?

Oh, actually, a better idea. Add an inner __kvm_page_track_register_notifier()
that is not exported and thus used only by KVM, invoke mmu_enable_write_tracking()
from the exported kvm_page_track_register_notifier(), and then do the above.
That will require modifying KVMGT and KVM in a single patch, but that's ok.

That will avoid any possibility of an external user failing to enabling tracking
before registering its notifier, and also avoids bikeshedding over what to do with
the one-line wrapper to enable tracking.
