Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1CD8583F5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 18:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9B010E63D;
	Fri, 16 Feb 2024 17:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=gaisler.com header.i=@gaisler.com header.b="LvF0Ltoo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADC610E63D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 17:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp.simply.com (Simply.com) with ESMTP id 4Tbz561RHNz681Q;
 Fri, 16 Feb 2024 18:12:26 +0100 (CET)
Received: from [10.10.15.23] (h-98-128-223-123.NA.cust.bahnhof.se
 [98.128.223.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4Tbz4p2Grxz6809;
 Fri, 16 Feb 2024 18:12:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
 s=unoeuro; t=1708103546;
 bh=u+7m0ysgFtgrkmEJrdGpb8Y0tCuVXhfQeXNdhjpOpRg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=LvF0LtooPcEev2leFNAATsWRlCRiYxAr394TZe6xxrQk5VXnG8GBTyznzXodihQYD
 Re3Zm+zbYB5EoQJb/luHksSy6mmQhREXwvAwGPaK8l8eOib+DoTGuyeR2OYIeehkhy
 WUiK38+WhtZe9JyMy01b9fRPn2umDHWqIdScoqyw=
Message-ID: <d1a616f1-0fd2-4af0-8b89-e0d0a8842a6d@gaisler.com>
Date: Fri, 16 Feb 2024 18:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/27] sparc32: Drop run-time patching of ASI instructions
Content-Language: en-US
To: sam@ravnborg.org, "David S. Miller" <davem@davemloft.net>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <20231219-sam-sparc32-sunset-v3-v1-17-64bb44b598c5@ravnborg.org>
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-17-64bb44b598c5@ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 2023-12-19 23:03, Sam Ravnborg via B4 Relay wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> With only LEON supported there is no need to run-time patch
> the instructions to match ASI.
> 
> Move a few functions back to C with inline asm, now that
> run-time patching is not needed.
> 
> Deleted a few functions that turns out not to be used rather
> than re-implement them in C.
...
> diff --git a/arch/sparc/include/asm/sections.h b/arch/sparc/include/asm/sections.h
> index 08f833453ab3..e9d28148850b 100644
> --- a/arch/sparc/include/asm/sections.h
> +++ b/arch/sparc/include/asm/sections.h
> @@ -8,7 +8,4 @@
>  /* sparc entry point */
>  extern char _start[];
>  
> -extern char __leon_1insn_patch[];
> -extern char __leon_1insn_patch_end[];
> -
>  #endif
> diff --git a/arch/sparc/include/asm/winmacro.h b/arch/sparc/include/asm/winmacro.h
> index b6e911f5d93c..c496b04cdfaf 100644
> --- a/arch/sparc/include/asm/winmacro.h
> +++ b/arch/sparc/include/asm/winmacro.h
> @@ -108,18 +108,11 @@
>  661:	rd	%tbr, %idreg;				\
>  	srl	%idreg, 10, %idreg;			\
>  	and	%idreg, 0xc, %idreg;			\

These three lines, including the label, should also be removed as they
are not for LEON. Additionally, I think it would be best to split out
removing the cpuid instruction fixups to one patch and the MMU ASI
instruction fixups to another patch.

> -	.section	.cpuid_patch, "ax";		\
> -	/* Instruction location. */			\
> -	.word		661b;				\
> -	/* SUN4D implementation. */			\
> -	lda	 [%g0] ASI_M_VIKING_TMP1, %idreg;	\
> -	sll	 %idreg, 2, %idreg;			\
> -	nop;						\
> -	/* LEON implementation. */			\
> +							\
>  	rd 	%asr17, %idreg;				\
>  	srl	%idreg, 0x1c, %idreg;			\
>  	sll	%idreg, 0x02, %idreg;			\
> -	.previous;					\
> +							\
>  	sethi    %hi(current_set), %dest_reg; 		\
>  	or       %dest_reg, %lo(current_set), %dest_reg;\
>  	ld       [%idreg + %dest_reg], %dest_reg;
> diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
> index 0f2417ee3f95..9cf8f87e8c42 100644
> --- a/arch/sparc/kernel/entry.S
> +++ b/arch/sparc/kernel/entry.S

The hard_smp_processor_id function also needs to be reduced to just the
LEON code. With the patching removed, SMP otherwise breaks with CPUs
other than CPU 0 getting stuck.

Thanks,
Andreas
