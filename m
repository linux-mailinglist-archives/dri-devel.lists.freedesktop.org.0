Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B87E8E52
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 05:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A34710E105;
	Sun, 12 Nov 2023 04:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3898888A27
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 04:22:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D6D5DB8092C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 04:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7FFC433D9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 04:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699762947;
 bh=FJL4JNEf9Nr1DoflQgnKi0tfP9lyYuVjCmmad2iv8TA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T9IHCfRSJCCiMNO/B2lnKhTDg7vzSLaSof7ydAGyTQokfwHc0UzVrA9vy+3S4mFHO
 Mpc/gtpML1wYUcpX2bPDBy9pPY5QgOuHgc/QzsPUa8mOygZ56/qPbpHlwwajazH46U
 1n3ZTA/MJFWE7HGwSGp8kR738Ey0K/PgQf5/mwzV91s5bTFFTjRfOkgcW5rDr+NefW
 70g/doUyhEQMNRVBFV9M32HHKhYl3CB4VPe3qN0mLdZDr/+kodq44fJDaQC3vcGEqX
 U3rqX7e9UEtc3XjfnoI7xoUubZMR0tX2Ciz3rIWEnZ55X4l4ocVhndGYJ7soDuUgJ2
 X1txJX8483BHg==
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2c504a5e1deso46134891fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 20:22:26 -0800 (PST)
X-Gm-Message-State: AOJu0YzjzLkLmBs68dRFBvrStyioWXQF71x6buWLWIGPMeRMqvkv/hg0
 WcsCAVkkMe74XLptjQKkcJx3zZ9BHgdH64JwfO8=
X-Google-Smtp-Source: AGHT+IGKtBb4zpepnAgJWTPQf4OFL8Yxg0IypTLD7L38xtqORdph/fQnU2/w9oi/MfemCZAy/+rZ76w/2ug+y+JaBNQ=
X-Received: by 2002:a05:6402:3d9:b0:53f:731a:e513 with SMTP id
 t25-20020a05640203d900b0053f731ae513mr2174574edw.25.1699762924720; Sat, 11
 Nov 2023 20:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-13-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-13-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 11 Nov 2023 23:21:53 -0500
X-Gmail-Original-Message-ID: <CAJF2gTSEziwKn+f6DfZXRuzW1SXaWraKL2HdXMRkEOGyuHq3MQ@mail.gmail.com>
Message-ID: <CAJF2gTSEziwKn+f6DfZXRuzW1SXaWraKL2HdXMRkEOGyuHq3MQ@mail.gmail.com>
Subject: Re: [PATCH 12/22] csky: fix arch_jump_label_transform_static override
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>,
 linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-bcachefs@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 linux-csky@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Andy Lutomirski <luto@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 8, 2023 at 8:02=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The arch_jump_label_transform_static() function in csky was originally me=
ant to
> override the generic __weak function, but that got changed to an #ifndef =
check.
>
> This showed up as a missing-prototype warning:
> arch/csky/kernel/jump_label.c:43:6: error: no previous prototype for 'arc=
h_jump_label_transform_static' [-Werror=3Dmissing-prototypes]
>
> Change the method to use the new method of having a #define and a prototy=
pe
> for the global function.
>
> Fixes: 7e6b9db27de9 ("jump_label: make initial NOP patching the special c=
ase")
> Fixes: 4e8bb4ba5a55 ("csky: Add jump-label implementation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/csky/include/asm/jump_label.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/csky/include/asm/jump_label.h b/arch/csky/include/asm/j=
ump_label.h
> index d488ba6084bc..98a3f4b168bd 100644
> --- a/arch/csky/include/asm/jump_label.h
> +++ b/arch/csky/include/asm/jump_label.h
> @@ -43,5 +43,10 @@ static __always_inline bool arch_static_branch_jump(st=
ruct static_key *key,
>         return true;
>  }
>
> +enum jump_label_type;
> +void arch_jump_label_transform_static(struct jump_entry *entry,
> +                                     enum jump_label_type type);
> +#define arch_jump_label_transform_static arch_jump_label_transform_stati=
c
> +
>  #endif  /* __ASSEMBLY__ */
>  #endif /* __ASM_CSKY_JUMP_LABEL_H */
> --
> 2.39.2
>
>
Thank you!
Reviewed-by: Guo Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
