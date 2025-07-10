Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E872BB00777
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9BB10E918;
	Thu, 10 Jul 2025 15:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Smmq2eq8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABCF10E922
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bZxu+DQfctNogwYpaOLz3JI+YiDCl8GgvQ6csZ2gybM=; b=Smmq2eq8bLmDm8uRIhrsL1Iz+i
 KDfeleHWzqJbwBBqrzQw8bqxlDE3NNE+UH5P9hCLxdYEkm2uenfLix3GBBM5cJAi4xifIlZb5RGX4
 qp/6ggvpcg+pspjWyCcGZm9BFrgKIEc1rNSckMye0oibhVr8SyHjv2YuMS8Tur+gMoiVE/zGFR7ae
 OmutweWxlh7yvdVHcv16t6DNs7rWFQQTL2qoPAuTix1NsYkTQyXDetxhVA/kuXT3e2k5N/zKNFT1G
 ngUJqDsD5rORXZxA1Nwsl6POiRzriZcdONDtiC4Xv1vKvdr2+QDSwvw6B5vtbl+/DDdkOSSf8zx6I
 iSkVuDDg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uZtUI-00000009438-0aQX; Thu, 10 Jul 2025 15:47:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 05E1B30023C; Thu, 10 Jul 2025 17:47:05 +0200 (CEST)
Date: Thu, 10 Jul 2025 17:47:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
Message-ID: <20250710154704.GJ1613633@noisy.programming.kicks-ass.net>
References: <20250522233733.3176144-1-seanjc@google.com>
 <20250522233733.3176144-4-seanjc@google.com>
 <20250710112902.GCaG-j_l-K6LYRzZsb@fat_crate.local>
 <20250710143729.GL1613200@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710143729.GL1613200@noisy.programming.kicks-ass.net>
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

On Thu, Jul 10, 2025 at 04:37:29PM +0200, Peter Zijlstra wrote:
> On Thu, Jul 10, 2025 at 01:29:02PM +0200, Borislav Petkov wrote:
> > On Thu, May 22, 2025 at 04:37:27PM -0700, Sean Christopherson wrote:
> > > diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
> > > index 079c3f3cd32c..1789db5d8825 100644
> > > --- a/arch/x86/lib/cache-smp.c
> > > +++ b/arch/x86/lib/cache-smp.c
> > > @@ -19,3 +19,14 @@ void wbinvd_on_all_cpus(void)
> > >  	on_each_cpu(__wbinvd, NULL, 1);
> > >  }
> > >  EXPORT_SYMBOL(wbinvd_on_all_cpus);
> > > +
> > > +static void __wbnoinvd(void *dummy)
> > > +{
> > > +	wbnoinvd();
> > > +}
> > > +
> > > +void wbnoinvd_on_all_cpus(void)
> > > +{
> > > +	on_each_cpu(__wbnoinvd, NULL, 1);
> > > +}
> > > +EXPORT_SYMBOL(wbnoinvd_on_all_cpus);
> > 
> > If there's no particular reason for the non-GPL export besides being
> > consistent with the rest - yes, I did the change for wbinvd_on_all_cpus() but
> > that was loooong time ago - I'd simply make this export _GPL.
> 
> Uhhhh, how about we use this fancy export to known modules only thing
> for this?
> 
> These are typical things we do *NOT* want people to actually use.

So kvm-amd is the SEV stuff, AGPGART is the ancient crap nobody cares
about, CCP is more SEV stuff, DRM actually does CLFLUSH loops, but has a
WBINVD fallback. i915 is rude and actually does WBINVD. Could they
pretty please also do CLFLUSH loops?

Anyway, the below seems to survive an allmodconfig.

---
diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
index c5c60d07308c..ac3cc32a4054 100644
--- a/arch/x86/lib/cache-smp.c
+++ b/arch/x86/lib/cache-smp.c
@@ -12,19 +12,19 @@ void wbinvd_on_cpu(int cpu)
 {
 	smp_call_function_single(cpu, __wbinvd, NULL, 1);
 }
-EXPORT_SYMBOL(wbinvd_on_cpu);
+EXPORT_SYMBOL_GPL_FOR_MODULES(wbinvd_on_cpu, "kvm-amd,agpgart,ccp,drm,i915");
 
 void wbinvd_on_all_cpus(void)
 {
 	on_each_cpu(__wbinvd, NULL, 1);
 }
-EXPORT_SYMBOL(wbinvd_on_all_cpus);
+EXPORT_SYMBOL_GPL_FOR_MODULES(wbinvd_on_all_cpus, "kvm-amd,agpgart,ccp,drm,i915,intel-gtt");
 
 void wbinvd_on_cpus_mask(struct cpumask *cpus)
 {
 	on_each_cpu_mask(cpus, __wbinvd, NULL, 1);
 }
-EXPORT_SYMBOL_GPL(wbinvd_on_cpus_mask);
+EXPORT_SYMBOL_GPL_FOR_MODULES(wbinvd_on_cpus_mask, "kvm,kvm-amd,agpgart,ccp,drm,i915");
 
 static void __wbnoinvd(void *dummy)
 {
@@ -35,10 +35,10 @@ void wbnoinvd_on_all_cpus(void)
 {
 	on_each_cpu(__wbnoinvd, NULL, 1);
 }
-EXPORT_SYMBOL_GPL(wbnoinvd_on_all_cpus);
+EXPORT_SYMBOL_GPL_FOR_MODULES(wbnoinvd_on_all_cpus, "kvm-amd,agpgart,ccp,drm,i915");
 
 void wbnoinvd_on_cpus_mask(struct cpumask *cpus)
 {
 	on_each_cpu_mask(cpus, __wbnoinvd, NULL, 1);
 }
-EXPORT_SYMBOL_GPL(wbnoinvd_on_cpus_mask);
+EXPORT_SYMBOL_GPL_FOR_MODULES(wbnoinvd_on_cpus_mask, "kvm-amd,agpgart,ccp,drm,i915");
