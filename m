Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E5EB0008F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 13:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDB310E0C5;
	Thu, 10 Jul 2025 11:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="Gxx2HqAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DDF10E0C5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 11:29:35 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6369D40E020E; 
 Thu, 10 Jul 2025 11:29:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id A2zW3RKcDLpp; Thu, 10 Jul 2025 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1752146969; bh=rz8G5mq5LEqN6TYjqrNYUDOCAUTijX5k1pmbJpMz6Wo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gxx2HqAt2d7wKhrw8qlXYmeSAXd4/gkw6ItvVB03Muzq83pesnZBOdnMprWCPwYjG
 k1qNqreeCMZPLMvlku5bg0vHS6JPw1K/RcsAv6r7QV+LVYH/banXQ1/Y16aluIvtM6
 Z4ptd4CYVBDSX0l5TNYKaZUAD3RqKb98oW8ydzRLCujZhjLiDDlQgnI38UO5cYzih2
 qQEc9XoPyXo877fkwmIehL3nQLAVmYrBqpfILk8KAtNtUPSATeKmK53rwi4kGjOkQb
 YizHosSyl5WrCqmzxO2wk5FUU64gctO1lGcJXaAX5zU25vANQiM/hTdii11QBdKu8u
 enBHAoJF4MqUS26CNU5lKoZVNLRC2wmssH+KSS1frBS5a6GhTnpGblW4n2RR/VwhnN
 8WL+5MacS2wpFxXg0Y0OkAT9nCydML3orMjTV5rxmJYoT7zgDlZ14VSByU/E2YwvVe
 bWb/GlHW2r7Go8gU2Y5N4VJcumPFXCbOKyLJp++e9m5lyE+UjAR2IiTMmS/tJWWfLT
 xD5Zez9BWA5eQNUOfwgeC2o7rjnUoxEcTC+WKiynpeHRpLkFxDv74wiS7HuoKUA7O2
 OYXszMq9ZMg1t/sCUDsTzf+VddiNxtHp3NorcXff1rsF3je1SBOCsqgeirdXDeJ4tW
 heQxpPz7qMMsD8sr7S4nGtHM=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 79A2D40E0169;
 Thu, 10 Jul 2025 11:29:08 +0000 (UTC)
Date: Thu, 10 Jul 2025 13:29:02 +0200
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
Subject: Re: [PATCH v3 3/8] x86, lib: Add WBNOINVD helper functions
Message-ID: <20250710112902.GCaG-j_l-K6LYRzZsb@fat_crate.local>
References: <20250522233733.3176144-1-seanjc@google.com>
 <20250522233733.3176144-4-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522233733.3176144-4-seanjc@google.com>
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

On Thu, May 22, 2025 at 04:37:27PM -0700, Sean Christopherson wrote:
> diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
> index 079c3f3cd32c..1789db5d8825 100644
> --- a/arch/x86/lib/cache-smp.c
> +++ b/arch/x86/lib/cache-smp.c
> @@ -19,3 +19,14 @@ void wbinvd_on_all_cpus(void)
>  	on_each_cpu(__wbinvd, NULL, 1);
>  }
>  EXPORT_SYMBOL(wbinvd_on_all_cpus);
> +
> +static void __wbnoinvd(void *dummy)
> +{
> +	wbnoinvd();
> +}
> +
> +void wbnoinvd_on_all_cpus(void)
> +{
> +	on_each_cpu(__wbnoinvd, NULL, 1);
> +}
> +EXPORT_SYMBOL(wbnoinvd_on_all_cpus);

If there's no particular reason for the non-GPL export besides being
consistent with the rest - yes, I did the change for wbinvd_on_all_cpus() but
that was loooong time ago - I'd simply make this export _GPL.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
