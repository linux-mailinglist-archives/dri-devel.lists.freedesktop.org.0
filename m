Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1500B007E3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3966910E91B;
	Thu, 10 Jul 2025 15:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="vN9Ev23k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342C410E91B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VNSSl7zcfIOqJpK24zVMGGLJHAtlPxO/oNxdIpnF5F0=; b=vN9Ev23kcMljgdfRBvSifEtfjX
 f+yn1QegKA1zMOQFhhMX05TBc/Cl1PbBQ+tBZaoJ3FgLBNrymKgKoIt+r9efxT13D1A3kRXDTlNOq
 TGO/aR+sDKHjfuQpKOKWY29gtwL42lmfKR3p2dlBAtOFT1VrWeS9s/3P/iH6h+9ICouyx6XwzpAKW
 dMSIH9DO/sazRV3YP1LlsKnU8hp2ofhoTsV8X8zFevifZbuNSvkxWKxV96Vs3g/4M0O1OQqvSik/e
 LbOdXmQGoPnQP+pK7Nw/4HtFZmcWiE2U3+r3PmGpmguVQW6l1aprioMUd7XVvHkox9PfaX9cjFyWl
 foduRo6w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uZtfF-00000009VNm-28hO; Thu, 10 Jul 2025 15:58:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2247D300158; Thu, 10 Jul 2025 17:58:25 +0200 (CEST)
Date: Thu, 10 Jul 2025 17:58:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kevin Loughlin <kevinloughlin@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kai Huang <kai.huang@intel.com>, Ingo Molnar <mingo@kernel.org>,
 Zheyun Shen <szy0127@sjtu.edu.cn>, Mingwei Zhang <mizhang@google.com>,
 Francesco Lavra <francescolavra.fl@gmail.com>
Subject: Re: [PATCH v3 3/8] x86, lib: Add WBNOINVD helper functions
Message-ID: <20250710155824.GA905792@noisy.programming.kicks-ass.net>
References: <20250522233733.3176144-1-seanjc@google.com>
 <20250522233733.3176144-4-seanjc@google.com>
 <20250710112902.GCaG-j_l-K6LYRzZsb@fat_crate.local>
 <20250710143729.GL1613200@noisy.programming.kicks-ass.net>
 <20250710154704.GJ1613633@noisy.programming.kicks-ass.net>
 <aG_iVqMkeIUELiTX@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG_iVqMkeIUELiTX@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 10, 2025 at 08:55:02AM -0700, Sean Christopherson wrote:

> > So kvm-amd is the SEV stuff, AGPGART is the ancient crap nobody cares
> > about, CCP is more SEV stuff, DRM actually does CLFLUSH loops, but has a
> > WBINVD fallback. i915 is rude and actually does WBINVD. Could they
> > pretty please also do CLFLUSH loops?
> 
> FWIW, doing CLFLUSH in KVM isn't feasible.  In multiple flows, KVM doesn't have
> a valid virtual mapping, and hardware *requires* a WBINVD for at least one of the
> SEV paths.

Yeah, I know. We should give the hardware folks more grief about this
though. If we ever get into the situation of requiring WBINVD, they've
messed up.

> > Anyway, the below seems to survive an allmodconfig.
> > 
> > ---
> > diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
> > index c5c60d07308c..ac3cc32a4054 100644
> > --- a/arch/x86/lib/cache-smp.c
> > +++ b/arch/x86/lib/cache-smp.c
> > @@ -12,19 +12,19 @@ void wbinvd_on_cpu(int cpu)
> >  {
> >  	smp_call_function_single(cpu, __wbinvd, NULL, 1);
> >  }
> > -EXPORT_SYMBOL(wbinvd_on_cpu);
> > +EXPORT_SYMBOL_GPL_FOR_MODULES(wbinvd_on_cpu, "kvm-amd,agpgart,ccp,drm,i915");
> 
> Patch 5 of this series drops KVM's homebrewed version of WBINVD-on-CPU, so this
> one at least would need to export the symbol for "kvm" as well.

Ah, sure. At the same time, cpumask_of(cpu) is very cheap.


