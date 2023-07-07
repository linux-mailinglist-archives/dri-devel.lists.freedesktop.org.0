Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB1074B1EF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EFF10E58D;
	Fri,  7 Jul 2023 13:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7B510E58D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688737227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eSLQOQX2Flx1G07KYazrMVvBAcWU6hFPEM6DlSyIig8=;
 b=MJOCo2vWXY4WPx2pyEPtRUfmTSoyL/MrhhTD4xNMRmUjceD3EISr2kBeKcs6T4JRVM/n87
 eI0Ysj6RyV16GbJJnI5prOYSsbPPZFrJW3xwkTj82JfACZdsAce6IkBQupsFrf6PhUnwB5
 Mdh2lhE67vBz54Ag0jq0Kc1JObrZBts=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-yK3ZaQ7ZMNST5byifwZZ5g-1; Fri, 07 Jul 2023 09:40:24 -0400
X-MC-Unique: yK3ZaQ7ZMNST5byifwZZ5g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31444df0fafso962163f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 06:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688737223; x=1691329223;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eSLQOQX2Flx1G07KYazrMVvBAcWU6hFPEM6DlSyIig8=;
 b=CbJz/COykbvsmkeHxSQzBljJ2Cr3KpcTQpuZEAWa3r3zw4XSmfKyoABwOfAkCy/62V
 nhXljLzzIJwlbPeODojSyJqs58ac8Xb9L2HsyyKJsso+gBtPkZrTNNsCd0fFdaqJ+FUc
 s/dw5V+xIfli+SsSRJCRT5a6DGW7tSu92MoGma110PL1nAPe0ku6ijOyxQeA/clf8xNB
 MiA4/xfsmt4WPdC2UMA7ZsuFFh9DVmZzOHjUCWV/U2ez8e9VULa4R8hstba/PCH5kNBh
 Jxc9b3lJuSII91UX2yLQs8M/A5iB0Uw+du+//dqON59ZVK1c9EhHz06O5ca74grOEflB
 0reg==
X-Gm-Message-State: ABy/qLbijGHgz+XsXmIQLZr0Dsn2yscygXo+aqOsI9mekzFi+I6vXpLF
 O7Iza5cVpeMnJz/PWaY2IsgOEGfb1GnBE80A7vUSbkCOLL91YQj5vFipot1S89YcpyAlevGQSP+
 F+U+5oSAgD3J4L+Oy0ZkxAquPCM5i
X-Received: by 2002:adf:fd84:0:b0:314:2c7a:d100 with SMTP id
 d4-20020adffd84000000b003142c7ad100mr3491320wrr.42.1688737223528; 
 Fri, 07 Jul 2023 06:40:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGembFVs9w4+Nx6kwExMzgs9gyKSxG86BN2Jn1gUhGo+dJC0cQ0C5x3R9/Olki3X8v+sW6RJQ==
X-Received: by 2002:adf:fd84:0:b0:314:2c7a:d100 with SMTP id
 d4-20020adffd84000000b003142c7ad100mr3491295wrr.42.1688737223237; 
 Fri, 07 Jul 2023 06:40:23 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x4-20020a5d60c4000000b003112ab916cdsm4482161wrt.73.2023.07.07.06.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 06:40:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/4] vgacon: rework screen_info #ifdef checks
In-Reply-To: <20230707095415.1449376-2-arnd@kernel.org>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
Date: Fri, 07 Jul 2023 15:40:22 +0200
Message-ID: <87jzvbyh4p.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> On non-x86 architectures, the screen_info variable is generally only
> used for the VGA console where supported, and in some cases the EFI
> framebuffer or vga16fb.
>
> Now that we have a definite list of which architectures actually use it
> for what, use consistent #ifdef checks so the global variable is only
> defined when it is actually used on those architectures.
>
> On powerpc, there is no support for vgacon, but there is support for
> vga16fb. Loongarch and riscv have no support for vgacon or vga16fb, but
> they support EFI firmware, so only that needs to be checked, and the
> initialization can be removed because that is handled by EFI.
> IA64 has both vgacon and EFI.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

[...]

> diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
> index 5a55ac82c13a4..0c09ff7fde46b 100644
> --- a/arch/ia64/kernel/setup.c
> +++ b/arch/ia64/kernel/setup.c
> @@ -86,9 +86,11 @@ EXPORT_SYMBOL(local_per_cpu_offset);
>  #endif
>  unsigned long ia64_cycles_per_usec;
>  struct ia64_boot_param *ia64_boot_param;
> +#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_EFI)
>  struct screen_info screen_info;

I think that only screen_info should be guarded by both symbols ?

>  unsigned long vga_console_iobase;

It seems this variable was never used since it was introduced by commit
66b7f8a30437 ("[IA64-SGI] pcdp: add PCDP pci interface support") ?

>  unsigned long vga_console_membase;

And this is only used by mdacon (not supported by ia64), vgacon and
vga16fb (not supported by ia64 either).

So this could just be guarded just by CONFIG_VGA_CONSOLE for ia64 ?

The rest of the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

