Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0269EB016DA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 10:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA1C10E9D0;
	Fri, 11 Jul 2025 08:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="JkwZzsuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C44210E9D0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wYHoau81VTJVn1Ls5cS2yLxxY36G9E5eaFrXLtksm1g=; b=JkwZzsuFOvuPFHCMaGzXJWbtHA
 ZLdyO6+HWPsb3yj/IxWDVNKCVGWnO16CkAt3nf4I6dPqlS/xIaprl/Yu6szH3aaT1nUpkN1+RWKPh
 eip82Jjcq6Y6j6jBGY3wd/PsOpOVT4gzXoDyp8GHQec6duWSJoCfhhR0cSWKfChY5YsDjcTtfT1rq
 7qDhw8S1C8W4mN493ef9sCvKvShPkKbZeTpn+ATt/gNafhK4lvuchWEK/5PwFoxs0JD9AY9Yv8ZDV
 SZih5OCmWzbGhsyk77X2NBAfXLYT/7lyaZ6T7kGZ2IWtUG6vKWTjkumu2ECxHDjf1hjNBupXdtO3o
 AP008Fcg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1ua9UR-00000009EDX-3xTK; Fri, 11 Jul 2025 08:52:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7AC303001AA; Fri, 11 Jul 2025 10:52:19 +0200 (CEST)
Date: Fri, 11 Jul 2025 10:52:19 +0200
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
Message-ID: <20250711085219.GA3108775@noisy.programming.kicks-ass.net>
References: <20250522233733.3176144-1-seanjc@google.com>
 <20250522233733.3176144-4-seanjc@google.com>
 <20250710112902.GCaG-j_l-K6LYRzZsb@fat_crate.local>
 <20250710143729.GL1613200@noisy.programming.kicks-ass.net>
 <20250710154704.GJ1613633@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710154704.GJ1613633@noisy.programming.kicks-ass.net>
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

On Thu, Jul 10, 2025 at 05:47:05PM +0200, Peter Zijlstra wrote:

> So kvm-amd is the SEV stuff, AGPGART is the ancient crap nobody cares
> about, CCP is more SEV stuff, DRM actually does CLFLUSH loops, but has a
> WBINVD fallback. i915 is rude and actually does WBINVD. Could they
> pretty please also do CLFLUSH loops?

So having looked at i915 a little more:

drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:      * Currently we just do a heavy handed wbinvd_on_all_cpus() here since
drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:             wbinvd_on_all_cpus();

This one can be runtime; but is only applied on certain parts that might
be less than coherent -- hopefully not new parts, but who knows.

Parts not taking this path end up calling drm_clflush_sg(), which DTRT.


And these all look suspend/resume related, so we can live with them:

drivers/gpu/drm/i915/gem/i915_gem_pm.c:#define wbinvd_on_all_cpus() \
drivers/gpu/drm/i915/gem/i915_gem_pm.c:         wbinvd_on_all_cpus();
drivers/gpu/drm/i915/gem/i915_gem_pm.c: wbinvd_on_all_cpus();
drivers/gpu/drm/i915/gt/intel_ggtt.c:           wbinvd_on_all_cpus();

