Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47AFABD3A6
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 11:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358E810E441;
	Tue, 20 May 2025 09:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YocNn9Ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F16810E441
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 09:42:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A1B526116E;
 Tue, 20 May 2025 09:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E427AC4CEE9;
 Tue, 20 May 2025 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747734147;
 bh=P2lXjR5FEwM/E5SDxoI52GRNlN0blP98CFC+wmmNYJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YocNn9UiAuJhZnt6NBpkhkjIHqg4sjhhumWmN9LAPV5VjzZqPtfuDBox2I783H7Cc
 VqZh/z5vTj5uOmlYTVojQS3ezLzQcKcJTgAUtlXKLTn7CGKPqoUjd6rVHUb4sMrfUv
 chgHpeh6iEjJuGmZ+Ftd2hTpsplWI40BqnLOFYMiQg5dCPT6ASNlFFxqtXFGw2Hroz
 EPksLfrM9kUSfvilGCylSeQjD+ckre9RQguW6C0uYKYyF8CJHyUSNVC6wfFb5fEV3C
 Kcl/+gwqNOL0i0I2xAlJ01noW9P7ESOPGLuQin1R+3cYx1xywa+0BPsDMf7D093Hb6
 Mm402XHl0mhWg==
Date: Tue, 20 May 2025 11:42:20 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zheyun Shen <szy0127@sjtu.edu.cn>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kevin Loughlin <kevinloughlin@google.com>,
 Kai Huang <kai.huang@intel.com>, Mingwei Zhang <mizhang@google.com>
Subject: Re: [PATCH v2 7/8] x86, lib: Add wbinvd and wbnoinvd helpers to
 target multiple CPUs
Message-ID: <aCxOfFSSkHYm-rYS@gmail.com>
References: <20250516212833.2544737-1-seanjc@google.com>
 <20250516212833.2544737-8-seanjc@google.com>
 <aCg0Xc9fEB2Qn5Th@gmail.com> <aCtdnqqvIbHr-ed5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCtdnqqvIbHr-ed5@google.com>
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


* Sean Christopherson <seanjc@google.com> wrote:

> On Sat, May 17, 2025, Ingo Molnar wrote:
> > 
> > * Sean Christopherson <seanjc@google.com> wrote:
> > 
> > > From: Zheyun Shen <szy0127@sjtu.edu.cn>
> > > 
> > > Extract KVM's open-coded calls to do writeback caches on multiple CPUs to
> > > common library helpers for both WBINVD and WBNOINVD (KVM will use both).
> > > Put the onus on the caller to check for a non-empty mask to simplify the
> > > SMP=n implementation, e.g. so that it doesn't need to check that the one
> > > and only CPU in the system is present in the mask.
> > > 
> > > Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
> > > Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> > > Link: https://lore.kernel.org/r/20250128015345.7929-2-szy0127@sjtu.edu.cn
> > > [sean: move to lib, add SMP=n helpers, clarify usage]
> > > Acked-by: Kai Huang <kai.huang@intel.com>
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  arch/x86/include/asm/smp.h | 12 ++++++++++++
> > >  arch/x86/kvm/x86.c         |  8 +-------
> > >  arch/x86/lib/cache-smp.c   | 12 ++++++++++++
> > >  3 files changed, 25 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> > > index e08f1ae25401..fe98e021f7f8 100644
> > > --- a/arch/x86/include/asm/smp.h
> > > +++ b/arch/x86/include/asm/smp.h
> > > @@ -113,7 +113,9 @@ void native_play_dead(void);
> > >  void play_dead_common(void);
> > >  void wbinvd_on_cpu(int cpu);
> > >  void wbinvd_on_all_cpus(void);
> > > +void wbinvd_on_many_cpus(struct cpumask *cpus);
> > >  void wbnoinvd_on_all_cpus(void);
> > > +void wbnoinvd_on_many_cpus(struct cpumask *cpus);
> > 
> > Let's go with the _on_cpumask() suffix:
> > 
> >     void wbinvd_on_cpu(int cpu);
> >    +void wbinvd_on_cpumask(struct cpumask *cpus);
> >     void wbinvd_on_all_cpus(void);
> 
> How about wbinvd_on_cpus_mask(), to make it more obvious that it operates on
> multiple CPUs?  At a glance, wbinvd_on_cpumask() could be mistaken for a masked
> version of wbinvd_on_cpu().

Works for me!

Thanks,

	Ingo
