Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74319759830
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 16:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0BD10E4B4;
	Wed, 19 Jul 2023 14:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4829010E4B4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689776713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xY+xsOpuPsAa6KICDwWDt2PoXyQ0u/vopB2mSitD/gY=;
 b=HrdNt90E1YUVvxqFM0oVK7sSJh1uSeBQbm63rkKSzFk/1PyJ2ouvJ3Zm8eFkoCvHrwzplg
 bpUjV2zl47c7o8oHm+9RV1MGdkBjuwTVQ7Rn7dJ/GMOgKFkiJHbuqsGU3y6fVTeARZAZW6
 YGvV8CHp6jPwxoXHpb4Yt3novqHyumg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-po34-dd_O8-mp-d2TcX86w-1; Wed, 19 Jul 2023 10:25:12 -0400
X-MC-Unique: po34-dd_O8-mp-d2TcX86w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-316f5d82bf4so2644045f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689776710; x=1690381510;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xY+xsOpuPsAa6KICDwWDt2PoXyQ0u/vopB2mSitD/gY=;
 b=PhPxbsNfrDVir5qlPLCMd8fuSGUU35oAxN3Jbhsoq5ftTD9xlH0hNIIrCCJqsCWXrH
 qmvgfhvDFO1yrN9eYGJQsA1ePfQ8wZbcK2+tx7B4LkzVYbyY97WnYUozv8sCkL5/2bHd
 KilbVmB3Ce4F2BvDkNBPbKvSaXvyfuaQNCrVlg79QQYus3n/KNKSeZoWlPdGKg0Pg8zE
 zWQaO4Gg8IpgULUZgQrdXZogw2vKS1/VTRW2M+OjoPWSUhEx/bQoqHiCNv3vHht8g4ww
 TWdIJFdl1ZTTvnDcgpXn3e/+lz69r8DdOxXaScPN+zNrYYG9fFtTP1n0lctDhRY5Scv/
 hZxA==
X-Gm-Message-State: ABy/qLaDjmcvT1Byw5KCMg1SjXK+ueVSJXKcp2H9VfEnolXUBSQ5phNC
 zcmPp7gYJ00WIFc1H7vJIrSCzDX0E1Ro5v+4wOfQGXUMlfh2vcVFdm63WXJEXUWQ2ACwfHV5Vx5
 ckz0lZ/He22f+X5f7ZFYN0Nu6Kigy
X-Received: by 2002:adf:f6d2:0:b0:315:a2a0:e331 with SMTP id
 y18-20020adff6d2000000b00315a2a0e331mr15859wrp.50.1689776710227; 
 Wed, 19 Jul 2023 07:25:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHdsBbmhlUZVwgJXnbSuIEfuMAzDx5IOvgnijOdvMDteAVkW8k0bDz3T8ek9eZvK84UcEFXkg==
X-Received: by 2002:adf:f6d2:0:b0:315:a2a0:e331 with SMTP id
 y18-20020adff6d2000000b00315a2a0e331mr15829wrp.50.1689776709888; 
 Wed, 19 Jul 2023 07:25:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003fc05b89e5bsm1805793wmj.34.2023.07.19.07.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 07:25:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 8/9] hyperv: avoid dependency on screen_info
In-Reply-To: <20230719123944.3438363-9-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-9-arnd@kernel.org>
Date: Wed, 19 Jul 2023 16:25:08 +0200
Message-ID: <877cqwhtbv.fsf@minerva.mail-host-address-is-not-set>
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
> The two hyperv framebuffer drivers (hyperv_fb or hyperv_drm_drv) access the
> global screen_info in order to take over from the sysfb framebuffer, which
> in turn could be handled by simplefb, simpledrm or efifb. Similarly, the
> vmbus_drv code marks the original EFI framebuffer as reserved, but this
> is not required if there is no sysfb.
>
> As a preparation for making screen_info itself more local to the sysfb
> helper code, add a compile-time conditional in all three files that relate
> to hyperv fb and just skip this code if there is no sysfb that needs to
> be unregistered.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

