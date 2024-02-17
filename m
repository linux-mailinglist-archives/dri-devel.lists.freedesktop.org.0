Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D577858F34
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 12:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA21310E18E;
	Sat, 17 Feb 2024 11:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="rN5ApcSB";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="GiIaKHOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod3-cph3.one.com
 (mailrelay2-1.pub.mailoutpod3-cph3.one.com [46.30.211.241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0105010E18E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 11:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=s8NBM6Yqo1gTI6vq9QpVDRtoet1whN/tjqnSSJZJzHM=;
 b=rN5ApcSBnK+CskdQo37NDW3+7WtTo/WYPbcp2SmArSAYErNvCgXAjJIJZAEOdFc4QPihhuM2Kt0E/
 zabmz6EdgL3t/i5S8rEL4n+DO+FZ1FvGIMFYIqqU20v9QCNsuOoAFs6/of2pl3NunYKCUEoU3xqWbs
 7QShR9tVNbQSknHjSWir3uSumoQOSf7C7FCkfExt+dHY2Cm5m+nD9KexIWSliQeMOvlsCGqRIEegn0
 4Yr+kT4E1vKT22fgTTuW4Umy9JtRlAlSuY0Er5JNZ8o31pmoR6NUzOWE1C2xiH4lNG3h7qVoYMoWhn
 J2jjkFFTFPVigiIBwjJ7NKsn7g4IcuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=s8NBM6Yqo1gTI6vq9QpVDRtoet1whN/tjqnSSJZJzHM=;
 b=GiIaKHObvA0d5L31U76EfSviff6iTllpFtubh+MHM3A8ElYXJxKfv5DKoEjMgZwzMl8jaX2QXDx87
 ejjrFY8Cg==
X-HalOne-ID: ff4b2dc2-cd8b-11ee-9ac3-657348328a86
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id ff4b2dc2-cd8b-11ee-9ac3-657348328a86;
 Sat, 17 Feb 2024 11:59:28 +0000 (UTC)
Date: Sat, 17 Feb 2024 12:59:26 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Andreas Larsson <andreas@gaisler.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Arnd Bergmann <arnd@kernel.org>, Helge Deller <deller@gmx.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 17/27] sparc32: Drop run-time patching of ASI instructions
Message-ID: <20240217115926.GA1564615@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <20231219-sam-sparc32-sunset-v3-v1-17-64bb44b598c5@ravnborg.org>
 <d1a616f1-0fd2-4af0-8b89-e0d0a8842a6d@gaisler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1a616f1-0fd2-4af0-8b89-e0d0a8842a6d@gaisler.com>
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

Hi Andreas,

> > diff --git a/arch/sparc/include/asm/winmacro.h b/arch/sparc/include/asm/winmacro.h
> > index b6e911f5d93c..c496b04cdfaf 100644
> > --- a/arch/sparc/include/asm/winmacro.h
> > +++ b/arch/sparc/include/asm/winmacro.h
> > @@ -108,18 +108,11 @@
> >  661:	rd	%tbr, %idreg;				\
> >  	srl	%idreg, 10, %idreg;			\
> >  	and	%idreg, 0xc, %idreg;			\
> 
> These three lines, including the label, should also be removed as they
> are not for LEON. Additionally, I think it would be best to split out
> removing the cpuid instruction fixups to one patch and the MMU ASI
> instruction fixups to another patch.

Nice catch!
I will fix this and split up in two patches in v2.
It will take some days before I have v2 ready, and I will base it on top
of your for-next branch in the sparc.git tree.

	Sam

> 
> > -	.section	.cpuid_patch, "ax";		\
> > -	/* Instruction location. */			\
> > -	.word		661b;				\
> > -	/* SUN4D implementation. */			\
> > -	lda	 [%g0] ASI_M_VIKING_TMP1, %idreg;	\
> > -	sll	 %idreg, 2, %idreg;			\
> > -	nop;						\
> > -	/* LEON implementation. */			\
> > +							\
> >  	rd 	%asr17, %idreg;				\
> >  	srl	%idreg, 0x1c, %idreg;			\
> >  	sll	%idreg, 0x02, %idreg;			\
> > -	.previous;					\
> > +							\
> >  	sethi    %hi(current_set), %dest_reg; 		\
> >  	or       %dest_reg, %lo(current_set), %dest_reg;\
> >  	ld       [%idreg + %dest_reg], %dest_reg;
> > diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
> > index 0f2417ee3f95..9cf8f87e8c42 100644
> > --- a/arch/sparc/kernel/entry.S
> > +++ b/arch/sparc/kernel/entry.S
> 
> The hard_smp_processor_id function also needs to be reduced to just the
> LEON code. With the patching removed, SMP otherwise breaks with CPUs
> other than CPU 0 getting stuck.
> 
> Thanks,
> Andreas
