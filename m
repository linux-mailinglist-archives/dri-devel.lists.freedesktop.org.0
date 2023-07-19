Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1230F7597F0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 16:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7454210E4AB;
	Wed, 19 Jul 2023 14:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7D610E4AB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689776232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YjdFQRNR08a24eSSE2jcx3RnjwPdI3D1UG9L8u3hsoE=;
 b=PBFPnKRHPfxRQZ0KnBfWne0Zv04tU/3OZCyU0RgD1VC9UbR+yX08xfJVl8HtR/B+XOEu/9
 iFK1u2pYF5WctsOUv3ROM54TF71ekjIpRqJkgktFXvzOk7b7+XvCdzzRwp6n+s5WqtJEKG
 DH1ZAnW3FDKZZQ8PIVwDlcTYATlp1Ao=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-i9JM9At1NkqRV142-cqt7Q-1; Wed, 19 Jul 2023 10:17:10 -0400
X-MC-Unique: i9JM9At1NkqRV142-cqt7Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fb416d7731so39412435e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689776229; x=1690381029;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YjdFQRNR08a24eSSE2jcx3RnjwPdI3D1UG9L8u3hsoE=;
 b=Bo9UDwdapGnIT5wMF5x5GmKWeu9aFJVOwIn1x+CQPk/z1tp559Ot0nGdJmJ2rmbz6p
 VwKWT34pWjtzr7A//p8UbquJCDpJm+HTZG02nxUANThEfNshJLMLBlZKiqO+IIBG2fp3
 eX+absBM1kM3DVInHWd9OxlQmGbD9a/3FKdCv49zB8vkfVU/q4/XrOq5ZCS1aUjyz0LW
 7yVqI6qe3JJO3tb+WgSZ8RZnWHs3UGtLx0YhtXzc+GI+d0MgkdsdBug1TB1IXB5n4jgE
 YuWZwwjz8LIY9dNaPLrtXVf2H3OV7Kme2WM74yeQv7zHZCpMaZzLu6wRkCcV2sjsK3HC
 c5Dw==
X-Gm-Message-State: ABy/qLZxRUYqMLRDQ5Fg8aPRWrAvmOL2ipTmQXXS67Jom+v0F7uOp0Uv
 BliPhkbFZ2a2EpYdG/WhHySfHbycegRoUGstlhN3BD/zoh2bBEOV8jMibclbntNfWfYLVG8MGc/
 lJnan3dEvjsnWXjtqp4QVTR9FEpPd
X-Received: by 2002:a05:600c:3651:b0:3fc:627:ea31 with SMTP id
 y17-20020a05600c365100b003fc0627ea31mr2123084wmq.38.1689776229113; 
 Wed, 19 Jul 2023 07:17:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHY6b0TgUW8MDG3POksnXdAxeQBRH+KD9U9aN090eyMWJPzhTreLBf0F2Av+qSumHgaL9gGUQ==
X-Received: by 2002:a05:600c:3651:b0:3fc:627:ea31 with SMTP id
 y17-20020a05600c365100b003fc0627ea31mr2123053wmq.38.1689776228833; 
 Wed, 19 Jul 2023 07:17:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h21-20020a1ccc15000000b003fbacc853ccsm1833816wmb.18.2023.07.19.07.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 07:17:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 6/9] vgacon: clean up global screen_info instances
In-Reply-To: <20230719123944.3438363-7-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-7-arnd@kernel.org>
Date: Wed, 19 Jul 2023 16:17:07 +0200
Message-ID: <87cz0ohtp8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Huacai Chen <chenhuacai@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> To prepare for completely separating the VGA console screen_info from
> the one used in EFI/sysfb, rename the vgacon instances and make them
> local as much as possible.
>
> ia64 and arm both have confurations with vgacon and efi, but the contents

is this a typo for configurations ?

> never overlaps because ia64 has no EFI framebuffer, and arm only has
> vga console on legacy platforms without EFI. Renaming these is required
> before the EFI screen_info can be moved into drivers/firmware.
>
> The ia64 vga console is actually registered in two places from
> setup_arch(), but one of them is wrong, so drop the one in pcdp.c and
> the fix the one in setup.c to use the correct conditional.
>

s/the fix the/fix the

> x86 has to keep them together, as the boot protocol is used to switch
> between VGA text console and framebuffer through the screen_info data.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Patch looks good to me, but I'm not that familiar with some of the arches
to give a proper reviewed-by.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

