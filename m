Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ACE74BDD9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 16:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7DE10E02C;
	Sat,  8 Jul 2023 14:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1218 seconds by postgrey-1.36 at gabe;
 Sat, 08 Jul 2023 14:32:38 UTC
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3399D10E02C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 14:32:38 +0000 (UTC)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
 id 1qI8fN-00023x-00; Sat, 08 Jul 2023 16:12:05 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 11AC8C01C1; Sat,  8 Jul 2023 16:11:52 +0200 (CEST)
Date: Sat, 8 Jul 2023 16:11:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 2/4] vgacon: rework screen_info #ifdef checks
Message-ID: <ZKluqG2ZqKtAmnEG@alpha.franken.de>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707095415.1449376-2-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 11:52:24AM +0200, Arnd Bergmann wrote:
> diff --git a/arch/mips/jazz/setup.c b/arch/mips/jazz/setup.c
> index ee044261eb223..3c14548353e47 100644
> --- a/arch/mips/jazz/setup.c
> +++ b/arch/mips/jazz/setup.c
> @@ -76,7 +76,7 @@ void __init plat_mem_setup(void)
>  
>  	_machine_restart = jazz_machine_restart;
>  
> -#ifdef CONFIG_VT
> +#ifdef CONFIG_VGA_CONSOLE
>  	screen_info = (struct screen_info) {
>  		.orig_video_cols	= 160,
>  		.orig_video_lines	= 64,

that wssn't intended for VGA but for fbdev/g364fb, which doesn't use
it. So removing it is probably the best thing.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
