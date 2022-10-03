Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7981F5F29F1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 09:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3870A10E225;
	Mon,  3 Oct 2022 07:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BE310E223
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664782086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmztSdLxGLePdL68BUHnz4SzM/l/VKgoGqcyR7GOU3U=;
 b=W9NLgDIQ4y9T4MMlLRbv/zS3ghJy3T5j7jbzshDRML6zgS0eetTedt7fGcgpSLmRD/Nr+5
 87XmQtsIJ1EWUr2h9Nb65ODuFLsm4sN083PNL+F5IfObVg3JQWqMuaSWL+EryLXpKHs9x8
 lZluO1/YTsixwI+qVWC7m7c0iTQ6+fU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-rDj1GlhuNzGvFkYvPvriTg-1; Mon, 03 Oct 2022 03:28:03 -0400
X-MC-Unique: rDj1GlhuNzGvFkYvPvriTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4AB28027ED;
 Mon,  3 Oct 2022 07:28:01 +0000 (UTC)
Received: from starship (unknown [10.40.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9A621121314;
 Mon,  3 Oct 2022 07:27:54 +0000 (UTC)
Message-ID: <a80e2f92b4a93b00ad29f16944f2748eadbdda76.camel@redhat.com>
Subject: Re: Nested AVIC design (was:Re: [RFC PATCH v3 04/19] KVM: x86: mmu:
 allow to enable write tracking externally)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Mon, 03 Oct 2022 10:27:53 +0300
In-Reply-To: <YzYeTCsNfQWccKJ9@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-5-mlevitsk@redhat.com> <YoZyWOh4NPA0uN5J@google.com>
 <5ed0d0e5a88bbee2f95d794dbbeb1ad16789f319.camel@redhat.com>
 <c22a18631c2067871b9ed8a9246ad58fa1ab8947.camel@redhat.com>
 <Yt6/9V0S9of7dueW@google.com>
 <7c4cf32dca42ab84bdb427a9e4862dbf5509f961.camel@redhat.com>
 <YugLc5LLPJkt89z6@google.com>
 <fe76ea902a38a10e2d8078fd9e5a71a0c7724d84.camel@redhat.com>
 <YzYeTCsNfQWccKJ9@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Thu, 2022-09-29 at 22:38 +0000, Sean Christopherson wrote:
> On Mon, Aug 08, 2022, Maxim Levitsky wrote:
> > Hi Sean, Paolo, and everyone else who wants to review my nested AVIC work.
> 
> Before we dive deep into design details, I think we should first decide whether
> or not nested AVIC is worth pursing/supporting.
> 
>   - Rome has a ucode/silicon bug with no known workaround and no anticipated fix[*];
>     AMD's recommended "workaround" is to disable AVIC.
>   - AVIC is not available in Milan, which may or may not be related to the
>     aforementioned bug.
>   - AVIC is making a comeback on Zen4, but Zen4 comes with x2AVIC.
>   - x2APIC is likely going to become ubiquitous, e.g. Intel is effectively
>     requiring x2APIC to fudge around xAPIC bugs.
>   - It's actually quite realistic to effectively force the guest to use x2APIC,
>     at least if it's a Linux guest.  E.g. turn x2APIC on in BIOS, which is often
>     (always?) controlled by the host, and Linux will use x2APIC.
> 
> In other words, given that AVIC is well on its way to becoming a "legacy" feature,
> IMO there needs to be a fairly strong use case to justify taking on this much code
> and complexity.  ~1500 lines of code to support a feature that has historically
> been buggy _without_ nested support is going to require a non-trivial amount of
> effort to review, stabilize, and maintain.
> 
> [*] 1235 "Guest With AVIC (Advanced Virtual Interrupt Controller) Enabled May Fail
>     to Process IPI (Inter-Processor Interrupt) Until Guest Is Re-Scheduled" in
>     https://www.amd.com/system/files/TechDocs/56323-PUB_1.00.pdf
> 

I am afraid that you mixed things up:

You mistake is that x2avic is just a minor addition to AVIC. It is still for
all practical purposes the same feature.

 
1. The AVIC is indeed kind of broken on Zen2 (but AFAIK for all practical purposes,
   including nested it works fine, the errata only shows up in a unit test and/or
   under very specific workloads (most of the time a delayed wakeup doesn't cause a hang).
   Yet, I agree that for production Zen2 should not have AVIC enabled.
 

2. Zen3 does indeed have AVIC soft disabled in CPUID. AFAIK it works just fine,
   but I understand that customers won't use it against AMD's guidance.
 
 
3. On Zen4, AVIC is fully enabled and also extended to support x2apic mode.
   The fact that AVIC was extended to support X2apic mode also shows that AMD
   is committed to supporting it.
 
 
My nested AVIC code technically doesn't expose x2avic to the guest, but it
is pretty much trivial to add (I am only waiting to get my hands on Zen4 machine
to do it), and also even in its current form it would work just fine if the host
uses normal AVIC .
 
(or even doesn't use AVIC at all - the nested AVIC code works just fine
even if the host has its AVIC inhibited for some reason).
 
Adding nested x2avic support is literally about not passing through that MMIO address,
Enabling the x2avic bit in int_ctl, and opening up the access to x2apic msrs.
Plus I need to do some minor changes in unaccelerated IPI handler, dealing
With read-only logical ID and such.
 
Physid tables, apic backing pages, doorbell emulation, 
everything is pretty much unchanged.
 
So AVIC is nothing but a legacy feature, and my nested AVIC code will support
both nested AVIC and nested X2AVIC.
 
Best regards,
	Maxim Levitsky
 
 

