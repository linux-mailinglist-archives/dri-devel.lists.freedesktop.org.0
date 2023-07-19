Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5B9759874
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 16:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41D610E07A;
	Wed, 19 Jul 2023 14:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0364E10E07A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689777338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GW017PQkbwcyBZVSjL1eIJ3Tr23afBwEJMZO/sY3MB8=;
 b=Bk+dk1mBEQJDTKuW9K8t8hp3CB+h01vAXtIZOhfUUaOwjhn9QZJr3CrmMjGOtTHDmM5KZW
 vSQUlLA10dA9WKF3pWrhH871D3hn+/HeD7aooccGEqHBD5haE3RVpCeBrHeqIAGuJObE5/
 sZCUoatdaCiRxEVTfL/SXBzjE87DKv8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-6FpXpiOyN2mTtm7ZdsjFUA-1; Wed, 19 Jul 2023 10:35:36 -0400
X-MC-Unique: 6FpXpiOyN2mTtm7ZdsjFUA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fc08d6a40cso39553655e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689777335; x=1690382135;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GW017PQkbwcyBZVSjL1eIJ3Tr23afBwEJMZO/sY3MB8=;
 b=dE76GvftekICemlqYHkD0eo/deb5ddCzXvjK+rHHT36haUxPX9nz+CwCQXYjmI8DNv
 K5shDaiVPWCNtVkE0sTzl2IzZvgjQrGATcl3NiN2BQy0AQp8kV1GR0WymqfsQUUMxD5O
 qTt2y07G3EwCKM27V58FA8a7WvYoJvyhVvhFyb79YD/MzEKDfzxNsimzBgk4mcWvyQaJ
 f67fwROIWYcXPBVMHdZ5IU/J6Le0W/fabrll136ZZWeQQhHjH2RuEolefpMubOVJDeBQ
 SY5+brD6zZlcMZoAWVprRVPO2ylLXctql2+aRy8eMcKMemIPPIfu/LuaTTE0L9QexOR3
 V6Lg==
X-Gm-Message-State: ABy/qLbIOR7euueeoS52UWSMr4EeZm3Sf0BhIv4Nr0BScPFZP4wxeEq8
 Q8yNcxys4QZwlsIHpmti+zv5ve2lw3op3AFaEZaWdL7RWWBOd+PmhM0PlZ2YA1Zh3YTFEaKg77r
 sqxRsyqRRgHCYadp/PNK52e/1QIfN
X-Received: by 2002:a05:600c:20f:b0:3fb:ab76:164b with SMTP id
 15-20020a05600c020f00b003fbab76164bmr2130589wmi.13.1689777335791; 
 Wed, 19 Jul 2023 07:35:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGyN6MTy8oRS46HP6DzRqXrb5z9b00oXqiEwJ+r7OovxVf1XP/FK2uW1HDXjbNqEtS7mD81iA==
X-Received: by 2002:a05:600c:20f:b0:3fb:ab76:164b with SMTP id
 15-20020a05600c020f00b003fbab76164bmr2130535wmi.13.1689777335451; 
 Wed, 19 Jul 2023 07:35:35 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u9-20020a7bc049000000b003fba6a0c881sm1798903wmc.43.2023.07.19.07.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 07:35:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 9/9] efi: move screen_info into efi init code
In-Reply-To: <20230719123944.3438363-10-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-10-arnd@kernel.org>
Date: Wed, 19 Jul 2023 16:35:34 +0200
Message-ID: <874jm0hsuh.fsf@minerva.mail-host-address-is-not-set>
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
> After the vga console no longer relies on global screen_info, there are
> only two remaining use cases:
>
>  - on the x86 architecture, it is used for multiple boot methods
>    (bzImage, EFI, Xen, kexec) to commicate the initial VGA or framebuffer

communicate

>    settings to a number of device drivers.
>
>  - on other architectures, it is only used as part of the EFI stub,
>    and only for the three sysfb framebuffers (simpledrm, simplefb, efifb).
>
> Remove the duplicate data structure definitions by moving it into the
> efi-init.c file that sets it up initially for the EFI case, leaving x86
> as an exception that retains its own definition for non-EFI boots.
>
> The added #ifdefs here are optional, I added them to further limit the
> reach of screen_info to configurations that have at least one of the
> users enabled.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

