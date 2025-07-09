Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA4AFF13D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 20:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7A610E07D;
	Wed,  9 Jul 2025 18:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="BwNv6N/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4C510E07D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 18:58:29 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 06ACC40E020E; 
 Wed,  9 Jul 2025 18:58:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 06aREvEx9Gc7; Wed,  9 Jul 2025 18:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1752087503; bh=/7kITGrxxjLtMgkq5/27X+rRYGn55l4yjCE06Pjnrqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BwNv6N/qjkKIJ6HDQTEpxV7E5hWbs5Ehe+QSBdIAwiRRiAohlDwldzkuZxUh+UOp8
 dZI8cmMC4bPp5zOCF37JnJ6JPmcJfSBcenSZmTg6bQ1juXYavz3iJxqIEDuRAXg9bw
 2DJTL4ePKECLnappcoUrBl3L+lKcaSuwGsNsReABWlM4eP2xvlNmnrtnVXv7OeoNYK
 swnSZp18HuQYUtJtVN3nkP6KAV1ZqlFYeyRthCZWR2GJ8aJVbPanA3yNv1+myxwfai
 lW5AgDBhLsYT4178klN9eMsDqEdjp2te+LkG59KfHJ/44Lvce7ZRHmG07+e5zW9vGt
 N4wDi89wCiYs3Zkbb0fd+EWEsTc7XN/W9HAPgJ715tiJvUcjdfkImGxEoOmoANiHYu
 4NFbkDzGqpSY34P2JMrdTiVmUNkjm901M6Wne8oxRFZCJ/Ta8KHZjpEAsRbVWXzi1B
 iKt0IpyhQop6D4pbBfcKvwiwDYroUIhPBfyFNh8/DfbpMgkBjkovIblUy6GjMgOgFS
 OmKqD9Apqk5PtQVpdAXjdfE0gt36gq9Ea9ybk67wGExV7c2Axc6e7wUti0Nn0KaNBb
 7bmNtUgkcX5C8K+ZvQ8jDPz2Ib2iuF2oMaLNw0cdxZE38yzEC7HW20DF/IGTLZFFjE
 gCJ03r8Fb6Hjn8YX6BbeueWw=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 545A040E01FD;
 Wed,  9 Jul 2025 18:58:02 +0000 (UTC)
Date: Wed, 9 Jul 2025 20:57:57 +0200
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
Subject: Re: [PATCH v3 0/8] x86, KVM: Optimize SEV cache flushing
Message-ID: <20250709185757.GDaG67tbGFYHUQxte2@fat_crate.local>
References: <20250522233733.3176144-1-seanjc@google.com>
 <aG6X__K8MvVYORkr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aG6X__K8MvVYORkr@google.com>
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

On Wed, Jul 09, 2025 at 09:25:35AM -0700, Sean Christopherson wrote:
> On Thu, May 22, 2025, Sean Christopherson wrote:
> > This is the combination of Kevin's WBNOINVD series[1] with Zheyun's targeted
> > flushing series[2].  The combined goal is to use WBNOINVD instead of WBINVD
> > when doing cached maintenance to prevent data corruption due to C-bit aliasing,
> > and to reduce the number of cache invalidations by only performing flushes on
> > CPUs that have entered the relevant VM since the last cache flush.
> > 
> > All of the non-KVM patches are frontloaded and based on v6.15-rc7, so that
> > they can go through the tip tree (in a stable branch, please :-) ).
> 
> Tip tree folks, any feedback/thoughts on this series (patches 1-4 in particular)?
> It'd be nice to get this into 6.17, and I'd really like land it by 6.18 at the
> latest.

I'll take a look tomorrow.

If I queue 1-4, would you like an immutable branch to merge for the other 4?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
